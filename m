Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5D95E71BFF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2016 05:38:48 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id s8so1421732pfj.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2016 22:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YEJGMsMnLh/znEW9/56eC4SXF/GbgzE2tXnhTNWh/1E=;
	b=fcCwTIYQoI87rOlkStHzsaNe4DpOFtpllG7ypYL2nqAKzJhap8EyxBglR/P2uFKZ0T
	nieQ4rRiHGJZYCZG8ZUjEdfpIFtpPPSq9bD0CFGQ6eBBuS1rPacwrHuVyw8NGDZgLewb
	mypcTs1geSSWnrplCXGPP6Mk4RN6Wp/1KUii1TM8Qh0YA/x/b1TxSKi0LABOZhZjIuMo
	kHmqV7rcRDOFXX2Q3Rhj1DDRYulkbm8ANHgcP3D/GWv2m0HW4nNGEf/0VfoiSNWPMFTh
	lXwlFFFA0BxZMmo9CTLDFOIA8JGmBngzaaMgd0Rm6Pj+7KwpaEmya1OpEXSpufDNlgdK
	K7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YEJGMsMnLh/znEW9/56eC4SXF/GbgzE2tXnhTNWh/1E=;
	b=Q9I4Y6ddvsnsn3IFQdhFsi/4vfPr30FJ8XTurJavXPz0YPU/7EX+6USo4f8rFkhAAa
	MxCWh7NpAOHFtS9andkw0NW4hIi2Cr1Pg//lXUHRSckcChAhRhWBHqd2lsmf6PCdkaeT
	8jItoUAguEOw/opwh03UZtYfJR3egxM/IRRAaJ7IDNI1bKlhhs9cUQy5tJXU/jlyb6JM
	ITz2xM5ZrQFb9ARTQezZEdCgKMUPo735R2mEJLHlf6ypiwhthQUOGw978pc17yJ57KpX
	o2rivC36hpiXQMKwQQ6CvAskQ472H8jnZkMkuR10qsOYJj61rk70cRE1IJGD9LO9moHH
	5OmA==
X-Gm-Message-State: AA6/9RkpohW1srhBgdEakakv+bgEqzpd4SEPhg2eVY6Q/q96HA9W/FyggrlD3A0J6DpsqQ==
X-Received: by 10.98.219.6 with SMTP id f6mr7942803pfg.72.1476855529833;
	Tue, 18 Oct 2016 22:38:49 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	qd12sm60099564pab.22.2016.10.18.22.38.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Oct 2016 22:38:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2016 22:38:28 -0700
Message-Id: <20161019053834.11523-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.0
In-Reply-To: <20161019053834.11523-1-raj.khem@gmail.com>
References: <20161019053834.11523-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 10/16] flashrom: Fix build with clang and aarch64
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
X-List-Received-Date: Wed, 19 Oct 2016 05:38:48 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../flashrom/0001-Fix-compilation-on-aarch64.patch | 62 +++++++++++++++++++
 ...utological-pointer-compare-when-using-cla.patch | 35 +++++++++++
 .../0003-remove-duplicate-const-qualifiers.patch   | 71 ++++++++++++++++++++++
 .../recipes-extended/flashrom/flashrom_0.9.6.1.bb  |  8 ++-
 4 files changed, 175 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/flashrom/flashrom/0001-Fix-compilation-on-aarch64.patch
 create mode 100644 meta-oe/recipes-extended/flashrom/flashrom/0002-Disable-Wtautological-pointer-compare-when-using-cla.patch
 create mode 100644 meta-oe/recipes-extended/flashrom/flashrom/0003-remove-duplicate-const-qualifiers.patch

