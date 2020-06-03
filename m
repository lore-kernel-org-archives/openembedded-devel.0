Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web10.13020.1591188806356751223
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jun 2020 05:53:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,467,1583164800"; 
   d="scan'208";a="93762371"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 03 Jun 2020 20:53:28 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id F0CB04BCC8A8
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Jun 2020 20:53:27 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 3 Jun 2020 20:53:27 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe][PATCH] postgresql: 12.2 -> 12.3
Date: Wed, 3 Jun 2020 20:53:12 +0800
Message-ID: <1591188793-15698-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1591188793-15698-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1591188793-15698-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: F0CB04BCC8A8.A5F89
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

0001-Use-pkg-config-for-libxml2-detection.patch
removed since it is not available in 12.3

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...Use-pkg-config-for-libxml2-detection.patch | 50 -------------------
 meta-oe/recipes-dbs/postgresql/postgresql.inc |  1 -
 ...{postgresql_12.2.bb => postgresql_12.3.bb} |  4 +-
 3 files changed, 2 insertions(+), 53 deletions(-)
 delete mode 100644 meta-oe/recipes-dbs/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch
 rename meta-oe/recipes-dbs/postgresql/{postgresql_12.2.bb => postgresql_12.3.bb} (63%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch b/meta-oe/recipes-dbs/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch
deleted file mode 100644
index 84cd5c157..000000000
--- a/meta-oe/recipes-dbs/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From d3ee8c8df5808b63e86f40831f2ba62cbb33d291 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Wed, 8 Aug 2018 09:18:27 +0800
-Subject: [PATCH] postgresql: Use pkg-config for libxml2 detection.
-
-Upstream-Status: Inappropriate [configuration]
-
-xml2-config does not work. Use pkgconfig to set CPPFLAGS and LIBS.
-
-Signed-off-by: Philip Balister <philip@balister.org>
-
-update to version 10.4
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
-Update for version 12.0
-Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
----
- configure.in | 16 ++--------------
- 1 file changed, 2 insertions(+), 14 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index 6942f81..7fd3e78 100644
---- a/configure.in
-+++ b/configure.in
-@@ -923,20 +923,8 @@ PGAC_ARG_BOOL(with, libxml, no, [build with XML support],
-               [AC_DEFINE([USE_LIBXML], 1, [Define to 1 to build with XML support. (--with-libxml)])])
- 
- if test "$with_libxml" = yes ; then
--  PGAC_PATH_PROGS(XML2_CONFIG, xml2-config)
--  AC_ARG_VAR(XML2_CONFIG, [path to xml2-config utility])dnl
--  if test -n "$XML2_CONFIG"; then
--    for pgac_option in `$XML2_CONFIG --cflags`; do
--      case $pgac_option in
--        -I*|-D*) CPPFLAGS="$CPPFLAGS $pgac_option";;
--      esac
--    done
--    for pgac_option in `$XML2_CONFIG --libs`; do
--      case $pgac_option in
--        -L*) LDFLAGS="$LDFLAGS $pgac_option";;
--      esac
--    done
--  fi
-+    CPPFLAGS="$CPPFLAGS `pkg-config --short-errors --print-errors --cflags "libxml-2.0" 2>&1`"
-+    LIBS="`pkg-config --short-errors --print-errors --libs "libxml-2.0" 2>&1` $LIBS"
- fi
- 
- AC_SUBST(with_libxml)
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index d35711c1e..5b20098a7 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -29,7 +29,6 @@ SRC_URI = "http://ftp.postgresql.org/pub/source/v${PV}/${BP}.tar.bz2 \
     file://postgresql.pam \
     file://postgresql-setup \
     file://postgresql.service \
-    file://0001-Use-pkg-config-for-libxml2-detection.patch \
 "
 
 LEAD_SONAME = "libpq.so"
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_12.2.bb b/meta-oe/recipes-dbs/postgresql/postgresql_12.3.bb
similarity index 63%
rename from meta-oe/recipes-dbs/postgresql/postgresql_12.2.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_12.3.bb
index 0613e50c7..cc7e3ff52 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_12.2.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_12.3.bb
@@ -8,5 +8,5 @@ SRC_URI += "\
    file://0001-Improve-reproducibility.patch \
 "
 
-SRC_URI[md5sum] = "a88ceea8ecf2741307f663e4539b58b7"
-SRC_URI[sha256sum] = "ad1dcc4c4fc500786b745635a9e1eba950195ce20b8913f50345bb7d5369b5de"
+SRC_URI[md5sum] = "a30c023dd7088e44d73be71af2ef404a"
+SRC_URI[sha256sum] = "94ed64a6179048190695c86ec707cc25d016056ce10fc9d229267d9a8f1dcf41"
-- 
2.17.1



