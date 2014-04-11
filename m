Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 87F1865EE7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Apr 2014 19:47:01 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e53so4464460eek.16
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Apr 2014 12:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=QWglSQoFunFN3smc6dGQLgQwTIWiKsTkX2WXeN3JY6A=;
	b=W3MrsRysCXlBeClyndPPaOvJFR6XX/HShX3F/qvhsno3P19AsbNIe5vxk8YjWy0IL0
	GYtO+mtgQk1pLT0dOFCKU1oZvl9tWrk2wUskoNZaHpWUCSBf6VRpyjAa9O/YaMbfSS1H
	3O/v5iqy9PvryPMdZ7yPkoZXzY0vkRlMB7z/ww1iZPyhjiQA+ErvJP5AjH3ZhkvDZ1tj
	8R6R00mAnFIIPdDYsKaaX+Rt2G07VvsBOLBZfDR9VtSFgCw4tl4KNYhkxwS/Wofe+ha3
	vhoKlD0AAnla85JxzfiJSw3Qqi5WE2lkwxLVA79k61lLYLUr5kTZvZ42TPhoENxNPqDu
	ItwQ==
X-Received: by 10.15.81.135 with SMTP id x7mr6404566eey.61.1397245622524;
	Fri, 11 Apr 2014 12:47:02 -0700 (PDT)
Received: from mizar.localdomain ([95.232.251.85])
	by mx.google.com with ESMTPSA id
	l42sm19893596eew.19.2014.04.11.12.47.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Apr 2014 12:47:01 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Apr 2014 21:46:56 +0200
Message-Id: <1397245616-9769-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] linux-yocto_3.14: fix: do not pollute variables of the main recipe
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
X-List-Received-Date: Fri, 11 Apr 2014 19:47:03 -0000

The restyling of the .bbappend was seemingly a good simplification but
building for qemux86 fails if the meta-handheld layer is included.

* ERROR: Function failed: Fetcher failure for URL: 'file://defconfig'.
* Unable to fetch URL from any source.

Go back to the previous syntax used for the older kernel versions and
fix the contamination of the variables for foreign machines once for all.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-yocto_3.14.bbappend | 44 +++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 5 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto_3.14.bbappend b/recipes-kernel/linux/linux-yocto_3.14.bbappend
index e80bbbe..95d0a0e 100644
--- a/recipes-kernel/linux/linux-yocto_3.14.bbappend
+++ b/recipes-kernel/linux/linux-yocto_3.14.bbappend
@@ -1,21 +1,42 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.14:${THISDIR}/${PN}:"
 
+# Declare more compatible machines
 COMPATIBLE_MACHINE .= "|akita|c7x0|collie|h3600|hx4700|poodle|spitz|tosa"
 
-KMACHINE_${MACHINE} = "${MACHINE}"
-KERNEL_EXTRA_FEATURES_${MACHINE} ?= ""
+KERNEL_EXTRA_FEATURES_akita ?= ""
+KERNEL_EXTRA_FEATURES_c7x0 ?= ""
+KERNEL_EXTRA_FEATURES_collie ?= ""
+KERNEL_EXTRA_FEATURES_h3600 ?= ""
+KERNEL_EXTRA_FEATURES_hx4700 ?= ""
+KERNEL_EXTRA_FEATURES_poodle ?= ""
+KERNEL_EXTRA_FEATURES_spitz ?= ""
+KERNEL_EXTRA_FEATURES_tosa ?= ""
 
-OELOGO_PATCH = '${@base_contains("MACHINE_FEATURES", "qvga", "OE-qvga-logo.patch", "OE-vga-logo.patch", d)}'
-SRC_URI += "file://${OELOGO_PATCH}"
+KMACHINE_akita = "akita"
+KMACHINE_c7x0 = "c7x0"
+KMACHINE_collie = "collie"
+KMACHINE_h3600 = "h3600"
+KMACHINE_hx4700 = "hx4700"
+KMACHINE_poodle = "poodle"
+KMACHINE_spitz = "spitz"
+KMACHINE_tosa = "tosa"
 
 # Note: Providing "defconfig" we bypass the linux-yocto processing
-SRC_URI += "file://defconfig"
+
+SRC_URI_append_akita = " \
+           file://defconfig \
+           file://OE-vga-logo.patch \
+           "
 
 SRC_URI_append_c7x0 = " \
+           file://defconfig \
+           file://OE-vga-logo.patch \
            file://corgi-gpio_keys.patch \
            "
 
 SRC_URI_append_collie = " \
+           file://defconfig \
+           file://OE-qvga-logo.patch \
            file://locomo_kbd_tweak-r2.patch \
            \
            file://collie-irda.patch \
@@ -40,6 +61,8 @@ SRC_URI_append_collie = " \
            "
 
 SRC_URI_append_h3600 = " \
+           file://defconfig \
+           file://OE-qvga-logo.patch \
            file://0001-MFD-driver-for-Atmel-Microcontroller-on-iPaq-h3xxx.patch \
            file://0002-ARM-sa1100-add-Micro-ASIC-platform-device.patch \
            file://0003-input-driver-for-microcontroller-keys-on-the-iPaq-h3.patch \
@@ -50,17 +73,28 @@ SRC_URI_append_h3600 = " \
            "
 
 SRC_URI_append_hx4700 = " \
+           file://defconfig \
+           file://OE-vga-logo.patch \
            file://hx4700-change-led-trigger-assignments.patch \
            file://hx4700.h-include-irqs.h-for-PXA_NR_BUILTIN_G.patch \
            "
 
 SRC_URI_append_poodle = " \
+           file://defconfig \
+           file://OE-qvga-logo.patch \
            file://locomo_kbd_tweak-r2.patch \
            file://locomo-fix-SCL-SDA.patch \
            file://locomolcd-suspend-resume.patch \
            "
 
+SRC_URI_append_spitz = " \
+           file://defconfig \
+           file://OE-vga-logo.patch \
+           "
+
 SRC_URI_append_tosa = " \
+           file://defconfig \
+           file://OE-vga-logo.patch \
            file://0001-HACK-video-move-backlight-to-the-end-of-Makefile.patch \
            file://0002-tosa-bl-correct-backlight-calculations.patch \
            file://0003-tmio-call-tmiofb_set_par-in-tmiofb_probe.patch \
-- 
1.8.1.5


