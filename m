Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id B6DBF7E26A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 17:46:58 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id h17so8959374pgv.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 10:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=b4kIzErRQ/5ht8X+Vor7hP9M+nMRQpG6lXL5HYMoIEg=;
	b=ICUXnbKcTvbMUjFzFbeV7RAYzN8aY35eAlQ4By/N36kQn6L2JcEGYTR8f2kfx/YPkw
	AHmZ/NIokrBsc7p5X4jPScbUkLaXaj/qAMfGiZQhaDzJAMbFkLdpnTmKrureD8GwOEyI
	ewm2S7PRXQXbCiAxBznWyBDK56uYEvtBT19NbiK0e+EvAjnSv+9nq39yxN/Q21UDUcQh
	aRCnAHwAf3V/zABG8Wnqo5STECzJwqHxsaTstFEEeoufljHZUsjzS94eekcmhYJnaUYh
	iqbsE+AdKjRX4UqMKvm1TU1yHVlKri8F4OJRjInBu0eKtKwbvx1j5+deeFywLgfEjmR6
	6J8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=b4kIzErRQ/5ht8X+Vor7hP9M+nMRQpG6lXL5HYMoIEg=;
	b=LHYEIAm+sUv63ri4x/brTSdiC8LoBEWrajKokRsQ/LuaQ6gDtFUS+m9X8tRJz1lTKJ
	UqGUdWLKmo8upBO+ETUlnWSKqYfREHt+IfHjBkIyDFp1VGXGrd30omfA9MrYeigQBKq5
	XNTFNSFOFaA11GM1x1iuUJL1MMiZsoF7Ki//+LOrnptIeeimfZ4JNWKDZveNvS5Df+VZ
	dWBDeBY6t9MTGvPMMs1ibpRq3rA2QtxSY3vIerszk/56/UB+sPDvYkwnrMAClcPlwmaK
	cAYXLf629iLjamxHENM6KUGeRbPLdFSUemdOzQlnzXektSzBA/E8MrvqTqnfmAVoWjGU
	T0Lw==
X-Gm-Message-State: APjAAAX3rcvaMvNdilvgbgKdrpArr7G8EVwLCCNs6rUf9FpD39g6Pnx/
	H8vuMfYUmN9mgb4WFS4qfGy5fDKowqw=
X-Google-Smtp-Source: APXvYqxxYUC3JJZ5Am54RkvgcGbW7fecDAQr1J+i2bLWX5fhS53n+Y0KiVqbsG1gbmgZw2NNjJSx7w==
X-Received: by 2002:a63:fa16:: with SMTP id y22mr44353755pgh.15.1558460819123; 
	Tue, 21 May 2019 10:46:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::3506])
	by smtp.gmail.com with ESMTPSA id
	p14sm29175324pfa.112.2019.05.21.10.46.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 May 2019 10:46:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 May 2019 10:46:52 -0700
Message-Id: <20190521174652.9572-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH V2] openocd: Fix build on x86_64
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
X-List-Received-Date: Tue, 21 May 2019 17:46:58 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Avoid conflict by renaming

 ...-Rename-PAGE_SIZE-to-FLASH_PAGE_SIZE.patch | 59 +++++++++++++++++++
 .../recipes-devtools/openocd/openocd_git.bb   |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/openocd/openocd/0001-esirisc_flash-Rename-PAGE_SIZE-to-FLASH_PAGE_SIZE.patch

diff --git a/meta-oe/recipes-devtools/openocd/openocd/0001-esirisc_flash-Rename-PAGE_SIZE-to-FLASH_PAGE_SIZE.patch b/meta-oe/recipes-devtools/openocd/openocd/0001-esirisc_flash-Rename-PAGE_SIZE-to-FLASH_PAGE_SIZE.patch
new file mode 100644
index 0000000000..c80d9f19f8
--- /dev/null
+++ b/meta-oe/recipes-devtools/openocd/openocd/0001-esirisc_flash-Rename-PAGE_SIZE-to-FLASH_PAGE_SIZE.patch
@@ -0,0 +1,59 @@
+From bee22f143ffa0457aefcf31053f76416e6d242e5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 20 May 2019 23:24:26 -0700
+Subject: [PATCH] esirisc_flash: Rename PAGE_SIZE to FLASH_PAGE_SIZE
+
+PAGE_SIZE is defined in system includes on some systems, this would
+avoid the unintended conflict
+
+Fixes
+| src/flash/nor/esirisc_flash.c:95:9: error: 'PAGE_SIZE' macro redefined [-Werror,-Wmacro-redefined]
+| #define PAGE_SIZE                       4096
+|         ^
+| /mnt/a/yoe/build/tmp/work/core2-64-yoe-linux-musl/openocd/0.10+gitrAUTOINC+7ee618692f-r0/recipe-sysroot/usr/inclu
+de/limits.h:89:9: note: previous definition is here
+| #define PAGE_SIZE PAGESIZE
+
+Upstream-Status: Submitted [http://openocd.zylin.com/#/c/5180/2]
+Change-Id: I195b303fc88a7c848ca4e55fd6ba893796df55cc
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/flash/nor/esirisc_flash.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/flash/nor/esirisc_flash.c b/src/flash/nor/esirisc_flash.c
+index 4e33b942..3bed0658 100644
+--- a/src/flash/nor/esirisc_flash.c
++++ b/src/flash/nor/esirisc_flash.c
+@@ -92,7 +92,7 @@
+ #endif
+ 
+ #define CONTROL_TIMEOUT		5000		/* 5s    */
+-#define PAGE_SIZE			4096
++#define FLASH_PAGE_SIZE		4096
+ #define PB_MAX				32
+ 
+ #define NUM_NS_PER_S		1000000000ULL
+@@ -264,7 +264,7 @@ static int esirisc_flash_erase(struct flash_bank *bank, int first, int last)
+ 	(void)esirisc_flash_disable_protect(bank);
+ 
+ 	for (int page = first; page < last; ++page) {
+-		uint32_t address = page * PAGE_SIZE;
++		uint32_t address = page * FLASH_PAGE_SIZE;
+ 
+ 		target_write_u32(target, esirisc_info->cfg + ADDRESS, address);
+ 
+@@ -464,8 +464,8 @@ static int esirisc_flash_probe(struct flash_bank *bank)
+ 	if (target->state != TARGET_HALTED)
+ 		return ERROR_TARGET_NOT_HALTED;
+ 
+-	bank->num_sectors = bank->size / PAGE_SIZE;
+-	bank->sectors = alloc_block_array(0, PAGE_SIZE, bank->num_sectors);
++	bank->num_sectors = bank->size / FLASH_PAGE_SIZE;
++	bank->sectors = alloc_block_array(0, FLASH_PAGE_SIZE, bank->num_sectors);
+ 
+ 	retval = esirisc_flash_init(bank);
+ 	if (retval != ERROR_OK) {
+-- 
+2.21.0
+
diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index 9a8a09a913..b50c3acf4c 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -9,6 +9,7 @@ SRC_URI = " \
     git://repo.or.cz/r/git2cl.git;protocol=http;destsuffix=tools/git2cl;name=git2cl \
     git://repo.or.cz/r/jimtcl.git;protocol=http;destsuffix=git/jimtcl;name=jimtcl \
     git://repo.or.cz/r/libjaylink.git;protocol=http;destsuffix=git/src/jtag/drivers/libjaylink;name=libjaylink \
+    file://0001-esirisc_flash-Rename-PAGE_SIZE-to-FLASH_PAGE_SIZE.patch \
 "
 
 SRCREV_FORMAT = "openocd"
-- 
2.21.0


