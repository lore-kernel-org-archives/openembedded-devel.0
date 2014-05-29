Return-Path: <>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id A0A4E6FD49
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 May 2014 22:56:25 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id hi2so153164wib.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 May 2014 15:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=jgCsY0Im/4mGNzgVqKWYxWR/Cx+tddpIJ6WVWuHnG8s=;
	b=kdaDJOqMwfqZz8OF0N6q7RQhwdMElJkVhY/IYU0CyuMGtt9MrbixVy1Ipqk2+HhW9n
	E9mgYT/gyYjSJ2LyFTH46GlC8sP/yqqfe4XsEHjhbXY0Lf/B+SGcRh8uquy9uHococdA
	wkn+7f+O6vt4K9Wy19TVbTFL75OK4WlVKaQ+1V8Y38H5g+12Offxno8RgZRyH8+cF3v/
	IA+wCo9oF+FXoV0SKDWvWRbe006MqZkmtjBS5RLv0OeGkalNwx+yuq+yJbp6/WsTreDP
	VpvEEmELPnPew02xtYxXwUVD2X75o+bOEVI3yhUbPew+SDB+sRzQdGOh6ILsWcth1Shz
	ZdVA==
X-Received: by 10.194.243.104 with SMTP id wx8mr15162020wjc.32.1401404186496; 
	Thu, 29 May 2014 15:56:26 -0700 (PDT)
Received: from mizar.208.67.220.220
	(host160-222-dynamic.7-79-r.retail.telecomitalia.it. [79.7.222.160])
	by mx.google.com with ESMTPSA id dk10sm645930wib.1.2014.05.29.15.56.25
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 May 2014 15:56:25 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
X-Google-Original-From: Andrea Adami <andrea.adami@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 May 2014 00:56:07 +0200
Message-Id: <1401404169-5953-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-handheld][PATCH 1/3] linux-yocto_3.14: hx4700: v 3.14.4: remove upstreamed patch
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
X-List-Received-Date: Thu, 29 May 2014 22:56:29 -0000

From: Andrea Adami <andrea.adami@gmail.com>

commit id=b98c1e1c1f71ab32e755e2e417e9a682865578b8

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 ...700.h-include-irqs.h-for-PXA_NR_BUILTIN_G.patch | 35 ----------------------
 recipes-kernel/linux/linux-yocto_3.14.bbappend     |  1 -
 2 files changed, 36 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/hx4700/hx4700.h-include-irqs.h-for-PXA_NR_BUILTIN_G.patch

diff --git a/recipes-kernel/linux/linux-yocto-3.14/hx4700/hx4700.h-include-irqs.h-for-PXA_NR_BUILTIN_G.patch b/recipes-kernel/linux/linux-yocto-3.14/hx4700/hx4700.h-include-irqs.h-for-PXA_NR_BUILTIN_G.patch
deleted file mode 100644
index ee92352..0000000
--- a/recipes-kernel/linux/linux-yocto-3.14/hx4700/hx4700.h-include-irqs.h-for-PXA_NR_BUILTIN_G.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 75249379d18d5bde2d38edb77e1723481d470757 Mon Sep 17 00:00:00 2001
-From: Andrea Adami <andrea.adami@gmail.com>
-Date: Sat, 5 Apr 2014 18:09:07 +0200
-Subject: [PATCH] ARM: pxa: hx4700.h: include "irqs.h" for
- PXA_NR_BUILTIN_GPIO
-
-hx4700 needs the same fix as in 
-9705e74671f0e4f994d86b00cecf441917c64a66
-"ARM: pxa: fix various compilation problems"
-
-Fix build errors. Initial one is:
-/linux/arch/arm/mach-pxa/include/mach/hx4700.h:18:32: error:
- 'PXA_NR_BUILTIN_GPIO' undeclared here (not in a function)
-|  #define HX4700_ASIC3_GPIO_BASE PXA_NR_BUILTIN_GPIO
-
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
----
- arch/arm/mach-pxa/include/mach/hx4700.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/arch/arm/mach-pxa/include/mach/hx4700.h b/arch/arm/mach-pxa/include/mach/hx4700.h
-index 8bc0291..0e1bb46 100644
---- a/arch/arm/mach-pxa/include/mach/hx4700.h
-+++ b/arch/arm/mach-pxa/include/mach/hx4700.h
-@@ -14,6 +14,7 @@
- 
- #include <linux/gpio.h>
- #include <linux/mfd/asic3.h>
-+#include "irqs.h" /* PXA_NR_BUILTIN_GPIO */
- 
- #define HX4700_ASIC3_GPIO_BASE	PXA_NR_BUILTIN_GPIO
- #define HX4700_EGPIO_BASE	(HX4700_ASIC3_GPIO_BASE + ASIC3_NUM_GPIOS)
--- 
-1.8.1.5
-
diff --git a/recipes-kernel/linux/linux-yocto_3.14.bbappend b/recipes-kernel/linux/linux-yocto_3.14.bbappend
index 12f910a..9591f1a 100644
--- a/recipes-kernel/linux/linux-yocto_3.14.bbappend
+++ b/recipes-kernel/linux/linux-yocto_3.14.bbappend
@@ -110,7 +110,6 @@ SRC_URI_append_hx4700 = " \
            file://defconfig \
            file://OE-vga-logo.patch \
            file://hx4700-change-led-trigger-assignments.patch \
-           file://hx4700.h-include-irqs.h-for-PXA_NR_BUILTIN_G.patch \
            "
 
 SRC_URI_append_poodle = " \
-- 
1.9.1


