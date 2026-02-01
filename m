Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 375BCE7C71B
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 12:53:55 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28771.1769950433296187444
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Feb 2026 04:53:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VCCV3FyN;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43601e96f72so363815f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Feb 2026 04:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769950432; x=1770555232; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vmRDHWX51vQph78EecCATv3Hm0heeNl9PCM7DdkjBBk=;
        b=VCCV3FyNGBD09nVqmiOItNxvjaFM3xJKpyhIQUoVzGzgnAE44OJVb7jLbXxLtPoOoa
         XGMNq2CQCdyxlyMRKBtfuRAG9vhAwih3mbmSYTUN/txzKLFiiR3k+Wn30F7ynJGHgEQC
         ZkND6PsS2Ins8AFMBKRo7il+PVbvoe3JKC/pO7QIk3hx1no9tMqcrsOjLTlcyRPPOoTx
         Khz+ZlXC/QjRmDJ4wOL8isr9v27Q9turrzoXf1EbDZWF8xpCkt6aD6y1g3bnUAjVbVcg
         9xdaYPpv/z6O0yizgi5C/ovyFStJfvQHfOuwXiNF5w2oGYCKnGBLNPPXSz5OBd2JdBh6
         ejTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769950432; x=1770555232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vmRDHWX51vQph78EecCATv3Hm0heeNl9PCM7DdkjBBk=;
        b=aaGGHTgW8hWOZDTILO6KPpxdif/e5laOSbmZaT6C4UyQrplj2GZCFz4KeT+yIU+smW
         YVCyOqAuOiaGF1vBB5EFx7tc8TVgSKUJRMrhGE0g3xqt4uS7nQNPgpNAu4zUNZNjimXV
         Htct1uLoDebRgD6GPqYVSHu9vyqYX2w/h5nHsCMmYbaxSOkaFqjTV0GyMeTyqiC+kQdZ
         b/C40Fq2v2gydmasNQZDaKFDYQPb3/eja/WzO+JmCV5x8clxksp1/CkHuQiXC3TO381O
         xES9EpLyjKDc3nanKK3F1xFhR1zObo/Mgfldb/IPFiKufSsTCYNPHg4D7X4ixpwGi4LE
         V2Bg==
X-Gm-Message-State: AOJu0YwW2D3LJrEwgA8F2sX4dPlPiGNovIL+fSQ7yNkF1mIDWU5gRebR
	mgGvr2t9kFD3xtFYukeW9uaSjwD5ImVuvg/NeeG8EA7VSjdEUJbKJCfthkTsHg==
X-Gm-Gg: AZuq6aLHPQV2E5JuGLIvT5UpAFltOVu9V+pCdin7+vtnhCY6ZbdV5h+NsskvRpK7Zxk
	z6yLoIUzMoLMfMjbHGRwKqG8w/bG5RoXK7hhBVfczvJM3irj1M4ri7NVyornjUhzxxWZ2uzmvct
	GPa3XZiyeKBTtglEiNHzqvl0ldmPBfUxSQ8K8O6ngp0wlP5dK/o3iMmWgqepAPgjz6ZH04FMDH+
	8pwciGGbfObiWgOqxf9Nd9tEvkChgMbRzz7RdOiRAOjwgC5CHOJOVu7JMDQuiroarv77gTOvSXi
	egkPezkT1Q5B3ozpBH5331dTK6h3AAGf2lih8YSo6a6obVCeSgiMJse+R32NDQFty8dGrU9g2mO
	RA/phasbdvOUS1+Uf4M6FBDOMYERVO6EVmPY5XQxn8LnCxCHZ2DooX7hhQo/SKlApx7XpkZ1lbd
	DwbaIZlWbc/tYiO92gZw0=
X-Received: by 2002:a05:6000:400e:b0:435:af8a:2a6d with SMTP id ffacd0b85a97d-435f3a66f62mr13041925f8f.11.1769950431256;
        Sun, 01 Feb 2026 04:53:51 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ed952sm37288444f8f.10.2026.02.01.04.53.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 04:53:50 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libx86-1: upgrade 1.1 -> 1.1.1
Date: Sun,  1 Feb 2026 13:53:50 +0100
Message-ID: <20260201125350.472245-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 Feb 2026 12:53:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124031

Bugfix release, mostly with patches applied from other distros.
Also fixes the SRC_URI which became inaccessible over time.
Drop patches that are included in this release.

