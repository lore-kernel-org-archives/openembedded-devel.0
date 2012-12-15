Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TjwAC-0001A7-Rs
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Dec 2012 19:08:44 +0100
Received: by mail-bk0-f47.google.com with SMTP id j4so2053273bkw.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Dec 2012 09:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=rG/xpT1TtLggsG/bndapXOzE6NE61jeqTs9LCOhSNt0=;
	b=TMlPTX68gnJqVFkoKyvc6lOqpFLJ/9CQRNp/0LheQnC36nsWykkJnHhI2iHY3OZv7z
	F/xrk7VJaeXHnwqf/3XcwQO/wV26f3IS5fLYBF8ckCO7ud9umqjUxWURgYyrbaX7ZEP8
	O+3r/R1IZ4I5wQef/nh12Vbfg542nhoaof0Z9fN5fIG5X+r5uhtSdE12I5Z2lel8Gz42
	lYdTqTmoYtFs7MxpLX4+eFAPG5tYgNwXpXbgaJaBik7cjPR/CVcAuLFg5e4mm2geX7MJ
	CnPEcuXzAybYWa3XMa5VfRovF8HKGLsgmOVfMTWzoENTuOHj4desFs0BY0bngMt21ZPA
	turQ==
Received: by 10.204.147.85 with SMTP id k21mr4077176bkv.24.1355594042865;
	Sat, 15 Dec 2012 09:54:02 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id m20sm6573662bkw.4.2012.12.15.09.54.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 15 Dec 2012 09:54:01 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1Tjvvz-0002TK-At; Sat, 15 Dec 2012 19:53:59 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Dec 2012 19:53:57 +0200
Message-Id: <1355594037-6395-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH v2] libsdl-image: update to upstream version 1.2.12
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
X-List-Received-Date: Sat, 15 Dec 2012 18:08:44 -0000

Now uses zlib license.
Works with libpng15.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../{libsdl-image_1.2.10.bb => libsdl-image_1.2.12.bb}      |   11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-multimedia/libsdl-image/{libsdl-image_1.2.10.bb => libsdl-image_1.2.12.bb} (75%)

diff --git a/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.10.bb b/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
similarity index 75%
rename from meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.10.bb
rename to meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
index 12a3abd..ccc3d40 100644
--- a/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.10.bb
+++ b/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
@@ -1,16 +1,16 @@
 DESCRIPTION = "Simple DirectMedia Layer image library."
 SECTION = "libs"
 
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
+LICENSE = "zlib"
+LIC_FILES_CHKSUM = "file://COPYING;md5=613734b7586e1580ef944961c6d62227"
 
-PR = "r3"
+PR = "r0"
 
 DEPENDS = "tiff zlib libpng jpeg virtual/libsdl"
 
 SRC_URI = "http://www.libsdl.org/projects/SDL_image/release/SDL_image-${PV}.tar.gz"
-SRC_URI[md5sum] = "6c06584b31559e2b59f2b982d0d1f628"
-SRC_URI[sha256sum] = "75e05d1e95f6277b44797157d9e25a908ba8d08a393216ffb019b0d74de11876"
+SRC_URI[md5sum] = "a0f9098ebe5400f0bdc9b62e60797ecb"
+SRC_URI[sha256sum] = "0b90722984561004de84847744d566809dbb9daf732a9e503b91a1b5a84e5699"
 
 S = "${WORKDIR}/SDL_image-${PV}"
 
@@ -31,4 +31,3 @@ do_configure_prepend() {
 	rm -f acinclude/ltsugar.m4
 	rm -f acinclude/ltversion.m4
 }
-
-- 
1.7.10.4



