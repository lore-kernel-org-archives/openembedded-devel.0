Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id A199A6C753
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2013 16:16:31 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e52so1545328eek.16
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2013 09:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8GsdcX/F5mMGGCGjZQKEf5aR3UCg7SkcI1tzgroq9ko=;
	b=P20l+yuTENkv2KCt28iGCzU8i5Q1FraarzHHUdMfHFe6My69VnAy/e5FsxYinp0V3P
	5472M+UupWZFAwPI+H+aeFADE1AkWzb8JMXXzqtNdAoMhrFYMkG6B4zglHFD0MnyHmU+
	mLdS2Ng4EDmA8gEM34zeaMUqjZgD7O5NVONwiVYcI7HovHTswiCkQx+xxgLR1GAYSIkb
	xRFfur1rzP+l3A+cYwSQjpIEpnWqx21J6vyVF8KXZrt4FRgg3tb2UuNElWZDnfQR+X6b
	2NEvvDUu1qIPNfJ86IwqOzVndbghj09Z3e0NGB5t+dqiX8WSfIhdgKYPEJW6Hm6MYwvZ
	22Tg==
X-Received: by 10.14.109.66 with SMTP id r42mr4724703eeg.43.1379261793067;
	Sun, 15 Sep 2013 09:16:33 -0700 (PDT)
Received: from mizar.localdomain
	(host50-7-dynamic.20-79-r.retail.telecomitalia.it. [79.20.7.50])
	by mx.google.com with ESMTPSA id j7sm34003076eeo.15.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 15 Sep 2013 09:16:32 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Sep 2013 18:16:25 +0200
