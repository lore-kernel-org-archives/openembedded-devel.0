Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B269AE9E2EA
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 12:00:56 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17417.1770811249024183592
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Feb 2026 04:00:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bVLh9fGC;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-823075fed75so494410b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Feb 2026 04:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770811248; x=1771416048; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHq/QXDbO6kxM4adWIGC+3TJ5/LRUsPQ4oqX7vUaU24=;
        b=bVLh9fGCQPOoGgJp94L58C4b35+BUyCd+vTi7U7qXQwMAe32xMVRyEBLSwhd5UGMKy
         6826SgMLgFgJR7ajkDmHGYMhNVJ6e2tGQ9Vuqs61EvjXPveHO9LwSi7Qba+7lLq3rMuy
         ccB0RwDK74IYrc5SddoSORZ58zbEbOToLSo4CQo0cCPXR0YbP00HccAFXvUfBz5gexmu
         Mwwa4bfwVXdk+ZpsQt+H+WKkiYV0iMKqI0IBxBOqgA0RvJi01seUs+/9MishONzYZiCt
         vkEcfM06QHCVQ+3gqax2h/Zlx7vNt7CxzonZIm2WiflR1a6PzdvFD+hsMftaCRJ5qo8V
         w0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770811248; x=1771416048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AHq/QXDbO6kxM4adWIGC+3TJ5/LRUsPQ4oqX7vUaU24=;
        b=RZ8Ya1hlshojkIOSBapQ1LR7RTfeG/S46VwGLyXOhVH3hylzkjqbgdk0rzlS9RpXI1
         2VqjlxgNCsYdBJ7qBkEuKD5oOsndOKdymL9U3fTT93PHl5qg1egZUJA/wK7dSTKp0d2K
         vKlUw74cDAF5jloVOGP5mIvTA0fM/MNgJcUtSy75QFgx9sYziZWohYnQpCJmRbP3SaFE
         ZAIyuidd25mFr/2Hwh4g/kOvD1f6OXsmCwcuSQwrNqkt4/JD8yJWxyS9FzyFwRxIviT6
         DTFMXX9dYE9qlHNoTNlnnN6imh4GM3kke5vXEC+53Grw6bcDY1Q3DqZpiqQIe73kIO5N
         yORg==
X-Gm-Message-State: AOJu0YxGRG3Ih1C2PQGDeDC/xAdIsqY33BaKlsZAZzIC6i7DMAGsLZYa
	ke1xg5zoSLkspOQiuC7OZZ2m6XfX+aQtJf7NE+UiPaML9foiBY5ccfAKAesX3w==
X-Gm-Gg: AZuq6aKAlFrSety6ACr9cVjK3PyK4+ug9mTXl4g2kjT8+IkwrareO7ejLpoVgL5BBti
	OpQ+c/xT91jWMDO98VoMMHAPzU6zqKr7OYjj2fnChayoj9uflmNn3NGSiN5ayPhU+RNlnhm1C1K
	Kx2WwQv3cmRelCP5RKqaZAbVJ5bE2VDIfQJoKiP8BYxLpee4xSU4jWKMBfMm84XdKTTGVs6nvKE
	SMFMTxOlrL2DAH8fw4JKucjAFpQHVvXUM9A/qOQ+rG541zdB9u+IpfI7FedIngEhUwHU6SWs1Dc
	sVdEa38vPBRZ7BdEISERWT2TXpw88oWnWOPnd+0TX8ZE0ls7GXxyykkYqyP0Iws/vG2bbP3vDzf
	kjEldzxf7n4kQ5iChNrkfmkqqKjar6KfWCjiXwYrymNwfRfwOQ0OE79EJw3RuhvcPXehJrv9Ny8
	lcDD5sEB7YdXRoNW4ZIK96w/GFE6oRm//bs3k=
X-Received: by 2002:a05:6a00:4b16:b0:7e8:3fcb:bc41 with SMTP id d2e1a72fcca58-824877d2b3bmr5546668b3a.22.1770811247596;
        Wed, 11 Feb 2026 04:00:47 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e3669d8sm1805831b3a.2.2026.02.11.04.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 04:00:47 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 3/8] libx86-1: upgrade 1.1 -> 1.1.1
Date: Thu, 12 Feb 2026 01:00:20 +1300
Message-ID: <20260211120025.4190831-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211120025.4190831-1-ankur.tyagi85@gmail.com>
References: <20260211120025.4190831-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Feb 2026 12:00:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124331

From: Gyorgy Sarvari <skandigraun@gmail.com>

Bugfix release, mostly with patches applied from other distros.
Also fixes the SRC_URI which became inaccessible over time.
Drop patches that are included in this release.

Shortlog:
https://gitlab.archlinux.org/grawlinson/libx86/-/compare/v1.1...v1.1.1

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 19fdc49db3a41b1380c387bf9b5dbbf631048a64)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
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
 

