Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id BBD377FA20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 18:31:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 472gCL4dGnzQN
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 19:31:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572373886;
	bh=1yuBmf0HMx5T709Pz4Ht5D1qevBIzvz88R+27wRl6RI=;
	h=From:To:Subject:Date:From;
	b=TopiDkD3kF9kjz2UOd0hwwQfbrJSRN7KFtX688qKIYb9nNnVF7mAL9jIxciYZ+Lz0
	zGBknm37xPbkU1S/HEP2A8mp0lWMFDf8McY7bd406N48Vqi15w0iD6CiPS1x4OiYQA
	X3zrwRhirW/YGFK/LXhfUkBdzm2i0PkTuSNXIoyL58Q4AK++1FNwM1jC6e6xDQfs8o
	1p0iRCeJXggbpVpY1t0iZLD77m18w9A/rA64ohCVDxgWyxU4Ji5AdNHTlSq8gW6zkP
	9g/qmtzDCBZ2+B5zZ9LC50OPytZutlPKPL/g1PSgS/qsyKUIUDkN3H0oaenhXosFMF
	F9ceUwj8UkHArHwOmghWCW4CDrXvZEuimyLvc0mq9Wyg3iQwy7kY5oOlqrwEqIYKJi
	fvLDqFnkCQRRjUfLJAH7hDQI6ujftpaOJq/wZBTOlDMJAT/LACmAP8Fj4GEDTMJvI0
	LELBQbLXHTEA8AxN5JEMKsp28kyDZM7akVG96C2lb9QInHJK5A4VHaltEOb3zhzbN1
	72bP5yBfkMg3MKoKCoZv6gHkJuPSniRxahSXOqLUoEmL/wj3c+kBHYeV2pw4VENY81
	WO1WqBTyKGHt1wucezXvqOT86JFhX0T7zuu/WHVJ0VOZ/FUSH1L47N4ngAjX+Gxlgc
	8hwSFL4nkGp9XAdNgKfKv/UY=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Oct 2019 20:31:19 +0200
Message-Id: <20191029183123.1868-6-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] php: Upgrade 7.3.9 -> 7.3.11
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
X-List-Received-Date: Tue, 29 Oct 2019 18:31:27 -0000

Patch for issue fixed upstream removed.
Also merge the inc into the recipe.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...xt-intl-Use-pkg-config-to-detect-icu.patch | 161 ------------------
 .../php/{php.inc => php_7.3.11.bb}            |  12 ++
 meta-oe/recipes-devtools/php/php_7.3.9.bb     |  20 ---
 3 files changed, 12 insertions(+), 181 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/php/php/0049-ext-intl-Use-pkg-config-to-detect-icu.patch
 rename meta-oe/recipes-devtools/php/{php.inc => php_7.3.11.bb} (94%)
 delete mode 100644 meta-oe/recipes-devtools/php/php_7.3.9.bb

