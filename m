Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF8D2CCA470
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 20:04:47 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.2106.1759781077905743790
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 13:04:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i9y+L/dT;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afcb78ead12so973993166b.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 13:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759781076; x=1760385876; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=G7Dv4DhTa5sGFb+2sdr8A5NkUCqrBXDECFaH2kylqi8=;
        b=i9y+L/dTGVWyjc6c7ynbo2dtoRwRzc42Z/LWu4YKKv0RHbmYIIxLqZ+UsQwE4AeL4p
         wvvCuTZPzzopvZfMtGTnAvNtyznUWv/fFg30YXe6e/geFone6Ht4IqOJgsUkxc+fBIvF
         5oFkJ1SKhjzo1sk+TaWiBuuj0XVijDj/43gcz/bqPSZy4pxbnLTibEc7VWF+P5LUmKV4
         RKpy7X78DNGzp6KmJrlpkRGjbjEgARUQpQwsvmU577skwiGsDRqYpHl7lKLxvUkugjpA
         MR09COoMvJwdLzqqG97XBEW4yYZyuHNK7zCEBCAYWAWbARKi17Rm2gNcAY/51ENaZnh0
         hYNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759781076; x=1760385876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G7Dv4DhTa5sGFb+2sdr8A5NkUCqrBXDECFaH2kylqi8=;
        b=GZQvNm2eaVttMawykIYckd9haIO1uGMvpAWBxX6EBR03NHsgax5U3F0Mdr1kXzQfEM
         ak/VZrnKp9cjFe4cUqJC2I1aYRF8kwp2il3WDlN/JvaaIR/HK8QnX57DO5Ke/foLWvAZ
         wBEdFMqiTXdDpuINQN4P+BXTl38asoNIgzOvHDyHCFaBWi40QwUXPQM6E0rMHN51oHNS
         kJs6zmi/4wtdezr+jB2OV6gJINqOon1cxH9V6A6dGcoBwBkPzjO2aBND0N5K9YTy53GX
         6oxpEnEYwF6IFSl0Ou/oTmtcMw5+wFMamB/EZoEvjyT/DIBYB8hokMx0D2kTe3mOKV3Q
         p3Uw==
X-Gm-Message-State: AOJu0YxP0x2V5oM0+HbGr5/LIIy1DF3oagEbxOoSNvx5iaOFMxVoOxQF
	dP7BpS6IiNeEArJXC7NmainRHUAA00WHQhHvI6IRdej+UfMdoK1DALLsK2tpdw==
X-Gm-Gg: ASbGncvcfUW1QA8O5dAvgRWImizjKUilRwROTilG+XJOlakKkPs1R46AzLyrxpNSd4/
	R33t2BruOA9RKyGUtSVegJTHLx2VKsMWihAS7UKLTs6JArZ8sh0j65zg9FRKV3IZKy6OqRGEzaS
	rUFKbjhz8bycsfAtdvQnXG6WMJzwTp54yAXC+FLzB3mMq+krT73R2PEFi/Jocb/nSgznoIkGEvO
	ggFqyERbS6ssC3qxPTZ5uZo/1ROtOO4XcanQRccgDEBClAOq6ra5Xlaa+WictDHPhWB/s9FaRO9
	V0ZzXotgIHunsRNre+PBFUrgDyiIDhZkmiK1MRIKt6PlDzkAj6AVYlTtKOqe55e1Cl+e+z7N5R0
	lW1rW3OlfmvfsafAnnLfAyTNeUtu8qID4ptrksf1EAIG+
X-Google-Smtp-Source: AGHT+IE6//WaJ4Zq9pqqdLHieSk5mOUgecLU4WKtywFdbHAq/F7FmD9tLHHd353llPXTPkl1v4nh8A==
X-Received: by 2002:a17:907:3f14:b0:afe:7b8c:a583 with SMTP id a640c23a62f3a-b49c1d60b30mr1732283566b.13.1759781075832;
        Mon, 06 Oct 2025 13:04:35 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6396f73ae64sm5553240a12.9.2025.10.06.13.04.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 13:04:35 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH v2] dovecot: upgrade 2.3.21.1 -> 2.4.1-4
Date: Mon,  6 Oct 2025 22:04:34 +0200
Message-ID: <20251006200434.1077514-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 20:04:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120313

Remove obsolete CVE_STATUS variable: CVE-2016-4983 is marked for v2.3.

Drop 0001-not-check-pandoc.patch because it became obsolete, pandoc is
not used anymore.
Drop 1ccd5b54a408d12fce0c94ab0bbaedbb5ef69830.patch, because it is
included in this release.

Add a backported patch to fix compiling with musl.

