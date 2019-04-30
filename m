Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B567F7DAE1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2019 05:54:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x3U5sDAH021063
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Apr 2019 22:54:14 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Mon, 29 Apr 2019 22:54:13 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 30 Apr 2019 13:54:12 +0800
Message-ID: <1556603652-157191-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] php: upgrade 7.3.2 -> 7.3.4
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
X-List-Received-Date: Tue, 30 Apr 2019 05:54:13 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../0001-opcache-config.m4-enable-opcache.patch    |  81 ++---------
 ...049-ext-intl-Use-pkg-config-to-detect-icu.patch | 154 ++++++++++++++-------
 .../php/{php_7.3.2.bb => php_7.3.4.bb}             |   4 +-
 3 files changed, 118 insertions(+), 121 deletions(-)
 rename meta-oe/recipes-devtools/php/{php_7.3.2.bb => php_7.3.4.bb} (87%)

diff --git a/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-opcache.patch b/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-opcache.patch
index 9ffd0e4..34f433f 100644
--- a/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-opcache.patch
+++ b/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-opcache.patch
@@ -1,7 +1,9 @@
-From fb139d9707dabe1684b472a08a6eb5761ede4a3a Mon Sep 17 00:00:00 2001
+From 8de5ba69d20d049b8ca983a9470c7303142ec0b3 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
-Date: Tue, 12 Feb 2019 14:56:16 +0800
-Subject: [PATCH] opcache/config.m4: enable opcache
+Date: Sun, 28 Apr 2019 16:55:13 +0800
+Subject: [PATCH] From fb139d9707dabe1684b472a08a6eb5761ede4a3a Mon Sep 17
+ 00:00:00 2001 From: Changqing Li <changqing.li@windriver.com> Date: Tue, 12
+ Feb 2019 14:56:16 +0800 Subject: [PATCH] opcache/config.m4: enable opcache
 
 We can't use AC_TRY_RUN to run programs in a cross compile environment. Set
 the variables directly instead since we know that we'd be running on latest
@@ -11,17 +13,17 @@ Upstream-Status: Inappropriate [Configuration]
 
 Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
 
-update patch to version 7.3.2
+update patch to version 7.3.4
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- ext/opcache/config.m4 | 357 +-------------------------------------------------
- 1 file changed, 6 insertions(+), 351 deletions(-)
+ ext/opcache/config.m4 | 312 +-------------------------------------------------
+ 1 file changed, 6 insertions(+), 306 deletions(-)
 
 diff --git a/ext/opcache/config.m4 b/ext/opcache/config.m4
-index 392f4c6..6617693 100644
+index 4810217..22c3d61 100644
 --- a/ext/opcache/config.m4
 +++ b/ext/opcache/config.m4
-@@ -27,374 +27,29 @@ if test "$PHP_OPCACHE" != "no"; then
+@@ -27,319 +27,19 @@ if test "$PHP_OPCACHE" != "no"; then
    AC_CHECK_HEADERS([unistd.h sys/uio.h])
  
    AC_MSG_CHECKING(for sysvipc shared memory support)
@@ -93,8 +95,9 @@ index 392f4c6..6617693 100644
 -    AC_DEFINE(HAVE_SHM_IPC, 1, [Define if you have SysV IPC SHM support])
 -    msg=yes],[msg=no],[msg=no])
 -  AC_MSG_RESULT([$msg])
+-
 +  AC_DEFINE(HAVE_SHM_IPC, 1, [Define if you have SysV IPC SHM support])
