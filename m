Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 376917F8AC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Jan 2020 14:02:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47w1kN1N4xz4q
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Jan 2020 15:02:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1578751324;
	bh=gsz3oScqHloQmycIevY7LRi9CZXIzPyZu9CeW+US4b4=;
	h=From:To:Subject:Date:From;
	b=NI04LR+5j2md+51kXrfIpNQ/pb82IjCrkLm8bScy+kz+cvT/B4yjQZGqYkvCbpiSS
	PAMLyb8lCejSzRIVHgVTKS6LAbjTGhGKsBVIunrXypZyVLeo1CuHV7ScipTyjvIQos
	cT8zp95Am3ZTcIXKf7mbG/8ac9f2ERDj5sWCyOeVWZRNMLmNbZQgxi3NJZF4hZQ1mU
	OhB+z+c2/0tj1CF18vQ53RLoWYkBXdpOQdKMibzMKelOizUc1LlZeoazYTw5Ro4vxj
	dSLKEtLpJj3ROy7bENdyCSTjI3yc2vskLzB8lABpFE+tH3zCQIZd5kLREiMVJrQHyF
	IacuYvl8eLq2ugxAoCkfZzACI0aTG7OqseC3lbz/yDKHLWAmp8w9w9Nt/1S/9pY6eE
	8C0XxHnTQTJBqLUtXWbaJ0jNJgAdeDmxaDf4Bmy81Fzo4FLnofg6qYOg84TYtiRGWx
	Gj8wZM64P8VkDG9su7kocAtgjExpmd9waBG39VfzdoLWhbVWM1HixLaI+vlHKp+HQB
	1RnofFGoLu9SqdpjkhXgWneL0F8hSbA4IWBBwOkNrfotIwylCCdgMtAjubd/injeZf
	ucAgitu54YwbosE+p2yPXaIbEE/8N557fjpLtF83JHeA04GFhk39bRXrs51ijQAjGf
	UmG4EzJ4JWE/uh5Lo2qGFubo=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Jan 2020 16:02:03 +0200
Message-Id: <20200111140203.9789-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] enchant2: Remove, moved to oe-core
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
X-List-Received-Date: Sat, 11 Jan 2020 14:02:05 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../recipes-support/enchant/enchant2_2.2.7.bb | 28 -------------------
 1 file changed, 28 deletions(-)
 delete mode 100644 meta-oe/recipes-support/enchant/enchant2_2.2.7.bb

diff --git a/meta-oe/recipes-support/enchant/enchant2_2.2.7.bb b/meta-oe/recipes-support/enchant/enchant2_2.2.7.bb
deleted file mode 100644
index b30b2d8e4..000000000
--- a/meta-oe/recipes-support/enchant/enchant2_2.2.7.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-SUMMARY = "Enchant Spell checker API Library v2"
-SECTION = "libs"
-HOMEPAGE = "https://abiword.github.io/enchant/"
-LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a916467b91076e631dd8edb7424769c7"
-
-DEPENDS = "glib-2.0"
-
-inherit autotools pkgconfig
-
-SRC_URI = "https://github.com/AbiWord/enchant/releases/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[md5sum] = "8a6ea1bb143c64e0edf5e49c7e7cb984"
-SRC_URI[sha256sum] = "1b22976135812b35cb5b8d21a53ad11d5e7c1426c93f51e7a314a2a42cab3a09"
-
-UPSTREAM_CHECK_URI = "https://github.com/AbiWord/enchant/releases"
-
-S = "${WORKDIR}/enchant-${PV}"
-
-EXTRA_OEMAKE = "pkgdatadir=${datadir}/enchant-2"
-
-PACKAGECONFIG ??= "hunspell"
-PACKAGECONFIG[aspell]  = "--with-aspell,--without-aspell,aspell,aspell"
-PACKAGECONFIG[hunspell]  = "--with-hunspell,--without-hunspell,hunspell,hunspell"
-
-FILES_${PN} += " \
-    ${datadir}/enchant-2 \
-    ${libdir}/enchant-2 \
-"
-- 
2.17.1