diff --git a/meta-oe/recipes-extended/flashrom/flashrom/0001-Fix-compilation-on-aarch64.patch b/meta-oe/recipes-extended/flashrom/flashrom/0001-Fix-compilation-on-aarch64.patch
new file mode 100644
index 0000000..6c2f64e
--- /dev/null
+++ b/meta-oe/recipes-extended/flashrom/flashrom/0001-Fix-compilation-on-aarch64.patch
@@ -0,0 +1,62 @@
+From d9e4dc750dc45e42b482d744829254a3672c11b3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 19 Oct 2016 00:24:08 +0000
+Subject: [PATCH 1/3] Fix compilation on aarch64
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ arch.h     | 2 +-
+ hwaccess.c | 2 +-
+ hwaccess.h | 6 +++---
+ 3 files changed, 5 insertions(+), 5 deletions(-)
+
+Index: flashrom-0.9.6.1/arch.h
+===================================================================
+--- flashrom-0.9.6.1.orig/arch.h
++++ flashrom-0.9.6.1/arch.h
+@@ -27,7 +27,7 @@
+ #define __FLASHROM_ARCH__ "mips"
+ #elif defined(__powerpc__) || defined(__powerpc64__) || defined(__ppc__) || defined(__ppc64__)
+ #define __FLASHROM_ARCH__ "ppc"
+-#elif defined(__arm__)
++#elif defined(__arm__) || defined(__aarch64__)
+ #define __FLASHROM_ARCH__ "arm"
+ #endif
+ __FLASHROM_ARCH__
+Index: flashrom-0.9.6.1/hwaccess.c
+===================================================================
+--- flashrom-0.9.6.1.orig/hwaccess.c
++++ flashrom-0.9.6.1/hwaccess.c
+@@ -121,7 +121,7 @@ int rget_io_perms(void)
+ 	return 0;
+ }
+ 
+-#elif defined (__arm__)
++#elif defined (__arm__) || defined (__aarch64__)
+ 
+ static inline void sync_primitive(void)
+ {
+Index: flashrom-0.9.6.1/hwaccess.h
+===================================================================
+--- flashrom-0.9.6.1.orig/hwaccess.h
++++ flashrom-0.9.6.1/hwaccess.h
+@@ -68,8 +68,8 @@
+ #error Little-endian PowerPC #defines are unknown
+ #endif
+ 
+-#elif defined (__arm__)
+-#if defined (__ARMEL__)
++#elif defined (__arm__) || defined (__aarch64__)
++#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
+ #define __FLASHROM_LITTLE_ENDIAN__ 1
+ #else
+ #error Big-endian ARM #defines are unknown
+@@ -337,7 +337,7 @@ int libpayload_wrmsr(int addr, msr_t msr
+ 
+ /* PCI port I/O is not yet implemented on MIPS. */
+ 
+-#elif defined(__arm__)
++#elif defined(__arm__) || defined (__aarch64__)
+ 
+ /* Non memory mapped I/O is not supported on ARM. */
+ 
diff --git a/meta-oe/recipes-extended/flashrom/flashrom/0002-Disable-Wtautological-pointer-compare-when-using-cla.patch b/meta-oe/recipes-extended/flashrom/flashrom/0002-Disable-Wtautological-pointer-compare-when-using-cla.patch
new file mode 100644
index 0000000..aec11bf
--- /dev/null
+++ b/meta-oe/recipes-extended/flashrom/flashrom/0002-Disable-Wtautological-pointer-compare-when-using-cla.patch
@@ -0,0 +1,35 @@
+From 9be0d152dfe8ac0f9b665d61aeb3f99dae533e0f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 19 Oct 2016 00:25:09 +0000
+Subject: [PATCH 2/3] Disable Wtautological-pointer-compare when using clang
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ flashrom.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/flashrom.c b/flashrom.c
+index 04e9934..bf49104 100644
+--- a/flashrom.c
++++ b/flashrom.c
+@@ -1569,6 +1569,9 @@ int selfcheck(void)
+ 	 * For 'flashchips' we check the first element to be non-null. In the
+ 	 * other cases there exist use cases where the first element can be
+ 	 * null. */
++#pragma clang diagnostic push
++#pragma clang diagnostic ignored "-Wtautological-pointer-compare"
++
+ 	if (flashchips == NULL || flashchips[0].vendor == NULL) {
+ 		msg_gerr("Flashchips table miscompilation!\n");
+ 		ret = 1;
+@@ -1602,6 +1605,7 @@ int selfcheck(void)
+ 		msg_gerr("Known laptops table does not exist!\n");
+ 		ret = 1;
+ 	}
++#pragma clang diagnostic pop
+ #endif
+ 	return ret;
+ }
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-extended/flashrom/flashrom/0003-remove-duplicate-const-qualifiers.patch b/meta-oe/recipes-extended/flashrom/flashrom/0003-remove-duplicate-const-qualifiers.patch
new file mode 100644
index 0000000..99283d3
--- /dev/null
+++ b/meta-oe/recipes-extended/flashrom/flashrom/0003-remove-duplicate-const-qualifiers.patch
@@ -0,0 +1,71 @@
+From 42ec9bd51e60aa38fe6e78f644e742d6989b6683 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 19 Oct 2016 00:25:23 +0000
+Subject: [PATCH 3/3] remove duplicate const qualifiers
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ bitbang_spi.c  | 12 ++++++------
+ dummyflasher.c |  2 +-
+ 2 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/bitbang_spi.c b/bitbang_spi.c
+index 11d2de1..508cf45 100644
+--- a/bitbang_spi.c
++++ b/bitbang_spi.c
+@@ -26,33 +26,33 @@
+ #include "spi.h"
+ 
+ /* Note that CS# is active low, so val=0 means the chip is active. */
+-static void bitbang_spi_set_cs(const const struct bitbang_spi_master *master, int val)
++static void bitbang_spi_set_cs(const struct bitbang_spi_master *master, int val)
+ {
+ 	master->set_cs(val);
+ }
+ 
+-static void bitbang_spi_set_sck(const const struct bitbang_spi_master *master, int val)
++static void bitbang_spi_set_sck(const struct bitbang_spi_master *master, int val)
+ {
+ 	master->set_sck(val);
+ }
+ 
+-static void bitbang_spi_set_mosi(const const struct bitbang_spi_master *master, int val)
++static void bitbang_spi_set_mosi(const struct bitbang_spi_master *master, int val)
+ {
+ 	master->set_mosi(val);
+ }
+ 
+-static int bitbang_spi_get_miso(const const struct bitbang_spi_master *master)
++static int bitbang_spi_get_miso(const struct bitbang_spi_master *master)
+ {
+ 	return master->get_miso();
+ }
+ 
+-static void bitbang_spi_request_bus(const const struct bitbang_spi_master *master)
++static void bitbang_spi_request_bus(const struct bitbang_spi_master *master)
+ {
+ 	if (master->request_bus)
+ 		master->request_bus();
+ }
+ 
+-static void bitbang_spi_release_bus(const const struct bitbang_spi_master *master)
++static void bitbang_spi_release_bus(const struct bitbang_spi_master *master)
+ {
+ 	if (master->release_bus)
+ 		master->release_bus();
+diff --git a/dummyflasher.c b/dummyflasher.c
+index 66d0df0..d0de41c 100644
+--- a/dummyflasher.c
++++ b/dummyflasher.c
+@@ -66,7 +66,7 @@ int spi_ignorelist_size = 0;
+ static uint8_t emu_status = 0;
+ 
+ /* A legit complete SFDP table based on the MX25L6436E (rev. 1.8) datasheet. */
+-static const uint8_t const sfdp_table[] = {
++static const uint8_t sfdp_table[] = {
+ 	0x53, 0x46, 0x44, 0x50, // @0x00: SFDP signature
+ 	0x00, 0x01, 0x01, 0xFF, // @0x04: revision 1.0, 2 headers
+ 	0x00, 0x00, 0x01, 0x09, // @0x08: JEDEC SFDP header rev. 1.0, 9 DW long
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-extended/flashrom/flashrom_0.9.6.1.bb b/meta-oe/recipes-extended/flashrom/flashrom_0.9.6.1.bb
index a1f0b30..d3ec578 100644
--- a/meta-oe/recipes-extended/flashrom/flashrom_0.9.6.1.bb
+++ b/meta-oe/recipes-extended/flashrom/flashrom_0.9.6.1.bb
@@ -5,11 +5,17 @@ HOMEPAGE = "http://flashrom.org"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "pciutils"
 
-SRC_URI = "http://download.flashrom.org/releases/flashrom-${PV}.tar.bz2"
+SRC_URI = "http://download.flashrom.org/releases/flashrom-${PV}.tar.bz2 \
+           file://0001-Fix-compilation-on-aarch64.patch \
+           file://0002-Disable-Wtautological-pointer-compare-when-using-cla.patch \
+           file://0003-remove-duplicate-const-qualifiers.patch \
+           "
 
 SRC_URI[md5sum] = "407e836c0a2b17ec76583cb6809f65e5"
 SRC_URI[sha256sum] = "6f7b588cce74c90b4fe9c9c794de105de76e0323442fb5770b1aeab81e9d560a"
 
+CFLAGS += "-Wno-error=unknown-pragmas"
+
 do_install() {
     oe_runmake PREFIX=${prefix} DESTDIR=${D} install
 }
-- 
2.10.0


