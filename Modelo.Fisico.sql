/*cria o banco de dados*/
create database db_supermercado_vencedor;
use db_supermercado_vencedor;




/*cria uma tabela chamada cliente */
create table tbl_cliente(
   id_cliente int not null primary key auto_increment,
   nome varchar(100) not null,
   cpf varchar(11) not null,
   codigo_cliente varchar(15) not null,
   unique index(id_cliente)
);

/*cria uma tabela chamada estoque */
create table tbl_estoque(
   id_estoque int not null primary key auto_increment,
   produto varchar(45) not null,
   data_atualizacao date not null,
   quant_estoque int not null,
   unique index(id_estoque)
); 

/*cria uma tabela chamada fornecedor */
create table tbl_fornecedor(
   id_fornecedor int not null primary key auto_increment,
   nome varchar(100) not null,
   unique index(id_fornecedor)
   
);
tbl_contato_fornecedortbl_email_clientetbl_contato_fornecedortbl_email_cliente
/* cria uma tabela para endereço do cliente */
create table tbl_endereco_cliente (
  id_endereco_cliente int not null primary key AUTO_INCREMENT,
  logradouro varchar(50) not null,
  cep varchar(8) not null,
  bairro varchar(45) not null,
  numero varchar(10) not null,
  cidade varchar(100) not null,
  estado varchar(100) not null,
  id_cliente int not null,
  

  /* cria o relacionamento entre as tabelas */
  constraint FK_Cliente_Endereco_Cliente
  foreign key (id_cliente)
  references tbl_cliente(id),
  Unique index(id_endereco_cliente)
  
  
);

/*cria uma tabela chamada e-mail cliente */
create table tbl_email_cliente(
   id_email int not null primary key auto_increment,
   email varchar(255) not null,
   id_cliente int not null,
   
   /*define uma restrição de chave estrangeira */
   constraint FK_Cliente_Email_Cliente
   foreign key (id_cliente)
   references tbl_cliente(id)
   on delete cascade   /*apaga os registros desta tbl quando forem apagados na tabela pai*/  
   
 );

/*cria uma tabela chamada telefone do cliente */
create table tbl_telefone_cliente(
   id_telefone int not null primary key auto_increment,
   numero_telefone varchar(15) not null,
   id_cliente int not null,
   
    /*define uma restrição de chave estrangeira */
   constraint fk_cliente_telefone_cliente
   foreign key (id_cliente)
   references tbl_cliente(id)
   on delete cascade   /*apaga os registros desta tbl quando forem apagados na tabela pai*/  

 );


/*cria uma tabela para o contato do forncedor */
create table tbl_contato_fornecedor(
   id_contato int not null primary key auto_increment,
   contato varchar(45) not null,
   id_fornecedor int not null,
   
    /*define uma restrição de chave estrangeira */
   constraint fk_fornecedor_contato_fornecedor
   foreign key (id_fornecedor)
   references tbl_fornecedor(id)
   
   
);


/*cria uma tabela para e-mail do fornecedor */
create table tbl_email_fornecedor(
   id_email int not null primary key auto_increment,
   email varchar(255) not null,
   id_fornecedor int not null,
   
   /*define uma restrição de chave estrangeira */
   constraint fk_fornecedor_email_fornecedor
   foreign key (id_fornecedor)
   references tbl_fornecedor(id)
   
);

/*cria uma tabela para endereço do fornecedor */
create table tbl_endereco_fornecedor(
   id_endereco int not null primary key auto_increment,
   logradouro varchar(100) not null,
   numero varchar(45) not null,
   bairro varchar(100) not null,
   cep varchar(45) not null,
   cidade varchar(100) not null,
   estado varchar(100) not null,
   pais varchar(100) not null,
   id_fornecedor int not null,
   
   /*define uma restrição de chave estrangeira */
   constraint fk_fornecedor_endereco_fornecedor
   foreign key (id_fornecedor)
   references tbl_fornecedor(id)
   on delete cascade   /*apaga os registros desta tbl quando forem apagados na tabela pai*/  
   
);

/* cria uma tabela chamada vendas */
create table tbl_vendas(
   id_vendas int not null primary key auto_increment,
   numero_pedido int not null,
   quant_vendida int not null,
   produto_comprado varchar(60) not null,
   data_venda date not null, 
   nome_cliente varchar(45) not null,
   valor_total float not null,
   id_cliente int not null,
   
    /*define uma restrição de chave estrangeira */
   constraint fk_cliente_vendas
   foreign key (id_cliente)
   references tbl_cliente(id)
   
);
 
 /*cria uma tabela chamada produtos */
 create table tbl_produtos(
   id_produtos int not null primary key auto_increment,
   nome_produto varchar(100) not null,
   categoria varchar(45) not null,
   quant_estoque int not null,
   fornecedor varchar(45) not null,
   preco_custo float not null,
   preco_venda float not null,
   descricao varchar(100) not null,
   id_estoque int not null,
   
    /*define uma restrição de chave estrangeira */
   constraint fk_estoque_produtos
   foreign key (id_estoque)
   references tbl_estoque(id)
   
   
);

/*cria uma tabela chamada itens da venda */
create table tbl_itens_da_venda(
   id_itens_venda int not null primary key auto_increment,
   itens varchar(100) not null,
   id_vendas int not null,
   id_produtos int not null,
   
    /*define uma restrição de chave estrangeira */
   constraint fk_vendas_itens_da_venda
   foreign key (id_vendas)
   references tbl_vendas.id,
   
   constraint fk_produtos_itens_da_venda
   foreign key (id_produtos)
   references tbl_produtos(id)
   
   
);

/*cria uma tabela chamada colaborador */ 
create table tbl_colaborador(
   id_colaborador int not null primary key auto_increment,
   nome varchar(45) not null,
   cod_colaborador int not null,
   data_admissao date not null,
   funcao varchar(45) not null,
   remuneracao float not null,
   id_vendas int not null,
  
  /*define uma restrição de chave estrangeira */
    constraint fk_vendas_colaborador
    foreign key (id_vendas)
    references tbl_vendas(id)
    on delete cascade   /*apaga os registros desta tbl quando forem apagados na tabela pai*/  
    
);