Message-Id: <1379261786-7660-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1379261786-7660-1-git-send-email-andrea.adami@gmail.com>
References: <1379261786-7660-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 2/3] linux-yocto-tiny-kexecboot: move from 3.8 to 3.10
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
X-List-Received-Date: Sun, 15 Sep 2013 16:16:32 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../akita/akita-tiny.scc                           |   2 -
 .../akita/akita.cfg                                |   0
 .../c7x0/c7x0-kexecboot.cfg                        |   0
 .../c7x0/c7x0-tiny.scc                             |   1 -
 .../collie/collie-kexecboot.cfg                    |   0
 .../collie/collie-tiny.scc                         |   0
 .../feature-top.scc                                |   0
 .../patches-locomokbd/locomo_kbd_tweak-r2.patch    |   0
 .../patches/patches-mfd/mcp-device.patch           |   0
 .../patches/patches-mfd/ucb1x00-device.patch       |   0
 .../patches/patches-mtd/collie-eraseinfo.patch     |   0
 .../patches/patches-mtd/collie-jedec-probe.patch   |   0
 .../patches-power/collie_battery-dev-pm.patch      |   0
 .../patches-power/tosa_battery_irq_to_gpio.patch   |   0
 .../patches/patches-pxa/sharpsl_param.patch        |   0
 .../patches/revert-check-on-console-device.patch   |   0
 .../poodle/poodle-kexecboot.cfg                    |   0
 .../poodle/poodle-tiny.scc                         |   1 -
 .../spitz/3200-mtd.patch                           |   0
 .../spitz/spitz-kexecboot.cfg                      |   0
 .../spitz/spitz-tiny.scc                           |   2 -
 .../tosa/tosa-kexecboot.cfg                        |   0
 .../tosa/tosa-tiny.scc                             |   1 -
 .../patches/patches-pxa/pxa27x-sa1100-rtc.patch    |  32 -----
 .../patches/patches-pxa/pxamci-regulator.patch     | 147 ---------------------
 ...nd => linux-yocto-tiny-kexecboot_3.10.bbappend} |   2 +-
 26 files changed, 1 insertion(+), 187 deletions(-)
 rename recipes-kernel/linux/{linux-yocto-tiny-kexecboot-3.8 => linux-yocto-tiny-kexecboot-3.10}/akita/akita-tiny.scc (71%)
 rename recipes-kernel/linux/{linux-yocto-tiny-kexecboot-3.8 => linux-yocto-tiny-kexecboot-3.10}/akita/akita.cfg (100%)
 rename recipes-kernel/linux/{linux-yocto-tiny-kexecboot-3.8 => linux-yocto-tiny-kexecboot-3.10}/c7x0/c7x0-kexecboot.cfg (100%)
 rename recipes-kernel/linux/{linux-yocto-tiny-kexecboot-3.8 => linux-yocto-tiny-kexecboot-3.10}/c7x0/c7x0-tiny.scc (81%)
 rename recipes-kernel/linux/{linux-yocto-tiny-kexecboot-3.8 => linux-yocto-tiny-kexecboot-3.10}/collie/collie-kexecboot.cfg (100%)
 rename recipes-kernel/linux/{linux-yocto-tiny-kexecboot-3.8 => linux-yocto-tiny-kexecboot-3.10}/collie/collie-tiny.scc (100%)
 rename recipes-kernel/linux/{linux-yocto-tiny-kexecboot-3.8 => linux-yocto-tiny-kexecboot-3.10}/feature-top.scc (100%)
 rename recipes-kernel/linux/{linux-yocto-tiny-kexecboot-3.8 => linux-yocto-tiny-kexecboot-3.10}/patches/patches-locomokbd/locomo_kbd_tweak-r2.patch (100%)
 rename recipes-kernel/linux/{linux-yocto-tiny-kexecboot-3.8 => linux-yocto-tiny-kexecboot-3.10}/patches/patches-mfd/mcp-device.patch (100%)
 rename recipes-kernel/linux/{linux-yocto-tiny-kexecboot-3.8 => linux-yocto-tiny-kexecboot-3.10}/patches/patches-mfd/ucb1x00-device.patch (100%)
 rename recipes-kernel/linux/{linux-yocto-tiny-kexecboot-3.8 => linux-yocto-tiny-kexecboot-3.10}/patches/patches-mtd/collie-eraseinfo.patch (100%)
 rename recipes-kernel/linux/{linux-yocto-tiny-kexecboot-3.8 => linux-yocto-tiny-kexecboot-3.10}/patches/patches-mtd/collie-jedec-probe.patch (100%)
 rename recipes-kernel/linux/{linux-yocto-tiny-kexecboot-3.8 => linux-yocto-tiny-kexecboot-3.10}/patches/patches-power/collie_battery-dev-pm.patch (100%)
 rename recipes-kernel/linux/{linux-yocto-tiny-kexecboot-3.8 => linux-yocto-tiny-kexecboot-3.10}/patches/patches-power/tosa_battery_irq_to_gpio.patch (100%)
 rename recipes-kernel/linux/{linux-yocto-tiny-kexecboot-3.8 => linux-yocto-tiny-kexecboot-3.10}/patches/patches-pxa/sharpsl_param.patch (100%)
 rename recipes-kernel/linux/{linux-yocto-tiny-kexecboot-3.8 => linux-yocto-tiny-kexecboot-3.10}/patches/revert-check-on-console-device.patch (100%)
 rename recipes-kernel/linux/{linux-yocto-tiny-kexecboot-3.8 => linux-yocto-tiny-kexecboot-3.10}/poodle/poodle-kexecboot.cfg (100%)
 rename recipes-kernel/linux/{linux-yocto-tiny-kexecboot-3.8 => linux-yocto-tiny-kexecboot-3.10}/poodle/poodle-tiny.scc (84%)
 rename recipes-kernel/linux/{linux-yocto-tiny-kexecboot-3.8 => linux-yocto-tiny-kexecboot-3.10}/spitz/3200-mtd.patch (100%)
 rename recipes-kernel/linux/{linux-yocto-tiny-kexecboot-3.8 => linux-yocto-tiny-kexecboot-3.10}/spitz/spitz-kexecboot.cfg (100%)
 rename recipes-kernel/linux/{linux-yocto-tiny-kexecboot-3.8 => linux-yocto-tiny-kexecboot-3.10}/spitz/spitz-tiny.scc (72%)
 rename recipes-kernel/linux/{linux-yocto-tiny-kexecboot-3.8 => linux-yocto-tiny-kexecboot-3.10}/tosa/tosa-kexecboot.cfg (100%)
 rename recipes-kernel/linux/{linux-yocto-tiny-kexecboot-3.8 => linux-yocto-tiny-kexecboot-3.10}/tosa/tosa-tiny.scc (84%)
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-pxa/pxa27x-sa1100-rtc.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-pxa/pxamci-regulator.patch
 rename recipes-kernel/linux/{linux-yocto-tiny-kexecboot_3.8.bbappend => linux-yocto-tiny-kexecboot_3.10.bbappend} (78%)

diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/akita/akita-tiny.scc b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/akita/akita-tiny.scc
similarity index 71%
rename from recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/akita/akita-tiny.scc
rename to recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/akita/akita-tiny.scc
index 50959de..ba06735 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/akita/akita-tiny.scc
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/akita/akita-tiny.scc
@@ -8,6 +8,4 @@ kconf hardware ../spitz/spitz-kexecboot.cfg
 kconf hardware akita.cfg
 
 patch ../patches/patches-pxa/sharpsl_param.patch
-patch ../patches/patches-pxa/pxa27x-sa1100-rtc.patch
-patch ../patches/patches-pxa/pxamci-regulator.patch
 patch ../patches/revert-check-on-console-device.patch
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/akita/akita.cfg b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/akita/akita.cfg
similarity index 100%
rename from recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/akita/akita.cfg
rename to recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/akita/akita.cfg
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/c7x0/c7x0-kexecboot.cfg b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/c7x0/c7x0-kexecboot.cfg
similarity index 100%
rename from recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/c7x0/c7x0-kexecboot.cfg
rename to recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/c7x0/c7x0-kexecboot.cfg
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/c7x0/c7x0-tiny.scc b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/c7x0/c7x0-tiny.scc
similarity index 81%
rename from recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/c7x0/c7x0-tiny.scc
rename to recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/c7x0/c7x0-tiny.scc
index 221ed1a..4a0c05e 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/c7x0/c7x0-tiny.scc
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/c7x0/c7x0-tiny.scc
@@ -7,5 +7,4 @@ include ktypes/tiny/tiny.scc
 kconf hardware c7x0-kexecboot.cfg
 
 patch ../patches/patches-pxa/sharpsl_param.patch
-patch ../patches/patches-pxa/pxamci-regulator.patch
 patch ../patches/revert-check-on-console-device.patch
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/collie/collie-kexecboot.cfg b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/collie/collie-kexecboot.cfg
similarity index 100%
rename from recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/collie/collie-kexecboot.cfg
rename to recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/collie/collie-kexecboot.cfg
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/collie/collie-tiny.scc b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/collie/collie-tiny.scc
similarity index 100%
rename from recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/collie/collie-tiny.scc
rename to recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/collie/collie-tiny.scc
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/feature-top.scc b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/feature-top.scc
similarity index 100%
rename from recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/feature-top.scc
rename to recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/feature-top.scc
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-locomokbd/locomo_kbd_tweak-r2.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-locomokbd/locomo_kbd_tweak-r2.patch
similarity index 100%
rename from recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-locomokbd/locomo_kbd_tweak-r2.patch
rename to recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-locomokbd/locomo_kbd_tweak-r2.patch
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-mfd/mcp-device.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mfd/mcp-device.patch
similarity index 100%
rename from recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-mfd/mcp-device.patch
rename to recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mfd/mcp-device.patch
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-mfd/ucb1x00-device.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mfd/ucb1x00-device.patch
similarity index 100%
rename from recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-mfd/ucb1x00-device.patch
rename to recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mfd/ucb1x00-device.patch
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-mtd/collie-eraseinfo.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-eraseinfo.patch
similarity index 100%
rename from recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-mtd/collie-eraseinfo.patch
rename to recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-eraseinfo.patch
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-mtd/collie-jedec-probe.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-jedec-probe.patch
similarity index 100%
rename from recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-mtd/collie-jedec-probe.patch
rename to recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-jedec-probe.patch
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-power/collie_battery-dev-pm.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-power/collie_battery-dev-pm.patch
similarity index 100%
rename from recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-power/collie_battery-dev-pm.patch
rename to recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-power/collie_battery-dev-pm.patch
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-power/tosa_battery_irq_to_gpio.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-power/tosa_battery_irq_to_gpio.patch
similarity index 100%
rename from recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-power/tosa_battery_irq_to_gpio.patch
rename to recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-power/tosa_battery_irq_to_gpio.patch
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-pxa/sharpsl_param.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-pxa/sharpsl_param.patch
similarity index 100%
rename from recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-pxa/sharpsl_param.patch
rename to recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-pxa/sharpsl_param.patch
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/revert-check-on-console-device.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/revert-check-on-console-device.patch
similarity index 100%
rename from recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/revert-check-on-console-device.patch
rename to recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/revert-check-on-console-device.patch
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/poodle/poodle-kexecboot.cfg b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/poodle/poodle-kexecboot.cfg
similarity index 100%
rename from recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/poodle/poodle-kexecboot.cfg
rename to recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/poodle/poodle-kexecboot.cfg
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/poodle/poodle-tiny.scc b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/poodle/poodle-tiny.scc
similarity index 84%
rename from recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/poodle/poodle-tiny.scc
rename to recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/poodle/poodle-tiny.scc
index 1015b42..12c3ccf 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/poodle/poodle-tiny.scc
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/poodle/poodle-tiny.scc
@@ -8,5 +8,4 @@ kconf hardware poodle-kexecboot.cfg
 
 patch ../patches/patches-locomokbd/locomo_kbd_tweak-r2.patch
 patch ../patches/patches-pxa/sharpsl_param.patch
