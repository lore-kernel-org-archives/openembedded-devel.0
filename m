Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id C5CD36E71A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2014 21:54:08 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id l9so6917211eaj.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2014 13:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=PMO2kezyIM94ZXyyWyPeQxvb3yrletAVNxxR/V+ZlqI=;
	b=r1Nt6hdy16aVMIuT7s5hMEdt7ESGv1pxD46tZZPFvq3E6fKPtOF87JmjMdOHfzOGoL
	v/s1E0sCGrGE1xakPB1Zj6L7aMhOynMrFINAI5+/S2xNcxSX+UbyxL2Y9e+tbwQOeG2Y
	0q/At8trURbgyXaZNk9Kj2YUpmLKkbV0Z49eZXqbHUmo/FPtCk3QhoXtZ2t5wOmvYaEb
	+WbOEBz8Av6kkm+pkMinPlnvw2pY/cvBt+q/vvSVHD9eG0CsTkYX8YmOwtpJ4dRXz6o8
	5mfNVxGhaD0jvygxF/dqoJw6A0Efa9R/P1QRPRoWcUcFpQMHdfrR8Rm7R7Vgs52qVlHP
	P/CA==
X-Received: by 10.15.22.65 with SMTP id e41mr29447650eeu.5.1392674048825;
	Mon, 17 Feb 2014 13:54:08 -0800 (PST)
Received: from mizar.localdomain
	(host53-14-dynamic.21-79-r.retail.telecomitalia.it. [79.21.14.53])
	by mx.google.com with ESMTPSA id m1sm62134917een.7.2014.02.17.13.54.07
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Feb 2014 13:54:08 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Feb 2014 22:54:03 +0100
Message-Id: <1392674044-20769-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH 1/2] linux-yocto*: mtd: collie: refactor headers of collie-match-cfi-qry.patch
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
X-List-Received-Date: Mon, 17 Feb 2014 21:54:09 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../patches/patches-mtd/collie-match-cfi-qry.patch    | 19 ++++++++++++++++---
 .../patches/patches-mtd/collie-match-cfi-qry.patch    | 19 ++++++++++++++++---
 .../patches/patches-mtd/collie-match-cfi-qry.patch    | 19 ++++++++++++++++---
 3 files changed, 48 insertions(+), 9 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-match-cfi-qry.patch b/recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-match-cfi-qry.patch
index e3fbf2e..a315d93 100644
--- a/recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-match-cfi-qry.patch
+++ b/recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-match-cfi-qry.patch
@@ -1,8 +1,18 @@
+From 66ec11df6561d5ba7cdf41977af828a53ba6b99f Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Sat, 1 Feb 2014 13:17:24 +0100
+Subject: [PATCH] mtd: cfi_util.c: force CFI detection of 2x LH28F640BF
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ drivers/mtd/chips/cfi_util.c | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
 diff --git a/drivers/mtd/chips/cfi_util.c b/drivers/mtd/chips/cfi_util.c
-index f992418..7139d028 100644
+index f992418..2c7a13d 100644
 --- a/drivers/mtd/chips/cfi_util.c
 +++ b/drivers/mtd/chips/cfi_util.c