Shortlog:
https://gitlab.archlinux.org/grawlinson/libx86/-/compare/v1.1...v1.1.1

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...efine-CARD32-as-uint-as-it-is-32-bit.patch |   0
 .../0001-assume-zero-is-valid-address.patch   |   0
 ...-type-of-the-void-pointer-assignment.patch |  33 ---
 .../libx86-1.1/libx86-mmap-offset.patch       | 192 ------------------
 .../libx86-1.1/makefile-add-ldflags.patch     |  17 --
 .../{libx86-1_1.1.bb => libx86-1_1.1.1.bb}    |   9 +-
 6 files changed, 4 insertions(+), 247 deletions(-)
 rename meta-oe/recipes-extended/libx86-1/{libx86-1.1 => libx86-1.1.1}/0001-Define-CARD32-as-uint-as-it-is-32-bit.patch (100%)
 rename meta-oe/recipes-extended/libx86-1/{libx86-1.1 => libx86-1.1.1}/0001-assume-zero-is-valid-address.patch (100%)
 delete mode 100644 meta-oe/recipes-extended/libx86-1/libx86-1.1/0001-Fix-type-of-the-void-pointer-assignment.patch
 delete mode 100644 meta-oe/recipes-extended/libx86-1/libx86-1.1/libx86-mmap-offset.patch
 delete mode 100644 meta-oe/recipes-extended/libx86-1/libx86-1.1/makefile-add-ldflags.patch
 rename meta-oe/recipes-extended/libx86-1/{libx86-1_1.1.bb => libx86-1_1.1.1.bb} (74%)

