Return-Path: <prvs=207c28696=alistair.francis@wdc.com>
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	by mail.openembedded.org (Postfix) with ESMTP id B69AC7F37D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2019 00:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1573088119; x=1604624119;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=WklrfMv7Hc9KViJRzxo6xoS4T6KwHO7oD9UxrPOwZc4=;
	b=SrDr8ShlqtWFSU9ZhREebE94AHW7TQH0YhTPCYA5+GMYK1udo25vvxiu
	k/g7w3zqLrUoOs3DfuVBf+SnjsLG+r9kudSjlCy19dcmSZ3yOgMmmC6B9
	XhhX8tOgIetwmlmOvzNkshaLATdaxPWqdyyQLptWePNFNMFcGHwVcUDc0
	qWlllaJW0hr0WG9XtEzPjtRGJLp/ZohfKcLx0i0iAfw9XeCPmpGSt0hTr
	7t+JwBNA7nbeSkQn2y+VOfQ7HHRF2U2NTFf8LPETYjUyCtPBNyQR4HyK6
	o/58oAkxW0m8g/5PH6BF2+gQBCc7mfeJ8QkRapZfgPCeuclhpwHPMmtRj w==;
IronPort-SDR: BBShHm0Fh74UgJ8eyOEt78yu3b9Nn47rxrJM2eQQ2BZIvsGUMyOMpLrdybdG27SpONCq9/hbBS
	yVtHXN3zJyqVsHPVjDQQZFEsr5CQid/vQ7yhuYFsiYNoxs9EoXplvG5+DDUNiD23qp4hLj+mtd
	LLZNE0+2pxMF6+4Ujs/F89Dqm0p0NrEJtBMY0Hsc/a9LD4FK98P0hT5s/ar7wAedVqei3U10H5
	7p3e+dCUOzCstjmFR7B+8gSBYWQxo9fzRAFwut9uTzKV6jqz/3zM0tfuPc6mTrgn3gkbVhlTLQ
	xCg=
X-IronPort-AV: E=Sophos;i="5.68,276,1569254400"; d="scan'208";a="229571642"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 07 Nov 2019 08:55:18 +0800
IronPort-SDR: vDbDTiGyXo+H++QAufWbPFeGo7fsbQhj+2tiketvYetrBIsf4bh7FNj9Feo7DXOr1lMy3Vgoxp
	rfLsbzpsFEJbV2Xj2OKFydLUeAB3dYHAOd0TGP9xgFQuFvbEMh3cfZWru4xwqEethtAQD7p9Z0
	MaRLK5z3Mkl/5FfDxuMiXY8hZPp3RrKs1lm/Qv1tghYy28qvRnlPIovhlw8GtWQV20NiCYscRk
	iRa6teRiYMmjTjvzTGNZhjgzcMaq6qHPGAPFpMA/pRtyjbfcmvreHsb44XoTqkL+wqzQ7lswty
	GONJXvuZTBocGWBQHRsR/dUI
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	06 Nov 2019 16:50:29 -0800
IronPort-SDR: pl2r1H1W1YtgV3yPdALBzYJG/BjXBamsW7iQ5OLukxZpVMzIWmvjg3o5CzsMdemulBQGRVqIG6
	q9R6gbxzTnOpb2ct4m5PflmPYszf0OqNUmWbMbllRXc2XlGeqS3wTk0ZlIXwJipBUJSF8Du/Jq
	FsC/EOfM0r9WomSsA21TEVoF21da6jwQWktslkajaADDLlBlnlYZpja5C1Fhonm7gceZcODmbW
	h7/cv2JKKdIMlzTxVDKruzH9hll2bl0lMYua/EpkYz8/j1Jw0lR/Up4QWwJXedGtD8z4MGOhDO
	fi8=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 06 Nov 2019 16:55:18 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Nov 2019 16:49:59 -0800
Message-Id: <20191107004959.17764-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] openocd: Update to latest git version
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
X-List-Received-Date: Thu, 07 Nov 2019 00:55:18 -0000
Content-Transfer-Encoding: 8bit

Update to the latest git version and allow native builds.

The 0001-esirisc_flash-Rename-PAGE_SIZE-to-FLASH_PAGE_SIZE.patch has
been merged into master, so we can remove it.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 ...-Rename-PAGE_SIZE-to-FLASH_PAGE_SIZE.patch | 59 -------------------
 .../recipes-devtools/openocd/openocd_git.bb   |  9 ++-
 2 files changed, 4 insertions(+), 64 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/openocd/openocd/0001-esirisc_flash-Rename-PAGE_SIZE-to-FLASH_PAGE_SIZE.patch

