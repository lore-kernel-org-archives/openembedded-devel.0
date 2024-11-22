Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA45D75E54
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 14:11:56 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.25262.1732284714543080199
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Nov 2024 06:11:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AA7zltxA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8B44520007;
	Fri, 22 Nov 2024 14:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732284712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PuDSc/SAmZjL9MiUu+L0enJc0nR5WvMkslg8dBkQ/14=;
	b=AA7zltxACyp+Cd37PCPK6TiTP4f++mzzSdWtJsbRHkfCyy5cqEa4Y/RX/K+JGXXnjKJSdV
	r9hlVnTYr7iw7OoXBdiPMjZ0cb992BSQLk5Y461p+cpJhEpENXfs4QyNrDJL9vJhmAzOVX
	Ohj67RRgBjeWl/bqpzKbYD0QAkVTh1a7c02VKTyADKUySx3E+cmCaxTOVHDDnpFbcaU2d1
	mojW54c0hGepP5DICdsHQuwbvadh5V+YFTyfzdnwpelvumWL22nwcbZeg2sbeLb4ha8AOG
	qFgigz+7ZC/VpDTZXytcLJeLAEn0J4r7DoE8S4X9GO6w4zyceSN615RozfY3uw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 22 Nov 2024 15:11:44 +0100
Subject: [meta-oe][PATCH v2] cryptopp: add a recipe for version 8.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-add-cryptopp-v2-1-19456062f791@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAB+RQGcC/3XMSw6DIBSF4a2YOy6NoEHtqPtoHPC41pu0QoCQG
 sPeS513+J/kfAdEDIQRbs0BATNFclsNcWnArGp7IiNbG0Qres4FZ8paZsLuk/OeLcM4TL3GSXY
 G6sUHXOhzco+59koxubCfeua/9Q+UOeOsk90olGwNGn3XzqUXbVfj3jCXUr7FahQFqgAAAA==
X-Change-ID: 20241121-add-cryptopp-f78794be963c
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2659;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=K5QAtl+1CYmkjKB9l0tm8yfxvTdSlMW4ZKJHvFtl0R0=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnQJEnp5OkjoE+M0yoV658qCFWY7hdtQx1B2v32
 O1RIe4CTdiJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ0CRJwAKCRDRgEFAKaOo
 Ni41D/0apMCLETw/pSUCGOXaGksL7jb5NSzJ6c5Xm+4fZMU5KCv8V4MmbYDrKGM/7ba5MaUiQCe
 T8p65Pf9SNppJjhBH+42YOky20+9nquISsenwdn3vqpFRRN0ujpVcdxCBFSjejM285wvruGsfqX
 igyec6pIry/Y6Yyer9PM/fHW1ab6ER4G6uNKZViCxl2XApm4apcLm7PwJHpg+77gBAv1CLEeI5L
 IXi3Un4Gt9eCVCDPKmZ3lSTt+B5TbGE/LgUwK2+gbtf48Ms4Z8lRw5YRiE7M5DFM8K+ToBSXqia
 jr5ODh1bEqh9GnPsw9krTjykMItIPJYBoYoJt9EseOM1FF+UiupB4aTmBWK8Ba3+ugZkvRMIX+8
 xMe5FslStdD6ALCCIODCIFYdcSG/+rntN0m3IK+3LOYfDuOQK9pYRDErVBllRs0Xfjx6zHIxPlv
 snzA0Mz6AjcIf887ggNkFEI2q9jht5HguJDREJvAE9OWhFocnb7mFnqxAN9gLf0EQuD0F+X2KX/
 NnXL4wl1f90dtf2f1ZbCieiIB/j7nWb2b6m0mOPtJ1Y7KZxgDt3VFcNq7zqKLUM2JvUaCgDLsf3
 mzD6iXR2a+2Sm02wmRfBNou+BTkLYfnwe8UD8kBt5QIK4vYg4qjT4C3ui/UDlcG/uLMia5FKBLx
 cKZMCtFRHZgZt4A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 14:11:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114001

Cryptopp is a library of cryptographic schemes written in C++.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
I had issues compiling for qemuarm64, which are close to
https://github.com/weidai11/cryptopp/issues/565. One of the solution is
to disable ASM, so do that for aarch64. I don't observe the issue with
qemuarm.
---
Changes in v2:
- WORKDIR -> UNPACKDIR in S
- remove bb.utils.contains in CXXFLAGS:append:aarch64 (forgot to remove
  after adding aarch64 override)
- Link to v1: https://lore.kernel.org/r/20241121-add-cryptopp-v1-1-36382a60cecb@bootlin.com
---
 meta-oe/recipes-crypto/cryptopp/cryptopp_8.9.0.bb | 45 +++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/meta-oe/recipes-crypto/cryptopp/cryptopp_8.9.0.bb b/meta-oe/recipes-crypto/cryptopp/cryptopp_8.9.0.bb
new file mode 100644
index 0000000000000000000000000000000000000000..a3d4fedb2f67c0111dcd262081b622cfbdd40b57
--- /dev/null
+++ b/meta-oe/recipes-crypto/cryptopp/cryptopp_8.9.0.bb
@@ -0,0 +1,45 @@
+SUMMARY = "A C++ class library of cryptographic schemes"
+DESCRIPTION = "Crypto++ Library is a C++ class library of cryptographic schemes"
+CVE_PRODUCT = "cryptopp"
+HOMEPAGE = "http://www.cryptopp.com/"
+SECTION = "libs"
+LICENSE = "BSL-1.0"
+LIC_FILES_CHKSUM = "file://License.txt;md5=ca6dacb7ef68b1ab5dfa3bed24c12003"
+
+SRC_URI = "git://github.com/weidai11/cryptopp.git;protocol=https;branch=master"
+SRCREV = "843d74c7c97f9e19a615b8ff3c0ca06599ca501b"
+
+S = "${UNPACKDIR}/git"
+
+inherit pkgconfig
+
+CXXFLAGS:append = " -fPIC"
+# Avoid target mismatch error
+CXXFLAGS:append:aarch64 = " -DCRYPTOPP_DISABLE_ASM=1"
+EXTRA_OEMAKE += "HAS_SOLIB_VERSION=1"
+
+do_compile () {
+    oe_runmake -f GNUmakefile-cross libcryptopp.a libcryptopp.so cryptest.exe
+}
+
+do_install () {
+    DESTDIR="${D}" \
+        BINDIR="${bindir}" \
+        DATADIR="${datadir}" \
+        INCLUDEDIR="${includedir}" \
+        LIBDIR="${libdir}" \
+        oe_runmake install
+
+    # Rename cryptest.exe to cryptest
+    if [ -f "${D}${bindir}/cryptest.exe" ]; then
+        mv "${D}${bindir}/cryptest.exe" "${D}${bindir}/cryptest"
+    fi
+}
+
+PACKAGE_BEFORE_PN += "${PN}-cryptest ${PN}-testdata ${PN}-testvectors"
+
+FILES:${PN}-cryptest = "${bindir}/cryptest"
+FILES:${PN}-testdata = "${datadir}/cryptopp/TestData"
+FILES:${PN}-testvectors = "${datadir}/cryptopp/TestVectors"
+
+BBCLASSEXTEND = "native nativesdk"

---
base-commit: 71ffb63f60b233722ec9d8b50bfe0488997fbcfa
change-id: 20241121-add-cryptopp-f78794be963c

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


