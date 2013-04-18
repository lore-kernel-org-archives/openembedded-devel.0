Received: from mail-ee0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1USyxT-0005JL-88
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Apr 2013 02:13:51 +0200
Received: by mail-ee0-f41.google.com with SMTP id c1so1574561eek.28
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Apr 2013 16:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=gitkR48Zp5+ExgNSCPP991nnopJAFXgqcpOWvKUkqK8=;
	b=pJSLXBVYDihFfLdt7i+AgELhMcFyAl05WHGS1TPgEce5iRuDRiNChJRm3QByNo1qT0
	vOSOfc43aI7UmrifoBmx+PQGk2zlalXv8Nq9EwhNohpaER1spBSRk54To1Biq8TpdM2y
	KZrYLmFjhyjNqZhvmyc7jsdy73mBdxaN59jfgcHMcFvgX+1YMhz5eihRbfSPwOjgW94z
	Jk5iwtPux0qLVXh1uAiMb3UKtHQ91LWEimqDKlMwxWiem6qHI1eZ0KCpFBL4qLZBwKLI
	EAB7Frp+wND9sfyYN2Cc1CacUa3jogNVSV63++6JpVbVbaRhjdCVuiqb9dhYhcA6N2b3
	TUbQ==
X-Received: by 10.14.223.72 with SMTP id u48mr28403111eep.44.1366329369685;
	Thu, 18 Apr 2013 16:56:09 -0700 (PDT)
Received: from mizar.localdomain
	(host5-250-dynamic.0-87-r.retail.telecomitalia.it. [87.0.250.5])
	by mx.google.com with ESMTPS id 8sm19118414eeg.15.2013.04.18.16.56.08
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 18 Apr 2013 16:56:09 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Apr 2013 01:52:07 +0200
Message-Id: <1366329127-8869-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1366329127-8869-1-git-send-email-andrea.adami@gmail.com>
References: <1366329127-8869-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 2/2] linux-yocto_3.8: patches: add Upstream-Status and do minor edits
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
X-List-Received-Date: Fri, 19 Apr 2013 00:13:54 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../patches-locomokbd/locomo_kbd_tweak-r2.patch    |  3 ++
 .../patches/patches-mfd/mcp-device.patch           | 35 ++++++++++++++++++++++
 .../patches/patches-mtd/collie-eraseinfo.patch     | 11 +++++++
 .../patches/patches-mtd/collie-jedec-probe.patch   | 11 +++++++
 .../patches/patches-pxa/pxa27x-sa1100-rtc.patch    |  8 ++---
 .../patches/patches-pxa/pxamci-regulator.patch     |  3 ++
 .../patches/patches-pxa/sharpsl_param.patch        | 14 +++++++++
 .../patches/patches-pxa/spi-pxa2xx-fix-mem.patch   | 13 ++++++++
 8 files changed, 93 insertions(+), 5 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-locomokbd/locomo_kbd_tweak-r2.patch b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-locomokbd/locomo_kbd_tweak-r2.patch
index 5f015f4..0ba313a 100644
--- a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-locomokbd/locomo_kbd_tweak-r2.patch
+++ b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-locomokbd/locomo_kbd_tweak-r2.patch
@@ -8,6 +8,9 @@ Subject: [PATCH 43/43] locomokbd: apply tweaks for Zaurus
 Signed-off-by: Richard Purdie <rpurdie@rpsys.net>
 Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
 
+Upstream-Status: Inappropriate [embedded specific]
+[Patch needed for initramfs w/out keymaps like kexecboot]
+
 diff --git a/drivers/input/keyboard/locomokbd.c b/drivers/input/keyboard/locomokbd.c
 index c94d610..2b978c8 100644
 --- a/drivers/input/keyboard/locomokbd.c
diff --git a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-mfd/mcp-device.patch b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-mfd/mcp-device.patch
index 9a0a8ba..9769b2d 100644
--- a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-mfd/mcp-device.patch
+++ b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-mfd/mcp-device.patch
@@ -1,3 +1,38 @@
+Initial try to fix compilation error
+
+linux/include/linux/mfd/mcp.h:22:16: error: field 'attached_device' has incomplete type
+linux/include/linux/mfd/mcp.h:48:23: error: field 'drv' has incomplete type
+linux/include/linux/mfd/ucb1x00.h:137:17: error: field 'dev' has incomplete type
+linux/drivers/power/collie_battery.c:290:56: error: unknown type name 'pm_message_t'
+linux/drivers/power/collie_battery.c:371:13: error: 'collie_bat_suspend' undeclared here (not in a function)
+| make[4]: *** [drivers/power/collie_battery.o] Error 1
+| make[3]: *** [drivers/power] Error 2
+
+Patch should be refactored following Anton's suggestions.
+"Generally, we don't depend on indirect inclusions. But if it doesn't harm
+anyhow so far, we may not bother with this."
+
+Here the suggestion:
+
+Things are a bit more complex...
+* linux/include/linux/mfd/mcp.h:22:16: error: field 'attached_device' has incomplete type
+
+You have to add #include <linux/device.h> into mfd/mcp.h. This will add
+struct device and...
+
+* linux/include/linux/mfd/mcp.h:48:23: error: field 'drv' has incomplete type
+ struct device_driver.
+
+* linux/include/linux/mfd/ucb1x00.h:137:17: error: field 'dev' has incomplete type
+Same here, the file ucb1x00.h needs #include <linux/device.h>.
+
+* linux/drivers/power/collie_battery.c:290:56: error: unknown type name 'pm_message_t'
+#include <linux/pm.h> into collie_battery.c
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
+Upstream-Status: Pending
+
 --- a/include/linux/mfd/mcp.h	2013-02-18 00:14:09.000000000 +0100
 +++ b/include/linux/mfd/mcp.h	2013-02-17 23:55:52.000000000 +0100
 @@ -10,6 +10,8 @@
