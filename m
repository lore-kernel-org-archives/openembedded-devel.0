Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 647497F745
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2019 22:34:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47Rg0K6QPSz5p
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2019 23:34:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1575326082;
	bh=pbbz2QUyE5Aip0BoU+CM7HZyZ1ofc2rfhZzJ5UChCmU=;
	h=From:To:Subject:Date:From;
	b=A2i3H73nLJIKqjc+XI45NwdwgWZSvQo1odKWkzVGUsJbTK4RnpPpB1/b6OyxIav54
	N+VRoF/JV4+FuTV4wNSVYXjCvINOTM699448MhMRE0EA3D/WSbQAxf50SYOoIPCCZ/
	h8ZenTkTBiHT3XdnCD/yqbsTqSpL9HPxNZYJrbSzlSv2vRD7HFXZSIQvzMGjACxKPD
	ivdrfGK5k0Y/PzxiZW07w8EQ1Ym8ICQsvexhpp6vCPSZHK6Gj9YR9dCl0QNMSnY7E/
	JToE8sNeGGCh9DRo/722sZkMbwNUF0vAcTzNgSqogO1dhXJxe3BSe+vjtsTeJlwz0z
	Htb0afQfqLHd66ewPNFjWF7kP0gBdKx1XTSXX8uQSIBM3Iqrtn3VHCHf43doCPBMuU
	PFlARdszfnol+CcRnpiUIujbShOJtgbtZFboFSRnaXlFOA7R0thaICUkPtV29LsBEi
	Ubnideg2BrN+uQs8YQQfB+XauQK927ovNXXk4w+/4CArdxK+Gs5uw9CLHl52CNOhNa
	JvD2dzCDe1UodnMYIOSZeeyRko4TCrYMdfV5GZWnMJ5N81PGr6tW9d2v68Q19rL1HA
	XLaZdV7DELo5Oog7YaEgKH2p+2lR29I8ErETpb9T1/O4V7cJH1vj5/O99KnJLg2092
	yQiHJmANNQtIoRBgV4rPTYjg=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Dec 2019 00:34:40 +0200
Message-Id: <20191202223440.829-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-filesystems][PATCH] xfsprogs: Remove obsolete patch
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
X-List-Received-Date: Mon, 02 Dec 2019 22:34:43 -0000

The patch metadata talked about sync_file_range(),
the patch seemed to handle copy_file_range().

Both functions are checked by current xfsprogs upstream code.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...ck-for-sync_file_range-libc-function.patch | 79 -------------------
 .../recipes-utils/xfsprogs/xfsprogs_5.2.1.bb  |  1 -
 2 files changed, 80 deletions(-)
 delete mode 100644 meta-filesystems/recipes-utils/xfsprogs/files/0001-build-Check-for-sync_file_range-libc-function.patch

diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/0001-build-Check-for-sync_file_range-libc-function.patch b/meta-filesystems/recipes-utils/xfsprogs/files/0001-build-Check-for-sync_file_range-libc-function.patch
deleted file mode 100644
index b5071aea6..000000000
--- a/meta-filesystems/recipes-utils/xfsprogs/files/0001-build-Check-for-sync_file_range-libc-function.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 1a4c9ebbb8731f2e3631d77b7eeaf3c373141d88 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 31 Jan 2018 21:28:53 -0800
-Subject: [PATCH] build: Check for sync_file_range libc function
-
-glibc 2.27 now has sync_file_range()
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/builddefs.in | 1 +
- io/Makefile          | 5 ++++-
- io/io.h              | 2 +-
- io/sync_file_range.c | 3 +++
- 4 files changed, 9 insertions(+), 2 deletions(-)
-
-diff --git a/include/builddefs.in b/include/builddefs.in
-index d38dc7e..706eca6 100644
---- a/include/builddefs.in
-+++ b/include/builddefs.in
-@@ -94,6 +94,7 @@ HAVE_FIEMAP = @have_fiemap@
- HAVE_PREADV = @have_preadv@
- HAVE_PWRITEV2 = @have_pwritev2@
- HAVE_COPY_FILE_RANGE = @have_copy_file_range@
-+HAVE_NR_COPY_FILE_RANGE = @have_nr_copy_file_range@
- HAVE_SYNC_FILE_RANGE = @have_sync_file_range@
- HAVE_SYNCFS = @have_syncfs@
- HAVE_READDIR = @have_readdir@
-diff --git a/io/Makefile b/io/Makefile
-index 484e2b5..2751dcb 100644
---- a/io/Makefile
-+++ b/io/Makefile
-@@ -53,10 +53,13 @@ else
- LSRCFILES += fiemap.c
- endif
- 
--ifeq ($(HAVE_COPY_FILE_RANGE),yes)
-+ifeq ($(HAVE_NR_COPY_FILE_RANGE),yes)
- CFILES += copy_file_range.c
-+LCFLAGS += -DHAVE_NR_COPY_FILE_RANGE
-+ifeq ($(HAVE_COPY_FILE_RANGE),yes)
- LCFLAGS += -DHAVE_COPY_FILE_RANGE
- endif
-+endif
- 
- ifeq ($(HAVE_SYNC_FILE_RANGE),yes)
- CFILES += sync_file_range.c
-diff --git a/io/io.h b/io/io.h
-index 6469179..678b3d7 100644
---- a/io/io.h
-+++ b/io/io.h
-@@ -146,7 +146,7 @@ extern void		fiemap_init(void);
- #define fiemap_init()	do { } while (0)
- #endif
- 
--#ifdef HAVE_COPY_FILE_RANGE
-+#if defined(HAVE_NR_COPY_FILE_RANGE) && !defined(HAVE_COPY_FILE_RANGE)
- extern void		copy_range_init(void);
- #else
- #define copy_range_init()	do { } while (0)
-diff --git a/io/sync_file_range.c b/io/sync_file_range.c
-index 30bbc93..6c49d73 100644
---- a/io/sync_file_range.c
-+++ b/io/sync_file_range.c
-@@ -4,6 +4,7 @@
-  * All Rights Reserved.
-  */
- 
-+#ifndef HAVE_COPY_FILE_RANGE
- #include "command.h"
- #include "input.h"
- #include "init.h"
-@@ -92,3 +93,5 @@ sync_range_init(void)
- 
- 	add_command(&sync_range_cmd);
- }
-+
-+#endif
diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.2.1.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.2.1.bb
index 5ab1d028f..34b338640 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.2.1.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.2.1.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=74274e8a218423e49eefdea80bc55038
 DEPENDS = "util-linux util-linux-native"
 SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
            file://remove_flags_from_build_flags.patch \
-           file://0001-build-Check-for-sync_file_range-libc-function.patch \
            file://0001-Check-for-MAP_SYNC-in-sys-mman.h.patch \
            file://0002-include-include-xfs-linux.h-after-sys-mman.h.patch \
            file://0001-support-usrmerge.patch \
-- 
2.17.1


