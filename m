Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.32118.1613977042083253233
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Feb 2021 22:57:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,196,1610380800"; 
   d="scan'208";a="104716598"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 Feb 2021 14:57:21 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 130524CE730B
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Feb 2021 14:57:17 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 22 Feb 2021 14:57:18 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] enca: upgrade 1.9 -> 1.19
Date: Tue, 23 Feb 2021 02:57:14 +0800
Message-ID: <1614020234-4745-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 130524CE730B.A18B2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

configure-hack.patch
configure-remove-dumbness.patch
Removed since these are included in 1.19.

Refresh the following patch:
libenca-003-iconv.patch
makefile-remove-tools.patch

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../enca/enca/configure-hack.patch            | 12 ---------
 .../enca/enca/configure-remove-dumbness.patch | 26 -------------------
 .../enca/enca/libenca-003-iconv.patch         |  6 ++---
 .../enca/enca/makefile-remove-tools.patch     |  7 +++--
 .../enca/{enca_1.9.bb => enca_1.19.bb}        |  4 +--
 5 files changed, 7 insertions(+), 48 deletions(-)
 delete mode 100644 meta-oe/recipes-support/enca/enca/configure-hack.patch
 delete mode 100644 meta-oe/recipes-support/enca/enca/configure-remove-dumbness.patch
 rename meta-oe/recipes-support/enca/{enca_1.9.bb => enca_1.19.bb} (83%)

diff --git a/meta-oe/recipes-support/enca/enca/configure-hack.patch b/meta-oe/recipes-support/enca/enca/configure-hack.patch
deleted file mode 100644
index 85abcdcf02..0000000000
--- a/meta-oe/recipes-support/enca/enca/configure-hack.patch
+++ /dev/null
@@ -1,12 +0,0 @@
---- enca-1.9/configure.ac.orig	2006-02-15 00:57:39.000000000 -0800
-+++ enca-1.9/configure.ac	2006-02-15 00:57:46.000000000 -0800
-@@ -92,9 +92,6 @@
- dnl And for gtk-doc
- gtk_CHECK_GTK_DOC
- 
--dnl Check for good random number sources
--AC_CHECK_FILES(/dev/random /dev/urandom /dev/srandom /dev/arandom)
--
- dnl Dirty path hack.  Helps some people with badly set up search paths.
- if test "$prefix" = "NONE"; then
-   LDFLAGS="$LDFLAGS -L$ac_default_prefix/lib"
diff --git a/meta-oe/recipes-support/enca/enca/configure-remove-dumbness.patch b/meta-oe/recipes-support/enca/enca/configure-remove-dumbness.patch
deleted file mode 100644
index 6f6f3e320e..0000000000
--- a/meta-oe/recipes-support/enca/enca/configure-remove-dumbness.patch
+++ /dev/null
@@ -1,26 +0,0 @@
---- enca-1.9/configure.ac.orig	2006-06-29 15:30:44.000000000 +0100
-+++ enca-1.9/configure.ac	2006-06-29 15:31:41.000000000 +0100
-@@ -92,14 +92,15 @@
- dnl And for gtk-doc
- gtk_CHECK_GTK_DOC
- 
--dnl Dirty path hack.  Helps some people with badly set up search paths.
--if test "$prefix" = "NONE"; then
--  LDFLAGS="$LDFLAGS -L$ac_default_prefix/lib"
--  CPPFLAGS="$CPPFLAGS -I$ac_default_prefix/include"
--else
--  LDFLAGS="$LDFLAGS -L$prefix/lib"
--  CPPFLAGS="$CPPFLAGS -I$prefix/include"
--fi
-+# This is really dumb code
-+#dnl Dirty path hack.  Helps some people with badly set up search paths.
-+#if test "$prefix" = "NONE"; then
-+#  LDFLAGS="$LDFLAGS -L$ac_default_prefix/lib"
-+#  CPPFLAGS="$CPPFLAGS -I$ac_default_prefix/include"
-+#else
-+#  LDFLAGS="$LDFLAGS -L$prefix/lib"
-+#  CPPFLAGS="$CPPFLAGS -I$prefix/include"
-+#fi
- 
- dnl Checks for libraries.
- ye_CHECK_LIBM
diff --git a/meta-oe/recipes-support/enca/enca/libenca-003-iconv.patch b/meta-oe/recipes-support/enca/enca/libenca-003-iconv.patch
index dbf0fb8ea7..baf5547642 100644
--- a/meta-oe/recipes-support/enca/enca/libenca-003-iconv.patch
+++ b/meta-oe/recipes-support/enca/enca/libenca-003-iconv.patch
@@ -17,12 +17,12 @@ index fc8c6f8..3a59549 100644
 +++ b/m4/libiconv.m4
 @@ -17,7 +17,7 @@ AC_REQUIRE([AC_C_CONST])dnl
  dnl
- 
+
  dnl Use standard iconv test
 -AM_ICONV
 +m4_pattern_allow([AM_ICONV])
- CONVERTOR_LIBS="$CONVERTOR_LIBS $LIBICONV"
- 
+ CONVERTER_LIBS="$CONVERTER_LIBS $LIBICONV"
+
  dnl Compile iconvcap.c and run it to determine what encodings iconv actually
 -- 
 1.9.3
diff --git a/meta-oe/recipes-support/enca/enca/makefile-remove-tools.patch b/meta-oe/recipes-support/enca/enca/makefile-remove-tools.patch
index accfbccd6b..48497d68c8 100644
--- a/meta-oe/recipes-support/enca/enca/makefile-remove-tools.patch
+++ b/meta-oe/recipes-support/enca/enca/makefile-remove-tools.patch
@@ -1,7 +1,6 @@
---- enca-1.9/Makefile.am.orig	2006-06-29 15:34:55.000000000 +0100
-+++ enca-1.9/Makefile.am	2006-06-29 15:35:20.000000000 +0100
-@@ -1,8 +1,8 @@
- # @(#) $Id: Makefile.am,v 1.35 2005/11/24 10:21:32 yeti Exp $
+--- enca-1.19/Makefile.am.orig	2006-06-29 15:34:55.000000000 +0100
++++ enca-1.19/Makefile.am	2006-06-29 15:35:20.000000000 +0100
+@@ -1,7 +1,7 @@
  if MAINTAINER_MODE
 -SUBDIRS = tools data script lib src devel-docs test
 +SUBDIRS = data script lib src devel-docs test
diff --git a/meta-oe/recipes-support/enca/enca_1.9.bb b/meta-oe/recipes-support/enca/enca_1.19.bb
similarity index 83%
rename from meta-oe/recipes-support/enca/enca_1.9.bb
rename to meta-oe/recipes-support/enca/enca_1.19.bb
index b0ba3aedef..0adf0a29c5 100644
--- a/meta-oe/recipes-support/enca/enca_1.9.bb
+++ b/meta-oe/recipes-support/enca/enca_1.19.bb
@@ -8,13 +8,11 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=24b9569831c46d4818450b55282476b4"
 
 SRC_URI = "https://dl.cihar.com/enca/enca-${PV}.tar.gz \
-    file://configure-hack.patch \
     file://dont-run-tests.patch \
-    file://configure-remove-dumbness.patch \
     file://makefile-remove-tools.patch \
     file://libenca-003-iconv.patch "
 
-SRC_URI[sha256sum] = "75a38ed23bac37cc12166cc5edc8335c3af862adc202f84823d3aef3e2208e47"
+SRC_URI[sha256sum] = "4c305cc59f3e57f2cfc150a6ac511690f43633595760e1cb266bf23362d72f8a"
 
 inherit autotools
 
-- 
2.25.1



