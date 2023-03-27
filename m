Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B719C761A6
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 12:50:19 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.33861.1679921415730855636
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Mar 2023 05:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=aD5yn2ew;
 spf=pass (domain: mvista.com, ip: 209.85.214.180, mailfrom: vkumbhar@mvista.com)
Received: by mail-pl1-f180.google.com with SMTP id ix20so8332115plb.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 05:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1679921415;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IoXUumpsUhDTFks9CL8no1Pj8+6H+URc+jOPyJyw5k0=;
        b=aD5yn2ewX0LzuKh6LmNNaqqMSmAskVvQhU+gjcM4WTkNr4C5LA5iKLwV7Jelf13fZz
         r0dQ8T2ju7/k86bMnQmsP8EaA4UFDb6S2mHjgJJ5ZxZBHuzYif5st5phnKLnbUdBlqd5
         urNVAlBkCVJjgMGWVZzWuVSVagzD1tDhOOvNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679921415;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IoXUumpsUhDTFks9CL8no1Pj8+6H+URc+jOPyJyw5k0=;
        b=1MbccJNaEYr89zSiBQW0e63BX48O9gfEBe1OGkVMzbZCXNOex2CHFmWyBfQKdZy+8c
         nNL5WdIob6Rf9HdX9tObtaQCQr/wqtBm6BK8tiItiGIryVO9b7UhCbfPtBgQ1vl9AuDN
         7d+FAxGNchWGTF3Rvlne90Y8zgRAv3eUxs+syJW+GzvzJ4G1FgNjoJU5mDESNGLzk+gB
         9a5vIWZNuL79deELTKBTZi7xeycrs52ysQQsuYHo/BCP1F9yunD4gHhCjL5KcZiCbA94
         N7n0ZiiZaxrkA0AqV2NNDl5yI//6MZOkWqfAhF8/qcg124HjVlaJ6Zx54y6tFS5RpDbI
         ZvJw==
X-Gm-Message-State: AO0yUKVBREdVtdB3xuczF7eZyU8vOcKee76qA5mbaVeYcDWvB8OGGY5v
	dSvIQ8Sp1TBEo4BeGjVkCcOEWkwjzreGWU3t+n4=
X-Google-Smtp-Source: AK7set8tiGsC0/c/cH91GmUtHQ/e43Gjt7eYdfuQ8kbFgM1SfZ1yh79oU69VL7DG4ANwb9JCw1OeXA==
X-Received: by 2002:a05:6a20:b26:b0:d8:d3b4:4912 with SMTP id x38-20020a056a200b2600b000d8d3b44912mr9345802pzf.9.1679921414649;
        Mon, 27 Mar 2023 05:50:14 -0700 (PDT)
Received: from vkumbhar-Latitude-3400.mvista.com ([203.212.220.124])
        by smtp.gmail.com with ESMTPSA id c3-20020aa78e03000000b00593c1c5bd0esm15391562pfr.164.2023.03.27.05.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 05:50:14 -0700 (PDT)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [meta-oe][dunfell][PATCH] mariadb: fix CVE-2022-47015 NULL pointer dereference in spider_db_mbase::print_warnings()
Date: Mon, 27 Mar 2023 18:20:03 +0530
Message-Id: <20230327125003.33461-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.18.2
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 12:50:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101783

The function spider_db_mbase::print_warnings() can potentially result
in a null pointer dereference.

Remove the null pointer dereference by cleaning up the function.

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |   1 +
 .../mysql/mariadb/CVE-2022-47015.patch        | 269 ++++++++++++++++++
 2 files changed, 270 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/CVE-2022-47015.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 565f4d5613..e052c7691e 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -16,6 +16,7 @@ SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
            file://sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch \
            file://0001-disable-ucontext-on-musl.patch \
            file://fix-arm-atomic.patch \
