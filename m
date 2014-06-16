Return-Path: <andrea.adami@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 08EBF6FE97
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jun 2014 22:22:22 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id n15so4834022wiw.17
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jun 2014 15:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=6DlLkZ5e7jCCjDVVCNy5u9L5IOcZVKjYM2S6tIvr+eI=;
	b=xla9v9i8qGSP0MQT1Wdla6V/DX5ipr/cd2AWWEt0wvZ3MqnoaN2tnBSoe6r5xOC/pm
	NT+BZLUx6/U3B9slF8iprtBJlp1pKxEMBvo8wQI0GDljJ5hJbhmyfl2fG56fk2mL5+z3
	v3FKXiu35VwrmOUm4Av4AjBd3h77g2xlSCKfTGbEdPYuae4kQC0WRwj6uQ3Y9ZiKh5PR
	DPJp1VLBk8eOhvQy7cZjeArlZc+Mi7i1nFzUBRe9uJvW81TPwwbTmfs44R/lnpXPBq8P
	RuhkGj1Mja2LTteX0j3eNgNzuUN1unNzOVSEL3q9xJl1bnWOB3/9N1kw/aNclz6fXYXO
	EOGw==
X-Received: by 10.194.22.100 with SMTP id c4mr8031421wjf.89.1402957343757;
	Mon, 16 Jun 2014 15:22:23 -0700 (PDT)
Received: from mizar.208.67.220.220
	(host103-90-dynamic.45-79-r.retail.telecomitalia.it. [79.45.90.103])
	by mx.google.com with ESMTPSA id
	v45sm36829464eeg.29.2014.06.16.15.22.22 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Jun 2014 15:22:23 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Jun 2014 00:22:13 +0200
Message-Id: <3ac7e1a9ead421e0c5563e0beb4e6f45f9c59d16.1402956940.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1402956940.git.andrea.adami@gmail.com>
References: <cover.1402956940.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1402956940.git.andrea.adami@gmail.com>
References: <cover.1402956940.git.andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 3/3] linux-yocto: refresh collie-LH28F640BF patch
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
X-List-Received-Date: Mon, 16 Jun 2014 22:22:26 -0000

as sent upstream

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../patches/patches-mtd/collie-LH28F640BF.patch    | 82 ++++++----------------
 .../collie/collie-LH28F640BF.patch                 | 82 ++++++----------------
 2 files changed, 42 insertions(+), 122 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-LH28F640BF.patch b/recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-LH28F640BF.patch
index fca51d5..ce3e1b9 100644
--- a/recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-LH28F640BF.patch
+++ b/recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-LH28F640BF.patch
@@ -1,27 +1,27 @@
-From 12402bf48cf2494a65aac0cf1e55cdc6296691bc Mon Sep 17 00:00:00 2001
+From 4a141aadc97f6493d3af58238acb681c41ef496d Mon Sep 17 00:00:00 2001
 From: Andrea Adami <andrea.adami@gmail.com>
-Date: Sun, 6 Apr 2014 21:21:22 +0200
-Subject: [PATCH] mtd: add support for Sharp LH28F640BF NOR chips
+Date: Sat, 31 May 2014 00:23:51 +0200
+Subject: [PATCH] mtd: cfi_cmdset_0001.c: add support for Sharp LH28F640BF NOR
 
-Tested on Zaurus SL-5500 (Collie) 2x16 on 32 bit bus
+This family of chips was long ago supported by the pre-cfi driver.
+CFI code tested on several Zaurus SL-5500 (Collie) 2x16 on 32 bit bus.
+
+Function is_LH28F640BF() mimics is_m29ew() from cmdset_0002.c
 
 Buffer write fixes as seen in 2007 patch c/o
 Anti Sullin <anti.sullin <at> artecdesign.ee>
 http://comments.gmane.org/gmane.linux.ports.arm.kernel/36733
 
-Other fixes as seen in
-Micron: TN-12-06: Adapting the Linux Kernel for P30, P33, and J3 Flash
-
 Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
 ---
- drivers/mtd/chips/cfi_cmdset_0001.c | 60 ++++++++++++++++++++++++++++++++++++-
- 1 file changed, 59 insertions(+), 1 deletion(-)
+ drivers/mtd/chips/cfi_cmdset_0001.c | 43 +++++++++++++++++++++++++++++++++++++
+ 1 file changed, 43 insertions(+)
 
 diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
-index 7751443..d83b603 100644
+index e4ec355..a7543ba 100644
 --- a/drivers/mtd/chips/cfi_cmdset_0001.c
 +++ b/drivers/mtd/chips/cfi_cmdset_0001.c
