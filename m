Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84D57C433F5
	for <webhook@archiver.kernel.org>; Sun, 14 Nov 2021 01:07:14 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.4263.1636852033409142766
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Nov 2021 17:07:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PSp3wtm1;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id
 o6-20020a17090a0a0600b001a64b9a11aeso10759877pjo.3
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Nov 2021 17:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rS7XJrfM+2KZ+dS/kj74F1zEHg2oduBwnFJlvEEBWJI=;
        b=PSp3wtm10IcPmmotCfOOr6MO7+G0BJuVZgPWVH3jFzt7iZEDV+u+9eCmtcnmuNIJKb
         XwGiluaXgAiXWG4neibxLNyzyY2I6Z/CXOjumE6C+wXgyP/uHhQAF7aW59rGA2rQp7tz
         6f98eGi2x6TdO6io9cjMJGx/C+Y9r+sFFQ1gy7OMLXXBdX5DeJpx+0t8MdHbtdnvkEM7
         osoLOIWfYWYi6RnSuPzNAM59Q0KAM5+CvN7cNXWZbpFkCDt7+QQgGyKJnhSnEnkR9WZq
         kgibV0UE7N1dJQma55kqDJG8fHSymWrkBRPBbB+YRpvUXjYp4vvw8YS6HLF9055tqE+J
         gL2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rS7XJrfM+2KZ+dS/kj74F1zEHg2oduBwnFJlvEEBWJI=;
        b=CfwX3sbNmDG7fP2Uqg3nHmWMclayEX2LE5WtZgCzIupiQetv5xIC5vrBx6cOY0YglJ
         o1DT8wthWHDRSgfIHQpDIrE1Ii70uMs2li2NXFU0QX2tMlQUdjhvePDmBr4lvrbe1pDc
         DwgmMJzjGCs2v6ThObcE3/djjKAMIM//EIYFgK6tJw9OTkGQi9YaycR8aj7lv+jC/C3k
         6gQzwXxhzcI94KQFatVjP0e/GqHErrO0DJeBxsxYA5J4BdBkMs+4a168heo+rxRdc+Zw
         +BR8IZU1pTgAerqCABKpymoVTnqBpgjCJHd6q2d3c17j46zsm1VFlavmi0XjOoHNK3M4
         omlw==
X-Gm-Message-State: AOAM533MsG2ZPjsgzHZlGXGrnVV/Dxy0dztubcb6NFBOdjqNJZh8IVRe
	14kqZvXXH4O+KHaWYUPURRRSR3/5lkFHVg==
X-Google-Smtp-Source: 
 ABdhPJxMNzUui+VOJVl4IDcBUwWz/KVmLUXEht7CZXe82JLL4XFvxyx0iiSiG4iU77u7jW5SKoOI9g==
X-Received: by 2002:a17:902:ee8d:b0:143:8e80:62a8 with SMTP id
 a13-20020a170902ee8d00b001438e8062a8mr21623413pld.30.1636852032225;
        Sat, 13 Nov 2021 17:07:12 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::7905])
        by smtp.gmail.com with ESMTPSA id
 k20sm11130894pfc.83.2021.11.13.17.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Nov 2021 17:07:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Claude Bing <cbing@cybernetics.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] php: update from 7.4.21 to 8.0.12
Date: Sat, 13 Nov 2021 17:07:08 -0800
Message-Id: <20211114010709.2504225-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 Nov 2021 01:07:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93939

From: Claude Bing <cbing@cybernetics.com>

Various security and bug fixes; adds support for the JIT compiler.

 * Fixed bug #81026 (PHP-FPM oob R/W in root process leading to
   privilege escalation) (CVE-2021-21703).

https://www.php.net/ChangeLog-8.php#8.0.0

