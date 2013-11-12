Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id D81516D7EF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2013 21:57:15 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id e53so3478506eek.14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2013 13:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Ku0MdmlwVAAMF2zpzACf3p4mUouvKxvCv8NfF9Bgq+Q=;
	b=iEO90L1Zco7VnqWc48JGZ6HAKgGFLOvqD+/gcDWHDtGhXhEMDubpH7vCb6pytQnWz9
	jxB4cuP/1BfK9nqmi4TOMcf/2ByaximOVo8KqHZu9WZCKJ2OjiTx2NOl/qMSVfRinWEa
	zbpfKEt/OBacg9yUHbAfRpTvOeKAmvtGXElPXU9M2QedvcZQQrrQI6PWLiFRudgSqd9z
	sHtFdVJfH6wfxswnOvD3/f16sZ1MMN0oHBDKivVTRe9ka7nhVAqHVuGrNtA28uxLIGMG
	GceStJn6c+MhvMoRKYc/FUZET70Y1BW9djOyuYRERRSKdL2iXqEqEsx3hMtvrG+REVGf
	MWJQ==
X-Received: by 10.15.32.198 with SMTP id a46mr44556342eev.31.1384293436393;
	Tue, 12 Nov 2013 13:57:16 -0800 (PST)
Received: from mizar.localdomain ([95.232.250.41])
	by mx.google.com with ESMTPSA id
	v45sm80571548eef.11.2013.11.12.13.57.15 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Nov 2013 13:57:16 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Nov 2013 22:57:13 +0100
Message-Id: <1384293433-2703-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] linux-yocto-dev: remove upstreamed sharpsl_param patch
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
X-List-Received-Date: Tue, 12 Nov 2013 21:57:16 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-yocto-dev/akita/akita.scc          |  2 -
 recipes-kernel/linux/linux-yocto-dev/c7x0/c7x0.scc |  2 -
 .../patches/patches-pxa/sharpsl_param.patch        | 61 ----------------------
 .../linux/linux-yocto-dev/poodle/poodle.scc        |  1 -
 .../linux/linux-yocto-dev/spitz/spitz.scc          |  2 -
 recipes-kernel/linux/linux-yocto-dev/tosa/tosa.scc |  2 -
 6 files changed, 70 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-yocto-dev/patches/patches-pxa/sharpsl_param.patch

diff --git a/recipes-kernel/linux/linux-yocto-dev/akita/akita.scc b/recipes-kernel/linux/linux-yocto-dev/akita/akita.scc
index 11b9e94..a7f542a 100644
--- a/recipes-kernel/linux/linux-yocto-dev/akita/akita.scc
+++ b/recipes-kernel/linux/linux-yocto-dev/akita/akita.scc
@@ -4,5 +4,3 @@ kconf hardware akita.cfg
 include ../zaurus-pxa-only.scc
 include ../zaurus-common.scc
 include ../zaurus-usb-host.scc
-
-patch ../patches/patches-pxa/sharpsl_param.patch
diff --git a/recipes-kernel/linux/linux-yocto-dev/c7x0/c7x0.scc b/recipes-kernel/linux/linux-yocto-dev/c7x0/c7x0.scc
index ddd5c49..662a7b7 100644
--- a/recipes-kernel/linux/linux-yocto-dev/c7x0/c7x0.scc
+++ b/recipes-kernel/linux/linux-yocto-dev/c7x0/c7x0.scc
@@ -2,5 +2,3 @@ kconf hardware c7x0.cfg
 
 include ../zaurus-pxa-only.scc
 include ../zaurus-common.scc
