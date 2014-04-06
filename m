Return-Path: <andrea.adami@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 945586EBA5
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Apr 2014 20:52:13 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id bs8so5225657wib.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Apr 2014 13:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=MsiNqtAvhokBNnxpPhJolibacmP/WJ3uFT2JdFltFiY=;
	b=joY2OkBWC3+HBSaOxSIOKpVYS1t+wEwPf6425UXyK1pkZ69x3+cXtsDVKbx8F451CR
	NF2XwUOH+E+335zakiLMgH1BI4YMQZ06+1XoausfZRSS5bV7ROFClFakzoELepj4m/aa
	WAg3pEgjwlZbqtd9hREb3oM7sRS89Jp7jTguNYYoADy4zDkqy2SfaVmFYzssD/gOL6O4
	2jJA03xaaEtz7ifUt9RwjaJG100MMvm1olbkROAG2aOhgcjvkoIRISaUcr/sLJN6ILpn
	Q9UMSQ51ousasigwHOzr5NwmaBViXGL0WqeR/b+k125riH61AqgE96FWtxNt4c9ebaeW
	aJ3w==
X-Received: by 10.180.90.140 with SMTP id bw12mr20955989wib.18.1396817533541; 
	Sun, 06 Apr 2014 13:52:13 -0700 (PDT)
Received: from mizar.localdomain
	(host89-230-dynamic.20-79-r.retail.telecomitalia.it. [79.20.230.89])
	by mx.google.com with ESMTPSA id w1sm37040749eel.16.2014.04.06.13.52.12
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 06 Apr 2014 13:52:12 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Apr 2014 22:52:08 +0200
Message-Id: <1396817528-1289-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] linux-yocto*: collie: refactor LH28F640BF patch
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
X-List-Received-Date: Sun, 06 Apr 2014 20:52:18 -0000

Add more fixups for the chip latencies and enable
again Suspend Erase on write.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../patches/patches-mtd/collie-LH28F640BF.patch    | 92 ++++++++++++----------
 .../collie/collie-LH28F640BF.patch                 | 90 +++++++++++----------
 .../patches/patches-mtd/collie-LH28F640BF.patch    | 92 ++++++++++++----------
 3 files changed, 146 insertions(+), 128 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-LH28F640BF.patch b/recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-LH28F640BF.patch
index 182e782..fca51d5 100644
--- a/recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-LH28F640BF.patch
+++ b/recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-LH28F640BF.patch
@@ -1,7 +1,7 @@
-From 7485f38ec10b7474932edebc4f3db60a8e32097c Mon Sep 17 00:00:00 2001
+From 12402bf48cf2494a65aac0cf1e55cdc6296691bc Mon Sep 17 00:00:00 2001
 From: Andrea Adami <andrea.adami@gmail.com>
-Date: Tue, 21 Jan 2014 00:51:26 +0100
-Subject: mtd: add support for Sharp LH28F640BF NOR chips
+Date: Sun, 6 Apr 2014 21:21:22 +0200
+Subject: [PATCH] mtd: add support for Sharp LH28F640BF NOR chips
 
 Tested on Zaurus SL-5500 (Collie) 2x16 on 32 bit bus
 
@@ -9,13 +9,16 @@ Buffer write fixes as seen in 2007 patch c/o
 Anti Sullin <anti.sullin <at> artecdesign.ee>
 http://comments.gmane.org/gmane.linux.ports.arm.kernel/36733
 
+Other fixes as seen in
+Micron: TN-12-06: Adapting the Linux Kernel for P30, P33, and J3 Flash
+
 Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
 ---
- drivers/mtd/chips/cfi_cmdset_0001.c | 66 +++++++++++++++++++++++++++++++++++++
- 1 file changed, 66 insertions(+)
+ drivers/mtd/chips/cfi_cmdset_0001.c | 60 ++++++++++++++++++++++++++++++++++++-
+ 1 file changed, 59 insertions(+), 1 deletion(-)
 
 diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
-index 7751443..c3c0b41 100644
+index 7751443..d83b603 100644
 --- a/drivers/mtd/chips/cfi_cmdset_0001.c
 +++ b/drivers/mtd/chips/cfi_cmdset_0001.c
 @@ -53,6 +53,11 @@
