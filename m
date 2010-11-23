Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PKwB0-0006NV-W1
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 17:57:07 +0100
Received: (qmail 14383 invoked by uid 503); 23 Nov 2010 17:00:14 -0000
Received: from b9.ovh.net (HELO mail428.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 23 Nov 2010 17:00:13 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 23 Nov 2010 18:55:49 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 23 Nov 2010 18:55:48 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Nov 2010 17:53:14 +0100
Message-Id: <1290531194-31338-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1290531194-31338-1-git-send-email-eric@eukrea.com>
References: <1290531194-31338-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 17443567258021375306
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.27.225
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] mx31ads: make linux 2.6.36 compile
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Nov 2010 16:57:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

and set this kernel as default version for now.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 .../mx31ads/0001-add-missing-include.patch         |   52 ++++++++++++++++++++
 recipes/linux/linux_2.6.36.bb                      |    3 +
 2 files changed, 55 insertions(+), 0 deletions(-)
 create mode 100644 recipes/linux/linux-2.6.36/mx31ads/0001-add-missing-include.patch

diff --git a/recipes/linux/linux-2.6.36/mx31ads/0001-add-missing-include.patch b/recipes/linux/linux-2.6.36/mx31ads/0001-add-missing-include.patch
new file mode 100644
index 0000000..c76b987
--- /dev/null
+++ b/recipes/linux/linux-2.6.36/mx31ads/0001-add-missing-include.patch
@@ -0,0 +1,52 @@
+From d123b6ce668fe331c31c504e8d611d0cf7f48a39 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
+Date: Mon, 22 Nov 2010 21:37:50 +0100
+Subject: [PATCH] add missing include
+
+---
+ arch/arm/plat-mxc/include/mach/board-mx31ads.h |   33 +++++++++++++++++++++++++++++
+ 1 files changed, 33 insertions(+), 0 deletions(-)
+ create mode 100644 arch/arm/plat-mxc/include/mach/board-mx31ads.h
+
+diff --git a/arch/arm/plat-mxc/include/mach/board-mx31ads.h b/arch/arm/plat-mxc/include/mach/board-mx31ads.h
+new file mode 100644
+index 0000000..94b60dd
+--- /dev/null
++++ b/arch/arm/plat-mxc/include/mach/board-mx31ads.h
+@@ -0,0 +1,33 @@
++/*
++ * Copyright 2005-2007 Freescale Semiconductor, Inc. All Rights Reserved.
++ */
++
++/*
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ */
++
++#ifndef __ASM_ARCH_MXC_BOARD_MX31ADS_H__
++#define __ASM_ARCH_MXC_BOARD_MX31ADS_H__
++
++#include <mach/hardware.h>
++
++/*
++ * These symbols are used by drivers/net/cs89x0.c.
++ * This is ugly as hell, but we have to provide them until
++ * someone fixed the driver.
++ */
++
++/* Base address of PBC controller */
++#define PBC_BASE_ADDRESS        MX31_CS4_BASE_ADDR_VIRT
++/* Offsets for the PBC Controller register */
++
++/* Ethernet Controller IO base address */
++#define PBC_CS8900A_IOBASE      0x020000
++
++#define MXC_EXP_IO_BASE		(MXC_BOARD_IRQ_START)
++
++#define EXPIO_INT_ENET_INT	(MXC_EXP_IO_BASE + 8)
++
++#endif /* __ASM_ARCH_MXC_BOARD_MX31ADS_H__ */
+-- 
+1.7.2.3
+
diff --git a/recipes/linux/linux_2.6.36.bb b/recipes/linux/linux_2.6.36.bb
index d15dcee..a395c04 100644
--- a/recipes/linux/linux_2.6.36.bb
+++ b/recipes/linux/linux_2.6.36.bb
@@ -2,9 +2,12 @@ require linux.inc
 
 # Mark archs/machines that this kernel supports
 DEFAULT_PREFERENCE = "-1"
+DEFAULT_PREFERENCE_mx31ads = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/${P}.tar.bz2;name=kernel \
            file://defconfig "
 
+SRC_URI_append_mx31ads = "file://0001-add-missing-include.patch"
+
 SRC_URI[kernel.md5sum] = "61f3739a73afb6914cb007f37fb09b62"
 SRC_URI[kernel.sha256sum] = "15a076d1a435a6bf8e92834eba4b390b4ec094ce06d47f89d071ca9e5788ce04"
-- 
1.6.3.3