diff --git a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-mtd/collie-eraseinfo.patch b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-mtd/collie-eraseinfo.patch
index 6aba29e..b5f9916 100644
--- a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-mtd/collie-eraseinfo.patch
+++ b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-mtd/collie-eraseinfo.patch
@@ -1,3 +1,14 @@
+* Zaurus 5500 contains 2 LH28F640BFHE-PTTL90 (64M 4Mx16) and
+* the LH28F640BFHE-PTTL90.pdf datasheet available on the net shows
+* the exact erasesize and the OTP support.
+* At the moment only jedec_probe can discover the chip and
+* the NOR is mounted read only probably because of wrong vpp
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
+Upstream-Status: Submitted
+http://lists.infradead.org/pipermail/linux-mtd/2013-February/045781.html
+
 --- a/drivers/mtd/chips/jedec_probe.c
 +++ b/drivers/mtd/chips/jedec_probe.c
 @@ -120,7 +120,7 @@
diff --git a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-mtd/collie-jedec-probe.patch b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-mtd/collie-jedec-probe.patch
index 530643e..64f58ce 100644
--- a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-mtd/collie-jedec-probe.patch
+++ b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-mtd/collie-jedec-probe.patch
@@ -1,3 +1,14 @@
+* Zaurus 5500 contains 2 LH28F640BFHE-PTTL90 (64M 4Mx16) and
+* the LH28F640BFHE-PTTL90.pdf datasheet available on the net shows
+* the exact erasesize and the OTP support.
+* At the moment only jedec_probe can discover the chip and
+* the NOR is mounted read only probably because of wrong vpp
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
+Upstream-Status: Submitted
+http://lists.infradead.org/pipermail/linux-mtd/2013-February/045781.html
+
 --- a/arch/arm/mach-sa1100/collie.c
 +++ b/arch/arm/mach-sa1100/collie.c
 @@ -289,7 +289,7 @@
diff --git a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/pxa27x-sa1100-rtc.patch b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/pxa27x-sa1100-rtc.patch
index 7cb5385..d878ea1 100644
--- a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/pxa27x-sa1100-rtc.patch
+++ b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/pxa27x-sa1100-rtc.patch
@@ -11,8 +11,9 @@ Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
 Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
 Signed-off-by: Haojian Zhuang <haojian.zhuang@gmail.com>
 
-Upstream-Status: Accepted. Committed in v3.9-rc1
-with commit id 495b21dc0e488b784ab1d4007d00db1ca2a95c98
+Upstream-Status: Accepted
+Committed in v3.9-rc1 with commit id
+495b21dc0e488b784ab1d4007d00db1ca2a95c98
 ---
  arch/arm/mach-pxa/pxa27x.c |    1 +
  1 files changed, 1 insertions(+), 0 deletions(-)
@@ -29,6 +30,3 @@ index 8047ee0..5970ebc 100644
  };
  
  #ifdef CONFIG_PM
--- 
-1.7.8.6
-
diff --git a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/pxamci-regulator.patch b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/pxamci-regulator.patch
index 8e7c521..daf086a 100644
--- a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/pxamci-regulator.patch
+++ b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/pxamci-regulator.patch
@@ -55,6 +55,9 @@ support to be more modular, to do more checks and to always fall back
 to platform data.
 
 Signed-off-by: Marko Katic <dromede@gmail.com>
+
+Upstream-Status: Submitted
+https://patchwork.kernel.org/patch/1875561/
 ---
  drivers/mmc/host/pxamci.c |   37 ++++++++++++++++++++++++-------------
  1 file changed, 24 insertions(+), 13 deletions(-)
diff --git a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/sharpsl_param.patch b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/sharpsl_param.patch
index c626e92..720a87c 100644
--- a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/sharpsl_param.patch
+++ b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/sharpsl_param.patch
@@ -1,5 +1,19 @@
+* Unbreak kernel boot (tested with kexecboot)
+* Patch was sent twice upstrream:
+* http://lists.infradead.org/pipermail/linux-arm-kernel/2012-December/137284.html
+*
+* Devices that call sharpsl_save_param() will hang on boot due to
+* a memcpy call that uses a physical address that is no longer
+* accessible. Fix this by converting the physical address into a virtual one.
+
 Signed-off-by: Marko Katic <dromede.gmail.com>
 
+Upstream-Status: Submitted
+https://patchwork.kernel.org/patch/1818681/
+---
+ arch/arm/common/sharpsl_param.c |    4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
 diff --git a/arch/arm/common/sharpsl_param.c b/arch/arm/common/sharpsl_param.c
 index d56c932..b70b13a 100644
 --- a/arch/arm/common/sharpsl_param.c
diff --git a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/spi-pxa2xx-fix-mem.patch b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/spi-pxa2xx-fix-mem.patch
index e20b597..7fbc14c 100644
--- a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/spi-pxa2xx-fix-mem.patch
+++ b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/spi-pxa2xx-fix-mem.patch
@@ -1,3 +1,16 @@
+pxa2xx_spi_probe allocates struct driver_data and null_dma_buf
+at same time via spi_alloc_master(), but then calculates
+null_dma_buf pointer incorrectly, and it causes memory corruption
+later if DMA usage is enabled.
+
+Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
+
+Upstream-Status: Submitted
+https://patchwork.kernel.org/patch/1657911/
+---
+ drivers/spi/spi-pxa2xx.c | 9 +++++----
+  1 file changed, 5 insertions(+), 4 deletions(-)
+
 diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
 index dc25bee..b25fe27 100644
 --- a/drivers/spi/spi-pxa2xx.c
-- 
1.8.1.5



