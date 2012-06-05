Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SbzIj-0002mn-0j
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jun 2012 21:20:21 +0200
Received: by wibhm14 with SMTP id hm14so3778316wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jun 2012 12:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=OpzJNp7wGnl6tW4jInTJ54OUpwbQZuwRXQU88TfjXoA=;
	b=zYMTn2R8kuM3V/iwxGorwV2Of1ktYxNIlzGJEPBAOSSf6I7vYq4Pg4VnBofvrcHX81
	FwZ5fxzgPKxv4trwh/X6odRD4WH3geahiytUcR29kB56Lc8jKUALzqNffSlkeI9v61Gl
	eOwmOXsrbXnfowdKIf7p2XXyyU+dWMXdYPlRnQdTca2B3VQJd8fBl9VdGWiefNefwdXg
	NppL5YHLy73kL4F4+fDJS/6bk5wm60NRFU1fk3oYpFmcPKcBIPEpJy7CRqzRnqlMuQP0
	W8HaOLSab7j52h0HvmZUujkRVKyZOtl4qnghf3Linznq0rDkzQwwmDQlsj9yU2yq09et
	qh5Q==
Received: by 10.216.220.81 with SMTP id n59mr15103452wep.220.1338923394767;
	Tue, 05 Jun 2012 12:09:54 -0700 (PDT)
Received: from localhost.localdomain (1.Red-83-60-183.dynamicIP.rima-tde.net.
	[83.60.183.1])
	by mx.google.com with ESMTPS id bn9sm28723664wib.5.2012.06.05.12.09.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Jun 2012 12:09:54 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Jun 2012 21:09:48 +0200
Message-Id: <1338923388-34328-1-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Elvis Dowson <elvis.dowson@gmail.com>
Subject: [poky] qemu: virtex5-ml507: Add kernel uImage loading support.
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
X-List-Received-Date: Tue, 05 Jun 2012 19:20:21 -0000

This commit adds kernel uImage loading support for the Xilinx ML507
development board emulator.

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 ...5-ml507-add-kernel-uImage-loading-support.patch |   74 ++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_0.15.1.bb          |    3 +-
 2 files changed, 76 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/qemu-virtex5-ml507-add-kernel-uImage-loading-support.patch

diff --git a/meta/recipes-devtools/qemu/qemu-0.15.1/qemu-virtex5-ml507-add-kernel-uImage-loading-support.patch b/meta/recipes-devtools/qemu/qemu-0.15.1/qemu-virtex5-ml507-add-kernel-uImage-loading-support.patch
new file mode 100644
index 0000000..6ddec7f
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu-0.15.1/qemu-virtex5-ml507-add-kernel-uImage-loading-support.patch
@@ -0,0 +1,74 @@
+From 8ba6fc6d75b4da1b84062efdab2543df5ab93792 Mon Sep 17 00:00:00 2001
+From: Elvis Dowson <elvis.dowson@gmail.com>
+Date: Tue, 5 Jun 2012 20:03:14 +0200
+Subject: [PATCH] virtex_ml507: Add support for loading kernel uImage binary.
+
+This commit adds support for loading a kernel uImage binary.
+
+Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
+---
+ hw/virtex_ml507.c |   23 +++++++++++++++--------
+ 1 file changed, 15 insertions(+), 8 deletions(-)
+
+diff --git a/hw/virtex_ml507.c b/hw/virtex_ml507.c
+index 7bde8c7..0a80536 100644
+--- a/hw/virtex_ml507.c
++++ b/hw/virtex_ml507.c
+@@ -43,8 +43,9 @@
+ #include "blockdev.h"
+ #include "xilinx.h"
+
+-#define EPAPR_MAGIC    (0x45504150)
+-#define FLASH_SIZE     (16 * 1024 * 1024)
++#define UIMAGE_LOAD_BASE 0
++#define EPAPR_MAGIC      (0x45504150)
++#define FLASH_SIZE       (16 * 1024 * 1024)
+
+ static struct boot_info
+ {
+@@ -193,7 +194,7 @@ static void virtex_init(ram_addr_t ram_size,
+ {
+     DeviceState *dev;
+     CPUState *env;
+-    target_phys_addr_t ram_base = 0;
++    target_phys_addr_t loadaddr = UIMAGE_LOAD_BASE;
+     DriveInfo *dinfo;
+     ram_addr_t phys_ram;
+     ram_addr_t phys_flash;
+@@ -213,7 +214,7 @@ static void virtex_init(ram_addr_t ram_size,
+     qemu_register_reset(main_cpu_reset, env);
+
+     phys_ram = qemu_ram_alloc(NULL, "ram", ram_size);
+-    cpu_register_physical_memory(ram_base, ram_size, phys_ram | IO_MEM_RAM);
++    cpu_register_physical_memory(loadaddr, ram_size, phys_ram | IO_MEM_RAM);
+
+     phys_flash = qemu_ram_alloc(NULL, "virtex.flash", FLASH_SIZE);
+     dinfo = drive_get(IF_PFLASH, 0, 0);
+@@ -233,14 +234,20 @@ static void virtex_init(ram_addr_t ram_size,
+     /* 2 timers at irq 2 @ 62 Mhz.  */
+     xilinx_timer_create(0x83c00000, irq[3], 2, 62 * 1000000);
+
++    /* Load kernel. */
+     if (kernel_filename) {
+         uint64_t entry, low, high;
+         target_phys_addr_t boot_offset;
+
+-        /* Boots a kernel elf binary.  */
+-        kernel_size = load_elf(kernel_filename, NULL, NULL,
+-                               &entry, &low, &high, 1, ELF_MACHINE, 0);
+-        boot_info.bootstrap_pc = entry & 0x00ffffff;
++        /* Boot a kernel uImage binary. */
++        kernel_size = load_uimage(kernel_filename, &entry, &loadaddr, NULL);
++
++        /* If we failed loading uImage, try again as a kernel elf binary.  */
++        if (kernel_size < 0) {
++            kernel_size = load_elf(kernel_filename, NULL, NULL,
++                                   &entry, &low, &high, 1, ELF_MACHINE, 0);
++            boot_info.bootstrap_pc = entry & 0x00ffffff;
++        }
+
+         if (kernel_size < 0) {
+             boot_offset = 0x1200000;
+--
+1.7.9.5
+
diff --git a/meta/recipes-devtools/qemu/qemu_0.15.1.bb b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
index bcff9f8..f659106 100644
--- a/meta/recipes-devtools/qemu/qemu_0.15.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
@@ -3,7 +3,7 @@ require qemu.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-PR = "r8"
+PR = "r9"
 
 FILESPATH = "${FILE_DIRNAME}/qemu-${PV}"
 FILESDIR = "${WORKDIR}"
@@ -20,6 +20,7 @@ SRC_URI = "\
     file://arm-bgr.patch \
     file://a4d1f142542935b90d2eb30f3aead4edcf455fe6.patch \
     file://dummy-gl-config.patch \
+    file://qemu-virtex5-ml507-add-kernel-uImage-loading-support.patch \
     "
 
 # Only use the GL passthrough patches for native/nativesdk versions
-- 
1.7.9.5



