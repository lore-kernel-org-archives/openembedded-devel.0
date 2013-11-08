Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 18F516D5A0
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2013 01:03:01 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id d10so730028eaj.26
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Nov 2013 17:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=+0FZicUghQxNu9nSMdu8ZRkD1255IlDFLDrUim1fmoA=;
	b=ltWOV7UiNXVmayPqAzs9Pt4IqpQQei9TIxose9IOqfYKfDEyNzRiMAg8jFSlsznKDT
	/dhfHknwqqXeHtP6Xlc4/FqMkIl/36JZAFMLe/gHcl8Ys2MdsBpxhbGSJf3wf6Um1DxU
	C7fzwdPMAkiSllOsZP1qzUBhEnP61QqEulF3oPPYNfarMgTsUqAEZnWJEmOCJW3+OecI
	VCxgwKO9+ovJFabCa1O8iVVFCu/1mSfzNTJUIs4BTF8bckH3Txqe2AXRgzxClEk/zEvL
	lb/DzxvUFEuvgehlx6UZrK7SYPP3f8AgD3Y3tADv+f5rYYmfBzVZjl+HAKzVREwquB6w
	Sb0A==
X-Received: by 10.14.198.66 with SMTP id u42mr2911een.80.1383872583692;
	Thu, 07 Nov 2013 17:03:03 -0800 (PST)
Received: from mizar.localdomain
	(host33-1-dynamic.51-79-r.retail.telecomitalia.it. [79.51.1.33])
	by mx.google.com with ESMTPSA id
	v45sm15949739eef.11.2013.11.07.17.03.03 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Nov 2013 17:03:03 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Nov 2013 02:02:33 +0100
Message-Id: <caf4c77c3b2b06b234dbedb969e3563ac52b6188.1383870605.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <cover.1383870605.git.andrea.adami@gmail.com>
References: <cover.1383870605.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1383870605.git.andrea.adami@gmail.com>
References: <cover.1383870605.git.andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 6/6] linux-yocto: collie: force flash unlock on boot
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
X-List-Received-Date: Fri, 08 Nov 2013 01:03:02 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-yocto-3.10/collie/collie.scc       |  1 +
 .../patches/patches-mtd/collie-force-unlock.patch  | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-force-unlock.patch

diff --git a/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc b/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc
index fb904ed..3b9b55a 100644
--- a/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc
+++ b/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc
@@ -10,3 +10,4 @@ patch ../patches/patches-mfd/ucb1x00-device.patch
 patch ../patches/patches-mtd/collie-eraseinfo.patch
 patch ../patches/patches-mtd/collie-force-cfi.patch
 patch ../patches/patches-mtd/collie-mtd-resize.patch
+patch ../patches/patches-mtd/collie-force-unlock.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-force-unlock.patch b/recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-force-unlock.patch
new file mode 100644
index 0000000..d599d1d
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-force-unlock.patch
@@ -0,0 +1,22 @@
+From c39115ed52359eb5f0475ea2b4a2e71acb5da54b Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Thu, 7 Nov 2013 23:17:36 +0100
+Subject: [PATCH] collie: force flash unlock on boot
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ drivers/mtd/chips/cfi_cmdset_0001.c | 1 +
+ 1 file changed, 1 insertions(+), 0 deletion(-)
+
+diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
+index 7751443..d9d6f0e 100644
+--- a/drivers/mtd/chips/cfi_cmdset_0001.c
++++ b/drivers/mtd/chips/cfi_cmdset_0001.c
+@@ -310,6 +310,7 @@ static struct cfi_fixup cfi_fixup_table[] = {
+ 	{ CFI_MFR_ST, 0x00ba, /* M28W320CT */ fixup_st_m28w320ct },
+ 	{ CFI_MFR_ST, 0x00bb, /* M28W320CB */ fixup_st_m28w320cb },
+ 	{ CFI_MFR_INTEL, CFI_ID_ANY, fixup_unlock_powerup_lock },
++	{ CFI_MFR_SHARP, 0x00b0, fixup_unlock_powerup_lock },
+ 	{ 0, 0, NULL }
+ };
+ 
-- 
1.8.1.5


