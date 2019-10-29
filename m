Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E336A7FA1F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 18:31:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 472gCJ3B0Zz65
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 19:31:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572373884;
	bh=YZoNUNCJJ48yP3uQE00RWzIBhsO9QLUOp8733XYga34=;
	h=From:To:Subject:Date:From;
	b=mVI+xK3vx2ED/njb3ceVAy1oD/VvYGxOjjYGva0Quu+XEZcNw45AB22/ojwKNyqjB
	nSoP81do3s1KhM0qEfH5P6W9X7WbiTJlBs6vjdsZgS2js0fRlKR04yikVO3gSwpJqV
	Q39MlxsmUpRALgYUoJFJEFpv/IHDeGe0HHVX+haifc9aSqPDHif/+Qf4u3J3244q7+
	X+pkdxoUmtuhrELhnrUT5dj3Ws1aQo857X/0hUfZCBfkIrfrHxtp28L+OkDrGiccLK
	XGWsisxhulaLfcI99YqealQ7VxnNIEQCqqvDfLMhcRrC4BPasUyksA9shCq5td6+Be
	GWVrVT1HlqkK6cM/x9R43TLkNl539S0goc2+JcmKezImAyxpl1N0KEYZVFIm9f/L8N
	uHukINVyaOKFuI2xnGqfsJlvIWfTzmhb2S834JRGF2kuJi8plD7kn1PnVIwtmfKOeJ
	Chwg6vSGtKYJb9xWlS7FZTcBQJEwcrhbvGNWYQG0NYbhScBRqryfFwLS49Yvz4Ve1j
	AXAkp7OsnkObUBR2uwey9RgbvQC89NoL4c7q5t11/ja8UF9/KGsoi+gQbAH71hCA3c
	YHeVsAwaRzbqDHfisdIzR5OeOvno8FbDWclD5j7OpJoqm6p3V+4VDqcztUUaDEp1kt
	Lty9hE+XuRyyHjnjzmcSEtWg=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Oct 2019 20:31:14 +0200
Message-Id: <20191029183123.1868-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] flashrom: Upgrade 1.0 -> 1.1
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
X-List-Received-Date: Tue, 29 Oct 2019 18:31:26 -0000

Patches applied upstream removed.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...pi-Avoid-deprecated-libusb-functions.patch |  39 ----
 ...latform-Add-riscv-to-known-platforms.patch |  37 ----
 .../recipes-bsp/flashrom/flashrom/sst26.patch | 198 ------------------
 meta-oe/recipes-bsp/flashrom/flashrom_1.0.bb  |  20 --
 meta-oe/recipes-bsp/flashrom/flashrom_1.1.bb  |  19 ++
 5 files changed, 19 insertions(+), 294 deletions(-)
 delete mode 100644 meta-oe/recipes-bsp/flashrom/flashrom/0001-ch341a_spi-Avoid-deprecated-libusb-functions.patch
 delete mode 100644 meta-oe/recipes-bsp/flashrom/flashrom/0001-platform-Add-riscv-to-known-platforms.patch
 delete mode 100644 meta-oe/recipes-bsp/flashrom/flashrom/sst26.patch
 delete mode 100644 meta-oe/recipes-bsp/flashrom/flashrom_1.0.bb
 create mode 100644 meta-oe/recipes-bsp/flashrom/flashrom_1.1.bb

