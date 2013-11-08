Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4879D6D68A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2013 01:02:59 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id e53so687859eek.28
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Nov 2013 17:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=jLUycVNQpDM3ysYZ2Fl2VZ6ywu0ydzDR1t00hJgFniQ=;
	b=kR4xzvBmMTN2RrH79CVo3/82aTJiLCxOWcYEGPQdmKcXfIhOtIG154eEu7Ru2KDqb3
	iDp1dr1DUwaghOl604BZ7UDpeq/SuNjvt05XSQkE63h1IFdKXszBipTWhxsfOKgpzfuT
	SN5TPtoQUzbvpBKjAcz59ikqEcE052u+LhpVhPDaoH6pzobv1H5Uhig0adWQs/tPjaDU
	Xx40uianf2S6MCIATEjmhE14Aph/UgPqteEth9ihKpI8ECKlmSCHTvwoSEcX42gJYBWO
	RMTNg43OACaonYldLEhAaCgHbEQf8n3wb33VV4noJ1iz5k8FG4kEqW/Fff34X7c+dnWe
	Atug==
X-Received: by 10.15.94.201 with SMTP id bb49mr12682259eeb.23.1383872580848;
	Thu, 07 Nov 2013 17:03:00 -0800 (PST)
Received: from mizar.localdomain
	(host33-1-dynamic.51-79-r.retail.telecomitalia.it. [79.51.1.33])
	by mx.google.com with ESMTPSA id
	v45sm15949739eef.11.2013.11.07.17.03.00 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Nov 2013 17:03:00 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Nov 2013 02:02:32 +0100
Message-Id: <3a51a7ebd7863c9aef0d17e53910e5d954363128.1383870605.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <cover.1383870605.git.andrea.adami@gmail.com>
References: <cover.1383870605.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1383870605.git.andrea.adami@gmail.com>
References: <cover.1383870605.git.andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 5/6] linux-yocto: collie: resize MTD to SZ_16M
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
X-List-Received-Date: Fri, 08 Nov 2013 01:02:59 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-yocto-3.10/collie/collie.scc       |  1 +
 .../patches/patches-mtd/collie-mtd-resize.patch    | 41 ++++++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-mtd-resize.patch

diff --git a/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc b/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc
index 536f4b1..fb904ed 100644
--- a/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc
+++ b/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc
@@ -9,3 +9,4 @@ patch ../patches/patches-mfd/ucb1x00-device.patch
 //patch ../patches/patches-mtd/collie-jedec-probe.patch
 patch ../patches/patches-mtd/collie-eraseinfo.patch
 patch ../patches/patches-mtd/collie-force-cfi.patch
+patch ../patches/patches-mtd/collie-mtd-resize.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-mtd-resize.patch b/recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-mtd-resize.patch
new file mode 100644
index 0000000..ba52d2f
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-mtd-resize.patch
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
-- 
1.8.1.5


