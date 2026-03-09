Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C788AFCA19E
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 22:14:19 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26998.1773094456437833749
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 15:14:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OnUlRaGq;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3599126be32so5132718a91.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 15:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773094456; x=1773699256; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iU9GT40K24v00OLe+5rZ1JfH5PkQd7RsMEU52UYutCA=;
        b=OnUlRaGqHychonbhg+3iMo7RgK5jZ7DxmkibZBKoj6mjZu/zOlYrT6JJkWVKPLNY2Z
         RpQj3CoBaWeVKmMzUgXESYjZ1Iczl9moOzfdJ6Z3ojluGGIX/ZotS4F57tHqqc8tHtI7
         CVV2zUPMCipHCTBF+95fHwjO+PO5NZWDcDN5puUHF6gApUzjIL4qBd0Z+8gx77gViIri
         U98oRJMjxjMv/ZtixEEl1hq2I0Tn6OjbpreO8Px8HPbj68FrfdQwdR9ZGTyqN8PdjqJc
         wwmD13mRG49NM0VDRudmiXzL/MKGMq2+/xl/5AcaoHO3ygEZdjIHtX750EO9U3uMaCv1
         /OmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773094456; x=1773699256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iU9GT40K24v00OLe+5rZ1JfH5PkQd7RsMEU52UYutCA=;
        b=QTfN6GxcJK172i9t018+MqiCB/tuH8FcVNMZVxdpubW/T6XiTyynkQc9WQ6XQn1E7i
         jX2KLyWQjyySvIO+CR4a7fehkClwzeUPcXEuRkzTd7/NZ6squWtxV4lukccpRDse2HuA
         ygHkXD3M1aTkbJ7NKC7OwJoS5nU462l1w9hTkUVjC5uNpj6QVNGqiUCBkfeDG1L6MXZH
         mwbz2uPBL4qw5S13Y5I+GqERqma3xWTrV+hG34pMPIg/zK54umxxvJNsNBTV9SWRGrEG
         O89S8YzJc9TqxIvuMDTtgK9Ji9rG4mgVyHZinIKnXMK2aV2yny4RgpXs5ZzuJE8nUsGc
         Rm2w==
X-Gm-Message-State: AOJu0Yx4FmjXoPbtrd3CY+BFIyd94oLhnnOSoZ1mgDbUU1GHbBQ7xtVK
	PtvhRDwXxrAeSefE2fR5Tsqm+/9rxy4Llv8KtyrkjSyH7cLNjhpXk/yGbL91FA==
X-Gm-Gg: ATEYQzxUJtywsaOy56n84x8vxOXiwW7VLJGIL2liCAURQn1Adwj66YhN//FF71RsiQE
	HeLl048RNe8Aka5vyheq2TU62MMkUtwc9TXuWPGi6cS3cz/Mcd57vnHlXge2tHzIfRIiwWgDz0V
	4lJCxszNpI0FQh2Kxk9zgQ8ubvB2IopZQvkE3sUSGjEFyxV9K57F0TULonm77OoRhHXUobdkf6R
	YLOZsRb8+SclOSjjYSenxtafSsQM5XHnHjFgYu+v176ZRXYZ3HNT7d/u+VU6Cpou2M+oDEpYDqT
	B4Os2L88vlxSKTFyd2G2WYiwGGBWqgYimFlSpjUSSoZtmtG/uVR2xzW+YjmO7cIwBAf9v2w+ia7
	etl8bat4zCXyQPwQr490eoiUeNSw1Uoe9MSLfk83qF5PiwzdCz7O6S6qkU8fkUGCSwXkEweMaQP
	nxNMX04ayoUS34jMEf90AAlEW83GwKd9+AH40=
X-Received: by 2002:a17:90b:4fcc:b0:354:a1b8:24a6 with SMTP id 98e67ed59e1d1-359be396481mr11496203a91.31.1773094455574;
        Mon, 09 Mar 2026 15:14:15 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.26])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359bbc060d7sm5991413a91.2.2026.03.09.15.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 15:14:15 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-filesystem][whinlatter][PATCH 4/4] zfs: upgrade 2.2.8 -> 2.2.9
Date: Tue, 10 Mar 2026 11:13:54 +1300
Message-ID: <20260309221354.1058134-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309221354.1058134-1-ankur.tyagi85@gmail.com>
References: <20260309221354.1058134-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 22:14:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125011

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also include tag in the SRC_URI and refreshed patches.

Backported patch 0004-linux-use-sys-stat.h-instead-of-linux-stat.h.patch
to resolve build failure with musl.

