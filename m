Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.3849.1587689864316045574
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Apr 2020 17:57:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 03O0vC1o031136
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2020 17:57:33 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Thu, 23 Apr 2020 17:57:13 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] php: upgrade 7.3.16 -> 7.4.4
Date: Fri, 24 Apr 2020 08:57:11 +0800
Message-ID: <20200424005711.188713-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

License-Update: License updated (year updated)

note: for 7.4, pear is disabled by default,
and it will be deprecated in future.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...Use-pkg-config-for-libxml2-detection.patch |  23 ---
 ...re.ac-don-t-include-build-libtool.m4.patch |  30 +++
 ...001-opcache-config.m4-enable-opcache.patch | 170 +++-------------
 ...p-don-t-use-broken-wrapper-for-mkdir.patch |  11 +-
 ...-php.m4-don-t-unset-cache-variables.patch} |  23 +--
 ...e-pkg-config-for-FreeType2-detection.patch |  53 -----
 .../php/php/CVE-2019-6978.patch               | 192 ------------------
 meta-oe/recipes-devtools/php/php/iconv.patch  |  36 ++--
 .../php/php/imap-fix-autofoo.patch            |  36 ++--
 .../php/php/phar-makefile.patch               |  18 +-
 .../php/php/php_exec_native.patch             |  20 +-
 .../php/{php_7.3.16.bb => php_7.4.4.bb}       |  18 +-
 12 files changed, 132 insertions(+), 498 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/php/php/0001-Use-pkg-config-for-libxml2-detection.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/0001-configure.ac-don-t-include-build-libtool.m4.patch
 rename meta-oe/recipes-devtools/php/php/{0001-acinclude.m4-don-t-unset-cache-variables.patch => 0001-php.m4-don-t-unset-cache-variables.patch} (50%)
 delete mode 100644 meta-oe/recipes-devtools/php/php/0048-Use-pkg-config-for-FreeType2-detection.patch
 delete mode 100644 meta-oe/recipes-devtools/php/php/CVE-2019-6978.patch
 rename meta-oe/recipes-devtools/php/{php_7.3.16.bb => php_7.4.4.bb} (94%)

