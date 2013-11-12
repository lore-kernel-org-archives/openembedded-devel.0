Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8BD086D357
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2013 21:41:28 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id e51so3449210eek.40
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2013 13:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KD+1uvm3DPa4/7BHva2Pi3wVt7w3S6zElebH+9AK95g=;
	b=Ejra5jjQQAngBSeM6Alwbb1ByYw6YWFuYHg3PDI1GvG0vfOOcNKbgXCnpXRJgTgYzd
	filesfaOvINZcw7Sj0NvHmYuTJKtr2ZXy57rth3neyfnUeTEBfcv15EfpwGLfooaUd5c
	NOICH5BGAKk3xxRcAWKZuNymy8tafwR7qzAR2Mx1l2eA76jHhvl1r/l5w037Aeoa2ur6
	ruekUtynx3EZOapf0UQvRxRewXKv8J2snJZQroyojrDAAWV6fkm2MVNUSbxRslh6IsXb
	nWzQDbeC8Ju1gVN+Ey6JGoAb1MNRzd5xi9IBD060C+P9/dmWa81tuMFGBBHH/gjeZN6d
	Bwbg==
X-Received: by 10.14.32.196 with SMTP id o44mr44700337eea.43.1384292489893;
	Tue, 12 Nov 2013 13:41:29 -0800 (PST)
Received: from mizar.localdomain ([95.232.250.41])
	by mx.google.com with ESMTPSA id 8sm80503340eem.15.2013.11.12.13.41.29
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Nov 2013 13:41:29 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Nov 2013 22:41:18 +0100
Message-Id: <1384292479-15815-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1384292479-15815-1-git-send-email-andrea.adami@gmail.com>
References: <1384292479-15815-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH] linux-yocto: collie: add fix for locomo driver
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
X-List-Received-Date: Tue, 12 Nov 2013 21:41:29 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-yocto-3.10/collie/collie.scc       |  1 +
 .../patches-locomo/locomo-fix-SCL-SDA.patch        | 28 ++++++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-locomo/locomo-fix-SCL-SDA.patch

diff --git a/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc b/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc
index 45d296f..f15c53e 100644
--- a/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc
+++ b/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc
@@ -20,3 +20,4 @@ patch ../patches/patches-sa1100/fbdev-sa1100fb-make-use-of-device-clock.patch
 patch ../patches/patches-sa1100/pcmcia-sa1100-device-clock.patch
 patch ../patches/patches-sa1100/pcmcia-clock-alias-sa1111.patch
 patch ../patches/patches-sa1100/pcmcia-sa1111-device-clock.patch
+patch ../patches/patches-locomo/locomo-fix-SCL-SDA.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.10/patches/patches-locomo/locomo-fix-SCL-SDA.patch b/recipes-kernel/linux/linux-yocto-3.10/patches/patches-locomo/locomo-fix-SCL-SDA.patch
new file mode 100644
index 0000000..3336e2b
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.10/patches/patches-locomo/locomo-fix-SCL-SDA.patch
@@ -0,0 +1,28 @@
+From acc2f94781ab11bead994bb3faaad149f9187bd4 Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Tue, 12 Nov 2013 22:21:20 +0100
+Subject: [PATCH] linux-yocto: collie: locomo.c: fix SCL line instead
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
-- 
1.8.1.5