diff --git a/meta-oe/recipes-extended/libx86-1/libx86-1.1/0001-Define-CARD32-as-uint-as-it-is-32-bit.patch b/meta-oe/recipes-extended/libx86-1/libx86-1.1.1/0001-Define-CARD32-as-uint-as-it-is-32-bit.patch
similarity index 100%
rename from meta-oe/recipes-extended/libx86-1/libx86-1.1/0001-Define-CARD32-as-uint-as-it-is-32-bit.patch
rename to meta-oe/recipes-extended/libx86-1/libx86-1.1.1/0001-Define-CARD32-as-uint-as-it-is-32-bit.patch
diff --git a/meta-oe/recipes-extended/libx86-1/libx86-1.1/0001-assume-zero-is-valid-address.patch b/meta-oe/recipes-extended/libx86-1/libx86-1.1.1/0001-assume-zero-is-valid-address.patch
similarity index 100%
rename from meta-oe/recipes-extended/libx86-1/libx86-1.1/0001-assume-zero-is-valid-address.patch
rename to meta-oe/recipes-extended/libx86-1/libx86-1.1.1/0001-assume-zero-is-valid-address.patch
diff --git a/meta-oe/recipes-extended/libx86-1/libx86-1.1/0001-Fix-type-of-the-void-pointer-assignment.patch b/meta-oe/recipes-extended/libx86-1/libx86-1.1/0001-Fix-type-of-the-void-pointer-assignment.patch
deleted file mode 100644
index ea3c306fd7..0000000000
--- a/meta-oe/recipes-extended/libx86-1/libx86-1.1/0001-Fix-type-of-the-void-pointer-assignment.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From c782e208021409e9b78acb2200abd4319072e78a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 2 Sep 2022 00:28:05 -0700
-Subject: [PATCH] Fix type of the void pointer assignment
-
-Fixes build with clang
-
-x86-common.c:216:9: error: incompatible integer to pointer conversion assigning to 'void *' from 'long' [-Wint-conversion]
-        offset = mem_info.offset - REAL_MEM_BASE;
-               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- x86-common.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/x86-common.c b/x86-common.c
-index 137bc3c..6f737ed 100644
---- a/x86-common.c
-+++ b/x86-common.c
-@@ -213,7 +213,7 @@ void *LRMI_common_init(int high_page)
- 	if (!real_mem_init(high_page))
- 		return NULL;
- 
--	offset = mem_info.offset - REAL_MEM_BASE;
-+	offset = (void*)(mem_info.offset - REAL_MEM_BASE);
- 
- 	/*
- 	 Map the Interrupt Vectors (0x0 - 0x400) + BIOS data (0x400 - 0x502)
--- 
-2.37.3
-
diff --git a/meta-oe/recipes-extended/libx86-1/libx86-1.1/libx86-mmap-offset.patch b/meta-oe/recipes-extended/libx86-1/libx86-1.1/libx86-mmap-offset.patch
deleted file mode 100644
index 1c120c04b9..0000000000
--- a/meta-oe/recipes-extended/libx86-1/libx86-1.1/libx86-mmap-offset.patch
+++ /dev/null
@@ -1,192 +0,0 @@
-Upstream-Status: Pending
-
-Upstream-Statue: Pending 
-[from ftp://195.220.108.108/linux/fedora/linux/development/rawhide/source/SRPMS/l/libx86-1.1-21.fc23.src.rpm]
-
-diff -ur libx86-1.1/lrmi.c libx86-1.1.hack/lrmi.c
---- libx86-1.1/lrmi.c	2006-10-30 15:10:16.000000000 -0500
-+++ libx86-1.1.hack/lrmi.c	2009-10-26 15:55:42.000000000 -0400
-@@ -136,7 +136,7 @@
- 	if (context.ready)
- 		return 1;
- 
--	if (!LRMI_common_init())
-+	if (!LRMI_common_init(0))
- 		return 0;
- 
- 	/*
-diff -ur libx86-1.1/thunk.c libx86-1.1.hack/thunk.c
---- libx86-1.1/thunk.c	2008-04-02 20:48:00.000000000 -0400
-+++ libx86-1.1.hack/thunk.c	2009-10-26 16:05:39.000000000 -0400
-@@ -139,11 +139,11 @@
- 	int i;
- 	X86EMU_intrFuncs intFuncs[256];
- 
--	if (!LRMI_common_init())
-+	mmap_addr = LRMI_common_init(1);
-+
-+	if (!mmap_addr)
- 		return 0;
- 
--	mmap_addr = 0;
--	
- 	X86EMU_pioFuncs pioFuncs = {
- 		(&x_inb),
- 		(&x_inw),
-@@ -169,10 +169,10 @@
- 	X86_ESP = 0xFFF9;
- 	memset (stack, 0, 64*1024);
- 
--	*((char *)0) = 0x4f; /* Make sure that we end up jumping back to a
--				halt instruction */
-+	*mmap_addr = 0x4f; /* Make sure that we end up jumping back to a
-+			      halt instruction */
- 
--	M.mem_base = 0;
-+	M.mem_base = (unsigned long)mmap_addr;
- 	M.mem_size = 1024*1024;
- 
- 	return 1;
-diff -ur libx86-1.1/x86-common.c libx86-1.1.hack/x86-common.c
---- libx86-1.1/x86-common.c	2008-05-16 12:56:23.000000000 -0400
-+++ libx86-1.1.hack/x86-common.c	2009-10-26 16:03:21.000000000 -0400
-@@ -45,14 +45,15 @@
- static struct {
- 	int ready;
- 	int count;
-+	void *offset;
- 	struct mem_block blocks[REAL_MEM_BLOCKS];
- } mem_info = { 0 };
- 
- static int
--real_mem_init(void)
-+real_mem_init(int high_page)
- {
- 	void *m;
--	int fd_zero;
-+	int fd_zero, flags = MAP_SHARED;
- 
- 	if (mem_info.ready)
- 		return 1;
-@@ -63,9 +64,12 @@
- 		return 0;
- 	}
- 
-+	if (!high_page)
-+		flags |= MAP_FIXED;
-+
- 	m = mmap((void *)REAL_MEM_BASE, REAL_MEM_SIZE,
--	 PROT_READ | PROT_WRITE | PROT_EXEC,
--	 MAP_FIXED | MAP_SHARED, fd_zero, 0);
-+		 PROT_READ | PROT_WRITE | PROT_EXEC,
-+		 flags, fd_zero, 0);
- 
- 	if (m == (void *)-1) {
- 		perror("mmap /dev/zero");
-@@ -76,6 +80,7 @@
- 	close(fd_zero);
- 
- 	mem_info.ready = 1;
-+	mem_info.offset = m;
- 	mem_info.count = 1;
- 	mem_info.blocks[0].size = REAL_MEM_SIZE;
- 	mem_info.blocks[0].free = 1;
-@@ -87,7 +92,7 @@
- real_mem_deinit(void)
- {
- 	if (mem_info.ready) {
--		munmap((void *)REAL_MEM_BASE, REAL_MEM_SIZE);
-+		munmap(mem_info.offset, REAL_MEM_SIZE);
- 		mem_info.ready = 0;
- 	}
- }
-@@ -119,7 +124,7 @@
- LRMI_alloc_real(int size)
- {
- 	int i;
--	char *r = (char *)REAL_MEM_BASE;
-+	char *r = (char *)mem_info.offset;
- 
- 	if (!mem_info.ready)
- 		return NULL;
-@@ -151,7 +156,7 @@
- LRMI_free_real(void *m)
- {
- 	int i;
--	char *r = (char *)REAL_MEM_BASE;
-+	char *r = (char *)mem_info.offset;
- 
- 	if (!mem_info.ready)
- 		return;
-@@ -200,13 +205,15 @@
- 	return *(unsigned short *)(i * 4);
- }
- 
--int LRMI_common_init(void)
-+void *LRMI_common_init(int high_page)
- {
--	void *m;
-+	void *m, *offset;
- 	int fd_mem;
- 
--	if (!real_mem_init())
--		return 0;
-+	if (!real_mem_init(high_page))
-+		return NULL;
-+
-+	offset = mem_info.offset - REAL_MEM_BASE;
- 
- 	/*
- 	 Map the Interrupt Vectors (0x0 - 0x400) + BIOS data (0x400 - 0x502)
-@@ -217,33 +224,33 @@
- 	if (fd_mem == -1) {
- 		real_mem_deinit();
- 		perror("open /dev/mem");
--		return 0;
-+		return NULL;
- 	}
- 
--	m = mmap((void *)0, 0x502,
--	 PROT_READ | PROT_WRITE | PROT_EXEC,
--	 MAP_FIXED | MAP_SHARED, fd_mem, 0);
-+	m = mmap(offset, 0x502,
-+		 PROT_READ | PROT_WRITE | PROT_EXEC,
-+		 MAP_FIXED | MAP_SHARED, fd_mem, 0);
- 
- 	if (m == (void *)-1) {
- 		close(fd_mem);
- 		real_mem_deinit();
- 		perror("mmap /dev/mem");
--		return 0;
-+		return NULL;
- 	}
- 
--	m = mmap((void *)0xa0000, 0x100000 - 0xa0000,
-+	m = mmap(offset+0xa0000, 0x100000 - 0xa0000,
- 	 PROT_READ | PROT_WRITE | PROT_EXEC,
- 	 MAP_FIXED | MAP_SHARED, fd_mem, 0xa0000);
- 
- 	if (m == (void *)-1) {
--		munmap((void *)0, 0x502);
-+		munmap(offset, 0x502);
- 		close(fd_mem);
- 		real_mem_deinit();
- 		perror("mmap /dev/mem");
--		return 0;
-+		return NULL;
- 	}
- 
- 	close(fd_mem);
- 
--	return 1;
-+	return offset;
- }
-diff -ur libx86-1.1/x86-common.h libx86-1.1.hack/x86-common.h
---- libx86-1.1/x86-common.h	2006-09-07 18:44:27.000000000 -0400
-+++ libx86-1.1.hack/x86-common.h	2009-10-26 16:01:19.000000000 -0400
-@@ -40,4 +40,4 @@
- 
- void *LRMI_alloc_real(int size);
- void LRMI_free_real(void *m);
--int LRMI_common_init(void);
-+void *LRMI_common_init(int high_page);
diff --git a/meta-oe/recipes-extended/libx86-1/libx86-1.1/makefile-add-ldflags.patch b/meta-oe/recipes-extended/libx86-1/libx86-1.1/makefile-add-ldflags.patch
deleted file mode 100644
index 821ab379d5..0000000000
--- a/meta-oe/recipes-extended/libx86-1/libx86-1.1/makefile-add-ldflags.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
-
-diff --git a/Makefile b/Makefile
-index 951b617..6d9b73d 100644
---- a/Makefile
-+++ b/Makefile
-@@ -22,7 +22,7 @@ static: $(OBJECTS)
- 	$(AR) cru libx86.a $(OBJECTS)
- 
- shared: $(OBJECTS)
--	$(CC) $(CFLAGS) -o libx86.so.1 -shared -Wl,-soname,libx86.so.1 $(OBJECTS)
-+	$(CC) $(CFLAGS) $(LDFLAGS) -o libx86.so.1 -shared -Wl,-soname,libx86.so.1 $(OBJECTS)
- 
- objclean:
- 	$(MAKE) -C x86emu clean
diff --git a/meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb b/meta-oe/recipes-extended/libx86-1/libx86-1_1.1.1.bb
similarity index 74%
rename from meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb
rename to meta-oe/recipes-extended/libx86-1/libx86-1_1.1.1.bb
index 817322a484..5ef7707a86 100644
--- a/meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb
+++ b/meta-oe/recipes-extended/libx86-1/libx86-1_1.1.1.bb
@@ -7,17 +7,16 @@ LICENSE = "MIT & BSD-3-Clause"
 SECTION = "libs"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=633af6c02e6f624d4c472d970a2aca53"
 
-SRC_URI = "https://mirrors.slackware.com/slackware/slackware-current/source/ap/libx86/libx86-${PV}.tar.gz \
-           file://libx86-mmap-offset.patch \
+SRC_URI = "https://mirrors.slackware.com/slackware/slackware-current/source/ap/libx86/libx86-v${PV}.tar.lz \
            file://0001-assume-zero-is-valid-address.patch \
-           file://makefile-add-ldflags.patch \
-           file://0001-Fix-type-of-the-void-pointer-assignment.patch \
            file://0001-Define-CARD32-as-uint-as-it-is-32-bit.patch \
 "
-SRC_URI[sha256sum] = "5bf13104cb327472b5cb65643352a9138646becacc06763088d83001d832d048"
+SRC_URI[sha256sum] = "0de221c8e2fcc84078155c1a82f86dcd71c2706033eb410d2090d86c99f51141"
 
 UPSTREAM_CHECK_URI = "https://mirrors.slackware.com/slackware/slackware-current/source/ap/libx86/"
 
+S = "${UNPACKDIR}/${BPN}-v${PV}"
+
 BPN = "libx86"
 COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
 

