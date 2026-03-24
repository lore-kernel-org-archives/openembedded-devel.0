Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F2E0E9A76C
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 11:16:16 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17465.1774350971608473203
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 04:16:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=RRGNfrOw;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=31945; q=dns/txt;
  s=iport01; t=1774350971; x=1775560571;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=74i6Nly+/xKPfWnYTejr25AsmgENyB+xNpN978L9q+0=;
  b=RRGNfrOwj9A055pkuBLlLJR8Sp8cFtVQqDpjKyx+XIGImm99CaRVLZYy
   PeMSfsEaM7fZVGzcX08yBTvZCVa0AZLUSjNiK2fhuEOFxH5207zR9VKAE
   FTmxDPwHuXz9X6TjrEhqQFpcSuF+LNMwOAwngztDNNT6NcXOioK8bHT9k
   /hfHXI6YDQSbfa64e5JfyZyhrey2ZhdnvTwCwLDvhG8A7r4BHx0vog8I4
   hi/N+iNTi78tuNOZMucc2/z15qyuvp5NIGUJrMZAHn3jEvc151Q7+Mt41
   wa6aGCNvwguzku8WaGxeGoOkomE5/04YghD+D+us8hAgunYitta6ZuKdf
   Q==;
X-CSE-ConnectionGUID: 8h/PcZG5TaC3D0/M9/ZHNg==
X-CSE-MsgGUID: hkBrm2KhQKKPUfINYZHrTg==
X-IPAS-Result: =?us-ascii?q?A0B6BgDWcMJp/5P/Ja1aglmCGDAPcV5DSZZLgRadBxSBa?=
 =?us-ascii?q?w8BAQEPRA0EAQGCE4IuRo0lAiY2Bw4BAgQBAQEBAwIDAQEBAQEBAQEBAQELA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDYZaAQIBHQEMCwFGLAMBAhlBIyGCKlgBgnMDEbBog?=
 =?us-ascii?q?XkzgQGDWgUJAkNP2yYBCxQBgTiFPIgbWxgBhHonGxuBcoEVgTuBN3aBBYFcA?=
 =?us-ascii?q?QGBIyUGYoIQg2QEgiKBDoFhHoVNg3yGX0iBHgNZLAFVEw0KCwcFgWYDNRIqF?=
 =?us-ascii?q?W4yHYEjPheBDBsHBYJJD4hxdG2BE4QjAwsYDUgRLDcUGwQ+bgeMejaBZ0YGA?=
 =?us-ascii?q?S0EShMBExhWXRgGExkHRAIwklcSAQeQFIIhn22BIQoog3SMHpU6GjOEBIFXi?=
 =?us-ascii?q?zyZVJkGgliLMZVzXYRogW8CM4FHCwdwFYMiCUkZD44tCwuDLDKBf4MUw0kmM?=
 =?us-ascii?q?gsuBAEBBwIHDQMLgWiEYYsfJgSBUwEB?=
IronPort-Data: A9a23:4ZiHkaLOZVNOUK27FE+RgZQlxSXFcZb7ZxGr2PjKsXjdYENS3zJVm
 2MfDD/XO/iOMTPxKIt1PYW/8hwFv8fVzoRgTVAd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnW0
 T/Oi5eHYgH9gGQoajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN0+DAYONr83p9p+Kjpir
 bs9eXc/TjaM0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSAVbAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEuojx5nYj/7DLo3kOCuiXDlfhVTqUmeouw85G27IAlZjumwb4qOKoDWLSlTtkabj
 HjDpUf5OzI5DOGR6By0wFK2uuCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl/BQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSj1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:qFCEZq5otW2+hcg00APXwMPXdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBEDjexPhHPdOiOF7V4tKNzOJhILHFu1fBPPZsl7d8+mUzJ876U
 +mGJIObOHNMQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AVuY4umg24NElTI/akByZVAueVDJuIn2a9HziDBK?=
 =?us-ascii?q?EAE0yZOXSbA7XyoNCnJ87?=
X-Talos-MUID: 9a23:Qa5afgutnkgnGYUx282nhDJILsIywKSXK2M1rJsnnfi2FTZMNGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,138,1770595200"; 
   d="scan'208";a="695783844"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Mar 2026 11:16:10 +0000