- 
++  
    AC_MSG_CHECKING(for mmap() using MAP_ANON shared memory support)
 -  AC_RUN_IFELSE([AC_LANG_SOURCE([[
 -#include <sys/types.h>
@@ -344,64 +347,8 @@ index 392f4c6..6617693 100644
 -  AC_MSG_RESULT([$msg])
 +  AC_DEFINE(HAVE_SHM_MMAP_FILE, 1, [Define if you have mmap() SHM support])
  
- flock_type=unknown
- AC_MSG_CHECKING(for struct flock layout)
- 
- if test "$flock_type" = "unknown"; then
--AC_RUN_IFELSE([AC_LANG_SOURCE([[
--  #include <fcntl.h>
--  struct flock lock = { 1, 2, 3, 4, 5, 6, 7 };
--  int main() {
--    if(lock.l_type == 1 && lock.l_whence == 2 && lock.l_start == 6 && lock.l_len== 7) {
--		return 0;
--    }
--    return 1;
--  }
--]])], [
--    flock_type=aix64
--    AC_DEFINE([HAVE_FLOCK_AIX64], [], [Struct flock is 64-bit AIX-type])
--], [])
--fi
--
--if test "$flock_type" = "unknown"; then
--AC_RUN_IFELSE([AC_LANG_SOURCE([[
--  #include <fcntl.h>
--  struct flock lock = { 1, 2, 3, 4, 5 };
--  int main() {
--    if(lock.l_type == 1 && lock.l_whence == 2 && lock.l_start == 3 && lock.l_len == 4) {
--		return 0;
--    }
--    return 1;
--  }
--]])], [
--	flock_type=linux
-+    flock_type=linux
-     AC_DEFINE([HAVE_FLOCK_LINUX], [], [Struct flock is Linux-type])
--], [])
- fi
- 
- if test "$flock_type" = "unknown"; then
--AC_RUN_IFELSE([AC_LANG_SOURCE([[
--  #include <fcntl.h>
--  struct flock lock = { 1, 2, 3, 4, 5 };
--  int main() {
--    if(lock.l_start == 1 && lock.l_len == 2 && lock.l_type == 4 && lock.l_whence == 5) {
--		return 0;
--    }
--    return 1;
--  }
--]])], [
--	flock_type=bsd
--    AC_DEFINE([HAVE_FLOCK_BSD], [], [Struct flock is BSD-type])
--], [])
--fi
--
--AC_MSG_RESULT([$flock_type])
--
--if test "$flock_type" = "unknown"; then
- 	AC_MSG_ERROR([Don't know how to define struct flock on this system[,] set --enable-opcache=no])
- fi
- 
+   PHP_NEW_EXTENSION(opcache,
+ 	ZendAccelerator.c \
 -- 
 2.7.4
 
diff --git a/meta-oe/recipes-devtools/php/php/0049-ext-intl-Use-pkg-config-to-detect-icu.patch b/meta-oe/recipes-devtools/php/php/0049-ext-intl-Use-pkg-config-to-detect-icu.patch
index deada1f..2258c4c 100644
--- a/meta-oe/recipes-devtools/php/php/0049-ext-intl-Use-pkg-config-to-detect-icu.patch
+++ b/meta-oe/recipes-devtools/php/php/0049-ext-intl-Use-pkg-config-to-detect-icu.patch
@@ -1,84 +1,131 @@
-From: Hugh McMaster <hugh.mcmaster@outlook.com>
-Date: Wed, 5 Dec 2018 23:27:30 +1100
-Subject: ext/intl: Use pkg-config to detect icu
+From 03fecab78f9fa747ad8ab3484e7ca00c0148321d Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Sun, 28 Apr 2019 16:45:02 +0800
+Subject: [PATCH] From: Hugh McMaster <hugh.mcmaster@outlook.com> Date: Wed, 5
+ Dec 2018 23:27:30 +1100 Subject: ext/intl: Use pkg-config to detect icu
 
 The developers of icu recommend using pkg-config to detect icu,
 because icu-config is deprecated.
+
+Upstream-Status: Pending
+
+update to version 7.3.4
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- acinclude.m4       | 56 +++++++-----------------------------------------------
- ext/intl/config.m4 | 16 ++++++----------
- 2 files changed, 13 insertions(+), 59 deletions(-)
+ acinclude.m4       | 95 ++++++------------------------------------------------
+ ext/intl/config.m4 | 16 ++++-----
+ 2 files changed, 15 insertions(+), 96 deletions(-)
 
---- php7.3.orig/acinclude.m4
-+++ php7.3/acinclude.m4
-@@ -2168,58 +2168,16 @@ dnl
+diff --git a/acinclude.m4 b/acinclude.m4
+index 7d77c33..86b0ecc 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -2158,92 +2158,15 @@ dnl
  dnl Common setup macro for ICU
  dnl
  AC_DEFUN([PHP_SETUP_ICU],[
 -  PHP_ARG_WITH(icu-dir,,
 -  [  --with-icu-dir=DIR      Specify where ICU libraries and headers can be found], DEFAULT, no)
-+  PKG_CHECK_MODULES([ICU], [icu-io >= 50.1])
- 
+-
 -  if test "$PHP_ICU_DIR" = "no"; then
 -    PHP_ICU_DIR=DEFAULT
 -  fi
 -
--  if test "$PHP_ICU_DIR" = "DEFAULT"; then
--    dnl Try to find icu-config
--    AC_PATH_PROG(ICU_CONFIG, icu-config, no, [$PATH:/usr/local/bin])
--  else
--    ICU_CONFIG="$PHP_ICU_DIR/bin/icu-config"
+-  AC_MSG_CHECKING([for location of ICU headers and libraries])
+-  found_icu=no
+-
+-  dnl First try to find pkg-config
+-  if test -z "$PKG_CONFIG"; then
+-    AC_PATH_PROG(PKG_CONFIG, pkg-config, no)
 -  fi
 -
--  AC_MSG_CHECKING([for location of ICU headers and libraries])
+-  dnl If pkg-config is found try using it
+-  if test "$PHP_ICU_DIR" = "DEFAULT" && test -x "$PKG_CONFIG" && $PKG_CONFIG --exists icu-uc icu-io icu-i18n; then
+-    if $PKG_CONFIG --atleast-version=40 icu-uc; then
+-      found_icu=yes
+-      icu_version_full=`$PKG_CONFIG --modversion icu-uc`
+-      ac_IFS=$IFS
+-      IFS="."
+-      set $icu_version_full
+-      IFS=$ac_IFS
+-      icu_version=`expr [$]1 \* 1000 + [$]2`
+-      AC_MSG_RESULT([found $icu_version_full])
 -
--  dnl Trust icu-config to know better what the install prefix is..
--  icu_install_prefix=`$ICU_CONFIG --prefix 2> /dev/null`
--  if test "$?" != "0" || test -z "$icu_install_prefix"; then
--    AC_MSG_RESULT([not found])
--    AC_MSG_ERROR([Unable to detect ICU prefix or $ICU_CONFIG failed. Please verify ICU install prefix and make sure icu-config works.])
--  else
--    AC_MSG_RESULT([$icu_install_prefix])
+-      ICU_LIBS=`$PKG_CONFIG --libs icu-uc icu-io icu-i18n`
+-      ICU_INCS=`$PKG_CONFIG --cflags-only-I icu-uc icu-io icu-i18n`
+-      ICU_CXXFLAGS="-DU_USING_ICU_NAMESPACE=1"
 -
--    dnl Check ICU version
--    AC_MSG_CHECKING([for ICU 4.0 or greater])
--    icu_version_full=`$ICU_CONFIG --version`
--    ac_IFS=$IFS
--    IFS="."
--    set $icu_version_full
--    IFS=$ac_IFS
--    icu_version=`expr [$]1 \* 1000 + [$]2`
--    AC_MSG_RESULT([found $icu_version_full])
+-      AC_MSG_RESULT([found $ICU_VERSION])
+-
+-      PHP_EVAL_LIBLINE($ICU_LIBS, $1)
+-      PHP_EVAL_INCLINE($ICU_INCS)
+-    else
+-      AC_MSG_ERROR([ICU version 4.0 or later required.])
+-    fi
+-  fi
 -
--    if test "$icu_version" -lt "4000"; then
--      AC_MSG_ERROR([ICU version 4.0 or later is required])
+-  dnl If pkg-config fails for some reason, revert to the old method
+-  if test "$found_icu" = "no"; then
+-    if test "$PHP_ICU_DIR" = "DEFAULT"; then
+-      dnl Try to find icu-config
+-      AC_PATH_PROG(ICU_CONFIG, icu-config, no, [$PATH:/usr/local/bin])
+-    else
+-      ICU_CONFIG="$PHP_ICU_DIR/bin/icu-config"
 -    fi
+-
+-    dnl Trust icu-config to know better what the install prefix is..
+-    icu_install_prefix=`$ICU_CONFIG --prefix 2> /dev/null`
+-    if test "$?" != "0" || test -z "$icu_install_prefix"; then
+-      AC_MSG_RESULT([not found])
+-      AC_MSG_ERROR([Unable to detect ICU prefix or $ICU_CONFIG failed. Please verify ICU install prefix and make sure icu-config works.])
+-    else
+-      AC_MSG_RESULT([$icu_install_prefix])
+-
+-      dnl Check ICU version
+-      AC_MSG_CHECKING([for ICU 4.0 or greater])
+-      icu_version_full=`$ICU_CONFIG --version`
+-      ac_IFS=$IFS
+-      IFS="."
+-      set $icu_version_full
+-      IFS=$ac_IFS
+-      icu_version=`expr [$]1 \* 1000 + [$]2`
+-      AC_MSG_RESULT([found $icu_version_full])
+-
+-      if test "$icu_version" -lt "4000"; then
+-        AC_MSG_ERROR([ICU version 4.0 or later is required])
+-      fi
+-
+-      ICU_VERSION=$icu_version
+-      ICU_INCS=`$ICU_CONFIG --cppflags-searchpath`
+-      ICU_LIBS=`$ICU_CONFIG --ldflags --ldflags-icuio`
+-      PHP_EVAL_INCLINE($ICU_INCS)
+-      PHP_EVAL_LIBLINE($ICU_LIBS, $1)
+-
+-      ICU_CXXFLAGS=`$ICU_CONFIG --cxxflags`
+-      if test "$icu_version" -ge "49000"; then
+-        ICU_CXXFLAGS="$ICU_CXXFLAGS -DUNISTR_FROM_CHAR_EXPLICIT=explicit -DUNISTR_FROM_STRING_EXPLICIT=explicit"
+-        ICU_CFLAGS="-DU_NO_DEFAULT_INCLUDE_UTF_HEADERS=1"
+-      fi
+-      if test "$icu_version" -ge "60000"; then
+-        ICU_CFLAGS="$ICU_CFLAGS -DU_HIDE_OBSOLETE_UTF_OLD_H=1"
+-      fi
+-    fi
++  PKG_CHECK_MODULES([ICU], [icu-io >= 50.1])
 +  PHP_EVAL_INCLINE($ICU_CFLAGS)
 +  PHP_EVAL_LIBLINE($ICU_LIBS, $1)
- 
--    ICU_VERSION=$icu_version
--    ICU_INCS=`$ICU_CONFIG --cppflags-searchpath`
--    ICU_LIBS=`$ICU_CONFIG --ldflags --ldflags-icuio`
--    PHP_EVAL_INCLINE($ICU_INCS)
--    PHP_EVAL_LIBLINE($ICU_LIBS, $1)
++  
 +  ICU_CFLAGS="$ICU_CFLAGS -DU_NO_DEFAULT_INCLUDE_UTF_HEADERS=1"
 +  ICU_CXXFLAGS="$ICU_CXXFLAGS -DUNISTR_FROM_CHAR_EXPLICIT=explicit -DUNISTR_FROM_STRING_EXPLICIT=explicit"
- 
--    ICU_CXXFLAGS=`$ICU_CONFIG --cxxflags`
--    if test "$icu_version" -ge "49000"; then
--      ICU_CXXFLAGS="$ICU_CXXFLAGS -DUNISTR_FROM_CHAR_EXPLICIT=explicit -DUNISTR_FROM_STRING_EXPLICIT=explicit"
--      ICU_CFLAGS="-DU_NO_DEFAULT_INCLUDE_UTF_HEADERS=1"
--    fi
--    if test "$icu_version" -ge "60000"; then
--      ICU_CFLAGS="$ICU_CFLAGS -DU_HIDE_OBSOLETE_UTF_OLD_H=1"
--    fi
++  
 +  if $PKG_CONFIG icu-io --atleast-version=60; then
 +    ICU_CFLAGS="$ICU_CFLAGS -DU_HIDE_OBSOLETE_UTF_OLD_H=1"
    fi
  ])
  
---- php7.3.orig/ext/intl/config.m4
-+++ php7.3/ext/intl/config.m4
+diff --git a/ext/intl/config.m4 b/ext/intl/config.m4
+index 4b9f469..fdae88a 100644
+--- a/ext/intl/config.m4
++++ b/ext/intl/config.m4
 @@ -9,15 +9,7 @@ if test "$PHP_INTL" != "no"; then
    PHP_SETUP_ICU(INTL_SHARED_LIBADD)
    PHP_SUBST(INTL_SHARED_LIBADD)
@@ -109,3 +156,6 @@ because icu-config is deprecated.
  
    PHP_INTL_CXX_SOURCES="intl_convertcpp.cpp \
      common/common_enum.cpp \
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-devtools/php/php_7.3.2.bb b/meta-oe/recipes-devtools/php/php_7.3.4.bb
similarity index 87%
rename from meta-oe/recipes-devtools/php/php_7.3.2.bb
rename to meta-oe/recipes-devtools/php/php_7.3.4.bb
index 634facd..1a5c976 100644
--- a/meta-oe/recipes-devtools/php/php_7.3.2.bb
+++ b/meta-oe/recipes-devtools/php/php_7.3.4.bb
@@ -13,8 +13,8 @@ SRC_URI_append_class-target = " \
                                 file://0001-opcache-config.m4-enable-opcache.patch \
                                 "
 
-SRC_URI[md5sum] = "c893ff828945c274d90e026528142439"
-SRC_URI[sha256sum] = "946f50dacbd2f61e643bb737021cbe8b1816e780ee7ad3e0cd999a1892ab0add"
+SRC_URI[md5sum] = "efb58aea95a66738d871f83ec55fec6f"
+SRC_URI[sha256sum] = "2e2c3d8212c83649e443b61efffbd03df4b9edd0f9c7a679081fe4cb2da12b78"
 
 PACKAGECONFIG[mysql] = "--with-mysqli=mysqlnd \
                         --with-pdo-mysql=mysqlnd \
-- 
2.7.4


