Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F6A2C54E71
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 20:50:15 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.6136.1711140611299167860
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Mar 2024 13:50:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=XZmukxyu;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 96E2487FA3;
	Fri, 22 Mar 2024 21:50:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1711140609;
	bh=by+cC6VWym+xJjBnma2b4CzXP7hZF/5+09S0VyifsmE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XZmukxyuXXbha9OcGVUTZmydn1kwmp4lZB0jCywUNJMiiMRABWwpjhIBvhEsCT6uC
	 JERywmJTLPCg3nGxiABJ+qjn4wUh3EsaBPTeivgpyQaPguY3lOLPcNOor1IP5AUetB
	 znFXBkDH/zQnfnExQiidlFBi9aumycF0zlNiIocn+PW+qdjDUCRM1PA6lmxRnJ6xbX
	 02cvZN5eg/LvbF6jzBQybd3K1+GWD76B29V+pZ1sFDWAV5uYpQH4n1L/FCvCKTINcC
	 WCO/vbjWcOB8VP/WZkzTykzOwF3NP4iiV4wmEaXYUCM828wcLgpihlskp/5ORvjaz0
	 XT7fBpJz8TnoA==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Christophe Chapuis <chris.chapuis@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 3/3] lvgl: Deduplicate PACKAGECONFIG into lv-conf
Date: Fri, 22 Mar 2024 21:49:15 +0100
Message-ID: <20240322204951.43007-3-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240322204951.43007-1-marex@denx.de>
References: <20240322204951.43007-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Mar 2024 20:50:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109529

Move the default PACKAGECONFIG setting from both recipes into
lv-conf.inc to avoid duplication. No functional change.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Christophe Chapuis <chris.chapuis@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-graphics/lvgl/lv-conf.inc           | 2 ++
 meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.1.0.bb | 1 -
 meta-oe/recipes-graphics/lvgl/lvgl_9.1.0.bb         | 1 -
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc b/meta-oe/recipes-=
graphics/lvgl/lv-conf.inc
index 8596790ae..8fd3412c0 100644
--- a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
+++ b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
@@ -1,3 +1,5 @@
+PACKAGECONFIG ??=3D "drm"
+
 PACKAGECONFIG[drm] =3D ",,libdrm"
 PACKAGECONFIG[fbdev] =3D ",,"
 PACKAGECONFIG[sdl] =3D ",,virtual/libsdl2 libsdl2-image"
diff --git a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.1.0.bb b/meta-o=
e/recipes-graphics/lvgl/lvgl-demo-fb_9.1.0.bb
index 2bf56e293..3fc3f9286 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.1.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.1.0.bb
@@ -20,7 +20,6 @@ SRCREV_FORMAT =3D "demo_lvgl"
=20
 EXTRA_OEMAKE =3D "DESTDIR=3D${D}"
=20
-PACKAGECONFIG ??=3D "drm"
 LVGL_CONFIG_DRM_CARD ?=3D "/dev/dri/card0"
 LVGL_CONFIG_LV_USE_LOG    =3D "1"
 LVGL_CONFIG_LV_LOG_PRINTF =3D "1"
diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_9.1.0.bb b/meta-oe/recipe=
s-graphics/lvgl/lvgl_9.1.0.bb
index 353d0002f..0ebd6ec42 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl_9.1.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl_9.1.0.bb
@@ -20,7 +20,6 @@ inherit cmake
 EXTRA_OECMAKE =3D "-DLIB_INSTALL_DIR=3D${baselib} -DBUILD_SHARED_LIBS=3D=
ON"
 S =3D "${WORKDIR}/git"
=20
-PACKAGECONFIG ??=3D "drm"
 require lv-conf.inc
=20
 do_install:append() {
--=20
2.43.0


