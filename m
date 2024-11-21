Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9823AD6ED0A
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 11:21:02 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.8321.1732188060673261152
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Nov 2024 03:21:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FePMM6aZ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E0377240003;
	Thu, 21 Nov 2024 11:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732188059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oE4+QzRpJMZN83ik5N3vQFjPiIwNLj1ZCBLu9/XPPaM=;
	b=FePMM6aZXd0Uc6GzJPa3HVhR3/8MxRhj6k1SRnpw/8NKoAdRmwkL6KJNBx9pr+SOKDtrHm
	0udxnbi6TgA2NjjOKFbXzyO+JtMOObgIYpwbYXfZaKDDy0NjX1e3eoJS4bZe8IoLM62xLq
	wnlLusv0e/TBj7gbhnOjOf4rIt9Ux8sKEvg7NRgg/Wpe2ZkLQOyeJU6KDPuv0YLzRhAk//
	f9irjMuanfYcvXHPE8NOE1O7LwFHqUgUJAfFL56H+Adx5KH7Sz3ZwL/qnE62izbrHDZLaq
	lSQNvGACe7wxeKvzQwPug3N/TpSd/PVHXeTfWx+RJ80cKMpGcfr/DtQJ9Y4Z9w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 21 Nov 2024 12:20:47 +0100
Subject: [meta-oe][PATCH] cryptopp: add a recipe for version 8.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241121-add-cryptopp-v1-1-36382a60cecb@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAI4XP2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQyND3cSUFN3kosqCkvyCAt00cwtzS5OkVEsz42QloJaCotS0zAqwcdG
 xtbUArbRXA14AAAA=
X-Change-ID: 20241121-add-cryptopp-f78794be963c
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2258;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=orYfufrMFJovfDGJFF83hqj747SuuZVBzynEMhzCqlE=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnPxeaqhmNVr14qQf7jPXh4DdGuzpzz+BStXEct
 8ZyWsiiX4GJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZz8XmgAKCRDRgEFAKaOo
 NkoBD/9nh4H0V3qPPn15z5pYM9ZEqLgQ8bsEIJQRg+hR3tDN3KMvlActn3tkf0iA3oIwqZQD85C
 VnWokpRJoVOuEC9nHHKWuG7VNFP9beuyoKpdpVZ0sRRyO0VDG5ZrKT++WsbmnRHBVHmPRRMaoVV
 5gVe4vWFsFEZrB37vHWmZwipZivKQvq3Y/SNE1tHcUIqESU2eAuOBFVA/Q+GrWphVx6glu9JxJy
 PTcfuxIA4pln+8v5f35nvDKOXo6DA0x73fP8jUs2dEZB12Ewkq/Lb7Kg7Ao/ov1/tqcRnqCr8Jk
 ReCnPnVDvp2w4s/6PvPQ+uvypobsPcPeGId2vNT9eFk5hzh+JWLBnzDbH/rkKCAi3X4tAXBFTzD
 1ue74XoYfutVLjZvEPy8Jnk6PPJvpNHLAAnvkD78wzkL9KJqfF6aUlEHEZDBcNeI5Jk9l+0TnlT
 E8z9QLh+M3jlPBfIMdBYDjL4s8J/AcPVaNaNG6a8mpjQMrpMCf397V31fotBCMKdbjP3wlidD1N
 PbAEPX0nAbuQKvdxpUJ9VR8J3rEZgMFqtTWhpD5sdT+wrpqyrQmUqFA/P4G4pCVi0yL/mGOmZCK
 wsKOPXsIIm/N7FxLQXFT8v6Ih86DRB2tdhNhYT83dAUqOqvR1Rx5HZFuikmiTYZG66JfsM21hcO
 /OcZo/8sEEr1FOw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 11:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113966

cryptopp is a library of cryptographic schemes written in C++

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 meta-oe/recipes-crypto/cryptopp/cryptopp_8.9.0.bb | 45 +++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/meta-oe/recipes-crypto/cryptopp/cryptopp_8.9.0.bb b/meta-oe/recipes-crypto/cryptopp/cryptopp_8.9.0.bb
new file mode 100644
index 0000000000000000000000000000000000000000..06652a3449525ffe649c3af45ad2809b96332b0f
--- /dev/null
+++ b/meta-oe/recipes-crypto/cryptopp/cryptopp_8.9.0.bb
@@ -0,0 +1,45 @@
+SUMMARY = "A free C++ class library of cryptographic schemes"
+DESCRIPTION = "Crypto++ Library is a free C++ class library of cryptographic schemes"
+CVE_PRODUCT = "cryptopp"
+HOMEPAGE = "http://www.cryptopp.com/"
+SECTION = "libs"
+LICENSE = "BSL-1.0"
+LIC_FILES_CHKSUM = "file://License.txt;md5=ca6dacb7ef68b1ab5dfa3bed24c12003"
+
+SRC_URI = "git://github.com/weidai11/cryptopp.git;protocol=https;branch=master"
+SRCREV = "843d74c7c97f9e19a615b8ff3c0ca06599ca501b"
+
+S = "${WORKDIR}/git"
+
+inherit pkgconfig
+
+CXXFLAGS:append = " -fPIC"
+# Avoid target mismatch error
+CXXFLAGS:append:aarch64 = "${@bb.utils.contains("TUNE_FEATURES", "aarch64", " -DCRYPTOPP_DISABLE_ASM=1", "", d)}"
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
base-commit: 575951815e3850cff8ed78ad2ef53b74e014a8c2
change-id: 20241121-add-cryptopp-f78794be963c

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


