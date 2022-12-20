Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 297A2C4167B
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 19:28:18 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.433.1671564492037503507
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 11:28:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AUKB1dlA;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id c13so9189052pfp.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 11:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mIgtSjzU3da99cdBDGQ/Xg7NJROcEN4Jra0PoJed0Pk=;
        b=AUKB1dlACzs65/wJ9j3E1vL2HmoYY7tGDaxqJUMuXIcM5pTbI8Vsd/hufOB8lfIztc
         R0MvDc1bkpVI6g1y5yH6k7NXg0iVksq+LC5fhg+3+kg1kdFT4wWwswNHbzNx9vMutPFU
         n5LctDLIUf7Q6oenxHHBZq7Usobaf3yeJMUJrdaCZgDT9GpSL71ZrqoQN4fKEcd9HU3F
         +CFOAnzPWXODEn1RzJxGnJAs3YBNZ+M/qc31QEbtEyuorP1AfHnVF58uj5UWOkixOl7Q
         M+SZdbRa7bL/e3u3p4f90UP8w39LXpmrUHcwYSp2KeDdGwyPcdeMUK8kaT+xNr45v2tw
         OcKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mIgtSjzU3da99cdBDGQ/Xg7NJROcEN4Jra0PoJed0Pk=;
        b=lXq3pCJFllx507xwOJbTl7rIqm1vN1/NUGl7bbF5zxcpBKXAq5cw5fMAgwcdrquFh3
         KJdnEXC3YLEIAEYAnNLfcOEYoqYkbkd1xttUxlqD4F5aos2XWNq3hyIMhRkEKCUCfzah
         8ghAnHt+x85sdW69iUrLSHzc8q3EIT+a0gocAG01bIR1dBYh8Q2E/umWMArBneVYi7+y
         3MrV8GOqm8j60+eFJpz0tCEXxEmINKTVXsLAkAZ5QJA7zVjiQeVlrfpwWazGBBr0tRha
         FGZp8KGL3DdzNw6JZH7tmYvsk/1j+EyW8v9ycAr2JUFVDtDHZDd3z9dgsOMe8/rIm0oi
         NwEw==
X-Gm-Message-State: AFqh2kpoCdTPNtM/iHDTTCJMa9GAEJsI+fIOVBkfdH5L265lNb4VQ878
	0XLtt7Y4UkEJgnqXCR4FC4G0fmo7O9E=
X-Google-Smtp-Source: AMrXdXvoVDCTtkT0Wex0+4ynMjpnGSm+81kVVG3hjaEWLPZtqewOt4r/48/P0L8Pi4Bsmf348ez2WQ==
X-Received: by 2002:a05:6a00:1f0d:b0:573:d183:4218 with SMTP id be13-20020a056a001f0d00b00573d1834218mr13421282pfb.10.1671564490971;
        Tue, 20 Dec 2022 11:28:10 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::41f2])
        by smtp.gmail.com with ESMTPSA id i11-20020a056a00004b00b005756a67e227sm9321304pfk.90.2022.12.20.11.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 11:28:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] inotify-tools: Fix build on musl and lfs64
Date: Tue, 20 Dec 2022 11:28:08 -0800
Message-Id: <20221220192808.2441606-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 19:28:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100165

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Add-AC_SYS_LARGEFILE-autoconf-macro.patch |  28 +++++
 ...place-stat64-lstat64-with-stat-lstat.patch | 119 ++++++++++++++++++
 .../inotify-tools/inotify-tools_3.22.6.0.bb   |   4 +-
 3 files changed, 150 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/inotify-tools/inotify-tools/0002-configure-Add-AC_SYS_LARGEFILE-autoconf-macro.patch
 create mode 100644 meta-oe/recipes-support/inotify-tools/inotify-tools/0003-replace-stat64-lstat64-with-stat-lstat.patch

diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools/0002-configure-Add-AC_SYS_LARGEFILE-autoconf-macro.patch b/meta-oe/recipes-support/inotify-tools/inotify-tools/0002-configure-Add-AC_SYS_LARGEFILE-autoconf-macro.patch
new file mode 100644
index 0000000000..3b195aae4f
--- /dev/null
+++ b/meta-oe/recipes-support/inotify-tools/inotify-tools/0002-configure-Add-AC_SYS_LARGEFILE-autoconf-macro.patch
@@ -0,0 +1,28 @@
+From 6a57ff26d695aaad096b798879a5dbc5af2cedf5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 20 Dec 2022 10:46:50 -0800
+Subject: [PATCH] configure: Add AC_SYS_LARGEFILE autoconf macro
+
+This will define _FILE_OFFSET_BITS to be 64 if off_t is 64bit
+and we do not need to define lfs64 functions
+
+Upstream-Status: Submitted [https://github.com/inotify-tools/inotify-tools/pull/174]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index bddf14d..b89a266 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -17,6 +17,9 @@ AC_PROG_CC
+ AM_INIT_AUTOMAKE
+ LT_INIT
+ 
++# Add option for largefile support
++AC_SYS_LARGEFILE
++
+ AC_PATH_PROG(DOXYGEN, doxygen, NO_DOXYGEN)
+ 
+ AC_ARG_ENABLE(doxygen,
diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools/0003-replace-stat64-lstat64-with-stat-lstat.patch b/meta-oe/recipes-support/inotify-tools/inotify-tools/0003-replace-stat64-lstat64-with-stat-lstat.patch
new file mode 100644
index 0000000000..c0784ecc73
--- /dev/null
+++ b/meta-oe/recipes-support/inotify-tools/inotify-tools/0003-replace-stat64-lstat64-with-stat-lstat.patch
@@ -0,0 +1,119 @@
+From c6093ad63b92f5d25e6826d1c49dc7cee86d3747 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 20 Dec 2022 10:48:10 -0800
+Subject: [PATCH] replace stat64/lstat64 with stat/lstat
+
+lfs64 functions are not needed when off_t is 64-bit
+Additionally this fixes build with musl which does not
+export these functions without defining _LARGEFILE64_SOURCE
+
+Upstream-Status: Submitted [https://github.com/inotify-tools/inotify-tools/pull/174]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libinotifytools/src/inotifytools.c               | 8 ++++----
+ libinotifytools/src/inotifytools/inotify-nosys.h | 5 -----
+ libinotifytools/src/inotifytools/inotifytools.h  | 5 -----
+ src/common.c                                     | 4 ++--
+ src/common.h                                     | 6 +-----
+ 5 files changed, 7 insertions(+), 21 deletions(-)
+
+diff --git a/libinotifytools/src/inotifytools.c b/libinotifytools/src/inotifytools.c
+index 50f6135..3e17ac6 100644
+--- a/libinotifytools/src/inotifytools.c
++++ b/libinotifytools/src/inotifytools.c
+@@ -1750,14 +1750,14 @@ int inotifytools_watch_recursively_with_exclude(char const* path,
+ 
+ 	static struct dirent * ent;
+ 	char * next_file;
+-	static struct stat64 my_stat;
++	static struct stat my_stat;
+ 	ent = readdir( dir );
+ 	// Watch each directory within this directory
+ 	while ( ent ) {
+ 		if ( (0 != strcmp( ent->d_name, "." )) &&
+ 		     (0 != strcmp( ent->d_name, ".." )) ) {
+ 			nasprintf(&next_file,"%s%s", my_path, ent->d_name);
+-			if ( -1 == lstat64( next_file, &my_stat ) ) {
++			if ( -1 == lstat( next_file, &my_stat ) ) {
+ 				error = errno;
+ 				free( next_file );
+ 				if ( errno != EACCES ) {
+@@ -1840,9 +1840,9 @@ int inotifytools_error() {
+  * @internal
+  */
+ static int isdir( char const * path ) {
+-	static struct stat64 my_stat;
++	static struct stat my_stat;
+ 
+-	if ( -1 == lstat64( path, &my_stat ) ) {
++	if ( -1 == lstat( path, &my_stat ) ) {
+ 		if (errno == ENOENT) return 0;
+ 		fprintf(stderr, "Stat failed on %s: %s\n", path, strerror(errno));
+ 		return 0;
+diff --git a/libinotifytools/src/inotifytools/inotify-nosys.h b/libinotifytools/src/inotifytools/inotify-nosys.h
+index 01aa45e..97166d4 100644
+--- a/libinotifytools/src/inotifytools/inotify-nosys.h
++++ b/libinotifytools/src/inotifytools/inotify-nosys.h
+@@ -13,11 +13,6 @@
+ #include <sys/syscall.h>
+ #include <unistd.h>
+ 
+-#ifdef __FreeBSD__
+-#define stat64 stat
+-#define lstat64 lstat
+-#endif
+-
+ /*
+  * struct inotify_event - structure read from the inotify device for each event
+  *
+diff --git a/libinotifytools/src/inotifytools/inotifytools.h b/libinotifytools/src/inotifytools/inotifytools.h
+index 49936ae..2ec4358 100644
+--- a/libinotifytools/src/inotifytools/inotifytools.h
++++ b/libinotifytools/src/inotifytools/inotifytools.h
+@@ -1,11 +1,6 @@
+ #ifndef _inotifytools_H
+ #define _inotifytools_H
+ 
+-#ifdef __FreeBSD__
+-#define stat64 stat
+-#define lstat64 lstat
+-#endif
+-
+ #ifdef __cplusplus
+ extern "C"
+ {
+diff --git a/src/common.c b/src/common.c
+index 5a6fda1..885286e 100644
+--- a/src/common.c
++++ b/src/common.c
+@@ -45,9 +45,9 @@ void print_event_descriptions() {
+ }
+ 
+ int isdir(char const *path) {
+-    static struct stat64 my_stat;
++    static struct stat my_stat;
+ 
+-    if (-1 == lstat64(path, &my_stat)) {
++    if (-1 == lstat(path, &my_stat)) {
+         if (errno == ENOENT)
+             return 0;
+         fprintf(stderr, "Stat failed on %s: %s\n", path, strerror(errno));
+diff --git a/src/common.h b/src/common.h
+index 12d3dde..7f1e34a 100644
+--- a/src/common.h
++++ b/src/common.h
+@@ -1,13 +1,9 @@
+ #ifndef COMMON_H
+ #define COMMON_H
+ 
+-#ifdef __FreeBSD__
+-#define stat64 stat
+-#define lstat64 lstat
+-#ifdef ENABLE_FANOTIFY
++#if defined(__FreeBSD__) && defined(ENABLE_FANOTIFY)
+ #error "FreeBSD does not support fanotify"
+ #endif
+-#endif
+ 
+ #include <stdbool.h>
+ 
diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.6.0.bb b/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.6.0.bb
index 3d25eecb34..281de522b2 100644
--- a/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.6.0.bb
+++ b/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.6.0.bb
@@ -9,7 +9,9 @@ SRCREV = "c8bdbc0a2ed822fc7c67c5c3e102d89fe27fb2d0"
 
 SRC_URI = "git://github.com/${BPN}/${BPN};branch=master;protocol=https \
            file://0002-libinotifytools-Bridge-differences-between-musl-glib.patch \
-          "
+           file://0002-configure-Add-AC_SYS_LARGEFILE-autoconf-macro.patch \
+           file://0003-replace-stat64-lstat64-with-stat-lstat.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.39.0