diff --git a/meta-oe/recipes-devtools/php/php/0049-ext-intl-Use-pkg-config-to-detect-icu.patch b/meta-oe/recipes-devtools/php/php/0049-ext-intl-Use-pkg-config-to-detect-icu.patch
deleted file mode 100644
index 2258c4c7f..000000000
--- a/meta-oe/recipes-devtools/php/php/0049-ext-intl-Use-pkg-config-to-detect-icu.patch
+++ /dev/null
@@ -1,161 +0,0 @@
-From 03fecab78f9fa747ad8ab3484e7ca00c0148321d Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Sun, 28 Apr 2019 16:45:02 +0800
-Subject: [PATCH] From: Hugh McMaster <hugh.mcmaster@outlook.com> Date: Wed, 5
- Dec 2018 23:27:30 +1100 Subject: ext/intl: Use pkg-config to detect icu
-
-The developers of icu recommend using pkg-config to detect icu,
-because icu-config is deprecated.
-
-Upstream-Status: Pending
-
-update to version 7.3.4
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- acinclude.m4       | 95 ++++++------------------------------------------------
- ext/intl/config.m4 | 16 ++++-----
- 2 files changed, 15 insertions(+), 96 deletions(-)
-
-diff --git a/acinclude.m4 b/acinclude.m4
-index 7d77c33..86b0ecc 100644
---- a/acinclude.m4
-+++ b/acinclude.m4
-@@ -2158,92 +2158,15 @@ dnl
- dnl Common setup macro for ICU
- dnl
- AC_DEFUN([PHP_SETUP_ICU],[
--  PHP_ARG_WITH(icu-dir,,
--  [  --with-icu-dir=DIR      Specify where ICU libraries and headers can be found], DEFAULT, no)
--
--  if test "$PHP_ICU_DIR" = "no"; then
--    PHP_ICU_DIR=DEFAULT
--  fi
--
--  AC_MSG_CHECKING([for location of ICU headers and libraries])
--  found_icu=no
--
--  dnl First try to find pkg-config
--  if test -z "$PKG_CONFIG"; then
--    AC_PATH_PROG(PKG_CONFIG, pkg-config, no)
--  fi
--
--  dnl If pkg-config is found try using it
--  if test "$PHP_ICU_DIR" = "DEFAULT" && test -x "$PKG_CONFIG" && $PKG_CONFIG --exists icu-uc icu-io icu-i18n; then
--    if $PKG_CONFIG --atleast-version=40 icu-uc; then
--      found_icu=yes
--      icu_version_full=`$PKG_CONFIG --modversion icu-uc`
--      ac_IFS=$IFS
--      IFS="."
--      set $icu_version_full
--      IFS=$ac_IFS
--      icu_version=`expr [$]1 \* 1000 + [$]2`
--      AC_MSG_RESULT([found $icu_version_full])
--
--      ICU_LIBS=`$PKG_CONFIG --libs icu-uc icu-io icu-i18n`
--      ICU_INCS=`$PKG_CONFIG --cflags-only-I icu-uc icu-io icu-i18n`
--      ICU_CXXFLAGS="-DU_USING_ICU_NAMESPACE=1"
--
--      AC_MSG_RESULT([found $ICU_VERSION])
--
--      PHP_EVAL_LIBLINE($ICU_LIBS, $1)
--      PHP_EVAL_INCLINE($ICU_INCS)
--    else
--      AC_MSG_ERROR([ICU version 4.0 or later required.])
--    fi
--  fi
--
--  dnl If pkg-config fails for some reason, revert to the old method
--  if test "$found_icu" = "no"; then
--    if test "$PHP_ICU_DIR" = "DEFAULT"; then
--      dnl Try to find icu-config
--      AC_PATH_PROG(ICU_CONFIG, icu-config, no, [$PATH:/usr/local/bin])
--    else
--      ICU_CONFIG="$PHP_ICU_DIR/bin/icu-config"
--    fi
--
--    dnl Trust icu-config to know better what the install prefix is..
--    icu_install_prefix=`$ICU_CONFIG --prefix 2> /dev/null`
--    if test "$?" != "0" || test -z "$icu_install_prefix"; then
--      AC_MSG_RESULT([not found])
--      AC_MSG_ERROR([Unable to detect ICU prefix or $ICU_CONFIG failed. Please verify ICU install prefix and make sure icu-config works.])
--    else
--      AC_MSG_RESULT([$icu_install_prefix])
--
--      dnl Check ICU version
--      AC_MSG_CHECKING([for ICU 4.0 or greater])
--      icu_version_full=`$ICU_CONFIG --version`
--      ac_IFS=$IFS
--      IFS="."
--      set $icu_version_full
--      IFS=$ac_IFS
--      icu_version=`expr [$]1 \* 1000 + [$]2`
--      AC_MSG_RESULT([found $icu_version_full])
--
--      if test "$icu_version" -lt "4000"; then
--        AC_MSG_ERROR([ICU version 4.0 or later is required])
--      fi
--
--      ICU_VERSION=$icu_version
--      ICU_INCS=`$ICU_CONFIG --cppflags-searchpath`
--      ICU_LIBS=`$ICU_CONFIG --ldflags --ldflags-icuio`
--      PHP_EVAL_INCLINE($ICU_INCS)
--      PHP_EVAL_LIBLINE($ICU_LIBS, $1)
--
--      ICU_CXXFLAGS=`$ICU_CONFIG --cxxflags`
--      if test "$icu_version" -ge "49000"; then
--        ICU_CXXFLAGS="$ICU_CXXFLAGS -DUNISTR_FROM_CHAR_EXPLICIT=explicit -DUNISTR_FROM_STRING_EXPLICIT=explicit"
--        ICU_CFLAGS="-DU_NO_DEFAULT_INCLUDE_UTF_HEADERS=1"
--      fi
--      if test "$icu_version" -ge "60000"; then
--        ICU_CFLAGS="$ICU_CFLAGS -DU_HIDE_OBSOLETE_UTF_OLD_H=1"
--      fi
--    fi
-+  PKG_CHECK_MODULES([ICU], [icu-io >= 50.1])
-+  PHP_EVAL_INCLINE($ICU_CFLAGS)
-+  PHP_EVAL_LIBLINE($ICU_LIBS, $1)
-+  
-+  ICU_CFLAGS="$ICU_CFLAGS -DU_NO_DEFAULT_INCLUDE_UTF_HEADERS=1"
-+  ICU_CXXFLAGS="$ICU_CXXFLAGS -DUNISTR_FROM_CHAR_EXPLICIT=explicit -DUNISTR_FROM_STRING_EXPLICIT=explicit"
-+  
-+  if $PKG_CONFIG icu-io --atleast-version=60; then
-+    ICU_CFLAGS="$ICU_CFLAGS -DU_HIDE_OBSOLETE_UTF_OLD_H=1"
-   fi
- ])
- 
-diff --git a/ext/intl/config.m4 b/ext/intl/config.m4
-index 4b9f469..fdae88a 100644
---- a/ext/intl/config.m4
-+++ b/ext/intl/config.m4
-@@ -9,15 +9,7 @@ if test "$PHP_INTL" != "no"; then
-   PHP_SETUP_ICU(INTL_SHARED_LIBADD)
-   PHP_SUBST(INTL_SHARED_LIBADD)
-   PHP_REQUIRE_CXX()
--  INTL_COMMON_FLAGS="$ICU_INCS $ICU_CFLAGS -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1"
--  if test "$icu_version" -ge "4002"; then
--    icu_spoof_src=" spoofchecker/spoofchecker_class.c \
--    spoofchecker/spoofchecker.c\
--    spoofchecker/spoofchecker_create.c\
--    spoofchecker/spoofchecker_main.c"
--  else
--    icu_spoof_src=""
--  fi
-+  INTL_COMMON_FLAGS="$ICU_CFLAGS -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1"
-   PHP_NEW_EXTENSION(intl, php_intl.c \
-     intl_error.c \
-     intl_convert.c \
-@@ -68,7 +60,11 @@ if test "$PHP_INTL" != "no"; then
-     transliterator/transliterator_methods.c \
-     uchar/uchar.c \
-     idn/idn.c \
--    $icu_spoof_src, $ext_shared,,$INTL_COMMON_FLAGS,cxx)
-+    spoofchecker/spoofchecker_class.c \
-+    spoofchecker/spoofchecker.c\
-+    spoofchecker/spoofchecker_create.c\
-+    spoofchecker/spoofchecker_main.c \
-+    , $ext_shared,,$INTL_COMMON_FLAGS,cxx)
- 
-   PHP_INTL_CXX_SOURCES="intl_convertcpp.cpp \
-     common/common_enum.cpp \
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php_7.3.11.bb
similarity index 94%
rename from meta-oe/recipes-devtools/php/php.inc
rename to meta-oe/recipes-devtools/php/php_7.3.11.bb
index 3d537e5b6..e7fb847fa 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php_7.3.11.bb
@@ -3,6 +3,7 @@ HOMEPAGE = "http://www.php.net"
 SECTION = "console/network"
 
 LICENSE = "PHP-3.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fb07bfc51f6d5e0c30b65d9701233b2e"
 
 BBCLASSEXTEND = "native"
 DEPENDS = "zlib bzip2 libxml2 virtual/libiconv php-native lemon-native"
