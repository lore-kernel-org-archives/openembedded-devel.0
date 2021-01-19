Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.8409.1611038120368269184
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jan 2021 22:35:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; 
   d="scan'208";a="103609738"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 19 Jan 2021 14:35:18 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 1D4DF4CE603D
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Jan 2021 14:35:15 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 19 Jan 2021 14:35:14 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe][PATCH] dovecot: upgrade 2.2.36.4 -> 2.3.13
Date: Tue, 19 Jan 2021 14:35:10 +0800
Message-ID: <1611038110-39056-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 1D4DF4CE603D.A46AA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

0001-doveadm-Fix-parallel-build.patch
removed since it is included in 2.3.13

refresh 0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch

add 0001-not-check-pandoc.patch to not check pandoc of configure

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...vert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch | 99 ++++++++++---------
 .../0001-doveadm-Fix-parallel-build.patch     | 38 -------
 .../dovecot/0001-not-check-pandoc.patch       | 26 +++++
 ...{dovecot_2.2.36.4.bb => dovecot_2.3.13.bb} | 12 +--
 4 files changed, 85 insertions(+), 90 deletions(-)
 delete mode 100644 meta-networking/recipes-support/dovecot/dovecot/0001-doveadm-Fix-parallel-build.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0001-not-check-pandoc.patch
 rename meta-networking/recipes-support/dovecot/{dovecot_2.2.36.4.bb => dovecot_2.3.13.bb} (88%)

diff --git a/meta-networking/recipes-support/dovecot/dovecot/0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch b/meta-networking/recipes-support/dovecot/dovecot/0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch
index f86235076e..f16f687f24 100644
--- a/meta-networking/recipes-support/dovecot/dovecot/0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch
+++ b/meta-networking/recipes-support/dovecot/dovecot/0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch
@@ -9,58 +9,65 @@ Upstream-Status: pending
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+
+Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
 ---
- configure.ac | 15 +++++----------
- 1 file changed, 5 insertions(+), 10 deletions(-)
+ m4/glibc.m4  | 6 ++----
+ m4/ioloop.m4 | 9 +++------
+ 2 files changed, 5 insertions(+), 10 deletions(-)
 
