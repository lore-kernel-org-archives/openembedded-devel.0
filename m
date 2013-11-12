Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id CB25C6D357
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2013 21:41:30 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id z16so304190ead.34
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2013 13:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=V2lGe7U7S9X4KHmL3AOyDFIh1vwqGmulJ8QanKMqtec=;
	b=PlJzqU6vrh1wEW/chRNDg07sFnWjL/vU31YUgSQ9CNyXsvDveiRXRoPpsCvBE2JxQK
	elObyNEuqI7amJbu5/PCUZRI4/e0HOPdJbygB5tUrKAlBwViybVCUaE/iXWCtAsGhmr+
	vPJKpgv0GcvA6c9xpTQfTxZpF40Iq8b28Y9+T7nbLqKoKEvaN78/oGOcDyWn5SSMg+Wp
	SwIoeMJfQB3m4QCCfw4gPKC5TC+35PQWOLCckGvS6z9kq7JAwxtTtOw9zpdFCKMmBtUi
	lJKNmPy+jm26oveuXIA+feCM342Ib9qE1JBZzyeedEhxlDPDZxStPszCinF7z4e2QJ6G
	T3Kw==
X-Received: by 10.14.219.198 with SMTP id m46mr43878808eep.41.1384292491931;
	Tue, 12 Nov 2013 13:41:31 -0800 (PST)
Received: from mizar.localdomain ([95.232.250.41])
	by mx.google.com with ESMTPSA id 8sm80503340eem.15.2013.11.12.13.41.31
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Nov 2013 13:41:31 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Nov 2013 22:41:19 +0100
Message-Id: <1384292479-15815-3-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1384292479-15815-1-git-send-email-andrea.adami@gmail.com>
References: <1384292479-15815-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH] linux-yocto: collie: properly readd cfi_probe
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
X-List-Received-Date: Tue, 12 Nov 2013 21:41:31 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-yocto-3.10/collie/collie.scc       |  3 ++-
 .../patches-mtd/collie-cfi-probe-again.patch       | 29 ++++++++++++++++++++++
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-cfi-probe-again.patch

diff --git a/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc b/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc
index f15c53e..d8c2360 100644
--- a/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc
+++ b/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc
@@ -6,9 +6,10 @@ patch ../patches/patches-locomokbd/locomo_kbd_tweak-r2.patch
 patch ../patches/patches-power/collie_battery-dev-pm.patch
 patch ../patches/patches-mfd/mcp-device.patch
 patch ../patches/patches-mfd/ucb1x00-device.patch
-//patch ../patches/patches-mtd/collie-jedec-probe.patch
+patch ../patches/patches-mtd/collie-jedec-probe.patch
 patch ../patches/patches-mtd/collie-eraseinfo.patch
 // for 3.12
+patch ../patches/patches-mtd/collie-cfi-probe-again.patch
 patch ../patches/patches-mtd/collie-force-cfi.patch
 patch ../patches/patches-mtd/collie-mtd-resize.patch
 patch ../patches/patches-mtd/collie-force-unlock.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-cfi-probe-again.patch b/recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-cfi-probe-again.patch
new file mode 100644
index 0000000..7a0dbe5
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-cfi-probe-again.patch
@@ -0,0 +1,29 @@
+From 35957eda21bdd2f22c84fa269c1b856f5039c308 Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Tue, 12 Nov 2013 22:32:26 +0100
+Subject: [PATCH] sa1100: collie: detect NOR again with cfi_probe
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
-- 
1.8.1.5


