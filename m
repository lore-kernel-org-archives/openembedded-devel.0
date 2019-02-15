Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 761936010B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2019 02:27:29 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id u9so520296pgo.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2019 18:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2Ce26+FEudiUeF6uqqj9yNaBB5wLOe6zIFFbyyX3/Xc=;
	b=FhADfmZ4dpEY0l6AOvOkgxxE1pQCQ0WQa0EGo4JYiBb81M07VMkQXANyXQoGTSJGq+
	MRC5Qw+vuV40msbPNHKQsraENov5eipAI1oVclT0tCX/yWEpWxRDlnFOtzPiPQXAOBec
	/Idyl/p1NqaACdb65tTRDxSgJsjq+YB2iVw3VKHV5+vn7y0qrLqEZnHGvriOhg/pSLeI
	VmNV0kasjR+pde60JTTOW9Z2H5q1LwjWdOgzS+DbxlX2R+j5m03U2vx2mWgxwa50Yjp0
	ID44BGTtXxwZQ4bjsHo7WQ1rjXSRjQl3ZMV3kCiUEQAkxfOlNCkS8oUVgfIJKRLNHEGh
	OE8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2Ce26+FEudiUeF6uqqj9yNaBB5wLOe6zIFFbyyX3/Xc=;
	b=HpeJWlzoCF6hMeiNdzfJn2PlhtRiIurJNh1Xe7qeTOvxJEMNE5aoVthGnS5NGqKRmo
	U5dTUf4vRkJ4jhhOuVp1tUehSTObFb6IJqqzjpYUTgc1NeZp1xYmIkaGt6mWfo68YJIg
	f3ZCO4HxWJanziLlreT/x/3SaJhd1TFmDEVEYvbRJskq9t3s7Dne5KBU/arjpsgN+k0P
	8iZooUDvPXHp4nOy0Tn59Qw/08husm6nWUmFae7/5xA9JBuxc3BoKFC/p8oA1xMNknTc
	iGkRVknKtgMOEPap6x5hMt+fV8HMRTbQamUIK3cADg2abCMxzRbxXZIswZMB7bMGVcqj
	8Y2Q==
X-Gm-Message-State: AHQUAuZ++Lli6ZUv0mjsE1qh2rIBhLQNBijPZiReWDhkQ4fok8RzxhlP
	tqWkVaLCA4IjwSnJFvMhjSX2eFGJ
X-Google-Smtp-Source: AHgI3IYuTQe0tkzb/3BCw8iQxYPM5NSBH7bXsBpD1g2nNHgNCqTC41eHvA2cRLMHyXxtS2jN0GFLTw==
X-Received: by 2002:a62:444b:: with SMTP id r72mr7491482pfa.184.1550197649880; 
	Thu, 14 Feb 2019 18:27:29 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::dc44])
	by smtp.gmail.com with ESMTPSA id
	d13sm5374658pfd.58.2019.02.14.18.27.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Feb 2019 18:27:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Feb 2019 18:27:18 -0800
Message-Id: <20190215022718.24488-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] php_7.3.2.bb: Fix cross build on hosts which have libxml2 installed
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
X-List-Received-Date: Fri, 15 Feb 2019 02:27:29 -0000
Content-Transfer-Encoding: 8bit

libxml2 is not detected properly, it pokes at host and takes the
libraries and header files added to build which links in libraries like
libicu which may not be available in sysroot causing configure failures
like

checking for sqlite3 files in default path... found in TOPDIR/build/tmp/work/aarch64-yoe-linux/php/7.3.2-r0/recipe-sysroot/usr/lib/..
checking for SQLite 3.3.9+... checking for sqlite3_prepare_v2 in -lsqlite3... no
not found
configure: error: Please install SQLite 3.3.9 first or check libsqlite3 is present

the reason is configure test fails to find icu libraries since they were
added based on build host's libxml2.pc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Changqing Li <changqing.li@windriver.com>
---
 ...Use-pkg-config-for-libxml2-detection.patch |  23 ++++
 ...e-pkg-config-for-FreeType2-detection.patch |  53 +++++++++
 ...xt-intl-Use-pkg-config-to-detect-icu.patch | 111 ++++++++++++++++++
 meta-oe/recipes-devtools/php/php_7.3.2.bb     |   3 +
 4 files changed, 190 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/php/php/0001-Use-pkg-config-for-libxml2-detection.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/0048-Use-pkg-config-for-FreeType2-detection.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/0049-ext-intl-Use-pkg-config-to-detect-icu.patch

