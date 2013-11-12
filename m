Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3D0C56D775
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2013 01:11:10 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id o10so3124564eaj.41
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Nov 2013 17:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PNJeRUV7OZX2zP3M/JqHENeuLGmIw6N+fmABb/JfBmk=;
	b=D14FfN/U7i0gwpc8hCgnlqh731EuH1AGHmOlnjRPlSdE1j3UNuEWI/b3G4Mlan4TXS
	FvxOyEV3KZACzJz//AOw8FeWirWv3OXHP8UHJJSnbCXnWHuu0lP11xYmSbhDmSzvfex7
	PkNh0nShg70uJ5+s3LJD1srCe1HIdSSjYkkUzr/8kXyG/AS6T4Q/qZlADUWHkI/anxfu
	+EWGbSQmV8zlXV/fGludrjIYNkIMHpGRDnmZRoT+nlOcalVCdh1JY25JL3wq5ak2hOMU
	uw7hnpdfMWnn/66ZfyQH2KkIkEvOco2tgrldx70FIH/cbt27l2NG+9QwIhFMtZ+SX6lo
	aSFw==
X-Received: by 10.14.107.68 with SMTP id n44mr38913704eeg.26.1384218671670;
	Mon, 11 Nov 2013 17:11:11 -0800 (PST)
Received: from mizar.localdomain ([95.232.250.41])
	by mx.google.com with ESMTPSA id 1sm8671402eeg.4.2013.11.11.17.11.10
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Nov 2013 17:11:11 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Nov 2013 02:11:04 +0100
Message-Id: <1384218664-17687-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1384218664-17687-1-git-send-email-andrea.adami@gmail.com>
References: <1384218664-17687-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 2/2] linux-yocto: collie: MTD: disable erase suspend on write
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
X-List-Received-Date: Tue, 12 Nov 2013 01:11:10 -0000

Try to fix frequent errors like:
sa1100: Chip not ready for buffer write. Xstatus = 80808080, status = 80808080

 0x80 = 01010000 so the bits are SR4 and SR6
 SR4 = Error in (page buffer) program or OTP program (PBPOPS)
 SR6 = Block erase suspended  (BESS)

Now with the fixup the msg is:
SR.4 or SR.5 bits set in buffer write (status ffffffff). Clearing.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-yocto-3.10/collie/collie.scc       |  2 +-
 .../patches-mtd/collie-fixup-strataflash.patch     | 27 ++++++++++++++++++++++
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-fixup-strataflash.patch

diff --git a/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc b/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc
index 097dcbd..fc8acab 100644
--- a/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc
+++ b/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc
@@ -14,6 +14,6 @@ patch ../patches/patches-mtd/collie-mtd-resize.patch
 patch ../patches/patches-mtd/collie-force-unlock.patch
 patch ../patches/patches-sa1100/collie-irda.patch
 patch ../patches/patches-sa1100/collie-add-bootblock.patch
-
+patch ../patches/patches-mtd/collie-fixup-strataflash.patch
 patch ../patches/patches-sa1100/arm-sa1100-add-cpu-clock.patch
 patch ../patches/patches-sa1100/fbdev-sa1100fb-make-use-of-device-clock.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-fixup-strataflash.patch b/recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-fixup-strataflash.patch
new file mode 100644
index 0000000..1fef596
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-fixup-strataflash.patch
@@ -0,0 +1,27 @@
+From 64fab473fe31b5c8a76000d7e82df7f6cdd751ba Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Tue, 12 Nov 2013 01:28:18 +0100
+Subject: [PATCH 627/627] linux-yocto: collie: add MTD fixup like for Intel
+ Strataflash
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ drivers/mtd/chips/cfi_cmdset_0001.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
+index d9d6f0e..eedb60b 100644
+--- a/drivers/mtd/chips/cfi_cmdset_0001.c
++++ b/drivers/mtd/chips/cfi_cmdset_0001.c
+@@ -36,7 +36,7 @@
+ #include <linux/mtd/mtd.h>
+ #include <linux/mtd/cfi.h>
+ 
+-/* #define CMDSET0001_DISABLE_ERASE_SUSPEND_ON_WRITE */
++#define CMDSET0001_DISABLE_ERASE_SUSPEND_ON_WRITE
+ /* #define CMDSET0001_DISABLE_WRITE_SUSPEND */
+ 
+ // debugging, turns off buffer write mode if set to 1
+-- 
+1.8.1.5
+
-- 
1.8.1.5


