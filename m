Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E43267E09C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 11:55:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 450pYh0Nv7zJm
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 13:55:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557489320;
	bh=uxIDQQwIHtY0ioj2wGoc8AENYJDJGTJlbxPagqiJxKo=;
	h=From:To:Subject:Date:From;
	b=kBRfRWzgWKemzRAdcPk0vwVgFDjdtm6wPSmGr6auYIHSiuF8Z+dsxzEfqIgBBEnwL
	pM6o8qTon5/wqZthloIYWY/b/iMPZBy6wzfWFotHny6SFMlbtpYNcXBD/XxNVAdRbf
	LouPJp2AaiKN0S4V/r3b79zQdoNXgO10wZAwuJfUqfEv0Uw4Z5vNTVHLtVY0DKczEv
	8lpStJgtw41eH13+ct/SuhV5b0gXzVDQ4/fRG/9oKUXYG+ZDTEXqso8OgnLu0wnqy6
	3Sm7p1nSvyJov0A5JrorSBgc9FcnCzv7Gt39vY4v5zvB7CH+LkE/BEDRJ+lSyc94Yb
	tu8QpQTX9xKixrDc/I6ESoGuSmPQXcO0RL9x8l8xdMR2/j1kPYz110n0NoTjAOnaiS
	dm4Ojk6DQDABoQ8fiWVHEfScuOcVB86EIXCibw5vLF3/mWgaDjD2YQ2TBBPLYH53q6
	aMtfkZZXNhLiJL/ooGmBoPGAIJJaXBg7Hqsi6LEiQI/a3TxGuvNm0CfSsWRI92XAth
	t6qbye+Q0ADBdFeneqzUyM1uF0vbI+Wdb76YaDDjxoCXmZi73YUIHcO3rz7UyGbpX+
	d3eYjDN5zYOslE3f2VIkmXyRX7g92BbEFBQ4zLq3BT2cqYannTMnE0fDdoqK9CGaEy
	im3iOK7dShw1ZVa5+O9sMxN4=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 May 2019 14:55:08 +0300
Message-Id: <20190510115515.19491-12-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] ccid: Upgrade 1.4.24 -> 1.4.30
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
X-List-Received-Date: Fri, 10 May 2019 11:55:19 -0000

Switch to new upstream location.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../ccid/{ccid_1.4.24.bb => ccid_1.4.30.bb}               | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/ccid/{ccid_1.4.24.bb => ccid_1.4.30.bb} (57%)

diff --git a/meta-oe/recipes-support/ccid/ccid_1.4.24.bb b/meta-oe/recipes-support/ccid/ccid_1.4.30.bb
similarity index 57%
rename from meta-oe/recipes-support/ccid/ccid_1.4.24.bb
rename to meta-oe/recipes-support/ccid/ccid_1.4.30.bb
index 31145d0ef..95a41d2f7 100644
--- a/meta-oe/recipes-support/ccid/ccid_1.4.24.bb
+++ b/meta-oe/recipes-support/ccid/ccid_1.4.30.bb
@@ -1,17 +1,17 @@
 SUMMARY = "Generic USB CCID smart card reader driver"
-HOMEPAGE = "http://pcsclite.alioth.debian.org/ccid.html"
+HOMEPAGE = "https://ccid.apdu.fr/"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "virtual/libusb0 pcsc-lite"
 RDEPENDS_${PN} = "pcsc-lite"
 
-SRC_URI = "https://alioth.debian.org/frs/download.php/file/4171/ccid-${PV}.tar.bz2 \
+SRC_URI = "https://ccid.apdu.fr/files/ccid-${PV}.tar.bz2 \
     file://no-dep-on-libfl.patch \
 "
 
-SRC_URI[md5sum] = "915a03cda85b60fefbe3654cbdc68ca9"
-SRC_URI[sha256sum] = "62cb73c6c009c9799c526f05a05e25f00f0ad86d50f82a714dedcfbf4a7e4176"
+SRC_URI[md5sum] = "817abceef715e02cb47617621fe192e0"
+SRC_URI[sha256sum] = "ac17087be08880a0cdf99a8a2799a4ef004dc6ffa08b4d9b0ad995f39a53ff7c"
 
 inherit autotools pkgconfig
 
-- 
2.17.1


