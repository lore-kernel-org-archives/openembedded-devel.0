Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id EB22D6D8E8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2013 22:24:05 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id d51so1359611eek.17
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2013 14:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=NN2di/Pm2euMJortGTmt7UJnE8H7+aEV1DELWu6V+YM=;
	b=VM56SaFjBHZypbprbXP+2IDU8f/oc96LA8ZeKZ+gnpm2ZroPX/LFOnmYqU/2DB9ye6
	3GzAjuJkRpBAUlTMcf8SPZYA9YBv39BvBm8ctbDV5cSLctD3NnK7bAzzTJxaRAXpa5SU
	vIcnHEoP7UVmHNDz6f/e+0e99Azl98iPWfeE9i6XrZujL1KSNiWZbM+zSfZtmNhSXcQd
	jhX/QHoAtaXdeyhIPGjLRxoG4f4+4re+t3G1iq6LNRXYE/qXW04vkcfDV7tE9z0YW17E
	I1oVgCaJjsaUewkpMc0giM4Ff3Z24ofjKkpDVRosp0nq8B4ntGRx/21Sk5szziI+QG1l
	lFkg==
X-Received: by 10.14.87.3 with SMTP id x3mr80894eee.76.1384295046264;
	Tue, 12 Nov 2013 14:24:06 -0800 (PST)
Received: from mizar.localdomain ([95.232.250.41])
	by mx.google.com with ESMTPSA id s3sm80757756eeo.3.2013.11.12.14.24.05
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Nov 2013 14:24:05 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Nov 2013 23:24:02 +0100
Message-Id: <1384295042-20249-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] linux-yocto-tiny-kexecboot: collie: resync patches with linux-yocto_3.10
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Nov 2013 22:24:06 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../collie/collie-tiny.scc                         |  15 +++
 .../patches-locomo/locomo-fix-SCL-SDA.patch        |  28 +++++
 .../patches-mtd/collie-cfi-probe-again.patch       |  29 ++++++
 .../patches-mtd/collie-fixup-strataflash.patch     |  27 +++++
 .../patches/patches-mtd/collie-force-cfi.patch     |  30 ++++++
 .../patches/patches-mtd/collie-force-unlock.patch  |  22 ++++
 .../patches/patches-mtd/collie-mtd-resize.patch    |  41 ++++++++
 .../patches-sa1100/arm-sa1100-add-cpu-clock.patch  |  95 +++++++++++++++++
 .../patches-sa1100/collie-add-bootblock.patch      |  29 ++++++
 .../patches/patches-sa1100/collie-irda.patch       |  88 ++++++++++++++++
 .../fbdev-sa1100fb-make-use-of-device-clock.patch  | 115 +++++++++++++++++++++
 .../patches-sa1100/pcmcia-clock-alias-sa1111.patch |  31 ++++++
 .../pcmcia-sa1100-device-clock.patch               | 100 ++++++++++++++++++
 .../pcmcia-sa1111-device-clock.patch               |  44 ++++++++
 14 files changed, 694 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-locomo/locomo-fix-SCL-SDA.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-cfi-probe-again.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-fixup-strataflash.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-force-cfi.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-force-unlock.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-mtd-resize.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/arm-sa1100-add-cpu-clock.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/collie-add-bootblock.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/collie-irda.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/fbdev-sa1100fb-make-use-of-device-clock.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/pcmcia-clock-alias-sa1111.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/pcmcia-sa1100-device-clock.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/pcmcia-sa1111-device-clock.patch

diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/collie/collie-tiny.scc b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/collie/collie-tiny.scc
index cc1264d..5dbf14e 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/collie/collie-tiny.scc
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/collie/collie-tiny.scc
@@ -12,4 +12,19 @@ patch ../patches/patches-mfd/mcp-device.patch
 patch ../patches/patches-mfd/ucb1x00-device.patch
 patch ../patches/patches-mtd/collie-jedec-probe.patch
 patch ../patches/patches-mtd/collie-eraseinfo.patch
