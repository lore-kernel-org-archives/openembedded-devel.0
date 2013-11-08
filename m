Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 80C826D7D8
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2013 01:02:55 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id h15so604492eak.30
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Nov 2013 17:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=xvasGTJNve6ZuSTIC8rlnVc8G1Nd4HBNpj69eY1nyJE=;
	b=EVDflvQ2NqJGxDpB4uw86rEqgwB662+NkKJH+hDy3sFEMZszEj1n//dkm4CmmSdM4q
	ypWYyJv8WsUq32bbOykzB1lbQzOS2GSJoPO426tRQ5KaOW5o2TY6vk7ZEjTx0Spo7NwC
	SqIRWGuo0p+SuD8SrXl7wp/MOFK7e+1I8tA3jOj2T9FkNzK4/FhUNp1bsgFSzaYzuIre
	0WF9WWMhnEVpkpWZkoq+9qLbv2rjAnj+oHvJfA+2v6XXN5cWQcG/QIY4A1Rfgwz9+bLF
	dBpJwefJZbUKywcSqplAR8S4RcUpzBo2a/CvNunwyDivqZzZnQJBiuZOe8QszK5TQwW6
	O9ig==
X-Received: by 10.15.35.196 with SMTP id g44mr12735006eev.18.1383872577059;
	Thu, 07 Nov 2013 17:02:57 -0800 (PST)
Received: from mizar.localdomain
	(host33-1-dynamic.51-79-r.retail.telecomitalia.it. [79.51.1.33])
	by mx.google.com with ESMTPSA id
	v45sm15949739eef.11.2013.11.07.17.02.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Nov 2013 17:02:56 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Nov 2013 02:02:31 +0100
Message-Id: <6964b83eac1c5fe8e4fb7a309a0c0695a8d0684f.1383870605.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <cover.1383870605.git.andrea.adami@gmail.com>
References: <cover.1383870605.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1383870605.git.andrea.adami@gmail.com>
References: <cover.1383870605.git.andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 4/6] linux-yocto: collie: force CFI detection (temporary HACK)
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
X-List-Received-Date: Fri, 08 Nov 2013 01:02:55 -0000

The CFI detection fails but all other reads can be done correctly
Enjoy this hack until the (mis)detection is fixed.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-yocto-3.10/collie/collie.scc       |  1 +
 .../patches/patches-mtd/collie-force-cfi.patch     | 30 ++++++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-force-cfi.patch

diff --git a/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc b/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc
index 4f60d81..536f4b1 100644
--- a/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc
+++ b/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc
@@ -8,3 +8,4 @@ patch ../patches/patches-mfd/mcp-device.patch
 patch ../patches/patches-mfd/ucb1x00-device.patch
 //patch ../patches/patches-mtd/collie-jedec-probe.patch
 patch ../patches/patches-mtd/collie-eraseinfo.patch
+patch ../patches/patches-mtd/collie-force-cfi.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-force-cfi.patch b/recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-force-cfi.patch
new file mode 100644
index 0000000..958fce7
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-force-cfi.patch
@@ -0,0 +1,30 @@
+From c39115ed52359eb5f0475ea2b4a2e71acb5da54b Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Thu, 7 Nov 2013 23:17:36 +0100
+Subject: [PATCH] cfi_util.c: force CFI detection even if Q R Y test
+ fails
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ drivers/mtd/chips/cfi_util.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/mtd/chips/cfi_util.c b/drivers/mtd/chips/cfi_util.c
+index f992418..bdee7b9 100644
+--- a/drivers/mtd/chips/cfi_util.c
++++ b/drivers/mtd/chips/cfi_util.c
+@@ -85,7 +85,10 @@ int __xipram cfi_qry_mode_on(uint32_t base, struct map_info *map,
+ 	if (cfi_qry_present(map, base, cfi))
+ 		return 1;
+ 	/* QRY not found */
+-	return 0;
++/*	return 0; */
++
++/*	FIXME: UGLY HACK: FORCE DETECTION */
++	return 1;
+ }
+ EXPORT_SYMBOL_GPL(cfi_qry_mode_on);
+ 
+-- 
+1.8.1.5
+
-- 
1.8.1.5