Signed-off-by: Claude Bing <cbing@cybernetics.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...xt-opcache-config.m4-enable-opcache.patch} | 46 ++++++++++---------
 ...-php.m4-don-t-unset-cache-variables.patch} | 16 +++++--
 ...host-specific-info-from-header-file.patch} | 22 +++++----
 ...e.ac-don-t-include-build-libtool.m4.patch} | 15 +++---
 ...05-pear-fix-Makefile.frag-for-Yocto.patch} | 19 +++++---
 ...ar-Makefile.frag-Fix-phar-packaging.patch} | 15 ++++--
 ...i-cli-config.m4-fix-build-directory.patch} | 16 +++++--
 ...xt-imap-config.m4-fix-include-paths.patch} | 18 +++++---
 ...-don-t-use-broken-wrapper-for-mkdir.patch} | 18 ++++----
 .../php/php/0010-iconv-fix-detection.patch    | 35 ++++++++++++++
 ...1-opcache-jit-use-minilua-in-sysroot.patch | 29 ++++++++++++
 .../{70_mod_php7.conf => 70_mod_php8.conf}    |  2 +-
 meta-oe/recipes-devtools/php/php/iconv.patch  | 41 -----------------
 .../php/php/xfail_two_bug_tests.patch         | 34 --------------
 .../php/{php_7.4.21.bb => php_8.0.12.bb}      | 28 ++++++-----
 15 files changed, 193 insertions(+), 161 deletions(-)
 rename meta-oe/recipes-devtools/php/php/{0001-opcache-config.m4-enable-opcache.patch => 0001-ext-opcache-config.m4-enable-opcache.patch} (83%)
 rename meta-oe/recipes-devtools/php/php/{0001-php.m4-don-t-unset-cache-variables.patch => 0002-build-php.m4-don-t-unset-cache-variables.patch} (67%)
 rename meta-oe/recipes-devtools/php/php/{debian-php-fixheader.patch => 0003-php-remove-host-specific-info-from-header-file.patch} (55%)
 rename meta-oe/recipes-devtools/php/php/{0001-configure.ac-don-t-include-build-libtool.m4.patch => 0004-configure.ac-don-t-include-build-libtool.m4.patch} (68%)
 rename meta-oe/recipes-devtools/php/php/{pear-makefile.patch => 0005-pear-fix-Makefile.frag-for-Yocto.patch} (61%)
 rename meta-oe/recipes-devtools/php/php/{phar-makefile.patch => 0006-ext-phar-Makefile.frag-Fix-phar-packaging.patch} (80%)
 rename meta-oe/recipes-devtools/php/php/{php_exec_native.patch => 0007-sapi-cli-config.m4-fix-build-directory.patch} (58%)
 rename meta-oe/recipes-devtools/php/php/{imap-fix-autofoo.patch => 0008-ext-imap-config.m4-fix-include-paths.patch} (76%)
 rename meta-oe/recipes-devtools/php/php/{0001-php-don-t-use-broken-wrapper-for-mkdir.patch => 0009-php-don-t-use-broken-wrapper-for-mkdir.patch} (61%)
 create mode 100644 meta-oe/recipes-devtools/php/php/0010-iconv-fix-detection.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/0011-opcache-jit-use-minilua-in-sysroot.patch
 rename meta-oe/recipes-devtools/php/php/{70_mod_php7.conf => 70_mod_php8.conf} (84%)
 delete mode 100644 meta-oe/recipes-devtools/php/php/iconv.patch
 delete mode 100644 meta-oe/recipes-devtools/php/php/xfail_two_bug_tests.patch
 rename meta-oe/recipes-devtools/php/{php_7.4.21.bb => php_8.0.12.bb} (92%)

diff --git a/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-opcache.patch b/meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch
similarity index 83%
rename from meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-opcache.patch
rename to meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch
index 1f3e683a0f..44534cc062 100644
--- a/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-opcache.patch
+++ b/meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch
@@ -1,13 +1,11 @@
-From a74b42098aededd296ec6a3cd4cf5a17e59d6f29 Mon Sep 17 00:00:00 2001
+From 8cabcf1043953a0fe48107204a2212609b8e6516 Mon Sep 17 00:00:00 2001
 From: Claude Bing <cbing@cybernetics.com>
-Date: Fri, 8 May 2020 10:15:32 -0400
-Subject: [PATCH] opcache/config.m4: enable opcache
+Date: Tue, 9 Nov 2021 12:59:15 -0500
+Subject: [PATCH 01/11] ext/opcache/config.m4: enable opcache
 
-We can't use AC_TRY_RUN to run programs in a cross compile environment.
-Set
-the variables directly instead since we know that we'd be running on
-latest
-enough linux kernel.
+We can't use AC_TRY_RUN to run programs in a cross compile
+environment. Set the variables directly instead since we know
+that we'd be running on latest enough linux kernel.
 
 Upstream-Status: Inappropriate [Configuration]
 
@@ -16,17 +14,18 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
 update patch to version 7.4.4
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 
+update patch to version 8.0.12
 fix issue linking with librt
 Signed-off-by: Claude Bing <cbing@cybernetics.com>
 ---
- ext/opcache/config.m4 | 195 +-----------------------------------------
- 1 file changed, 4 insertions(+), 191 deletions(-)
+ ext/opcache/config.m4 | 197 ++----------------------------------------
+ 1 file changed, 8 insertions(+), 189 deletions(-)
 
 diff --git a/ext/opcache/config.m4 b/ext/opcache/config.m4
-index 6c40cafc1c..6569aa9e1c 100644
+index 5492fd920c..95158ccfd9 100644
 --- a/ext/opcache/config.m4
 +++ b/ext/opcache/config.m4
-@@ -23,201 +23,14 @@ if test "$PHP_OPCACHE" != "no"; then
+@@ -101,202 +101,21 @@ if test "$PHP_OPCACHE" != "no"; then
    AC_CHECK_FUNCS([mprotect])
  
    AC_MSG_CHECKING(for sysvipc shared memory support)
@@ -96,9 +95,10 @@ index 6c40cafc1c..6569aa9e1c 100644
 -}
 -]])],[dnl
 -    AC_DEFINE(HAVE_SHM_IPC, 1, [Define if you have SysV IPC SHM support])
--    msg=yes],[msg=no],[msg=no])
--  AC_MSG_RESULT([$msg])
+-    have_shm_ipc=yes],[have_shm_ipc=no],[have_shm_ipc=no])
 +  AC_DEFINE(HAVE_SHM_IPC, 1, [Define if you have SysV IPC SHM support])
++  have_shm_ipc=yes
+   AC_MSG_RESULT([$have_shm_ipc])
  
    AC_MSG_CHECKING(for mmap() using MAP_ANON shared memory support)
 -  AC_RUN_IFELSE([AC_LANG_SOURCE([[
@@ -116,8 +116,7 @@ index 6c40cafc1c..6569aa9e1c 100644
 -#ifndef MAP_FAILED
 -# define MAP_FAILED ((void*)-1)
 -#endif
-+  AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have mmap(MAP_ANON) SHM support])
- 
+-
 -int main() {
 -  pid_t pid;
 -  int status;
@@ -150,10 +149,12 @@ index 6c40cafc1c..6569aa9e1c 100644
 -}
 -]])],[dnl
 -    AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have mmap(MAP_ANON) SHM support])
