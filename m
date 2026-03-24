Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C984F532F4
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 08:38:10 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15121.1774341473187954466
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 01:37:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=jaBbt7e9;
 spf=pass (domain: mvista.com, ip: 209.85.214.182, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2addb31945aso37909185ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 01:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1774341472; x=1774946272; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=737ixLE3QoW+7mhmWgKpmSkzMOT/RmMVVtkrUC6x3NA=;
        b=jaBbt7e9cnjtwB98N3h4RxKfalsys6afmtB8NOoODTcqqrhn+V/ICnpwpakF/QB+v1
         X11HzLh8gQk7lbjNzZ6by819XufA/99DwepzYGSiu4qO4l/x6O+uOUkM+gQ75rZKZVWu
         g1FwKZ4Xe6udtlBjgb2ttZTuMVANNFdZCOpvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774341472; x=1774946272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=737ixLE3QoW+7mhmWgKpmSkzMOT/RmMVVtkrUC6x3NA=;
        b=GAniC5EP/gz0CACf8q5MTHkQykAfRfNy9Ke1YUVAUDLqxX/uEZ7nIWFEXr21s/SJGT
         IbywqYIoltcsu/ZKWVA3qhMH+yQ6PM9a0bs62N53Sew73HPR7CH2L4S3BGyfKunno2kj
         So/h/Pf5YtpGwt6p9IFWo6idEcKwnZD9c8RFKKj866gXnY0HSrLwmgRUULO/kb41bVHc
         qeZnC8G6nVkrwbjEbYbIWSBOgZl5ZwZ5ZA41LF7+QXj+FPYMOoKOHTpZCuCVjYC7ZqGt
         koRov2DLVEGuyXgXTJdJYpG5rOpl+7uHxeYKghr/CxdRJfQoJk+JRqxIcBFpZ5lC2XrB
         gFoQ==
X-Gm-Message-State: AOJu0YwH6wO5evAzHrTKoTED7b4T+vIXNdyHqrz3AiHojp+z303qmHZ1
	mQwZ/4qmbPngap52NHVgKMlcflaUzZIcTpKwTiVNnum8yfe8j95AKEXoPUwCBi+Av8e7BzfispP
	rXrM4hs4=
X-Gm-Gg: ATEYQzzyPMkrRz0dDSgrq1iSQexBxzrjWmGKRUnmijLrjdgbjudq+sk1SeZ9BgtPnqx
	7oh2yF6Lr/q/CjPE/W3eoCq2Fcg/DNy75txt3ahPa6afm9ON47cP6UNWhlF6oxaJIqQ4uAU5hw3
	06//XA21/bbhMziqOl3wc10aRwCA83qE4ARD0ZF/3VD8n2I1TfmGaaLuYn+wt4Bxh5/pcUt79L7
	f6VobeW0GP7LZsMwfFzpvBHiN2Dhy0SRIuGcJMYRBf2VkyoKOAbOD1nLogk/uJMU7u8dIV/gOYv
	VKfvCMqPUWtF1Y9XYW7u1uMQkVXDqCbOoYieavV/5jb06Pu7ohetMOwfgs9/JGyukmES5XpDS92
	7zWjICCKl1QmXhyzb2lw5/zAUuHd14pc0d2tmlESA3kQ1oCruXjdpnrMINZWmOwbRLGyZLdmNeh
	yvp2OB22ujK23JzwHqBRZCr/Iw8f/qUxdaGQ91vTgSWhdKgl0=
X-Received: by 2002:a17:902:e74b:b0:2b0:5b4e:370c with SMTP id d9443c01a7336-2b082793bb0mr153027745ad.32.1774341471984;
        Tue, 24 Mar 2026 01:37:51 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:54:2bec:44f8:7beb:1879:ea0a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08354772fsm137304125ad.28.2026.03.24.01.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 01:37:51 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][kirkstone][PATCH] mariadb: Fix CVE-2025-13699
Date: Tue, 24 Mar 2026 14:07:41 +0530
Message-Id: <20260324083741.140909-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 08:38:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125548

From: Vijay Anusuri <vanusuri@mvista.com>

Pick commits according to [1]

[1] https://jira.mariadb.org/browse/MDEV-37483
[2] https://security-tracker.debian.org/tracker/CVE-2025-13837

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |   2 +
 .../mysql/mariadb/CVE-2025-13699-1.patch      |  90 +++++++++
 .../mysql/mariadb/CVE-2025-13699-2.patch      | 173 ++++++++++++++++++
 3 files changed, 265 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/CVE-2025-13699-1.patch
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/CVE-2025-13699-2.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index d15b19725a..6ad19a15dc 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -36,6 +36,8 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
 	   file://CVE-2025-21490.patch \
 	   file://CVE-2025-30722.patch \
 	   file://CVE-2025-30693.patch \
