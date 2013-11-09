Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id B14FF6D1D5
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Nov 2013 18:02:16 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id t10so1635017eei.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Nov 2013 10:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3O522y4jGiEO8fw2S6To/X0xRh3yS0W1V2hJRSTgvl0=;
	b=pbvq8MD3WCA6p901A1ifr9wRSA4zZWeeqChHbrzfWb7dGkt1uT++5cB8Jv/AhVrV2q
	wLz4uuao1RYsGXtjD9VBN6p735vuUL4EpO69BR52uWTW+lVGiXbA/XP7aGBaTCHRa1K+
	8BQcEYeppMGcljBQmLDfuBreMFL4M+AZqvjNXbPw+V87tICuvKQEMbZ/kXRCXS5Vbai2
	DGjhwy9UkvVEGC9TnoVrHSevll3toGdGODnf3StaJy6BUC+22UReC3sYwgXg14It+0Ke
	6pCpr4YeVVnYII0B3gR8Fa8pM69noNnTIDc7LEEL6OSrbK70u4e7Lhn4Vb+UXUY3ZJIm
	P7OQ==
X-Received: by 10.14.221.73 with SMTP id q49mr24164259eep.25.1384020138302;
	Sat, 09 Nov 2013 10:02:18 -0800 (PST)
Received: from mizar.localdomain
	(host48-255-dynamic.0-79-r.retail.telecomitalia.it. [79.0.255.48])
	by mx.google.com with ESMTPSA id z1sm38784380eeo.14.2013.11.09.10.02.17
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Nov 2013 10:02:17 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Nov 2013 19:02:08 +0100
Message-Id: <1384020128-15779-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1384020128-15779-1-git-send-email-andrea.adami@gmail.com>
References: <1384020128-15779-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH] linux-yocto: collie: readd bootblock partition
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

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-yocto-3.10/collie/collie.scc       |  1 +
 .../patches/patches-sa1100/collie-add-bootblock.patch   | 29 ++++++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-sa1100/collie-add-bootblock.patch

diff --git a/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc b/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc
index f66b7be..21869f0 100644
--- a/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc
+++ b/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc
@@ -12,3 +12,4 @@ patch ../patches/patches-mtd/collie-force-cfi.patch
 patch ../patches/patches-mtd/collie-mtd-resize.patch
 patch ../patches/patches-mtd/collie-force-unlock.patch
 patch ../patches/patches-sa1100/collie-irda.patch
+patch ../patches/patches-sa1100/collie-add-bootblock.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.10/patches/patches-sa1100/collie-add-bootblock.patch b/recipes-kernel/linux/linux-yocto-3.10/patches/patches-sa1100/collie-add-bootblock.patch
new file mode 100644
index 0000000..fb7b724
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.10/patches/patches-sa1100/collie-add-bootblock.patch
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
-- 
1.8.1.5