diff --git a/meta-oe/recipes-devtools/openocd/openocd/0001-esirisc_flash-Rename-PAGE_SIZE-to-FLASH_PAGE_SIZE.patch b/meta-oe/recipes-devtools/openocd/openocd/0001-esirisc_flash-Rename-PAGE_SIZE-to-FLASH_PAGE_SIZE.patch
deleted file mode 100644
index c80d9f19f..000000000
--- a/meta-oe/recipes-devtools/openocd/openocd/0001-esirisc_flash-Rename-PAGE_SIZE-to-FLASH_PAGE_SIZE.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From bee22f143ffa0457aefcf31053f76416e6d242e5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 20 May 2019 23:24:26 -0700
-Subject: [PATCH] esirisc_flash: Rename PAGE_SIZE to FLASH_PAGE_SIZE
-
-PAGE_SIZE is defined in system includes on some systems, this would
-avoid the unintended conflict
-
-Fixes
-| src/flash/nor/esirisc_flash.c:95:9: error: 'PAGE_SIZE' macro redefined [-Werror,-Wmacro-redefined]
-| #define PAGE_SIZE                       4096
-|         ^
-| /mnt/a/yoe/build/tmp/work/core2-64-yoe-linux-musl/openocd/0.10+gitrAUTOINC+7ee618692f-r0/recipe-sysroot/usr/inclu
-de/limits.h:89:9: note: previous definition is here
-| #define PAGE_SIZE PAGESIZE
-
-Upstream-Status: Submitted [http://openocd.zylin.com/#/c/5180/2]
-Change-Id: I195b303fc88a7c848ca4e55fd6ba893796df55cc
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/flash/nor/esirisc_flash.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/flash/nor/esirisc_flash.c b/src/flash/nor/esirisc_flash.c
-index 4e33b942..3bed0658 100644
---- a/src/flash/nor/esirisc_flash.c
-+++ b/src/flash/nor/esirisc_flash.c
-@@ -92,7 +92,7 @@
- #endif
- 
- #define CONTROL_TIMEOUT		5000		/* 5s    */
--#define PAGE_SIZE			4096
-+#define FLASH_PAGE_SIZE		4096
- #define PB_MAX				32
- 
- #define NUM_NS_PER_S		1000000000ULL
-@@ -264,7 +264,7 @@ static int esirisc_flash_erase(struct flash_bank *bank, int first, int last)
- 	(void)esirisc_flash_disable_protect(bank);
- 
- 	for (int page = first; page < last; ++page) {
--		uint32_t address = page * PAGE_SIZE;
-+		uint32_t address = page * FLASH_PAGE_SIZE;
- 
- 		target_write_u32(target, esirisc_info->cfg + ADDRESS, address);
- 
-@@ -464,8 +464,8 @@ static int esirisc_flash_probe(struct flash_bank *bank)
- 	if (target->state != TARGET_HALTED)
- 		return ERROR_TARGET_NOT_HALTED;
- 
--	bank->num_sectors = bank->size / PAGE_SIZE;
--	bank->sectors = alloc_block_array(0, PAGE_SIZE, bank->num_sectors);
-+	bank->num_sectors = bank->size / FLASH_PAGE_SIZE;
-+	bank->sectors = alloc_block_array(0, FLASH_PAGE_SIZE, bank->num_sectors);
- 
- 	retval = esirisc_flash_init(bank);
- 	if (retval != ERROR_OK) {
--- 
-2.21.0
-
diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index 241b4baa3..9ec77fdc4 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -9,22 +9,21 @@ SRC_URI = " \
     git://repo.or.cz/r/git2cl.git;protocol=http;destsuffix=tools/git2cl;name=git2cl \
     git://repo.or.cz/r/jimtcl.git;protocol=http;destsuffix=git/jimtcl;name=jimtcl \
     git://repo.or.cz/r/libjaylink.git;protocol=http;destsuffix=git/src/jtag/drivers/libjaylink;name=libjaylink \
-    file://0001-esirisc_flash-Rename-PAGE_SIZE-to-FLASH_PAGE_SIZE.patch \
     file://0001-Do-not-include-syscrtl.h-with-glibc.patch \
 "
 
 SRCREV_FORMAT = "openocd"
-SRCREV_openocd = "7ee618692f56b0efea864890da45d73d28e393d9"
+SRCREV_openocd = "ded67990255cc1e63c77832ffd6e6bef9120873d"
 SRCREV_git2cl = "8373c9f74993e218a08819cbcdbab3f3564bbeba"
-SRCREV_jimtcl = "a9bf5975fd0f89974d689a2d9ebd0873c8d64787"
-SRCREV_libjaylink = "8645845c1abebd004e991ba9a7f808f4fd0c608b"
+SRCREV_jimtcl = "dc4ba7770d580800634f90b67a24e077b4a26d98"
+SRCREV_libjaylink = "cfccbc9d6763733f1d14dff3c2dc5b75aaef136b"
 
 PV = "0.10+gitr${SRCPV}"
 S = "${WORKDIR}/git"
 
 inherit pkgconfig autotools-brokensep gettext
 
-BBCLASSEXTEND += "nativesdk"
+BBCLASSEXTEND += "native nativesdk"
 
 EXTRA_OECONF = "--enable-ftdi --disable-doxygen-html --disable-werror"
 
-- 
2.23.0


