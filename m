Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id BD620782F1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jul 2017 15:41:46 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id e199so306733pfh.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jul 2017 08:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cqVcgl4tPJwIdZj4gUzsR4SmHJAPZa0SnbdC4V2l2CA=;
	b=J4f/aFkHD5vE6aZE0dWUdJ30KgveM1WQA0GOBUFCTTmITOZDy1by9n71DYaIadequY
	P0NA0B8Wz/6xiTGnWNb1DD2EhoaDmWRMdfus5KV/OwDENmEJ8tjFAIC5fF1CIooqa+Sc
	FS7l25FAsVrs4EId1CkQPRDa3dw8oROlIjF6MLCRAPCpLxzCD7UAaybeWKxIlCZD2y9U
	nstzUPJ1Tp4zyYuCU1hJ8NH+TCPzl6LBUkCzCJMyzDusTbZT3hlg9vSogGUwJPEzEtLN
	BTlk1Pmu5tLwR554L6jPBHH04DsHhg9pZxm2J1waxKr4/k4Umj76srp74NBNCthXvjxB
	jCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cqVcgl4tPJwIdZj4gUzsR4SmHJAPZa0SnbdC4V2l2CA=;
	b=J/OW/iAzzBgsG4AIyLr5X6npnevy2pLWEdvLWbXaZD3yKZxgeYediYBeOy64pNTgAv
	jzwkWKAdPbxpJLCqSVx6/OTaaD/dIaE6rZRHLYSrJww6hIbRScoHtYxWLkQeQXjZWQah
	1kCyloFtv+EwaDSuCPOoazV4mj7KToPIFvVbB06k9t0/v0zk6VVLQskh+Spo3xnQRsHX
	o3E8i7+S+N1QjgyOZ54bolcjxOQ9lEujargxDMG+Ehwu4XHHAp/46AXP0nui34RCCL4B
	WkK8JbcuButVuaQW/pi42UumKF8WU8jT60504aD2mZrrbFDKQGXK/JgX1dIHHRyp12iI
	rnaA==
X-Gm-Message-State: AIVw113aIPUrVYcbqvic5ciEQqsoTdTuEjV3HD2FYIizYYqQ/UTaP8eK
	WCeG2XNDTChiiUir
X-Received: by 10.99.119.130 with SMTP id s124mr478189pgc.371.1500478907512;
	Wed, 19 Jul 2017 08:41:47 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	b85sm494845pfe.94.2017.07.19.08.41.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Jul 2017 08:41:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jul 2017 08:41:30 -0700
Message-Id: <20170719154132.20556-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170719154132.20556-1-raj.khem@gmail.com>
References: <20170719154132.20556-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/4] flashrom: Upgrade to 0.9.9
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
X-List-Received-Date: Wed, 19 Jul 2017 15:41:47 -0000

Fix build with musl along way

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../flashrom/0001-Fix-compilation-on-aarch64.patch |  62 -------
 .../0001-ichspi.c-Fix-build-with-clang.patch       |  29 ---
 ...fine-_XOPEN_SOURCE-to-enable-ffs-libc-API.patch |  28 +++
 ...utological-pointer-compare-when-using-cla.patch |  35 ----
 .../0003-remove-duplicate-const-qualifiers.patch   |  71 --------
 .../recipes-extended/flashrom/flashrom/sst26.patch | 198 +++++++++++++++++++++
 .../recipes-extended/flashrom/flashrom_0.9.6.1.bb  |  22 ---
 .../recipes-extended/flashrom/flashrom_0.9.9.bb    |  19 ++
 8 files changed, 245 insertions(+), 219 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/flashrom/flashrom/0001-Fix-compilation-on-aarch64.patch
 delete mode 100644 meta-oe/recipes-extended/flashrom/flashrom/0001-ichspi.c-Fix-build-with-clang.patch
 create mode 100644 meta-oe/recipes-extended/flashrom/flashrom/0001-spi-Define-_XOPEN_SOURCE-to-enable-ffs-libc-API.patch
 delete mode 100644 meta-oe/recipes-extended/flashrom/flashrom/0002-Disable-Wtautological-pointer-compare-when-using-cla.patch
 delete mode 100644 meta-oe/recipes-extended/flashrom/flashrom/0003-remove-duplicate-const-qualifiers.patch
 create mode 100644 meta-oe/recipes-extended/flashrom/flashrom/sst26.patch
 delete mode 100644 meta-oe/recipes-extended/flashrom/flashrom_0.9.6.1.bb
 create mode 100644 meta-oe/recipes-extended/flashrom/flashrom_0.9.9.bb

