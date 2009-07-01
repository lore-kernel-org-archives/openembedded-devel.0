Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MM59N-0003DK-4u
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 21:07:21 +0200
Received: (qmail 32764 invoked by uid 813007); 1 Jul 2009 18:55:25 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 1 Jul 2009 18:55:25 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jul 2009 20:55:17 +0200
Message-Id: <1246474518-16737-19-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <200907011819.54127.marcin@juszkiewicz.com.pl>
References: <200907011819.54127.marcin@juszkiewicz.com.pl>
Cc: Marcin Juszkiewicz <hrw@openembedded.org>
Subject: [STABLE][PATCH 124/125] linux: make 2.6.29 default for ep93xx (tested on edb9301)
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
X-List-Received-Date: Wed, 01 Jul 2009 19:07:21 -0000

From: Marcin Juszkiewicz <hrw@openembedded.org>

- added EDB9301 support (from LAKML)
- hacked machine ID of EDB9301 (board here has other then official one)

Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 .../linux/linux-2.6.29/ep93xx/add-edb9301.patch    |  112 ++++++++++++++++++++
 .../ep93xx/edb9301-fix-machine-id.patch            |   19 ++++
 recipes/linux/linux_2.6.29.bb                      |    5 +
 3 files changed, 136 insertions(+), 0 deletions(-)
 create mode 100644 recipes/linux/linux-2.6.29/ep93xx/add-edb9301.patch
 create mode 100644 recipes/linux/linux-2.6.29/ep93xx/edb9301-fix-machine-id.patch