-
-patch ../patches/patches-pxa/sharpsl_param.patch
diff --git a/recipes-kernel/linux/linux-yocto-dev/patches/patches-pxa/sharpsl_param.patch b/recipes-kernel/linux/linux-yocto-dev/patches/patches-pxa/sharpsl_param.patch
deleted file mode 100644
index 267fdbd..0000000
--- a/recipes-kernel/linux/linux-yocto-dev/patches/patches-pxa/sharpsl_param.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From f95dcc12f8bceed2c1c929c49e3f0397338de8a6 Mon Sep 17 00:00:00 2001
-From: Andrea Adami <andrea.adami@gmail.com>
-Date: Thu, 26 Sep 2013 23:28:44 +0200
-Subject: sharpsl_param.c: fix invalid memory access for pxa devices
-
-This fixes a regression for kernels after v3.2
-
-After commit 72662e01088394577be4a3f14da94cf87bea2591
-ARM: head.S: only include __turn_mmu_on in the initial identity mapping
-
-Zaurus PXA devices call sharpsl_save_param() during fixup and hang on
-boot because memcpy refers to physical addresses no longer valid if the
-MMU is setup.
-Zaurus collie (SA1100) is unaffected (function is called in init_machine).
-
-The code was making assumptions and for PXA the virtual address
-should have been used before.
-
-KernelVersion: 3.12-rc2
-
-Signed-off-by: Marko Katic <dromede@gmail.com>
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
----
- arch/arm/common/sharpsl_param.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/arch/arm/common/sharpsl_param.c b/arch/arm/common/sharpsl_param.c
-index d56c932..025f6ce 100644
---- a/arch/arm/common/sharpsl_param.c
-+++ b/arch/arm/common/sharpsl_param.c
-@@ -15,6 +15,7 @@
- #include <linux/module.h>
- #include <linux/string.h>
- #include <asm/mach/sharpsl_param.h>
-+#include <asm/memory.h>
- 
- /*
-  * Certain hardware parameters determined at the time of device manufacture,
-@@ -25,8 +26,10 @@
-  */
- #ifdef CONFIG_ARCH_SA1100
- #define PARAM_BASE	0xe8ffc000
-+#define param_start(x)	(void *)(x)
- #else
- #define PARAM_BASE	0xa0000a00
-+#define param_start(x)	__va(x)
- #endif
- #define MAGIC_CHG(a,b,c,d) ( ( d << 24 ) | ( c << 16 )  | ( b << 8 ) | a )
- 
-@@ -41,7 +44,7 @@ EXPORT_SYMBOL(sharpsl_param);
- 
- void sharpsl_save_param(void)
- {
--	memcpy(&sharpsl_param, (void *)PARAM_BASE, sizeof(struct sharpsl_param_info));
-+	memcpy(&sharpsl_param, param_start(PARAM_BASE), sizeof(struct sharpsl_param_info));
- 
- 	if (sharpsl_param.comadj_keyword != COMADJ_MAGIC)
- 		sharpsl_param.comadj=-1;
--- 
-1.8.1.5
-
diff --git a/recipes-kernel/linux/linux-yocto-dev/poodle/poodle.scc b/recipes-kernel/linux/linux-yocto-dev/poodle/poodle.scc
index 39015f2..e6bd6ac 100644
--- a/recipes-kernel/linux/linux-yocto-dev/poodle/poodle.scc
+++ b/recipes-kernel/linux/linux-yocto-dev/poodle/poodle.scc
@@ -4,4 +4,3 @@ include ../zaurus-pxa-only.scc
 include ../zaurus-common.scc
 
 patch ../patches/patches-locomokbd/locomo_kbd_tweak-r2.patch
-patch ../patches/patches-pxa/sharpsl_param.patch
diff --git a/recipes-kernel/linux/linux-yocto-dev/spitz/spitz.scc b/recipes-kernel/linux/linux-yocto-dev/spitz/spitz.scc
index ba4c7b5..4508a3c 100644
--- a/recipes-kernel/linux/linux-yocto-dev/spitz/spitz.scc
+++ b/recipes-kernel/linux/linux-yocto-dev/spitz/spitz.scc
@@ -3,5 +3,3 @@ kconf hardware spitz.cfg
 include ../zaurus-pxa-only.scc
 include ../zaurus-common.scc
 include ../zaurus-usb-host.scc
-
-patch ../patches/patches-pxa/sharpsl_param.patch
diff --git a/recipes-kernel/linux/linux-yocto-dev/tosa/tosa.scc b/recipes-kernel/linux/linux-yocto-dev/tosa/tosa.scc
index 2299116..b53d584 100644
--- a/recipes-kernel/linux/linux-yocto-dev/tosa/tosa.scc
+++ b/recipes-kernel/linux/linux-yocto-dev/tosa/tosa.scc
@@ -3,5 +3,3 @@ kconf hardware tosa.cfg
 include ../zaurus-pxa-only.scc
 include ../zaurus-common.scc
 include ../zaurus-usb-host.scc
-
-patch ../patches/patches-pxa/sharpsl_param.patch
-- 
1.8.1.5