Changelog:
2.4: https://github.com/dovecot/core/releases/tag/2.4.0
2.4.1: https://github.com/dovecot/core/releases/tag/2.4.1

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: Backport patch to fix musl compilation.

 ...vert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch | 59 ++++---------------
 ...bunwind-instead-of-libunwind-generic.patch | 21 +++----
 .../dovecot/0001-not-check-pandoc.patch       | 28 ---------
 ...5b54a408d12fce0c94ab0bbaedbb5ef69830.patch | 24 --------
 .../dovecot/fix-musl-compilation.patch        | 28 +++++++++
 ...dovecot_2.3.21.1.bb => dovecot_2.4.1-4.bb} | 15 ++---
 6 files changed, 58 insertions(+), 117 deletions(-)
 delete mode 100644 meta-networking/recipes-support/dovecot/dovecot/0001-not-check-pandoc.patch
 delete mode 100644 meta-networking/recipes-support/dovecot/dovecot/1ccd5b54a408d12fce0c94ab0bbaedbb5ef69830.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/fix-musl-compilation.patch
 rename meta-networking/recipes-support/dovecot/{dovecot_2.3.21.1.bb => dovecot_2.4.1-4.bb} (81%)

diff --git a/meta-networking/recipes-support/dovecot/dovecot/0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch b/meta-networking/recipes-support/dovecot/dovecot/0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch
index 4fcfa48b99..abcf727a3b 100644
--- a/meta-networking/recipes-support/dovecot/dovecot/0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch
+++ b/meta-networking/recipes-support/dovecot/dovecot/0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch
@@ -16,58 +16,25 @@ Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
  m4/ioloop.m4 | 9 +++------
  2 files changed, 5 insertions(+), 10 deletions(-)
 
