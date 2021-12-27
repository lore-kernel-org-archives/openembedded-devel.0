Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44210C433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Dec 2021 21:44:45 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web09.31494.1640641484495891480
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 13:44:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fgC9rXmH;
 spf=pass (domain: gmail.com, ip: 209.85.215.180,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 8so14401747pgc.10
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 13:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q5tMaeHb1/aRaUy4P3yrb3+57ITvErHowzRGhK9I5DM=;
        b=fgC9rXmHRMbxjxgIg48BJfnCOHtE20eublEiH/GvEWr08C/fEEfG8Bt3ga2t6s3f9s
         cLh1yM+sdzDVfQ3Ob5i4wrZEBA2gCmniuvuLEcoTwlEChYghwlkWg0JlXk4P2NDjjvO2
         rTi11tK0UpYIfAt4zjCwTIzm9XLl/BzRHO1JJ40jI5TK5PsKhxINyauOL8eb/llVze38
         QZDUOv5HIhg+jLakqEaSD9LFbb+W2uZeDKHpbyFxvNJoGlUNYbPifQ8yvN4NJnZ9CIpF
         FH4oa46UXOIK4ggA3jDC9zCKiH5Xb9YWPjIba/31n2mB45DZapzupjsecyUbr8KdJYy1
         PYfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q5tMaeHb1/aRaUy4P3yrb3+57ITvErHowzRGhK9I5DM=;
        b=QCahMqPt9wfSnLnNb4994/CanYaQHYZ+aJhOLNs9soYbEjtFRI7BXuaa56goHP2sVE
         e8OwQ5qv2MNDxzBWaCZp3Sj2B3shj1G/wCkblH85HhSXg9GsoT1tFPkaaCY2wJWmONaU
         U2nqZruDfVILetZfOIjzTrBKax7XQtKIyFEnOMe5IUo8DpKmfxQUn4dOtzIQFJ/47Et4
         x1XcHPTv6eDw0N7NGeitu01GpxDjORa8e1hwL0dMZSV7tMwhDwJcoGgLu+CU+uhF3joO
         lAGVz7unh4Z7Zb6HNBFBOL6aklnHilwbxObSoRtx5EAYls0Kf3w1l9MCbfuotG0CJJbE
         UU2w==
X-Gm-Message-State: AOAM533FF27CaOzmrQ+In4prYS7Vp4GoNQ72YWFHYEdul7bAlUvtgSLJ
	VVYzFO4qroyglj50rGVLVB1jK/INfOU=
X-Google-Smtp-Source: 
 ABdhPJxlM+uD96/e+tJDMCgF+uJTI3DbtZbUVYbMD1rwHeEWlgf4MOVEOPC9t5zqWV23fmvSZdzJ5g==
X-Received: by 2002:a63:3307:: with SMTP id z7mr16967292pgz.498.1640641483694;
        Mon, 27 Dec 2021 13:44:43 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:67e3:bc71:b585:c820])
        by smtp.gmail.com with ESMTPSA id
 l2sm15804903pfu.13.2021.12.27.13.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 13:44:43 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Armin kuster <akuster808@gamil.com>
Subject: [meta-networking][dunfell][PATCH] dovecot: refresh patches
Date: Mon, 27 Dec 2021 13:44:42 -0800
Message-Id: <20211227214442.482946-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Dec 2021 21:44:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94521

From: Armin kuster <akuster808@gamil.com>

Signed-off-by: Armin kuster <akuster808@gamil.com>
---
 ...vert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch | 19 ++++++++-----------
 .../0001-doveadm-Fix-parallel-build.patch     | 13 +++++--------
 ...-parser-Optimize-appending-new-part-.patch |  8 +++++---
 3 files changed, 18 insertions(+), 22 deletions(-)

diff --git a/meta-networking/recipes-support/dovecot/dovecot/0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch b/meta-networking/recipes-support/dovecot/dovecot/0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch
index f86235076e..3f87714dcc 100644
--- a/meta-networking/recipes-support/dovecot/dovecot/0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch
+++ b/meta-networking/recipes-support/dovecot/dovecot/0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch
@@ -13,11 +13,11 @@ Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
  configure.ac | 15 +++++----------
  1 file changed, 5 insertions(+), 10 deletions(-)
 