diff --git a/meta-oe/recipes-devtools/php/php/0001-Use-pkg-config-for-libxml2-detection.patch b/meta-oe/recipes-devtools/php/php/0001-Use-pkg-config-for-libxml2-detection.patch
deleted file mode 100644
index ccc6d4ede..000000000
--- a/meta-oe/recipes-devtools/php/php/0001-Use-pkg-config-for-libxml2-detection.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Use pkg-config for libxml2 detection.
-
-xml2-config does not work. Use pkgconfig to set CPPFLAGS and LIBS.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by:  Khem Raj <raj.khem@gmail.com>
----
- configure.in | 15 ++-------------
- 1 file changed, 2 insertions(+), 13 deletions(-)
---- a/acinclude.m4
-+++ b/acinclude.m4
-@@ -2481,8 +2481,8 @@ AC_DEFUN([PHP_SETUP_LIBXML], [
-     LIBXML_VERSION=`expr [$]1 \* 1000000 + [$]2 \* 1000 + [$]3`
-     if test "$LIBXML_VERSION" -ge "2006011"; then
-       found_libxml=yes
--      LIBXML_LIBS=`$XML2_CONFIG --libs`
--      LIBXML_INCS=`$XML2_CONFIG --cflags`
-+      LIBXML_LIBS=`pkg-config --libs libxml-2.0`
-+      LIBXML_INCS=`pkg-config --cflags libxml-2.0`
-     else
-       AC_MSG_ERROR([libxml2 version 2.6.11 or greater required.])
-     fi
diff --git a/meta-oe/recipes-devtools/php/php/0001-configure.ac-don-t-include-build-libtool.m4.patch b/meta-oe/recipes-devtools/php/php/0001-configure.ac-don-t-include-build-libtool.m4.patch
new file mode 100644
index 000000000..2861366a6
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/0001-configure.ac-don-t-include-build-libtool.m4.patch
@@ -0,0 +1,30 @@
+From f5a34e771532b8433f307b679500c26af328ba35 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 17 Apr 2020 15:01:57 +0800
+Subject: [PATCH] configure.ac: don't include build/libtool.m4
+
+we delete build/libtool.m4 before do_configure,
+we will use libtool.m4 under ACLOCALDIR
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ configure.ac | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 06c6a27..f85144e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -6,7 +6,6 @@ dnl ----------------------------------------------------------------------------
+ m4_include([build/ax_check_compile_flag.m4])
+ m4_include([build/ax_func_which_gethostbyname_r.m4])
+ m4_include([build/ax_gcc_func_attribute.m4])
+-m4_include([build/libtool.m4])
+ m4_include([build/php_cxx_compile_stdcxx.m4])
+ m4_include([build/php.m4])
+ m4_include([build/pkg.m4])
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-opcache.patch b/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-opcache.patch
index 34f433f40..ee0d5edcd 100644
--- a/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-opcache.patch
+++ b/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-opcache.patch
@@ -1,30 +1,27 @@
-From 8de5ba69d20d049b8ca983a9470c7303142ec0b3 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Sun, 28 Apr 2019 16:55:13 +0800
-Subject: [PATCH] From fb139d9707dabe1684b472a08a6eb5761ede4a3a Mon Sep 17
- 00:00:00 2001 From: Changqing Li <changqing.li@windriver.com> Date: Tue, 12
- Feb 2019 14:56:16 +0800 Subject: [PATCH] opcache/config.m4: enable opcache
+opcache/config.m4: enable opcache
 
-We can't use AC_TRY_RUN to run programs in a cross compile environment. Set
-the variables directly instead since we know that we'd be running on latest
+We can't use AC_TRY_RUN to run programs in a cross compile environment.
+Set
+the variables directly instead since we know that we'd be running on
+latest
 enough linux kernel.
 
 Upstream-Status: Inappropriate [Configuration]
 
 Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
 
-update patch to version 7.3.4
+update patch to version 7.4.4
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- ext/opcache/config.m4 | 312 +-------------------------------------------------
- 1 file changed, 6 insertions(+), 306 deletions(-)
+ ext/opcache/config.m4 | 194 +-------------------------------------------------
+ 1 file changed, 3 insertions(+), 191 deletions(-)
 
 diff --git a/ext/opcache/config.m4 b/ext/opcache/config.m4
-index 4810217..22c3d61 100644
+index 6c40caf..84ddf1e 100644
 --- a/ext/opcache/config.m4
 +++ b/ext/opcache/config.m4
-@@ -27,319 +27,19 @@ if test "$PHP_OPCACHE" != "no"; then
-   AC_CHECK_HEADERS([unistd.h sys/uio.h])
+@@ -23,201 +23,13 @@ if test "$PHP_OPCACHE" != "no"; then
+   AC_CHECK_FUNCS([mprotect])
  
    AC_MSG_CHECKING(for sysvipc shared memory support)
 -  AC_RUN_IFELSE([AC_LANG_SOURCE([[
@@ -95,9 +92,8 @@ index 4810217..22c3d61 100644
 -    AC_DEFINE(HAVE_SHM_IPC, 1, [Define if you have SysV IPC SHM support])
 -    msg=yes],[msg=no],[msg=no])
 -  AC_MSG_RESULT([$msg])
--
 +  AC_DEFINE(HAVE_SHM_IPC, 1, [Define if you have SysV IPC SHM support])
-+  
+ 
    AC_MSG_CHECKING(for mmap() using MAP_ANON shared memory support)
 -  AC_RUN_IFELSE([AC_LANG_SOURCE([[
 -#include <sys/types.h>
@@ -114,7 +110,8 @@ index 4810217..22c3d61 100644
 -#ifndef MAP_FAILED
 -# define MAP_FAILED ((void*)-1)
 -#endif
--
++  AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have mmap(MAP_ANON) SHM support])
+ 
 -int main() {
 -  pid_t pid;
 -  int status;
@@ -149,64 +146,8 @@ index 4810217..22c3d61 100644
 -    AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have mmap(MAP_ANON) SHM support])
 -    msg=yes],[msg=no],[msg=no])
 -  AC_MSG_RESULT([$msg])
-+  AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have mmap(MAP_ANON) SHM support])
- 
-   AC_MSG_CHECKING(for mmap() using /dev/zero shared memory support)
--  AC_RUN_IFELSE([AC_LANG_SOURCE([[
--#include <sys/types.h>
--#include <sys/wait.h>
--#include <sys/mman.h>
--#include <sys/stat.h>
--#include <fcntl.h>
--#include <unistd.h>
--#include <string.h>
--
--#ifndef MAP_FAILED
--# define MAP_FAILED ((void*)-1)
--#endif
--
--int main() {
--  pid_t pid;
--  int status;
--  int fd;
--  char *shm;
--
--  fd = open("/dev/zero", O_RDWR, S_IRUSR | S_IWUSR);
--  if (fd == -1) {
--    return 1;
--  }
--
--  shm = mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
--  if (shm == MAP_FAILED) {
--    return 2;
--  }
--
--  strcpy(shm, "hello");
 -
--  pid = fork();
--  if (pid < 0) {
--    return 5;
--  } else if (pid == 0) {
--    strcpy(shm, "bye");
--    return 6;
--  }
--  if (wait(&status) != pid) {
--    return 7;
--  }
--  if (!WIFEXITED(status) || WEXITSTATUS(status) != 6) {
--    return 8;
--  }
--  if (strcmp(shm, "bye") != 0) {
--    return 9;
--  }
--  return 0;
--}
--]])],[dnl
--    AC_DEFINE(HAVE_SHM_MMAP_ZERO, 1, [Define if you have mmap("/dev/zero") SHM support])
--    msg=yes],[msg=no],[msg=no])
--  AC_MSG_RESULT([$msg])
-+  AC_DEFINE(HAVE_SHM_MMAP_ZERO, 1, [Define if you have mmap("/dev/zero") SHM support])
- 
+-  PHP_CHECK_FUNC_LIB(shm_open, rt)
    AC_MSG_CHECKING(for mmap() using shm_open() shared memory support)
 -  AC_RUN_IFELSE([AC_LANG_SOURCE([[
 -#include <sys/types.h>
@@ -230,7 +171,7 @@ index 4810217..22c3d61 100644
 -  char *shm;
 -  char tmpname[4096];
 -
--  sprintf(tmpname,"test.shm.%dXXXXXX", getpid());
+-  sprintf(tmpname,"/opcache.test.shm.%dXXXXXX", getpid());
 -  if (mktemp(tmpname) == NULL) {
 -    return 1;
 -  }
@@ -273,80 +214,15 @@ index 4810217..22c3d61 100644
 -}
 -]])],[dnl
 -    AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX mmap() SHM support])
--    msg=yes],[msg=no],[msg=no])
--  AC_MSG_RESULT([$msg])
+-    AC_MSG_RESULT([yes])
+-    PHP_CHECK_LIBRARY(rt, shm_unlink, [PHP_ADD_LIBRARY(rt,1,OPCACHE_SHARED_LIBADD)])
+-  ],[
+-    AC_MSG_RESULT([no])
+-  ],[
+-    AC_MSG_RESULT([no])
+-  ])
 +  AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX mmap() SHM support])
  