--    msg=yes],[msg=no],[msg=no])
--  AC_MSG_RESULT([$msg])
--
--  PHP_CHECK_FUNC_LIB(shm_open, rt)
+-    have_shm_mmap_anon=yes],[have_shm_mmap_anon=no],[have_shm_mmap_anon=no])
++  AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have mmap(MAP_ANON) SHM support])
++  have_shm_mmap_anon=yes
+   AC_MSG_RESULT([$have_shm_mmap_anon])
+ 
+   PHP_CHECK_FUNC_LIB(shm_open, rt, root)
    AC_MSG_CHECKING(for mmap() using shm_open() shared memory support)
 -  AC_RUN_IFELSE([AC_LANG_SOURCE([[
 -#include <sys/types.h>
@@ -221,6 +222,7 @@ index 6c40cafc1c..6569aa9e1c 100644
 -]])],[dnl
 -    AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX mmap() SHM support])
 -    AC_MSG_RESULT([yes])
+-    have_shm_mmap_posix=yes
 -    PHP_CHECK_LIBRARY(rt, shm_unlink, [PHP_ADD_LIBRARY(rt,1,OPCACHE_SHARED_LIBADD)])
 -  ],[
 -    AC_MSG_RESULT([no])
@@ -228,10 +230,12 @@ index 6c40cafc1c..6569aa9e1c 100644
 -    AC_MSG_RESULT([no])
 -  ])
 +  AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX mmap() SHM support])