diff --git a/recipes/linux/linux-2.6.29/ep93xx/add-edb9301.patch b/recipes/linux/linux-2.6.29/ep93xx/add-edb9301.patch
new file mode 100644
index 0000000..48e7c18
--- /dev/null
+++ b/recipes/linux/linux-2.6.29/ep93xx/add-edb9301.patch
@@ -0,0 +1,112 @@
+Add Cirrus Logic EDB9301 Dev Board to arch/arm/mach-ep93xx
+
+Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
+
+---
+
+diff --git a/arch/arm/mach-ep93xx/Kconfig b/arch/arm/mach-ep93xx/Kconfig
+index 56bddce..9ca8974 100644
+--- a/arch/arm/mach-ep93xx/Kconfig
++++ b/arch/arm/mach-ep93xx/Kconfig
+@@ -15,6 +15,12 @@ config MACH_ADSSPHERE
+ 	  Say 'Y' here if you want your kernel to support the ADS
+ 	  Sphere board.
+
++config MACH_EDB9301
++	bool "Support Cirrus Logic EDB9301"
++	help
++	  Say 'Y' here if you want your kernel to support the Cirrus
++	  Logic EDB9301 Evaluation Board.
++
+ config MACH_EDB9302
+ 	bool "Support Cirrus Logic EDB9302"
+ 	help
+diff --git a/arch/arm/mach-ep93xx/Makefile
+b/arch/arm/mach-ep93xx/Makefile
+index 944e42d..7e7536f 100644
+--- a/arch/arm/mach-ep93xx/Makefile
++++ b/arch/arm/mach-ep93xx/Makefile
+@@ -7,6 +7,7 @@ obj-n			:=
+ obj-			:=
+
+ obj-$(CONFIG_MACH_ADSSPHERE)	+= adssphere.o
++obj-$(CONFIG_MACH_EDB9301)	+= edb9301.o
+ obj-$(CONFIG_MACH_EDB9302)	+= edb9302.o
+ obj-$(CONFIG_MACH_EDB9302A)	+= edb9302a.o
+ obj-$(CONFIG_MACH_EDB9307)	+= edb9307.o
+diff --git a/arch/arm/mach-ep93xx/edb9301.c
+b/arch/arm/mach-ep93xx/edb9301.c
+new file mode 100644
+index 0000000..4108c7c
+--- /dev/null
++++ b/arch/arm/mach-ep93xx/edb9301.c
+@@ -0,0 +1,68 @@
++/*
++ * arch/arm/mach-ep93xx/edb9301.c
++ * Cirrus Logic EDB9301 support.
++ *
++ * Copyright (C) 2009 H Hartley Sweeten <hsweeten@visionengravers.com>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or (at
++ * your option) any later version.
++ */
++
++#include <linux/kernel.h>
++#include <linux/init.h>
++#include <linux/mm.h>
++#include <linux/sched.h>
++#include <linux/interrupt.h>
++#include <linux/ioport.h>
++#include <linux/mtd/physmap.h>
++#include <linux/platform_device.h>
++#include <linux/io.h>
++#include <linux/i2c.h>
++#include <mach/hardware.h>
++#include <asm/mach-types.h>
++#include <asm/mach/arch.h>
++
++static struct physmap_flash_data edb9301_flash_data = {
++	.width		= 2,
++};
++
++static struct resource edb9301_flash_resource = {
++	.start		= EP93XX_CS6_PHYS_BASE,
++	.end		= EP93XX_CS6_PHYS_BASE + SZ_16M - 1,
++	.flags		= IORESOURCE_MEM,
++};
++
++static struct platform_device edb9301_flash = {
++	.name		= "physmap-flash",
++	.id		= 0,
++	.dev		= {
++		.platform_data	= &edb9301_flash_data,
++	},
++	.num_resources	= 1,
++	.resource	= &edb9301_flash_resource,
++};
++
++static struct ep93xx_eth_data edb9301_eth_data = {
++	.phy_id		= 1,
++};
++
++static void __init edb9301_init_machine(void)
++{
++	ep93xx_init_devices();
++	platform_device_register(&edb9301_flash);
++
++	ep93xx_register_eth(&edb9301_eth_data, 1);
++}
++
++MACHINE_START(EDB9301, "Cirrus Logic EDB9301 Evaluation Board")
++	/* Maintainer: H Hartley Sweeten <hsweeten@visionengravers.com> */
++	.phys_io	= EP93XX_APB_PHYS_BASE,
++	.io_pg_offst	= ((EP93XX_APB_VIRT_BASE) >> 18) & 0xfffc,
++	.boot_params	= EP93XX_SDCE3_PHYS_BASE_SYNC + 0x100,
++	.map_io		= ep93xx_map_io,
++	.init_irq	= ep93xx_init_irq,
++	.timer		= &ep93xx_timer,
++	.init_machine	= edb9301_init_machine,
++MACHINE_END 
+
diff --git a/recipes/linux/linux-2.6.29/ep93xx/edb9301-fix-machine-id.patch b/recipes/linux/linux-2.6.29/ep93xx/edb9301-fix-machine-id.patch
new file mode 100644
index 0000000..65bfc9b
--- /dev/null
+++ b/recipes/linux/linux-2.6.29/ep93xx/edb9301-fix-machine-id.patch
@@ -0,0 +1,19 @@
+---
+ arch/arm/tools/mach-types |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- linux-2.6.29.orig/arch/arm/tools/mach-types
++++ linux-2.6.29/arch/arm/tools/mach-types
+@@ -473,11 +473,11 @@ hawk			MACH_HAWK		HAWK			456
+ ccat91sbc001		MACH_CCAT91SBC001	CCAT91SBC001		457
+ expresso		MACH_EXPRESSO		EXPRESSO		458
+ h4000			MACH_H4000		H4000			459
+ dino			MACH_DINO		DINO			460
+ ml675k			MACH_ML675K		ML675K			461
+-edb9301			MACH_EDB9301		EDB9301			462
++edb9301			MACH_EDB9301		EDB9301			454
+ edb9315			MACH_EDB9315		EDB9315			463
+ reciva_tt		MACH_RECIVA_TT		RECIVA_TT		464
+ cstcb01			MACH_CSTCB01		CSTCB01			465
+ cstcb1			MACH_CSTCB1		CSTCB1			466
+ shadwell		MACH_SHADWELL		SHADWELL		467
diff --git a/recipes/linux/linux_2.6.29.bb b/recipes/linux/linux_2.6.29.bb
index 2d2be7a..f889ffc 100644
--- a/recipes/linux/linux_2.6.29.bb
+++ b/recipes/linux/linux_2.6.29.bb
@@ -9,6 +9,7 @@ DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_tosa = "1"
 DEFAULT_PREFERENCE_vortex86sx = "1"
 DEFAULT_PREFERENCE_atngw100 = "1"
+DEFAULT_PREFERENCE_ep93xx = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.29.tar.bz2 \
            file://defconfig"
@@ -18,3 +19,7 @@ SRC_URI_append_tosa = " \
 	file://0002-spi-pxa2xx-spi-set-default-cs_control-to-null_cs_co.patch;patch=1 \
 	"
 
+SRC_URI_append_ep93xx = " \
+       file://add-edb9301.patch;patch=1 \
+       file://edb9301-fix-machine-id.patch;patch=1 \
+       "
-- 
1.6.3.1