-@@ -53,6 +53,11 @@
+@@ -52,6 +52,11 @@
  /* Atmel chips */
  #define AT49BV640D	0x02de
  #define AT49BV640DT	0x02db
@@ -33,7 +33,7 @@ index 7751443..d83b603 100644
  
  static int cfi_intelext_read (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
  static int cfi_intelext_write_words(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
-@@ -259,6 +264,40 @@ static void fixup_st_m28w320cb(struct mtd_info *mtd)
+@@ -258,6 +263,36 @@ static void fixup_st_m28w320cb(struct mtd_info *mtd)
  		(cfi->cfiq->EraseRegionInfo[1] & 0xffff0000) | 0x3e;
  };
  
@@ -53,20 +53,16 @@ index 7751443..d83b603 100644
 +	struct cfi_private *cfi = map->fldrv_priv;
 +	struct cfi_pri_intelext *extp = cfi->cmdset_priv;
 +
-+	/* NOTE: Sharp Extended Query reports the nr of hardware partitions
-+	 * with an offset of +3. Change of the PCR are not reflected.
-+	 * Keep the wrong reading (0) and let the code convert it to 1 */
-+
 +	/* Reset the Partition Configuration Register on LH28F640BF
-+	 * to a single partition (PCRC = 0x000): PCRC is embedded into A0-A15. */
++	 * to a single partition (PCR = 0x000): PCR is embedded into A0-A15. */
 +	if (is_LH28F640BF(cfi)) {
-+		printk(KERN_INFO "Reset Partition Config. Register: 1 Partition of 4 planes\n" );
++		printk(KERN_INFO "Reset Partition Config. Register: 1 Partition of 4 planes\n");
 +		map_write(map, CMD(0x60), 0);
 +		map_write(map, CMD(0x04), 0);
 +
 +		/* We have set one single partition thus
 +		 * Simultaneous Operations are not allowed */
-+		printk(KERN_WARNING "cfi_cmdset_0001: Simultaneous Operations disabled\n");
++		printk(KERN_INFO "cfi_cmdset_0001: Simultaneous Operations disabled\n");
 +		extp->FeatureSupport &= ~512;
 +	}
 +}
