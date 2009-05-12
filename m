Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1M3iDt-0003nm-3U
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 May 2009 05:00:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 0EEC04AA66B;
	Mon, 11 May 2009 22:53:30 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 05490-07; Mon, 11 May 2009 22:53:29 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id E1D0D4AA69C; Mon, 11 May 2009 22:53:29 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00,
	UPPERCASE_25_50 autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 08264332387;
	Mon, 11 May 2009 22:53:25 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id EB0414194F; Mon, 11 May 2009 22:53:24 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 May 2009 22:53:23 -0400
Message-Id: <1242096804-27041-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <c384c5ea0905071305s1b180deal8c5fd09b5d646308@mail.gmail.com>
References: <c384c5ea0905071305s1b180deal8c5fd09b5d646308@mail.gmail.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH] Remove unused grub-0.93.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 May 2009 03:00:05 -0000

As far as I can tell, only the wrap board and gpe-phone-image are using
grub, and they use the default version, 0.97.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/grub/grub-0.93/autohell.patch |  166 ---------------------------------
 recipes/grub/grub-0.93/memcpy.patch   |   13 ---
 recipes/grub/grub-0.93/reiserfs.patch |   11 --
 recipes/grub/grub_0.93.bb             |   15 ---
 4 files changed, 0 insertions(+), 205 deletions(-)
 delete mode 100644 recipes/grub/grub-0.93/autohell.patch
 delete mode 100644 recipes/grub/grub-0.93/memcpy.patch
 delete mode 100644 recipes/grub/grub-0.93/reiserfs.patch
 delete mode 100644 recipes/grub/grub_0.93.bb