-patch ../patches/patches-pxa/pxamci-regulator.patch
 patch ../patches/revert-check-on-console-device.patch
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/spitz/3200-mtd.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/spitz/3200-mtd.patch
similarity index 100%
rename from recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/spitz/3200-mtd.patch
rename to recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/spitz/3200-mtd.patch
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/spitz/spitz-kexecboot.cfg b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/spitz/spitz-kexecboot.cfg
similarity index 100%
rename from recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/spitz/spitz-kexecboot.cfg
rename to recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/spitz/spitz-kexecboot.cfg
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/spitz/spitz-tiny.scc b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/spitz/spitz-tiny.scc
similarity index 72%
rename from recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/spitz/spitz-tiny.scc
rename to recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/spitz/spitz-tiny.scc
index 0a1fc30..17c3088 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/spitz/spitz-tiny.scc
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/spitz/spitz-tiny.scc
@@ -10,6 +10,4 @@ kconf hardware spitz-kexecboot.cfg
 patch 3200-mtd.patch
 
 patch ../patches/patches-pxa/sharpsl_param.patch
-patch ../patches/patches-pxa/pxa27x-sa1100-rtc.patch
-patch ../patches/patches-pxa/pxamci-regulator.patch
 patch ../patches/revert-check-on-console-device.patch
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/tosa/tosa-kexecboot.cfg b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/tosa/tosa-kexecboot.cfg
similarity index 100%
rename from recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/tosa/tosa-kexecboot.cfg
rename to recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/tosa/tosa-kexecboot.cfg
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/tosa/tosa-tiny.scc b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/tosa/tosa-tiny.scc
similarity index 84%
rename from recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/tosa/tosa-tiny.scc
rename to recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/tosa/tosa-tiny.scc
index 7c41b5c..50e36f1 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/tosa/tosa-tiny.scc
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/tosa/tosa-tiny.scc
@@ -8,5 +8,4 @@ kconf hardware tosa-kexecboot.cfg
 
 patch ../patches/patches-pxa/sharpsl_param.patch
 patch ../patches/patches-power/tosa_battery_irq_to_gpio.patch