diff --git a/meta-oe/recipes-extended/flashrom/flashrom/0001-Fix-compilation-on-aarch64.patch b/meta-oe/recipes-extended/flashrom/flashrom/0001-Fix-compilation-on-aarch64.patch
deleted file mode 100644
index 6c2f64ed9..000000000
--- a/meta-oe/recipes-extended/flashrom/flashrom/0001-Fix-compilation-on-aarch64.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From d9e4dc750dc45e42b482d744829254a3672c11b3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 19 Oct 2016 00:24:08 +0000
-Subject: [PATCH 1/3] Fix compilation on aarch64
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- arch.h     | 2 +-
- hwaccess.c | 2 +-
- hwaccess.h | 6 +++---
- 3 files changed, 5 insertions(+), 5 deletions(-)
-
-Index: flashrom-0.9.6.1/arch.h
-===================================================================
---- flashrom-0.9.6.1.orig/arch.h
-+++ flashrom-0.9.6.1/arch.h
-@@ -27,7 +27,7 @@
- #define __FLASHROM_ARCH__ "mips"
- #elif defined(__powerpc__) || defined(__powerpc64__) || defined(__ppc__) || defined(__ppc64__)
- #define __FLASHROM_ARCH__ "ppc"
--#elif defined(__arm__)
-+#elif defined(__arm__) || defined(__aarch64__)
- #define __FLASHROM_ARCH__ "arm"
- #endif
- __FLASHROM_ARCH__
-Index: flashrom-0.9.6.1/hwaccess.c
-===================================================================
---- flashrom-0.9.6.1.orig/hwaccess.c
-+++ flashrom-0.9.6.1/hwaccess.c
-@@ -121,7 +121,7 @@ int rget_io_perms(void)
- 	return 0;
- }
- 
--#elif defined (__arm__)
-+#elif defined (__arm__) || defined (__aarch64__)
- 
- static inline void sync_primitive(void)
- {
-Index: flashrom-0.9.6.1/hwaccess.h
-===================================================================
---- flashrom-0.9.6.1.orig/hwaccess.h
-+++ flashrom-0.9.6.1/hwaccess.h
-@@ -68,8 +68,8 @@
- #error Little-endian PowerPC #defines are unknown
- #endif
- 
--#elif defined (__arm__)
--#if defined (__ARMEL__)
-+#elif defined (__arm__) || defined (__aarch64__)
-+#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
- #define __FLASHROM_LITTLE_ENDIAN__ 1
- #else
- #error Big-endian ARM #defines are unknown
-@@ -337,7 +337,7 @@ int libpayload_wrmsr(int addr, msr_t msr
- 
- /* PCI port I/O is not yet implemented on MIPS. */
- 
--#elif defined(__arm__)
-+#elif defined(__arm__) || defined (__aarch64__)
- 
- /* Non memory mapped I/O is not supported on ARM. */
- 
diff --git a/meta-oe/recipes-extended/flashrom/flashrom/0001-ichspi.c-Fix-build-with-clang.patch b/meta-oe/recipes-extended/flashrom/flashrom/0001-ichspi.c-Fix-build-with-clang.patch
deleted file mode 100644
index ff16f0b11..000000000
--- a/meta-oe/recipes-extended/flashrom/flashrom/0001-ichspi.c-Fix-build-with-clang.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From a2f603c54013cd0b04bb0103dc615644f315d5e8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 15 Nov 2016 17:39:24 +0000
-Subject: [PATCH] ichspi.c: Fix build with clang
-
-ichspi.c:1130:24: error: duplicate 'const' declaration specifier [-Werror,-Wduplicate-decl-specifier]
-        static const uint32_t const dec_berase[4] = {
-                              ^
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- ichspi.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ichspi.c b/ichspi.c
-index 0223ae3..e47aebd 100644
---- a/ichspi.c
-+++ b/ichspi.c
-@@ -1127,7 +1127,7 @@ static void ich_hwseq_set_addr(uint32_t addr)
- static uint32_t ich_hwseq_get_erase_block_size(unsigned int addr)
- {
- 	uint8_t enc_berase;
--	static const uint32_t const dec_berase[4] = {
-+	static const uint32_t dec_berase[4] = {
- 		256,
- 		4 * 1024,
- 		8 * 1024,
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-extended/flashrom/flashrom/0001-spi-Define-_XOPEN_SOURCE-to-enable-ffs-libc-API.patch b/meta-oe/recipes-extended/flashrom/flashrom/0001-spi-Define-_XOPEN_SOURCE-to-enable-ffs-libc-API.patch
new file mode 100644
index 000000000..4170fefd2
--- /dev/null
+++ b/meta-oe/recipes-extended/flashrom/flashrom/0001-spi-Define-_XOPEN_SOURCE-to-enable-ffs-libc-API.patch
@@ -0,0 +1,28 @@
+From 7c65a465a3ddeb7afb9a7c49d010ae7e5d5b1ad1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 18 Jul 2017 20:25:49 -0700
+Subject: [PATCH] spi: Define _XOPEN_SOURCE to enable ffs() libc API
+
+musl exposes this issue
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ spi.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/spi.c b/spi.c
+index 894f73f..aeb6518 100644
+--- a/spi.c
++++ b/spi.c
+@@ -21,7 +21,7 @@
+ /*
+  * Contains the generic SPI framework
+  */
+-
++#define _XOPEN_SOURCE
+ #include <strings.h>
+ #include <string.h>
+ #include "flash.h"
+-- 
+2.13.3
+
diff --git a/meta-oe/recipes-extended/flashrom/flashrom/0002-Disable-Wtautological-pointer-compare-when-using-cla.patch b/meta-oe/recipes-extended/flashrom/flashrom/0002-Disable-Wtautological-pointer-compare-when-using-cla.patch
deleted file mode 100644
index aec11bffa..000000000
--- a/meta-oe/recipes-extended/flashrom/flashrom/0002-Disable-Wtautological-pointer-compare-when-using-cla.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 9be0d152dfe8ac0f9b665d61aeb3f99dae533e0f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 19 Oct 2016 00:25:09 +0000
-Subject: [PATCH 2/3] Disable Wtautological-pointer-compare when using clang
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- flashrom.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/flashrom.c b/flashrom.c
-index 04e9934..bf49104 100644
---- a/flashrom.c
-+++ b/flashrom.c
-@@ -1569,6 +1569,9 @@ int selfcheck(void)
- 	 * For 'flashchips' we check the first element to be non-null. In the
- 	 * other cases there exist use cases where the first element can be
- 	 * null. */
-+#pragma clang diagnostic push
-+#pragma clang diagnostic ignored "-Wtautological-pointer-compare"
-+
- 	if (flashchips == NULL || flashchips[0].vendor == NULL) {
- 		msg_gerr("Flashchips table miscompilation!\n");
- 		ret = 1;
-@@ -1602,6 +1605,7 @@ int selfcheck(void)
- 		msg_gerr("Known laptops table does not exist!\n");
- 		ret = 1;
- 	}
-+#pragma clang diagnostic pop
- #endif
- 	return ret;
- }
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-extended/flashrom/flashrom/0003-remove-duplicate-const-qualifiers.patch b/meta-oe/recipes-extended/flashrom/flashrom/0003-remove-duplicate-const-qualifiers.patch
deleted file mode 100644
index 99283d37f..000000000
--- a/meta-oe/recipes-extended/flashrom/flashrom/0003-remove-duplicate-const-qualifiers.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 42ec9bd51e60aa38fe6e78f644e742d6989b6683 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 19 Oct 2016 00:25:23 +0000
-Subject: [PATCH 3/3] remove duplicate const qualifiers
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- bitbang_spi.c  | 12 ++++++------
- dummyflasher.c |  2 +-
- 2 files changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/bitbang_spi.c b/bitbang_spi.c
-index 11d2de1..508cf45 100644
---- a/bitbang_spi.c
-+++ b/bitbang_spi.c
-@@ -26,33 +26,33 @@
- #include "spi.h"
- 
- /* Note that CS# is active low, so val=0 means the chip is active. */
--static void bitbang_spi_set_cs(const const struct bitbang_spi_master *master, int val)
-+static void bitbang_spi_set_cs(const struct bitbang_spi_master *master, int val)
- {
- 	master->set_cs(val);
- }
- 
--static void bitbang_spi_set_sck(const const struct bitbang_spi_master *master, int val)
-+static void bitbang_spi_set_sck(const struct bitbang_spi_master *master, int val)
- {
- 	master->set_sck(val);
- }
- 
--static void bitbang_spi_set_mosi(const const struct bitbang_spi_master *master, int val)
-+static void bitbang_spi_set_mosi(const struct bitbang_spi_master *master, int val)
- {
- 	master->set_mosi(val);
- }
- 
--static int bitbang_spi_get_miso(const const struct bitbang_spi_master *master)
-+static int bitbang_spi_get_miso(const struct bitbang_spi_master *master)
- {
- 	return master->get_miso();
- }
- 
--static void bitbang_spi_request_bus(const const struct bitbang_spi_master *master)
-+static void bitbang_spi_request_bus(const struct bitbang_spi_master *master)
- {
- 	if (master->request_bus)
- 		master->request_bus();
- }
- 
--static void bitbang_spi_release_bus(const const struct bitbang_spi_master *master)
-+static void bitbang_spi_release_bus(const struct bitbang_spi_master *master)
- {
- 	if (master->release_bus)
- 		master->release_bus();
-diff --git a/dummyflasher.c b/dummyflasher.c
-index 66d0df0..d0de41c 100644
---- a/dummyflasher.c
-+++ b/dummyflasher.c
-@@ -66,7 +66,7 @@ int spi_ignorelist_size = 0;
- static uint8_t emu_status = 0;
- 
- /* A legit complete SFDP table based on the MX25L6436E (rev. 1.8) datasheet. */
--static const uint8_t const sfdp_table[] = {
-+static const uint8_t sfdp_table[] = {
- 	0x53, 0x46, 0x44, 0x50, // @0x00: SFDP signature
- 	0x00, 0x01, 0x01, 0xFF, // @0x04: revision 1.0, 2 headers
- 	0x00, 0x00, 0x01, 0x09, // @0x08: JEDEC SFDP header rev. 1.0, 9 DW long
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-extended/flashrom/flashrom/sst26.patch b/meta-oe/recipes-extended/flashrom/flashrom/sst26.patch
new file mode 100644
index 000000000..46a01529f
--- /dev/null
+++ b/meta-oe/recipes-extended/flashrom/flashrom/sst26.patch
@@ -0,0 +1,198 @@
+--- flashrom-0.9.9.orig/chipdrivers.h
++++ flashrom-0.9.9/chipdrivers.h
+@@ -103,6 +103,7 @@
+ int spi_prettyprint_status_register_sst25(struct flashctx *flash);
+ int spi_prettyprint_status_register_sst25vf016(struct flashctx *flash);
+ int spi_prettyprint_status_register_sst25vf040b(struct flashctx *flash);
++int spi_disable_blockprotect_sst26_global_unprotect(struct flashctx *flash);
+ 
+ /* sfdp.c */
+ int probe_spi_sfdp(struct flashctx *flash);
+--- flashrom-0.9.9.orig/flashchips.c
++++ flashrom-0.9.9/flashchips.c
+@@ -12564,6 +12564,120 @@
+ 
+ 	{
+ 		.vendor		= "SST",
++		.name		= "SST26VF016B(A)",
++		.bustype	= BUS_SPI,
++		.manufacture_id	= SST_ID,
++		.model_id	= SST_SST26VF016B,
++		.total_size	= 2048,
++		.page_size	= 256,
++		.feature_bits	= FEATURE_WRSR_WREN | FEATURE_OTP,
++		.tested		= TEST_OK_PREW,
++		.probe		= probe_spi_rdid,
++		.probe_timing	= TIMING_ZERO,
++		.block_erasers	=
++		{
++			{
++				.eraseblocks = { {4 * 1024, 512} },
++				.block_erase = spi_block_erase_20,
++			}, {
++				.eraseblocks = {
++					{8 * 1024, 4},
++					{32 * 1024, 1},
++					{64 * 1024, 30},
++					{32 * 1024, 1},
++					{8 * 1024, 4},
++				},
++				.block_erase = spi_block_erase_d8,
++			}, {
++				.eraseblocks = { {2 * 1024 * 1024, 1} },
++				.block_erase = spi_block_erase_c7,
++			},
++		},
++		.printlock	= spi_prettyprint_status_register_plain, /* TODO: improve */
++		.unlock		= spi_disable_blockprotect_sst26_global_unprotect,
++		.write		= spi_chip_write_256, /* Multi I/O supported */
++		.read		= spi_chip_read, /* Fast read (0x0B) and multi I/O supported */
++		.voltage	= {2700, 3600},
++	},
++	{
++		.vendor		= "SST",
++		.name		= "SST26VF032B(A)",
++		.bustype	= BUS_SPI,
++		.manufacture_id	= SST_ID,
++		.model_id	= SST_SST26VF032B,
++		.total_size	= 4096,
++		.page_size	= 256,
++		.feature_bits	= FEATURE_WRSR_WREN | FEATURE_OTP,
++		.tested		= TEST_UNTESTED,
++		.probe		= probe_spi_rdid,
++		.probe_timing	= TIMING_ZERO,
++		.block_erasers	=
++		{
++			{
++				.eraseblocks = { {4 * 1024, 1024} },
++				.block_erase = spi_block_erase_20,
++			}, {
++				.eraseblocks = {
++					{8 * 1024, 4},
++					{32 * 1024, 1},
++					{64 * 1024, 62},
++					{32 * 1024, 1},
++					{8 * 1024, 4},
++				},
++				.block_erase = spi_block_erase_d8,
++			}, {
++				.eraseblocks = { {4 * 1024 * 1024, 1} },
++				.block_erase = spi_block_erase_c7,
++			},
++		},
++		.printlock	= spi_prettyprint_status_register_plain, /* TODO: improve */
++		.unlock		= spi_disable_blockprotect_sst26_global_unprotect,
++		.write		= spi_chip_write_256, /* Multi I/O supported */
++		.read		= spi_chip_read, /* Fast read (0x0B) and multi I/O supported */
++		.voltage	= {2700, 3600},
++	},
++
++
++	{
++		.vendor		= "SST",
++		.name		= "SST26VF064B(A)",
++		.bustype	= BUS_SPI,
++		.manufacture_id	= SST_ID,
++		.model_id	= SST_SST26VF064B,
++		.total_size	= 8192,
++		.page_size	= 256,
++		.feature_bits	= FEATURE_WRSR_WREN | FEATURE_OTP,
++		.tested		= TEST_OK_PREW,
++		.probe		= probe_spi_rdid,
++		.probe_timing	= TIMING_ZERO,
++		.block_erasers	=
++		{
++			{
++				.eraseblocks = { {4 * 1024, 2048} },
++				.block_erase = spi_block_erase_20,
++			}, {
++				.eraseblocks = {
++					{8 * 1024, 4},
++					{32 * 1024, 1},
++					{64 * 1024, 126},
++					{32 * 1024, 1},
++					{8 * 1024, 4},
++				},
++				.block_erase = spi_block_erase_d8,
++			}, {
++				.eraseblocks = { {8 * 1024 * 1024, 1} },
++				.block_erase = spi_block_erase_c7,
++			},
++		},
++		.printlock	= spi_prettyprint_status_register_plain, /* TODO: improve */
++		.unlock		= spi_disable_blockprotect_sst26_global_unprotect,
++		.write		= spi_chip_write_256, /* Multi I/O supported */
++		.read		= spi_chip_read, /* Fast read (0x0B) and multi I/O supported */
++		.voltage	= {2700, 3600},
++	},
++
++	{
++		.vendor		= "SST",
+ 		.name		= "SST25WF512",
+ 		.bustype	= BUS_SPI,
+ 		.manufacture_id	= SST_ID,
+--- flashrom-0.9.9.orig/flashchips.h
++++ flashrom-0.9.9/flashchips.h
+@@ -697,6 +697,8 @@
+ #define SST_SST25VF064C		0x254B
+ #define SST_SST26VF016		0x2601
+ #define SST_SST26VF032		0x2602
++#define SST_SST26VF016B		0x2641
++#define SST_SST26VF032B		0x2642
+ #define SST_SST26VF064B		0x2643
+ #define SST_SST27SF512		0xA4
+ #define SST_SST27SF010		0xA5
+--- flashrom-0.9.9.orig/linux_spi.c
++++ flashrom-0.9.9/linux_spi.c
+@@ -141,6 +141,16 @@
+ 	return 0;
+ }
+ 
++static void print_hex(const char *msg, const void *buf, size_t len)
++{
++        size_t i;
++	msg_pspew("%s:\n", msg);
++        for (i = 0; i < len; i++) {
++                msg_pspew(" %02x", ((uint8_t *)buf)[i]);
++        }
++        msg_pspew("\n");
++}
++
+ static int linux_spi_send_command(struct flashctx *flash, unsigned int writecnt,
+ 				  unsigned int readcnt,
+ 				  const unsigned char *txbuf,
+@@ -172,10 +182,12 @@
+ 	else
+ 		iocontrol_code = SPI_IOC_MESSAGE(2);
+ 
++	print_hex("Write", txbuf, writecnt);
+ 	if (ioctl(fd, iocontrol_code, msg) == -1) {
+ 		msg_cerr("%s: ioctl: %s\n", __func__, strerror(errno));
+ 		return -1;
+ 	}
++	if (readcnt) print_hex("Got", rxbuf, readcnt);
+ 	return 0;
+ }
+ 
+--- flashrom-0.9.9.orig/spi25_statusreg.c
++++ flashrom-0.9.9/spi25_statusreg.c
+@@ -196,6 +196,19 @@
+ 	return spi_disable_blockprotect_generic(flash, 0x3C, 0, 0, 0xFF);
+ }
+ 
++int spi_disable_blockprotect_sst26_global_unprotect(struct flashctx *flash)
++{
++	int result = spi_write_enable(flash);
++	if (result)
++		return result;
++
++	static const unsigned char cmd[] = { 0x98 }; /* ULBPR */
++	result = spi_send_command(flash, sizeof(cmd), 0, cmd, NULL);
++	if (result)
++		msg_cerr("ULBPR failed\n");
++	return result;
++}
++
+ /* A common block protection disable that tries to unset the status register bits masked by 0x0C (BP0-1) and
+  * protected/locked by bit #7. Useful when bits 4-5 may be non-0). */
+ int spi_disable_blockprotect_bp1_srwd(struct flashctx *flash)
diff --git a/meta-oe/recipes-extended/flashrom/flashrom_0.9.6.1.bb b/meta-oe/recipes-extended/flashrom/flashrom_0.9.6.1.bb
deleted file mode 100644
index 0edc68820..000000000
--- a/meta-oe/recipes-extended/flashrom/flashrom_0.9.6.1.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "flashrom is a utility for identifying, reading, writing, verifying and erasing flash chips"
-LICENSE = "GPLv2"
-HOMEPAGE = "http://flashrom.org"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-DEPENDS = "pciutils"
-
-SRC_URI = "http://download.flashrom.org/releases/flashrom-${PV}.tar.bz2 \
-           file://0001-Fix-compilation-on-aarch64.patch \
-           file://0002-Disable-Wtautological-pointer-compare-when-using-cla.patch \
-           file://0003-remove-duplicate-const-qualifiers.patch \
-           file://0001-ichspi.c-Fix-build-with-clang.patch \
-           "
-
-SRC_URI[md5sum] = "407e836c0a2b17ec76583cb6809f65e5"
-SRC_URI[sha256sum] = "6f7b588cce74c90b4fe9c9c794de105de76e0323442fb5770b1aeab81e9d560a"
-
-CFLAGS += "-Wno-error=unknown-pragmas"
-
-do_install() {
-    oe_runmake PREFIX=${prefix} DESTDIR=${D} install
-}
diff --git a/meta-oe/recipes-extended/flashrom/flashrom_0.9.9.bb b/meta-oe/recipes-extended/flashrom/flashrom_0.9.9.bb
new file mode 100644
index 000000000..1bd97929c
--- /dev/null
+++ b/meta-oe/recipes-extended/flashrom/flashrom_0.9.9.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "flashrom is a utility for identifying, reading, writing, verifying and erasing flash chips"
+LICENSE = "GPLv2"
+HOMEPAGE = "http://flashrom.org"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+DEPENDS = "pciutils libusb"
+
+SRC_URI = "http://download.flashrom.org/releases/flashrom-${PV}.tar.bz2 \
+           file://0001-spi-Define-_XOPEN_SOURCE-to-enable-ffs-libc-API.patch \
+           file://sst26.patch \
+           "
+SRC_URI[md5sum] = "aab9c98925d9cfb5ffb28b67a6112530"
+SRC_URI[sha256sum] = "cb3156b0f63eb192024b76c0814135930297aac41f80761a5d293de769783c45"
+
+inherit pkgconfig
+
+do_install() {
+    oe_runmake PREFIX=${prefix} DESTDIR=${D} install
+}
-- 
2.13.3