@@ -30,13 +33,13 @@ index 7751443..c3c0b41 100644
  
  static int cfi_intelext_read (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
  static int cfi_intelext_write_words(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
-@@ -259,6 +264,47 @@ static void fixup_st_m28w320cb(struct mtd_info *mtd)
+@@ -259,6 +264,40 @@ static void fixup_st_m28w320cb(struct mtd_info *mtd)
  		(cfi->cfiq->EraseRegionInfo[1] & 0xffff0000) | 0x3e;
  };
  
 +static int is_LH28F640BF(struct cfi_private *cfi)
 +{
-+	/* Sharp LH28F640BF Series */
++	/* Sharp LH28F640BF Family */
 +	if (cfi->mfr == CFI_MFR_SHARP && (
 +	    cfi->id == LH28F640BFHE_PTTL90 || cfi->id == LH28F640BFHE_PBTL90 ||
 +	    cfi->id == LH28F640BFHE_PTTL70A || cfi->id == LH28F640BFHE_PBTL70A))
@@ -50,35 +53,28 @@ index 7751443..c3c0b41 100644
 +	struct cfi_private *cfi = map->fldrv_priv;
 +	struct cfi_pri_intelext *extp = cfi->cmdset_priv;
 +
++	/* NOTE: Sharp Extended Query reports the nr of hardware partitions
++	 * with an offset of +3. Change of the PCR are not reflected.
++	 * Keep the wrong reading (0) and let the code convert it to 1 */
++
 +	/* Reset the Partition Configuration Register on LH28F640BF
 +	 * to a single partition (PCRC = 0x000): PCRC is embedded into A0-A15. */
 +	if (is_LH28F640BF(cfi)) {
 +		printk(KERN_INFO "Reset Partition Config. Register: 1 Partition of 4 planes\n" );
 +		map_write(map, CMD(0x60), 0);
 +		map_write(map, CMD(0x04), 0);
-+		/* NOTE: Sharp Extended Query reports the nr of hardware partitions
-+		 * with an offset of +3. Change of the PCR are not reflected.
-+		 * Keep the wrong reading (0) and let the code convert it to 1 */
 +
-+		/* Sharp LH28F640BF Series has been set to one partition
-+		 * so Simultaneous Operations are disabled */
++		/* We have set one single partition thus
++		 * Simultaneous Operations are not allowed */
 +		printk(KERN_WARNING "cfi_cmdset_0001: Simultaneous Operations disabled\n");
 +		extp->FeatureSupport &= ~512;
-+
-+		/* To avoid issues with ubifs with concurrent erase-suspend
-+		 * we have to disable SuspendCmdSupport.
-+		 * The fixes described in "Micron TN-12-06: Adapting the
-+		 * Linux Kernel for P30, P33, and J3 Flash" do not help. */
-+		printk(KERN_WARNING "cfi_cmdset_0001: Suspend "
-+		                    "erase on write disabled.\n");
-+		extp->SuspendCmdSupport &= ~1;
 +	}
 +}
 +
  static void fixup_use_point(struct mtd_info *mtd)
  {
  	struct map_info *map = mtd->priv;
-@@ -310,6 +356,8 @@ static struct cfi_fixup cfi_fixup_table[] = {
+@@ -310,6 +349,8 @@ static struct cfi_fixup cfi_fixup_table[] = {
  	{ CFI_MFR_ST, 0x00ba, /* M28W320CT */ fixup_st_m28w320ct },
  	{ CFI_MFR_ST, 0x00bb, /* M28W320CB */ fixup_st_m28w320cb },
  	{ CFI_MFR_INTEL, CFI_ID_ANY, fixup_unlock_powerup_lock },
@@ -87,33 +83,43 @@ index 7751443..c3c0b41 100644
  	{ 0, 0, NULL }
  };
  
-@@ -387,6 +435,12 @@ read_pri_intelext(struct map_info *map, __u16 adr)
- 	if (extp->MinorVersion >= '3') {
- 		int nb_parts, i;
+@@ -655,7 +696,6 @@ static int cfi_intelext_partition_fixup(struct mtd_info *mtd,
  
-+		/* Sharp LH28F640BF query does not respect the nr of synch
-+		 * modes/fields. The value of "Synchronous mode read capability
-+		 * configuration" is 0 but 3 fields are reserved so the
-+		 * number of partitions is at offsets +3. Ignore, we have set PCR to 1. */
-+		/* if (is_LH28F640BF(cfi)) extra_size += 3; */
-+
- 		/* Number of hardware-partitions */
- 		extra_size += 1;
- 		if (extp_size < sizeof(*extp) + extra_size)
-@@ -656,6 +710,12 @@ static int cfi_intelext_partition_fixup(struct mtd_info *mtd,
  		/* Burst Read info */
  		offs += extp->extra[offs+1]+2;
- 
-+		/* Sharp LH28F640BF query does not respect the nr of synch
-+		 * modes/fields. The value of "Synchronous mode read capability
-+		 * configuration" is 0 but 3 fields are reserved so the
-+		 * number of partitions is at offsets +3. Ignore, we have set PCR to 1. */
-+		/* if (is_LH28F640BF(cfi)) offs += 3; */
-+
+-
  		/* Number of partition regions */
  		numregions = extp->extra[offs];
  		offs += 1;
-@@ -1654,6 +1714,12 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
+@@ -1003,8 +1043,16 @@ static void put_chip(struct map_info *map, struct flchip *chip, unsigned long ad
+ 		   sending the 0x70 (Read Status) command to an erasing
+ 		   chip and expecting it to be ignored, that's what we
+ 		   do. */
++
++		 /* Fix Erase-Suspend hangups: dummy 0xFF cycle before Resume */
++		if (is_LH28F640BF(cfi)) map_write(map, CMD(0xFF), adr);
++
+ 		map_write(map, CMD(0xd0), adr);
+ 		map_write(map, CMD(0x70), adr);
++
++		 /* Fix Erase-Suspend following Erase-Resume: add latency */
++		if (is_LH28F640BF(cfi)) cfi_udelay(1200);
++
+ 		chip->oldstate = FL_READY;
+ 		chip->state = FL_ERASING;
+ 		break;
+@@ -1162,6 +1210,10 @@ static int __xipram xip_wait_for_operation(
+ 			local_irq_disable();
+ 
+ 			/* Resume the write or erase operation */
++
++			 /* Fix Erase-Suspend hangups: dummy 0xFF cycle before Resume */
++			if (is_LH28F640BF(cfi)) map_write(map, CMD(0xFF), adr);
++
+ 			map_write(map, CMD(0xd0), adr);
+ 			map_write(map, CMD(0x70), adr);
+ 			chip->state = oldstate;
+@@ -1654,6 +1706,12 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
  	initial_adr = adr;
  	cmd_adr = adr & ~(wbufsize-1);
  
diff --git a/recipes-kernel/linux/linux-yocto-3.14/collie/collie-LH28F640BF.patch b/recipes-kernel/linux/linux-yocto-3.14/collie/collie-LH28F640BF.patch
index 963b7ca..fca51d5 100644
--- a/recipes-kernel/linux/linux-yocto-3.14/collie/collie-LH28F640BF.patch
+++ b/recipes-kernel/linux/linux-yocto-3.14/collie/collie-LH28F640BF.patch
@@ -1,6 +1,6 @@
-From 7485f38ec10b7474932edebc4f3db60a8e32097c Mon Sep 17 00:00:00 2001
+From 12402bf48cf2494a65aac0cf1e55cdc6296691bc Mon Sep 17 00:00:00 2001
 From: Andrea Adami <andrea.adami@gmail.com>
-Date: Tue, 21 Jan 2014 00:51:26 +0100
+Date: Sun, 6 Apr 2014 21:21:22 +0200
 Subject: [PATCH] mtd: add support for Sharp LH28F640BF NOR chips
 
 Tested on Zaurus SL-5500 (Collie) 2x16 on 32 bit bus
@@ -9,13 +9,16 @@ Buffer write fixes as seen in 2007 patch c/o
 Anti Sullin <anti.sullin <at> artecdesign.ee>
 http://comments.gmane.org/gmane.linux.ports.arm.kernel/36733
 
+Other fixes as seen in
+Micron: TN-12-06: Adapting the Linux Kernel for P30, P33, and J3 Flash
+
 Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
 ---
- drivers/mtd/chips/cfi_cmdset_0001.c | 66 +++++++++++++++++++++++++++++++++++++
- 1 file changed, 66 insertions(+)
+ drivers/mtd/chips/cfi_cmdset_0001.c | 60 ++++++++++++++++++++++++++++++++++++-
+ 1 file changed, 59 insertions(+), 1 deletion(-)
 
 diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
-index 7751443..c3c0b41 100644
+index 7751443..d83b603 100644
 --- a/drivers/mtd/chips/cfi_cmdset_0001.c
 +++ b/drivers/mtd/chips/cfi_cmdset_0001.c
 @@ -53,6 +53,11 @@
@@ -30,13 +33,13 @@ index 7751443..c3c0b41 100644
  
  static int cfi_intelext_read (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
  static int cfi_intelext_write_words(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
-@@ -259,6 +264,47 @@ static void fixup_st_m28w320cb(struct mtd_info *mtd)
+@@ -259,6 +264,40 @@ static void fixup_st_m28w320cb(struct mtd_info *mtd)
  		(cfi->cfiq->EraseRegionInfo[1] & 0xffff0000) | 0x3e;
  };
  
 +static int is_LH28F640BF(struct cfi_private *cfi)
 +{
-+	/* Sharp LH28F640BF Series */
++	/* Sharp LH28F640BF Family */
 +	if (cfi->mfr == CFI_MFR_SHARP && (
 +	    cfi->id == LH28F640BFHE_PTTL90 || cfi->id == LH28F640BFHE_PBTL90 ||
 +	    cfi->id == LH28F640BFHE_PTTL70A || cfi->id == LH28F640BFHE_PBTL70A))
@@ -50,35 +53,28 @@ index 7751443..c3c0b41 100644
 +	struct cfi_private *cfi = map->fldrv_priv;
 +	struct cfi_pri_intelext *extp = cfi->cmdset_priv;
 +
++	/* NOTE: Sharp Extended Query reports the nr of hardware partitions
++	 * with an offset of +3. Change of the PCR are not reflected.
++	 * Keep the wrong reading (0) and let the code convert it to 1 */
++
 +	/* Reset the Partition Configuration Register on LH28F640BF
 +	 * to a single partition (PCRC = 0x000): PCRC is embedded into A0-A15. */
 +	if (is_LH28F640BF(cfi)) {
 +		printk(KERN_INFO "Reset Partition Config. Register: 1 Partition of 4 planes\n" );
 +		map_write(map, CMD(0x60), 0);
 +		map_write(map, CMD(0x04), 0);
-+		/* NOTE: Sharp Extended Query reports the nr of hardware partitions
-+		 * with an offset of +3. Change of the PCR are not reflected.
-+		 * Keep the wrong reading (0) and let the code convert it to 1 */
 +
-+		/* Sharp LH28F640BF Series has been set to one partition
-+		 * so Simultaneous Operations are disabled */
++		/* We have set one single partition thus
++		 * Simultaneous Operations are not allowed */
 +		printk(KERN_WARNING "cfi_cmdset_0001: Simultaneous Operations disabled\n");
 +		extp->FeatureSupport &= ~512;
-+
-+		/* To avoid issues with ubifs with concurrent erase-suspend
-+		 * we have to disable SuspendCmdSupport.
-+		 * The fixes described in "Micron TN-12-06: Adapting the
-+		 * Linux Kernel for P30, P33, and J3 Flash" do not help. */
-+		printk(KERN_WARNING "cfi_cmdset_0001: Suspend "
-+		                    "erase on write disabled.\n");
-+		extp->SuspendCmdSupport &= ~1;
 +	}
 +}
 +
  static void fixup_use_point(struct mtd_info *mtd)
  {
  	struct map_info *map = mtd->priv;
-@@ -310,6 +356,8 @@ static struct cfi_fixup cfi_fixup_table[] = {
+@@ -310,6 +349,8 @@ static struct cfi_fixup cfi_fixup_table[] = {
  	{ CFI_MFR_ST, 0x00ba, /* M28W320CT */ fixup_st_m28w320ct },
  	{ CFI_MFR_ST, 0x00bb, /* M28W320CB */ fixup_st_m28w320cb },
  	{ CFI_MFR_INTEL, CFI_ID_ANY, fixup_unlock_powerup_lock },
@@ -87,33 +83,43 @@ index 7751443..c3c0b41 100644
  	{ 0, 0, NULL }
  };
  
-@@ -387,6 +435,12 @@ read_pri_intelext(struct map_info *map, __u16 adr)
- 	if (extp->MinorVersion >= '3') {
- 		int nb_parts, i;
+@@ -655,7 +696,6 @@ static int cfi_intelext_partition_fixup(struct mtd_info *mtd,
  
-+		/* Sharp LH28F640BF query does not respect the nr of synch
-+		 * modes/fields. The value of "Synchronous mode read capability
-+		 * configuration" is 0 but 3 fields are reserved so the
-+		 * number of partitions is at offsets +3. Ignore, we have set PCR to 1. */
-+		/* if (is_LH28F640BF(cfi)) extra_size += 3; */
-+
- 		/* Number of hardware-partitions */
- 		extra_size += 1;
- 		if (extp_size < sizeof(*extp) + extra_size)
-@@ -656,6 +710,12 @@ static int cfi_intelext_partition_fixup(struct mtd_info *mtd,
  		/* Burst Read info */
  		offs += extp->extra[offs+1]+2;
- 
-+		/* Sharp LH28F640BF query does not respect the nr of synch
-+		 * modes/fields. The value of "Synchronous mode read capability
-+		 * configuration" is 0 but 3 fields are reserved so the
-+		 * number of partitions is at offsets +3. Ignore, we have set PCR to 1. */
-+		/* if (is_LH28F640BF(cfi)) offs += 3; */
-+
+-
  		/* Number of partition regions */
  		numregions = extp->extra[offs];
  		offs += 1;
-@@ -1654,6 +1714,12 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
+@@ -1003,8 +1043,16 @@ static void put_chip(struct map_info *map, struct flchip *chip, unsigned long ad
+ 		   sending the 0x70 (Read Status) command to an erasing
+ 		   chip and expecting it to be ignored, that's what we
+ 		   do. */
++
++		 /* Fix Erase-Suspend hangups: dummy 0xFF cycle before Resume */
++		if (is_LH28F640BF(cfi)) map_write(map, CMD(0xFF), adr);
++
+ 		map_write(map, CMD(0xd0), adr);
+ 		map_write(map, CMD(0x70), adr);
++
++		 /* Fix Erase-Suspend following Erase-Resume: add latency */
++		if (is_LH28F640BF(cfi)) cfi_udelay(1200);
++
+ 		chip->oldstate = FL_READY;
+ 		chip->state = FL_ERASING;
+ 		break;
+@@ -1162,6 +1210,10 @@ static int __xipram xip_wait_for_operation(
+ 			local_irq_disable();
+ 
+ 			/* Resume the write or erase operation */
++
++			 /* Fix Erase-Suspend hangups: dummy 0xFF cycle before Resume */
++			if (is_LH28F640BF(cfi)) map_write(map, CMD(0xFF), adr);
++
+ 			map_write(map, CMD(0xd0), adr);
+ 			map_write(map, CMD(0x70), adr);
+ 			chip->state = oldstate;
+@@ -1654,6 +1706,12 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
  	initial_adr = adr;
  	cmd_adr = adr & ~(wbufsize-1);
  
diff --git a/recipes-kernel/linux/linux-yocto-dev/patches/patches-mtd/collie-LH28F640BF.patch b/recipes-kernel/linux/linux-yocto-dev/patches/patches-mtd/collie-LH28F640BF.patch
index 182e782..fca51d5 100644
--- a/recipes-kernel/linux/linux-yocto-dev/patches/patches-mtd/collie-LH28F640BF.patch
+++ b/recipes-kernel/linux/linux-yocto-dev/patches/patches-mtd/collie-LH28F640BF.patch
@@ -1,7 +1,7 @@
-From 7485f38ec10b7474932edebc4f3db60a8e32097c Mon Sep 17 00:00:00 2001
+From 12402bf48cf2494a65aac0cf1e55cdc6296691bc Mon Sep 17 00:00:00 2001
 From: Andrea Adami <andrea.adami@gmail.com>
-Date: Tue, 21 Jan 2014 00:51:26 +0100
-Subject: mtd: add support for Sharp LH28F640BF NOR chips
+Date: Sun, 6 Apr 2014 21:21:22 +0200
+Subject: [PATCH] mtd: add support for Sharp LH28F640BF NOR chips
 
 Tested on Zaurus SL-5500 (Collie) 2x16 on 32 bit bus
 
@@ -9,13 +9,16 @@ Buffer write fixes as seen in 2007 patch c/o
 Anti Sullin <anti.sullin <at> artecdesign.ee>
 http://comments.gmane.org/gmane.linux.ports.arm.kernel/36733
 
+Other fixes as seen in
+Micron: TN-12-06: Adapting the Linux Kernel for P30, P33, and J3 Flash
+
 Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
 ---
- drivers/mtd/chips/cfi_cmdset_0001.c | 66 +++++++++++++++++++++++++++++++++++++
- 1 file changed, 66 insertions(+)
+ drivers/mtd/chips/cfi_cmdset_0001.c | 60 ++++++++++++++++++++++++++++++++++++-
+ 1 file changed, 59 insertions(+), 1 deletion(-)
 
 diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
-index 7751443..c3c0b41 100644
+index 7751443..d83b603 100644
 --- a/drivers/mtd/chips/cfi_cmdset_0001.c
 +++ b/drivers/mtd/chips/cfi_cmdset_0001.c
 @@ -53,6 +53,11 @@
@@ -30,13 +33,13 @@ index 7751443..c3c0b41 100644
  
  static int cfi_intelext_read (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
  static int cfi_intelext_write_words(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
-@@ -259,6 +264,47 @@ static void fixup_st_m28w320cb(struct mtd_info *mtd)
+@@ -259,6 +264,40 @@ static void fixup_st_m28w320cb(struct mtd_info *mtd)
  		(cfi->cfiq->EraseRegionInfo[1] & 0xffff0000) | 0x3e;
  };
  
 +static int is_LH28F640BF(struct cfi_private *cfi)
 +{
-+	/* Sharp LH28F640BF Series */
++	/* Sharp LH28F640BF Family */
 +	if (cfi->mfr == CFI_MFR_SHARP && (
 +	    cfi->id == LH28F640BFHE_PTTL90 || cfi->id == LH28F640BFHE_PBTL90 ||
 +	    cfi->id == LH28F640BFHE_PTTL70A || cfi->id == LH28F640BFHE_PBTL70A))
@@ -50,35 +53,28 @@ index 7751443..c3c0b41 100644
 +	struct cfi_private *cfi = map->fldrv_priv;
 +	struct cfi_pri_intelext *extp = cfi->cmdset_priv;
 +
++	/* NOTE: Sharp Extended Query reports the nr of hardware partitions
++	 * with an offset of +3. Change of the PCR are not reflected.
++	 * Keep the wrong reading (0) and let the code convert it to 1 */
++
 +	/* Reset the Partition Configuration Register on LH28F640BF
 +	 * to a single partition (PCRC = 0x000): PCRC is embedded into A0-A15. */
 +	if (is_LH28F640BF(cfi)) {
 +		printk(KERN_INFO "Reset Partition Config. Register: 1 Partition of 4 planes\n" );
 +		map_write(map, CMD(0x60), 0);
 +		map_write(map, CMD(0x04), 0);
-+		/* NOTE: Sharp Extended Query reports the nr of hardware partitions
-+		 * with an offset of +3. Change of the PCR are not reflected.
-+		 * Keep the wrong reading (0) and let the code convert it to 1 */
 +
-+		/* Sharp LH28F640BF Series has been set to one partition
-+		 * so Simultaneous Operations are disabled */
++		/* We have set one single partition thus
++		 * Simultaneous Operations are not allowed */
 +		printk(KERN_WARNING "cfi_cmdset_0001: Simultaneous Operations disabled\n");
 +		extp->FeatureSupport &= ~512;
-+
-+		/* To avoid issues with ubifs with concurrent erase-suspend
-+		 * we have to disable SuspendCmdSupport.
-+		 * The fixes described in "Micron TN-12-06: Adapting the
-+		 * Linux Kernel for P30, P33, and J3 Flash" do not help. */
-+		printk(KERN_WARNING "cfi_cmdset_0001: Suspend "
-+		                    "erase on write disabled.\n");
-+		extp->SuspendCmdSupport &= ~1;
 +	}
 +}
 +
  static void fixup_use_point(struct mtd_info *mtd)
  {
  	struct map_info *map = mtd->priv;
-@@ -310,6 +356,8 @@ static struct cfi_fixup cfi_fixup_table[] = {
+@@ -310,6 +349,8 @@ static struct cfi_fixup cfi_fixup_table[] = {
  	{ CFI_MFR_ST, 0x00ba, /* M28W320CT */ fixup_st_m28w320ct },
  	{ CFI_MFR_ST, 0x00bb, /* M28W320CB */ fixup_st_m28w320cb },
  	{ CFI_MFR_INTEL, CFI_ID_ANY, fixup_unlock_powerup_lock },
@@ -87,33 +83,43 @@ index 7751443..c3c0b41 100644
  	{ 0, 0, NULL }
  };
  
-@@ -387,6 +435,12 @@ read_pri_intelext(struct map_info *map, __u16 adr)
- 	if (extp->MinorVersion >= '3') {
- 		int nb_parts, i;
+@@ -655,7 +696,6 @@ static int cfi_intelext_partition_fixup(struct mtd_info *mtd,
  
-+		/* Sharp LH28F640BF query does not respect the nr of synch
-+		 * modes/fields. The value of "Synchronous mode read capability
-+		 * configuration" is 0 but 3 fields are reserved so the
-+		 * number of partitions is at offsets +3. Ignore, we have set PCR to 1. */
-+		/* if (is_LH28F640BF(cfi)) extra_size += 3; */
-+
- 		/* Number of hardware-partitions */
- 		extra_size += 1;
- 		if (extp_size < sizeof(*extp) + extra_size)
-@@ -656,6 +710,12 @@ static int cfi_intelext_partition_fixup(struct mtd_info *mtd,
  		/* Burst Read info */
  		offs += extp->extra[offs+1]+2;
- 
-+		/* Sharp LH28F640BF query does not respect the nr of synch
-+		 * modes/fields. The value of "Synchronous mode read capability
-+		 * configuration" is 0 but 3 fields are reserved so the
-+		 * number of partitions is at offsets +3. Ignore, we have set PCR to 1. */
-+		/* if (is_LH28F640BF(cfi)) offs += 3; */
-+
+-
  		/* Number of partition regions */
  		numregions = extp->extra[offs];
  		offs += 1;
-@@ -1654,6 +1714,12 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
+@@ -1003,8 +1043,16 @@ static void put_chip(struct map_info *map, struct flchip *chip, unsigned long ad
+ 		   sending the 0x70 (Read Status) command to an erasing
+ 		   chip and expecting it to be ignored, that's what we
+ 		   do. */
++
++		 /* Fix Erase-Suspend hangups: dummy 0xFF cycle before Resume */
++		if (is_LH28F640BF(cfi)) map_write(map, CMD(0xFF), adr);
++
+ 		map_write(map, CMD(0xd0), adr);
+ 		map_write(map, CMD(0x70), adr);
++
++		 /* Fix Erase-Suspend following Erase-Resume: add latency */
++		if (is_LH28F640BF(cfi)) cfi_udelay(1200);
++
+ 		chip->oldstate = FL_READY;
+ 		chip->state = FL_ERASING;
+ 		break;
+@@ -1162,6 +1210,10 @@ static int __xipram xip_wait_for_operation(
+ 			local_irq_disable();
+ 
+ 			/* Resume the write or erase operation */
++
++			 /* Fix Erase-Suspend hangups: dummy 0xFF cycle before Resume */
++			if (is_LH28F640BF(cfi)) map_write(map, CMD(0xFF), adr);
++
+ 			map_write(map, CMD(0xd0), adr);
+ 			map_write(map, CMD(0x70), adr);
+ 			chip->state = oldstate;
+@@ -1654,6 +1706,12 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
  	initial_adr = adr;
  	cmd_adr = adr & ~(wbufsize-1);
  
-- 
1.8.1.5