-diff --git a/configure.ac b/configure.ac
-index 3b32614..94ec002 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -519,13 +519,10 @@ have_ioloop=no
- 
- if test "$ioloop" = "best" || test "$ioloop" = "epoll"; then
-   AC_CACHE_CHECK([whether we can use epoll],i_cv_epoll_works,[
+diff --git a/m4/glibc.m4 b/m4/glibc.m4
+index 5d722aa..ce088d3 100644
+--- a/m4/glibc.m4
++++ b/m4/glibc.m4
+@@ -17,7 +17,7 @@ AC_DEFUN([DOVECOT_GLIBC], [
+   dnl * Old glibcs have broken posix_fallocate(). Make sure not to use it.
+   dnl * It may also be broken in AIX.
+   AC_CACHE_CHECK([whether posix_fallocate() works],i_cv_posix_fallocate_works,[
 -    AC_TRY_RUN([
 +    AC_TRY_LINK([
-       #include <sys/epoll.h>
--  
--      int main()
--      {
--	return epoll_create(5) < 1;
+       #define _XOPEN_SOURCE 600
+       #include <stdio.h>
+       #include <stdlib.h>
+@@ -26,7 +26,7 @@ AC_DEFUN([DOVECOT_GLIBC], [
+       #if defined(__GLIBC__) && (__GLIBC__ < 2 || __GLIBC_MINOR__ < 7)
+         possibly broken posix_fallocate
+       #endif
+-      int main() {
++      ], [
+         int fd = creat("conftest.temp", 0600);
+         int ret;
+         if (fd == -1) {
+@@ -35,8 +35,6 @@ AC_DEFUN([DOVECOT_GLIBC], [
+         }
+         ret = posix_fallocate(fd, 1024, 1024) < 0 ? 1 : 0;
+         unlink("conftest.temp");
+-        return ret;
 -      }
-+    ], [
-+      epoll_create(5) < 1;
      ], [
-       i_cv_epoll_works=yes
+       i_cv_posix_fallocate_works=yes
      ], [
-@@ -653,7 +650,7 @@ fi
- dnl * Old glibcs have broken posix_fallocate(). Make sure not to use it.
- dnl * It may also be broken in AIX.
- AC_CACHE_CHECK([whether posix_fallocate() works],i_cv_posix_fallocate_works,[
--  AC_TRY_RUN([
-+  AC_TRY_LINK([
-     #define _XOPEN_SOURCE 600
-     #include <stdio.h>
-     #include <stdlib.h>
-@@ -662,7 +659,7 @@ AC_CACHE_CHECK([whether posix_fallocate() works],i_cv_posix_fallocate_works,[
-     #if defined(__GLIBC__) && (__GLIBC__ < 2 || __GLIBC_MINOR__ < 7)
-       possibly broken posix_fallocate
-     #endif
--    int main() {
-+    ], [
-       int fd = creat("conftest.temp", 0600);
-       int ret;
-       if (fd == -1) {
-@@ -671,8 +668,6 @@ AC_CACHE_CHECK([whether posix_fallocate() works],i_cv_posix_fallocate_works,[
-       }
-       ret = posix_fallocate(fd, 1024, 1024) < 0 ? 1 : 0;
-       unlink("conftest.temp");
--      return ret;
--    }
-   ], [
-     i_cv_posix_fallocate_works=yes
-   ], [
+diff --git a/m4/ioloop.m4 b/m4/ioloop.m4
+index 0f7dde0..f40fd62 100644
+--- a/m4/ioloop.m4
++++ b/m4/ioloop.m4
+@@ -4,13 +4,10 @@ AC_DEFUN([DOVECOT_IOLOOP], [
+   
+   if test "$ioloop" = "best" || test "$ioloop" = "epoll"; then
+     AC_CACHE_CHECK([whether we can use epoll],i_cv_epoll_works,[
+-      AC_TRY_RUN([
++      AC_TRY_LINK([
+         #include <sys/epoll.h>
+-    
+-        int main()
+-        {
+-  	return epoll_create(5) < 1;
+-        }
++      ], [
++      epoll_create(5) < 1;
+       ], [
+         i_cv_epoll_works=yes
+       ], [
 -- 
-1.8.4.2
+2.25.1
 
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0001-doveadm-Fix-parallel-build.patch b/meta-networking/recipes-support/dovecot/dovecot/0001-doveadm-Fix-parallel-build.patch
deleted file mode 100644
index 65ae9bf910..0000000000
--- a/meta-networking/recipes-support/dovecot/dovecot/0001-doveadm-Fix-parallel-build.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From be9b3809b86fe593dbb16f0b981b3d315a27b799 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 22 Oct 2017 22:10:41 -0700
-Subject: [PATCH] doveadm: Fix parallel build
-
-Sometimes dovetail build fails with errors like
-
-doveadm-util.o: file not recognized: File truncated
-collect2: error: ld returned 1 exit status
-make[4]: *** [Makefile:812: test-doveadm-util] Error 1
-
-This is partial backport from
-
-https://github.com/dovecot/core/commit/b200bc3875fa06d42c8619865cc306c3297fcacc
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/doveadm/Makefile.am | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/doveadm/Makefile.am b/src/doveadm/Makefile.am
-index c644646..6ae9144 100644
---- a/src/doveadm/Makefile.am
-+++ b/src/doveadm/Makefile.am
-@@ -180,8 +180,8 @@ test_libs = \
- 	../lib/liblib.la
- test_deps = $(noinst_LTLIBRARIES) $(test_libs)
- 
--test_doveadm_util_SOURCES = test-doveadm-util.c
--test_doveadm_util_LDADD = doveadm-util.o $(test_libs) $(MODULE_LIBS)
-+test_doveadm_util_SOURCES = doveadm-util.c test-doveadm-util.c
-+test_doveadm_util_LDADD = $(test_libs) $(MODULE_LIBS)
- test_doveadm_util_DEPENDENCIES = $(test_deps)
- 
- check: check-am check-test
--- 
-2.14.2
-
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0001-not-check-pandoc.patch b/meta-networking/recipes-support/dovecot/dovecot/0001-not-check-pandoc.patch
new file mode 100644
index 0000000000..20ba73a824
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/0001-not-check-pandoc.patch
@@ -0,0 +1,26 @@
+From 8c7d143ff28441c8b74b0f518dd2281239aede3d Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@cn.fujitsu.com>
+Date: Fri, 15 Jan 2021 11:10:22 +0900
+Subject: [PATCH] not check pandoc
+
+Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
+---
+ m4/dovecot.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/m4/dovecot.m4 b/m4/dovecot.m4
+index 2b5d895..ece8489 100644
+--- a/m4/dovecot.m4
++++ b/m4/dovecot.m4
+@@ -447,7 +447,7 @@ AC_DEFUN([DC_PANDOC], [
+   dnl Optional tool for making documentation
+   AC_CHECK_PROGS(PANDOC, [pandoc], [true])
+ 
+-  AS_IF([test "$PANDOC" = "true"], [
++  AS_IF([test "$PANDOC" = "false"], [
+    AS_IF([test ! -e README], [
+      AC_MSG_ERROR([Cannot produce documentation without pandoc - disable with PANDOC=false ./configure])
+    ])
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb b/meta-networking/recipes-support/dovecot/dovecot_2.3.13.bb
similarity index 88%
rename from meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb
rename to meta-networking/recipes-support/dovecot/dovecot_2.3.13.bb
index bda1740234..c78d283d25 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.3.13.bb
@@ -3,19 +3,19 @@ HOMEPAGE = "https://www.dovecot.org/"
 DESCRIPTION = "Dovecot is an open source IMAP and POP3 email server for Linux/UNIX-like systems, written with security primarily in mind. Dovecot is an excellent choice for both small and large installations. It's fast, simple to set up, requires no special administration and it uses very little memory."
 SECTION = "mail"
 LICENSE = "LGPLv2.1 & MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a981379bd0f1c362f8d1d21515e5b30b"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2956560272e5b31d9d64f03111732048"
 
-SRC_URI = "http://dovecot.org/releases/2.2/dovecot-${PV}.tar.gz \
+SRC_URI = "http://dovecot.org/releases/2.3/dovecot-${PV}.tar.gz \
            file://0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch \
            file://dovecot.service \
            file://dovecot.socket \
-           file://0001-doveadm-Fix-parallel-build.patch \
+           file://0001-not-check-pandoc.patch \
            "
 
-SRC_URI[md5sum] = "66c4d71858b214afee5b390ee602dee2"
-SRC_URI[sha256sum] = "777c61e264869e9b288b8d6603f4ed3ac3aac9ec573908067353f51269dce2fe"
+SRC_URI[md5sum] = "f512bf1a4dac9ac994fddfb6bc5068ff"
+SRC_URI[sha256sum] = "a3f875b80ec11a452480690108660030978c94fa8e796ad6d943a874b496f1c4"
 
-DEPENDS = "openssl xz zlib bzip2 libcap icu libtirpc"
+DEPENDS = "openssl xz zlib bzip2 libcap icu libtirpc bison-native"
 CFLAGS += "-I${STAGING_INCDIR}/tirpc"
 LDFLAGS += "-ltirpc"
 
-- 
2.25.1



