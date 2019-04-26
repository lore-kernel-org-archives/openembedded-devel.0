Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0C70D7DA7C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Apr 2019 02:10:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x3Q2AW2l024261
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 25 Apr 2019 19:10:32 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 25 Apr 2019 19:10:32 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Thu, 25 Apr 2019 19:10:31 -0700
Message-ID: <20190426021031.20962-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190426021031.20962-1-mingli.yu@windriver.com>
References: <20190424071100.23092-1-mingli.yu@windriver.com>
	<20190426021031.20962-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 2/2] libdbd-mysql-perl: Upgrade to 4.050
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
X-List-Received-Date: Fri, 26 Apr 2019 02:10:33 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Update homepage and make SRC_URI to fetch
from git.

Remove one backported patch.

Add libdev-checklib-perl-native to DEPENDS as
the new libdbd-mysql-perl depends on another module
(Devel::CheckLib) at configure time.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../0001-Use-API-function-for-reconnect.patch | 53 -------------------
 ...rl_4.043.bb => libdbd-mysql-perl_4.050.bb} | 14 ++---
 2 files changed, 5 insertions(+), 62 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/perl/libdbd-mysql-perl/0001-Use-API-function-for-reconnect.patch
 rename meta-oe/recipes-devtools/perl/{libdbd-mysql-perl_4.043.bb => libdbd-mysql-perl_4.050.bb} (57%)

diff --git a/meta-oe/recipes-devtools/perl/libdbd-mysql-perl/0001-Use-API-function-for-reconnect.patch b/meta-oe/recipes-devtools/perl/libdbd-mysql-perl/0001-Use-API-function-for-reconnect.patch
deleted file mode 100644
index 60d88c3d1..000000000
--- a/meta-oe/recipes-devtools/perl/libdbd-mysql-perl/0001-Use-API-function-for-reconnect.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From edb6b202b7e233864aa5dd84532646c50097b0b8 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Mon, 4 Mar 2019 00:49:17 -0800
-Subject: [PATCH] Use API function for reconnect
-
-For configuring reconnect functionality use standard API function
-MYSQL_OPT_RECONNECT instead of direct modification of internal structures
-which does not work for MariaDB. Fixes compilation with MariaDB 10.2.6+.
-
-Upstream-Status: Backport [https://github.com/perl5-dbi/DBD-mysql/commit/0b1884f4153d3de0a91bae4d3b3cc1771ffdf4f3]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- dbdimp.c | 16 ++++++++++------
- 1 file changed, 10 insertions(+), 6 deletions(-)
-
-diff --git a/dbdimp.c b/dbdimp.c
-index 9b8b313..3bed213 100644
---- a/dbdimp.c
-+++ b/dbdimp.c
-@@ -1979,6 +1979,16 @@ MYSQL *mysql_dr_connect(
- 
-     if (result)
-     {
-+      /*
-+        we turn off Mysql's auto reconnect and handle re-connecting ourselves
-+        so that we can keep track of when this happens.
-+      */
-+#if MYSQL_VERSION_ID >= 50013
-+      my_bool reconnect = FALSE;
-+      mysql_options(result, MYSQL_OPT_RECONNECT, &reconnect);
-+#else
-+      result->reconnect = 0;
-+#endif
- #if MYSQL_VERSION_ID >=SERVER_PREPARE_VERSION
-       /* connection succeeded. */
-       /* imp_dbh == NULL when mysql_dr_connect() is called from mysql.xs
-@@ -1992,12 +2002,6 @@ MYSQL *mysql_dr_connect(
-           imp_dbh->async_query_in_flight = NULL;
-       }
- #endif
--
--      /*
--        we turn off Mysql's auto reconnect and handle re-connecting ourselves
--        so that we can keep track of when this happens.
--      */
--      result->reconnect=0;
-     }
-     else {
-       /* 
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.043.bb b/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.050.bb
similarity index 57%
rename from meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.043.bb
rename to meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.050.bb
index e185f48f7..049dc665d 100644
--- a/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.043.bb
+++ b/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.050.bb
@@ -6,21 +6,17 @@ with the MySQL relational database management system. Most functions \
 provided by this programming API are supported. Some rarely used \
 functions are missing, mainly because no-one ever requested them. \
 "
-HOMEPAGE = "http://search.cpan.org/~michielb/DBD-mysql-4.036/lib/DBD/mysql.pm"
+HOMEPAGE = "https://github.com/perl5-dbi/DBD-mysql"
 
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-DEPENDS += "libdbi-perl-native libmysqlclient"
+DEPENDS += "libdev-checklib-perl-native libdbi-perl-native libmysqlclient"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d0a06964340e5c0cde88b7af611f755c"
 
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MI/MICHIELB/DBD-mysql-${PV}.tar.gz \
-           file://0001-Use-API-function-for-reconnect.patch \
-"
-
-SRC_URI[md5sum] = "4a00dd7f1c057931147c65dfc4901c36"
-SRC_URI[sha256sum] = "629f865e8317f52602b2f2efd2b688002903d2e4bbcba5427cb6188b043d6f99"
+SRCREV = "9b5b70ea372f49fe9bc9e592dae3870596d1e3d6"
+SRC_URI = "git://github.com/perl5-dbi/DBD-mysql.git;protocol=https"
 
-S = "${WORKDIR}/DBD-mysql-${PV}"
+S = "${WORKDIR}/git"
 
 inherit cpan
-- 
2.17.1


