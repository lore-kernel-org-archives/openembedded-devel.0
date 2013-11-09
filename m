Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id E51426D13F
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Nov 2013 18:02:15 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id t10so1596698eei.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Nov 2013 10:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=O1Oe56cuKsNbHDAN1iF43cMk217s2qGDBUsuSNT4tAk=;
	b=kyAmmPubc2IF0uABCtZy40H64qRmMzGidjp7gSDmgMAZv7enkWa3yzO/ttRjuM3s1w
	RcxQ/VAPGVj2xa+6MMPvNuX4DDkTmTAxnCCtF3QEVabuJZC7Ogt5UlsboG8BkFTse/UY
	9SeCEWXbvmV0t32/ravIme8jZBu2LM3HHSLSJ6QmmWXl3CqynZhJiW27au5+i7FkaLgZ
	xqpRSwEagNhq7FkUSFMbyp1p/383gANsf7aWcZiZGCw0oJ2wXSTjghUYI1y2Rlt6nve7
	/eeuE4IJDvDEowxCXQOTohbr/bghfNGFesiptbcW/bF+iGUkAZTOt6r1/s66YHorSw39
	ritg==
X-Received: by 10.14.106.131 with SMTP id m3mr1419eeg.94.1384020136681;
	Sat, 09 Nov 2013 10:02:16 -0800 (PST)
Received: from mizar.localdomain
	(host48-255-dynamic.0-79-r.retail.telecomitalia.it. [79.0.255.48])
	by mx.google.com with ESMTPSA id z1sm38784380eeo.14.2013.11.09.10.02.15
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Nov 2013 10:02:16 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Nov 2013 19:02:07 +0100
Message-Id: <1384020128-15779-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-handheld][PATCH] linux-yocto: collie: add platform data for IrDA
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
X-List-Received-Date: Sat, 09 Nov 2013 18:02:17 -0000

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-yocto-3.10/collie/collie.scc       |  1 +
 .../patches/patches-sa1100/collie-irda.patch       | 88 ++++++++++++++++++++++
 2 files changed, 89 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-sa1100/collie-irda.patch

diff --git a/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc b/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc
index 3b9b55a..f66b7be 100644
--- a/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc
+++ b/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc
@@ -11,3 +11,4 @@ patch ../patches/patches-mtd/collie-eraseinfo.patch
 patch ../patches/patches-mtd/collie-force-cfi.patch
 patch ../patches/patches-mtd/collie-mtd-resize.patch
 patch ../patches/patches-mtd/collie-force-unlock.patch
+patch ../patches/patches-sa1100/collie-irda.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.10/patches/patches-sa1100/collie-irda.patch b/recipes-kernel/linux/linux-yocto-3.10/patches/patches-sa1100/collie-irda.patch
new file mode 100644
index 0000000..46ad808
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.10/patches/patches-sa1100/collie-irda.patch
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
-- 
1.8.1.5


