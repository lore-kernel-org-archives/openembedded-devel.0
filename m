Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48002.1795411800064930023
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=xJ6fXONl;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3863db981d4so3798364eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411799; x=1796016599; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pzMJhuitNRk+gFEYb33kBfVnDZgV/CHxaZfQDXylbBo=;
        b=xJ6fXONliiOhWRE1zI/v9+K1ZfrrJuudtiIM9tF+n/bHIS36lPq1i+Qq1IYgwzNf9b
         cEOL/PldwX5qZCE+pKM1XwB5qprAErR2pDTBZWMdzl8A4gU/t8BkXSLweQGmuWuKfG2t
         FOcpQJOaPoGtbcNqjS07N9Ae6dRv43JVDNryHkARMBCItqs9BClIiezNFlTEXxF4rfK0
         jhPJ3j7jOP7xeiUFoTTK5vE+d0fN08GaDlpprO9n/6r64U/dCCAENhgOejNKN0Ul8d+0
         gZRkp0wvEuWd6GAc1K4Zxy+T4AXeFyHezvVPaMwviXX7Dth1rkvmxhL4T8RLMcXd9YBo
         OywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411799; x=1796016599;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pzMJhuitNRk+gFEYb33kBfVnDZgV/CHxaZfQDXylbBo=;
        b=OFv4nwu6XSEus4NTRgGdTfJ8nSkqTBfFzeHCZfEqxXbKErZoO57EVpafpR6HZEFMFK
         i9nqoWeuuNjTNWoL9/V9PxC0VCKCuDh+MX5PFsX+YMA1Kf/1IUcjbtey4r3DGuU8Wdwn
         fLrrxmIbfDCcRkIbg8AOwTaGC/TnCKqO4pSsuXAyuupM7utnuHI0PeRDlcv2RhkPLzbi
         jvLqWP9XRB+npcELtC3bnJkV+xQYClqOo2BFpMvTO8Wl2/s59zqi17vX1VbgGvuvqkl8
         jByncXJNS6C7HhcvaRekA6EtubY2FTYnE28QPm1px7cQLdV53Gm8ExVhuX+3HwyYgJIN
         pJIA==
X-Gm-Message-State: APuU4Z8y3URMg7G3jSz4JjzXMMKQgXrazC5hMMc0UpDgilOEBKNAD+Hv
	E+2g12iezpUyLI113Aq3+1Jq/sGNcCNxFacEnqeY/95FUPlhB+mMIl2S0OBF0PsiQsU=
X-Gm-Gg: AZFdTZev5OwfLBVgIVWW5AkyOus4BXmGEOj1du+MCogCLuYTg+ToqmIo3Ftt6GHsvFB
	34tWI5xoCY/D3x8spi+l+yU1PqINiPhTUapzdlyuTNk08wRjzxk9hDakQdb3gdxjGCWrchoGls2
	lmWzwIvcFJEqOQp63l9AB4x7o4ZGMN7GTlzRF7Vkye//V1s6TAJi/yQUltWV470nE29HGFxRQxB
	8iIJ64OhiCfAm8knRHOlRqpWTG9X0DwGpKxNrmhyL1RVXUAVqb4mv0+0QGrj0wqs0V0zc49ex19
	zSX9sVeGDi9CQBvGupSZsQsEFr0VzNEbwq63k08thcI6bmlCrt1BSCTVTAgMKcwcGDemgfdTKVA
	69Ze83eggsavkBFaVlZ69EXriNWgG21lpg5KH+gZWCb9uoAN61AVd2apeCFbcKWnYD+Du5SnclT
	bpXrD8GGayy0XtrI2QJkg3FeZh/xbAFfC7EgtIUWP7NKnnUW/AB6TKLr9wLI/MrwPeJPfdEXuU6
	ywbUANDU7fNbatM1L9HnWA75it8fkQ7Wlg7y6h3KcpOZMSd4w8sdo61WbKTNxQuGr6891RXSNm4
	EAfSLfGtD4daXzSUiPApipqdLFiQj+7ra/2wN7Ue0YdkG36t1eT0I1t8BrLuXmnOCv+pvn1fSuM
	d4pbBhulNmCcjM7IgUFcyG0xKYNbpzhcYMBEcYN4NBj5m3uslvVEcbVsyR2QzC6g/AuslPcjK07
	Q6DBztaTUGsZ84fFdjvXgKj5uY6HmW+qq5fBleSCkAzr0uf8EEi9R5MVoqi58epQcAQhfi6/2UD
	eEG51wEfswQNMLuITh+AjS2G1jrixhc4CtPcQkSHEFPWV0T1U9pTCITqttTGhmmlPTMW0zPI3Fo
	XRvG