@@ -12,6 +13,11 @@ PHP_MAJOR_VERSION = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "http://php.net/distributions/php-${PV}.tar.bz2 \
            file://0001-php-don-t-use-broken-wrapper-for-mkdir.patch \
+           file://0001-acinclude.m4-don-t-unset-cache-variables.patch \
+           file://0048-Use-pkg-config-for-FreeType2-detection.patch \
+           file://0001-Use-pkg-config-for-libxml2-detection.patch \
+           file://debian-php-fixheader.patch \
+           file://CVE-2019-6978.patch \
           "
 
 SRC_URI_append_class-target = " \
@@ -22,8 +28,14 @@ SRC_URI_append_class-target = " \
             file://php-fpm-apache.conf \
             file://70_mod_php${PHP_MAJOR_VERSION}.conf \
             file://php-fpm.service \
+            file://pear-makefile.patch \
+            file://phar-makefile.patch \
+            file://0001-opcache-config.m4-enable-opcache.patch \
+            file://xfail_two_bug_tests.patch \
           "
 S = "${WORKDIR}/php-${PV}"
+SRC_URI[md5sum] = "21b710b4126d4d54714de9693a6c7b0d"
+SRC_URI[sha256sum] = "92d1ff4b13c7093635f1ec338a5e6891ca99b10e65fbcadd527e5bb84d11b5e7"
 
 inherit autotools pkgconfig pythonnative gettext
 
diff --git a/meta-oe/recipes-devtools/php/php_7.3.9.bb b/meta-oe/recipes-devtools/php/php_7.3.9.bb
deleted file mode 100644
index a5c7b9b6b..000000000
--- a/meta-oe/recipes-devtools/php/php_7.3.9.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-require php.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=fb07bfc51f6d5e0c30b65d9701233b2e"
-
-SRC_URI += "file://0001-acinclude.m4-don-t-unset-cache-variables.patch \
-            file://0048-Use-pkg-config-for-FreeType2-detection.patch \
-            file://0049-ext-intl-Use-pkg-config-to-detect-icu.patch \
-            file://0001-Use-pkg-config-for-libxml2-detection.patch \
-            file://debian-php-fixheader.patch \
-            file://CVE-2019-6978.patch \
-           "
-SRC_URI_append_class-target = " \
-                                file://pear-makefile.patch \
-                                file://phar-makefile.patch \
-                                file://0001-opcache-config.m4-enable-opcache.patch \
-                                file://xfail_two_bug_tests.patch \
-                                "
-
-SRC_URI[md5sum] = "bcc37749815009c9201e4c126e1ab8ee"
-SRC_URI[sha256sum] = "a39c9709a8c9eb7ea8ac4933ef7a78b92f7e5735a405c8b8e42ee39541d963c4"
-- 
2.17.1


