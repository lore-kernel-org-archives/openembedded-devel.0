Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id D62B7782A4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Sep 2017 20:21:41 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id e64so7066979wmi.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Sep 2017 13:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=43onV6It/u1YKpBdJ3HEJ47qJ1bgqZv8UWDRWL6QXOU=;
	b=YzgsI7deyLRwciGo+h4COCK3Y+NtbsyVwKFI+B8BsbUZA/2O+v6sdXaG4NWPAB1OVr
	UXTLnsj/7KhgyNXZVniBzyimu1TeRaEwgV/BEWJ1uum2gHHT0MBOa6Ye9aCqaOa6P791
	P4cJ3nohiPopMkd+FxnLbkdFT2dK9As7kf/oA6PtBaptzvEjLrnebuEBNt5HzuCYFPo9
	huLRd5krZAnYXPbW+HMUZSgItVQen+n9xht1EuzfvQ5VN9hGd1KdsqGhQYZEO6+iKBTn
	KCnULFT3y3E2wDN+1M6OIogunyBc4dtRLVDCpygCZtF6O/PiR2HMiPCDmaGZg2+j3+Uv
	4+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=43onV6It/u1YKpBdJ3HEJ47qJ1bgqZv8UWDRWL6QXOU=;
	b=DKd6eOJbAKBqTVykamKu8pe703pTa0Jbc7reM2wU50lKiEErcSAEdvZWr0I6AgGnfl
	8ewNsTLYRjk29Btf+3pfEdOFNkKpcPcooTf3kGd/+NTJqhVkB/od8aRzQQtCCcl/QC/q
	AgRK18/ZFhJKO7TQiX37UXGG/IRipXanlTRHvIO15YmnSLq9rY+iKAzbPNV37N4cWaUj
	/+BRFm/lXpgB2t6qYWZQZAWf++H5s8tIUoTvX3WSOHTJ+JOMYoX1LgV1jHumHg6Arb9d
	YtNF6488u20s4yQfkG/qkD0rAs99O9Cm4OMprCtmSWWMMqguyMzC5gv5cmabs8uorcqB
	h6ug==
X-Gm-Message-State: AHPjjUjKxOEKRFFfFl5bYMqgZlev4SKQUhSECcFS+P89qSz39mKXrcsr
	4lMvqNdmt9AhOf5AepOBY96cNg==
X-Google-Smtp-Source: AOwi7QBHunOIMGJFoFvFO3JMy2ixnd/nSt/mjDXMjMqA7hyumgRAA4SbJ82DRLWqKacnM8xxbxTF1w==
X-Received: by 10.28.150.195 with SMTP id y186mr7527861wmd.52.1505679702418;
	Sun, 17 Sep 2017 13:21:42 -0700 (PDT)
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it
	(host224-10-dynamic.249-95-r.retail.telecomitalia.it.
	[95.249.10.224]) by smtp.gmail.com with ESMTPSA id
	q19sm5833025wrb.17.2017.09.17.13.21.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Sep 2017 13:21:41 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Sep 2017 22:21:29 +0200
Message-Id: <1505679691-3610-3-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505679691-3610-1-git-send-email-andrea.adami@gmail.com>
References: <1505679691-3610-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 3/5] linux-handheld(-kexecoot)_4.4: update to 4.4.88 stable patchset
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
X-List-Received-Date: Sun, 17 Sep 2017 20:21:42 -0000

Note: patchset 4.4.9 introduced a pxa breakage: instead of reverting
"94d75e190f1 dmaengine: pxa_dma: fix the maximum requestor line"
we backport from 4.6 the missing patches.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 ...pxa-add-the-number-of-DMA-requestor-lines.patch | 122 +++++++++++++++++++++
 ...pxa-fix-the-number-of-DMA-requestor-lines.patch |  28 +++++
 recipes-kernel/linux/linux-handheld_4.4.bb         |   9 +-
 3 files changed, 156 insertions(+), 3 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/ARM-pxa-add-the-number-of-DMA-requestor-lines.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/ARM-pxa-fix-the-number-of-DMA-requestor-lines.patch