Release Notes:
https://github.com/openzfs/zfs/releases/tag/zfs-2.2.9

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...Define-strndupa-if-it-does-not-exist.patch |  5 +-
 ...arch64-inline-assembly-for-gcc-13.1.patch} |  6 +-
 ...admmap-Replace-uint_t-with-uint32_t.patch} | 11 +--
 ...e-sys-stat.h-instead-of-linux-stat.h.patch | 83 +++++++++++++++++++
 .../zfs/{zfs_2.2.8.bb => zfs_2.2.9.bb}        |  9 +-
 5 files changed, 98 insertions(+), 16 deletions(-)
 rename meta-filesystems/recipes-filesystems/zfs/zfs/{aaf28a4630af60496c9d33db1d06a7d7d8983422.patch => 0002-fixes-broken-aarch64-inline-assembly-for-gcc-13.1.patch} (94%)
 rename meta-filesystems/recipes-filesystems/zfs/zfs/{0001-fs-tests-cmd-readmmap-Replace-uint_t-with-uint32_t.patch => 0003-fs-tests-cmd-readmmap-Replace-uint_t-with-uint32_t.patch} (83%)
 create mode 100644 meta-filesystems/recipes-filesystems/zfs/zfs/0004-linux-use-sys-stat.h-instead-of-linux-stat.h.patch
 rename meta-filesystems/recipes-filesystems/zfs/{zfs_2.2.8.bb => zfs_2.2.9.bb} (91%)

diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs/0001-Define-strndupa-if-it-does-not-exist.patch b/meta-filesystems/recipes-filesystems/zfs/zfs/0001-Define-strndupa-if-it-does-not-exist.patch
index 80955b3ca0..c607936e28 100644
--- a/meta-filesystems/recipes-filesystems/zfs/zfs/0001-Define-strndupa-if-it-does-not-exist.patch
+++ b/meta-filesystems/recipes-filesystems/zfs/zfs/0001-Define-strndupa-if-it-does-not-exist.patch
@@ -1,4 +1,4 @@
-From cc0cd6f71f6ef96fca2d7b730a3f0f6722fec696 Mon Sep 17 00:00:00 2001
+From 339359b9af5f24dedebe7234edd586e3fcacd436 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 7 May 2022 12:15:22 -0700
 Subject: [PATCH] Define strndupa if it does not exist
@@ -7,13 +7,12 @@ musl e.g. does not supply strndupa, unlike glibc
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  etc/systemd/system-generators/zfs-mount-generator.c | 9 +++++++++
  1 file changed, 9 insertions(+)
 
 diff --git a/etc/systemd/system-generators/zfs-mount-generator.c b/etc/systemd/system-generators/zfs-mount-generator.c
