Received: from mail-wg0-f42.google.com ([74.125.82.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1UTJod-00022d-Pk
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Apr 2013 00:30:02 +0200
Received: by mail-wg0-f42.google.com with SMTP id m15so187978wgh.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Apr 2013 15:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=wDk3HBnuH1SBHlYvBG+I3qZTkJjagXJTY1rTbQjwtIY=;
	b=JsewWHjiTy8kwyLo2tjLGoBO5yX64P335AuiVfmQo09Xw/35s9MBOP7p4UMnSNLp/d
	Nk3xd9yCMjhZUJHRKr+EXUcnPqAbIMfv26l4zpQJG5nuBKXn6ToR9X55TVXaa5/M+IEc
	dMut6yQ6iPcvqU+TyzDvG+8MXGKqZxdsjJcZ/iKL2DvcSdPq8Pi/nbiD7wWEJmmCB8rd
	RDRtmrA7t6nM4rFcIUUfwWM0vYG5+ak7NPfAz0fNUg2mVVrDkAmTL6O35ipBuh1O0ja+
	hTQTojBn4xBC2RUsvL3j2VQ/l9pvQT2dQk1meZkDy0Gl9JXQgrKTeYnqCVwd79VBsEug
	SWGQ==
X-Received: by 10.194.89.169 with SMTP id bp9mr29481949wjb.57.1366409544642;
	Fri, 19 Apr 2013 15:12:24 -0700 (PDT)
Received: from mizar.localdomain
	(host202-35-dynamic.252-95-r.retail.telecomitalia.it.
	[95.252.35.202])
	by mx.google.com with ESMTPS id x42sm25981571eee.0.2013.04.19.15.12.23
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 19 Apr 2013 15:12:23 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 20 Apr 2013 00:12:01 +0200
Message-Id: <1366409521-7793-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1366329127-8869-1-git-send-email-andrea.adami@gmail.com>
References: <1366329127-8869-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 1/2 v2] linux-yocto_3.8: move Zaurus patches to the respective subdirs
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
X-List-Received-Date: Fri, 19 Apr 2013 22:30:03 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-yocto-3.8/akita/akita.scc              | 8 ++++----
 recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0.scc                | 6 +++---
 recipes-kernel/linux/linux-yocto-3.8/collie/collie.scc            | 8 ++++----
 .../{ => patches/patches-locomokbd}/locomo_kbd_tweak-r2.patch     | 0
 .../linux-yocto-3.8/{ => patches/patches-mfd}/mcp-device.patch    | 0
 .../{ => patches/patches-mtd}/collie-eraseinfo.patch              | 0
 .../{ => patches/patches-mtd}/collie-jedec-probe.patch            | 0
 .../{ => patches/patches-pxa}/pxa27x-sa1100-rtc.patch             | 0
 .../{ => patches/patches-pxa}/pxamci-regulator.patch              | 0
 .../linux-yocto-3.8/{ => patches/patches-pxa}/sharpsl_param.patch | 0
 .../{ => patches/patches-pxa}/spi-pxa2xx-fix-mem.patch            | 0
 recipes-kernel/linux/linux-yocto-3.8/poodle/poodle.scc            | 8 ++++----
 recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc              | 8 ++++----
 recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.scc                | 6 +++---
 14 files changed, 22 insertions(+), 22 deletions(-)
 rename recipes-kernel/linux/linux-yocto-3.8/{ => patches/patches-locomokbd}/locomo_kbd_tweak-r2.patch (100%)
 rename recipes-kernel/linux/linux-yocto-3.8/{ => patches/patches-mfd}/mcp-device.patch (100%)
 rename recipes-kernel/linux/linux-yocto-3.8/{ => patches/patches-mtd}/collie-eraseinfo.patch (100%)
 rename recipes-kernel/linux/linux-yocto-3.8/{ => patches/patches-mtd}/collie-jedec-probe.patch (100%)
 rename recipes-kernel/linux/linux-yocto-3.8/{ => patches/patches-pxa}/pxa27x-sa1100-rtc.patch (100%)
 rename recipes-kernel/linux/linux-yocto-3.8/{ => patches/patches-pxa}/pxamci-regulator.patch (100%)
 rename recipes-kernel/linux/linux-yocto-3.8/{ => patches/patches-pxa}/sharpsl_param.patch (100%)
 rename recipes-kernel/linux/linux-yocto-3.8/{ => patches/patches-pxa}/spi-pxa2xx-fix-mem.patch (100%)

diff --git a/recipes-kernel/linux/linux-yocto-3.8/akita/akita.scc b/recipes-kernel/linux/linux-yocto-3.8/akita/akita.scc
index b40cb7e..001b11b 100644
--- a/recipes-kernel/linux/linux-yocto-3.8/akita/akita.scc
+++ b/recipes-kernel/linux/linux-yocto-3.8/akita/akita.scc
@@ -5,7 +5,7 @@ include ../zaurus-pxa-only.scc
 include ../zaurus-common.scc
 include ../zaurus-usb-host.scc
 
-patch sharpsl_param.patch
-patch pxa27x-sa1100-rtc.patch
-patch spi-pxa2xx-fix-mem.patch
-patch pxamci-regulator.patch
+patch ../patches/patches-pxa/sharpsl_param.patch
+patch ../patches/patches-pxa/pxa27x-sa1100-rtc.patch
+patch ../patches/patches-pxa/spi-pxa2xx-fix-mem.patch
+patch ../patches/patches-pxa/pxamci-regulator.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0.scc b/recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0.scc
index a732d5e..edb99b6 100644
--- a/recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0.scc
+++ b/recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0.scc
@@ -3,6 +3,6 @@ kconf hardware c7x0.cfg
 include ../zaurus-pxa-only.scc
 include ../zaurus-common.scc
 
-patch sharpsl_param.patch
-patch spi-pxa2xx-fix-mem.patch
-patch pxamci-regulator.patch
+patch ../patches/patches-pxa/sharpsl_param.patch
+patch ../patches/patches-pxa/spi-pxa2xx-fix-mem.patch
+patch ../patches/patches-pxa/pxamci-regulator.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.8/collie/collie.scc b/recipes-kernel/linux/linux-yocto-3.8/collie/collie.scc
index 3f96f24..857586e 100644
--- a/recipes-kernel/linux/linux-yocto-3.8/collie/collie.scc
+++ b/recipes-kernel/linux/linux-yocto-3.8/collie/collie.scc
@@ -2,7 +2,7 @@ kconf hardware collie.cfg
 
 include ../zaurus-common.scc
 
-patch locomo_kbd_tweak-r2.patch
-patch mcp-device.patch
-patch collie-jedec-probe.patch
-patch collie-eraseinfo.patch
+patch ../patches/patches-locomokbd/locomo_kbd_tweak-r2.patch
+patch ../patches/patches-mfd/mcp-device.patch
+patch ../patches/patches-mtd/collie-jedec-probe.patch
+patch ../patches/patches-mtd/collie-eraseinfo.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.8/locomo_kbd_tweak-r2.patch b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-locomokbd/locomo_kbd_tweak-r2.patch
similarity index 100%
rename from recipes-kernel/linux/linux-yocto-3.8/locomo_kbd_tweak-r2.patch
rename to recipes-kernel/linux/linux-yocto-3.8/patches/patches-locomokbd/locomo_kbd_tweak-r2.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.8/mcp-device.patch b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-mfd/mcp-device.patch
similarity index 100%
rename from recipes-kernel/linux/linux-yocto-3.8/mcp-device.patch
rename to recipes-kernel/linux/linux-yocto-3.8/patches/patches-mfd/mcp-device.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.8/collie-eraseinfo.patch b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-mtd/collie-eraseinfo.patch
similarity index 100%
rename from recipes-kernel/linux/linux-yocto-3.8/collie-eraseinfo.patch
rename to recipes-kernel/linux/linux-yocto-3.8/patches/patches-mtd/collie-eraseinfo.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.8/collie-jedec-probe.patch b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-mtd/collie-jedec-probe.patch
similarity index 100%
rename from recipes-kernel/linux/linux-yocto-3.8/collie-jedec-probe.patch
rename to recipes-kernel/linux/linux-yocto-3.8/patches/patches-mtd/collie-jedec-probe.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.8/pxa27x-sa1100-rtc.patch b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/pxa27x-sa1100-rtc.patch
similarity index 100%
rename from recipes-kernel/linux/linux-yocto-3.8/pxa27x-sa1100-rtc.patch
rename to recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/pxa27x-sa1100-rtc.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.8/pxamci-regulator.patch b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/pxamci-regulator.patch
similarity index 100%
rename from recipes-kernel/linux/linux-yocto-3.8/pxamci-regulator.patch
rename to recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/pxamci-regulator.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.8/sharpsl_param.patch b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/sharpsl_param.patch
similarity index 100%
rename from recipes-kernel/linux/linux-yocto-3.8/sharpsl_param.patch
rename to recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/sharpsl_param.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.8/spi-pxa2xx-fix-mem.patch b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/spi-pxa2xx-fix-mem.patch
similarity index 100%
rename from recipes-kernel/linux/linux-yocto-3.8/spi-pxa2xx-fix-mem.patch
rename to recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/spi-pxa2xx-fix-mem.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.8/poodle/poodle.scc b/recipes-kernel/linux/linux-yocto-3.8/poodle/poodle.scc
index cfe97be..35f1323 100644
--- a/recipes-kernel/linux/linux-yocto-3.8/poodle/poodle.scc
+++ b/recipes-kernel/linux/linux-yocto-3.8/poodle/poodle.scc
@@ -3,7 +3,7 @@ kconf hardware poodle.cfg
 include ../zaurus-pxa-only.scc
 include ../zaurus-common.scc
 
-patch locomo_kbd_tweak-r2.patch
-patch sharpsl_param.patch
-patch spi-pxa2xx-fix-mem.patch
-patch pxamci-regulator.patch
+patch ../patches/patches-locomokbd/locomo_kbd_tweak-r2.patch
+patch ../patches/patches-pxa/sharpsl_param.patch
+patch ../patches/patches-pxa/spi-pxa2xx-fix-mem.patch
+patch ../patches/patches-pxa/pxamci-regulator.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc b/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc
index be8c470..c47a0c5 100644
--- a/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc
+++ b/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc
@@ -4,7 +4,7 @@ include ../zaurus-pxa-only.scc
 include ../zaurus-common.scc
 include ../zaurus-usb-host.scc
 
-patch sharpsl_param.patch
-patch pxa27x-sa1100-rtc.patch
-patch spi-pxa2xx-fix-mem.patch
-patch pxamci-regulator.patch
+patch ../patches/patches-pxa/sharpsl_param.patch
+patch ../patches/patches-pxa/pxa27x-sa1100-rtc.patch
+patch ../patches/patches-pxa/spi-pxa2xx-fix-mem.patch
+patch ../patches/patches-pxa/pxamci-regulator.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.scc b/recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.scc
index b4d6e8e..4d57894 100644
--- a/recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.scc
+++ b/recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.scc
@@ -4,6 +4,6 @@ include ../zaurus-pxa-only.scc
 include ../zaurus-common.scc
 include ../zaurus-usb-host.scc
 
-patch sharpsl_param.patch
-patch spi-pxa2xx-fix-mem.patch
-patch pxamci-regulator.patch
+patch ../patches/patches-pxa/sharpsl_param.patch
+patch ../patches/patches-pxa/spi-pxa2xx-fix-mem.patch
+patch ../patches/patches-pxa/pxamci-regulator.patch
-- 
1.8.1.5