+           file://CVE-2022-47015.patch \
           "
 
 SRC_URI[sha256sum] = "ff963c4e11bc06b775f66f2b1ddef184996208fb4b23cfdb50d95fb02eaa7ef8"
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/CVE-2022-47015.patch b/meta-oe/recipes-dbs/mysql/mariadb/CVE-2022-47015.patch
new file mode 100644
index 0000000000..0ddcdc028c
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/CVE-2022-47015.patch
@@ -0,0 +1,269 @@
+From be0a46b3d52b58956fd0d47d040b9f4514406954 Mon Sep 17 00:00:00 2001
+From: Nayuta Yanagisawa <nayuta.yanagisawa@hey.com>
+Date: Tue, 27 Sep 2022 15:22:57 +0900
+Subject: [PATCH] MDEV-29644 a potential bug of null pointer dereference in
+ spider_db_mbase::print_warnings()
+
+Upstream-Status: Backport [https://github.com/MariaDB/server/commit/be0a46b3d52b58956fd0d47d040b9f4514406954]
+CVE: CVE-2022-47015
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ .../spider/bugfix/r/mdev_29644.result         | 44 ++++++++++
+ .../mysql-test/spider/bugfix/t/mdev_29644.cnf |  3 +
+ .../spider/bugfix/t/mdev_29644.test           | 58 ++++++++++++
+ storage/spider/spd_db_mysql.cc                | 88 ++++++++-----------
+ storage/spider/spd_db_mysql.h                 |  4 +-
+ 5 files changed, 141 insertions(+), 56 deletions(-)
+ create mode 100644 spider/mysql-test/spider/bugfix/r/mdev_29644.result
+ create mode 100644 spider/mysql-test/spider/bugfix/t/mdev_29644.cnf
+ create mode 100644 spider/mysql-test/spider/bugfix/t/mdev_29644.test
+
+diff --git a/spider/mysql-test/spider/bugfix/r/mdev_29644.result b/spider/mysql-test/spider/bugfix/r/mdev_29644.result
+new file mode 100644
+index 00000000..eb725602
+--- /dev/null
++++ b/spider/mysql-test/spider/bugfix/r/mdev_29644.result
+@@ -0,0 +1,44 @@
++#
++# MDEV-29644 a potential bug of null pointer dereference in spider_db_mbase::print_warnings()
++#
++for master_1
++for child2
++child2_1
++child2_2
++child2_3
++for child3
++connection child2_1;
++CREATE DATABASE auto_test_remote;
++USE auto_test_remote;
++CREATE TABLE tbl_a (
++a CHAR(5)
++) ENGINE=InnoDB DEFAULT CHARSET=utf8;
++set @orig_sql_mode=@@global.sql_mode;
++SET GLOBAL sql_mode='';
++connection master_1;
++CREATE DATABASE auto_test_local;
++USE auto_test_local;
++CREATE TABLE tbl_a (
++a CHAR(255)
++) ENGINE=Spider DEFAULT CHARSET=utf8 COMMENT='table "tbl_a", srv "s_2_1"';
++SET @orig_sql_mode=@@global.sql_mode;
++SET GLOBAL sql_mode='';
++INSERT INTO tbl_a VALUES ("this will be truncated");
++NOT FOUND /\[WARN SPIDER RESULT\].* Warning 1265 Data truncated for column 'a' at row 1.*/ in mysqld.1.1.err
++SET @orig_log_result_errors=@@global.spider_log_result_errors;
++SET GLOBAL spider_log_result_errors=4;
++INSERT INTO tbl_a VALUES ("this will be truncated");
++FOUND 1 /\[WARN SPIDER RESULT\].* Warning 1265 Data truncated for column 'a' at row 1.*/ in mysqld.1.1.err
++connection master_1;
++SET GLOBAL spider_log_result_errors=@orig_log_result_errors;
++SET GLOBAL sql_mode=@orig_sql_mode;
++DROP DATABASE IF EXISTS auto_test_local;
++connection child2_1;
++SET GLOBAL sql_mode=@orig_sql_mode;
++DROP DATABASE IF EXISTS auto_test_remote;
++for master_1
++for child2
++child2_1
++child2_2
++child2_3
++for child3
+diff --git a/spider/mysql-test/spider/bugfix/t/mdev_29644.cnf b/spider/mysql-test/spider/bugfix/t/mdev_29644.cnf
+new file mode 100644
+index 00000000..05dfd8a0
+--- /dev/null
++++ b/spider/mysql-test/spider/bugfix/t/mdev_29644.cnf
+@@ -0,0 +1,3 @@
++!include include/default_mysqld.cnf
++!include ../my_1_1.cnf
++!include ../my_2_1.cnf
+diff --git a/spider/mysql-test/spider/bugfix/t/mdev_29644.test b/spider/mysql-test/spider/bugfix/t/mdev_29644.test
+new file mode 100644
+index 00000000..4ebdf317
+--- /dev/null
++++ b/spider/mysql-test/spider/bugfix/t/mdev_29644.test
+@@ -0,0 +1,58 @@
++--echo #
++--echo # MDEV-29644 a potential bug of null pointer dereference in spider_db_mbase::print_warnings()
++--echo #
++
++# The test case below does not cause the potential null pointer dereference.
++# It is just for checking spider_db_mbase::fetch_and_print_warnings() works.
++
++--disable_query_log
++--disable_result_log
++--source ../../t/test_init.inc
++--enable_result_log
++--enable_query_log
++
++--connection child2_1
++CREATE DATABASE auto_test_remote;
++USE auto_test_remote;
++eval CREATE TABLE tbl_a (
++    a CHAR(5)
++) $CHILD2_1_ENGINE $CHILD2_1_CHARSET;
++set @orig_sql_mode=@@global.sql_mode;
++SET GLOBAL sql_mode='';
++
++--connection master_1
++CREATE DATABASE auto_test_local;
++USE auto_test_local;
++eval CREATE TABLE tbl_a (
++    a CHAR(255)
++) $MASTER_1_ENGINE $MASTER_1_CHARSET COMMENT='table "tbl_a", srv "s_2_1"';
++
++SET @orig_sql_mode=@@global.sql_mode;
++SET GLOBAL sql_mode='';
++
++let SEARCH_FILE= $MYSQLTEST_VARDIR/log/mysqld.1.1.err;
++let SEARCH_PATTERN= \[WARN SPIDER RESULT\].* Warning 1265 Data truncated for column 'a' at row 1.*;
++
++INSERT INTO tbl_a VALUES ("this will be truncated");
++--source include/search_pattern_in_file.inc # should not find
++
++SET @orig_log_result_errors=@@global.spider_log_result_errors;
++SET GLOBAL spider_log_result_errors=4;
++
++INSERT INTO tbl_a VALUES ("this will be truncated");
++--source include/search_pattern_in_file.inc # should find
++
++--connection master_1
++SET GLOBAL spider_log_result_errors=@orig_log_result_errors;
++SET GLOBAL sql_mode=@orig_sql_mode;
++DROP DATABASE IF EXISTS auto_test_local;
++
++--connection child2_1
++SET GLOBAL sql_mode=@orig_sql_mode;
++DROP DATABASE IF EXISTS auto_test_remote;
++
++--disable_query_log
++--disable_result_log
++--source ../t/test_deinit.inc
++--enable_query_log
++--enable_result_log
+diff --git a/storage/spider/spd_db_mysql.cc b/storage/spider/spd_db_mysql.cc
+index 85f910aa..7d6bd599 100644
+--- a/storage/spider/spd_db_mysql.cc
++++ b/storage/spider/spd_db_mysql.cc
+@@ -2197,7 +2197,7 @@ int spider_db_mbase::exec_query(
+         db_conn->affected_rows, db_conn->insert_id,
+         db_conn->server_status, db_conn->warning_count);
+       if (spider_param_log_result_errors() >= 3)
+-        print_warnings(l_time);
++        fetch_and_print_warnings(l_time);
+     } else if (log_result_errors >= 4)
+     {
+       time_t cur_time = (time_t) time((time_t*) 0);
+@@ -2279,61 +2279,43 @@ bool spider_db_mbase::is_xa_nota_error(
+   DBUG_RETURN(xa_nota);
+ }
+
+-void spider_db_mbase::print_warnings(
+-  struct tm *l_time
+-) {
+-  DBUG_ENTER("spider_db_mbase::print_warnings");
+-  DBUG_PRINT("info",("spider this=%p", this));
+-  if (db_conn->status == MYSQL_STATUS_READY)
++void spider_db_mbase::fetch_and_print_warnings(struct tm *l_time)
++{
++  DBUG_ENTER("spider_db_mbase::fetch_and_print_warnings");
++
++  if (spider_param_dry_access() || db_conn->status != MYSQL_STATUS_READY ||
++      db_conn->server_status & SERVER_MORE_RESULTS_EXISTS)
++    DBUG_VOID_RETURN;
++
++  if (mysql_real_query(db_conn, SPIDER_SQL_SHOW_WARNINGS_STR,
++                       SPIDER_SQL_SHOW_WARNINGS_LEN))
++    DBUG_VOID_RETURN;
++
++  MYSQL_RES *res= mysql_store_result(db_conn);
++  if (!res)
++    DBUG_VOID_RETURN;
++
++  uint num_fields= mysql_num_fields(res);
++  if (num_fields != 3)
+   {
+-#if MYSQL_VERSION_ID < 50500
+-    if (!(db_conn->last_used_con->server_status & SERVER_MORE_RESULTS_EXISTS))
+-#else
+-    if (!(db_conn->server_status & SERVER_MORE_RESULTS_EXISTS))
+-#endif
+-    {
+-      if (
+-        spider_param_dry_access() ||
+-        !mysql_real_query(db_conn, SPIDER_SQL_SHOW_WARNINGS_STR,
+-          SPIDER_SQL_SHOW_WARNINGS_LEN)
+-      ) {
+-        MYSQL_RES *res = NULL;
+-        MYSQL_ROW row = NULL;
+-        uint num_fields;
+-        if (
+-          spider_param_dry_access() ||
+-          !(res = mysql_store_result(db_conn)) ||
+-          !(row = mysql_fetch_row(res))
+-        ) {
+-          if (mysql_errno(db_conn))
+-          {
+-            if (res)
+-              mysql_free_result(res);
+-            DBUG_VOID_RETURN;
+-          }
+-          /* no record is ok */
+-        }
+-        num_fields = mysql_num_fields(res);
+-        if (num_fields != 3)
+-        {
+-          mysql_free_result(res);
+-          DBUG_VOID_RETURN;
+-        }
+-        while (row)
+-        {
+-          fprintf(stderr, "%04d%02d%02d %02d:%02d:%02d [WARN SPIDER RESULT] "
+-            "from [%s] %ld to %ld: %s %s %s\n",
++    mysql_free_result(res);
++    DBUG_VOID_RETURN;
++  }
++
++  MYSQL_ROW row= mysql_fetch_row(res);
++  while (row)
++  {
++    fprintf(stderr,
++            "%04d%02d%02d %02d:%02d:%02d [WARN SPIDER RESULT] from [%s] %ld "
++            "to %ld: %s %s %s\n",
+             l_time->tm_year + 1900, l_time->tm_mon + 1, l_time->tm_mday,
+-            l_time->tm_hour, l_time->tm_min, l_time->tm_sec,
+-            conn->tgt_host, (ulong) db_conn->thread_id,
+-            (ulong) current_thd->thread_id, row[0], row[1], row[2]);
+-          row = mysql_fetch_row(res);
+-        }
+-        if (res)
+-          mysql_free_result(res);
+-      }
+-    }
++            l_time->tm_hour, l_time->tm_min, l_time->tm_sec, conn->tgt_host,
++            (ulong) db_conn->thread_id, (ulong) current_thd->thread_id, row[0],
++            row[1], row[2]);
++    row= mysql_fetch_row(res);
+   }
++  mysql_free_result(res);
++
+   DBUG_VOID_RETURN;
+ }
+
+diff --git a/storage/spider/spd_db_mysql.h b/storage/spider/spd_db_mysql.h
+index 626bb4d5..82c7c0ec 100644
+--- a/storage/spider/spd_db_mysql.h
++++ b/storage/spider/spd_db_mysql.h
+@@ -439,9 +439,7 @@ class spider_db_mbase: public spider_db_conn
+   bool is_xa_nota_error(
+     int error_num
+   );
+-  void print_warnings(
+-    struct tm *l_time
+-  );
++  void fetch_and_print_warnings(struct tm *l_time);
+   spider_db_result *store_result(
+     spider_db_result_buffer **spider_res_buf,
+     st_spider_db_request_key *request_key,
+--
+2.25.1
-- 
2.18.2