diff --git a/meta-oe/recipes-bsp/flashrom/flashrom/0001-ch341a_spi-Avoid-deprecated-libusb-functions.patch b/meta-oe/recipes-bsp/flashrom/flashrom/0001-ch341a_spi-Avoid-deprecated-libusb-functions.patch
deleted file mode 100644
index df8028627..000000000
--- a/meta-oe/recipes-bsp/flashrom/flashrom/0001-ch341a_spi-Avoid-deprecated-libusb-functions.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From e5f68189ab3602b1042cc8423fd6a3a23abd5455 Mon Sep 17 00:00:00 2001
-From: Alex James <theracermaster@gmail.com>
-Date: Sat, 14 Apr 2018 22:59:57 -0500
-Subject: [PATCH] ch341a_spi: Avoid deprecated libusb functions
-
-libusb 1.0.22 marked libusb_set_debug as deprecated. For such versions
-of libusb, use libusb_set_option instead.
-
-Change-Id: Ib71ebe812316eaf49136979a942a946ef9e4d487
-Signed-off-by: Alex James <theracermaster@gmail.com>
-Reviewed-on: https://review.coreboot.org/25681
-Tested-by: Nico Huber <nico.h@gmx.de>
-Reviewed-by: David Hendricks <david.hendricks@gmail.com>
----
-Upstream-Status: Backport
- ch341a_spi.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/ch341a_spi.c b/ch341a_spi.c
-index 6eb2804..d880510 100644
---- a/ch341a_spi.c
-+++ b/ch341a_spi.c
-@@ -444,7 +444,12 @@ int ch341a_spi_init(void)
- 		return -1;
- 	}
- 
--	libusb_set_debug(NULL, 3); // Enable information, warning and error messages (only).
-+	/* Enable information, warning, and error messages (only). */
-+#if LIBUSB_API_VERSION < 0x01000106
-+	libusb_set_debug(NULL, 3);
-+#else
-+	libusb_set_option(NULL, LIBUSB_OPTION_LOG_LEVEL, LIBUSB_LOG_LEVEL_INFO);
-+#endif
- 
- 	uint16_t vid = devs_ch341a_spi[0].vendor_id;
- 	uint16_t pid = devs_ch341a_spi[0].device_id;
--- 
-2.17.0
-
diff --git a/meta-oe/recipes-bsp/flashrom/flashrom/0001-platform-Add-riscv-to-known-platforms.patch b/meta-oe/recipes-bsp/flashrom/flashrom/0001-platform-Add-riscv-to-known-platforms.patch
deleted file mode 100644
index 7ba69a917..000000000
--- a/meta-oe/recipes-bsp/flashrom/flashrom/0001-platform-Add-riscv-to-known-platforms.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From d2a28dcdbd1051d2f48320e2eda3393581fe0519 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 17 Mar 2018 23:08:29 -0700
-Subject: [PATCH] platform: Add riscv to known platforms
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted [https://review.coreboot.org/#/c/flashrom/+/25260/]
- platform.h | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/platform.h b/platform.h
-index b2fdcd0..2cadbb3 100644
---- a/platform.h
-+++ b/platform.h
-@@ -69,6 +69,9 @@
- #elif defined (__m68k__)
- 	#define __FLASHROM_ARCH__ "m68k"
- 	#define IS_M68K 1
-+#elif defined (__riscv)
-+	#define __FLASHROM_ARCH__ "riscv"
-+	#define IS_RISCV 1
- #elif defined (__sh__)
- 	#define __FLASHROM_ARCH__ "sh"
- 	#define IS_SH 1
-@@ -77,7 +80,7 @@
- 	#define IS_S390 1
- #endif
- 
--#if !(IS_X86 || IS_MIPS || IS_PPC || IS_ARM || IS_SPARC || IS_ALPHA || IS_HPPA || IS_M68K || IS_SH || IS_S390)
-+#if !(IS_X86 || IS_MIPS || IS_PPC || IS_ARM || IS_SPARC || IS_ALPHA || IS_HPPA || IS_M68K || IS_RISCV || IS_SH || IS_S390)
- #error Unknown architecture
- #endif
- 
--- 
-2.16.2
-
diff --git a/meta-oe/recipes-bsp/flashrom/flashrom/sst26.patch b/meta-oe/recipes-bsp/flashrom/flashrom/sst26.patch
deleted file mode 100644
index 46a01529f..000000000
--- a/meta-oe/recipes-bsp/flashrom/flashrom/sst26.patch
+++ /dev/null
@@ -1,198 +0,0 @@
---- flashrom-0.9.9.orig/chipdrivers.h
-+++ flashrom-0.9.9/chipdrivers.h
-@@ -103,6 +103,7 @@
- int spi_prettyprint_status_register_sst25(struct flashctx *flash);
- int spi_prettyprint_status_register_sst25vf016(struct flashctx *flash);
- int spi_prettyprint_status_register_sst25vf040b(struct flashctx *flash);
-+int spi_disable_blockprotect_sst26_global_unprotect(struct flashctx *flash);
- 
- /* sfdp.c */
- int probe_spi_sfdp(struct flashctx *flash);
---- flashrom-0.9.9.orig/flashchips.c
-+++ flashrom-0.9.9/flashchips.c
-@@ -12564,6 +12564,120 @@
- 
- 	{
- 		.vendor		= "SST",
-+		.name		= "SST26VF016B(A)",
-+		.bustype	= BUS_SPI,
-+		.manufacture_id	= SST_ID,
-+		.model_id	= SST_SST26VF016B,
-+		.total_size	= 2048,
-+		.page_size	= 256,
-+		.feature_bits	= FEATURE_WRSR_WREN | FEATURE_OTP,
-+		.tested		= TEST_OK_PREW,
-+		.probe		= probe_spi_rdid,
-+		.probe_timing	= TIMING_ZERO,
-+		.block_erasers	=
-+		{
-+			{
-+				.eraseblocks = { {4 * 1024, 512} },
-+				.block_erase = spi_block_erase_20,
-+			}, {
-+				.eraseblocks = {
-+					{8 * 1024, 4},
-+					{32 * 1024, 1},
-+					{64 * 1024, 30},
-+					{32 * 1024, 1},
-+					{8 * 1024, 4},
-+				},
-+				.block_erase = spi_block_erase_d8,
-+			}, {
-+				.eraseblocks = { {2 * 1024 * 1024, 1} },
-+				.block_erase = spi_block_erase_c7,
-+			},
-+		},
-+		.printlock	= spi_prettyprint_status_register_plain, /* TODO: improve */
-+		.unlock		= spi_disable_blockprotect_sst26_global_unprotect,
-+		.write		= spi_chip_write_256, /* Multi I/O supported */
-+		.read		= spi_chip_read, /* Fast read (0x0B) and multi I/O supported */
-+		.voltage	= {2700, 3600},
-+	},
-+	{
-+		.vendor		= "SST",
-+		.name		= "SST26VF032B(A)",
-+		.bustype	= BUS_SPI,
-+		.manufacture_id	= SST_ID,
-+		.model_id	= SST_SST26VF032B,
-+		.total_size	= 4096,
-+		.page_size	= 256,
-+		.feature_bits	= FEATURE_WRSR_WREN | FEATURE_OTP,
-+		.tested		= TEST_UNTESTED,
-+		.probe		= probe_spi_rdid,
-+		.probe_timing	= TIMING_ZERO,
-+		.block_erasers	=
-+		{
-+			{
-+				.eraseblocks = { {4 * 1024, 1024} },
-+				.block_erase = spi_block_erase_20,
-+			}, {
-+				.eraseblocks = {
-+					{8 * 1024, 4},
-+					{32 * 1024, 1},
-+					{64 * 1024, 62},
-+					{32 * 1024, 1},
-+					{8 * 1024, 4},
-+				},
-+				.block_erase = spi_block_erase_d8,
-+			}, {
-+				.eraseblocks = { {4 * 1024 * 1024, 1} },
-+				.block_erase = spi_block_erase_c7,
-+			},
-+		},
-+		.printlock	= spi_prettyprint_status_register_plain, /* TODO: improve */
-+		.unlock		= spi_disable_blockprotect_sst26_global_unprotect,
-+		.write		= spi_chip_write_256, /* Multi I/O supported */
-+		.read		= spi_chip_read, /* Fast read (0x0B) and multi I/O supported */
-+		.voltage	= {2700, 3600},
-+	},
-+
-+
-+	{
-+		.vendor		= "SST",
-+		.name		= "SST26VF064B(A)",
-+		.bustype	= BUS_SPI,
-+		.manufacture_id	= SST_ID,
-+		.model_id	= SST_SST26VF064B,
-+		.total_size	= 8192,
-+		.page_size	= 256,
-+		.feature_bits	= FEATURE_WRSR_WREN | FEATURE_OTP,
-+		.tested		= TEST_OK_PREW,
-+		.probe		= probe_spi_rdid,
-+		.probe_timing	= TIMING_ZERO,
-+		.block_erasers	=
-+		{
-+			{
-+				.eraseblocks = { {4 * 1024, 2048} },
-+				.block_erase = spi_block_erase_20,
-+			}, {
-+				.eraseblocks = {
-+					{8 * 1024, 4},
-+					{32 * 1024, 1},
-+					{64 * 1024, 126},
-+					{32 * 1024, 1},
-+					{8 * 1024, 4},
-+				},
-+				.block_erase = spi_block_erase_d8,
-+			}, {
-+				.eraseblocks = { {8 * 1024 * 1024, 1} },
-+				.block_erase = spi_block_erase_c7,
-+			},
-+		},
-+		.printlock	= spi_prettyprint_status_register_plain, /* TODO: improve */
-+		.unlock		= spi_disable_blockprotect_sst26_global_unprotect,
-+		.write		= spi_chip_write_256, /* Multi I/O supported */
-+		.read		= spi_chip_read, /* Fast read (0x0B) and multi I/O supported */
-+		.voltage	= {2700, 3600},
-+	},
-+
-+	{
-+		.vendor		= "SST",
- 		.name		= "SST25WF512",
- 		.bustype	= BUS_SPI,
- 		.manufacture_id	= SST_ID,
---- flashrom-0.9.9.orig/flashchips.h
-+++ flashrom-0.9.9/flashchips.h
-@@ -697,6 +697,8 @@
- #define SST_SST25VF064C		0x254B
- #define SST_SST26VF016		0x2601
- #define SST_SST26VF032		0x2602
-+#define SST_SST26VF016B		0x2641
-+#define SST_SST26VF032B		0x2642
- #define SST_SST26VF064B		0x2643
- #define SST_SST27SF512		0xA4
- #define SST_SST27SF010		0xA5
---- flashrom-0.9.9.orig/linux_spi.c
-+++ flashrom-0.9.9/linux_spi.c
-@@ -141,6 +141,16 @@
- 	return 0;
- }
- 
-+static void print_hex(const char *msg, const void *buf, size_t len)
-+{
-+        size_t i;
-+	msg_pspew("%s:\n", msg);
-+        for (i = 0; i < len; i++) {
-+                msg_pspew(" %02x", ((uint8_t *)buf)[i]);
-+        }
-+        msg_pspew("\n");
-+}
-+
- static int linux_spi_send_command(struct flashctx *flash, unsigned int writecnt,
- 				  unsigned int readcnt,
- 				  const unsigned char *txbuf,
-@@ -172,10 +182,12 @@
- 	else
- 		iocontrol_code = SPI_IOC_MESSAGE(2);
- 
-+	print_hex("Write", txbuf, writecnt);
- 	if (ioctl(fd, iocontrol_code, msg) == -1) {
- 		msg_cerr("%s: ioctl: %s\n", __func__, strerror(errno));
- 		return -1;
- 	}
-+	if (readcnt) print_hex("Got", rxbuf, readcnt);
- 	return 0;
- }
- 
---- flashrom-0.9.9.orig/spi25_statusreg.c
-+++ flashrom-0.9.9/spi25_statusreg.c
-@@ -196,6 +196,19 @@
- 	return spi_disable_blockprotect_generic(flash, 0x3C, 0, 0, 0xFF);
- }
- 
-+int spi_disable_blockprotect_sst26_global_unprotect(struct flashctx *flash)
-+{
-+	int result = spi_write_enable(flash);
-+	if (result)
-+		return result;
-+
-+	static const unsigned char cmd[] = { 0x98 }; /* ULBPR */
-+	result = spi_send_command(flash, sizeof(cmd), 0, cmd, NULL);
-+	if (result)
-+		msg_cerr("ULBPR failed\n");
-+	return result;
-+}
-+
- /* A common block protection disable that tries to unset the status register bits masked by 0x0C (BP0-1) and
-  * protected/locked by bit #7. Useful when bits 4-5 may be non-0). */
- int spi_disable_blockprotect_bp1_srwd(struct flashctx *flash)
diff --git a/meta-oe/recipes-bsp/flashrom/flashrom_1.0.bb b/meta-oe/recipes-bsp/flashrom/flashrom_1.0.bb
deleted file mode 100644
index 1c1724668..000000000
--- a/meta-oe/recipes-bsp/flashrom/flashrom_1.0.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "flashrom is a utility for identifying, reading, writing, verifying and erasing flash chips"
-LICENSE = "GPLv2"
-HOMEPAGE = "http://flashrom.org"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-DEPENDS = "pciutils libusb libusb-compat"
-
-SRC_URI = "https://download.flashrom.org/releases/flashrom-${PV}.tar.bz2 \
-           file://sst26.patch \
-           file://0001-platform-Add-riscv-to-known-platforms.patch \
-           file://0001-ch341a_spi-Avoid-deprecated-libusb-functions.patch \
-           "
-SRC_URI[md5sum] = "42d999990c735d88653627cefcc13b9a"
-SRC_URI[sha256sum] = "3702fa215ba5fb5af8e54c852d239899cfa1389194c1e51cb2a170c4dc9dee64"
-
-inherit pkgconfig
-
-do_install() {
-    oe_runmake PREFIX=${prefix} DESTDIR=${D} install
-}
diff --git a/meta-oe/recipes-bsp/flashrom/flashrom_1.1.bb b/meta-oe/recipes-bsp/flashrom/flashrom_1.1.bb
new file mode 100644
index 000000000..074a1a5f6
--- /dev/null
+++ b/meta-oe/recipes-bsp/flashrom/flashrom_1.1.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "flashrom is a utility for identifying, reading, writing, verifying and erasing flash chips"
+LICENSE = "GPLv2"
+HOMEPAGE = "http://flashrom.org"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+DEPENDS = "pciutils libusb libusb-compat"
+
+SRC_URI = "https://download.flashrom.org/releases/flashrom-v${PV}.tar.bz2 \
+           "
+SRC_URI[md5sum] = "91bab6c072e38a493bb4eb673e4fe0d6"
+SRC_URI[sha256sum] = "aeada9c70c22421217c669356180c0deddd0b60876e63d2224e3260b90c14e19"
+
+S = "${WORKDIR}/flashrom-v${PV}"
+
+inherit pkgconfig
+
+do_install() {
+    oe_runmake PREFIX=${prefix} DESTDIR=${D} install
+}
-- 
2.17.1