-diff --git a/configure.ac b/configure.ac
-index 3b32614..94ec002 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -519,13 +519,10 @@ have_ioloop=no
+Index: dovecot-2.2.36.4/configure.ac
+===================================================================
+--- dovecot-2.2.36.4.orig/configure.ac
++++ dovecot-2.2.36.4/configure.ac
+@@ -490,13 +490,10 @@ have_ioloop=no
  
  if test "$ioloop" = "best" || test "$ioloop" = "epoll"; then
    AC_CACHE_CHECK([whether we can use epoll],i_cv_epoll_works,[
@@ -34,7 +34,7 @@ index 3b32614..94ec002 100644
      ], [
        i_cv_epoll_works=yes
      ], [
-@@ -653,7 +650,7 @@ fi
+@@ -596,7 +593,7 @@ fi
  dnl * Old glibcs have broken posix_fallocate(). Make sure not to use it.
  dnl * It may also be broken in AIX.
  AC_CACHE_CHECK([whether posix_fallocate() works],i_cv_posix_fallocate_works,[
@@ -43,7 +43,7 @@ index 3b32614..94ec002 100644
      #define _XOPEN_SOURCE 600
      #include <stdio.h>
      #include <stdlib.h>
-@@ -662,7 +659,7 @@ AC_CACHE_CHECK([whether posix_fallocate() works],i_cv_posix_fallocate_works,[
+@@ -605,7 +602,7 @@ AC_CACHE_CHECK([whether posix_fallocate(
      #if defined(__GLIBC__) && (__GLIBC__ < 2 || __GLIBC_MINOR__ < 7)
        possibly broken posix_fallocate
      #endif
@@ -52,7 +52,7 @@ index 3b32614..94ec002 100644
        int fd = creat("conftest.temp", 0600);
        int ret;
        if (fd == -1) {
-@@ -671,8 +668,6 @@ AC_CACHE_CHECK([whether posix_fallocate() works],i_cv_posix_fallocate_works,[
+@@ -614,8 +611,6 @@ AC_CACHE_CHECK([whether posix_fallocate(
        }
        ret = posix_fallocate(fd, 1024, 1024) < 0 ? 1 : 0;
        unlink("conftest.temp");
@@ -61,6 +61,3 @@ index 3b32614..94ec002 100644
    ], [
      i_cv_posix_fallocate_works=yes
    ], [
--- 
-1.8.4.2
-
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0001-doveadm-Fix-parallel-build.patch b/meta-networking/recipes-support/dovecot/dovecot/0001-doveadm-Fix-parallel-build.patch
index 65ae9bf910..3170ae8658 100644
--- a/meta-networking/recipes-support/dovecot/dovecot/0001-doveadm-Fix-parallel-build.patch
+++ b/meta-networking/recipes-support/dovecot/dovecot/0001-doveadm-Fix-parallel-build.patch
@@ -18,11 +18,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/doveadm/Makefile.am | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/src/doveadm/Makefile.am b/src/doveadm/Makefile.am
-index c644646..6ae9144 100644
---- a/src/doveadm/Makefile.am
-+++ b/src/doveadm/Makefile.am
-@@ -180,8 +180,8 @@ test_libs = \
+Index: dovecot-2.2.36.4/src/doveadm/Makefile.am
+===================================================================
+--- dovecot-2.2.36.4.orig/src/doveadm/Makefile.am
++++ dovecot-2.2.36.4/src/doveadm/Makefile.am
+@@ -182,8 +182,8 @@ test_libs = \
  	../lib/liblib.la
  test_deps = $(noinst_LTLIBRARIES) $(test_libs)
  
@@ -33,6 +33,3 @@ index c644646..6ae9144 100644
  test_doveadm_util_DEPENDENCIES = $(test_deps)
  
  check: check-am check-test
--- 
-2.14.2
-
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0004-lib-mail-message-parser-Optimize-appending-new-part-.patch b/meta-networking/recipes-support/dovecot/dovecot/0004-lib-mail-message-parser-Optimize-appending-new-part-.patch
index c35bf883e6..ba6667fa99 100644
--- a/meta-networking/recipes-support/dovecot/dovecot/0004-lib-mail-message-parser-Optimize-appending-new-part-.patch
+++ b/meta-networking/recipes-support/dovecot/dovecot/0004-lib-mail-message-parser-Optimize-appending-new-part-.patch
@@ -14,10 +14,12 @@ CVE: CVE-2020-12100
 Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz]
 Comment: No change in any hunk
 
---- a/src/lib-mail/message-parser.c
-+++ b/src/lib-mail/message-parser.c
+Index: dovecot-2.2.36.4/src/lib-mail/message-parser.c
+===================================================================
+--- dovecot-2.2.36.4.orig/src/lib-mail/message-parser.c
++++ dovecot-2.2.36.4/src/lib-mail/message-parser.c
 @@ -1,7 +1,7 @@
- /* Copyright (c) 2002-2017 Dovecot authors, see the included COPYING file */
+ /* Copyright (c) 2002-2018 Dovecot authors, see the included COPYING file */
  
  #include "lib.h"
 -#include "buffer.h"
-- 
2.25.1


