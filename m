Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7787478E6C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Aug 2018 05:17:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w795HMJW002861
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Aug 2018 22:17:22 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Wed, 8 Aug 2018 22:17:22 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 9 Aug 2018 13:16:49 +0800
Message-ID: <1533791809-371521-5-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533791809-371521-1-git-send-email-changqing.li@windriver.com>
References: <1533791809-371521-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH][meta-oe] postgresql: upgrade 9.4.18 -> 10.4
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
X-List-Received-Date: Thu, 09 Aug 2018 05:17:21 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...0001-Use-pkg-config-for-libxml2-detection.patch | 30 +++++++++++++---------
 meta-oe/recipes-dbs/postgresql/postgresql_10.4.bb  | 10 ++++++++
 .../recipes-dbs/postgresql/postgresql_9.4.18.bb    | 13 ----------
 3 files changed, 28 insertions(+), 25 deletions(-)
 create mode 100644 meta-oe/recipes-dbs/postgresql/postgresql_10.4.bb
 delete mode 100644 meta-oe/recipes-dbs/postgresql/postgresql_9.4.18.bb

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch b/meta-oe/recipes-dbs/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch
index ce2a60c..f14da06 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch
@@ -1,26 +1,29 @@
-From d52e330be895bb8c5f0fb3e2884766acbd942a85 Mon Sep 17 00:00:00 2001
-From: Philip Balister <philip@balister.org>
-Date: Tue, 1 Jul 2014 09:40:44 -0400
-Subject: [PATCH] Use pkg-config for libxml2 detection.
+From d3ee8c8df5808b63e86f40831f2ba62cbb33d291 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 8 Aug 2018 09:18:27 +0800
+Subject: [PATCH] postgresql: Use pkg-config for libxml2 detection.
 
 Upstream-Status: Inappropriate [configuration]
 
 xml2-config does not work. Use pkgconfig to set CPPFLAGS and LIBS.
 
 Signed-off-by: Philip Balister <philip@balister.org>
+
+upate to version 10.4
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
  configure.in | 15 ++-------------
  1 file changed, 2 insertions(+), 13 deletions(-)
 
-Index: postgresql-9.4.15/configure.in
-===================================================================
---- postgresql-9.4.15.orig/configure.in
-+++ postgresql-9.4.15/configure.in
-@@ -759,19 +759,8 @@ PGAC_ARG_BOOL(with, libxml, no, [build w
+diff --git a/configure.in b/configure.in
+index d9fe56e..3e2cd3a 100644
+--- a/configure.in
++++ b/configure.in
+@@ -816,19 +816,8 @@ PGAC_ARG_BOOL(with, libxml, no, [build with XML support],
                [AC_DEFINE([USE_LIBXML], 1, [Define to 1 to build with XML support. (--with-libxml)])])
  
  if test "$with_libxml" = yes ; then
--  AC_CHECK_PROGS(XML2_CONFIG, xml2-config)
+-  PGAC_PATH_PROGS(XML2_CONFIG, xml2-config)
 -  if test -n "$XML2_CONFIG"; then
 -    for pgac_option in `$XML2_CONFIG --cflags`; do
 -      case $pgac_option in
@@ -33,8 +36,11 @@ Index: postgresql-9.4.15/configure.in
 -      esac
 -    done
 -  fi
-+  CPPFLAGS="$CPPFLAGS `pkg-config --short-errors --print-errors --cflags "libxml-2.0" 2>&1`"
-+  LIBS="`pkg-config --short-errors --print-errors --libs "libxml-2.0" 2>&1` $LIBS"
++    CPPFLAGS="$CPPFLAGS `pkg-config --short-errors --print-errors --cflags "libxml-2.0" 2>&1`"
++    LIBS="`pkg-config --short-errors --print-errors --libs "libxml-2.0" 2>&1` $LIBS"
  fi
  
  AC_SUBST(with_libxml)
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_10.4.bb b/meta-oe/recipes-dbs/postgresql/postgresql_10.4.bb
new file mode 100644
index 0000000..26c44a4
--- /dev/null
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_10.4.bb
@@ -0,0 +1,10 @@
+require postgresql.inc
+
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=6dc95e63aa4d72502ff8193dfe2ddd38"
+
+SRC_URI += "\
+    file://not-check-libperl.patch \
+"
+
+SRC_URI[md5sum] = "8e8770c289b3e0bdb779b5b171593479"
+SRC_URI[sha256sum] = "1b60812310bd5756c62d93a9f93de8c28ea63b0df254f428cd1cf1a4d9020048"
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_9.4.18.bb b/meta-oe/recipes-dbs/postgresql/postgresql_9.4.18.bb
deleted file mode 100644
index a306bca..0000000
--- a/meta-oe/recipes-dbs/postgresql/postgresql_9.4.18.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require postgresql.inc
-
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=6dc95e63aa4d72502ff8193dfe2ddd38"
-
-SRC_URI += "\
-    file://not-check-libperl.patch \
-"
-
-UPSTREAM_CHECK_URI = "http://ftp.postgresql.org/pub/source/"
-UPSTREAM_CHECK_REGEX = "(?P<pver>v9.4(\.\d+)+(-P\d+)*)/"
-
-SRC_URI[md5sum] = "4032f32af5afb0aa8f78f9a5639c0873"
-SRC_URI[sha256sum] = "428337f2b2f5e3ea21b8a44f88eb89c99a07a324559b99aebe777c9abdf4c4c0"
-- 
2.7.4