Received: from sjc-ads-10055.cisco.com (sjc-ads-10055.cisco.com [10.30.210.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 33341180008B9;
	Tue, 24 Mar 2026 11:16:10 +0000 (GMT)
Received: by sjc-ads-10055.cisco.com (Postfix, from userid 1870532)
	id D05D7CC12A6; Tue, 24 Mar 2026 04:16:09 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [meta-OE] [scarthgap] [PATCH] mariadb: Fix CVE-2026-3494
Date: Tue, 24 Mar 2026 04:16:04 -0700
Message-ID: <20260324111604.172238-1-adongare@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.210.59, sjc-ads-10055.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 11:16:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125554

From: Anil Dongare <adongare@cisco.com>

- This patch applies the upstream fix as referenced in [3], using the commit
  shown in [1].
- Commit [2] is included as a required regression fix for the same upstream
  bug ticket [4] (MDEV-38375). It resolves an audit logging regression for
  prepared statements introduced during the initial fix.

[1] https://github.com/MariaDB/server/commit/635559a2ad68a5a6d1a354e8209c58323dba0261
[2] https://github.com/MariaDB/server/commit/317fb109153b45091003f0b1380b5d68522fce29
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-3494
[4] https://jira.mariadb.org/browse/MDEV-38375

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |   2 +
 .../mysql/mariadb/CVE-2026-3494_p1.patch      | 780 ++++++++++++++++++
 .../mysql/mariadb/CVE-2026-3494_p2.patch      | 105 +++
 3 files changed, 887 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/CVE-2026-3494_p1.patch
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/CVE-2026-3494_p2.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index f0cec75568..2f5217f6df 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -22,6 +22,8 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch \
            file://lfs64.patch \
            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
+           file://CVE-2026-3494_p1.patch \
+           file://CVE-2026-3494_p2.patch \
           "
 SRC_URI[sha256sum] = "d61f23090cfc14f43e8a27c2d3ce7f80247e74481bb26a2d3a6308b8d194e167"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/CVE-2026-3494_p1.patch b/meta-oe/recipes-dbs/mysql/mariadb/CVE-2026-3494_p1.patch
new file mode 100644
index 0000000000..96d204778d
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/CVE-2026-3494_p1.patch
@@ -0,0 +1,780 @@
+From f0324a90e0bc15a367ba775318ef5d0e77c2192a Mon Sep 17 00:00:00 2001
+From: Sergei Golubchik <serg@mariadb.org>
+Date: Thu, 18 Dec 2025 16:52:17 +0100
+Subject: [PATCH] MDEV-38375 audit plugin implements its own (simple) SQL
+ parser
+
+remove the parser, use thd_sql_command(thd)
+
+CVE: CVE-2026-3494
+Upstream-Status: Backport [https://github.com/MariaDB/server/commit/635559a2ad68a5a6d1a354e8209c58323dba0261]
+
+(cherry picked from commit 635559a2ad68a5a6d1a354e8209c58323dba0261)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ .../suite/plugins/r/server_audit.result       |   2 -
+ .../plugins/r/thread_pool_server_audit.result |   2 -
+ plugin/server_audit/server_audit.c            | 417 ++++--------------
+ sql/sql_cmd.h                                 |  99 +----
+ sql/sql_command.h                             | 112 +++++
+ 5 files changed, 205 insertions(+), 427 deletions(-)
+ create mode 100644 sql/sql_command.h
+
+diff --git a/mysql-test/suite/plugins/r/server_audit.result b/mysql-test/suite/plugins/r/server_audit.result
+index e78b3cc0629..0043ae2ec18 100644
+--- a/mysql-test/suite/plugins/r/server_audit.result
++++ b/mysql-test/suite/plugins/r/server_audit.result
+@@ -448,8 +448,6 @@ TIME,HOSTNAME,root,localhost,ID,ID,QUERY,sa_db,'/*! select 2*/',0
+ TIME,HOSTNAME,root,localhost,ID,ID,QUERY,sa_db,'/*comment*/ select 2',0
+ TIME,HOSTNAME,root,localhost,ID,ID,QUERY,sa_db,'CREATE USER u1 IDENTIFIED BY *****',0
+ TIME,HOSTNAME,root,localhost,ID,ID,QUERY,sa_db,'GRANT ALL ON sa_db TO u2 IDENTIFIED BY *****',0
+-TIME,HOSTNAME,root,localhost,ID,ID,QUERY,sa_db,'SET PASSWORD \n# comment\nFOR u1 = PASSWORD(*****)',0
+-TIME,HOSTNAME,root,localhost,ID,ID,QUERY,sa_db,'SET PASSWORD FOR u1=<secret>',ID
+ TIME,HOSTNAME,root,localhost,ID,ID,QUERY,sa_db,'CREATE USER u3 IDENTIFIED BY *****',0
+ TIME,HOSTNAME,root,localhost,ID,ID,QUERY,sa_db,'drop user u1, u2, u3',0
+ TIME,HOSTNAME,root,localhost,ID,ID,QUERY,sa_db,'insert into t1 values (1), (2)',0
+diff --git a/mysql-test/suite/plugins/r/thread_pool_server_audit.result b/mysql-test/suite/plugins/r/thread_pool_server_audit.result
+index 8c6ece53227..19a3163d209 100644
+--- a/mysql-test/suite/plugins/r/thread_pool_server_audit.result
++++ b/mysql-test/suite/plugins/r/thread_pool_server_audit.result
+@@ -361,8 +361,6 @@ TIME,HOSTNAME,root,localhost,ID,ID,QUERY,sa_db,'/*! select 2*/',0
+ TIME,HOSTNAME,root,localhost,ID,ID,QUERY,sa_db,'/*comment*/ select 2',0
+ TIME,HOSTNAME,root,localhost,ID,ID,QUERY,sa_db,'CREATE USER u1 IDENTIFIED BY *****',0
+ TIME,HOSTNAME,root,localhost,ID,ID,QUERY,sa_db,'GRANT ALL ON sa_db TO u2 IDENTIFIED BY *****',0
+-TIME,HOSTNAME,root,localhost,ID,ID,QUERY,sa_db,'SET PASSWORD\n# comment\nFOR u1 = PASSWORD(*****)',0
+-TIME,HOSTNAME,root,localhost,ID,ID,QUERY,sa_db,'SET PASSWORD FOR u1=<secret>',ID
+ TIME,HOSTNAME,root,localhost,ID,ID,QUERY,sa_db,'CREATE USER u3 IDENTIFIED BY *****',0
+ TIME,HOSTNAME,root,localhost,ID,ID,QUERY,sa_db,'drop user u1, u2, u3',0
+ TIME,HOSTNAME,root,localhost,ID,ID,QUERY,sa_db,'set global server_audit_events=\'\'',0
+diff --git a/plugin/server_audit/server_audit.c b/plugin/server_audit/server_audit.c
+index fee20a1a543..7175239be82 100644
+--- a/plugin/server_audit/server_audit.c
++++ b/plugin/server_audit/server_audit.c
+@@ -22,6 +22,7 @@
+ 
+ #include <my_config.h>
+ #include <assert.h>
++#include "sql_command.h"
+ 
+ #ifndef _WIN32
+ #define DO_SYSLOG
+@@ -811,189 +812,6 @@ static int user_coll_fill(struct user_coll *c, char *users,
+ }
+ 
+ 
+-enum sa_keywords
+-{
+-  SQLCOM_NOTHING=0,
+-  SQLCOM_DDL,
+-  SQLCOM_DML,
+-  SQLCOM_GRANT,
+-  SQLCOM_CREATE_USER,
+-  SQLCOM_ALTER_USER,
+-  SQLCOM_CHANGE_MASTER,
+-  SQLCOM_CREATE_SERVER,
+-  SQLCOM_SET_OPTION,
+-  SQLCOM_ALTER_SERVER,
+-  SQLCOM_TRUNCATE,
+-  SQLCOM_QUERY_ADMIN,
+-  SQLCOM_DCL,
+-  SQLCOM_FOUND=-1,
+-};
+-
+-struct sa_keyword
+-{
+-  int length;
+-  const char *wd;
+-  struct sa_keyword *next;
+-  enum sa_keywords type;
+-};
+-
+-
+-struct sa_keyword xml_word[]=
+-{
+-  {3, "XML", 0, SQLCOM_FOUND},
+-  {0, NULL, 0, SQLCOM_NOTHING}
+-};
+-struct sa_keyword user_word[]=
+-{
+-  {4, "USER", 0, SQLCOM_FOUND},
+-  {0, NULL, 0, SQLCOM_NOTHING}
+-};
+-struct sa_keyword data_word[]=
+-{
+-  {4, "DATA", 0, SQLCOM_FOUND},
+-  {0, NULL, 0, SQLCOM_NOTHING}
+-};
+-struct sa_keyword server_word[]=
+-{
+-  {6, "SERVER", 0, SQLCOM_FOUND},
+-  {0, NULL, 0, SQLCOM_NOTHING}
+-};
+-struct sa_keyword master_word[]=
+-{
+-  {6, "MASTER", 0, SQLCOM_FOUND},
+-  {0, NULL, 0, SQLCOM_NOTHING}
+-};
+-struct sa_keyword password_word[]=
+-{
+-  {8, "PASSWORD", 0, SQLCOM_FOUND},
+-  {0, NULL, 0, SQLCOM_NOTHING}
+-};
+-struct sa_keyword function_word[]=
+-{
+-  {8, "FUNCTION", 0, SQLCOM_FOUND},
+-  {0, NULL, 0, SQLCOM_NOTHING}
+-};
+-struct sa_keyword statement_word[]=
+-{
+-  {9, "STATEMENT", 0, SQLCOM_FOUND},
+-  {0, NULL, 0, SQLCOM_NOTHING}
+-};
+-struct sa_keyword procedure_word[]=
+-{
+-  {9, "PROCEDURE", 0, SQLCOM_FOUND},
+-  {0, NULL, 0, SQLCOM_NOTHING}
+-};
+-struct sa_keyword replace_user_word[]=
+-{
+-  {7, "REPLACE", user_word, SQLCOM_FOUND},
+-  {0, NULL, 0, SQLCOM_NOTHING}
+-};
+-struct sa_keyword or_replace_user_word[]=
+-{
+-  {2, "OR", replace_user_word, SQLCOM_FOUND},
+-  {0, NULL, 0, SQLCOM_NOTHING}
+-};
+-struct sa_keyword replace_server_word[]=
+-{
+-  {7, "REPLACE", server_word, SQLCOM_FOUND},
+-  {0, NULL, 0, SQLCOM_NOTHING}
+-};
+-struct sa_keyword or_replace_server_word[]=
+-{
+-  {2, "OR", replace_server_word, SQLCOM_FOUND},
+-  {0, NULL, 0, SQLCOM_NOTHING}
+-};
+-
+-
+-struct sa_keyword keywords_to_skip[]=
+-{
+-  {3, "SET", statement_word, SQLCOM_QUERY_ADMIN},
+-  {0, NULL, 0, SQLCOM_NOTHING}
+-};
+-
+-
+-struct sa_keyword not_ddl_keywords[]=
+-{
+-  {4, "DROP", user_word, SQLCOM_DCL},
+-  {6, "CREATE", user_word, SQLCOM_DCL},
+-  {6, "CREATE", or_replace_user_word, SQLCOM_DCL},
+-  {6, "RENAME", user_word, SQLCOM_DCL},
+-  {0, NULL, 0, SQLCOM_NOTHING}
+-};
+-
+-
+-struct sa_keyword ddl_keywords[]=
+-{
+-  {4, "DROP", 0, SQLCOM_DDL},
+-  {5, "ALTER", 0, SQLCOM_DDL},
+-  {6, "CREATE", 0, SQLCOM_DDL},
+-  {6, "RENAME", 0, SQLCOM_DDL},
+-  {8, "TRUNCATE", 0, SQLCOM_DDL},
+-  {0, NULL, 0, SQLCOM_NOTHING}
+-};
+-
+-
+-struct sa_keyword dml_keywords[]=
+-{
+-  {2, "DO", 0, SQLCOM_DML},
+-  {4, "CALL", 0, SQLCOM_DML},
+-  {4, "LOAD", data_word, SQLCOM_DML},
+-  {4, "LOAD", xml_word, SQLCOM_DML},
+-  {6, "DELETE", 0, SQLCOM_DML},
+-  {6, "INSERT", 0, SQLCOM_DML},
+-  {6, "SELECT", 0, SQLCOM_DML},
+-  {6, "UPDATE", 0, SQLCOM_DML},
+-  {7, "HANDLER", 0, SQLCOM_DML},
+-  {7, "REPLACE", 0, SQLCOM_DML},
+-  {0, NULL, 0, SQLCOM_NOTHING}
+-};
+-
+-
+-struct sa_keyword dml_no_select_keywords[]=
+-{
+-  {2, "DO", 0, SQLCOM_DML},
+-  {4, "CALL", 0, SQLCOM_DML},
+-  {4, "LOAD", data_word, SQLCOM_DML},
+-  {4, "LOAD", xml_word, SQLCOM_DML},
+-  {6, "DELETE", 0, SQLCOM_DML},
+-  {6, "INSERT", 0, SQLCOM_DML},
+-  {6, "UPDATE", 0, SQLCOM_DML},
+-  {7, "HANDLER", 0, SQLCOM_DML},
+-  {7, "REPLACE", 0, SQLCOM_DML},
+-  {0, NULL, 0, SQLCOM_NOTHING}
+-};
+-
+-
+-struct sa_keyword dcl_keywords[]=
+-{
+-  {6, "CREATE", user_word, SQLCOM_DCL},
+-  {6, "CREATE", or_replace_user_word, SQLCOM_DCL},
+-  {4, "DROP", user_word, SQLCOM_DCL},
+-  {6, "RENAME", user_word, SQLCOM_DCL},
+-  {5, "GRANT", 0, SQLCOM_DCL},
+-  {6, "REVOKE", 0, SQLCOM_DCL},
+-  {3, "SET", password_word, SQLCOM_DCL},
+-  {0, NULL, 0, SQLCOM_NOTHING}
+-};
+-
+-
+-struct sa_keyword passwd_keywords[]=
+-{
+-  {3, "SET", password_word, SQLCOM_SET_OPTION},
+-  {5, "ALTER", server_word, SQLCOM_ALTER_SERVER},
+-  {5, "ALTER", user_word, SQLCOM_ALTER_USER},
+-  {5, "GRANT", 0, SQLCOM_GRANT},
+-  {6, "CREATE", user_word, SQLCOM_CREATE_USER},
+-  {6, "CREATE", or_replace_user_word, SQLCOM_CREATE_USER},
+-  {6, "CREATE", server_word, SQLCOM_CREATE_SERVER},
+-  {6, "CREATE", or_replace_server_word, SQLCOM_CREATE_SERVER},
+-  {6, "CHANGE", master_word, SQLCOM_CHANGE_MASTER},
+-  {0, NULL, 0, SQLCOM_NOTHING}
+-};
+-
+-#define MAX_KEYWORD 9
+-
+-
+ static void error_header()
+ {
+   struct tm tm_time;
+@@ -1107,6 +925,78 @@ static int get_user_host(const char *uh_line, unsigned int uh_len,
+   return 0;
+ }
+ 
++
++static int sql_command_to_cmdtype(int sql_command)
++{
++  switch (sql_command)
++  {
++    case SQLCOM_ALTER_DB:
++    case SQLCOM_ALTER_DB_UPGRADE:
++    case SQLCOM_ALTER_FUNCTION:
++    case SQLCOM_ALTER_PROCEDURE:
++    case SQLCOM_ALTER_SEQUENCE:
++    case SQLCOM_ALTER_TABLE:
++    case SQLCOM_CREATE_DB:
++    case SQLCOM_CREATE_INDEX:
++    case SQLCOM_CREATE_PACKAGE:
++    case SQLCOM_CREATE_PACKAGE_BODY:
++    case SQLCOM_CREATE_PROCEDURE:
++    case SQLCOM_CREATE_SEQUENCE:
++    case SQLCOM_CREATE_SPFUNCTION:
++    case SQLCOM_CREATE_TABLE:
++    case SQLCOM_CREATE_TRIGGER:
++    case SQLCOM_CREATE_VIEW:
++    case SQLCOM_DROP_DB:
++    case SQLCOM_DROP_FUNCTION:
++    case SQLCOM_DROP_INDEX:
++    case SQLCOM_DROP_PACKAGE:
++    case SQLCOM_DROP_PACKAGE_BODY:
++    case SQLCOM_DROP_PROCEDURE:
++    case SQLCOM_DROP_SEQUENCE:
++    case SQLCOM_DROP_TABLE:
++    case SQLCOM_DROP_TRIGGER:
++    case SQLCOM_DROP_VIEW:
++    case SQLCOM_RENAME_TABLE:
++    case SQLCOM_TRUNCATE:
++      return EVENT_QUERY_DDL;
++
++    case SQLCOM_DO:
++    case SQLCOM_CALL:
++    case SQLCOM_LOAD:
++    case SQLCOM_DELETE:
++    case SQLCOM_DELETE_MULTI:
++    case SQLCOM_INSERT:
++    case SQLCOM_INSERT_SELECT:
++    case SQLCOM_UPDATE:
++    case SQLCOM_UPDATE_MULTI:
++    case SQLCOM_HA_OPEN:
++    case SQLCOM_HA_READ:
++    case SQLCOM_HA_CLOSE:
++    case SQLCOM_REPLACE:
++    case SQLCOM_REPLACE_SELECT:
++      return EVENT_QUERY_DML | EVENT_QUERY_DML_NO_SELECT;
++
++    case SQLCOM_SELECT:
++      return EVENT_QUERY_DML;
++
++    case SQLCOM_CREATE_USER:
++    case SQLCOM_CREATE_ROLE:
++    case SQLCOM_DROP_ROLE:
++    case SQLCOM_DROP_USER:
++    case SQLCOM_RENAME_USER:
++    case SQLCOM_GRANT:
++    case SQLCOM_GRANT_ROLE:
++    case SQLCOM_REVOKE:
++    case SQLCOM_REVOKE_ROLE:
++    case SQLCOM_REVOKE_ALL:
++      return EVENT_QUERY_DCL;
++
++    default:
++      return EVENT_QUERY_ALL;
++  };
++}
++
++
+ #if defined(_WIN32) && !defined(S_ISDIR)
+ #define S_ISDIR(x) ((x) & _S_IFDIR)
+ #endif /*_WIN32 && !S_ISDIR*/
+@@ -1755,118 +1645,8 @@ static int do_log_user(const char *name, int len,
+ }
+ 
+ 
+-static int get_next_word(const char *query, char *word)
+-{
+-  int len= 0;
+-  char c;
+-  while ((c= query[len]))
+-  {
+-    if (c >= 'a' && c <= 'z')
+-      word[len]= 'A' + (c-'a');
+-    else if (c >= 'A' && c <= 'Z')
+-      word[len]= c;
+-    else
+-      break;
+-
+-    if (len++ == MAX_KEYWORD)
+-      return 0;
+-  }
+-  word[len]= 0;
+-  return len;
+-}
+-
+-
+-static int filter_query_type(const char *query, struct sa_keyword *kwd)
+-{
+-  int qwe_in_list;
+-  char fword[MAX_KEYWORD + 1], nword[MAX_KEYWORD + 1];
+-  int len, nlen= 0;
+-  const struct sa_keyword *l_keywords;
+-  if (!query)
+-    return SQLCOM_NOTHING;
+-
+-  while (*query && (is_space(*query) || *query == '(' || *query == '/'))
+-  {
+-    /* comment handling */
+-    if (*query == '/' && query[1] == '*')
+-    {
+-      if (query[2] == '!')
+-      {
+-        query+= 3;
+-        while (*query >= '0' && *query <= '9')
+-          query++;
+-        continue;
+-      }
+-      query+= 2;
+-      while (*query)
+-      {
+-        if (*query=='*' && query[1] == '/')
+-        {
+-          query+= 2;
+-          break;
+-        }
+-        query++;
+-      }
+-      continue;
+-    }
+-    query++;
+-  }
+-
+-  qwe_in_list= SQLCOM_NOTHING;
+-  if (!(len= get_next_word(query, fword)))
+-    goto not_in_list;
+-  query+= len+1;
+-
+-  l_keywords= kwd;
+-  while (l_keywords->length)
+-  {
+-    if (l_keywords->length == len && strncmp(l_keywords->wd, fword, len) == 0)
+-    {
+-      if (l_keywords->next)
+-      {
+-        if (nlen == 0)
+-        {
+-          while (*query && is_space(*query))
+-            query++;
+-          nlen= get_next_word(query, nword);
+-        }
+-        if (filter_query_type(query, l_keywords->next) == SQLCOM_NOTHING)
+-          goto do_loop;
+-      }
+-
+-      qwe_in_list= l_keywords->type;
+-      break;
+-    };
+-do_loop:
+-    l_keywords++;
+-  }
+-
+-not_in_list:
+-  return qwe_in_list;
+-}
+-
+-static const char *skip_set_statement(const char *query)
+-{
+-    if (filter_query_type(query, keywords_to_skip))
+-    {
+-      char fword[MAX_KEYWORD + 1];
+-      int len;
+-      do
+-      {
+-        len= get_next_word(query, fword);
+-        query+= len ? len : 1;
+-        if (len == 3 && strncmp(fword, "FOR", 3) == 0)
+-          break;
+-      } while (*query);
+-
+-      if (*query == 0)
+-        return 0;
+-    }
+-    return query;
+-}
+-
+ static int log_statement_ex(const struct connection_info *cn,
+-                            time_t ev_time, unsigned long thd_id,
++                            time_t ev_time, unsigned long thd_id, int sql_cmd,
+                             const char *query, unsigned int query_len,
+                             int error_code, const char *type, int take_lock)
+ {
+@@ -1881,6 +1661,7 @@ static int log_statement_ex(const struct connection_info *cn,
+   long long query_id;
+   int result;
+   char *big_buffer= NULL;
++  int cmdtype= sql_command_to_cmdtype(sql_cmd);
+ 
+   if ((db= cn->db))
+     db_length= cn->db_length;
+@@ -1907,30 +1688,14 @@ static int log_statement_ex(const struct connection_info *cn,
+   {
+     const char *orig_query= query;
+ 
+-    if ((query= skip_set_statement(query)) == SQLCOM_NOTHING)
+-      return 0;
+-
+-    if (events & EVENT_QUERY_DDL)
+-    {
+-      if (!filter_query_type(query, not_ddl_keywords) &&
+-          filter_query_type(query, ddl_keywords))
+-        goto do_log_query;
+-    }
+-    if (events & EVENT_QUERY_DML)
+-    {
+-      if (filter_query_type(query, dml_keywords))
+-        goto do_log_query;
+-    }
+-    if (events & EVENT_QUERY_DML_NO_SELECT)
+-    {
+-      if (filter_query_type(query, dml_no_select_keywords))
+-        goto do_log_query;
+-    }
+-    if (events & EVENT_QUERY_DCL)
+-    {
+-      if (filter_query_type(query, dcl_keywords))
+-        goto do_log_query;
+-    }
++    if (events & EVENT_QUERY_DDL && cmdtype & EVENT_QUERY_DDL)
++      goto do_log_query;
++    if (events & EVENT_QUERY_DML && cmdtype & EVENT_QUERY_DML)
++      goto do_log_query;
++    if (events & EVENT_QUERY_DML_NO_SELECT && cmdtype & EVENT_QUERY_DML_NO_SELECT)
++      goto do_log_query;
++    if (events & EVENT_QUERY_DCL && cmdtype & EVENT_QUERY_DCL)
++      goto do_log_query;
+ 
+     return 0;
+ do_log_query:
+@@ -1964,7 +1729,7 @@ static int log_statement_ex(const struct connection_info *cn,
+   if (query_log_limit > 0 && uh_buffer_size > query_log_limit+2)
+     uh_buffer_size= query_log_limit+2;
+ 
+-  switch (filter_query_type(skip_set_statement(query), passwd_keywords))
++  switch (sql_cmd)
+   {
+     case SQLCOM_GRANT:
+     case SQLCOM_CREATE_USER:
+@@ -1990,8 +1755,8 @@ static int log_statement_ex(const struct connection_info *cn,
+     case SQLCOM_SET_OPTION:
+       csize+= escape_string_hide_passwords(query, query_len,
+                                            uh_buffer, uh_buffer_size,
+-                                           NULL, 0, NULL, 0,
+-                                           "=", 1, 0);
++                                           "PASSWORD", 8, "=", 1,
++                                           "PASSWORD", 8, '(');
+       break;
+     default:
+       csize+= escape_string(query, query_len,
+@@ -2011,10 +1776,11 @@ static int log_statement_ex(const struct connection_info *cn,
+ 
+ static int log_statement(const struct connection_info *cn,
+                          const struct mysql_event_general *event,
+-                         const char *type)
++                         const char *type, int sql_command)
+ {
+   return log_statement_ex(cn, event->general_time, event->general_thread_id,
+-                          event->general_query, event->general_query_length,
++                          sql_command, event->general_query,
++                          event->general_query_length,
+                           event->general_error_code, type, 1);
+ }
+ 
+@@ -2305,7 +2071,7 @@ void auditing(MYSQL_THD thd, unsigned int event_class, const void *ev)
+     if (event->event_subclass == MYSQL_AUDIT_GENERAL_STATUS &&
+         event_query_command(event))
+     {
+-      log_statement(cn, event, "QUERY");
++      log_statement(cn, event, "QUERY", thd_sql_command(thd));
+       cn->query_length= 0; /* So the log_current_query() won't log this again. */
+       cn->log_always= 0;
+     }
+@@ -2843,7 +2609,8 @@ static void log_current_query(MYSQL_THD thd)
+   {
+     cn->log_always= 1;
+     log_statement_ex(cn, cn->query_time, thd_get_thread_id(thd),
+-		     cn->query, cn->query_length, 0, "QUERY", 0);
++                     thd_sql_command(thd), cn->query, cn->query_length, 0,
++                     "QUERY", 0);
+     cn->log_always= 0;
+   }
+ }
+diff --git a/sql/sql_cmd.h b/sql/sql_cmd.h
+index 45560e38d80..f94ffee2f9f 100644
+--- a/sql/sql_cmd.h
++++ b/sql/sql_cmd.h
+@@ -20,104 +20,7 @@
+ #ifndef SQL_CMD_INCLUDED
+ #define SQL_CMD_INCLUDED
+ 
+-/*
+-  When a command is added here, be sure it's also added in mysqld.cc
+-  in "struct show_var_st status_vars[]= {" ...
+-
+-  If the command returns a result set or is not allowed in stored
+-  functions or triggers, please also make sure that
+-  sp_get_flags_for_command (sp_head.cc) returns proper flags for the
+-  added SQLCOM_.
+-*/
+-
+-enum enum_sql_command {
+-  SQLCOM_SELECT, SQLCOM_CREATE_TABLE, SQLCOM_CREATE_INDEX, SQLCOM_ALTER_TABLE,
+-  SQLCOM_UPDATE, SQLCOM_INSERT, SQLCOM_INSERT_SELECT,
+-  SQLCOM_DELETE, SQLCOM_TRUNCATE, SQLCOM_DROP_TABLE, SQLCOM_DROP_INDEX,
+-
+-  SQLCOM_SHOW_DATABASES, SQLCOM_SHOW_TABLES, SQLCOM_SHOW_FIELDS,
+-  SQLCOM_SHOW_KEYS, SQLCOM_SHOW_VARIABLES, SQLCOM_SHOW_STATUS,
+-  SQLCOM_SHOW_ENGINE_LOGS, SQLCOM_SHOW_ENGINE_STATUS, SQLCOM_SHOW_ENGINE_MUTEX,
+-  SQLCOM_SHOW_PROCESSLIST, SQLCOM_SHOW_BINLOG_STAT, SQLCOM_SHOW_SLAVE_STAT,
+-  SQLCOM_SHOW_GRANTS, SQLCOM_SHOW_CREATE, SQLCOM_SHOW_CHARSETS,
+-  SQLCOM_SHOW_COLLATIONS, SQLCOM_SHOW_CREATE_DB, SQLCOM_SHOW_TABLE_STATUS,
+-  SQLCOM_SHOW_TRIGGERS,
+-
+-  SQLCOM_LOAD,SQLCOM_SET_OPTION,SQLCOM_LOCK_TABLES,SQLCOM_UNLOCK_TABLES,
+-  SQLCOM_GRANT,
+-  SQLCOM_CHANGE_DB, SQLCOM_CREATE_DB, SQLCOM_DROP_DB, SQLCOM_ALTER_DB,
+-  SQLCOM_REPAIR, SQLCOM_REPLACE, SQLCOM_REPLACE_SELECT,
+-  SQLCOM_CREATE_FUNCTION, SQLCOM_DROP_FUNCTION,
+-  SQLCOM_REVOKE,SQLCOM_OPTIMIZE, SQLCOM_CHECK,
+-  SQLCOM_ASSIGN_TO_KEYCACHE, SQLCOM_PRELOAD_KEYS,
+-  SQLCOM_FLUSH, SQLCOM_KILL, SQLCOM_ANALYZE,
+-  SQLCOM_ROLLBACK, SQLCOM_ROLLBACK_TO_SAVEPOINT,
+-  SQLCOM_COMMIT, SQLCOM_SAVEPOINT, SQLCOM_RELEASE_SAVEPOINT,
+-  SQLCOM_SLAVE_START, SQLCOM_SLAVE_STOP,
+-  SQLCOM_BEGIN, SQLCOM_CHANGE_MASTER,
+-  SQLCOM_RENAME_TABLE,  
+-  SQLCOM_RESET, SQLCOM_PURGE, SQLCOM_PURGE_BEFORE, SQLCOM_SHOW_BINLOGS,
+-  SQLCOM_SHOW_OPEN_TABLES,
+-  SQLCOM_HA_OPEN, SQLCOM_HA_CLOSE, SQLCOM_HA_READ,
+-  SQLCOM_SHOW_SLAVE_HOSTS, SQLCOM_DELETE_MULTI, SQLCOM_UPDATE_MULTI,
+-  SQLCOM_SHOW_BINLOG_EVENTS, SQLCOM_DO,
+-  SQLCOM_SHOW_WARNS, SQLCOM_EMPTY_QUERY, SQLCOM_SHOW_ERRORS,
+-  SQLCOM_SHOW_STORAGE_ENGINES, SQLCOM_SHOW_PRIVILEGES,
+-  SQLCOM_HELP, SQLCOM_CREATE_USER, SQLCOM_DROP_USER, SQLCOM_RENAME_USER,
+-  SQLCOM_REVOKE_ALL, SQLCOM_CHECKSUM,
+-  SQLCOM_CREATE_PROCEDURE, SQLCOM_CREATE_SPFUNCTION, SQLCOM_CALL,
+-  SQLCOM_DROP_PROCEDURE, SQLCOM_ALTER_PROCEDURE,SQLCOM_ALTER_FUNCTION,
+-  SQLCOM_SHOW_CREATE_PROC, SQLCOM_SHOW_CREATE_FUNC,
+-  SQLCOM_SHOW_STATUS_PROC, SQLCOM_SHOW_STATUS_FUNC,
+-  SQLCOM_PREPARE, SQLCOM_EXECUTE, SQLCOM_DEALLOCATE_PREPARE,
+-  SQLCOM_CREATE_VIEW, SQLCOM_DROP_VIEW,
+-  SQLCOM_CREATE_TRIGGER, SQLCOM_DROP_TRIGGER,
+-  SQLCOM_XA_START, SQLCOM_XA_END, SQLCOM_XA_PREPARE,
+-  SQLCOM_XA_COMMIT, SQLCOM_XA_ROLLBACK, SQLCOM_XA_RECOVER,
+-  SQLCOM_SHOW_PROC_CODE, SQLCOM_SHOW_FUNC_CODE,
+-  SQLCOM_INSTALL_PLUGIN, SQLCOM_UNINSTALL_PLUGIN,
+-  SQLCOM_SHOW_AUTHORS, SQLCOM_BINLOG_BASE64_EVENT,
+-  SQLCOM_SHOW_PLUGINS, SQLCOM_SHOW_CONTRIBUTORS,
+-  SQLCOM_CREATE_SERVER, SQLCOM_DROP_SERVER, SQLCOM_ALTER_SERVER,
+-  SQLCOM_CREATE_EVENT, SQLCOM_ALTER_EVENT, SQLCOM_DROP_EVENT,
+-  SQLCOM_SHOW_CREATE_EVENT, SQLCOM_SHOW_EVENTS,
+-  SQLCOM_SHOW_CREATE_TRIGGER,
+-  SQLCOM_ALTER_DB_UPGRADE,
+-  SQLCOM_SHOW_PROFILE, SQLCOM_SHOW_PROFILES,
+-  SQLCOM_SIGNAL, SQLCOM_RESIGNAL,
+-  SQLCOM_SHOW_RELAYLOG_EVENTS,
+-  SQLCOM_GET_DIAGNOSTICS,
+-  SQLCOM_SLAVE_ALL_START, SQLCOM_SLAVE_ALL_STOP,
+-  SQLCOM_SHOW_EXPLAIN,
+-  SQLCOM_SHOW_ANALYZE, SQLCOM_SHUTDOWN,
+-  SQLCOM_CREATE_ROLE, SQLCOM_DROP_ROLE, SQLCOM_GRANT_ROLE, SQLCOM_REVOKE_ROLE,
+-  SQLCOM_COMPOUND,
+-  SQLCOM_SHOW_GENERIC,
+-  SQLCOM_ALTER_USER,
+-  SQLCOM_SHOW_CREATE_USER,
+-  SQLCOM_EXECUTE_IMMEDIATE,
+-  SQLCOM_CREATE_SEQUENCE,
+-  SQLCOM_DROP_SEQUENCE,
+-  SQLCOM_ALTER_SEQUENCE,
+-  SQLCOM_CREATE_PACKAGE,
+-  SQLCOM_DROP_PACKAGE,
+-  SQLCOM_CREATE_PACKAGE_BODY,
+-  SQLCOM_DROP_PACKAGE_BODY,
+-  SQLCOM_SHOW_CREATE_PACKAGE,
+-  SQLCOM_SHOW_CREATE_PACKAGE_BODY,
+-  SQLCOM_SHOW_STATUS_PACKAGE,
+-  SQLCOM_SHOW_STATUS_PACKAGE_BODY,
+-  SQLCOM_SHOW_PACKAGE_BODY_CODE,
+-  SQLCOM_BACKUP, SQLCOM_BACKUP_LOCK,
+-
+-  /*
+-    When a command is added here, be sure it's also added in mysqld.cc
+-    in "struct show_var_st com_status_vars[]= {" ...
+-  */
+-  /* This should be the last !!! */
+-  SQLCOM_END
+-};
+-
++#include "sql_command.h"
+ 
+ class Storage_engine_name
+ {
+diff --git a/sql/sql_command.h b/sql/sql_command.h
+new file mode 100644
+index 00000000000..896b1650bf4
+--- /dev/null
++++ b/sql/sql_command.h
+@@ -0,0 +1,112 @@
++/* Copyright (c) 2009, 2010, Oracle and/or its affiliates. All rights reserved.
++
++   This program is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by
++   the Free Software Foundation; version 2 of the License.
++
++   This program is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++   GNU General Public License for more details.
++
++   You should have received a copy of the GNU General Public License
++   along with this program; if not, write to the Free Software
++   Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1335  USA */
++
++/*
++  When a command is added here, be sure it's also added in mysqld.cc
++  in "struct show_var_st status_vars[]= {" ...
++
++  If the command returns a result set or is not allowed in stored
++  functions or triggers, please also make sure that
++  sp_get_flags_for_command (sp_head.cc) returns proper flags for the
++  added SQLCOM_.
++*/
++
++enum enum_sql_command {
++  SQLCOM_SELECT, SQLCOM_CREATE_TABLE, SQLCOM_CREATE_INDEX, SQLCOM_ALTER_TABLE,
++  SQLCOM_UPDATE, SQLCOM_INSERT, SQLCOM_INSERT_SELECT,
++  SQLCOM_DELETE, SQLCOM_TRUNCATE, SQLCOM_DROP_TABLE, SQLCOM_DROP_INDEX,
++
++  SQLCOM_SHOW_DATABASES, SQLCOM_SHOW_TABLES, SQLCOM_SHOW_FIELDS,
++  SQLCOM_SHOW_KEYS, SQLCOM_SHOW_VARIABLES, SQLCOM_SHOW_STATUS,
++  SQLCOM_SHOW_ENGINE_LOGS, SQLCOM_SHOW_ENGINE_STATUS, SQLCOM_SHOW_ENGINE_MUTEX,
++  SQLCOM_SHOW_PROCESSLIST, SQLCOM_SHOW_BINLOG_STAT, SQLCOM_SHOW_SLAVE_STAT,
++  SQLCOM_SHOW_GRANTS, SQLCOM_SHOW_CREATE, SQLCOM_SHOW_CHARSETS,
++  SQLCOM_SHOW_COLLATIONS, SQLCOM_SHOW_CREATE_DB, SQLCOM_SHOW_TABLE_STATUS,
++  SQLCOM_SHOW_TRIGGERS,
++
++  SQLCOM_LOAD,SQLCOM_SET_OPTION,SQLCOM_LOCK_TABLES,SQLCOM_UNLOCK_TABLES,
++  SQLCOM_GRANT,
++  SQLCOM_CHANGE_DB, SQLCOM_CREATE_DB, SQLCOM_DROP_DB, SQLCOM_ALTER_DB,
++  SQLCOM_REPAIR, SQLCOM_REPLACE, SQLCOM_REPLACE_SELECT,
++  SQLCOM_CREATE_FUNCTION, SQLCOM_DROP_FUNCTION,
++  SQLCOM_REVOKE,SQLCOM_OPTIMIZE, SQLCOM_CHECK,
++  SQLCOM_ASSIGN_TO_KEYCACHE, SQLCOM_PRELOAD_KEYS,
++  SQLCOM_FLUSH, SQLCOM_KILL, SQLCOM_ANALYZE,
++  SQLCOM_ROLLBACK, SQLCOM_ROLLBACK_TO_SAVEPOINT,
++  SQLCOM_COMMIT, SQLCOM_SAVEPOINT, SQLCOM_RELEASE_SAVEPOINT,
++  SQLCOM_SLAVE_START, SQLCOM_SLAVE_STOP,
++  SQLCOM_BEGIN, SQLCOM_CHANGE_MASTER,
++  SQLCOM_RENAME_TABLE,
++  SQLCOM_RESET, SQLCOM_PURGE, SQLCOM_PURGE_BEFORE, SQLCOM_SHOW_BINLOGS,
++  SQLCOM_SHOW_OPEN_TABLES,
++  SQLCOM_HA_OPEN, SQLCOM_HA_CLOSE, SQLCOM_HA_READ,
++  SQLCOM_SHOW_SLAVE_HOSTS, SQLCOM_DELETE_MULTI, SQLCOM_UPDATE_MULTI,
++  SQLCOM_SHOW_BINLOG_EVENTS, SQLCOM_DO,
++  SQLCOM_SHOW_WARNS, SQLCOM_EMPTY_QUERY, SQLCOM_SHOW_ERRORS,
++  SQLCOM_SHOW_STORAGE_ENGINES, SQLCOM_SHOW_PRIVILEGES,
++  SQLCOM_HELP, SQLCOM_CREATE_USER, SQLCOM_DROP_USER, SQLCOM_RENAME_USER,
++  SQLCOM_REVOKE_ALL, SQLCOM_CHECKSUM,
++  SQLCOM_CREATE_PROCEDURE, SQLCOM_CREATE_SPFUNCTION, SQLCOM_CALL,
++  SQLCOM_DROP_PROCEDURE, SQLCOM_ALTER_PROCEDURE,SQLCOM_ALTER_FUNCTION,
++  SQLCOM_SHOW_CREATE_PROC, SQLCOM_SHOW_CREATE_FUNC,
++  SQLCOM_SHOW_STATUS_PROC, SQLCOM_SHOW_STATUS_FUNC,
++  SQLCOM_PREPARE, SQLCOM_EXECUTE, SQLCOM_DEALLOCATE_PREPARE,
++  SQLCOM_CREATE_VIEW, SQLCOM_DROP_VIEW,
++  SQLCOM_CREATE_TRIGGER, SQLCOM_DROP_TRIGGER,
++  SQLCOM_XA_START, SQLCOM_XA_END, SQLCOM_XA_PREPARE,
++  SQLCOM_XA_COMMIT, SQLCOM_XA_ROLLBACK, SQLCOM_XA_RECOVER,
++  SQLCOM_SHOW_PROC_CODE, SQLCOM_SHOW_FUNC_CODE,
++  SQLCOM_INSTALL_PLUGIN, SQLCOM_UNINSTALL_PLUGIN,
++  SQLCOM_SHOW_AUTHORS, SQLCOM_BINLOG_BASE64_EVENT,
++  SQLCOM_SHOW_PLUGINS, SQLCOM_SHOW_CONTRIBUTORS,
++  SQLCOM_CREATE_SERVER, SQLCOM_DROP_SERVER, SQLCOM_ALTER_SERVER,
++  SQLCOM_CREATE_EVENT, SQLCOM_ALTER_EVENT, SQLCOM_DROP_EVENT,
++  SQLCOM_SHOW_CREATE_EVENT, SQLCOM_SHOW_EVENTS,
++  SQLCOM_SHOW_CREATE_TRIGGER,
++  SQLCOM_ALTER_DB_UPGRADE,
++  SQLCOM_SHOW_PROFILE, SQLCOM_SHOW_PROFILES,
++  SQLCOM_SIGNAL, SQLCOM_RESIGNAL,
++  SQLCOM_SHOW_RELAYLOG_EVENTS,
++  SQLCOM_GET_DIAGNOSTICS,
++  SQLCOM_SLAVE_ALL_START, SQLCOM_SLAVE_ALL_STOP,
++  SQLCOM_SHOW_EXPLAIN,
++  SQLCOM_SHOW_ANALYZE, SQLCOM_SHUTDOWN,
++  SQLCOM_CREATE_ROLE, SQLCOM_DROP_ROLE, SQLCOM_GRANT_ROLE, SQLCOM_REVOKE_ROLE,
++  SQLCOM_COMPOUND,
++  SQLCOM_SHOW_GENERIC,
++  SQLCOM_ALTER_USER,
++  SQLCOM_SHOW_CREATE_USER,
++  SQLCOM_EXECUTE_IMMEDIATE,
++  SQLCOM_CREATE_SEQUENCE,
++  SQLCOM_DROP_SEQUENCE,
++  SQLCOM_ALTER_SEQUENCE,
++  SQLCOM_CREATE_PACKAGE,
++  SQLCOM_DROP_PACKAGE,
++  SQLCOM_CREATE_PACKAGE_BODY,
++  SQLCOM_DROP_PACKAGE_BODY,
++  SQLCOM_SHOW_CREATE_PACKAGE,
++  SQLCOM_SHOW_CREATE_PACKAGE_BODY,
++  SQLCOM_SHOW_STATUS_PACKAGE,
++  SQLCOM_SHOW_STATUS_PACKAGE_BODY,
++  SQLCOM_SHOW_PACKAGE_BODY_CODE,
++  SQLCOM_BACKUP, SQLCOM_BACKUP_LOCK,
++
++  /*
++    When a command is added here, be sure it's also added in mysqld.cc
++    in "struct show_var_st com_status_vars[]= {" ...
++  */
++  /* This should be the last !!! */
++  SQLCOM_END
++};
+-- 
+2.43.7
+
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/CVE-2026-3494_p2.patch b/meta-oe/recipes-dbs/mysql/mariadb/CVE-2026-3494_p2.patch
new file mode 100644
index 0000000000..fd16cca85f
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/CVE-2026-3494_p2.patch
@@ -0,0 +1,105 @@
+From 7252aaf6d829fefccc941e0537eb2c836c3b1aad Mon Sep 17 00:00:00 2001
+From: Sergei Golubchik <serg@mariadb.org>
+Date: Sat, 27 Dec 2025 11:35:01 +0100
+Subject: [PATCH] MDEV-38375 do MYSQL_AUDIT_GENERAL_STATUS on ps execute
+ too
+
+just like slow logging, MYSQL_AUDIT_GENERAL_STATUS
+should be done inside Prepared_statement::execute()
+
+CVE: CVE-2026-3494
+Upstream-Status: Backport [https://github.com/MariaDB/server/commit/317fb109153b45091003f0b1380b5d68522fce29]
+
+(cherry picked from commit 317fb109153b45091003f0b1380b5d68522fce29)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ sql/sql_parse.cc   | 23 ++++++++++++-----------
+ sql/sql_prepare.cc |  5 +++++
+ 2 files changed, 17 insertions(+), 11 deletions(-)
+
+diff --git a/sql/sql_parse.cc b/sql/sql_parse.cc
+index 3b9ac4a7c79..bc5dd1e226f 100644
+--- a/sql/sql_parse.cc
++++ b/sql/sql_parse.cc
+@@ -1591,6 +1591,7 @@ dispatch_command_return dispatch_command(enum enum_server_command command, THD *
+   NET *net= &thd->net;
+   bool error= 0;
+   bool do_end_of_statement= true;
++  bool log_slow_done= false;
+   DBUG_ENTER("dispatch_command");
+   DBUG_PRINT("info", ("command: %d %s", command,
+                       (command_name[command].str != 0 ?
+@@ -1817,6 +1818,7 @@ dispatch_command_return dispatch_command(enum enum_server_command command, THD *
+   case COM_STMT_BULK_EXECUTE:
+   {
+     mysqld_stmt_bulk_execute(thd, packet, packet_length);
++    log_slow_done= true;
+ #ifdef WITH_WSREP
+     if (WSREP(thd))
+     {
+@@ -1828,6 +1830,7 @@ dispatch_command_return dispatch_command(enum enum_server_command command, THD *
+   case COM_STMT_EXECUTE:
+   {
+     mysqld_stmt_execute(thd, packet, packet_length);
++    log_slow_done= true;
+ #ifdef WITH_WSREP
+     if (WSREP(thd))
+     {
+@@ -2004,6 +2007,7 @@ dispatch_command_return dispatch_command(enum enum_server_command command, THD *
+       mysql_parse(thd, beginning_of_next_stmt, length, &parser_state);
+ 
+     }
++    log_slow_done= thd->lex->sql_command == SQLCOM_EXECUTE;
+ 
+     DBUG_PRINT("info",("query ready"));
+     break;
+@@ -2457,22 +2461,19 @@ dispatch_command_return dispatch_command(enum enum_server_command command, THD *
+   if (likely(!thd->is_error() && !thd->killed_errno()))
+     mysql_audit_general(thd, MYSQL_AUDIT_GENERAL_RESULT, 0, 0);
+ 
+-  mysql_audit_general(thd, MYSQL_AUDIT_GENERAL_STATUS,
+-                      thd->get_stmt_da()->is_error() ?
+-                      thd->get_stmt_da()->sql_errno() : 0,
+-                      command_name[command].str);
++  if (!log_slow_done)
++    mysql_audit_general(thd, MYSQL_AUDIT_GENERAL_STATUS,
++                        thd->get_stmt_da()->is_error() ?
++                        thd->get_stmt_da()->sql_errno() : 0,
++                        command_name[command].str);
+ 
+   thd->update_all_stats();
+ 
+   /*
+-    Write to slow query log only those statements that received via the text
+-    protocol except the EXECUTE statement. The reason we do that way is
+-    that for statements received via binary protocol and for the EXECUTE
+-    statement, the slow statements have been already written to slow query log
+-    inside the method Prepared_statement::execute().
++    for backward compatibility we only log COM_QUERY here,
++    as if COM_STMT_PREPARE or COM_FIELD_LIST couldn't be slow.
+   */
+-  if(command == COM_QUERY &&
+-     thd->lex->sql_command != SQLCOM_EXECUTE)
++  if (command == COM_QUERY && !log_slow_done)
+     log_slow_statement(thd);
+   else
+     delete_explain_query(thd->lex);
+diff --git a/sql/sql_prepare.cc b/sql/sql_prepare.cc
+index ad5829ea488..5caf1721a3e 100644
+--- a/sql/sql_prepare.cc
++++ b/sql/sql_prepare.cc
+@@ -5314,6 +5314,11 @@ bool Prepared_statement::execute(String *expanded_query, bool open_cursor)
+     */
+     cleanup_stmt(false);
+ 
++  mysql_audit_general(thd, MYSQL_AUDIT_GENERAL_STATUS,
++                      thd->get_stmt_da()->is_error() ?
++                      thd->get_stmt_da()->sql_errno() : 0,
++                      command_name[thd->get_command()].str);
++
+   /*
+     Log the statement to slow query log if it passes filtering.
+     We do it here for prepared statements despite of the fact that the function
+-- 
+2.43.7
+
-- 
2.44.1