+	   file://CVE-2025-13699-1.patch \
+	   file://CVE-2025-13699-2.patch \
           "
 SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/CVE-2025-13699-1.patch b/meta-oe/recipes-dbs/mysql/mariadb/CVE-2025-13699-1.patch
new file mode 100644
index 0000000000..bf526ddfac
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/CVE-2025-13699-1.patch
@@ -0,0 +1,90 @@
+From 75b000372b6d2e2dcabb280ff5f3f1e48f994ca8 Mon Sep 17 00:00:00 2001
+From: Sergei Golubchik <serg@mariadb.org>
+Date: Fri, 22 Aug 2025 13:21:57 +0200
+Subject: [PATCH] cleanup: reusable build_path_for_table() function
+
+Upstream-Status: Backport [https://github.com/MariaDB/server/commit/75b000372b6d2e2dcabb280ff5f3f1e48f994ca8]
+CVE: CVE-2025-13699 #Dependency Patch
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ client/mysqldump.c   | 31 ++++++++++++++++---------------
+ client/mysqlimport.c |  2 +-
+ 2 files changed, 17 insertions(+), 16 deletions(-)
+
+diff --git a/client/mysqldump.c b/client/mysqldump.c
+index 19a2a8109e4ed..3cff3d94b67b9 100644
+--- a/client/mysqldump.c
++++ b/client/mysqldump.c
+@@ -1837,6 +1837,17 @@ static char *cover_definer_clause(const char *stmt_str,
+   return query_str;
+ }
+ 
++
++static const char* build_path_for_table(char *to, const char *dir,
++                                        const char *table, const char *ext)
++{
++  char tmp_path[FN_REFLEN];
++  convert_dirname(tmp_path, path, NULL);
++  my_load_path(tmp_path, tmp_path, NULL);
++  return fn_format(to, table, tmp_path, ext, MYF(MY_UNPACK_FILENAME));
++}
++
++
+ /*
+   Open a new .sql file to dump the table or view into
+ 
+@@ -1851,12 +1862,9 @@ static char *cover_definer_clause(const char *stmt_str,
+ */
+ static FILE* open_sql_file_for_table(const char* table, int flags)
+ {
+-  FILE* res;
+-  char filename[FN_REFLEN], tmp_path[FN_REFLEN];
+-  convert_dirname(tmp_path,path,NullS);
+-  res= my_fopen(fn_format(filename, table, tmp_path, ".sql", 4),
+-                flags, MYF(MY_WME));
+-  return res;
++  char filename[FN_REFLEN];
++  return my_fopen(build_path_for_table(filename, path, table, ".sql"),
++                  flags, MYF(MY_WME));
+ }
+ 
+ 
+@@ -4043,15 +4051,9 @@ static void dump_table(const char *table, const char *db, const uchar *hash_key,
+ 
+   if (path)
+   {
+-    char filename[FN_REFLEN], tmp_path[FN_REFLEN];
++    char filename[FN_REFLEN];
+ 
+-    /*
+-      Convert the path to native os format
+-      and resolve to the full filepath.
+-    */
+-    convert_dirname(tmp_path,path,NullS);    
+-    my_load_path(tmp_path, tmp_path, NULL);
+-    fn_format(filename, table, tmp_path, ".txt", MYF(MY_UNPACK_FILENAME));
++    build_path_for_table(filename, path, table, ".txt");
+ 
+     /* Must delete the file that 'INTO OUTFILE' will write to */
+     my_delete(filename, MYF(0));
+@@ -4060,7 +4062,6 @@ static void dump_table(const char *table, const char *db, const uchar *hash_key,
+     to_unix_path(filename);
+ 
+     /* now build the query string */
+-
+     dynstr_append_checked(&query_string, "SELECT /*!40001 SQL_NO_CACHE */ ");
+     dynstr_append_checked(&query_string, select_field_names.str);
+     dynstr_append_checked(&query_string, " INTO OUTFILE '");
+diff --git a/client/mysqlimport.c b/client/mysqlimport.c
+index 5682df1166850..736d8ba81e4db 100644
+--- a/client/mysqlimport.c
++++ b/client/mysqlimport.c
+@@ -339,7 +339,7 @@ static int write_to_table(char *filename, MYSQL *mysql)
+   DBUG_ENTER("write_to_table");
+   DBUG_PRINT("enter",("filename: %s",filename));
+ 
+-  fn_format(tablename, filename, "", "", 1 | 2); /* removes path & ext. */
++  fn_format(tablename, filename, "", "", MYF(MY_REPLACE_DIR | MY_REPLACE_EXT));
+   if (!opt_local_file)
+     strmov(hard_path,filename);
+   else
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/CVE-2025-13699-2.patch b/meta-oe/recipes-dbs/mysql/mariadb/CVE-2025-13699-2.patch
new file mode 100644
index 0000000000..271613682e
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/CVE-2025-13699-2.patch
@@ -0,0 +1,173 @@
+From ff12ec86a5898a5a4a4eeb77be26ecbd711b3128 Mon Sep 17 00:00:00 2001
+From: Sergei Golubchik <serg@mariadb.org>
+Date: Sat, 23 Aug 2025 09:11:42 +0200
+Subject: [PATCH] MDEV-37483 mariadb-dump -T doesn't convert table names
+
+use my_charset_filename to build file names from table names.
+this guarantees that file name will be always valid for any
+table name, no matter what characters it contains and what file name
+rules local filesystem has.
+
+mariadb-import now converts back, if possible.
+
+Upstream-Status: Backport [https://github.com/MariaDB/server/commit/ff12ec86a5898a5a4a4eeb77be26ecbd711b312]
+CVE: CVE-2025-13699
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ client/mysqldump.c               | 13 +++++++--
+ client/mysqlimport.c             | 10 +++++++
+ mysql-test/main/mysqldump.result | 46 ++++++++++++++++++++++++++++++++
+ mysql-test/main/mysqldump.test   | 42 +++++++++++++++++++++++++++++
+ 4 files changed, 109 insertions(+), 2 deletions(-)
+
+diff --git a/client/mysqldump.c b/client/mysqldump.c
+index 3cff3d94b67b9..7372498ffebff 100644
+--- a/client/mysqldump.c
++++ b/client/mysqldump.c
+@@ -1841,10 +1841,19 @@ static char *cover_definer_clause(const char *stmt_str,
+ static const char* build_path_for_table(char *to, const char *dir,
+                                         const char *table, const char *ext)
+ {
+-  char tmp_path[FN_REFLEN];
++  char filename[FN_REFLEN], tmp_path[FN_REFLEN];
+   convert_dirname(tmp_path, path, NULL);
+   my_load_path(tmp_path, tmp_path, NULL);
+-  return fn_format(to, table, tmp_path, ext, MYF(MY_UNPACK_FILENAME));
++  if (check_if_legal_tablename(table))
++    strxnmov(filename, sizeof(filename) - 1, table, "@@@", NULL);
++  else
++  {
++    uint errors, len;
++    len= my_convert(filename, sizeof(filename) - 1, &my_charset_filename,
++                    table, (uint32)strlen(table), charset_info, &errors);
++    filename[len]= 0;
++  }
++  return fn_format(to, filename, tmp_path, ext, MYF(MY_UNPACK_FILENAME));
+ }
+ 
+ 
+diff --git a/client/mysqlimport.c b/client/mysqlimport.c
+index 736d8ba81e4db..4d826742a8dca 100644
+--- a/client/mysqlimport.c
++++ b/client/mysqlimport.c
+@@ -340,6 +340,16 @@ static int write_to_table(char *filename, MYSQL *mysql)
+   DBUG_PRINT("enter",("filename: %s",filename));
+ 
+   fn_format(tablename, filename, "", "", MYF(MY_REPLACE_DIR | MY_REPLACE_EXT));
++  if (strchr(tablename, '@'))
++  {
++    uint errors, len;
++    const char *csname= my_default_csname(); /* see MYSQL_SET_CHARSET_NAME */
++    CHARSET_INFO *cs= get_charset_by_csname(csname,  MY_CS_PRIMARY, MYF(0));
++    len= my_convert(escaped_name, sizeof(escaped_name) - 1, cs, tablename,
++                    (uint32)strlen(tablename), &my_charset_filename, &errors);
++    if (!errors)
++      strmake(tablename, escaped_name, len);
++  }
+   if (!opt_local_file)
+     strmov(hard_path,filename);
+   else
+diff --git a/mysql-test/main/mysqldump.result b/mysql-test/main/mysqldump.result
+index 7cf8a40b5c805..dd70c664d6116 100644
+--- a/mysql-test/main/mysqldump.result
++++ b/mysql-test/main/mysqldump.result
+@@ -6624,3 +6624,49 @@ SET character_set_client = @saved_cs_client;
+ drop view `v'1"2`;
+ drop table t1;
+ # End of 10.5 tests
++#
++# MDEV-37483 mariadb-dump -T doesn't convert table names
++#
++set names latin1;
++create database foo;
++use foo;
++create table `con_sch�ne_gr��e` (a int) select 1 as a;
++create table `con` (b int) select 2 as b;
++create table `con/bar` (c int) select 3 as c;
++create table `con@home` (d int) select 4 as d;
++drop database foo;
++use test;
++con@002fbar.sql
++con@002fbar.txt
++con@@@.sql
++con@@@.txt
++con@home.sql
++con@home.txt
++con_sch@1ine_gr@1o@1je.sql
++con_sch@1ine_gr@1o@1je.txt
++show tables;
++Tables_in_test
++con
++con/bar
++con@home
++con_sch�ne_gr��e
++test.con: Records: 1  Deleted: 0  Skipped: 0  Warnings: 0
++test.con/bar: Records: 1  Deleted: 0  Skipped: 0  Warnings: 0
++test.con@home: Records: 1  Deleted: 0  Skipped: 0  Warnings: 0
++select * from `con_sch�ne_gr��e`;
++a
++1
++select * from `con`;
++b
++2
++select * from `con/bar`;
++c
++3
++select * from `con@home`;
++d
++4
++drop table `con_sch�ne_gr��e`;
++drop table `con`;
++drop table `con/bar`;
++drop table `con@home`;
++# End of 10.6 tests
+diff --git a/mysql-test/main/mysqldump.test b/mysql-test/main/mysqldump.test
+index 6ffe3a8af419b..971e7f29fa806 100644
+--- a/mysql-test/main/mysqldump.test
++++ b/mysql-test/main/mysqldump.test
+@@ -3035,3 +3035,45 @@ drop view `v'1"2`; # "'
+ drop table t1;
+ 
+ --echo # End of 10.5 tests
++
++--echo #
++--echo # MDEV-37483 mariadb-dump -T doesn't convert table names
++--echo #
++set names latin1;
++create database foo;
++use foo;
++
++create table `con_sch�ne_gr��e` (a int) select 1 as a;
++create table `con` (b int) select 2 as b;
++create table `con/bar` (c int) select 3 as c;
++create table `con@home` (d int) select 4 as d;
++exec $MYSQL_DUMP foo --tab $MYSQLTEST_VARDIR/tmp;
++drop database foo;
++use test;
++move_file $MYSQLTEST_VARDIR/tmp/con@0040home.sql $MYSQLTEST_VARDIR/tmp/con@home.sql;
++move_file $MYSQLTEST_VARDIR/tmp/con@0040home.txt $MYSQLTEST_VARDIR/tmp/con@home.txt;
++list_files $MYSQLTEST_VARDIR/tmp con*;
++exec $MYSQL test < $MYSQLTEST_VARDIR/tmp/con@@@.sql;
++exec $MYSQL test < $MYSQLTEST_VARDIR/tmp/con@002fbar.sql;
++exec $MYSQL test < $MYSQLTEST_VARDIR/tmp/con_sch@1ine_gr@1o@1je.sql;
++exec $MYSQL test < $MYSQLTEST_VARDIR/tmp/con@home.sql;
++show tables;
++exec $MYSQL_IMPORT test $MYSQLTEST_VARDIR/tmp/con@@@.txt;
++exec $MYSQL_IMPORT test $MYSQLTEST_VARDIR/tmp/con@002fbar.txt;
++if (`select @@version like '10.6.%'`) {
++# utf8 console output on Windows is fixed in MDEV-26713, until then
++--disable_result_log
++}
++exec $MYSQL_IMPORT test $MYSQLTEST_VARDIR/tmp/con_sch@1ine_gr@1o@1je.txt;
++--enable_result_log
++exec $MYSQL_IMPORT test $MYSQLTEST_VARDIR/tmp/con@home.txt;
++select * from `con_sch�ne_gr��e`;
++select * from `con`;
++select * from `con/bar`;
++select * from `con@home`;
++drop table `con_sch�ne_gr��e`;
++drop table `con`;
++drop table `con/bar`;
++drop table `con@home`;
++
++--echo # End of 10.6 tests
-- 
2.25.1


