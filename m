Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07E3DC46467
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 01:37:54 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.148806.1672105065930077143
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Dec 2022 17:37:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SKz7RJCs;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id jl4so5677707plb.8
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Dec 2022 17:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hcgOKoZITvjjRaKGXTZuwq56OtsuVLpzxVMn8WDWbxw=;
        b=SKz7RJCs/3Hw4pA/fMDQSht8sBdrTV+Nbr1KEIfqZqACMzaOlZSk4y8GqkV+2wIFAr
         ibyp06NTIBDwBu2tmh76kEXTOtzba8ikvmUKbcOv/n2/4rNP44P2nMLk1hYM8P83PS1L
         jG95yCXRdPTJbuDKwh4pHkgCFK7MKYv70NvWHt8JD0kom7z7D7SaMwT2G8QW8hFv2Pap
         HONtClteK12vnYJzGq3Z8zbsCPT+/u6iZVaUOxhk+/Lsub92yuqh0zwKQZ6evuA2P/BF
         RTivZ6OacX6Jvp9ZcdVXpRFor//5R99jNZerLkahOL66zasepciqXbp7S9ZsDIpx7ekU
         ypNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hcgOKoZITvjjRaKGXTZuwq56OtsuVLpzxVMn8WDWbxw=;
        b=53FNQPmOP0NRRefzbuIRNFiDcKob5vjpvi4v1Xnp9B1T8u0FdD07YawIDthxx89Vw7
         Gl2Zvk5RQTMGyGDd4gSPPDO9J1W4E6ZM8bE17JG4SwF/CRcFzFuoZDxXtKKZV2wCAzJR
         6A0SeVIhXxnoXci1wwgMGz6nNASnVsuKRp/41nnG96wtWOsSUyYPt/eIUdzs5Ke/x188
         NdafFQpicAUES8bozcSdZDhEa3UZYrYNnmM0HQayjWJHOYxSYWq8mHgFaKR0HZCQo0fP
         eyDLuP8KsTqhP2zoMjVje8dKVh56FUSMiWXpommMmD0b1+KY6JPlBMxJ2qBwhs4w6Jgf
         qB4A==
X-Gm-Message-State: AFqh2kowb7tgr06qYpRYgtqyHqY2tYattN7NZW6gzHiKN4c91JWNFsLn
	xCfVpqnoHGy1ZWh6WP45SibVT2cQPi4=
X-Google-Smtp-Source: AMrXdXtpYtJ9AilF5MuVywka5E5UQFCiTdaqmCKzEhavf0dgRqe5EPMHXaFg9B0skHb773rbya26LA==
X-Received: by 2002:a17:902:d4ca:b0:189:ec62:3b2d with SMTP id o10-20020a170902d4ca00b00189ec623b2dmr31781755plg.4.1672105065005;
        Mon, 26 Dec 2022 17:37:45 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id a13-20020a1709027e4d00b00183c6784704sm7596442pln.291.2022.12.26.17.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 17:37:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH v2 5/6] f2fs-tools: Upgrade to 1.15.0
Date: Mon, 26 Dec 2022 17:37:37 -0800
Message-Id: <20221227013738.3840802-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221227013738.3840802-1-raj.khem@gmail.com>
References: <20221227013738.3840802-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 01:37:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100253

Add patches to build builds when S != B and largefile support

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-f2fs_io-Fix-out-of-tree-builds.patch |  27 +++
 ...-f2fs_io-Define-_FILE_OFFSET_BITS-64.patch | 183 ++++++++++++++++++
 ...s-tools_1.14.0.bb => f2fs-tools_1.15.0.bb} |   4 +-
 3 files changed, 213 insertions(+), 1 deletion(-)
 create mode 100644 meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0001-f2fs_io-Fix-out-of-tree-builds.patch
 create mode 100644 meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0002-f2fs_io-Define-_FILE_OFFSET_BITS-64.patch
 rename meta-filesystems/recipes-utils/f2fs-tools/{f2fs-tools_1.14.0.bb => f2fs-tools_1.15.0.bb} (74%)

diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0001-f2fs_io-Fix-out-of-tree-builds.patch b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0001-f2fs_io-Fix-out-of-tree-builds.patch
new file mode 100644
index 0000000000..aa243bd9c0
--- /dev/null
+++ b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0001-f2fs_io-Fix-out-of-tree-builds.patch
@@ -0,0 +1,27 @@
+From f110e34d7a4929cdea647b98fa177cf1bccf8b1e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 21 Dec 2022 18:21:42 -0800
+Subject: [PATCH] f2fs_io: Fix out of tree builds
+
+Relative path does not work when searching for include files
+when srcdir != builddir
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-f2fs-devel/20221222022830.976309-1-raj.khem@gmail.com/T/#t]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tools/f2fs_io/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/f2fs_io/Makefile.am b/tools/f2fs_io/Makefile.am
+index 6c17db1..bc4f9d0 100644
+--- a/tools/f2fs_io/Makefile.am
++++ b/tools/f2fs_io/Makefile.am
+@@ -1,7 +1,7 @@
+ ## Makefile.am
+ 
+ if LINUX
+-AM_CPPFLAGS = -I../../include
++AM_CPPFLAGS = -I$(top_srcdir)/include
+ AM_CFLAGS = -Wall
+ sbin_PROGRAMS = f2fs_io
+ f2fs_io_SOURCES = f2fs_io.c
diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0002-f2fs_io-Define-_FILE_OFFSET_BITS-64.patch b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0002-f2fs_io-Define-_FILE_OFFSET_BITS-64.patch
new file mode 100644
index 0000000000..d4e3194e62
--- /dev/null
+++ b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0002-f2fs_io-Define-_FILE_OFFSET_BITS-64.patch
@@ -0,0 +1,183 @@
+From 3c0314e1820afc9a98e890cc5f7973c3c81877f8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 21 Dec 2022 18:23:03 -0800
+Subject: [PATCH] f2fs_io: Define _FILE_OFFSET_BITS=64
+
+Remove _LARGEFILE64_SOURCE, this is redundant when _FILE_OFFSET_BITS=64
+additionally it fixes build with musl because the detection logic for
+lseek64 fails because when using _LARGEFILE64_SOURCE musl also define's
+lseek64 as an alias to lseek
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-f2fs-devel/20221222022830.976309-2-raj.khem@gmail.com/T/#u]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/libf2fs_io.c        | 4 +++-
+ tools/f2fs_io/f2fs_io.c | 4 ++--
+ 2 files changed, 5 insertions(+), 3 deletions(-)
+
+--- a/lib/libf2fs_io.c
++++ b/lib/libf2fs_io.c
+@@ -11,7 +11,9 @@
+  *
+  * Dual licensed under the GPL or LGPL version 2 licenses.
+  */
+-#define _LARGEFILE64_SOURCE
++#ifndef _FILE_OFFSET_BITS
++#define _FILE_OFFSET_BITS 64
++#endif
+ 
+ #include <stdio.h>
+ #include <stdlib.h>
+@@ -67,22 +69,13 @@ static int __get_device_fd(__u64 *offset
+ 	return -1;
+ }
+ 
+-#ifndef HAVE_LSEEK64
+-typedef off_t	off64_t;
+-
+-static inline off64_t lseek64(int fd, __u64 offset, int set)
+-{
+-	return lseek(fd, offset, set);
+-}
+-#endif
+-
+ /* ---------- dev_cache, Least Used First (LUF) policy  ------------------- */
+ /*
+  * Least used block will be the first victim to be replaced when max hash
+  * collision exceeds
+  */
+ static bool *dcache_valid; /* is the cached block valid? */
+-static off64_t  *dcache_blk; /* which block it cached */
++static off_t  *dcache_blk; /* which block it cached */
+ static uint64_t *dcache_lastused; /* last used ticks for cache entries */
+ static char *dcache_buf; /* cached block data */
+ static uint64_t dcache_usetick; /* current use tick */
+@@ -172,7 +165,7 @@ static int dcache_alloc_all(long n)
+ {
+ 	if (n <= 0)
+ 		return -1;
+-	if ((dcache_blk = (off64_t *) malloc(sizeof(off64_t) * n)) == NULL
++	if ((dcache_blk = (off_t *) malloc(sizeof(off_t) * n)) == NULL
+ 		|| (dcache_lastused = (uint64_t *)
+ 				malloc(sizeof(uint64_t) * n)) == NULL
+ 		|| (dcache_buf = (char *) malloc (F2FS_BLKSIZE * n)) == NULL
+@@ -257,7 +250,7 @@ static inline long dcache_relocate(long
+ 			dcache_config.num_cache_entry;
+ }
+ 
+-static long dcache_find(off64_t blk)
++static long dcache_find(off_t blk)
+ {
+ 	register long n = dcache_config.num_cache_entry;
+ 	register unsigned m = dcache_config.max_hash_collision;
+@@ -278,10 +271,10 @@ static long dcache_find(off64_t blk)
+ }
+ 
+ /* Physical read into cache */
+-static int dcache_io_read(int fd, long entry, off64_t offset, off64_t blk)
++static int dcache_io_read(int fd, long entry, off_t offset, off_t blk)
+ {
+-	if (lseek64(fd, offset, SEEK_SET) < 0) {
+-		MSG(0, "\n lseek64 fail.\n");
++	if (lseek(fd, offset, SEEK_SET) < 0) {
++		MSG(0, "\n lseek fail.\n");
+ 		return -1;
+ 	}
+ 	if (read(fd, dcache_buf + entry * F2FS_BLKSIZE, F2FS_BLKSIZE) < 0) {
+@@ -308,12 +301,12 @@ static int dcache_io_read(int fd, long e
+  *       1: cache not available (uninitialized)
+  *      -1: error
+  */
+-static int dcache_update_rw(int fd, void *buf, off64_t offset,
++static int dcache_update_rw(int fd, void *buf, off_t offset,
+ 		size_t byte_count, bool is_write)
+ {
+-	off64_t blk;
++	off_t blk;
+ 	int addr_in_blk;
+-	off64_t start;
++	off_t start;
+ 
+ 	if (!dcache_initialized)
+ 		dcache_init(); /* auto initialize */
+@@ -377,13 +370,13 @@ static int dcache_update_rw(int fd, void
+  * return value: 1: cache not available
+  *               0: success, -1: I/O error
+  */
+-int dcache_update_cache(int fd, void *buf, off64_t offset, size_t count)
++int dcache_update_cache(int fd, void *buf, off_t offset, size_t count)
+ {
+ 	return dcache_update_rw(fd, buf, offset, count, true);
+ }
+ 
+ /* handles read into cache + read into buffer  */
+-int dcache_read(int fd, void *buf, off64_t offset, size_t count)
++int dcache_read(int fd, void *buf, off_t offset, size_t count)
+ {
+ 	return dcache_update_rw(fd, buf, offset, count, false);
+ }
+@@ -395,7 +388,7 @@ int dev_read_version(void *buf, __u64 of
+ {
+ 	if (c.sparse_mode)
+ 		return 0;
+-	if (lseek64(c.kd, (off64_t)offset, SEEK_SET) < 0)
++	if (lseek(c.kd, (off_t)offset, SEEK_SET) < 0)
+ 		return -1;
+ 	if (read(c.kd, buf, len) < 0)
+ 		return -1;
+@@ -537,10 +530,10 @@ int dev_read(void *buf, __u64 offset, si
+ 
+ 	/* err = 1: cache not available, fall back to non-cache R/W */
+ 	/* err = 0: success, err=-1: I/O error */
+-	err = dcache_read(fd, buf, (off64_t)offset, len);
++	err = dcache_read(fd, buf, (off_t)offset, len);
+ 	if (err <= 0)
+ 		return err;
+-	if (lseek64(fd, (off64_t)offset, SEEK_SET) < 0)
++	if (lseek(fd, (off_t)offset, SEEK_SET) < 0)
+ 		return -1;
+ 	if (read(fd, buf, len) < 0)
+ 		return -1;
+@@ -586,9 +579,9 @@ int dev_write(void *buf, __u64 offset, s
+ 	 * dcache_update_cache() just update cache, won't do I/O.
+ 	 * Thus even no error, we need normal non-cache I/O for actual write
+ 	 */
+-	if (dcache_update_cache(fd, buf, (off64_t)offset, len) < 0)
++	if (dcache_update_cache(fd, buf, (off_t)offset, len) < 0)
+ 		return -1;
+-	if (lseek64(fd, (off64_t)offset, SEEK_SET) < 0)
++	if (lseek(fd, (off_t)offset, SEEK_SET) < 0)
+ 		return -1;
+ 	if (write(fd, buf, len) < 0)
+ 		return -1;
+@@ -602,7 +595,7 @@ int dev_write_block(void *buf, __u64 blk
+ 
+ int dev_write_dump(void *buf, __u64 offset, size_t len)
+ {
+-	if (lseek64(c.dump_fd, (off64_t)offset, SEEK_SET) < 0)
++	if (lseek(c.dump_fd, (off_t)offset, SEEK_SET) < 0)
+ 		return -1;
+ 	if (write(c.dump_fd, buf, len) < 0)
+ 		return -1;
+@@ -627,7 +620,7 @@ int dev_fill(void *buf, __u64 offset, si
+ 	/* Only allow fill to zero */
+ 	if (*((__u8*)buf))
+ 		return -1;
+-	if (lseek64(fd, (off64_t)offset, SEEK_SET) < 0)
++	if (lseek(fd, (off_t)offset, SEEK_SET) < 0)
+ 		return -1;
+ 	if (write(fd, buf, len) < 0)
+ 		return -1;
+--- a/tools/f2fs_io/f2fs_io.c
++++ b/tools/f2fs_io/f2fs_io.c
+@@ -12,8 +12,8 @@
+ #ifndef _LARGEFILE_SOURCE
+ #define _LARGEFILE_SOURCE
+ #endif
+-#ifndef _LARGEFILE64_SOURCE
+-#define _LARGEFILE64_SOURCE
++#ifndef _FILE_OFFSET_BITS
++#define _FILE_OFFSET_BITS 64
+ #endif
+ #ifndef O_LARGEFILE
+ #define O_LARGEFILE 0
diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.14.0.bb b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.15.0.bb
similarity index 74%
rename from meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.14.0.bb
rename to meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.15.0.bb
index fb71b18b60..5da059f738 100644
--- a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.14.0.bb
+++ b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.15.0.bb
@@ -7,8 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=362b4b2594cd362b874a97718faa51d3"
 # to provide libuuid
 DEPENDS = "util-linux"
 
-SRCREV = "d41dcbdf46dc3841cd0a0507e6573e38cb6c55bb"
+SRCREV = "64f2596142800c215cb40a658ebd5793ed37c936"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git;branch=master \
+           file://0001-f2fs_io-Fix-out-of-tree-builds.patch \
+           file://0002-f2fs_io-Define-_FILE_OFFSET_BITS-64.patch \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.39.0