diff --git a/recipes-kernel/linux/linux-handheld-4.4/ARM-pxa-add-the-number-of-DMA-requestor-lines.patch b/recipes-kernel/linux/linux-handheld-4.4/ARM-pxa-add-the-number-of-DMA-requestor-lines.patch
new file mode 100644
index 0000000..f6a7a70
--- /dev/null
+++ b/recipes-kernel/linux/linux-handheld-4.4/ARM-pxa-add-the-number-of-DMA-requestor-lines.patch
@@ -0,0 +1,122 @@
+From 72b195cb716284217e8b270af420bc7e5cf04b3c Mon Sep 17 00:00:00 2001
+From: Robert Jarzmik <robert.jarzmik@free.fr>
+Date: Mon, 15 Feb 2016 21:57:47 +0100
+Subject: ARM: pxa: add the number of DMA requestor lines
+
+Declare the number of DMA requestor lines per platform :
+ - for pxa25x: 40 requestor lines
+ - for pxa27x: 75 requestor lines
+ - for pxa3xx: 100 requestor lines
+
+This information will be used to activate the DMA flow control or not.
+
+Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
+---
+ arch/arm/boot/dts/pxa27x.dtsi        | 1 +
+ arch/arm/boot/dts/pxa3xx.dtsi        | 1 +
+ arch/arm/mach-pxa/devices.c          | 3 ++-
+ arch/arm/mach-pxa/pxa25x.c           | 2 +-
+ arch/arm/mach-pxa/pxa27x.c           | 2 +-
+ arch/arm/mach-pxa/pxa3xx.c           | 2 +-
+ arch/arm/plat-pxa/include/plat/dma.h | 2 +-
+ 7 files changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/arch/arm/boot/dts/pxa27x.dtsi b/arch/arm/boot/dts/pxa27x.dtsi
+index 7f68a1e..210192c 100644
+--- a/arch/arm/boot/dts/pxa27x.dtsi
++++ b/arch/arm/boot/dts/pxa27x.dtsi
+@@ -13,6 +13,7 @@
+ 			interrupts = <25>;
+ 			#dma-channels = <32>;
+ 			#dma-cells = <2>;
++			#dma-requests = <75>;
+ 			status = "okay";
+ 		};
+ 
+diff --git a/arch/arm/boot/dts/pxa3xx.dtsi b/arch/arm/boot/dts/pxa3xx.dtsi
+index cf6998a..bea454f 100644
+--- a/arch/arm/boot/dts/pxa3xx.dtsi
++++ b/arch/arm/boot/dts/pxa3xx.dtsi
+@@ -12,6 +12,7 @@
+ 			interrupts = <25>;
+ 			#dma-channels = <32>;
+ 			#dma-cells = <2>;
++			#dma-requests = <100>;
+ 			status = "okay";
+ 		};
+ 
+diff --git a/arch/arm/mach-pxa/devices.c b/arch/arm/mach-pxa/devices.c
+index 37d8d85..913a319 100644
+--- a/arch/arm/mach-pxa/devices.c
++++ b/arch/arm/mach-pxa/devices.c
+@@ -1203,6 +1203,7 @@ void __init pxa2xx_set_spi_info(unsigned id, struct pxa2xx_spi_master *info)
+ 
+ static struct mmp_dma_platdata pxa_dma_pdata = {
+ 	.dma_channels	= 0,
++	.nb_requestors	= 0,
+ };
+ 
+ static struct resource pxa_dma_resource[] = {
+@@ -1231,7 +1232,7 @@ static struct platform_device pxa2xx_pxa_dma = {
+ 	.resource	= pxa_dma_resource,
+ };
+ 
+-void __init pxa2xx_set_dmac_info(int nb_channels)
++void __init pxa2xx_set_dmac_info(int nb_channels, int nb_requestors)
+ {
+ 	pxa_dma_pdata.dma_channels = nb_channels;
+ 	pxa_register_device(&pxa2xx_pxa_dma, &pxa_dma_pdata);
+diff --git a/arch/arm/mach-pxa/pxa25x.c b/arch/arm/mach-pxa/pxa25x.c
+index a177bf4..823504f 100644
+--- a/arch/arm/mach-pxa/pxa25x.c
++++ b/arch/arm/mach-pxa/pxa25x.c
+@@ -206,7 +206,7 @@ static int __init pxa25x_init(void)
+ 		register_syscore_ops(&pxa_irq_syscore_ops);
+ 		register_syscore_ops(&pxa2xx_mfp_syscore_ops);
+ 
+-		pxa2xx_set_dmac_info(16);
++		pxa2xx_set_dmac_info(16, 40);
+ 		pxa_register_device(&pxa25x_device_gpio, &pxa25x_gpio_info);
+ 		ret = platform_add_devices(pxa25x_devices,
+ 					   ARRAY_SIZE(pxa25x_devices));
+diff --git a/arch/arm/mach-pxa/pxa27x.c b/arch/arm/mach-pxa/pxa27x.c
+index 49c7359..2eaa341 100644
+--- a/arch/arm/mach-pxa/pxa27x.c
++++ b/arch/arm/mach-pxa/pxa27x.c
+@@ -311,7 +311,7 @@ static int __init pxa27x_init(void)
+ 		if (!of_have_populated_dt()) {
+ 			pxa_register_device(&pxa27x_device_gpio,
+ 					    &pxa27x_gpio_info);
+-			pxa2xx_set_dmac_info(32);
++			pxa2xx_set_dmac_info(32, 75);
+ 			ret = platform_add_devices(devices,
+ 						   ARRAY_SIZE(devices));
+ 		}
+diff --git a/arch/arm/mach-pxa/pxa3xx.c b/arch/arm/mach-pxa/pxa3xx.c
+index 126c265..3c9184d 100644
+--- a/arch/arm/mach-pxa/pxa3xx.c
++++ b/arch/arm/mach-pxa/pxa3xx.c
+@@ -449,7 +449,7 @@ static int __init pxa3xx_init(void)
+ 		if (of_have_populated_dt())
+ 			return 0;
+ 
+-		pxa2xx_set_dmac_info(32);
++		pxa2xx_set_dmac_info(32, 100);
+ 		ret = platform_add_devices(devices, ARRAY_SIZE(devices));
+ 		if (ret)
+ 			return ret;
+diff --git a/arch/arm/plat-pxa/include/plat/dma.h b/arch/arm/plat-pxa/include/plat/dma.h
+index 28848b3..ceba3e4 100644
+--- a/arch/arm/plat-pxa/include/plat/dma.h
++++ b/arch/arm/plat-pxa/include/plat/dma.h
+@@ -95,6 +95,6 @@ static inline int pxad_toggle_reserved_channel(int legacy_channel)
+ }
+ #endif
+ 
+-extern void __init pxa2xx_set_dmac_info(int nb_channels);
++extern void __init pxa2xx_set_dmac_info(int nb_channels, int nb_requestors);
+ 
+ #endif /* __PLAT_DMA_H */
+-- 
+cgit v1.1
+
diff --git a/recipes-kernel/linux/linux-handheld-4.4/ARM-pxa-fix-the-number-of-DMA-requestor-lines.patch b/recipes-kernel/linux/linux-handheld-4.4/ARM-pxa-fix-the-number-of-DMA-requestor-lines.patch
new file mode 100644
index 0000000..78b1707
--- /dev/null
+++ b/recipes-kernel/linux/linux-handheld-4.4/ARM-pxa-fix-the-number-of-DMA-requestor-lines.patch
@@ -0,0 +1,28 @@
+From 4c35430ad18f5a034302cb90e559ede5a27f93b9 Mon Sep 17 00:00:00 2001
+From: Robert Jarzmik <robert.jarzmik@free.fr>
+Date: Wed, 9 Mar 2016 00:46:11 +0100
+Subject: ARM: pxa: fix the number of DMA requestor lines
+
+The number of requestor lines was clamped to 0 for all pxa architectures
+in the requestor declaration. Fix this by using the value.
+
+Fixes: 72b195cb7162 ("ARM: pxa: add the number of DMA requestor lines")
+Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
+---
+ arch/arm/mach-pxa/devices.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/arch/arm/mach-pxa/devices.c b/arch/arm/mach-pxa/devices.c
+index 913a319..fffb697 100644
+--- a/arch/arm/mach-pxa/devices.c
++++ b/arch/arm/mach-pxa/devices.c
+@@ -1235,5 +1235,6 @@ static struct platform_device pxa2xx_pxa_dma = {
+ void __init pxa2xx_set_dmac_info(int nb_channels, int nb_requestors)
+ {
+ 	pxa_dma_pdata.dma_channels = nb_channels;
++	pxa_dma_pdata.nb_requestors = nb_requestors;
+ 	pxa_register_device(&pxa2xx_pxa_dma, &pxa_dma_pdata);
+ }
+-- 
+cgit v1.1
+
diff --git a/recipes-kernel/linux/linux-handheld_4.4.bb b/recipes-kernel/linux/linux-handheld_4.4.bb
index a7c158e..2d05a8d 100644
--- a/recipes-kernel/linux/linux-handheld_4.4.bb
+++ b/recipes-kernel/linux/linux-handheld_4.4.bb
@@ -6,16 +6,19 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 COMPATIBLE_MACHINE = "akita|c7x0|collie|h3600|hx4700|poodle|spitz|tosa"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/v4.x/linux-${PV}.tar.xz;name=kernel \
-           ${KERNELORG_MIRROR}/linux/kernel/v4.x/patch-${PV}.72.xz;apply=yes;name=stablepatch \
+           ${KERNELORG_MIRROR}/linux/kernel/v4.x/patch-${PV}.88.xz;apply=yes;name=stablepatch \
            "
 SRC_URI[kernel.md5sum] = "9a78fa2eb6c68ca5a40ed5af08142599"
 SRC_URI[kernel.sha256sum] = "401d7c8fef594999a460d10c72c5a94e9c2e1022f16795ec51746b0d165418b2"
-SRC_URI[stablepatch.md5sum] = "706589ba15cc3b1635c8bb1bc8938b14"
-SRC_URI[stablepatch.sha256sum] = "9343e9452502827dd92b9fc466861f48753e131167c92a008cc28e8b40a27e2b"
+SRC_URI[stablepatch.md5sum] = "75ccbff8259c935ca8c7dd54b2effb15"
+SRC_URI[stablepatch.sha256sum] = "76587e18bba591e4e6e95dec85a892072f143ae3757a471fd64d149bacbe06ad"
 
 SRC_URI += "\
            file://ASoC-pxa-fix-module-autoload-for-platform-drivers.patch \
            file://dmaengine-mmp-pdma-add-number-of-requestors.patch \
+           file://ARM-pxa-add-the-number-of-DMA-requestor-lines.patch \
+           file://ARM-pxa-fix-the-number-of-DMA-requestor-lines.patch \
+           \
            file://sharpslpart/0001-mtd-sharpsl-add-sharpslpart-MTD-partition-parser.patch \
            file://sharpslpart/0002-mtd-nand-sharpsl.c-prefer-sharpslpart-MTD-partition-.patch \
            file://sharpslpart/0003-mtd-nand-tmio_nand.c-prefer-sharpslpart-MTD-partitio.patch \
-- 
2.7.4