diff --git a/recipes/grub/grub-0.93/autohell.patch b/recipes/grub/grub-0.93/autohell.patch
deleted file mode 100644
index ca1f2d1..0000000
--- a/recipes/grub/grub-0.93/autohell.patch
+++ /dev/null
@@ -1,166 +0,0 @@
---- grub-0.93/configure.in~	2002-11-29 20:12:08.000000000 +0000
-+++ grub-0.93/configure.in	2004-01-04 12:03:05.000000000 +0000
-@@ -54,7 +54,7 @@
- _AM_DEPENDENCIES(CC)
- 
- dnl Because recent automake complains about AS, set it here.
--AS="$CC"
-+AM_PROG_AS
- AC_SUBST(AS)
- 
- AC_ARG_WITH(binutils,
---- grub-0.93/stage1/Makefile.am~	2002-09-08 02:58:08.000000000 +0100
-+++ grub-0.93/stage1/Makefile.am	2004-01-04 12:31:38.000000000 +0000
-@@ -4,7 +4,7 @@
- CLEANFILES = $(nodist_pkgdata_DATA)
- 
- # We can't use builtins or standard includes.
--AM_ASFLAGS = $(STAGE1_CFLAGS) -fno-builtin -nostdinc
-+AM_CCASFLAGS = $(STAGE1_CFLAGS) -fno-builtin -nostdinc $(DEFAULT_INCLUDES)
- LDFLAGS = -nostdlib -Wl,-N,-Ttext,7C00
- 
- noinst_PROGRAMS = stage1.exec
---- grub-0.93/stage2/Makefile.am~	2002-11-29 18:00:53.000000000 +0000
-+++ grub-0.93/stage2/Makefile.am	2004-01-04 12:30:29.000000000 +0000
-@@ -12,6 +12,7 @@
- 
- # For <stage1.h>.
- INCLUDES = -I$(top_srcdir)/stage1
-+AM_CCASFLAGS = $(DEFAULT_INCLUDES) $(INCLUDES)
- 
- # The library for /sbin/grub.
- noinst_LIBRARIES = libgrub.a
-@@ -88,7 +89,7 @@
- 	fsys_vstafs.c fsys_xfs.c gunzip.c hercules.c md5.c serial.c \
- 	smp-imps.c stage2.c terminfo.c tparm.c
- pre_stage2_exec_CFLAGS = $(STAGE2_COMPILE) $(FSYS_CFLAGS)
--pre_stage2_exec_ASFLAGS = $(STAGE2_COMPILE) $(FSYS_CFLAGS)
-+pre_stage2_exec_CCASFLAGS = $(STAGE2_COMPILE) $(FSYS_CFLAGS) $(AM_CCASFLAGS)
- pre_stage2_exec_LDFLAGS = $(PRE_STAGE2_LINK)
- 
- if NETBOOT_SUPPORT
-@@ -109,7 +110,7 @@
- 	echo "#define STAGE2_SIZE $$6" > stage2_size.h
- 
- start_exec_SOURCES = start.S
--start_exec_ASFLAGS = $(STAGE2_COMPILE)
-+start_exec_CCASFLAGS = $(STAGE2_COMPILE) $(AM_CCASFLAGS)
- start_exec_LDFLAGS = $(START_LINK)
- 
- # XXX: automake doesn't provide a way to specify dependencies for object
-@@ -127,8 +128,8 @@
- 	stage1_5.c fsys_ext2fs.c bios.c
- e2fs_stage1_5_exec_CFLAGS = $(STAGE1_5_COMPILE) -DFSYS_EXT2FS=1 \
- 	-DNO_BLOCK_FILES=1
--e2fs_stage1_5_exec_ASFLAGS = $(STAGE1_5_COMPILE) -DFSYS_EXT2FS=1 \
--	-DNO_BLOCK_FILES=1
-+e2fs_stage1_5_exec_CCASFLAGS = $(STAGE1_5_COMPILE) -DFSYS_EXT2FS=1 \
-+	-DNO_BLOCK_FILES=1 $(AM_CCASFLAGS)
- e2fs_stage1_5_exec_LDFLAGS = $(STAGE1_5_LINK)
- 
- # For fat_stage1_5 target.
-@@ -136,8 +137,8 @@
- 	stage1_5.c fsys_fat.c bios.c
- fat_stage1_5_exec_CFLAGS = $(STAGE1_5_COMPILE) -DFSYS_FAT=1 \
- 	-DNO_BLOCK_FILES=1
--fat_stage1_5_exec_ASFLAGS = $(STAGE1_5_COMPILE) -DFSYS_FAT=1 \
--	-DNO_BLOCK_FILES=1
-+fat_stage1_5_exec_CCASFLAGS = $(STAGE1_5_COMPILE) -DFSYS_FAT=1 \
-+	-DNO_BLOCK_FILES=1 $(AM_CCASFLAGS)
- fat_stage1_5_exec_LDFLAGS = $(STAGE1_5_LINK)
- 
- # For ffs_stage1_5 target.
-@@ -145,8 +146,8 @@
- 	stage1_5.c fsys_ffs.c bios.c
- ffs_stage1_5_exec_CFLAGS = $(STAGE1_5_COMPILE) -DFSYS_FFS=1 \
- 	-DNO_BLOCK_FILES=1
--ffs_stage1_5_exec_ASFLAGS = $(STAGE1_5_COMPILE) -DFSYS_FFS=1 \
--	-DNO_BLOCK_FILES=1
-+ffs_stage1_5_exec_CCASFLAGS = $(STAGE1_5_COMPILE) -DFSYS_FFS=1 \
-+	-DNO_BLOCK_FILES=1 $(AM_CCASFLAGS)
- ffs_stage1_5_exec_LDFLAGS = $(STAGE1_5_LINK)
- 
- # For minix_stage1_5 target.
-@@ -154,8 +155,8 @@
- 	stage1_5.c fsys_minix.c bios.c
- minix_stage1_5_exec_CFLAGS = $(STAGE1_5_COMPILE) -DFSYS_MINIX=1 \
- 	-DNO_BLOCK_FILES=1
--minix_stage1_5_exec_ASFLAGS = $(STAGE1_5_COMPILE) -DFSYS_MINIX=1 \
--	-DNO_BLOCK_FILES=1
-+minix_stage1_5_exec_CCASFLAGS = $(STAGE1_5_COMPILE) -DFSYS_MINIX=1 \
-+	-DNO_BLOCK_FILES=1 $(AM_CCASFLAGS)
- minix_stage1_5_exec_LDFLAGS = $(STAGE1_5_LINK)
- 
- # For reiserfs_stage1_5 target.
-@@ -163,8 +164,8 @@
- 	disk_io.c stage1_5.c fsys_reiserfs.c bios.c
- reiserfs_stage1_5_exec_CFLAGS = $(STAGE1_5_COMPILE) -DFSYS_REISERFS=1 \
- 	-DNO_BLOCK_FILES=1
--reiserfs_stage1_5_exec_ASFLAGS = $(STAGE1_5_COMPILE) -DFSYS_REISERFS=1 \
--	-DNO_BLOCK_FILES=1
-+reiserfs_stage1_5_exec_CCASFLAGS = $(STAGE1_5_COMPILE) -DFSYS_REISERFS=1 \
-+	-DNO_BLOCK_FILES=1 $(AM_CCASFLAGS)
- reiserfs_stage1_5_exec_LDFLAGS = $(STAGE1_5_LINK)
- 
- # For vstafs_stage1_5 target.
-@@ -172,8 +173,8 @@
- 	disk_io.c stage1_5.c fsys_vstafs.c bios.c
- vstafs_stage1_5_exec_CFLAGS = $(STAGE1_5_COMPILE) -DFSYS_VSTAFS=1 \
- 	-DNO_BLOCK_FILES=1
--vstafs_stage1_5_exec_ASFLAGS = $(STAGE1_5_COMPILE) -DFSYS_VSTAFS=1 \
--	-DNO_BLOCK_FILES=1
-+vstafs_stage1_5_exec_CCASFLAGS = $(STAGE1_5_COMPILE) -DFSYS_VSTAFS=1 \
-+	-DNO_BLOCK_FILES=1 $(AM_CCASFLAGS)
- vstafs_stage1_5_exec_LDFLAGS = $(STAGE1_5_LINK)
- 
- # For jfs_stage1_5 target.
-@@ -181,8 +182,8 @@
- 	disk_io.c stage1_5.c fsys_jfs.c bios.c
- jfs_stage1_5_exec_CFLAGS = $(STAGE1_5_COMPILE) -DFSYS_JFS=1 \
- 	-DNO_BLOCK_FILES=1
--jfs_stage1_5_exec_ASFLAGS = $(STAGE1_5_COMPILE) -DFSYS_JFS=1 \
--	-DNO_BLOCK_FILES=1
-+jfs_stage1_5_exec_CCASFLAGS = $(STAGE1_5_COMPILE) -DFSYS_JFS=1 \
-+	-DNO_BLOCK_FILES=1 $(AM_CCASFLAGS)
- jfs_stage1_5_exec_LDFLAGS = $(STAGE1_5_LINK)
- 
- # For xfs_stage1_5 target.
-@@ -190,16 +191,16 @@
- 	disk_io.c stage1_5.c fsys_xfs.c bios.c
- xfs_stage1_5_exec_CFLAGS = $(STAGE1_5_COMPILE) -DFSYS_XFS=1 \
- 	-DNO_BLOCK_FILES=1
--xfs_stage1_5_exec_ASFLAGS = $(STAGE1_5_COMPILE) -DFSYS_XFS=1 \
--	-DNO_BLOCK_FILES=1
-+xfs_stage1_5_exec_CCASFLAGS = $(STAGE1_5_COMPILE) -DFSYS_XFS=1 \
-+	-DNO_BLOCK_FILES=1 $(AM_CCASFLAGS)
- xfs_stage1_5_exec_LDFLAGS = $(STAGE1_5_LINK)
- 
- # For diskless target.
- diskless_exec_SOURCES = $(pre_stage2_exec_SOURCES)
- diskless_exec_CFLAGS = $(STAGE2_COMPILE) $(FSYS_CFLAGS) \
- 	-DSUPPORT_DISKLESS=1
--diskless_exec_ASFLAGS = $(STAGE2_COMPILE) $(FSYS_CFLAGS) \
--	-DSUPPORT_DISKLESS=1
-+diskless_exec_CCASFLAGS = $(STAGE2_COMPILE) $(FSYS_CFLAGS) \
-+	-DSUPPORT_DISKLESS=1 $(AM_CCASFLAGS)
- diskless_exec_LDFLAGS = $(PRE_STAGE2_LINK)
- diskless_exec_LDADD = ../netboot/libdrivers.a
- 
-@@ -210,7 +211,7 @@
- 
- # For nbloader target.
- nbloader_exec_SOURCES = nbloader.S
--nbloader_exec_ASFLAGS = $(STAGE2_COMPILE)
-+nbloader_exec_CCASFLAGS = $(STAGE2_COMPILE) $(AM_CCASFLAGS)
- nbloader_exec_LDFLAGS = $(NBLOADER_LINK)
- 
- # XXX: See the comment for start_exec-start.o.
-@@ -223,7 +224,7 @@
- 
- # For pxeloader target.
- pxeloader_exec_SOURCES = pxeloader.S
--pxeloader_exec_ASFLAGS = $(STAGE2_COMPILE)
-+pxeloader_exec_CCASFLAGS = $(STAGE2_COMPILE) $(AM_CCASFLAGS)
- pxeloader_exec_LDFLAGS = $(PXELOADER_LINK)
- 
- # XXX: See the comment for start_exec-start.o.
diff --git a/recipes/grub/grub-0.93/memcpy.patch b/recipes/grub/grub-0.93/memcpy.patch
deleted file mode 100644
index dd5da33..0000000
--- a/recipes/grub/grub-0.93/memcpy.patch
+++ /dev/null
@@ -1,13 +0,0 @@
---- grub-0.93/stage2/asm.S~	2002-12-02 23:18:56.000000000 +0000
-+++ grub-0.93/stage2/asm.S	2004-01-04 12:50:11.000000000 +0000
-@@ -62,6 +62,10 @@
- start:
- _start:
- #endif /* ! STAGE1_5 */
-+
-+#undef memcpy
-+ENTRY(memcpy)
-+	jmp EXT_C(grub_memmove)
- 	
- ENTRY(main)
- 	/*
diff --git a/recipes/grub/grub-0.93/reiserfs.patch b/recipes/grub/grub-0.93/reiserfs.patch
deleted file mode 100644
index 5b4fb5b..0000000
--- a/recipes/grub/grub-0.93/reiserfs.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- grub-0.93/stage2/fsys_reiserfs.c~	2002-11-29 17:46:01.000000000 +0000
-+++ grub-0.93/stage2/fsys_reiserfs.c	2004-01-04 12:16:34.000000000 +0000
-@@ -112,7 +112,7 @@
-   /* offset in the log of where to start replay after a crash */
-   __u32 j_first_unflushed_offset;
-   /* mount id to detect very old transactions */
--  __u32 long j_mount_id;
-+  __u32 j_mount_id;
- };
- 
- /* magic string to find desc blocks in the journal */
diff --git a/recipes/grub/grub_0.93.bb b/recipes/grub/grub_0.93.bb
deleted file mode 100644
index 9fc0084..0000000
--- a/recipes/grub/grub_0.93.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "GRUB is the GRand Unified Bootloader"
-HOMEPAGE = "http://www.gnu.org/software/grub"
-SECTION = "bootloaders"
-PRIORITY = "optional"
-
-SRC_URI = "ftp://alpha.gnu.org/gnu/grub/grub-${PV}.tar.gz; \
-	   file://autohell.patch;patch=1 \
-	   file://memcpy.patch;patch=1 \
-	   file://reiserfs.patch;patch=1"
-
-inherit autotools
-
-COMPATIBLE_HOST = 'i.86.*-linux'
-
-FILES_${PN}-doc = "${datadir}"
-- 
1.5.6.5