-@@ -29,6 +29,7 @@
+@@ -29,6 +29,7 @@ int __xipram cfi_qry_present(struct map_info *map, __u32 base,
  	int osf = cfi->interleave * cfi->device_type;	/* scale factor */
  	map_word val[3];
  	map_word qry[3];
@@ -10,7 +20,7 @@ index f992418..7139d028 100644
  
  	qry[0] = cfi_build_cmd('Q', map, cfi);
  	qry[1] = cfi_build_cmd('R', map, cfi);
-@@ -38,6 +39,21 @@
+@@ -38,6 +39,21 @@ int __xipram cfi_qry_present(struct map_info *map, __u32 base,
  	val[1] = map_read(map, base + osf*0x11);
  	val[2] = map_read(map, base + osf*0x12);
  
@@ -32,3 +42,6 @@ index f992418..7139d028 100644
  	if (!map_word_equal(map, qry[0], val[0]))
  		return 0;
  
+-- 
+1.8.1.5
+
diff --git a/recipes-kernel/linux/linux-yocto-dev/patches/patches-mtd/collie-match-cfi-qry.patch b/recipes-kernel/linux/linux-yocto-dev/patches/patches-mtd/collie-match-cfi-qry.patch
index e3fbf2e..a315d93 100644
--- a/recipes-kernel/linux/linux-yocto-dev/patches/patches-mtd/collie-match-cfi-qry.patch
+++ b/recipes-kernel/linux/linux-yocto-dev/patches/patches-mtd/collie-match-cfi-qry.patch
@@ -1,8 +1,18 @@
+From 66ec11df6561d5ba7cdf41977af828a53ba6b99f Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Sat, 1 Feb 2014 13:17:24 +0100
+Subject: [PATCH] mtd: cfi_util.c: force CFI detection of 2x LH28F640BF
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ drivers/mtd/chips/cfi_util.c | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
 diff --git a/drivers/mtd/chips/cfi_util.c b/drivers/mtd/chips/cfi_util.c
-index f992418..7139d028 100644
+index f992418..2c7a13d 100644
 --- a/drivers/mtd/chips/cfi_util.c
 +++ b/drivers/mtd/chips/cfi_util.c
-@@ -29,6 +29,7 @@
+@@ -29,6 +29,7 @@ int __xipram cfi_qry_present(struct map_info *map, __u32 base,
  	int osf = cfi->interleave * cfi->device_type;	/* scale factor */
  	map_word val[3];
  	map_word qry[3];
@@ -10,7 +20,7 @@ index f992418..7139d028 100644
  
  	qry[0] = cfi_build_cmd('Q', map, cfi);
  	qry[1] = cfi_build_cmd('R', map, cfi);
-@@ -38,6 +39,21 @@
+@@ -38,6 +39,21 @@ int __xipram cfi_qry_present(struct map_info *map, __u32 base,
  	val[1] = map_read(map, base + osf*0x11);
  	val[2] = map_read(map, base + osf*0x12);
  
@@ -32,3 +42,6 @@ index f992418..7139d028 100644
  	if (!map_word_equal(map, qry[0], val[0]))
  		return 0;
  
+-- 
+1.8.1.5
+
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-match-cfi-qry.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-match-cfi-qry.patch
index e3fbf2e..a315d93 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-match-cfi-qry.patch
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-match-cfi-qry.patch
@@ -1,8 +1,18 @@
+From 66ec11df6561d5ba7cdf41977af828a53ba6b99f Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Sat, 1 Feb 2014 13:17:24 +0100
+Subject: [PATCH] mtd: cfi_util.c: force CFI detection of 2x LH28F640BF
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ drivers/mtd/chips/cfi_util.c | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
 diff --git a/drivers/mtd/chips/cfi_util.c b/drivers/mtd/chips/cfi_util.c
-index f992418..7139d028 100644
+index f992418..2c7a13d 100644
 --- a/drivers/mtd/chips/cfi_util.c
 +++ b/drivers/mtd/chips/cfi_util.c
-@@ -29,6 +29,7 @@
+@@ -29,6 +29,7 @@ int __xipram cfi_qry_present(struct map_info *map, __u32 base,
  	int osf = cfi->interleave * cfi->device_type;	/* scale factor */
  	map_word val[3];
  	map_word qry[3];
@@ -10,7 +20,7 @@ index f992418..7139d028 100644
  
  	qry[0] = cfi_build_cmd('Q', map, cfi);
  	qry[1] = cfi_build_cmd('R', map, cfi);
-@@ -38,6 +39,21 @@
+@@ -38,6 +39,21 @@ int __xipram cfi_qry_present(struct map_info *map, __u32 base,
  	val[1] = map_read(map, base + osf*0x11);
  	val[2] = map_read(map, base + osf*0x12);
  
@@ -32,3 +42,6 @@ index f992418..7139d028 100644
  	if (!map_word_equal(map, qry[0], val[0]))
  		return 0;
  
+-- 
+1.8.1.5
+
-- 
1.8.1.5


