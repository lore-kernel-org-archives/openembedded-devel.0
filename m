Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 19C0773190
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Aug 2016 00:39:06 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id x67so2302300qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Aug 2016 17:39:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VN58quUDoKFbEK/GllObsjEowW4X2KhkfjXOsT/Rqk4=;
	b=GyJrV8RF3/eVTr4A2PJk8wE4EBktOZMgHyLUR67LZGIvbv/lGsRcfkU0meINycwqjZ
	hVEiW7Ul/qq/2xRwfCyde1bjzBnvmKkId2vRrHs1x+TIrZ9iXtNUInk/5V0WBql4WYvs
	w0l9oikWon4ZN9gPLG5C0+F3+k5Ev30tUPAaGGsUirzLppc+wRhMdmRpN3eRgWCHmBP/
	qyRhwR/qaAH81U9X7KE1l6YKl2RxQDuSgUSLpA67DW9/cLHZ8lguErRN45kgGYlNNZwn
	AwKNes40dcd3eE/5qSopxEeT2wYs4JWTX71CLbECFfBYJQepZhRX0nfYaKwjvgs5QGMN
	JI8w==
X-Gm-Message-State: AEkooutClVGFCrUDIm1r9X1SkLi1OYnabfDogqqJSA5SoHqUrZuooISEDDrHTzzWquQf3A==
X-Received: by 10.55.162.67 with SMTP id l64mr1492176qke.14.1470789547525;
	Tue, 09 Aug 2016 17:39:07 -0700 (PDT)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	o131sm4898084qke.20.2016.08.09.17.39.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Aug 2016 17:39:06 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Aug 2016 20:38:52 -0400
Message-Id: <1470789534-602-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH 1/3] engine-pkcs11: update to version 0.2.2
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
X-List-Received-Date: Wed, 10 Aug 2016 00:39:08 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{engine-pkcs11_0.2.0.bb => engine-pkcs11_0.2.2.bb}       | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/engine-pkcs11/{engine-pkcs11_0.2.0.bb => engine-pkcs11_0.2.2.bb} (72%)

diff --git a/meta-oe/recipes-support/engine-pkcs11/engine-pkcs11_0.2.0.bb b/meta-oe/recipes-support/engine-pkcs11/engine-pkcs11_0.2.2.bb
similarity index 72%
rename from meta-oe/recipes-support/engine-pkcs11/engine-pkcs11_0.2.0.bb
rename to meta-oe/recipes-support/engine-pkcs11/engine-pkcs11_0.2.2.bb
index f2a2258..c391c4f 100644
--- a/meta-oe/recipes-support/engine-pkcs11/engine-pkcs11_0.2.0.bb
+++ b/meta-oe/recipes-support/engine-pkcs11/engine-pkcs11_0.2.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://src/engine_pkcs11.h;startline=1;endline=26;md5=973a19
 DEPENDS = "openssl libp11"
 
 SRC_URI = "git://github.com/OpenSC/engine_pkcs11.git;protocol=http"
-SRCREV = "6909d6761c8820e1750fa0bf4fa8532c82f34e35"
+SRCREV = "132fcf2c8b319f9f4b2ebdc8dcb54ff496dc0519"
 
 S = "${WORKDIR}/git"
 
@@ -18,12 +18,14 @@ inherit autotools pkgconfig
 
 EXTRA_OECONF = "\
     --disable-static \
-    --libdir ${libdir}/openssl \
+    --libdir ${libdir}/engines \
 "
 
 do_install_append () {
-    rm -f ${D}${libdir}/openssl/engines/libpkcs11.la
+    rm -f ${D}${libdir}/engines/libpkcs11.la
 }
 
-FILES_${PN} += "${libdir}/openssl/engines/libpkcs11.so*"
-FILES_${PN}-dbg += "${libdir}/openssl/engines/.debug/*"
+FILES_${PN} += "${libdir}/engines/libpkcs11.so*"
+FILES_${PN}-dbg += "${libdir}/engines/.debug/*"
+
+RDEPENDS_${PN} += "openssl libp11 opensc"
-- 
1.9.1