-   AC_MSG_CHECKING(for mmap() using regular file shared memory support)
--  AC_RUN_IFELSE([AC_LANG_SOURCE([[
--#include <sys/types.h>
--#include <sys/wait.h>
--#include <sys/mman.h>
--#include <sys/stat.h>
--#include <fcntl.h>
--#include <unistd.h>
--#include <string.h>
--#include <stdlib.h>
--#include <stdio.h>
--
--#ifndef MAP_FAILED
--# define MAP_FAILED ((void*)-1)
--#endif
--
--int main() {
--  pid_t pid;
--  int status;
--  int fd;
--  char *shm;
--  char tmpname[4096];
--
--  sprintf(tmpname,"test.shm.%dXXXXXX", getpid());
--  if (mktemp(tmpname) == NULL) {
--    return 1;
--  }
--  fd = open(tmpname, O_RDWR | O_CREAT, S_IRUSR | S_IWUSR);
--  if (fd == -1) {
--    return 2;
--  }
--  if (ftruncate(fd, 4096) < 0) {
--    close(fd);
--    unlink(tmpname);
--    return 3;
--  }
--
--  shm = mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
--  if (shm == MAP_FAILED) {
--    return 4;
--  }
--  unlink(tmpname);
--  close(fd);
--
--  strcpy(shm, "hello");
--
--  pid = fork();
--  if (pid < 0) {
--    return 5;
--  } else if (pid == 0) {
--    strcpy(shm, "bye");
--    return 6;
--  }
--  if (wait(&status) != pid) {
--    return 7;
--  }
--  if (!WIFEXITED(status) || WEXITSTATUS(status) != 6) {
--    return 8;
--  }
--  if (strcmp(shm, "bye") != 0) {
--    return 9;
--  }
--  return 0;
--}
--]])],[dnl
--    AC_DEFINE(HAVE_SHM_MMAP_FILE, 1, [Define if you have mmap() SHM support])
--    msg=yes],[msg=no],[msg=no])
--  AC_MSG_RESULT([$msg])
-+  AC_DEFINE(HAVE_SHM_MMAP_FILE, 1, [Define if you have mmap() SHM support])
- 
    PHP_NEW_EXTENSION(opcache,
  	ZendAccelerator.c \
 -- 
diff --git a/meta-oe/recipes-devtools/php/php/0001-php-don-t-use-broken-wrapper-for-mkdir.patch b/meta-oe/recipes-devtools/php/php/0001-php-don-t-use-broken-wrapper-for-mkdir.patch
index 2f7d58155..d68737366 100644
--- a/meta-oe/recipes-devtools/php/php/0001-php-don-t-use-broken-wrapper-for-mkdir.patch
+++ b/meta-oe/recipes-devtools/php/php/0001-php-don-t-use-broken-wrapper-for-mkdir.patch
@@ -4,17 +4,20 @@ Date: Thu, 3 Nov 2011 14:27:15 +0100
 Subject: [PATCH 2/8] php: don't use broken wrapper for mkdir
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+
+update patch to version 7.4.4
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
 
 Upstream-Status: Inappropriate
 
- Makefile.global | 2 +-
+ build/Makefile.global | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/Makefile.global b/Makefile.global
+diff --git a/build/Makefile.global b/build/Makefile.global
 index ff858c2..ae554b4 100644
---- a/Makefile.global
-+++ b/Makefile.global
+--- a/build/Makefile.global
++++ b/build/Makefile.global
 @@ -1,4 +1,4 @@
 -mkinstalldirs = $(top_srcdir)/build/shtool mkdir -p
 +mkinstalldirs = mkdir -p
diff --git a/meta-oe/recipes-devtools/php/php/0001-acinclude.m4-don-t-unset-cache-variables.patch b/meta-oe/recipes-devtools/php/php/0001-php.m4-don-t-unset-cache-variables.patch
similarity index 50%
rename from meta-oe/recipes-devtools/php/php/0001-acinclude.m4-don-t-unset-cache-variables.patch
rename to meta-oe/recipes-devtools/php/php/0001-php.m4-don-t-unset-cache-variables.patch
index 51dbe269c..0d721ec50 100644
--- a/meta-oe/recipes-devtools/php/php/0001-acinclude.m4-don-t-unset-cache-variables.patch
+++ b/meta-oe/recipes-devtools/php/php/0001-php.m4-don-t-unset-cache-variables.patch
@@ -1,7 +1,4 @@
-From d2679c89c0b15b90e5360b4863258a7955e5f4e5 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Tue, 12 Feb 2019 15:59:19 +0800
-Subject: [PATCH] acinclude.m4: don't unset cache variables
+php.m4: don't unset cache variables
 
 Unsetting prevents cache variable from being passed to configure.
 
@@ -9,17 +6,17 @@ Upstream-Status: Inappropriate [OE-specific]
 
 Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
 
-update patch to version 7.3.2
+update this patch to 7.4.4, acinclude.m4 move to build/php.m4
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- acinclude.m4 | 4 ----
+ build/php.m4 | 4 ----
  1 file changed, 4 deletions(-)
 
-diff --git a/acinclude.m4 b/acinclude.m4
-index 25f900d..2641969 100644
---- a/acinclude.m4
-+++ b/acinclude.m4
-@@ -1921,8 +1921,6 @@ define([phpshift],[ifelse(index([$@],[,]),-1,,[substr([$@],incr(index([$@],[,]))
+diff --git a/build/php.m4 b/build/php.m4
+index 5c45d13..218ec47 100644
+--- a/build/php.m4
++++ b/build/php.m4
+@@ -1587,8 +1587,6 @@ dnl PHP_CHECK_FUNC_LIB
  dnl
  AC_DEFUN([PHP_CHECK_FUNC_LIB],[
    ifelse($2,,:,[
@@ -28,8 +25,8 @@ index 25f900d..2641969 100644
    unset found
    AC_CHECK_LIB($2, $1, [found=yes], [
      AC_CHECK_LIB($2, __$1, [found=yes], [found=no])
-@@ -1954,8 +1952,6 @@ dnl in the default libraries and as a fall back in the specified library.
- dnl Defines HAVE_func and HAVE_library if found and adds the library to LIBS.
+@@ -1620,8 +1618,6 @@ dnl and as a fall back in the specified library. Defines HAVE_func and
+ dnl HAVE_library if found and adds the library to LIBS.
  dnl
  AC_DEFUN([PHP_CHECK_FUNC],[
 -  unset ac_cv_func_$1
diff --git a/meta-oe/recipes-devtools/php/php/0048-Use-pkg-config-for-FreeType2-detection.patch b/meta-oe/recipes-devtools/php/php/0048-Use-pkg-config-for-FreeType2-detection.patch
deleted file mode 100644
index f36ddac26..000000000
--- a/meta-oe/recipes-devtools/php/php/0048-Use-pkg-config-for-FreeType2-detection.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From: =?utf-8?b?T25kxZllaiBTdXLDvQ==?= <ondrej@sury.org>
-Date: Mon, 22 Oct 2018 06:54:31 +0000
-Subject: Use pkg-config for FreeType2 detection
-
----
- ext/gd/config.m4 | 30 +++++++++++++++++++-----------
- 1 file changed, 19 insertions(+), 11 deletions(-)
-
-diff --git a/ext/gd/config.m4 b/ext/gd/config.m4
-index 498d870..d28c6ae 100644
---- a/ext/gd/config.m4
-+++ b/ext/gd/config.m4
-@@ -184,21 +184,29 @@ AC_DEFUN([PHP_GD_XPM],[
- AC_DEFUN([PHP_GD_FREETYPE2],[
-   if test "$PHP_FREETYPE_DIR" != "no"; then
- 
--    for i in $PHP_FREETYPE_DIR /usr/local /usr; do
--      if test -f "$i/bin/freetype-config"; then
--        FREETYPE2_DIR=$i
--        FREETYPE2_CONFIG="$i/bin/freetype-config"
--        break
-+    if test -z "$PKG_CONFIG"; then
-+      AC_PATH_PROG(PKG_CONFIG, pkg-config, no)
-+    fi
-+    if test -x "$PKG_CONFIG" && $PKG_CONFIG --exists freetype2 ; then
-+      FREETYPE2_CFLAGS=`$PKG_CONFIG --cflags freetype2`
-+      FREETYPE2_LIBS=`$PKG_CONFIG --libs freetype2`
-+    else
-+      for i in $PHP_FREETYPE_DIR /usr/local /usr; do
-+        if test -f "$i/bin/freetype-config"; then
-+          FREETYPE2_DIR=$i
-+          FREETYPE2_CONFIG="$i/bin/freetype-config"
-+          break
-+        fi
-+      done
-+
-+      if test -z "$FREETYPE2_DIR"; then
-+        AC_MSG_ERROR([freetype-config not found.])
-       fi
--    done
- 
--    if test -z "$FREETYPE2_DIR"; then
--      AC_MSG_ERROR([freetype-config not found.])
-+      FREETYPE2_CFLAGS=`$FREETYPE2_CONFIG --cflags`
-+      FREETYPE2_LIBS=`$FREETYPE2_CONFIG --libs`
-     fi
- 
--    FREETYPE2_CFLAGS=`$FREETYPE2_CONFIG --cflags`
--    FREETYPE2_LIBS=`$FREETYPE2_CONFIG --libs`
--
-     PHP_EVAL_INCLINE($FREETYPE2_CFLAGS)
-     PHP_EVAL_LIBLINE($FREETYPE2_LIBS, GD_SHARED_LIBADD)
-     AC_DEFINE(HAVE_LIBFREETYPE,1,[ ])
diff --git a/meta-oe/recipes-devtools/php/php/CVE-2019-6978.patch b/meta-oe/recipes-devtools/php/php/CVE-2019-6978.patch
deleted file mode 100644
index b7cdfd964..000000000
--- a/meta-oe/recipes-devtools/php/php/CVE-2019-6978.patch
+++ /dev/null
@@ -1,192 +0,0 @@
-From 089f7c0bc28d399b0420aa6ef058e4c1c120b2ae Mon Sep 17 00:00:00 2001
-From: "Christoph M. Becker" <cmbecker69@gmx.de>
-Date: Sat, 19 Jan 2019 10:35:39 +0100
-Subject: [PATCH] Sync with upstream
-
-Even though libgd/libgd#492 is not a relevant bug fix for PHP, since
-the binding doesn't use the `gdImage*Ptr()` functions at all, we're
-porting the fix to stay in sync here.
----
- ext/gd/libgd/gd_gif_out.c | 20 +++++++++++++++++---
- ext/gd/libgd/gd_jpeg.c    | 17 ++++++++++++++---
- ext/gd/libgd/gd_wbmp.c    | 18 +++++++++++++++---
- 3 files changed, 46 insertions(+), 9 deletions(-)
-
-Upstream-Status: Backport [http://git.php.net/?p=php-src.git;a=commit;h=089f7c0bc28d399b0420aa6ef058e4c1c120b2ae]
-CVE: CVE-2019-6978
-
-Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
-
-diff --git a/ext/gd/libgd/gd_gif_out.c b/ext/gd/libgd/gd_gif_out.c
-index 1f2a6b936a..2e1f38af70 100644
---- a/ext/gd/libgd/gd_gif_out.c
-+++ b/ext/gd/libgd/gd_gif_out.c
-@@ -97,12 +97,18 @@ static void cl_hash (register count_int chsize, GifCtx *ctx);
- static void char_init (GifCtx *ctx);
- static void char_out (int c, GifCtx *ctx);
- static void flush_char (GifCtx *ctx);
-+
-+static int _gdImageGifCtx(gdImagePtr im, gdIOCtxPtr out);
-+
- void * gdImageGifPtr (gdImagePtr im, int *size)
- {
-   void *rv;
-   gdIOCtx *out = gdNewDynamicCtx (2048, NULL);
--  gdImageGifCtx (im, out);
--  rv = gdDPExtractData (out, size);
-+	if (!_gdImageGifCtx(im, out)) {
-+		rv = gdDPExtractData(out, size);
-+	} else {
-+		rv = NULL;
-+	}
-   out->gd_free (out);
-   return rv;
- }
-@@ -115,6 +121,12 @@ void gdImageGif (gdImagePtr im, FILE * outFile)
- }
- 
- void gdImageGifCtx(gdImagePtr im, gdIOCtxPtr out)
-+{
-+	_gdImageGifCtx(im, out);
-+}
-+
-+/* returns 0 on success, 1 on failure */
-+static int _gdImageGifCtx(gdImagePtr im, gdIOCtxPtr out)
- {
- 	gdImagePtr pim = 0, tim = im;
- 	int interlace, BitsPerPixel;
-@@ -125,7 +137,7 @@ void gdImageGifCtx(gdImagePtr im, gdIOCtxPtr out)
- 			based temporary image. */
- 		pim = gdImageCreatePaletteFromTrueColor(im, 1, 256);
- 		if (!pim) {
--			return;
-+			return 1;
- 		}
- 		tim = pim;
- 	}
-@@ -138,6 +150,8 @@ void gdImageGifCtx(gdImagePtr im, gdIOCtxPtr out)
- 		/* Destroy palette based temporary image. */
- 		gdImageDestroy(	pim);
- 	}
-+
-+    return 0;
- }
- 
- static int
-diff --git a/ext/gd/libgd/gd_jpeg.c b/ext/gd/libgd/gd_jpeg.c
-index 8cf71fcbc9..ef46c4a22c 100644
---- a/ext/gd/libgd/gd_jpeg.c
-+++ b/ext/gd/libgd/gd_jpeg.c
-@@ -132,6 +132,7 @@ const char * gdJpegGetVersionString()
- 	}
- }
- 
-+static int _gdImageJpegCtx(gdImagePtr im, gdIOCtx *outfile, int quality);
- 
- /*
-  * Write IM to OUTFILE as a JFIF-formatted JPEG image, using quality
-@@ -153,8 +154,11 @@ void *gdImageJpegPtr (gdImagePtr im, int *size, int quality)
- {
- 	void *rv;
- 	gdIOCtx *out = gdNewDynamicCtx (2048, NULL);
--	gdImageJpegCtx (im, out, quality);
--	rv = gdDPExtractData (out, size);
-+	if (!_gdImageJpegCtx(im, out, quality)) {
-+		rv = gdDPExtractData(out, size);
-+	} else {
-+		rv = NULL;
-+	}
- 	out->gd_free (out);
- 
- 	return rv;
-@@ -163,6 +167,12 @@ void *gdImageJpegPtr (gdImagePtr im, int *size, int quality)
- void jpeg_gdIOCtx_dest (j_compress_ptr cinfo, gdIOCtx * outfile);
- 
- void gdImageJpegCtx (gdImagePtr im, gdIOCtx * outfile, int quality)
-+{
-+	_gdImageJpegCtx(im, outfile, quality);
-+}
-+
-+/* returns 0 on success, 1 on failure */
-+static int _gdImageJpegCtx(gdImagePtr im, gdIOCtx *outfile, int quality)
- {
- 	struct jpeg_compress_struct cinfo;
- 	struct jpeg_error_mgr jerr;
-@@ -184,7 +194,7 @@ void gdImageJpegCtx (gdImagePtr im, gdIOCtx * outfile, int quality)
- 		if (row) {
- 			gdFree (row);
- 		}
--		return;
-+		return 1;
- 	}
- 
- 	cinfo.err->error_exit = fatal_jpeg_error;
-@@ -277,6 +287,7 @@ void gdImageJpegCtx (gdImagePtr im, gdIOCtx * outfile, int quality)
- 	jpeg_finish_compress (&cinfo);
- 	jpeg_destroy_compress (&cinfo);
- 	gdFree (row);
-+	return 0;
- }
- 
- gdImagePtr gdImageCreateFromJpeg (FILE * inFile)
-diff --git a/ext/gd/libgd/gd_wbmp.c b/ext/gd/libgd/gd_wbmp.c
-index 55ced3443d..fd9edad2ca 100644
---- a/ext/gd/libgd/gd_wbmp.c
-+++ b/ext/gd/libgd/gd_wbmp.c
-@@ -82,6 +82,7 @@ int gd_getin (void *in)
- 	return (gdGetC((gdIOCtx *) in));
- }
- 
-+static int _gdImageWBMPCtx(gdImagePtr image, int fg, gdIOCtx *out);
- 
- /*      gdImageWBMPCtx
-    **  --------------
-@@ -93,6 +94,12 @@ int gd_getin (void *in)
-    **  out:    the stream where to write
-  */
- void gdImageWBMPCtx (gdImagePtr image, int fg, gdIOCtx * out)
-+{
-+	_gdImageWBMPCtx(image, fg, out);
-+}
-+
-+/* returns 0 on success, 1 on failure */
-+static int _gdImageWBMPCtx(gdImagePtr image, int fg, gdIOCtx *out)
- {
- 	int x, y, pos;
- 	Wbmp *wbmp;
-@@ -100,7 +107,7 @@ void gdImageWBMPCtx (gdImagePtr image, int fg, gdIOCtx * out)
- 	/* create the WBMP */
- 	if ((wbmp = createwbmp (gdImageSX (image), gdImageSY (image), WBMP_WHITE)) == NULL) {
- 		gd_error("Could not create WBMP");
--		return;
-+		return 1;
- 	}
- 
- 	/* fill up the WBMP structure */
-@@ -116,7 +123,9 @@ void gdImageWBMPCtx (gdImagePtr image, int fg, gdIOCtx * out)
- 
- 	/* write the WBMP to a gd file descriptor */
- 	if (writewbmp (wbmp, &gd_putout, out)) {
-+		freewbmp(wbmp);
- 		gd_error("Could not save WBMP");
-+		return 1;
- 	}
- 	/* des submitted this bugfix: gdFree the memory. */
- 	freewbmp(wbmp);
-@@ -204,8 +213,11 @@ void * gdImageWBMPPtr (gdImagePtr im, int *size, int fg)
- {
- 	void *rv;
- 	gdIOCtx *out = gdNewDynamicCtx(2048, NULL);
--	gdImageWBMPCtx(im, fg, out);
--	rv = gdDPExtractData(out, size);
-+	if (!_gdImageWBMPCtx(im, fg, out)) {
-+		rv = gdDPExtractData(out, size);
-+	} else {
-+		rv = NULL;
-+	}
- 	out->gd_free(out);
- 
- 	return rv;
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-devtools/php/php/iconv.patch b/meta-oe/recipes-devtools/php/php/iconv.patch
index ecf7d8720..9ec8a89b5 100644
--- a/meta-oe/recipes-devtools/php/php/iconv.patch
+++ b/meta-oe/recipes-devtools/php/php/iconv.patch
@@ -1,32 +1,33 @@
-From 17cc5645f3acf943a5a06465d09d0ebcfea987bd Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Wed, 2 Nov 2011 16:54:57 +0100
-Subject: [PATCH] Upstream-Status: Pending
+Subject: [PATCH] From 17cc5645f3acf943a5a06465d09d0ebcfea987bd Mon Sep 17
+ 00:00:00 2001 From: Koen Kooi <koen@dominion.thruhere.net> Date: Wed, 2 Nov
+ 2011 16:54:57 +0100 Subject: [PATCH] Upstream-Status: Pending
 
+update patch to version 7.4.4
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- acinclude.m4        | 3 ++-
+ build/php.m4        | 3 ++-
  ext/iconv/config.m4 | 2 +-
  2 files changed, 3 insertions(+), 2 deletions(-)
 
-diff --git a/acinclude.m4 b/acinclude.m4
-index d32766a..ad5166e 100644
---- a/acinclude.m4
-+++ b/acinclude.m4
-@@ -2445,7 +2445,8 @@ AC_DEFUN([PHP_SETUP_ICONV], [
-   dnl Check libc first if no path is provided in --with-iconv
-   dnl
+diff --git a/build/php.m4 b/build/php.m4
+index 7392876..5c45d13 100644
+--- a/build/php.m4
++++ b/build/php.m4
+@@ -1950,7 +1950,8 @@ AC_DEFUN([PHP_SETUP_ICONV], [
+   echo > ext/iconv/php_iconv_supports_errno.h
  
+   dnl Check libc first if no path is provided in --with-iconv.
 -  if test "$PHP_ICONV" = "yes"; then
 +  dnl must check against no, not against yes as PHP_ICONV can also include a path, which implies yes
 +  if test "$PHP_ICONV" != "no"; then
-     dnl Reset LIBS temporarily as it may have already been included
-     dnl -liconv in.
+     dnl Reset LIBS temporarily as it may have already been included -liconv in.
      LIBS_save="$LIBS"
+     LIBS=
 diff --git a/ext/iconv/config.m4 b/ext/iconv/config.m4
-index 6a05697..973e750 100644
+index fe9b47a..b6b632f 100644
 --- a/ext/iconv/config.m4
 +++ b/ext/iconv/config.m4
-@@ -15,7 +15,7 @@ if test "$PHP_ICONV" != "no"; then
+@@ -14,7 +14,7 @@ if test "$PHP_ICONV" != "no"; then
  
    if test "$iconv_avail" != "no"; then
      if test -z "$ICONV_DIR"; then
@@ -35,3 +36,6 @@ index 6a05697..973e750 100644
          if test -f "$i/include/iconv.h" || test -f "$i/include/giconv.h"; then
            PHP_ICONV_PREFIX="$i"
            break
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-devtools/php/php/imap-fix-autofoo.patch b/meta-oe/recipes-devtools/php/php/imap-fix-autofoo.patch
index 16359af9f..ebe5f6a93 100644
--- a/meta-oe/recipes-devtools/php/php/imap-fix-autofoo.patch
+++ b/meta-oe/recipes-devtools/php/php/imap-fix-autofoo.patch
@@ -1,32 +1,19 @@
-From c084c8349d1780980e232cb28b60a109e3d89438 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Wed, 2 Nov 2011 16:54:57 +0100
-Subject: [PATCH] Upstream-Status: Pending
+Subject: [PATCH] From c084c8349d1780980e232cb28b60a109e3d89438 Mon Sep 17
+ 00:00:00 2001 From: Koen Kooi <koen@dominion.thruhere.net> Date: Wed, 2 Nov
+ 2011 16:54:57 +0100 Subject: [PATCH] Upstream-Status: Pending
 
+update patch to version 7.4.4
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- acinclude.m4       |  2 +-
  ext/imap/config.m4 | 10 ++--------
- 2 files changed, 3 insertions(+), 9 deletions(-)
+ 1 file changed, 2 insertions(+), 8 deletions(-)
 
-diff --git a/acinclude.m4 b/acinclude.m4
-index ad5166e..f6a55ec 100644
---- a/acinclude.m4
-+++ b/acinclude.m4
-@@ -2350,7 +2350,7 @@ AC_DEFUN([PHP_SETUP_OPENSSL],[
-       PHP_OPENSSL_DIR="/usr/local/ssl /usr/local /usr /usr/local/openssl"
-     fi
- 
--    for i in $PHP_OPENSSL_DIR; do
-+    for i in $PHP_OPENSSL_DIR $PHP_OPENSSL_DIR/usr; do
-       if test -r $i/include/openssl/evp.h; then
-         OPENSSL_INCDIR=$i/include
-       fi
 diff --git a/ext/imap/config.m4 b/ext/imap/config.m4
-index badb6e2..8ff803c 100644
+index 5086a31..0e938bd 100644
 --- a/ext/imap/config.m4
 +++ b/ext/imap/config.m4
-@@ -109,7 +109,7 @@ if test "$PHP_IMAP" != "no"; then
-     PHP_NEW_EXTENSION(imap, php_imap.c, $ext_shared)
+@@ -110,7 +110,7 @@ if test "$PHP_IMAP" != "no"; then
+     PHP_NEW_EXTENSION(imap, php_imap.c, $ext_shared,, -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1)
      AC_DEFINE(HAVE_IMAP,1,[ ])
  
 -    for i in $PHP_IMAP /usr/local /usr; do
@@ -34,7 +21,7 @@ index badb6e2..8ff803c 100644
        IMAP_INC_CHK()
        el[]IMAP_INC_CHK(/include/c-client)
        el[]IMAP_INC_CHK(/include/imap)
-@@ -198,13 +198,7 @@ if test "$PHP_IMAP" != "no"; then
+@@ -199,13 +199,7 @@ if test "$PHP_IMAP" != "no"; then
        AC_MSG_ERROR(Cannot find rfc822.h. Please check your c-client installation.)
      fi
  
@@ -49,3 +36,6 @@ index badb6e2..8ff803c 100644
        IMAP_LIB=$lib
        IMAP_LIB_CHK($PHP_LIBDIR)
        IMAP_LIB_CHK(c-client)
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-devtools/php/php/phar-makefile.patch b/meta-oe/recipes-devtools/php/php/phar-makefile.patch
index 336cf0d62..eb73bc440 100644
--- a/meta-oe/recipes-devtools/php/php/phar-makefile.patch
+++ b/meta-oe/recipes-devtools/php/php/phar-makefile.patch
@@ -1,24 +1,25 @@
-From 08962a56f69963e01892d98ca5b75de8354bd3f5 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Wed, 2 Nov 2011 16:54:57 +0100
-Subject: [PATCH] Fix phar packaging
+Subject: [PATCH] From 08962a56f69963e01892d98ca5b75de8354bd3f5 Mon Sep 17
+ 00:00:00 2001 From: Koen Kooi <koen@dominion.thruhere.net> Date: Wed, 2 Nov
+ 2011 16:54:57 +0100 Subject: [PATCH] Fix phar packaging
 
 Inherited from OE-Classic, with some additions to fix host paths leaking
 into the target package.
 
 Upstream-Status: Inappropriate [config]
 
+update patch to version 7.4.4
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
  ext/phar/Makefile.frag | 17 +++--------------
  1 file changed, 3 insertions(+), 14 deletions(-)
 
 diff --git a/ext/phar/Makefile.frag b/ext/phar/Makefile.frag
-index 0e3713f..22f7898 100644
+index 6442f33..6145412 100644
 --- a/ext/phar/Makefile.frag
 +++ b/ext/phar/Makefile.frag
 @@ -10,20 +10,9 @@ pharcmd: $(builddir)/phar.php $(builddir)/phar.phar
  
- PHP_PHARCMD_SETTINGS = -n -d 'open_basedir=' -d 'output_buffering=0' -d 'memory_limit=-1' -d phar.readonly=0 -d 'safe_mode=0'
+ PHP_PHARCMD_SETTINGS = -n -d 'open_basedir=' -d 'output_buffering=0' -d 'memory_limit=-1' -d phar.readonly=0
  PHP_PHARCMD_EXECUTABLE = ` \
 -	if test -x "$(top_builddir)/$(SAPI_CLI_PATH)"; then \
 -		$(top_srcdir)/build/shtool echo -n -- "$(top_builddir)/$(SAPI_CLI_PATH) -n"; \
@@ -34,9 +35,12 @@ index 0e3713f..22f7898 100644
 -		$(top_srcdir)/build/shtool echo -n -- "$(PHP_EXECUTABLE)"; \
 -	fi;`
 -PHP_PHARCMD_BANG = `$(top_srcdir)/build/shtool echo -n -- "$(INSTALL_ROOT)$(bindir)/$(program_prefix)php$(program_suffix)$(EXEEXT)";`
-+		$(top_srcdir)/build/shtool echo -n -- "$(PHP_EXECUTABLE)"; `
++               $(top_srcdir)/build/shtool echo -n -- "$(PHP_EXECUTABLE)"; `
 +
 +PHP_PHARCMD_BANG = `$(top_srcdir)/build/shtool echo -n -- "$(bindir)/$(program_prefix)php$(program_suffix)$(EXEEXT)";`
  
  $(builddir)/phar/phar.inc: $(srcdir)/phar/phar.inc
  	-@test -d $(builddir)/phar || mkdir $(builddir)/phar
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-devtools/php/php/php_exec_native.patch b/meta-oe/recipes-devtools/php/php/php_exec_native.patch
index 80409000d..4aec4812f 100644
--- a/meta-oe/recipes-devtools/php/php/php_exec_native.patch
+++ b/meta-oe/recipes-devtools/php/php/php_exec_native.patch
@@ -1,22 +1,26 @@
-From d251b5aa3d23803d016ca16818e2e1d2f2b70a02 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Wed, 2 Nov 2011 16:54:57 +0100
-Subject: [PATCH] Upstream-Status: Inappriate
+Subject: [PATCH] rom d251b5aa3d23803d016ca16818e2e1d2f2b70a02 Mon Sep 17
+ 00:00:00 2001 From: Koen Kooi <koen@dominion.thruhere.net> Date: Wed, 2 Nov
+ 2011 16:54:57 +0100 Subject: [PATCH] Upstream-Status: Inappriate
 
+update patch to version 7.4.4
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
  sapi/cli/config.m4 | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/sapi/cli/config.m4 b/sapi/cli/config.m4
-index 2168151..20a81db 100644
+index 917d45f..aaf1e27 100644
 --- a/sapi/cli/config.m4
 +++ b/sapi/cli/config.m4
-@@ -50,7 +50,7 @@ if test "$PHP_CLI" != "no"; then
+@@ -47,7 +47,7 @@ if test "$PHP_CLI" != "no"; then
    esac
  
-   dnl Set executable for tests
+   dnl Set executable for tests.
 -  PHP_EXECUTABLE="\$(top_builddir)/\$(SAPI_CLI_PATH)"
 +  PHP_EXECUTABLE="${PHP_NATIVE_DIR}/php"
    PHP_SUBST(PHP_EXECUTABLE)
  
-   dnl Expose to Makefile
+   dnl Expose to Makefile.
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-devtools/php/php_7.3.16.bb b/meta-oe/recipes-devtools/php/php_7.4.4.bb
similarity index 94%
rename from meta-oe/recipes-devtools/php/php_7.3.16.bb
rename to meta-oe/recipes-devtools/php/php_7.4.4.bb
index 050916bb3..ff4c28e13 100644
--- a/meta-oe/recipes-devtools/php/php_7.3.16.bb
+++ b/meta-oe/recipes-devtools/php/php_7.4.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.php.net"
 SECTION = "console/network"
 
 LICENSE = "PHP-3.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=fb07bfc51f6d5e0c30b65d9701233b2e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7e571b888d585b31f9ef5edcc647fa30"
 
 BBCLASSEXTEND = "native"
 DEPENDS = "zlib bzip2 libxml2 virtual/libiconv php-native lemon-native"
@@ -13,11 +13,9 @@ PHP_MAJOR_VERSION = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "http://php.net/distributions/php-${PV}.tar.bz2 \
            file://0001-php-don-t-use-broken-wrapper-for-mkdir.patch \
-           file://0001-acinclude.m4-don-t-unset-cache-variables.patch \
-           file://0048-Use-pkg-config-for-FreeType2-detection.patch \
-           file://0001-Use-pkg-config-for-libxml2-detection.patch \
            file://debian-php-fixheader.patch \
-           file://CVE-2019-6978.patch \
+           file://0001-configure.ac-don-t-include-build-libtool.m4.patch \
+           file://0001-php.m4-don-t-unset-cache-variables.patch \
           "
 
 SRC_URI_append_class-target = " \
@@ -34,8 +32,8 @@ SRC_URI_append_class-target = " \
             file://xfail_two_bug_tests.patch \
           "
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[md5sum] = "fc72fa1c2a6da38a5a7f8797eaa08c58"
-SRC_URI[sha256sum] = "b8072d526a283182963b03960b7982392daa43cb31131eca4cf0b996764a042e"
+SRC_URI[md5sum] = "262c258a3b8b5699fcca89a64e58758c"
+SRC_URI[sha256sum] = "308e8f4182ec8a2767b0b1b8e1e7c69fb149b37cfb98ee4a37475e082fa9829f"
 
 inherit autotools pkgconfig python3native gettext
 
@@ -55,7 +53,6 @@ COMMON_EXTRA_OECONF = "--enable-sockets \
                        --libdir=${PHP_LIBDIR} \
 "
 EXTRA_OECONF = "--enable-mbstring \
-                --enable-wddx \
                 --enable-fpm \
                 --with-libdir=${baselib} \
                 --with-gettext=${STAGING_LIBDIR}/.. \
@@ -107,6 +104,7 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 PACKAGECONFIG[opcache] = "--enable-opcache,--disable-opcache"
 PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl"
 PACKAGECONFIG[valgrind] = "--with-valgrind=${STAGING_DIR_TARGET}/usr,--with-valgrind=no,valgrind"
+PACKAGECONFIG[mbregex] = "--enable-mbregex, --disable-mbregex, oniguruma"
 
 export PHP_NATIVE_DIR = "${STAGING_BINDIR_NATIVE}"
 export PHP_PEAR_PHP_BIN = "${STAGING_BINDIR_NATIVE}/php"
@@ -149,16 +147,12 @@ do_install_prepend_class-target() {
 # fixme
 do_install_append_class-target() {
     install -d ${D}${sysconfdir}/
-    if [ -d ${RECIPE_SYSROOT_NATIVE}${sysconfdir} ];then
-         install -m 0644 ${RECIPE_SYSROOT_NATIVE}${sysconfdir}/pear.conf ${D}${sysconfdir}/
-    fi
     rm -rf ${D}/${TMPDIR}
     rm -rf ${D}/.registry
     rm -rf ${D}/.channels
     rm -rf ${D}/.[a-z]*
     rm -rf ${D}/var
     rm -f  ${D}/${sysconfdir}/php-fpm.conf.default
-    sed -i 's:${STAGING_DIR_NATIVE}::g' ${D}${sysconfdir}/pear.conf
     install -m 0644 ${WORKDIR}/php-fpm.conf ${D}/${sysconfdir}/php-fpm.conf
     install -d ${D}/${sysconfdir}/apache2/conf.d
     install -m 0644 ${WORKDIR}/php-fpm-apache.conf ${D}/${sysconfdir}/apache2/conf.d/php-fpm.conf
-- 
2.24.1