-index f4c6c26..255bee4 100644
+index ab5dc4d78..d70cd2617 100644
 --- a/etc/systemd/system-generators/zfs-mount-generator.c
 +++ b/etc/systemd/system-generators/zfs-mount-generator.c
 @@ -193,6 +193,15 @@ fopenat(int dirfd, const char *pathname, int flags,
diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs/aaf28a4630af60496c9d33db1d06a7d7d8983422.patch b/meta-filesystems/recipes-filesystems/zfs/zfs/0002-fixes-broken-aarch64-inline-assembly-for-gcc-13.1.patch
similarity index 94%
rename from meta-filesystems/recipes-filesystems/zfs/zfs/aaf28a4630af60496c9d33db1d06a7d7d8983422.patch
rename to meta-filesystems/recipes-filesystems/zfs/zfs/0002-fixes-broken-aarch64-inline-assembly-for-gcc-13.1.patch
index f5504b389d..63dc71555a 100644
--- a/meta-filesystems/recipes-filesystems/zfs/zfs/aaf28a4630af60496c9d33db1d06a7d7d8983422.patch
+++ b/meta-filesystems/recipes-filesystems/zfs/zfs/0002-fixes-broken-aarch64-inline-assembly-for-gcc-13.1.patch
@@ -1,4 +1,4 @@
-From aaf28a4630af60496c9d33db1d06a7d7d8983422 Mon Sep 17 00:00:00 2001
+From d05d2583ae1807e380492ea8570106c1f0a9effb Mon Sep 17 00:00:00 2001
 From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
 Date: Tue, 23 May 2023 13:50:24 +0600
 Subject: [PATCH] fixes broken aarch64 inline assembly for gcc 13.1
@@ -39,9 +39,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  module/Kbuild.in | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
 
+diff --git a/module/Kbuild.in b/module/Kbuild.in
+index a72d2a4cc..c6134baec 100644
 --- a/module/Kbuild.in
 +++ b/module/Kbuild.in
-@@ -57,9 +57,9 @@ asflags-y := $(ZFS_MODULE_CFLAGS) $(ZFS_
+@@ -57,9 +57,9 @@ asflags-y := $(ZFS_MODULE_CFLAGS) $(ZFS_MODULE_CPPFLAGS)
  ccflags-y := $(ZFS_MODULE_CFLAGS) $(ZFS_MODULE_CPPFLAGS)
  
  ifeq ($(CONFIG_ARM64),y)
diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs/0001-fs-tests-cmd-readmmap-Replace-uint_t-with-uint32_t.patch b/meta-filesystems/recipes-filesystems/zfs/zfs/0003-fs-tests-cmd-readmmap-Replace-uint_t-with-uint32_t.patch
similarity index 83%
rename from meta-filesystems/recipes-filesystems/zfs/zfs/0001-fs-tests-cmd-readmmap-Replace-uint_t-with-uint32_t.patch
rename to meta-filesystems/recipes-filesystems/zfs/zfs/0003-fs-tests-cmd-readmmap-Replace-uint_t-with-uint32_t.patch
index f1cfab4daf..d106bc0cdd 100644
--- a/meta-filesystems/recipes-filesystems/zfs/zfs/0001-fs-tests-cmd-readmmap-Replace-uint_t-with-uint32_t.patch
+++ b/meta-filesystems/recipes-filesystems/zfs/zfs/0003-fs-tests-cmd-readmmap-Replace-uint_t-with-uint32_t.patch
@@ -1,4 +1,4 @@
-From 1f9a5cb860b3509791e59a8cae9d5f265e832ed0 Mon Sep 17 00:00:00 2001
+From b37f4e0f11186206863f41e1a638ca4e57c3dc53 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 28 May 2023 16:33:15 -0700
 Subject: [PATCH] fs-tests/cmd/readmmap: Replace uint_t with uint32_t
@@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/tests/zfs-tests/cmd/readmmap.c b/tests/zfs-tests/cmd/readmmap.c
-index 704ffd55c8..a2590e0e8d 100644
+index a5c8079d0..c22b58e9d 100644
 --- a/tests/zfs-tests/cmd/readmmap.c
 +++ b/tests/zfs-tests/cmd/readmmap.c
 @@ -38,6 +38,7 @@
@@ -23,7 +23,7 @@ index 704ffd55c8..a2590e0e8d 100644
  #include <stdio.h>
  #include <stdlib.h>
  #include <unistd.h>
-@@ -55,7 +56,7 @@ main(int argc, char **argv)
+@@ -56,7 +57,7 @@ main(int argc, char **argv)
  	char *buf = NULL;
  	char *map = NULL;
  	int fd = -1, bytes, retval = 0;
@@ -32,7 +32,7 @@ index 704ffd55c8..a2590e0e8d 100644
  
  	if (argc < 2 || optind == argc) {
  		(void) fprintf(stderr,
-@@ -92,7 +93,7 @@ main(int argc, char **argv)
+@@ -93,7 +94,7 @@ main(int argc, char **argv)
  		retval = 1;
  		goto end;
  	}
@@ -41,6 +41,3 @@ index 704ffd55c8..a2590e0e8d 100644
  	srandom(seed);
  
  	idx = random() % size;
--- 
-2.40.1
-
diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs/0004-linux-use-sys-stat.h-instead-of-linux-stat.h.patch b/meta-filesystems/recipes-filesystems/zfs/zfs/0004-linux-use-sys-stat.h-instead-of-linux-stat.h.patch
new file mode 100644
index 0000000000..53fa5d9b5c
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/zfs/zfs/0004-linux-use-sys-stat.h-instead-of-linux-stat.h.patch
@@ -0,0 +1,83 @@
+From a4d9aadf0094392e5e477dbc8c43f973692dab00 Mon Sep 17 00:00:00 2001
+From: classabbyamp <5366828+classabbyamp@users.noreply.github.com>
+Date: Wed, 27 Aug 2025 17:42:32 -0400
+Subject: [PATCH] linux: use sys/stat.h instead of linux/stat.h
+
+glibc includes linux/stat.h for statx, but musl defines its own statx
+struct and associated constants, which does not include STATX_MNT_ID
+yet. Thus, including linux/stat.h directly should be avoided for
+maximum libc compatibility.
+
+Tested on:
+  - glibc: x86_64, i686, aarch64, armv7l, armv6l
+  - musl: x86_64, aarch64, armv7l, armv6l
+
+Reviewed-by: Brian Behlendorf <behlendorf1@llnl.gov>
+Tested-By: Achill Gilgenast <achill@achill.org>
+Signed-off-by: classabbyamp <dev@placeviolette.net>
+Closes #17675
+(cherry picked from commit ccf5a8a6fcfdfbdaa2f0fdca5d787958224bf06d)
+
+Upstream-Status: Backport [https://github.com/openzfs/zfs/commit/ccf5a8a6fcfdfbdaa2f0fdca5d787958224bf06d]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ config/user-statx.m4                   | 6 +++---
+ include/os/linux/spl/sys/stat.h        | 2 +-
+ lib/libspl/include/os/linux/sys/stat.h | 2 +-
+ 3 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/config/user-statx.m4 b/config/user-statx.m4
+index 0315f93e0..1ba74a40e 100644
+--- a/config/user-statx.m4
++++ b/config/user-statx.m4
+@@ -2,7 +2,7 @@ dnl #
+ dnl # Check for statx() function and STATX_MNT_ID availability
+ dnl #
+ AC_DEFUN([ZFS_AC_CONFIG_USER_STATX], [
+-	AC_CHECK_HEADERS([linux/stat.h],
++	AC_CHECK_HEADERS([sys/stat.h],
+ 		[have_stat_headers=yes],
+ 		[have_stat_headers=no])
+ 
+@@ -14,7 +14,7 @@ AC_DEFUN([ZFS_AC_CONFIG_USER_STATX], [
+ 			AC_MSG_CHECKING([for STATX_MNT_ID])
+ 			AC_COMPILE_IFELSE([
+ 				AC_LANG_PROGRAM([[
+-					#include <linux/stat.h>
++					#include <sys/stat.h>
+ 				]], [[
+ 					struct statx stx;
+ 					int mask = STATX_MNT_ID;
+@@ -29,6 +29,6 @@ AC_DEFUN([ZFS_AC_CONFIG_USER_STATX], [
+ 			])
+ 		])
+ 	], [
+-		AC_MSG_WARN([linux/stat.h not found; skipping statx support])
++		AC_MSG_WARN([sys/stat.h not found; skipping statx support])
+ 	])
+ ])  dnl end AC_DEFUN
+diff --git a/include/os/linux/spl/sys/stat.h b/include/os/linux/spl/sys/stat.h
+index 598784964..5c8cff72e 100644
+--- a/include/os/linux/spl/sys/stat.h
++++ b/include/os/linux/spl/sys/stat.h
+@@ -24,6 +24,6 @@
+ #ifndef _SPL_STAT_H
+ #define	_SPL_STAT_H
+ 
+-#include <linux/stat.h>
++#include <sys/stat.h>
+ 
+ #endif /* SPL_STAT_H */
+diff --git a/lib/libspl/include/os/linux/sys/stat.h b/lib/libspl/include/os/linux/sys/stat.h
+index 5fbe892ee..ef8738fa8 100644
+--- a/lib/libspl/include/os/linux/sys/stat.h
++++ b/lib/libspl/include/os/linux/sys/stat.h
+@@ -32,7 +32,7 @@
+ 
+ #ifdef HAVE_STATX
+ #include <fcntl.h>
+-#include <linux/stat.h>
++#include <sys/stat.h>
+ #endif
+ 
+ /*
diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.8.bb b/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.9.bb
similarity index 91%
rename from meta-filesystems/recipes-filesystems/zfs/zfs_2.2.8.bb
rename to meta-filesystems/recipes-filesystems/zfs/zfs_2.2.9.bb
index 1fc1457b19..22d35516e7 100644
--- a/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.8.bb
+++ b/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.9.bb
@@ -4,11 +4,12 @@ LICENSE = "CDDL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7087caaf1dc8a2856585619f4a787faa"
 HOMEPAGE = "https://github.com/openzfs/zfs"
 
-SRCREV = "3e4a3e161c00273303cd9fa9e0dc09ead3499a8a"
-SRC_URI = "git://github.com/openzfs/zfs;protocol=https;branch=zfs-2.2-release \
+SRCREV = "079ba86d71571bf997ff688da061d8c4aa2fd052"
+SRC_URI = "git://github.com/openzfs/zfs;protocol=https;branch=zfs-2.2-release;tag=${BP} \
            file://0001-Define-strndupa-if-it-does-not-exist.patch \
-           file://aaf28a4630af60496c9d33db1d06a7d7d8983422.patch \
-           file://0001-fs-tests-cmd-readmmap-Replace-uint_t-with-uint32_t.patch \
+           file://0002-fixes-broken-aarch64-inline-assembly-for-gcc-13.1.patch \
+           file://0003-fs-tests-cmd-readmmap-Replace-uint_t-with-uint32_t.patch \
+           file://0004-linux-use-sys-stat.h-instead-of-linux-stat.h.patch \
 "
 
 