+// for 3.12
+patch ../patches/patches-mtd/collie-cfi-probe-again.patch
+patch ../patches/patches-mtd/collie-force-cfi.patch
+patch ../patches/patches-mtd/collie-mtd-resize.patch
+patch ../patches/patches-mtd/collie-force-unlock.patch
+patch ../patches/patches-mtd/collie-fixup-strataflash.patch
+patch ../patches/patches-sa1100/collie-irda.patch
+patch ../patches/patches-sa1100/collie-add-bootblock.patch
+patch ../patches/patches-sa1100/arm-sa1100-add-cpu-clock.patch
+patch ../patches/patches-sa1100/fbdev-sa1100fb-make-use-of-device-clock.patch
+patch ../patches/patches-sa1100/pcmcia-sa1100-device-clock.patch
+patch ../patches/patches-sa1100/pcmcia-clock-alias-sa1111.patch
+patch ../patches/patches-sa1100/pcmcia-sa1111-device-clock.patch
+patch ../patches/patches-locomo/locomo-fix-SCL-SDA.patch
+// linux-yocto-specific
 patch ../patches/revert-check-on-console-device.patch
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-locomo/locomo-fix-SCL-SDA.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-locomo/locomo-fix-SCL-SDA.patch
new file mode 100644
index 0000000..3336e2b
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-locomo/locomo-fix-SCL-SDA.patch
@@ -0,0 +1,28 @@
+From acc2f94781ab11bead994bb3faaad149f9187bd4 Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Tue, 12 Nov 2013 22:21:20 +0100
+Subject: [PATCH 631/631] linux-yocto: collie: locomo.c: fix SCL line instead
+ of SDA
+
+Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ arch/arm/common/locomo.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/arm/common/locomo.c b/arch/arm/common/locomo.c
+index b55c362..d827bcb 100644
+--- a/arch/arm/common/locomo.c
++++ b/arch/arm/common/locomo.c
+@@ -629,7 +629,7 @@ static void locomo_m62332_sendbit(void *mapbase, int bit)
+ 	unsigned int r;
+ 
+ 	r = locomo_readl(mapbase + LOCOMO_DAC);
+-	r &=  ~(LOCOMO_DAC_SCLOEB);
++	r &=  ~(LOCOMO_DAC_SDAOEB);
+ 	locomo_writel(r, mapbase + LOCOMO_DAC);
+ 	udelay(DAC_LOW_SETUP_TIME);	/* 300 nsec */
+ 	udelay(DAC_DATA_HOLD_TIME);	/* 300 nsec */
+-- 
+1.8.1.5
+
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-cfi-probe-again.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-cfi-probe-again.patch
new file mode 100644
index 0000000..7a0dbe5
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-cfi-probe-again.patch
@@ -0,0 +1,29 @@
+From 35957eda21bdd2f22c84fa269c1b856f5039c308 Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Tue, 12 Nov 2013 22:32:26 +0100
+Subject: [PATCH 633/633] sa1100: collie: detect NOR again with cfi_probe
+
+Ehile the detection is still forced we switch away from jedec:
+the CFI code allows us to set the necessary fixups.
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ arch/arm/mach-sa1100/collie.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/arm/mach-sa1100/collie.c b/arch/arm/mach-sa1100/collie.c
+index 799902d..8c088cc 100644
+--- a/arch/arm/mach-sa1100/collie.c
++++ b/arch/arm/mach-sa1100/collie.c
+@@ -326,7 +326,7 @@ static void collie_flash_exit(void)
+ }
+ 
+ static struct flash_platform_data collie_flash_data = {
+-	.map_name	= "jedec_probe",
++	.map_name	= "cfi_probe",
+ 	.init		= collie_flash_init,
+ 	.set_vpp	= collie_set_vpp,
+ 	.exit		= collie_flash_exit,
+-- 
+1.8.1.5
+
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-fixup-strataflash.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-fixup-strataflash.patch
new file mode 100644
index 0000000..1fef596
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-fixup-strataflash.patch
@@ -0,0 +1,27 @@
+From 64fab473fe31b5c8a76000d7e82df7f6cdd751ba Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Tue, 12 Nov 2013 01:28:18 +0100
+Subject: [PATCH 627/627] linux-yocto: collie: add MTD fixup like for Intel
+ Strataflash
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ drivers/mtd/chips/cfi_cmdset_0001.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
+index d9d6f0e..eedb60b 100644
+--- a/drivers/mtd/chips/cfi_cmdset_0001.c
++++ b/drivers/mtd/chips/cfi_cmdset_0001.c
+@@ -36,7 +36,7 @@
+ #include <linux/mtd/mtd.h>
+ #include <linux/mtd/cfi.h>
+ 
+-/* #define CMDSET0001_DISABLE_ERASE_SUSPEND_ON_WRITE */
++#define CMDSET0001_DISABLE_ERASE_SUSPEND_ON_WRITE
+ /* #define CMDSET0001_DISABLE_WRITE_SUSPEND */
+ 
+ // debugging, turns off buffer write mode if set to 1
+-- 
+1.8.1.5
+
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-force-cfi.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-force-cfi.patch
new file mode 100644
index 0000000..958fce7
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-force-cfi.patch
@@ -0,0 +1,30 @@
+From c39115ed52359eb5f0475ea2b4a2e71acb5da54b Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Thu, 7 Nov 2013 23:17:36 +0100
+Subject: [PATCH] cfi_util.c: force CFI detection even if Q R Y test
+ fails
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ drivers/mtd/chips/cfi_util.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/mtd/chips/cfi_util.c b/drivers/mtd/chips/cfi_util.c
+index f992418..bdee7b9 100644
+--- a/drivers/mtd/chips/cfi_util.c
++++ b/drivers/mtd/chips/cfi_util.c
+@@ -85,7 +85,10 @@ int __xipram cfi_qry_mode_on(uint32_t base, struct map_info *map,
+ 	if (cfi_qry_present(map, base, cfi))
+ 		return 1;
+ 	/* QRY not found */
+-	return 0;
++/*	return 0; */
++
++/*	FIXME: UGLY HACK: FORCE DETECTION */
++	return 1;
+ }
+ EXPORT_SYMBOL_GPL(cfi_qry_mode_on);
+ 
+-- 
+1.8.1.5
+
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-force-unlock.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-force-unlock.patch
new file mode 100644
index 0000000..d599d1d
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-force-unlock.patch
@@ -0,0 +1,22 @@
+From c39115ed52359eb5f0475ea2b4a2e71acb5da54b Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Thu, 7 Nov 2013 23:17:36 +0100
+Subject: [PATCH] collie: force flash unlock on boot
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ drivers/mtd/chips/cfi_cmdset_0001.c | 1 +
+ 1 file changed, 1 insertions(+), 0 deletion(-)
+
+diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
+index 7751443..d9d6f0e 100644
+--- a/drivers/mtd/chips/cfi_cmdset_0001.c
++++ b/drivers/mtd/chips/cfi_cmdset_0001.c
+@@ -310,6 +310,7 @@ static struct cfi_fixup cfi_fixup_table[] = {
+ 	{ CFI_MFR_ST, 0x00ba, /* M28W320CT */ fixup_st_m28w320ct },
+ 	{ CFI_MFR_ST, 0x00bb, /* M28W320CB */ fixup_st_m28w320cb },
+ 	{ CFI_MFR_INTEL, CFI_ID_ANY, fixup_unlock_powerup_lock },
++	{ CFI_MFR_SHARP, 0x00b0, fixup_unlock_powerup_lock },
+ 	{ 0, 0, NULL }
+ };
+ 
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-mtd-resize.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-mtd-resize.patch
new file mode 100644
index 0000000..ba52d2f
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-mtd-resize.patch
@@ -0,0 +1,41 @@
+From 85f5a57b9bdd94fa7a20280c31f4f8b148368215 Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Thu, 7 Nov 2013 23:00:31 +0100
+Subject: ARM: SA1100: resize collie mtd to SZ_16M
+
+The end-user models have all 2x8 = 16 Megabytes of NOR.
+It seems that only some dev models/prototype had 32M.
+With current code, giving size of 32M can confuse the detection.
+
+JEDEC:
+sa1100-0: Found 2 x16 devices at 0x0 in 32-bit bank
+sa1100-0: Found different chip or no chip at all (mfr 0x4, id 0x3001) at 0x1000000
+SA1100 flash: CFI device at 0x00000000, 16MiB, 32-bit
+
+CFI:
+sa1100-0: Found 2 x16 devices at 0x0 in 32-bit bank. Manufacturer ID 0x0000b0 Chip ID 0x0000b0
+sa1100-0: Found 2 x16 devices at 0x1000000 in 32-bit bank
+Intel/Sharp Extended Query Table at 0x0039
+...
+sa1100-0: 2 set(s) of 2 interleaved chips --> 2 partitions of 16384 KiB
+SA1100 flash: CFI device at 0x00000000, 32MiB, 32-bit
+
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ arch/arm/mach-sa1100/collie.c             |      2 +-
+ 2 files changed, 230404 insertions(+), 1604 deletions(-)
+
+diff --git a/arch/arm/mach-sa1100/collie.c b/arch/arm/mach-sa1100/collie.c
+index 7fb96eb..c1005ef 100644
+--- a/arch/arm/mach-sa1100/collie.c
++++ b/arch/arm/mach-sa1100/collie.c
+@@ -298,7 +298,7 @@ static struct flash_platform_data collie_flash_data = {
+ };
+ 
+ static struct resource collie_flash_resources[] = {
+-	DEFINE_RES_MEM(SA1100_CS0_PHYS, SZ_32M),
++	DEFINE_RES_MEM(SA1100_CS0_PHYS, SZ_16M),
+ };
+ 
+ static struct sa1100fb_mach_info collie_lcd_info = {
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/arm-sa1100-add-cpu-clock.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/arm-sa1100-add-cpu-clock.patch
new file mode 100644
index 0000000..cf3e23b
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/arm-sa1100-add-cpu-clock.patch
@@ -0,0 +1,95 @@
+From 6abd8c6c642b7f5da4a8065fa6b29c4c90df308d Mon Sep 17 00:00:00 2001
+From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+Date: Mon, 11 Nov 2013 22:53:36 +0400
+Subject: [PATCH 1/2] arm: sa1100: add cpu clock
+
+Both SA1100 framebuffer and PCMCIA drivers require knowledge of cpu
+frequency to correctly program timings.  Currently they receive timing
+information by calling cpufreq_get(0).  However if cpu frequency driver
+is not enabled (e.g. due to unsupported DRAM chip/board on sa1110)
+cpufreq_get(0) returns 0, causing incorrect timings to be programmed.
+
+Add cpu clock returning cpu frequency, to be used by sa11x0 fb and
+pcmcia drivers.
+
+Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+---
+ arch/arm/mach-sa1100/clock.c | 34 ++++++++++++++++++++++++++++++++++
+ 1 file changed, 34 insertions(+)
+
+diff --git a/arch/arm/mach-sa1100/clock.c b/arch/arm/mach-sa1100/clock.c
+index 172ebd0..abf1dc1 100644
+--- a/arch/arm/mach-sa1100/clock.c
++++ b/arch/arm/mach-sa1100/clock.c
+@@ -15,10 +15,12 @@
+ #include <linux/clkdev.h>
+ 
+ #include <mach/hardware.h>
++#include <mach/generic.h>
+ 
+ struct clkops {
+ 	void			(*enable)(struct clk *);
+ 	void			(*disable)(struct clk *);
++	unsigned long		(*get_rate)(struct clk *);
+ };
+ 
+ struct clk {
+@@ -51,6 +53,19 @@ static void clk_gpio27_disable(struct clk *clk)
+ 	GAFR &= ~GPIO_32_768kHz;
+ }
+ 
++static void clk_cpu_enable(struct clk *clk)
++{
++}
++
++static void clk_cpu_disable(struct clk *clk)
++{
++}
++
++static unsigned long clk_cpu_get_rate(struct clk *clk)
++{
++	return sa11x0_getspeed(0) * 1000;
++}
++
+ int clk_enable(struct clk *clk)
+ {
+ 	unsigned long flags;
+@@ -80,16 +95,35 @@ void clk_disable(struct clk *clk)
+ }
+ EXPORT_SYMBOL(clk_disable);
+ 
++unsigned long clk_get_rate(struct clk *clk)
++{
++	if (clk && clk->ops && clk->ops->get_rate)
++		return clk->ops->get_rate(clk);
++	else
++		return 0;
++}
++EXPORT_SYMBOL(clk_get_rate);
++
+ const struct clkops clk_gpio27_ops = {
+ 	.enable		= clk_gpio27_enable,
+ 	.disable	= clk_gpio27_disable,
+ };
+ 
++const struct clkops clk_cpu_ops = {
++	.enable		= clk_cpu_enable,
++	.disable	= clk_cpu_disable,
++	.get_rate	= clk_cpu_get_rate,
++};
++
+ static DEFINE_CLK(gpio27, &clk_gpio27_ops);
+ 
++static DEFINE_CLK(cpu, &clk_cpu_ops);
++
+ static struct clk_lookup sa11xx_clkregs[] = {
+ 	CLKDEV_INIT("sa1111.0", NULL, &clk_gpio27),
+ 	CLKDEV_INIT("sa1100-rtc", NULL, NULL),
++	CLKDEV_INIT("sa11x0-fb", NULL, &clk_cpu),
++	CLKDEV_INIT("sa11x0-pcmcia", NULL, &clk_cpu),
+ };
+ 
+ static int __init sa11xx_clk_init(void)
+-- 
+1.8.4.2
+
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/collie-add-bootblock.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/collie-add-bootblock.patch
new file mode 100644
index 0000000..9f5aaa7
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/collie-add-bootblock.patch
@@ -0,0 +1,29 @@
+From 0b6559d7a3e28c89c3093fd193076a5d7d7c699b Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Sat, 9 Nov 2013 16:30:01 +0100
+Subject: [PATCH] linux-yocto: collie: add top boot partition
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ arch/arm/mach-sa1100/collie.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/arch/arm/mach-sa1100/collie.c b/arch/arm/mach-sa1100/collie.c
+index 946fa71..2785e6e 100644
+--- a/arch/arm/mach-sa1100/collie.c
++++ b/arch/arm/mach-sa1100/collie.c
+@@ -294,6 +294,11 @@ static struct mtd_partition collie_partitions[] = {
+ 		.name		= "rootfs",
+ 		.offset 	= MTDPART_OFS_APPEND,
+ 		.size		= 0x00e20000,
++	}, {
++		.name		= "bootblock",
++		.offset 	= MTDPART_OFS_APPEND,
++		.size		= 0x00020000,
++		.mask_flags	= MTD_WRITEABLE
+ 	}
+ };
+ 
+-- 
+1.8.1.5
+
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/collie-irda.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/collie-irda.patch
new file mode 100644
index 0000000..46ad808
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/collie-irda.patch
@@ -0,0 +1,88 @@
+From c6fb61edf283f255c3763a57366bb89bb36ad79c Mon Sep 17 00:00:00 2001
+From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+Date: Fri, 8 Nov 2013 17:57:32 +0400
+Subject: [PATCH] collie: add support for IrDA transceiver
+
+Collie has onboard IrDA transceiver controlled via active-low gpio. Add
+corresponding platform data.
+
+Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+---
+ arch/arm/mach-sa1100/collie.c              | 33 ++++++++++++++++++++++++++++++
+ arch/arm/mach-sa1100/include/mach/collie.h |  2 +-
+ 2 files changed, 34 insertions(+), 1 deletion(-)
+
+diff --git a/arch/arm/mach-sa1100/collie.c b/arch/arm/mach-sa1100/collie.c
+index 2349dee..1b9473d 100644
+--- a/arch/arm/mach-sa1100/collie.c
++++ b/arch/arm/mach-sa1100/collie.c
+@@ -41,6 +41,7 @@
+ #include <asm/mach/arch.h>
+ #include <asm/mach/flash.h>
+ #include <asm/mach/map.h>
++#include <asm/mach/irda.h>
+ 
+ #include <asm/hardware/scoop.h>
+ #include <asm/mach/sharpsl_param.h>
+@@ -94,6 +95,37 @@ static struct mcp_plat_data collie_mcp_data = {
+ 	.codec_pdata	= &collie_ucb1x00_data,
+ };
+ 
++int collie_ir_startup(struct device *dev)
++{
++	int rc = gpio_request(COLLIE_GPIO_IR_ON, "IrDA");
++	if (rc)
++		return rc;
++	rc = gpio_direction_output(COLLIE_GPIO_IR_ON, 1);
++
++	if (!rc)
++		return 0;
++
++	gpio_free(COLLIE_GPIO_IR_ON);
++	return rc;
++}
++
++void collie_ir_shutdown(struct device *dev)
++{
++	gpio_free(COLLIE_GPIO_IR_ON);
++}
++
++static int collie_ir_set_power(struct device *dev, unsigned int state)
++{
++	gpio_set_value(COLLIE_GPIO_IR_ON, !state);
++	return 0;
++}
++
++static struct irda_platform_data collie_ir_data = {
++	.startup = collie_ir_startup,
++	.shutdown = collie_ir_shutdown,
++	.set_power = collie_ir_set_power,
++};
++
+ /*
+  * Collie AC IN
+  */
+@@ -323,6 +355,7 @@ static void __init collie_init(void)
+ 	sa11x0_register_mtd(&collie_flash_data, collie_flash_resources,
+ 			    ARRAY_SIZE(collie_flash_resources));
+ 	sa11x0_register_mcp(&collie_mcp_data);
++	sa11x0_register_irda(&collie_ir_data);
+ 
+ 	sharpsl_save_param();
+ }
+diff --git a/arch/arm/mach-sa1100/include/mach/collie.h b/arch/arm/mach-sa1100/include/mach/collie.h
+index f33679d..0ef22f9 100644
+--- a/arch/arm/mach-sa1100/include/mach/collie.h
++++ b/arch/arm/mach-sa1100/include/mach/collie.h
+@@ -78,7 +78,7 @@ extern void locomolcd_power(int on);
+ #define COLLIE_TC35143_GPIO_VERSION0    UCB_IO_0
+ #define COLLIE_TC35143_GPIO_TBL_CHK     UCB_IO_1
+ #define COLLIE_TC35143_GPIO_VPEN_ON     UCB_IO_2
+-#define COLLIE_TC35143_GPIO_IR_ON       UCB_IO_3
++#define COLLIE_GPIO_IR_ON		(COLLIE_TC35143_GPIO_BASE + 3)
+ #define COLLIE_TC35143_GPIO_AMP_ON      UCB_IO_4
+ #define COLLIE_TC35143_GPIO_VERSION1    UCB_IO_5
+ #define COLLIE_TC35143_GPIO_FS8KLPF     UCB_IO_5
+-- 
+1.8.4.rc3
+
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/fbdev-sa1100fb-make-use-of-device-clock.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/fbdev-sa1100fb-make-use-of-device-clock.patch
new file mode 100644
index 0000000..7460692
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/fbdev-sa1100fb-make-use-of-device-clock.patch
@@ -0,0 +1,115 @@
+From 14edf9123f62bbfbfbffe38e2837b51b3a6065b5 Mon Sep 17 00:00:00 2001
+From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+Date: Mon, 11 Nov 2013 22:58:02 +0400
+Subject: [PATCH 2/2] fbdev: sa1100fb: make use of device clock
+
+Use per-device clock (instead of calling cpufreq_get(0), which can
+return 0 if no cpu frequency driver is selected) to program timings.
+
+Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+---
+ drivers/video/sa1100fb.c | 24 +++++++++++++++++-------
+ drivers/video/sa1100fb.h |  1 +
+ 2 files changed, 18 insertions(+), 7 deletions(-)
+
+diff --git a/drivers/video/sa1100fb.c b/drivers/video/sa1100fb.c
+index de76da0..13d2c99 100644
+--- a/drivers/video/sa1100fb.c
++++ b/drivers/video/sa1100fb.c
+@@ -178,6 +178,7 @@
+ #include <linux/dma-mapping.h>
+ #include <linux/mutex.h>
+ #include <linux/io.h>
++#include <linux/clk.h>
+ 
+ #include <video/sa1100fb.h>
+ 
+@@ -413,9 +414,9 @@ sa1100fb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
+ 		var->transp.offset);
+ 
+ #ifdef CONFIG_CPU_FREQ
+-	dev_dbg(fbi->dev, "dma period = %d ps, clock = %d kHz\n",
++	dev_dbg(fbi->dev, "dma period = %d ps, clock = %ld kHz\n",
+ 		sa1100fb_display_dma_period(var),
+-		cpufreq_get(smp_processor_id()));
++		clk_get_rate(fbi->clk)/1000);
+ #endif
+ 
+ 	return 0;
+@@ -586,9 +587,10 @@ static struct fb_ops sa1100fb_ops = {
+  * Calculate the PCD value from the clock rate (in picoseconds).
+  * We take account of the PPCR clock setting.
+  */
+-static inline unsigned int get_pcd(unsigned int pixclock, unsigned int cpuclock)
++static inline unsigned int get_pcd(struct sa1100fb_info *fbi,
++		unsigned int pixclock)
+ {
+-	unsigned int pcd = cpuclock / 100;
++	unsigned int pcd = clk_get_rate(fbi->clk)/ 100 / 1000;
+ 
+ 	pcd *= pixclock;
+ 	pcd /= 10000000;
+@@ -667,7 +669,7 @@ static int sa1100fb_activate_var(struct fb_var_screeninfo *var, struct sa1100fb_
+ 		LCCR2_BegFrmDel(var->upper_margin) +
+ 		LCCR2_EndFrmDel(var->lower_margin);
+ 
+-	pcd = get_pcd(var->pixclock, cpufreq_get(0));
++	pcd = get_pcd(fbi, var->pixclock);
+ 	new_regs.lccr3 = LCCR3_PixClkDiv(pcd) | fbi->inf->lccr3 |
+ 		(var->sync & FB_SYNC_HOR_HIGH_ACT ? LCCR3_HorSnchH : LCCR3_HorSnchL) |
+ 		(var->sync & FB_SYNC_VERT_HIGH_ACT ? LCCR3_VrtSnchH : LCCR3_VrtSnchL);
+@@ -1003,7 +1005,6 @@ sa1100fb_freq_transition(struct notifier_block *nb, unsigned long val,
+ 			 void *data)
+ {
+ 	struct sa1100fb_info *fbi = TO_INF(nb, freq_transition);
+-	struct cpufreq_freqs *f = data;
+ 	u_int pcd;
+ 
+ 	switch (val) {
+@@ -1012,7 +1013,7 @@ sa1100fb_freq_transition(struct notifier_block *nb, unsigned long val,
+ 		break;
+ 
+ 	case CPUFREQ_POSTCHANGE:
+-		pcd = get_pcd(fbi->fb.var.pixclock, f->new);
++		pcd = get_pcd(fbi, fbi->fb.var.pixclock);
+ 		fbi->reg_lccr3 = (fbi->reg_lccr3 & ~0xff) | LCCR3_PixClkDiv(pcd);
+ 		set_ctrlr_state(fbi, C_ENABLE_CLKCHANGE);
+ 		break;
+@@ -1219,6 +1220,13 @@ static int sa1100fb_probe(struct platform_device *pdev)
+ 	if (!fbi)
+ 		goto failed;
+ 
++	fbi->clk = clk_get(&pdev->dev, NULL);
++	if (IS_ERR(fbi->clk)) {
++		ret = PTR_ERR(fbi->clk);
++		fbi->clk = NULL;
++		goto failed;
++	}
++
+ 	fbi->base = ioremap(res->start, resource_size(res));
+ 	if (!fbi->base)
+ 		goto failed;
+@@ -1271,6 +1279,8 @@ static int sa1100fb_probe(struct platform_device *pdev)
+  failed:
+ 	if (fbi)
+ 		iounmap(fbi->base);
++	if (fbi->clk)
++		clk_put(fbi->clk);
+ 	platform_set_drvdata(pdev, NULL);
+ 	kfree(fbi);
+ 	release_mem_region(res->start, resource_size(res));
+diff --git a/drivers/video/sa1100fb.h b/drivers/video/sa1100fb.h
+index fc5d429..0139d13 100644
+--- a/drivers/video/sa1100fb.h
++++ b/drivers/video/sa1100fb.h
+@@ -68,6 +68,7 @@ struct sa1100fb_info {
+ #endif
+ 
+ 	const struct sa1100fb_mach_info *inf;
++	struct clk *clk;
+ };
+ 
+ #define TO_INF(ptr,member)	container_of(ptr,struct sa1100fb_info,member)
+-- 
+1.8.4.2
+
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/pcmcia-clock-alias-sa1111.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/pcmcia-clock-alias-sa1111.patch
new file mode 100644
index 0000000..7005577
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/pcmcia-clock-alias-sa1111.patch
@@ -0,0 +1,31 @@
+From patchwork Tue Nov 12 03:32:11 2013
+Content-Type: text/plain; charset="utf-8"
+MIME-Version: 1.0
+Content-Transfer-Encoding: 7bit
+Subject: [4/5] arm: sa1100: add a clock alias for sa1111 pcmcia device
+From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+X-Patchwork-Id: 3170631
+Message-Id: <1384227132-10501-4-git-send-email-dbaryshkov@gmail.com>
+To: linux-arm-kernel@lists.infradead.org
+Cc: linux-fbdev@vger.kernel.org, linux-pcmcia@lists.infradead.org,
+	Russell King <linux@arm.linux.org.uk>
+Date: Tue, 12 Nov 2013 07:32:11 +0400
+
+Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+
+---
+arch/arm/mach-sa1100/clock.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/arch/arm/mach-sa1100/clock.c b/arch/arm/mach-sa1100/clock.c
+index abf1dc1..cd4762d 100644
+--- a/arch/arm/mach-sa1100/clock.c
++++ b/arch/arm/mach-sa1100/clock.c
+@@ -124,6 +124,7 @@ static struct clk_lookup sa11xx_clkregs[] = {
+ 	CLKDEV_INIT("sa1100-rtc", NULL, NULL),
+ 	CLKDEV_INIT("sa11x0-fb", NULL, &clk_cpu),
+ 	CLKDEV_INIT("sa11x0-pcmcia", NULL, &clk_cpu),
++	CLKDEV_INIT("1600", NULL, &clk_cpu), /* sa1111 pcmcia */
+ };
+ 
+ static int __init sa11xx_clk_init(void)
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/pcmcia-sa1100-device-clock.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/pcmcia-sa1100-device-clock.patch
new file mode 100644
index 0000000..1d12fc8
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/pcmcia-sa1100-device-clock.patch
@@ -0,0 +1,100 @@
+From patchwork Tue Nov 12 03:32:10 2013
+Content-Type: text/plain; charset="utf-8"
+MIME-Version: 1.0
+Content-Transfer-Encoding: 7bit
+Subject: [3/5] pcmcia: sa1100: make use of device clock
+From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+X-Patchwork-Id: 3170611
+Message-Id: <1384227132-10501-3-git-send-email-dbaryshkov@gmail.com>
+To: linux-arm-kernel@lists.infradead.org
+Cc: linux-fbdev@vger.kernel.org, linux-pcmcia@lists.infradead.org,
+	Russell King <linux@arm.linux.org.uk>
+Date: Tue, 12 Nov 2013 07:32:10 +0400
+
+Use per-device clock (instead of calling cpufreq_get(0), which can
+return 0 if no cpu frequency driver is selected) to program timings.
+
+Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+
+---
+drivers/pcmcia/sa1100_generic.c |  1 +
+ drivers/pcmcia/sa11xx_base.c    | 14 ++++++++++++--
+ 2 files changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/pcmcia/sa1100_generic.c b/drivers/pcmcia/sa1100_generic.c
+index ff8a027..d2ab060 100644
+--- a/drivers/pcmcia/sa1100_generic.c
++++ b/drivers/pcmcia/sa1100_generic.c
+@@ -93,6 +93,7 @@ static int sa11x0_drv_pcmcia_remove(struct platform_device *dev)
+ 	for (i = 0; i < sinfo->nskt; i++)
+ 		soc_pcmcia_remove_one(&sinfo->skt[i]);
+ 
++	clk_put(sinfo->clk);
+ 	kfree(sinfo);
+ 	return 0;
+ }
+diff --git a/drivers/pcmcia/sa11xx_base.c b/drivers/pcmcia/sa11xx_base.c
+index 6eecd7c..aef0e69 100644
+--- a/drivers/pcmcia/sa11xx_base.c
++++ b/drivers/pcmcia/sa11xx_base.c
+@@ -38,6 +38,7 @@
+ #include <linux/spinlock.h>
+ #include <linux/io.h>
+ #include <linux/slab.h>
++#include <linux/clk.h>
+ 
+ #include <mach/hardware.h>
+ #include <asm/irq.h>
+@@ -138,14 +139,15 @@ sa1100_pcmcia_frequency_change(struct soc_pcmcia_socket *skt,
+ static int
+ sa1100_pcmcia_set_timing(struct soc_pcmcia_socket *skt)
+ {
+-	return sa1100_pcmcia_set_mecr(skt, cpufreq_get(0));
++	unsigned long clk = clk_get_rate(skt->clk);
++	return sa1100_pcmcia_set_mecr(skt, clk / 1000);
+ }
+ 
+ static int
+ sa1100_pcmcia_show_timing(struct soc_pcmcia_socket *skt, char *buf)
+ {
+ 	struct soc_pcmcia_timing timing;
+-	unsigned int clock = cpufreq_get(0);
++	unsigned int clock = clk_get_rate(skt->clk);
+ 	unsigned long mecr = MECR;
+ 	char *p = buf;
+ 
+@@ -221,6 +223,11 @@ int sa11xx_drv_pcmcia_probe(struct device *dev, struct pcmcia_low_level *ops,
+ 	struct skt_dev_info *sinfo;
+ 	struct soc_pcmcia_socket *skt;
+ 	int i, ret = 0;
++	struct clk *clk;
++
++	clk = clk_get(dev, NULL);
++	if (IS_ERR(clk))
++		return -ENODEV;
+ 
+ 	sa11xx_drv_pcmcia_ops(ops);
+ 
+@@ -229,12 +236,14 @@ int sa11xx_drv_pcmcia_probe(struct device *dev, struct pcmcia_low_level *ops,
+ 		return -ENOMEM;
+ 
+ 	sinfo->nskt = nr;
++	sinfo->clk = clk;
+ 
+ 	/* Initialize processor specific parameters */
+ 	for (i = 0; i < nr; i++) {
+ 		skt = &sinfo->skt[i];
+ 
+ 		skt->nr = first + i;
++		skt->clk = clk;
+ 		soc_pcmcia_init_one(skt, ops, dev);
+ 
+ 		ret = sa11xx_drv_pcmcia_add_one(skt);
+@@ -245,6 +254,7 @@ int sa11xx_drv_pcmcia_probe(struct device *dev, struct pcmcia_low_level *ops,
+ 	if (ret) {
+ 		while (--i >= 0)
+ 			soc_pcmcia_remove_one(&sinfo->skt[i]);
++		clk_put(clk);
+ 		kfree(sinfo);
+ 	} else {
+ 		dev_set_drvdata(dev, sinfo);
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/pcmcia-sa1111-device-clock.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/pcmcia-sa1111-device-clock.patch
new file mode 100644
index 0000000..57468fc
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/pcmcia-sa1111-device-clock.patch
@@ -0,0 +1,44 @@
+From patchwork Tue Nov 12 03:32:12 2013
+Content-Type: text/plain; charset="utf-8"
+MIME-Version: 1.0
+Content-Transfer-Encoding: 7bit
+Subject: [5/5] pcmcia: sa1111: make use of device clock
+From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+X-Patchwork-Id: 3170621
+Message-Id: <1384227132-10501-5-git-send-email-dbaryshkov@gmail.com>
+To: linux-arm-kernel@lists.infradead.org
+Cc: linux-fbdev@vger.kernel.org, linux-pcmcia@lists.infradead.org,
+	Russell King <linux@arm.linux.org.uk>
+Date: Tue, 12 Nov 2013 07:32:12 +0400
+
+Use per-device clock (instead of calling cpufreq_get(0), which can
+return 0 if no cpu frequency driver is selected) to program timings.
+
+Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+
+---
+drivers/pcmcia/sa1111_generic.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/drivers/pcmcia/sa1111_generic.c b/drivers/pcmcia/sa1111_generic.c
+index 65b02c3..c5988be 100644
+--- a/drivers/pcmcia/sa1111_generic.c
++++ b/drivers/pcmcia/sa1111_generic.c
+@@ -145,6 +145,9 @@ int sa1111_pcmcia_add(struct sa1111_dev *dev, struct pcmcia_low_level *ops,
+ 			return -ENOMEM;
+ 
+ 		s->soc.nr = ops->first + i;
++		s->soc.clk = clk_get(&dev->dev, NULL);
++		if (IS_ERR(s->soc.clk))
++			return -ENODEV;
+ 		soc_pcmcia_init_one(&s->soc, ops, &dev->dev);
+ 		s->dev = dev;
+ 		if (s->soc.nr) {
+@@ -220,6 +223,7 @@ static int pcmcia_remove(struct sa1111_dev *dev)
+ 	for (; s; s = next) {
+ 		next = s->next;
+ 		soc_pcmcia_remove_one(&s->soc);
++		clk_put(s->soc.clk);
+ 		kfree(s);
+ 	}
+ 
-- 
1.8.1.5


