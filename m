Return-Path: <krzk@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 46270744B5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 May 2018 10:13:08 +0000 (UTC)
Received: from PC-kkoz.proceq.com (unknown [213.160.61.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 8E75920875;
	Tue, 22 May 2018 10:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1526983990;
	bh=so9njxQSXtFJK5lBoqW+vASpT20ZSWdjm4x72QmAuak=;
	h=From:To:Cc:Subject:Date:From;
	b=goCLHWyE7H6QPLuqq92kV8Ms1BBrX6li8weuo/ZTi6QnjWupawm9kHLoAJM0pQMzu
	qAXy1fhckwhLVMCQdX8dl7ZngCGCfnGGdswodMS2jAneqz2m7Xz7TD8b+RmlEGHnhm
	+/9mOGI3LHSccluO7m8nFPLF6hZrQVQb8CYkwVUQ=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 May 2018 12:12:54 +0200
Message-Id: <1526983974-9620-1-git-send-email-krzk@kernel.org>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][rocko][PATCH] broadcom-bt-firmware: Add new recipe for Broadcom Bluetooth firmwares
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 May 2018 10:13:09 -0000

Several Broadcom Bluetooth USB dongles require firmware to be loaded.
This recipe provides the firmware for BCM20702, BCM20703, BCM43142,
BCM4335, BCM4350, BCM4356 and BCM4371 based devices.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

The patch is also available here:
https://github.com/krzk/meta-openembedded/commits/broadcom-bt
---
 .../broadcom-bt-firmware_git.bb                    | 76 ++++++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_git.bb

diff --git a/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_git.bb b/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_git.bb
new file mode 100644
index 000000000000..8c474ecdc472
--- /dev/null
+++ b/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_git.bb
@@ -0,0 +1,76 @@
+# Copyright (C) 2018 Krzysztof Kozlowski <krzk@kernel.org>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "Broadcom Bluetooth firmware files"
+DESCRIPTION = "Firmware for Broadcom Bluetooth devices. Note that in case of BT+WiFi devices, separate WiFi firmware might be needed."
+HOMEPAGE = "https://github.com/winterheart/broadcom-bt-firmware"
+
+LICENSE = "Firmware-Broadcom-WIDCOMM"
+NO_GENERIC_LICENSE[Firmware-Broadcom-WIDCOMM] = "LICENSE.broadcom_bcm20702"
+
+LIC_FILES_CHKSUM = "file://LICENSE.broadcom_bcm20702;md5=c0d5ea0502b00df74173d0f8a48b619d"
+SRC_URI = "git://github.com/winterheart/broadcom-bt-firmware.git"
+SRCREV = "c0bd928b8ae5754b6077c99afe6ef5c949a58f32"
+PE = "1"
+PV = "0.0+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+inherit allarch
+
+CLEANBROKEN = "1"
+
+do_compile() {
+    :
+}
+
+do_install() {
+    install -d ${D}${nonarch_base_libdir}/firmware/brcm/
+    cp brcm/*.hcd ${D}${nonarch_base_libdir}/firmware/brcm/
+
+    # For license package:
+    install -m 0644 LICENSE.broadcom_bcm20702 ${D}${nonarch_base_libdir}/firmware/brcm/
+
+    # For main package:
+    install -m 0644 DEVICES.md ${D}${nonarch_base_libdir}/firmware/brcm/
+}
+
+PACKAGES =+ " \
+    ${PN}-bcm20702a1 \
+    ${PN}-bcm20702b0 \
+    ${PN}-bcm20703a1 \
+    ${PN}-bcm43142a0 \
+    ${PN}-bcm4335c0 \
+    ${PN}-bcm4350c5 \
+    ${PN}-bcm4356a2 \
+    ${PN}-bcm4371c2 \
+    ${PN}-license \
+"
+
+RDEPENDS_${PN}-bcm20702a1 = "${PN}-license"
+RDEPENDS_${PN}-bcm20702b0 = "${PN}-license"
+RDEPENDS_${PN}-bcm20703a1 = "${PN}-license"
+RDEPENDS_${PN}-bcm43142a0 = "${PN}-license"
+RDEPENDS_${PN}-bcm4335c0 = "${PN}-license"
+RDEPENDS_${PN}-bcm4350c5 = "${PN}-license"
+RDEPENDS_${PN}-bcm4356a2 = "${PN}-license"
+RDEPENDS_${PN}-bcm4371c2 = "${PN}-license"
+
+FILES_${PN}-bcm20702a1 = "${nonarch_base_libdir}/firmware/brcm/BCM20702A1*hcd"
+FILES_${PN}-bcm20702b0 = "${nonarch_base_libdir}/firmware/brcm/BCM20702B0*hcd"
+FILES_${PN}-bcm20703a1 = "${nonarch_base_libdir}/firmware/brcm/BCM20703A1*hcd"
+FILES_${PN}-bcm43142a0 = "${nonarch_base_libdir}/firmware/brcm/BCM43142A0*hcd"
+FILES_${PN}-bcm4335c0 = "${nonarch_base_libdir}/firmware/brcm/BCM4335C0*hcd"
+FILES_${PN}-bcm4350c5 = "${nonarch_base_libdir}/firmware/brcm/BCM4350C5*hcd"
+FILES_${PN}-bcm4356a2 = "${nonarch_base_libdir}/firmware/brcm/BCM4356A2*hcd"
+FILES_${PN}-bcm4371c2 = "${nonarch_base_libdir}/firmware/brcm/BCM4371C2*hcd"
+FILES_${PN}-license += "${nonarch_base_libdir}/firmware/brcm/LICENSE.broadcom_bcm20702"
+
+FILES_${PN} += "${nonarch_base_libdir}/firmware/brcm/*"
+RDEPENDS_${PN} += "${PN}-license"
+
+# Make broadcom-bt-firmware depend on all of the split-out packages.
+python populate_packages_prepend () {
+    firmware_pkgs = oe.utils.packages_filter_out_system(d)
+    d.appendVar('RDEPENDS_broadcom-bt-firmware', ' ' + ' '.join(firmware_pkgs))
+}
-- 
2.7.4


