Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 451417C82B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Mar 2019 05:30:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x255TM6D030319
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 4 Mar 2019 21:29:42 -0800
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 4 Mar 2019 21:29:31 -0800
From: <mingli.yu@windriver.com>
To: <raj.khem@gmail.com>, <randy.macleod@windriver.com>,
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 4 Mar 2019 21:28:59 -0800
Message-ID: <20190305052859.14220-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190305052859.14220-1-mingli.yu@windriver.com>
References: <20190305052859.14220-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] libdbd-mysql-perl: fix do_compile failure
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Mar 2019 05:30:02 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

After mariadb upgrade to 10.3.13, there comes
below do_compile failure for libdbd-mysql-perl:
| dbdimp.c: In function 'mysql_dr_connect':
| dbdimp.c:2000:13: error: 'MYSQL' {aka 'struct st_mysql'} has no member named 'reconnect'
|        result->reconnect=0;

Backport a patch to fix it.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../0001-Use-API-function-for-reconnect.patch | 53 +++++++++++++++++++
 .../perl/libdbd-mysql-perl_4.043.bb           |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/perl/libdbd-mysql-perl/0001-Use-API-function-for-reconnect.patch

diff --git a/meta-oe/recipes-devtools/perl/libdbd-mysql-perl/0001-Use-API-function-for-reconnect.patch b/meta-oe/recipes-devtools/perl/libdbd-mysql-perl/0001-Use-API-function-for-reconnect.patch
new file mode 100644
index 000000000..60d88c3d1
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libdbd-mysql-perl/0001-Use-API-function-for-reconnect.patch
@@ -0,0 +1,53 @@
+From edb6b202b7e233864aa5dd84532646c50097b0b8 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Mon, 4 Mar 2019 00:49:17 -0800
+Subject: [PATCH] Use API function for reconnect
+
+For configuring reconnect functionality use standard API function
+MYSQL_OPT_RECONNECT instead of direct modification of internal structures
+which does not work for MariaDB. Fixes compilation with MariaDB 10.2.6+.
+
+Upstream-Status: Backport [https://github.com/perl5-dbi/DBD-mysql/commit/0b1884f4153d3de0a91bae4d3b3cc1771ffdf4f3]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ dbdimp.c | 16 ++++++++++------
+ 1 file changed, 10 insertions(+), 6 deletions(-)
+
+diff --git a/dbdimp.c b/dbdimp.c
+index 9b8b313..3bed213 100644
+--- a/dbdimp.c
++++ b/dbdimp.c
+@@ -1979,6 +1979,16 @@ MYSQL *mysql_dr_connect(
+ 
+     if (result)
+     {
++      /*
++        we turn off Mysql's auto reconnect and handle re-connecting ourselves
++        so that we can keep track of when this happens.
++      */
++#if MYSQL_VERSION_ID >= 50013
++      my_bool reconnect = FALSE;
++      mysql_options(result, MYSQL_OPT_RECONNECT, &reconnect);
++#else
++      result->reconnect = 0;
++#endif
+ #if MYSQL_VERSION_ID >=SERVER_PREPARE_VERSION
+       /* connection succeeded. */
+       /* imp_dbh == NULL when mysql_dr_connect() is called from mysql.xs
+@@ -1992,12 +2002,6 @@ MYSQL *mysql_dr_connect(
+           imp_dbh->async_query_in_flight = NULL;
+       }
+ #endif
+-
+-      /*
+-        we turn off Mysql's auto reconnect and handle re-connecting ourselves
+-        so that we can keep track of when this happens.
+-      */
+-      result->reconnect=0;
+     }
+     else {
+       /* 
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.043.bb b/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.043.bb
index bd8ba780a..e185f48f7 100644
--- a/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.043.bb
+++ b/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.043.bb
@@ -15,6 +15,7 @@ DEPENDS += "libdbi-perl-native libmysqlclient"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d0a06964340e5c0cde88b7af611f755c"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MI/MICHIELB/DBD-mysql-${PV}.tar.gz \
+           file://0001-Use-API-function-for-reconnect.patch \
 "
 
 SRC_URI[md5sum] = "4a00dd7f1c057931147c65dfc4901c36"
-- 
2.17.1