X-Received: by 2002:a05:693c:88c4:20b0:386:b070:6f16 with SMTP id 5a478bee46e88-386b0707080mr2069963eec.21.1795411799232;
        Sun, 22 Nov 2026 21:29:59 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:29:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-filesystems][PATCH 2/2] logfsprogs: Remove recipe
Date: Sun, 22 Nov 2026 21:28:19 -0800
Message-ID: <20261123052953.3658549-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132790
Content-Type: text/plain; charset="utf-8"

Upstream has had no commits since 2012 and LogFS itself was removed
from the Linux kernel in 4.15, so the tools have nothing left to work
with. Drop it from packagegroup-meta-filesystems as well.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../0001-Add-LDFLAGS-to-linker-cmdline.patch  |  48 ------
 ...licts-with-libc-namespace-about-setk.patch | 137 ------------------
 ...smacros.h-for-major-minor-definition.patch |  24 ---
 .../logfsprogs/logfsprogs_git.bb              |  29 ----
 .../packagegroup-meta-filesystems.bb          |   1 -
 5 files changed, 239 deletions(-)
 delete mode 100644 meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs/0001-Add-LDFLAGS-to-linker-cmdline.patch
 delete mode 100644 meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs/0001-btree-Avoid-conflicts-with-libc-namespace-about-setk.patch
 delete mode 100644 meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs/0001-include-sys-sysmacros.h-for-major-minor-definition.patch
 delete mode 100644 meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb

diff --git a/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs/0001-Add-LDFLAGS-to-linker-cmdline.patch b/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs/0001-Add-LDFLAGS-to-linker-cmdline.patch
deleted file mode 100644
index 8d790125e3..0000000000
--- a/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs/0001-Add-LDFLAGS-to-linker-cmdline.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From a322794f80f2718ae4463669c4b6ab2fbb15ffec Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 5 Apr 2017 17:36:45 +0000
-Subject: [PATCH] Add $(LDFLAGS) to linker cmdline
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-Index: git/Makefile
-===================================================================
---- git.orig/Makefile
-+++ git/Makefile
-@@ -14,7 +14,7 @@ ZLIB_O	:= crc32.o deflate.o adler32.o co
- CC	:= gcc
- CHECK	:= cgcc
- CHECKFLAGS := -D__CHECK_ENDIAN__
--CFLAGS	:= -std=gnu99
-+CFLAGS	+= -std=gnu99
- CFLAGS	+= -Wall
- CFLAGS	+= -Os
- CFLAGS	+= -D_FILE_OFFSET_BITS=64
-@@ -28,18 +28,18 @@ $(ZLIB_O): /usr/lib/libz.a
- 
- ifdef S
- EXTRA_OBJ := $(ZLIB_O)
--CFLAGS += -static
-+LDFLAGS += -static
- else
--CFLAGS += -lz
-+LDFLAGS += -lz
- endif
- 
- mklogfs: $(EXTRA_OBJ)
- mklogfs: mkfs.o lib.o btree.o segment.o readwrite.o
--	$(CC) $(CFLAGS) -o $@ $^
-+	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)
- 
- logfsck: $(ZLIB_O)
- logfsck: fsck.o lib.o journal.o super.o
--	$(CC) $(CFLAGS) -o $@ $^
-+	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)
- 
- $(OBJ): kerncompat.h logfs.h logfs_abi.h btree.h
- 
diff --git a/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs/0001-btree-Avoid-conflicts-with-libc-namespace-about-setk.patch b/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs/0001-btree-Avoid-conflicts-with-libc-namespace-about-setk.patch
deleted file mode 100644
index 73e42df7e4..0000000000
--- a/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs/0001-btree-Avoid-conflicts-with-libc-namespace-about-setk.patch
+++ /dev/null
@@ -1,137 +0,0 @@
-From 5a8e26157d9642f022587cc1ca7525213c7a5379 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 13 Jul 2017 18:41:53 -0700
-Subject: [PATCH] btree: Avoid conflicts with libc namespace about setkey()
-
-This issue is highlighted with musl mainly because the
-function signature from stdlib.h does not match the local
-static function
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- btree.c | 32 ++++++++++++++++----------------
- 1 file changed, 16 insertions(+), 16 deletions(-)
-
-diff --git a/btree.c b/btree.c
-index eddc33b..dd3fef9 100644
---- a/btree.c
-+++ b/btree.c
-@@ -123,7 +123,7 @@ static unsigned long bval(struct btree_geo *geo, unsigned long *node, int n)
- 	return node[geo->no_pairs * geo->keylen + n];
- }
- 
--static void setkey(struct btree_geo *geo, unsigned long *node,
-+static void _setkey(struct btree_geo *geo, unsigned long *node,
- 		unsigned long *key, int n)
- {
- 	longcpy(bkey(geo, node, n), key, geo->keylen);
-@@ -292,7 +292,7 @@ static unsigned long *find_level(struct btree_head *head, struct btree_geo *geo,
- 			/* FIXME: If the right-most key on higher levels is
- 			 * always zero, this wouldn't be necessary. */
- 			i--;
--			setkey(geo, node, key, i);
-+			_setkey(geo, node, key, i);
- 		}
- 		BUG_ON(i < 0);
- 		node = (unsigned long *)bval(geo, node, i);
-@@ -311,7 +311,7 @@ static int btree_grow(struct btree_head *head, struct btree_geo *geo)
- 		return -ENOMEM;
- 	if (head->node) {
- 		fill = getfill(geo, head->node, 0);
--		setkey(geo, node, bkey(geo, head->node, fill - 1), 0);
-+		_setkey(geo, node, bkey(geo, head->node, fill - 1), 0);
- 		setval(geo, node, (unsigned long)head->node, 0);
- 	}
- 	head->node = node;
-@@ -342,16 +342,16 @@ static void steal_l(struct btree_head *head, struct btree_geo *geo, int level,
- 
- 	for (i = rfill - 1; i >= 0; i--) {
- 		/* Shift entries on the right */
--		setkey(geo, right, bkey(geo, right, i), i + no_entries);
-+		_setkey(geo, right, bkey(geo, right, i), i + no_entries);
- 		setval(geo, right, bval(geo, right, i), i + no_entries);
- 	}
- 	for (i = 0; i < no_entries; i++) {
- 		/* Move some entries to the right */
--		setkey(geo, right, bkey(geo, left, lfill - no_entries + i), i);
-+		_setkey(geo, right, bkey(geo, left, lfill - no_entries + i), i);
- 		setval(geo, right, bval(geo, left, lfill - no_entries + i), i);
- 	}
- 	/* Set parent key */
--	setkey(geo, parent, bkey(geo, left, lfill - no_entries - 1), lpos);
-+	_setkey(geo, parent, bkey(geo, left, lfill - no_entries - 1), lpos);
- 	for (i = lfill - no_entries; i < lfill; i++)
- 		clearpair(geo, left, i);
- }
-@@ -366,14 +366,14 @@ static void steal_r(struct btree_head *head, struct btree_geo *geo, int level,
- 
- 	for (i = 0; i < no_entries; i++) {
- 		/* Move some entries to the left */
--		setkey(geo, left, bkey(geo, right, i), lfill + i);
-+		_setkey(geo, left, bkey(geo, right, i), lfill + i);
- 		setval(geo, left, bval(geo, right, i), lfill + i);
- 	}
- 	/* Set parent key */
--	setkey(geo, parent, bkey(geo, right, no_entries - 1), lpos);
-+	_setkey(geo, parent, bkey(geo, right, no_entries - 1), lpos);
- 	/* Shift entries on the right */
- 	for ( ; i < rfill; i++) {
--		setkey(geo, right, bkey(geo, right, i), i - no_entries);
-+		_setkey(geo, right, bkey(geo, right, i), i - no_entries);
- 		setval(geo, right, bval(geo, right, i), i - no_entries);
- 	}
- 	for (i = rfill - no_entries; i < rfill; i++)
-@@ -399,14 +399,14 @@ static int split(struct btree_head *head, struct btree_geo *geo,
- 		return err;
- 	}
- 	for (i = 0; i < fill / 2; i++) {
--		setkey(geo, new, bkey(geo, node, i), i);
-+		_setkey(geo, new, bkey(geo, node, i), i);
- 		setval(geo, new, bval(geo, node, i), i);
--		setkey(geo, node, bkey(geo, node, i + fill / 2), i);
-+		_setkey(geo, node, bkey(geo, node, i + fill / 2), i);
- 		setval(geo, node, bval(geo, node, i + fill / 2), i);
- 		clearpair(geo, node, i + fill / 2);
- 	}
- 	if (fill & 1) {
--		setkey(geo, node, bkey(geo, node, fill - 1), i);
-+		_setkey(geo, node, bkey(geo, node, fill - 1), i);
- 		setval(geo, node, bval(geo, node, fill - 1), i);
- 		clearpair(geo, node, fill - 1);
- 	}
-@@ -487,10 +487,10 @@ retry:
- 
- 	/* shift and insert */
- 	for (i = fill; i > pos; i--) {
--		setkey(geo, node, bkey(geo, node, i - 1), i);
-+		_setkey(geo, node, bkey(geo, node, i - 1), i);
- 		setval(geo, node, bval(geo, node, i - 1), i);
- 	}
--	setkey(geo, node, key, pos);
-+	_setkey(geo, node, key, pos);
- 	setval(geo, node, val, pos);
- 
- 	return 0;
-@@ -513,7 +513,7 @@ static void merge(struct btree_head *head, struct btree_geo *geo, int level,
- 
- 	for (i = 0; i < rfill; i++) {
- 		/* Move all entries to the left */
--		setkey(geo, left, bkey(geo, right, i), lfill + i);
-+		_setkey(geo, left, bkey(geo, right, i), lfill + i);
- 		setval(geo, left, bval(geo, right, i), lfill + i);
- 	}
- 	/* Exchange left and right child in parent */
-@@ -615,7 +615,7 @@ static void *btree_remove_level(struct btree_head *head, struct btree_geo *geo,
- 
- 	/* remove and shift */
- 	for (i = pos; i < fill - 1; i++) {
--		setkey(geo, node, bkey(geo, node, i + 1), i);
-+		_setkey(geo, node, bkey(geo, node, i + 1), i);
- 		setval(geo, node, bval(geo, node, i + 1), i);
- 	}
- 	clearpair(geo, node, fill - 1);
--- 
-2.13.2
-
diff --git a/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs/0001-include-sys-sysmacros.h-for-major-minor-definition.patch b/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs/0001-include-sys-sysmacros.h-for-major-minor-definition.patch
deleted file mode 100644
index 86bb0b53af..0000000000
--- a/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs/0001-include-sys-sysmacros.h-for-major-minor-definition.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 3b02acbb3d5bc93422a6821ce47568633ef4ae5e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 11 Aug 2018 15:09:24 -0700
-Subject: [PATCH] include sys/sysmacros.h for major/minor definition
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- mkfs.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/mkfs.c b/mkfs.c
-index e612cbd..b6aa63d 100644
---- a/mkfs.c
-+++ b/mkfs.c
-@@ -21,6 +21,7 @@
- #include <sys/ioctl.h>
- #include <sys/stat.h>
- #include <sys/types.h>
-+#include <sys/sysmacros.h>
- #define __USE_UNIX98
- #include <unistd.h>
- #include <zlib.h>
diff --git a/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb b/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb
deleted file mode 100644
index 06051d8013..0000000000
--- a/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "LogFS Programs: used to create LogFS file system"
-DESCRIPTION = "\
-LogFS is a Linux log-structured and scalable flash file system, intended \
-for use on large devices of flash memory. It is written by Jörn Engel and \
-in part sponsored by the CE Linux Forum. \
-LogFS is included in the mainline Linux kernel and was introduced in \
-version 2.6.34, released on May 16, 2010."
-HOMEPAGE = "https://github.com/prasad-joshi/logfsprogs"
-SECTION = "base"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://fsck.c;md5=3859dc73da97909ff1d0125e88a27e02"
-DEPENDS = "zlib"
-
-SRC_URI = "git://github.com/prasad-joshi/logfsprogs.git;branch=master;protocol=https \
-           file://0001-Add-LDFLAGS-to-linker-cmdline.patch \
-           file://0001-btree-Avoid-conflicts-with-libc-namespace-about-setk.patch \
-           file://0001-include-sys-sysmacros.h-for-major-minor-definition.patch \
-           "
-SRCREV = "45b72c81ce3c6fa17ca19bafc207ea93e76312f4"
-
-
-EXTRA_OEMAKE = "CC="${CC}" LD="${LD}" AR="${AR}""
-
-do_install () {
-    mkdir -p ${D}${bindir}
-    install -m 0755 ${S}/mklogfs ${D}${bindir}/mklogfs
-}
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-filesystems/recipes-filesystems/packagegroups/packagegroup-meta-filesystems.bb b/meta-filesystems/recipes-filesystems/packagegroups/packagegroup-meta-filesystems.bb
index 3a4b87a206..7d9919149e 100644
--- a/meta-filesystems/recipes-filesystems/packagegroups/packagegroup-meta-filesystems.bb
+++ b/meta-filesystems/recipes-filesystems/packagegroups/packagegroup-meta-filesystems.bb
@@ -21,7 +21,6 @@ RDEPENDS:packagegroup-meta-filesystems = "\
     libisofs \
     libburn \
     libisoburn \
-    logfsprogs \
     fuse-exfat \
     owfs \
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "smbnetfs", "", d)} \