-patch ../patches/patches-pxa/pxamci-regulator.patch
 patch ../patches/revert-check-on-console-device.patch
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-pxa/pxa27x-sa1100-rtc.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-pxa/pxa27x-sa1100-rtc.patch
deleted file mode 100644
index d878ea1..0000000
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-pxa/pxa27x-sa1100-rtc.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From fcee0050f8ce5296e8007ed7ed17d98f334a8f38 Mon Sep 17 00:00:00 2001
-From: Andrea Adami <andrea.adami@gmail.com>
-Date: Fri, 23 Nov 2012 23:07:20 +0100
-Subject: [PATCH] ARM: pxa: pxa27x.c: add dummy SA1100 rtc clock
-
-* Using pxa27x you could now build both RTC_DRV_PXA and RTC_DRV_SA1100.
-* Make sure you don't use both together: link /dev/rtc0 or /dev/rtc1
-* to /dev/rtc according to your requirement.
-
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
-Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
-Signed-off-by: Haojian Zhuang <haojian.zhuang@gmail.com>
-
-Upstream-Status: Accepted
-Committed in v3.9-rc1 with commit id
-495b21dc0e488b784ab1d4007d00db1ca2a95c98
----
- arch/arm/mach-pxa/pxa27x.c |    1 +
- 1 files changed, 1 insertions(+), 0 deletions(-)
-
-diff --git a/arch/arm/mach-pxa/pxa27x.c b/arch/arm/mach-pxa/pxa27x.c
-index 8047ee0..5970ebc 100644
---- a/arch/arm/mach-pxa/pxa27x.c
-+++ b/arch/arm/mach-pxa/pxa27x.c
-@@ -230,6 +230,7 @@ static struct clk_lookup pxa27x_clkregs[] = {
- 	INIT_CLKREG(&clk_pxa27x_memc, NULL, "MEMCLK"),
- 	INIT_CLKREG(&clk_pxa27x_mem, "pxa2xx-pcmcia", NULL),
- 	INIT_CLKREG(&clk_dummy, "pxa-gpio", NULL),
-+	INIT_CLKREG(&clk_dummy, "sa1100-rtc", NULL),
- };
- 
- #ifdef CONFIG_PM
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-pxa/pxamci-regulator.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-pxa/pxamci-regulator.patch
deleted file mode 100644
index 66351f3..0000000
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-pxa/pxamci-regulator.patch
+++ /dev/null
@@ -1,147 +0,0 @@
-From 04e7345a49a7ab2eb725f8ee2569c49b9ea697bb Mon Sep 17 00:00:00 2001
-From: Marko Katic <dromede@gmail.com>
-Date: Mon, 15 Jul 2013 00:55:13 +0200
-Subject: [PATCH] pxamci: Refactor regulator support
-
-Here's an interesting scenario. The spitz machine has an
-Intersil 6271A voltage regulator and an ADS7846 touchscreen
-controller.
-
-The ADS7846 driver _requires_ the use of a voltage regulator
-or if not present, CONFIG_REGULATOR_DUMMY should be used for proper operation.
-This was made mandatory by the following commit:
-
-========================================
-91143379b01b2020d8878d627ebe9dfb9d6eb4c8
-Input: ads7846 - add regulator support
-
-The ADS7846/TSC2046 touchscreen controllers can (and usually are)
-connected to various regulators for power, so add regulator support.
-
-Valid regulator will now be required, so boards without complete
-regulator setup should either disable regulator framework or enable
-CONFIG_REGULATOR_DUMMY.
-========================================
-
-The ADS7846 in spitz machines is not connected to
-any power regulator so it needs CONFIG_REGULATOR_DUMMY enabled.
-So to support both the Intersil 6271A regulator and
-the ADS7846 controller, CONFIG_REGULATOR and CONFIG_REGULATOR_DUMMY have
-to be defined.
-
-However, enabling CONFIG_REGULATOR and CONFIG_REGULATOR_DUMMY
-will break pxamci driver and cause the following error output:
-
-pxa2xx-mci.0 supply vmmc not found, using dummy regulator
-pxa2xx-mci pxa2xx-mci.0: ocr_mask/setpower will not be used
-pxa2xx-mci pxa2xx-mci.0: could not set regulator OCR (-22)
-pxa2xx-mci pxa2xx-mci.0: unable to set power
-pxa2xx-mci pxa2xx-mci.0: could not set regulator OCR (-22)
-pxa2xx-mci pxa2xx-mci.0: unable to set power
-
-Above failures occur in two functions;
-pxamci_init_ocr() and pxamci_set_power().
-
-Regulator support in pxamci_init_ocr() is not
-written with the existence of the dummy regulator driver in
-mind. It does not check the return value of mmc_regulator_get_ocrmask()
-and it will only fall back to platform data if no regulator was found.
-
-pxamci_set_power() fails because it does not even try to fall back
-to platform data if mmc_regulator_set_ocr() fails. It
-expects a proper regulator or no regulator at all. It will
-only fall back to platform data if no regulator was found. It does
-not properly handle the possible existence of the dummy regulator.
-
-This patch refactors pxamci_init_ocr() and  pxamci_set_power() regulator
-support to be more modular, to do more checks and to always fall back
-to platform data.
-
-Signed-off-by: Marko Katic <dromede@gmail.com>
-
-Upstream-Status: Submitted
-https://patchwork.kernel.org/patch/1875561/
----
- drivers/mmc/host/pxamci.c | 40 +++++++++++++++++++++++++++-------------
- 1 file changed, 27 insertions(+), 13 deletions(-)
-
-diff --git a/drivers/mmc/host/pxamci.c b/drivers/mmc/host/pxamci.c
-index 2b2f65a..341d5dc 100644
---- a/drivers/mmc/host/pxamci.c
-+++ b/drivers/mmc/host/pxamci.c
-@@ -83,18 +83,26 @@ struct pxamci_host {
- static inline void pxamci_init_ocr(struct pxamci_host *host)
- {
- #ifdef CONFIG_REGULATOR
-+	int ocr_mask;
- 	host->vcc = regulator_get(mmc_dev(host->mmc), "vmmc");
- 
- 	if (IS_ERR(host->vcc))
- 		host->vcc = NULL;
- 	else {
--		host->mmc->ocr_avail = mmc_regulator_get_ocrmask(host->vcc);
--		if (host->pdata && host->pdata->ocr_mask)
-+		ocr_mask = mmc_regulator_get_ocrmask(host->vcc);
-+		if (ocr_mask <= 0)
-+			host->mmc->ocr_avail = 0;
-+		else
-+			host->mmc->ocr_avail = ocr_mask;
-+
-+		if (host->pdata &&
-+			host->pdata->ocr_mask &&
-+			host->mmc->ocr_avail)
- 			dev_warn(mmc_dev(host->mmc),
- 				"ocr_mask/setpower will not be used\n");
- 	}
- #endif
--	if (host->vcc == NULL) {
-+	if (host->vcc == NULL || host->mmc->ocr_avail == 0) {
- 		/* fall-back to platform data */
- 		host->mmc->ocr_avail = host->pdata ?
- 			host->pdata->ocr_mask :
-@@ -108,26 +116,32 @@ static inline int pxamci_set_power(struct pxamci_host *host,
- {
- 	int on;
- 
-+#ifdef CONFIG_REGULATOR
- 	if (host->vcc) {
--		int ret;
-+		int ret = 0;
- 
--		if (power_mode == MMC_POWER_UP) {
-+		if (power_mode == MMC_POWER_UP)
- 			ret = mmc_regulator_set_ocr(host->mmc, host->vcc, vdd);
--			if (ret)
--				return ret;
--		} else if (power_mode == MMC_POWER_OFF) {
-+
-+		if (power_mode == MMC_POWER_OFF)
- 			ret = mmc_regulator_set_ocr(host->mmc, host->vcc, 0);
--			if (ret)
--				return ret;
--		}
-+
-+		if (ret == 0)
-+			return 0;
-+		else
-+			dev_warn(mmc_dev(host->mmc),
-+			 "mmc_regulator_set_ocr failed, "
-+			 "falling back to platform data\n");
- 	}
--	if (!host->vcc && host->pdata &&
-+#endif
-+
-+	if (host->pdata &&
- 	    gpio_is_valid(host->pdata->gpio_power)) {
- 		on = ((1 << vdd) & host->pdata->ocr_mask);
- 		gpio_set_value(host->pdata->gpio_power,
- 			       !!on ^ host->pdata->gpio_power_invert);
- 	}
--	if (!host->vcc && host->pdata && host->pdata->setpower)
-+	if (host->pdata && host->pdata->setpower)
- 		host->pdata->setpower(mmc_dev(host->mmc), vdd);
- 
- 	return 0;
--- 
-1.8.1.5
-
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.8.bbappend b/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bbappend
similarity index 78%
rename from recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.8.bbappend
rename to recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bbappend
index eb02812..2ca53cb 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.8.bbappend
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bbappend
@@ -1,4 +1,4 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.8:${THISDIR}/${PN}:${THISDIR}/files:"
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.10:${THISDIR}/${PN}:${THISDIR}/files:"
 
 # Zaurus machines need kernel size-check.
 KERNEL_IMAGE_MAXSIZE_akita = "1294336"
-- 
1.8.1.5