diff --git a/meta-oe/recipes-devtools/php/php/0001-Use-pkg-config-for-libxml2-detection.patch b/meta-oe/recipes-devtools/php/php/0001-Use-pkg-config-for-libxml2-detection.patch
new file mode 100644
index 0000000000..ccc6d4ede1
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/0001-Use-pkg-config-for-libxml2-detection.patch
@@ -0,0 +1,23 @@
+Use pkg-config for libxml2 detection.
+
+xml2-config does not work. Use pkgconfig to set CPPFLAGS and LIBS.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by:  Khem Raj <raj.khem@gmail.com>
+---
+ configure.in | 15 ++-------------
+ 1 file changed, 2 insertions(+), 13 deletions(-)
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -2481,8 +2481,8 @@ AC_DEFUN([PHP_SETUP_LIBXML], [
+     LIBXML_VERSION=`expr [$]1 \* 1000000 + [$]2 \* 1000 + [$]3`
+     if test "$LIBXML_VERSION" -ge "2006011"; then
+       found_libxml=yes
+-      LIBXML_LIBS=`$XML2_CONFIG --libs`
+-      LIBXML_INCS=`$XML2_CONFIG --cflags`
++      LIBXML_LIBS=`pkg-config --libs libxml-2.0`
++      LIBXML_INCS=`pkg-config --cflags libxml-2.0`
+     else
+       AC_MSG_ERROR([libxml2 version 2.6.11 or greater required.])
+     fi
diff --git a/meta-oe/recipes-devtools/php/php/0048-Use-pkg-config-for-FreeType2-detection.patch b/meta-oe/recipes-devtools/php/php/0048-Use-pkg-config-for-FreeType2-detection.patch
new file mode 100644
index 0000000000..f36ddac262
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/0048-Use-pkg-config-for-FreeType2-detection.patch
@@ -0,0 +1,53 @@
+From: =?utf-8?b?T25kxZllaiBTdXLDvQ==?= <ondrej@sury.org>
+Date: Mon, 22 Oct 2018 06:54:31 +0000
+Subject: Use pkg-config for FreeType2 detection
+
+---
+ ext/gd/config.m4 | 30 +++++++++++++++++++-----------
+ 1 file changed, 19 insertions(+), 11 deletions(-)
+
+diff --git a/ext/gd/config.m4 b/ext/gd/config.m4
+index 498d870..d28c6ae 100644
+--- a/ext/gd/config.m4
++++ b/ext/gd/config.m4
+@@ -184,21 +184,29 @@ AC_DEFUN([PHP_GD_XPM],[
+ AC_DEFUN([PHP_GD_FREETYPE2],[
+   if test "$PHP_FREETYPE_DIR" != "no"; then
+ 
+-    for i in $PHP_FREETYPE_DIR /usr/local /usr; do
+-      if test -f "$i/bin/freetype-config"; then
+-        FREETYPE2_DIR=$i
+-        FREETYPE2_CONFIG="$i/bin/freetype-config"
+-        break
++    if test -z "$PKG_CONFIG"; then
++      AC_PATH_PROG(PKG_CONFIG, pkg-config, no)
++    fi
++    if test -x "$PKG_CONFIG" && $PKG_CONFIG --exists freetype2 ; then
++      FREETYPE2_CFLAGS=`$PKG_CONFIG --cflags freetype2`
++      FREETYPE2_LIBS=`$PKG_CONFIG --libs freetype2`
++    else
++      for i in $PHP_FREETYPE_DIR /usr/local /usr; do
++        if test -f "$i/bin/freetype-config"; then
++          FREETYPE2_DIR=$i
++          FREETYPE2_CONFIG="$i/bin/freetype-config"
++          break
++        fi
++      done
++
++      if test -z "$FREETYPE2_DIR"; then
++        AC_MSG_ERROR([freetype-config not found.])
+       fi
+-    done
+ 
+-    if test -z "$FREETYPE2_DIR"; then
+-      AC_MSG_ERROR([freetype-config not found.])
++      FREETYPE2_CFLAGS=`$FREETYPE2_CONFIG --cflags`
++      FREETYPE2_LIBS=`$FREETYPE2_CONFIG --libs`
+     fi
+ 
+-    FREETYPE2_CFLAGS=`$FREETYPE2_CONFIG --cflags`
+-    FREETYPE2_LIBS=`$FREETYPE2_CONFIG --libs`
+-
+     PHP_EVAL_INCLINE($FREETYPE2_CFLAGS)
+     PHP_EVAL_LIBLINE($FREETYPE2_LIBS, GD_SHARED_LIBADD)
+     AC_DEFINE(HAVE_LIBFREETYPE,1,[ ])
diff --git a/meta-oe/recipes-devtools/php/php/0049-ext-intl-Use-pkg-config-to-detect-icu.patch b/meta-oe/recipes-devtools/php/php/0049-ext-intl-Use-pkg-config-to-detect-icu.patch
new file mode 100644
index 0000000000..deada1ff97
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/0049-ext-intl-Use-pkg-config-to-detect-icu.patch
@@ -0,0 +1,111 @@
+From: Hugh McMaster <hugh.mcmaster@outlook.com>
+Date: Wed, 5 Dec 2018 23:27:30 +1100
+Subject: ext/intl: Use pkg-config to detect icu
+
+The developers of icu recommend using pkg-config to detect icu,
+because icu-config is deprecated.
+---
+ acinclude.m4       | 56 +++++++-----------------------------------------------
+ ext/intl/config.m4 | 16 ++++++----------
+ 2 files changed, 13 insertions(+), 59 deletions(-)
+
+--- php7.3.orig/acinclude.m4
++++ php7.3/acinclude.m4
+@@ -2168,58 +2168,16 @@ dnl
+ dnl Common setup macro for ICU
+ dnl
+ AC_DEFUN([PHP_SETUP_ICU],[
+-  PHP_ARG_WITH(icu-dir,,
+-  [  --with-icu-dir=DIR      Specify where ICU libraries and headers can be found], DEFAULT, no)
++  PKG_CHECK_MODULES([ICU], [icu-io >= 50.1])
+ 
+-  if test "$PHP_ICU_DIR" = "no"; then
+-    PHP_ICU_DIR=DEFAULT
+-  fi
+-
+-  if test "$PHP_ICU_DIR" = "DEFAULT"; then
+-    dnl Try to find icu-config
+-    AC_PATH_PROG(ICU_CONFIG, icu-config, no, [$PATH:/usr/local/bin])
+-  else
+-    ICU_CONFIG="$PHP_ICU_DIR/bin/icu-config"
+-  fi
+-
+-  AC_MSG_CHECKING([for location of ICU headers and libraries])
+-
+-  dnl Trust icu-config to know better what the install prefix is..
+-  icu_install_prefix=`$ICU_CONFIG --prefix 2> /dev/null`
+-  if test "$?" != "0" || test -z "$icu_install_prefix"; then
+-    AC_MSG_RESULT([not found])
+-    AC_MSG_ERROR([Unable to detect ICU prefix or $ICU_CONFIG failed. Please verify ICU install prefix and make sure icu-config works.])
+-  else
+-    AC_MSG_RESULT([$icu_install_prefix])
+-
+-    dnl Check ICU version
+-    AC_MSG_CHECKING([for ICU 4.0 or greater])
+-    icu_version_full=`$ICU_CONFIG --version`
+-    ac_IFS=$IFS
+-    IFS="."
+-    set $icu_version_full
+-    IFS=$ac_IFS
+-    icu_version=`expr [$]1 \* 1000 + [$]2`
+-    AC_MSG_RESULT([found $icu_version_full])
+-
+-    if test "$icu_version" -lt "4000"; then
+-      AC_MSG_ERROR([ICU version 4.0 or later is required])
+-    fi
++  PHP_EVAL_INCLINE($ICU_CFLAGS)
++  PHP_EVAL_LIBLINE($ICU_LIBS, $1)
+ 
+-    ICU_VERSION=$icu_version
+-    ICU_INCS=`$ICU_CONFIG --cppflags-searchpath`
+-    ICU_LIBS=`$ICU_CONFIG --ldflags --ldflags-icuio`
+-    PHP_EVAL_INCLINE($ICU_INCS)
+-    PHP_EVAL_LIBLINE($ICU_LIBS, $1)
++  ICU_CFLAGS="$ICU_CFLAGS -DU_NO_DEFAULT_INCLUDE_UTF_HEADERS=1"
++  ICU_CXXFLAGS="$ICU_CXXFLAGS -DUNISTR_FROM_CHAR_EXPLICIT=explicit -DUNISTR_FROM_STRING_EXPLICIT=explicit"
+ 
+-    ICU_CXXFLAGS=`$ICU_CONFIG --cxxflags`
+-    if test "$icu_version" -ge "49000"; then
+-      ICU_CXXFLAGS="$ICU_CXXFLAGS -DUNISTR_FROM_CHAR_EXPLICIT=explicit -DUNISTR_FROM_STRING_EXPLICIT=explicit"
+-      ICU_CFLAGS="-DU_NO_DEFAULT_INCLUDE_UTF_HEADERS=1"
+-    fi
+-    if test "$icu_version" -ge "60000"; then
+-      ICU_CFLAGS="$ICU_CFLAGS -DU_HIDE_OBSOLETE_UTF_OLD_H=1"
+-    fi
++  if $PKG_CONFIG icu-io --atleast-version=60; then
++    ICU_CFLAGS="$ICU_CFLAGS -DU_HIDE_OBSOLETE_UTF_OLD_H=1"
+   fi
+ ])
+ 
+--- php7.3.orig/ext/intl/config.m4
++++ php7.3/ext/intl/config.m4
+@@ -9,15 +9,7 @@ if test "$PHP_INTL" != "no"; then
+   PHP_SETUP_ICU(INTL_SHARED_LIBADD)
+   PHP_SUBST(INTL_SHARED_LIBADD)
+   PHP_REQUIRE_CXX()
+-  INTL_COMMON_FLAGS="$ICU_INCS $ICU_CFLAGS -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1"
+-  if test "$icu_version" -ge "4002"; then
+-    icu_spoof_src=" spoofchecker/spoofchecker_class.c \
+-    spoofchecker/spoofchecker.c\
+-    spoofchecker/spoofchecker_create.c\
+-    spoofchecker/spoofchecker_main.c"
+-  else
+-    icu_spoof_src=""
+-  fi
++  INTL_COMMON_FLAGS="$ICU_CFLAGS -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1"
+   PHP_NEW_EXTENSION(intl, php_intl.c \
+     intl_error.c \
+     intl_convert.c \
+@@ -68,7 +60,11 @@ if test "$PHP_INTL" != "no"; then
+     transliterator/transliterator_methods.c \
+     uchar/uchar.c \
+     idn/idn.c \
+-    $icu_spoof_src, $ext_shared,,$INTL_COMMON_FLAGS,cxx)
++    spoofchecker/spoofchecker_class.c \
++    spoofchecker/spoofchecker.c\
++    spoofchecker/spoofchecker_create.c\
++    spoofchecker/spoofchecker_main.c \
++    , $ext_shared,,$INTL_COMMON_FLAGS,cxx)
+ 
+   PHP_INTL_CXX_SOURCES="intl_convertcpp.cpp \
+     common/common_enum.cpp \
diff --git a/meta-oe/recipes-devtools/php/php_7.3.2.bb b/meta-oe/recipes-devtools/php/php_7.3.2.bb
index fdd08ebc9c..db04ce3756 100644
--- a/meta-oe/recipes-devtools/php/php_7.3.2.bb
+++ b/meta-oe/recipes-devtools/php/php_7.3.2.bb
@@ -3,6 +3,9 @@ require php.inc
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fb07bfc51f6d5e0c30b65d9701233b2e"
 
 SRC_URI += "file://0001-acinclude.m4-don-t-unset-cache-variables.patch \
+            file://0048-Use-pkg-config-for-FreeType2-detection.patch \
+            file://0049-ext-intl-Use-pkg-config-to-detect-icu.patch \
+            file://0001-Use-pkg-config-for-libxml2-detection.patch \
            "
 SRC_URI_append_class-target = " \
                                 file://pear-makefile.patch \
-- 
2.20.1