@@ -74,7 +70,7 @@ index 7751443..d83b603 100644
  static void fixup_use_point(struct mtd_info *mtd)
  {
  	struct map_info *map = mtd->priv;
-@@ -310,6 +349,8 @@ static struct cfi_fixup cfi_fixup_table[] = {
+@@ -309,6 +344,8 @@ static struct cfi_fixup cfi_fixup_table[] = {
  	{ CFI_MFR_ST, 0x00ba, /* M28W320CT */ fixup_st_m28w320ct },
  	{ CFI_MFR_ST, 0x00bb, /* M28W320CB */ fixup_st_m28w320cb },
  	{ CFI_MFR_INTEL, CFI_ID_ANY, fixup_unlock_powerup_lock },
@@ -83,55 +79,19 @@ index 7751443..d83b603 100644
  	{ 0, 0, NULL }
  };
  
-@@ -655,7 +696,6 @@ static int cfi_intelext_partition_fixup(struct mtd_info *mtd,
- 
- 		/* Burst Read info */
- 		offs += extp->extra[offs+1]+2;
--
- 		/* Number of partition regions */
- 		numregions = extp->extra[offs];
- 		offs += 1;
-@@ -1003,8 +1043,16 @@ static void put_chip(struct map_info *map, struct flchip *chip, unsigned long ad
- 		   sending the 0x70 (Read Status) command to an erasing
- 		   chip and expecting it to be ignored, that's what we
- 		   do. */
-+
-+		 /* Fix Erase-Suspend hangups: dummy 0xFF cycle before Resume */
-+		if (is_LH28F640BF(cfi)) map_write(map, CMD(0xFF), adr);
-+
- 		map_write(map, CMD(0xd0), adr);
- 		map_write(map, CMD(0x70), adr);
-+
-+		 /* Fix Erase-Suspend following Erase-Resume: add latency */
-+		if (is_LH28F640BF(cfi)) cfi_udelay(1200);
-+
- 		chip->oldstate = FL_READY;
- 		chip->state = FL_ERASING;
- 		break;
-@@ -1162,6 +1210,10 @@ static int __xipram xip_wait_for_operation(
- 			local_irq_disable();
- 
- 			/* Resume the write or erase operation */
-+
-+			 /* Fix Erase-Suspend hangups: dummy 0xFF cycle before Resume */
-+			if (is_LH28F640BF(cfi)) map_write(map, CMD(0xFF), adr);
-+
- 			map_write(map, CMD(0xd0), adr);
- 			map_write(map, CMD(0x70), adr);
- 			chip->state = oldstate;
-@@ -1654,6 +1706,12 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
+@@ -1649,6 +1686,12 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
  	initial_adr = adr;
  	cmd_adr = adr & ~(wbufsize-1);
  
 +	/* Sharp LH28F640BF chips need the first address for the
 +	 * Page Buffer Program command. See Table 5 of
-+	 * LH28F320BF, LH28F640BF, LH28F128BF Series (Appendix FUM00701)
-+	 * Apparently some Intel Strataflash can be programmed this way as well */
-+	if (is_LH28F640BF(cfi)) cmd_adr = adr;
++	 * LH28F320BF, LH28F640BF, LH28F128BF Series (Appendix FUM00701) */
++	if (is_LH28F640BF(cfi))
++		cmd_adr = adr;
 +
  	/* Let's determine this according to the interleave only once */
  	write_cmd = (cfi->cfiq->P_ID != P_ID_INTEL_PERFORMANCE) ? CMD(0xe8) : CMD(0xe9);
  
 -- 
-1.8.1.5
+1.9.1
 
diff --git a/recipes-kernel/linux/linux-yocto-3.14/collie/collie-LH28F640BF.patch b/recipes-kernel/linux/linux-yocto-3.14/collie/collie-LH28F640BF.patch
index fca51d5..ce3e1b9 100644
--- a/recipes-kernel/linux/linux-yocto-3.14/collie/collie-LH28F640BF.patch
+++ b/recipes-kernel/linux/linux-yocto-3.14/collie/collie-LH28F640BF.patch
@@ -1,27 +1,27 @@
-From 12402bf48cf2494a65aac0cf1e55cdc6296691bc Mon Sep 17 00:00:00 2001
+From 4a141aadc97f6493d3af58238acb681c41ef496d Mon Sep 17 00:00:00 2001
 From: Andrea Adami <andrea.adami@gmail.com>
-Date: Sun, 6 Apr 2014 21:21:22 +0200
-Subject: [PATCH] mtd: add support for Sharp LH28F640BF NOR chips
+Date: Sat, 31 May 2014 00:23:51 +0200
+Subject: [PATCH] mtd: cfi_cmdset_0001.c: add support for Sharp LH28F640BF NOR
 
-Tested on Zaurus SL-5500 (Collie) 2x16 on 32 bit bus
+This family of chips was long ago supported by the pre-cfi driver.
+CFI code tested on several Zaurus SL-5500 (Collie) 2x16 on 32 bit bus.
+
+Function is_LH28F640BF() mimics is_m29ew() from cmdset_0002.c
 
 Buffer write fixes as seen in 2007 patch c/o
 Anti Sullin <anti.sullin <at> artecdesign.ee>
 http://comments.gmane.org/gmane.linux.ports.arm.kernel/36733
 
-Other fixes as seen in
-Micron: TN-12-06: Adapting the Linux Kernel for P30, P33, and J3 Flash
-
 Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
 ---
- drivers/mtd/chips/cfi_cmdset_0001.c | 60 ++++++++++++++++++++++++++++++++++++-
- 1 file changed, 59 insertions(+), 1 deletion(-)
+ drivers/mtd/chips/cfi_cmdset_0001.c | 43 +++++++++++++++++++++++++++++++++++++
+ 1 file changed, 43 insertions(+)
 
 diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
-index 7751443..d83b603 100644
+index e4ec355..a7543ba 100644
 --- a/drivers/mtd/chips/cfi_cmdset_0001.c
 +++ b/drivers/mtd/chips/cfi_cmdset_0001.c
-@@ -53,6 +53,11 @@
+@@ -52,6 +52,11 @@
  /* Atmel chips */
  #define AT49BV640D	0x02de
  #define AT49BV640DT	0x02db
@@ -33,7 +33,7 @@ index 7751443..d83b603 100644
  
  static int cfi_intelext_read (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
  static int cfi_intelext_write_words(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
-@@ -259,6 +264,40 @@ static void fixup_st_m28w320cb(struct mtd_info *mtd)
+@@ -258,6 +263,36 @@ static void fixup_st_m28w320cb(struct mtd_info *mtd)
  		(cfi->cfiq->EraseRegionInfo[1] & 0xffff0000) | 0x3e;
  };
  
@@ -53,20 +53,16 @@ index 7751443..d83b603 100644
 +	struct cfi_private *cfi = map->fldrv_priv;
 +	struct cfi_pri_intelext *extp = cfi->cmdset_priv;
 +
-+	/* NOTE: Sharp Extended Query reports the nr of hardware partitions
-+	 * with an offset of +3. Change of the PCR are not reflected.
-+	 * Keep the wrong reading (0) and let the code convert it to 1 */
-+
 +	/* Reset the Partition Configuration Register on LH28F640BF
-+	 * to a single partition (PCRC = 0x000): PCRC is embedded into A0-A15. */
++	 * to a single partition (PCR = 0x000): PCR is embedded into A0-A15. */
 +	if (is_LH28F640BF(cfi)) {
-+		printk(KERN_INFO "Reset Partition Config. Register: 1 Partition of 4 planes\n" );
++		printk(KERN_INFO "Reset Partition Config. Register: 1 Partition of 4 planes\n");
 +		map_write(map, CMD(0x60), 0);
 +		map_write(map, CMD(0x04), 0);
 +
 +		/* We have set one single partition thus
 +		 * Simultaneous Operations are not allowed */
-+		printk(KERN_WARNING "cfi_cmdset_0001: Simultaneous Operations disabled\n");
++		printk(KERN_INFO "cfi_cmdset_0001: Simultaneous Operations disabled\n");
 +		extp->FeatureSupport &= ~512;
 +	}
 +}
@@ -74,7 +70,7 @@ index 7751443..d83b603 100644
  static void fixup_use_point(struct mtd_info *mtd)
  {
  	struct map_info *map = mtd->priv;
-@@ -310,6 +349,8 @@ static struct cfi_fixup cfi_fixup_table[] = {
+@@ -309,6 +344,8 @@ static struct cfi_fixup cfi_fixup_table[] = {
  	{ CFI_MFR_ST, 0x00ba, /* M28W320CT */ fixup_st_m28w320ct },
  	{ CFI_MFR_ST, 0x00bb, /* M28W320CB */ fixup_st_m28w320cb },
  	{ CFI_MFR_INTEL, CFI_ID_ANY, fixup_unlock_powerup_lock },
@@ -83,55 +79,19 @@ index 7751443..d83b603 100644
  	{ 0, 0, NULL }
  };
  
-@@ -655,7 +696,6 @@ static int cfi_intelext_partition_fixup(struct mtd_info *mtd,
- 
- 		/* Burst Read info */
- 		offs += extp->extra[offs+1]+2;
--
- 		/* Number of partition regions */
- 		numregions = extp->extra[offs];
- 		offs += 1;
-@@ -1003,8 +1043,16 @@ static void put_chip(struct map_info *map, struct flchip *chip, unsigned long ad
- 		   sending the 0x70 (Read Status) command to an erasing
- 		   chip and expecting it to be ignored, that's what we
- 		   do. */
-+
-+		 /* Fix Erase-Suspend hangups: dummy 0xFF cycle before Resume */
-+		if (is_LH28F640BF(cfi)) map_write(map, CMD(0xFF), adr);
-+
- 		map_write(map, CMD(0xd0), adr);
- 		map_write(map, CMD(0x70), adr);
-+
-+		 /* Fix Erase-Suspend following Erase-Resume: add latency */
-+		if (is_LH28F640BF(cfi)) cfi_udelay(1200);
-+
- 		chip->oldstate = FL_READY;
- 		chip->state = FL_ERASING;
- 		break;
-@@ -1162,6 +1210,10 @@ static int __xipram xip_wait_for_operation(
- 			local_irq_disable();
- 
- 			/* Resume the write or erase operation */
-+
-+			 /* Fix Erase-Suspend hangups: dummy 0xFF cycle before Resume */
-+			if (is_LH28F640BF(cfi)) map_write(map, CMD(0xFF), adr);
-+
- 			map_write(map, CMD(0xd0), adr);
- 			map_write(map, CMD(0x70), adr);
- 			chip->state = oldstate;
-@@ -1654,6 +1706,12 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
+@@ -1649,6 +1686,12 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
  	initial_adr = adr;
  	cmd_adr = adr & ~(wbufsize-1);
  
 +	/* Sharp LH28F640BF chips need the first address for the
 +	 * Page Buffer Program command. See Table 5 of
-+	 * LH28F320BF, LH28F640BF, LH28F128BF Series (Appendix FUM00701)
-+	 * Apparently some Intel Strataflash can be programmed this way as well */
-+	if (is_LH28F640BF(cfi)) cmd_adr = adr;
++	 * LH28F320BF, LH28F640BF, LH28F128BF Series (Appendix FUM00701) */
++	if (is_LH28F640BF(cfi))
++		cmd_adr = adr;
 +
  	/* Let's determine this according to the interleave only once */
  	write_cmd = (cfi->cfiq->P_ID != P_ID_INTEL_PERFORMANCE) ? CMD(0xe8) : CMD(0xe9);
  
 -- 
-1.8.1.5
+1.9.1
 
-- 
1.9.1


