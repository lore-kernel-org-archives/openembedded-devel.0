Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.40083.1589803140708839138
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 04:59:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=p0Ido4eW;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=l5hx=7a=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49QcxD5k9Jz2f
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 13:58:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589803137;
	bh=KniBH2rwXzEp+GK64HkDrpU4A9f/YdR7n6frQtTpeF8=;
	h=From:To:Subject:Date:From;
	b=p0Ido4eWfx7r2vYd2WC3ppn63s1qsQWyu7S4F8mBaGu08SFQLCxbbLgtJtU9k9ZP2
	 rDYPFK2EyefcewI5Wq25hC2yjU8XBNsI4TKK2Y22E/Vylh6V+IP/R+EDi7isgUTaOF
	 ZVZWf1bxykPJRMvVZa6SlkYEgP/GOMtZkWu2HPiEbf6ihjrrNW1+QOS8kzkEle/kCc
	 sf4BzyRuVobfpRXdgHLjFvV5+tR1DHEO7xhlmUhma97T36ON0Sjcrb4vZgK2K5mC9k
	 kw/cV+7HQ085lGGMFLbv92mO6tqpW/HaXG86ZuvNn41cKy1aN0h1gw0jDvAKT7S61r
	 ZXFEm9zti5XJLKVmOhtSvZdt3r63kDsv+OYTtnOHK0u+D3M5dHgYV445yowpdOKOnx
	 naZomhbvSqftymJD8hEq7UwaNbpM+Rg+WLEDLXhmpypCGOZZm4r1fZ4BEl8Lnyxiz5
	 tlxy1zJKm8VxS8g1A7F1g+Ufhr2rDZSppmS6NaAZsoXX97nDcNMUQarrKVStOMOJv3
	 9YWnak1e52DaXduTh79s2MHperBlFtRXAygxyWwripYxroIAB/OVZGR8aA6ZQB0VhN
	 0Y4rXK/FqbPm/k5JuHPlag19AE4fFRK+ZgzPWNeNbLgP7A7Ns+T5UQ3AUJmCpxNju0
	 WGLlUHmt7H97gqVzd2/+Nsfk=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] libhandy: Remove, moved to OE-core
Date: Mon, 18 May 2020 14:58:54 +0300
Message-Id: <20200518115854.9546-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../recipes-support/libhandy/libhandy_git.bb  | 21 -------------------
 1 file changed, 21 deletions(-)
 delete mode 100644 meta-gnome/recipes-support/libhandy/libhandy_git.bb

diff --git a/meta-gnome/recipes-support/libhandy/libhandy_git.bb b/meta-gnome/recipes-support/libhandy/libhandy_git.bb
deleted file mode 100644
index 8c6159f99..000000000
--- a/meta-gnome/recipes-support/libhandy/libhandy_git.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "A library full of GTK+ widgets for mobile phones"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
-
-SRC_URI = "git://source.puri.sm/Librem5/${BPN}.git;protocol=https"
-SRCREV = "ef7c4bf75ae239495141ada83d2fbaf034315563"
-S = "${WORKDIR}/git"
-PV = "0.0.12"
-
-GIR_MESON_ENABLE_FLAG = 'enabled'
-GIR_MESON_DISABLE_FLAG = 'disabled'
-GTKDOC_MESON_OPTION = 'gtk_doc'
-
-inherit meson gobject-introspection vala gettext gtk-doc features_check
-
-ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
-
-DEPENDS += "gtk+3"
-
-PACKAGES =+ "${PN}-examples"
-FILES_${PN}-examples = "${bindir}"
-- 
2.17.1