++  AC_MSG_RESULT([yes])
++  have_shm_mmap_posix=yes
 +  PHP_CHECK_LIBRARY(rt, shm_unlink, [PHP_ADD_LIBRARY(rt,1,OPCACHE_SHARED_LIBADD)])
  
    PHP_NEW_EXTENSION(opcache,
  	ZendAccelerator.c \
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-oe/recipes-devtools/php/php/0001-php.m4-don-t-unset-cache-variables.patch b/meta-oe/recipes-devtools/php/php/0002-build-php.m4-don-t-unset-cache-variables.patch
similarity index 67%
rename from meta-oe/recipes-devtools/php/php/0001-php.m4-don-t-unset-cache-variables.patch
rename to meta-oe/recipes-devtools/php/php/0002-build-php.m4-don-t-unset-cache-variables.patch
index 0d721ec506..6183f49c28 100644
--- a/meta-oe/recipes-devtools/php/php/0001-php.m4-don-t-unset-cache-variables.patch
+++ b/meta-oe/recipes-devtools/php/php/0002-build-php.m4-don-t-unset-cache-variables.patch
@@ -1,4 +1,7 @@
-php.m4: don't unset cache variables
+From 1af203e8e385d46ad3e33b1c253b1c564aa99034 Mon Sep 17 00:00:00 2001
+From: Claude Bing <cbing@cybernetics.com>
+Date: Tue, 9 Nov 2021 13:01:55 -0500
+Subject: [PATCH 02/11] build/php.m4: don't unset cache variables
 
 Unsetting prevents cache variable from being passed to configure.
 
@@ -8,15 +11,18 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
 
 update this patch to 7.4.4, acinclude.m4 move to build/php.m4
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+update patch to 8.0.12
+Signed-off-by: Claude Bing <cbing@cybernetics.com>
 ---
  build/php.m4 | 4 ----
  1 file changed, 4 deletions(-)
 
 diff --git a/build/php.m4 b/build/php.m4
-index 5c45d13..218ec47 100644
+index 9746ba28f3..93551d9ca7 100644
 --- a/build/php.m4
 +++ b/build/php.m4
-@@ -1587,8 +1587,6 @@ dnl PHP_CHECK_FUNC_LIB
+@@ -1568,8 +1568,6 @@ dnl PHP_CHECK_FUNC_LIB
  dnl
  AC_DEFUN([PHP_CHECK_FUNC_LIB],[
    ifelse($2,,:,[
@@ -25,7 +31,7 @@ index 5c45d13..218ec47 100644
    unset found
    AC_CHECK_LIB($2, $1, [found=yes], [
      AC_CHECK_LIB($2, __$1, [found=yes], [found=no])
-@@ -1620,8 +1618,6 @@ dnl and as a fall back in the specified library. Defines HAVE_func and
+@@ -1601,8 +1599,6 @@ dnl and as a fall back in the specified library. Defines HAVE_func and
  dnl HAVE_library if found and adds the library to LIBS.
  dnl
  AC_DEFUN([PHP_CHECK_FUNC],[
@@ -35,5 +41,5 @@ index 5c45d13..218ec47 100644
  
    AC_CHECK_FUNC($1, [found=yes],[ AC_CHECK_FUNC(__$1,[found=yes],[found=no]) ])
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-oe/recipes-devtools/php/php/debian-php-fixheader.patch b/meta-oe/recipes-devtools/php/php/0003-php-remove-host-specific-info-from-header-file.patch
similarity index 55%
rename from meta-oe/recipes-devtools/php/php/debian-php-fixheader.patch
rename to meta-oe/recipes-devtools/php/php/0003-php-remove-host-specific-info-from-header-file.patch
index a4804d1849..9637ed9516 100644
--- a/meta-oe/recipes-devtools/php/php/debian-php-fixheader.patch
+++ b/meta-oe/recipes-devtools/php/php/0003-php-remove-host-specific-info-from-header-file.patch
@@ -1,26 +1,30 @@
-From 1234a8ef7c5ab88e24bc5908f0ccfd55af21aa39 Mon Sep 17 00:00:00 2001
-From: Leon Anavi <leon.anavi@konsulko.com>
-Date: Mon, 31 Aug 2020 16:03:27 +0300
-Subject: [PATCH] php: remove host specific info from header file
+From c81d0bd3491a6c6371d9df2f43956d109f984310 Mon Sep 17 00:00:00 2001
+From: Claude Bing <cbing@cybernetics.com>
+Date: Tue, 9 Nov 2021 13:02:29 -0500
+Subject: [PATCH 03/11] php: remove host specific info from header file
 
 Based on:
 https://sources.debian.org/data/main/p/php7.3/7.3.6-1/debian/patches/
         0036-php-5.4.9-fixheader.patch
 
 Upstream-Status: Inappropriate [not author]
+
 Signed-off-by: Joe Slater <joe.slater@windriver.com>
 Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+
+update patch to 8.0.12
+Signed-off-by: Claude Bing <cbing@cybernetics.com>
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 2a474ba36d..6d22a21630 100644
+index 1eafd62a44..90c94323aa 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1323,7 +1323,7 @@ PHP_BUILD_DATE=`date -u +%Y-%m-%d`
- fi
- AC_DEFINE_UNQUOTED(PHP_BUILD_DATE,"$PHP_BUILD_DATE",[PHP build date])
+@@ -1289,7 +1289,7 @@ PHP_REMOVE_USR_LIB(LDFLAGS)
+ EXTRA_LDFLAGS="$EXTRA_LDFLAGS $PHP_LDFLAGS"
+ EXTRA_LDFLAGS_PROGRAM="$EXTRA_LDFLAGS_PROGRAM $PHP_LDFLAGS"
  
 -UNAME=`uname -a | xargs`
 +UNAME=`uname | xargs`
@@ -28,5 +32,5 @@ index 2a474ba36d..6d22a21630 100644
  AC_DEFINE_UNQUOTED(PHP_UNAME,"$PHP_UNAME",[uname -a output])
  PHP_OS=`uname | xargs`
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-oe/recipes-devtools/php/php/0001-configure.ac-don-t-include-build-libtool.m4.patch b/meta-oe/recipes-devtools/php/php/0004-configure.ac-don-t-include-build-libtool.m4.patch
similarity index 68%
rename from meta-oe/recipes-devtools/php/php/0001-configure.ac-don-t-include-build-libtool.m4.patch
rename to meta-oe/recipes-devtools/php/php/0004-configure.ac-don-t-include-build-libtool.m4.patch
index 2861366a6b..19a8bf8e4f 100644
--- a/meta-oe/recipes-devtools/php/php/0001-configure.ac-don-t-include-build-libtool.m4.patch
+++ b/meta-oe/recipes-devtools/php/php/0004-configure.ac-don-t-include-build-libtool.m4.patch
@@ -1,7 +1,7 @@
-From f5a34e771532b8433f307b679500c26af328ba35 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Fri, 17 Apr 2020 15:01:57 +0800
-Subject: [PATCH] configure.ac: don't include build/libtool.m4
+From 41ef1121682c245b10df7de4b78c45baf9114c04 Mon Sep 17 00:00:00 2001
+From: Claude Bing <cbing@cybernetics.com>
+Date: Tue, 9 Nov 2021 13:03:46 -0500
+Subject: [PATCH 04/11] configure.ac: don't include build/libtool.m4
 
 we delete build/libtool.m4 before do_configure,
 we will use libtool.m4 under ACLOCALDIR
@@ -9,12 +9,15 @@ we will use libtool.m4 under ACLOCALDIR
 Upstream-Status: Inappropriate [oe-specific]
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+update patch to 8.0.12
+Signed-off-by: Claude Bing <cbing@cybernetics.com>
 ---
  configure.ac | 1 -
  1 file changed, 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 06c6a27..f85144e 100644
+index 90c94323aa..161e7c3f53 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -6,7 +6,6 @@ dnl ----------------------------------------------------------------------------
@@ -26,5 +29,5 @@ index 06c6a27..f85144e 100644
  m4_include([build/php.m4])
  m4_include([build/pkg.m4])
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-oe/recipes-devtools/php/php/pear-makefile.patch b/meta-oe/recipes-devtools/php/php/0005-pear-fix-Makefile.frag-for-Yocto.patch
similarity index 61%
rename from meta-oe/recipes-devtools/php/php/pear-makefile.patch
rename to meta-oe/recipes-devtools/php/php/0005-pear-fix-Makefile.frag-for-Yocto.patch
index fcbf25be9b..fa956e0284 100644
--- a/meta-oe/recipes-devtools/php/php/pear-makefile.patch
+++ b/meta-oe/recipes-devtools/php/php/0005-pear-fix-Makefile.frag-for-Yocto.patch
@@ -1,17 +1,21 @@
-From edd575a546d56bb5683aff19782b16963d61fd0b Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Wed, 2 Nov 2011 16:54:57 +0100
-Subject: [PATCH] Upstream-Status: Pending
+From f22958b4c1348eec3bb4c0f2cbe2d22676e0ad23 Mon Sep 17 00:00:00 2001
+From: Claude Bing <cbing@cybernetics.com>
+Date: Tue, 9 Nov 2021 13:04:29 -0500
+Subject: [PATCH 05/11] pear: fix Makefile.frag for Yocto
 
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+
+update patch to 8.0.12
+Signed-off-by: Claude Bing <cbing@cybernetics.com>
 ---
  pear/Makefile.frag | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pear/Makefile.frag b/pear/Makefile.frag
-index bbe8ec3..16f43e2 100644
+index 9408757a3a..69072f39e0 100644
 --- a/pear/Makefile.frag
 +++ b/pear/Makefile.frag
-@@ -12,7 +12,7 @@ PEAR_SUFFIX = -ds a$(program_suffix)
+@@ -10,7 +10,7 @@ PEAR_SUFFIX = -ds a$(program_suffix)
  PEAR_INSTALLER_URL = https://pear.php.net/install-pear-nozlib.phar
  
  install-pear-installer: $(SAPI_CLI_PATH)
@@ -20,3 +24,6 @@ index bbe8ec3..16f43e2 100644
  
  install-pear:
  	@echo "Installing PEAR environment:      $(INSTALL_ROOT)$(peardir)/"
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/php/php/phar-makefile.patch b/meta-oe/recipes-devtools/php/php/0006-ext-phar-Makefile.frag-Fix-phar-packaging.patch
similarity index 80%
rename from meta-oe/recipes-devtools/php/php/phar-makefile.patch
rename to meta-oe/recipes-devtools/php/php/0006-ext-phar-Makefile.frag-Fix-phar-packaging.patch
index eb73bc440e..26872d1204 100644
--- a/meta-oe/recipes-devtools/php/php/phar-makefile.patch
+++ b/meta-oe/recipes-devtools/php/php/0006-ext-phar-Makefile.frag-Fix-phar-packaging.patch
@@ -1,6 +1,7 @@
-Subject: [PATCH] From 08962a56f69963e01892d98ca5b75de8354bd3f5 Mon Sep 17
- 00:00:00 2001 From: Koen Kooi <koen@dominion.thruhere.net> Date: Wed, 2 Nov
- 2011 16:54:57 +0100 Subject: [PATCH] Fix phar packaging
+From eab5babdadea487bbbef025068c553f5ba741774 Mon Sep 17 00:00:00 2001
+From: Claude Bing <cbing@cybernetics.com>
+Date: Tue, 9 Nov 2021 13:07:25 -0500
+Subject: [PATCH 06/11] ext/phar/Makefile.frag: Fix phar packaging
 
 Inherited from OE-Classic, with some additions to fix host paths leaking
 into the target package.
@@ -9,12 +10,16 @@ Upstream-Status: Inappropriate [config]
 
 update patch to version 7.4.4
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+
+update patch to version 8.0.12
+Signed-off-by: Claude Bing <cbing@cybernetics.com>
 ---
  ext/phar/Makefile.frag | 17 +++--------------
  1 file changed, 3 insertions(+), 14 deletions(-)
 
 diff --git a/ext/phar/Makefile.frag b/ext/phar/Makefile.frag
-index 6442f33..6145412 100644
+index 58789cae25..c02af1b186 100644
 --- a/ext/phar/Makefile.frag
 +++ b/ext/phar/Makefile.frag
 @@ -10,20 +10,9 @@ pharcmd: $(builddir)/phar.php $(builddir)/phar.phar
@@ -42,5 +47,5 @@ index 6442f33..6145412 100644
  $(builddir)/phar/phar.inc: $(srcdir)/phar/phar.inc
  	-@test -d $(builddir)/phar || mkdir $(builddir)/phar
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-oe/recipes-devtools/php/php/php_exec_native.patch b/meta-oe/recipes-devtools/php/php/0007-sapi-cli-config.m4-fix-build-directory.patch
similarity index 58%
rename from meta-oe/recipes-devtools/php/php/php_exec_native.patch
rename to meta-oe/recipes-devtools/php/php/0007-sapi-cli-config.m4-fix-build-directory.patch
index 4aec4812f6..9776e7f6db 100644
--- a/meta-oe/recipes-devtools/php/php/php_exec_native.patch
+++ b/meta-oe/recipes-devtools/php/php/0007-sapi-cli-config.m4-fix-build-directory.patch
@@ -1,15 +1,21 @@
-Subject: [PATCH] rom d251b5aa3d23803d016ca16818e2e1d2f2b70a02 Mon Sep 17
- 00:00:00 2001 From: Koen Kooi <koen@dominion.thruhere.net> Date: Wed, 2 Nov
- 2011 16:54:57 +0100 Subject: [PATCH] Upstream-Status: Inappriate
+From 03aa51625e0d1aa156c2f7cd71503b1f435d35a4 Mon Sep 17 00:00:00 2001
+From: Claude Bing <cbing@cybernetics.com>
+Date: Tue, 9 Nov 2021 13:08:06 -0500
+Subject: [PATCH 07/11] sapi/cli/config.m4: fix build directory
+
+Upstream-Status: Inappropriate
 
 update patch to version 7.4.4
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+update patch to version 8.0.12
+Signed-off-by: Claude Bing <cbing@cybernetics.com>
 ---
  sapi/cli/config.m4 | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/sapi/cli/config.m4 b/sapi/cli/config.m4
-index 917d45f..aaf1e27 100644
+index d17d531683..f2f87f9164 100644
 --- a/sapi/cli/config.m4
 +++ b/sapi/cli/config.m4
 @@ -47,7 +47,7 @@ if test "$PHP_CLI" != "no"; then
@@ -22,5 +28,5 @@ index 917d45f..aaf1e27 100644
  
    dnl Expose to Makefile.
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-oe/recipes-devtools/php/php/imap-fix-autofoo.patch b/meta-oe/recipes-devtools/php/php/0008-ext-imap-config.m4-fix-include-paths.patch
similarity index 76%
rename from meta-oe/recipes-devtools/php/php/imap-fix-autofoo.patch
rename to meta-oe/recipes-devtools/php/php/0008-ext-imap-config.m4-fix-include-paths.patch
index ebe5f6a93c..78bae58e00 100644
--- a/meta-oe/recipes-devtools/php/php/imap-fix-autofoo.patch
+++ b/meta-oe/recipes-devtools/php/php/0008-ext-imap-config.m4-fix-include-paths.patch
@@ -1,15 +1,19 @@
-Subject: [PATCH] From c084c8349d1780980e232cb28b60a109e3d89438 Mon Sep 17
- 00:00:00 2001 From: Koen Kooi <koen@dominion.thruhere.net> Date: Wed, 2 Nov
- 2011 16:54:57 +0100 Subject: [PATCH] Upstream-Status: Pending
+From c3c20db4415e0f6c4a601d6f9da1f3746a96b301 Mon Sep 17 00:00:00 2001
+From: Claude Bing <cbing@cybernetics.com>
+Date: Tue, 9 Nov 2021 13:08:58 -0500
+Subject: [PATCH 08/11] ext/imap/config.m4: fix include paths
 
-update patch to version 7.4.4
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Upstream-Status: Pending
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+
+update patch to version 8.0.12
+Signed-off-by: Claude Bing <cbing@cybernetics.com>
 ---
  ext/imap/config.m4 | 10 ++--------
  1 file changed, 2 insertions(+), 8 deletions(-)
 
 diff --git a/ext/imap/config.m4 b/ext/imap/config.m4
-index 5086a31..0e938bd 100644
+index 5086a312d0..0e938bd544 100644
 --- a/ext/imap/config.m4
 +++ b/ext/imap/config.m4
 @@ -110,7 +110,7 @@ if test "$PHP_IMAP" != "no"; then
@@ -37,5 +41,5 @@ index 5086a31..0e938bd 100644
        IMAP_LIB_CHK($PHP_LIBDIR)
        IMAP_LIB_CHK(c-client)
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-oe/recipes-devtools/php/php/0001-php-don-t-use-broken-wrapper-for-mkdir.patch b/meta-oe/recipes-devtools/php/php/0009-php-don-t-use-broken-wrapper-for-mkdir.patch
similarity index 61%
rename from meta-oe/recipes-devtools/php/php/0001-php-don-t-use-broken-wrapper-for-mkdir.patch
rename to meta-oe/recipes-devtools/php/php/0009-php-don-t-use-broken-wrapper-for-mkdir.patch
index d68737366e..57b05e6a77 100644
--- a/meta-oe/recipes-devtools/php/php/0001-php-don-t-use-broken-wrapper-for-mkdir.patch
+++ b/meta-oe/recipes-devtools/php/php/0009-php-don-t-use-broken-wrapper-for-mkdir.patch
@@ -1,21 +1,21 @@
-From ebc101e0728b9db6c687cff525e5dfc8eb0edbf3 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Thu, 3 Nov 2011 14:27:15 +0100
-Subject: [PATCH 2/8] php: don't use broken wrapper for mkdir
+From 8707720c0aea405f0e06d67354f239232cc823cc Mon Sep 17 00:00:00 2001
+From: Claude Bing <cbing@cybernetics.com>
+Date: Tue, 9 Nov 2021 13:10:02 -0500
+Subject: [PATCH 09/11] php: don't use broken wrapper for mkdir
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 
 update patch to version 7.4.4
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
-
-Upstream-Status: Inappropriate
 
+update patch to version 8.0.12
+Signed-off-by: Claude Bing <cbing@cybernetics.com>
+---
  build/Makefile.global | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/build/Makefile.global b/build/Makefile.global
-index ff858c2..ae554b4 100644
+index 6566d052de..eb39421f2a 100644
 --- a/build/Makefile.global
 +++ b/build/Makefile.global
 @@ -1,4 +1,4 @@
@@ -25,5 +25,5 @@ index ff858c2..ae554b4 100644
  INSTALL_DATA = $(INSTALL) -m 644
  
 -- 
-1.9.3
+2.25.1
 
diff --git a/meta-oe/recipes-devtools/php/php/0010-iconv-fix-detection.patch b/meta-oe/recipes-devtools/php/php/0010-iconv-fix-detection.patch
new file mode 100644
index 0000000000..e3b8cd4707
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/0010-iconv-fix-detection.patch
@@ -0,0 +1,35 @@
+From a04aabc5b80371e579fbaffdd417627390d22722 Mon Sep 17 00:00:00 2001
+From: Claude Bing <cbing@cybernetics.com>
+Date: Tue, 9 Nov 2021 13:10:33 -0500
+Subject: [PATCH 10/11] iconv: fix detection
+
+Upstream-Status: Pending
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+
+update patch to version 7.4.4
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+update patch to version 8.0.12
+Signed-off-by: Claude Bing <cbing@cybernetics.com>
+---
+ build/php.m4 | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/build/php.m4 b/build/php.m4
+index 93551d9ca7..dba50825fb 100644
+--- a/build/php.m4
++++ b/build/php.m4
+@@ -1919,7 +1919,8 @@ AC_DEFUN([PHP_SETUP_ICONV], [
+   unset ICONV_DIR
+ 
+   dnl Check libc first if no path is provided in --with-iconv.
+-  if test "$PHP_ICONV" = "yes"; then
++  dnl must check against no, not against yes as PHP_ICONV can also include a path, which implies yes
++  if test "$PHP_ICONV" != "no"; then
+     dnl Reset LIBS temporarily as it may have already been included -liconv in.
+     LIBS_save="$LIBS"
+     LIBS=
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/php/php/0011-opcache-jit-use-minilua-in-sysroot.patch b/meta-oe/recipes-devtools/php/php/0011-opcache-jit-use-minilua-in-sysroot.patch
new file mode 100644
index 0000000000..2ba0f2b771
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/0011-opcache-jit-use-minilua-in-sysroot.patch
@@ -0,0 +1,29 @@
+From aaa6a81cfb20f9b3c25aa22e5a472c0f2867f72c Mon Sep 17 00:00:00 2001
+From: Claude Bing <cbing@cybernetics.com>
+Date: Tue, 9 Nov 2021 13:11:42 -0500
+Subject: [PATCH 11/11] opcache/jit: use minilua in sysroot
+
+Signed-off-by: Claude Bing <cbing@cybernetics.com>
+---
+ ext/opcache/jit/Makefile.frag | 7 ++-----
+ 1 file changed, 2 insertions(+), 5 deletions(-)
+
+diff --git a/ext/opcache/jit/Makefile.frag b/ext/opcache/jit/Makefile.frag
+index b3af5b290a..f2e737e463 100644
+--- a/ext/opcache/jit/Makefile.frag
++++ b/ext/opcache/jit/Makefile.frag
+@@ -1,9 +1,6 @@
+ 
+-$(builddir)/minilua: $(srcdir)/jit/dynasm/minilua.c
+-	$(CC) $(srcdir)/jit/dynasm/minilua.c -lm -o $@
+-
+-$(builddir)/jit/zend_jit_x86.c: $(srcdir)/jit/zend_jit_x86.dasc $(srcdir)/jit/dynasm/*.lua $(builddir)/minilua
+-	$(builddir)/minilua $(srcdir)/jit/dynasm/dynasm.lua  $(DASM_FLAGS) -o $@ $(srcdir)/jit/zend_jit_x86.dasc
++$(builddir)/jit/zend_jit_x86.c: $(srcdir)/jit/zend_jit_x86.dasc $(srcdir)/jit/dynasm/*.lua
++	@minilua $(srcdir)/jit/dynasm/dynasm.lua  $(DASM_FLAGS) -o $@ $(srcdir)/jit/zend_jit_x86.dasc
+ 
+ $(builddir)/jit/zend_jit.lo: \
+ 	$(builddir)/jit/zend_jit_x86.c \
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/php/php/70_mod_php7.conf b/meta-oe/recipes-devtools/php/php/70_mod_php8.conf
similarity index 84%
rename from meta-oe/recipes-devtools/php/php/70_mod_php7.conf
rename to meta-oe/recipes-devtools/php/php/70_mod_php8.conf
index d206265a25..5a9dc91c6c 100644
--- a/meta-oe/recipes-devtools/php/php/70_mod_php7.conf
+++ b/meta-oe/recipes-devtools/php/php/70_mod_php8.conf
@@ -1,6 +1,6 @@
 LoadModule php7_module lib/apache2/modules/libphp7.so
 
-<FilesMatch "\.ph(p[2-7]?|tml)$">
+<FilesMatch "\.ph(p[2-8]?|tml)$">
 	SetHandler application/x-httpd-php
 </FilesMatch>
 
diff --git a/meta-oe/recipes-devtools/php/php/iconv.patch b/meta-oe/recipes-devtools/php/php/iconv.patch
deleted file mode 100644
index 9ec8a89b57..0000000000
--- a/meta-oe/recipes-devtools/php/php/iconv.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Subject: [PATCH] From 17cc5645f3acf943a5a06465d09d0ebcfea987bd Mon Sep 17
- 00:00:00 2001 From: Koen Kooi <koen@dominion.thruhere.net> Date: Wed, 2 Nov
- 2011 16:54:57 +0100 Subject: [PATCH] Upstream-Status: Pending
-
-update patch to version 7.4.4
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- build/php.m4        | 3 ++-
- ext/iconv/config.m4 | 2 +-
- 2 files changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/build/php.m4 b/build/php.m4
-index 7392876..5c45d13 100644
---- a/build/php.m4
-+++ b/build/php.m4
-@@ -1950,7 +1950,8 @@ AC_DEFUN([PHP_SETUP_ICONV], [
-   echo > ext/iconv/php_iconv_supports_errno.h
- 
-   dnl Check libc first if no path is provided in --with-iconv.
--  if test "$PHP_ICONV" = "yes"; then
-+  dnl must check against no, not against yes as PHP_ICONV can also include a path, which implies yes
-+  if test "$PHP_ICONV" != "no"; then
-     dnl Reset LIBS temporarily as it may have already been included -liconv in.
-     LIBS_save="$LIBS"
-     LIBS=
-diff --git a/ext/iconv/config.m4 b/ext/iconv/config.m4
-index fe9b47a..b6b632f 100644
---- a/ext/iconv/config.m4
-+++ b/ext/iconv/config.m4
-@@ -14,7 +14,7 @@ if test "$PHP_ICONV" != "no"; then
- 
-   if test "$iconv_avail" != "no"; then
-     if test -z "$ICONV_DIR"; then
--      for i in /usr/local /usr; do
-+      for i in $PHP_ICONV /usr/local /usr; do
-         if test -f "$i/include/iconv.h" || test -f "$i/include/giconv.h"; then
-           PHP_ICONV_PREFIX="$i"
-           break
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-devtools/php/php/xfail_two_bug_tests.patch b/meta-oe/recipes-devtools/php/php/xfail_two_bug_tests.patch
deleted file mode 100644
index 21057439c9..0000000000
--- a/meta-oe/recipes-devtools/php/php/xfail_two_bug_tests.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-php-ptest: xfail two tests
-
-If and when these tests are modified to expect the correct output, they will
-succeed and generate warnings in the test summary.  This patch can then be removed.
-
-Note that we add a closing '?>' to one test so that it can be executed directly by php.
-
-Upstream-Status: Pending
-
-Signed-off-By: Joe Slater <joe.slater@windriver.com>
-
-
---- a/tests/basic/bug71273.phpt
-+++ b/tests/basic/bug71273.phpt
-@@ -16,6 +16,8 @@ Bug #71273 A wrong ext directory setup i
- 	var_dump(preg_match(",.+a[\\/].+[\\/]w.php_kartoffelbrei.dll.+,s", $out));
- ?>
- ==DONE==
-+--XFAIL--
-+Output is int(0), not int(1)
- --EXPECT--
- int(1)
- ==DONE==
---- a/tests/run-test/bug75042-3.phpt
-+++ b/tests/run-test/bug75042-3.phpt
-@@ -8,5 +8,8 @@ display_errors=1
- nonexistentsharedmodule
- --FILE--
- <?php
-+?>
-+--XFAIL--
-+No warning message printed.
- --EXPECTF--
- PHP Warning:  PHP Startup: Unable to load dynamic library '%snonexistentsharedmodule.%s' %A
diff --git a/meta-oe/recipes-devtools/php/php_7.4.21.bb b/meta-oe/recipes-devtools/php/php_8.0.12.bb
similarity index 92%
rename from meta-oe/recipes-devtools/php/php_7.4.21.bb
rename to meta-oe/recipes-devtools/php/php_8.0.12.bb
index ab87ced885..300499de5c 100644
--- a/meta-oe/recipes-devtools/php/php_7.4.21.bb
+++ b/meta-oe/recipes-devtools/php/php_8.0.12.bb
@@ -12,28 +12,28 @@ DEPENDS:class-native = "zlib-native libxml2-native"
 PHP_MAJOR_VERSION = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "http://php.net/distributions/php-${PV}.tar.bz2 \
-           file://0001-php-don-t-use-broken-wrapper-for-mkdir.patch \
-           file://debian-php-fixheader.patch \
-           file://0001-configure.ac-don-t-include-build-libtool.m4.patch \
-           file://0001-php.m4-don-t-unset-cache-variables.patch \
+           file://0002-build-php.m4-don-t-unset-cache-variables.patch \
+           file://0003-php-remove-host-specific-info-from-header-file.patch \
+           file://0004-configure.ac-don-t-include-build-libtool.m4.patch \
+           file://0009-php-don-t-use-broken-wrapper-for-mkdir.patch \
+           file://0010-iconv-fix-detection.patch \
           "
 
 SRC_URI:append:class-target = " \
-            file://iconv.patch \
-            file://imap-fix-autofoo.patch \
-            file://php_exec_native.patch \
+            file://0001-ext-opcache-config.m4-enable-opcache.patch \
+            file://0005-pear-fix-Makefile.frag-for-Yocto.patch \
+            file://0006-ext-phar-Makefile.frag-Fix-phar-packaging.patch \
+            file://0007-sapi-cli-config.m4-fix-build-directory.patch \
+            file://0008-ext-imap-config.m4-fix-include-paths.patch \
+            file://0011-opcache-jit-use-minilua-in-sysroot.patch \
             file://php-fpm.conf \
             file://php-fpm-apache.conf \
             file://70_mod_php${PHP_MAJOR_VERSION}.conf \
             file://php-fpm.service \
-            file://pear-makefile.patch \
-            file://phar-makefile.patch \
-            file://0001-opcache-config.m4-enable-opcache.patch \
-            file://xfail_two_bug_tests.patch \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "36ec6102e757e2c2b7742057a700bbff77c76fa0ccbe9c860398c3d24e32822a"
+SRC_URI[sha256sum] = "b4886db1df322dc8fb128d8b34ae7e94f6fc682ecb29ff4f5a591d4de9feadbf"
 
 
 inherit autotools pkgconfig python3native gettext
@@ -258,6 +258,10 @@ RCONFLICTS:${PN}-modphp = "${MODPHP_OLDPACKAGE}"
 do_install:append:class-native() {
     create_wrapper ${D}${bindir}/php \
         PHP_PEAR_SYSCONF_DIR=${sysconfdir}/
+
+    if [ "$MACHINE_ARCH" == "x86" || "$MACHINE_ARCH" == "x86-64" ]; then
+        install -m 0755 ${WORKDIR}/build/ext/opcache/minilua ${D}${bindir}/
+    fi
 }
 
 
-- 
2.33.1