-diff --git a/m4/glibc.m4 b/m4/glibc.m4
-index 5d722aa..ce088d3 100644
---- a/m4/glibc.m4
-+++ b/m4/glibc.m4
-@@ -17,7 +17,7 @@ AC_DEFUN([DOVECOT_GLIBC], [
+--- ./m4/glibc.m4	2025-10-04 22:42:24.336965366 +0200
++++ ./m4/glibc.m4	2025-10-04 22:47:30.578745494 +0200
+@@ -2,7 +2,7 @@
    dnl * Old glibcs have broken posix_fallocate(). Make sure not to use it.
    dnl * It may also be broken in AIX.
    AC_CACHE_CHECK([whether posix_fallocate() works],i_cv_posix_fallocate_works,[
--    AC_TRY_RUN([
-+    AC_TRY_LINK([
+-    AC_RUN_IFELSE([AC_LANG_PROGRAM([[
++    AC_LINK_IFELSE([AC_LANG_PROGRAM([[
        #define _XOPEN_SOURCE 600
        #include <stdio.h>
        #include <stdlib.h>
-@@ -26,7 +26,7 @@ AC_DEFUN([DOVECOT_GLIBC], [
-       #if defined(__GLIBC__) && (__GLIBC__ < 2 || __GLIBC_MINOR__ < 7)
-         possibly broken posix_fallocate
-       #endif
--      int main() {
-+      ], [
-         int fd = creat("conftest.temp", 0600);
-         int ret;
-         if (fd == -1) {
-@@ -35,8 +35,6 @@ AC_DEFUN([DOVECOT_GLIBC], [
-         }
-         ret = posix_fallocate(fd, 1024, 1024) < 0 ? 1 : 0;
-         unlink("conftest.temp");
--        return ret;
--      }
-     ], [
-       i_cv_posix_fallocate_works=yes
-     ], [
-diff --git a/m4/ioloop.m4 b/m4/ioloop.m4
-index 0f7dde0..f40fd62 100644
---- a/m4/ioloop.m4
-+++ b/m4/ioloop.m4
-@@ -4,13 +4,10 @@ AC_DEFUN([DOVECOT_IOLOOP], [
+--- ./m4/ioloop.m4.orig	2025-10-04 22:47:44.656705137 +0200
++++ ./m4/ioloop.m4	2025-10-04 22:48:32.379618966 +0200
+@@ -4,7 +4,7 @@
    
-   if test "$ioloop" = "best" || test "$ioloop" = "epoll"; then
+   AS_IF([test "$ioloop" = "best" || test "$ioloop" = "epoll"], [
      AC_CACHE_CHECK([whether we can use epoll],i_cv_epoll_works,[
--      AC_TRY_RUN([
-+      AC_TRY_LINK([
+-      AC_RUN_IFELSE([AC_LANG_PROGRAM([[
++      AC_LINK_IFELSE([AC_LANG_PROGRAM([[
          #include <sys/epoll.h>
--    
--        int main()
--        {
--  	return epoll_create(5) < 1;
--        }
-+      ], [
-+      epoll_create(5) < 1;
-       ], [
-         i_cv_epoll_works=yes
-       ], [
--- 
-2.25.1
-
+       ]], [[
+         return epoll_create(5) < 1;
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0001-m4-Check-for-libunwind-instead-of-libunwind-generic.patch b/meta-networking/recipes-support/dovecot/dovecot/0001-m4-Check-for-libunwind-instead-of-libunwind-generic.patch
index ec7a26a329..697fc02193 100644
--- a/meta-networking/recipes-support/dovecot/dovecot/0001-m4-Check-for-libunwind-instead-of-libunwind-generic.patch
+++ b/meta-networking/recipes-support/dovecot/dovecot/0001-m4-Check-for-libunwind-instead-of-libunwind-generic.patch
@@ -14,17 +14,14 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 diff --git a/m4/want_unwind.m4 b/m4/want_unwind.m4
 index cadb62b..5517314 100644
---- a/m4/want_unwind.m4
-+++ b/m4/want_unwind.m4
-@@ -2,7 +2,7 @@ AC_DEFUN([DOVECOT_WANT_UNWIND], [
+--- ./m4/want_unwind.m4	2025-10-04 22:57:09.371034202 +0200
++++ ./m4/want_unwind.m4	2025-10-04 22:57:30.954794164 +0200
+@@ -2,7 +2,7 @@
    have_libunwind=no
+ 
    AS_IF([test "$want_libunwind" != "no"], [
-     PKG_CHECK_EXISTS([libunwind], [
--      PKG_CHECK_MODULES([LIBUNWIND], [libunwind-generic],[
-+      PKG_CHECK_MODULES([LIBUNWIND], [libunwind],[
-         have_libunwind=yes
- 	AC_DEFINE([HAVE_LIBUNWIND],,[Define this if you have libunwind])
-       ])
--- 
-2.31.1
-
+-    PKG_CHECK_MODULES([LIBUNWIND], [libunwind-generic], [have_libunwind=yes], [
++    PKG_CHECK_MODULES([LIBUNWIND], [libunwind], [have_libunwind=yes], [
+       have_libunwind=no
+ 
+       AS_IF([test "$want_libunwind" = "yes"], [
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0001-not-check-pandoc.patch b/meta-networking/recipes-support/dovecot/dovecot/0001-not-check-pandoc.patch
deleted file mode 100644
index af69c82f0f..0000000000
--- a/meta-networking/recipes-support/dovecot/dovecot/0001-not-check-pandoc.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 8c7d143ff28441c8b74b0f518dd2281239aede3d Mon Sep 17 00:00:00 2001
-From: Wang Mingyu <wangmy@cn.fujitsu.com>
-Date: Fri, 15 Jan 2021 11:10:22 +0900
-Subject: [PATCH] not check pandoc
-
-Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
----
-Upstream-Status: Pending
-
- m4/dovecot.m4 | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/m4/dovecot.m4 b/m4/dovecot.m4
-index 2b5d895..ece8489 100644
---- a/m4/dovecot.m4
-+++ b/m4/dovecot.m4
-@@ -447,7 +447,7 @@ AC_DEFUN([DC_PANDOC], [
-   dnl Optional tool for making documentation
-   AC_CHECK_PROGS(PANDOC, [pandoc], [true])
- 
--  AS_IF([test "$PANDOC" = "true"], [
-+  AS_IF([test "$PANDOC" = "false"], [
-    AS_IF([test ! -e README], [
-      AC_MSG_ERROR([Cannot produce documentation without pandoc - disable with PANDOC=false ./configure])
-    ])
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-support/dovecot/dovecot/1ccd5b54a408d12fce0c94ab0bbaedbb5ef69830.patch b/meta-networking/recipes-support/dovecot/dovecot/1ccd5b54a408d12fce0c94ab0bbaedbb5ef69830.patch
deleted file mode 100644
index 0765d963c1..0000000000
--- a/meta-networking/recipes-support/dovecot/dovecot/1ccd5b54a408d12fce0c94ab0bbaedbb5ef69830.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 1ccd5b54a408d12fce0c94ab0bbaedbb5ef69830 Mon Sep 17 00:00:00 2001
-From: fundawang <fundawang@yeah.net>
-Date: Sun, 27 Oct 2024 22:11:21 +0800
-Subject: [PATCH] configure: Explicitly check for icu-uc
-
-Ensure we link against libicu-uc when it's split in v76.
-
-Upstream-Status: Backport [https://github.com/dovecot/core/commit/1ccd5b54a408d12fce0c94ab0bbaedbb5ef69830]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- m4/want_icu.m4 | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/m4/want_icu.m4
-+++ b/m4/want_icu.m4
-@@ -1,7 +1,7 @@
- AC_DEFUN([DOVECOT_WANT_ICU], [
-   if test "$want_icu" != "no"; then
-     if test "$PKG_CONFIG" != "" && $PKG_CONFIG --exists icu-i18n 2>/dev/null; then
--      PKG_CHECK_MODULES(LIBICU, icu-i18n)
-+      PKG_CHECK_MODULES(LIBICU, [icu-i18n icu-uc])
-       have_icu=yes
-       AC_DEFINE(HAVE_LIBICU,, [Define if you want ICU normalization support for FTS])
-     elif test "$want_icu" = "yes"; then
diff --git a/meta-networking/recipes-support/dovecot/dovecot/fix-musl-compilation.patch b/meta-networking/recipes-support/dovecot/dovecot/fix-musl-compilation.patch
new file mode 100644
index 0000000000..a09165e588
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/fix-musl-compilation.patch
@@ -0,0 +1,28 @@
+From 951e371b6e44e2051de83c9fe73c778858fa73a1 Mon Sep 17 00:00:00 2001
+From: Fabian Groffen <grobian@gentoo.org>
+Date: Sat, 31 May 2025 10:49:28 +0200
+Subject: [PATCH] lib: cpu-count - fix compilation using musl
+
+The macros, types and symbols CPU_* and cpuset_t are not exposed in
+musl's sched.h unless _GNU_SOURCE is set.
+
+Upstream-Status: Backport [https://github.com/dovecot/core/commit/951e371b6e44e2051de83c9fe73c778858fa73a1]
+
+Signed-off-by: Fabian Groffen <grobian@gentoo.org>
+---
+ src/lib/cpu-count.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/lib/cpu-count.c b/src/lib/cpu-count.c
+index 3eb38fa47d8..a3e80e6c157 100644
+--- a/src/lib/cpu-count.c
++++ b/src/lib/cpu-count.c
+@@ -3,6 +3,8 @@
+ 
+ #ifdef HAVE_SCHED_H
+ #  define __USE_GNU
++/* _GNU_SOURCE: for musl's sched.h to expose cpuset/CPU_* */
++#  define _GNU_SOURCE
+ #  include <sched.h>
+ #  ifdef HAVE_SYS_CPUSET_H
+ #    include <sys/cpuset.h>
diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.3.21.1.bb b/meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb
similarity index 81%
rename from meta-networking/recipes-support/dovecot/dovecot_2.3.21.1.bb
rename to meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb
index 3177cdb1d7..a06fd45199 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.3.21.1.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb
@@ -1,19 +1,22 @@
 SUMMARY = "Dovecot is an open source IMAP and POP3 email server"
 HOMEPAGE = "https://www.dovecot.org/"
-DESCRIPTION = "Dovecot is an open source IMAP and POP3 email server for Linux/UNIX-like systems, written with security primarily in mind. Dovecot is an excellent choice for both small and large installations. It's fast, simple to set up, requires no special administration and it uses very little memory."
+DESCRIPTION = "Dovecot is an open source IMAP and POP3 email \
+server for Linux/UNIX-like systems, written with security primarily \
+in mind. Dovecot is an excellent choice for both small and large \
+installations. It's fast, simple to set up, requires no special \
+administration and it uses very little memory."
 SECTION = "mail"
 LICENSE = "LGPL-2.1-only & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2956560272e5b31d9d64f03111732048"
 
-SRC_URI = "http://dovecot.org/releases/2.3/dovecot-${PV}.tar.gz \
+SRC_URI = "http://dovecot.org/releases/2.4/dovecot-${PV}.tar.gz \
            file://0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch \
            file://dovecot.service \
            file://dovecot.socket \
-           file://0001-not-check-pandoc.patch \
            file://0001-m4-Check-for-libunwind-instead-of-libunwind-generic.patch \
-           file://1ccd5b54a408d12fce0c94ab0bbaedbb5ef69830.patch \
+           file://fix-musl-compilation.patch \
            "
-SRC_URI[sha256sum] = "2d90a178c4297611088bf7daae5492a3bc3d5ab6328c3a032eb425d2c249097e"
+SRC_URI[sha256sum] = "fb188603f419ed7aaa07794a8692098c3ec2660bb9c67d0efe24948cbb32ae00"
 
 DEPENDS = "openssl xz zlib bzip2 libcap icu libtirpc bison-native"
 CFLAGS += "-I${STAGING_INCDIR}/tirpc"
@@ -72,5 +75,3 @@ FILES:${PN} += "${libdir}/dovecot/*plugin.so \
 FILES:${PN}-staticdev += "${libdir}/dovecot/*/*.a"
 FILES:${PN}-dev += "${libdir}/dovecot/libdovecot*.so"
 FILES:${PN}-dbg += "${libdir}/dovecot/*/.debug"
-
-CVE_STATUS[CVE-2016-4983] = "not-applicable-platform: Affects only postinstall script on specific distribution."

