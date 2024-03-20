Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 810F5C54E67
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 09:56:31 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.40012.1710928590078673072
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Mar 2024 02:56:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=FgEiG1LC;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 2694C87FB8;
	Wed, 20 Mar 2024 10:56:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710928588;
	bh=eFSkeg8L5Oipy7Jd6Tvrv1hwQbqJMqOL0MkUEKS1BRQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FgEiG1LCdEljmxVzIb+LRzvHxYLwgODlAgwCZz1KNE6kUqqfZ542SncD2KS4KeGbn
	 4fzjXX+hCyWAsxCJzQPgEk8smBNgW0V1TsHHJ9u9ivSHXAcsTvDFZ3mdd7LPS9uQjv
	 nOeguJIpX3Q+CwXAr+hdrdw6V/ROW5rwyvTdd0ogqZb9vhfqzDMfoE244VCAuMRMRw
	 QwYCOkftrwF4sY03EDGHqNeN64ewZjqy1gg0p/PnzGfnyeNP/zrru9fxhgY3jz6NLw
	 P0/SxBmHl8xciRzejdkq0AqVwPc2aYN/OeUw48w8xchlwmdEB3sgeryclpsCOTry/b
	 p6T3CnPBv7R5w==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Christophe Chapuis <chris.chapuis@gmail.com>,
	Fabio Estevam <festevam@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] lvgl: Update to 9.1.0
Date: Wed, 20 Mar 2024 10:55:38 +0100
Message-ID: <20240320095612.176662-2-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240320095612.176662-1-marex@denx.de>
References: <20240320095612.176662-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Mar 2024 09:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109486

Update LVGL to final 9.1.0 . Drop the XRGB8888 fix which
is part of the release.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Christophe Chapuis <chris.chapuis@gmail.com>
Cc: Fabio Estevam <festevam@denx.de>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
---
 ...-drm-Default-to-XRGB8888-framebuffer.patch | 36 -------------------
 ...demo-fb_9.0.0.bb =3D> lvgl-demo-fb_9.1.0.bb} |  3 +-
 .../lvgl/{lvgl_9.0.0.bb =3D> lvgl_9.1.0.bb}     |  3 +-
 3 files changed, 2 insertions(+), 40 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/lvgl/files/0001-fix-drm-Defa=
ult-to-XRGB8888-framebuffer.patch
 rename meta-oe/recipes-graphics/lvgl/{lvgl-demo-fb_9.0.0.bb =3D> lvgl-de=
mo-fb_9.1.0.bb} (92%)
 rename meta-oe/recipes-graphics/lvgl/{lvgl_9.0.0.bb =3D> lvgl_9.1.0.bb} =
(89%)

diff --git a/meta-oe/recipes-graphics/lvgl/files/0001-fix-drm-Default-to-=
XRGB8888-framebuffer.patch b/meta-oe/recipes-graphics/lvgl/files/0001-fix=
-drm-Default-to-XRGB8888-framebuffer.patch
deleted file mode 100644
index 9d758cb08..000000000
--- a/meta-oe/recipes-graphics/lvgl/files/0001-fix-drm-Default-to-XRGB888=
8-framebuffer.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 7b89e18c2f21e4b91b461007368df724198ac904 Mon Sep 17 00:00:00 2001
-From: Marek Vasut <marex@denx.de>
-Date: Tue, 12 Mar 2024 03:13:33 +0100
-Subject: [PATCH 1/2] fix(drm): Default to XRGB8888 framebuffer
-
-The ARGB8888 framebuffer format for base canvas makes little sense
-as the base canvas is unlikely to be transparent and require alpha.
-Use XRGB8888 framebuffer format which is more widely supported by
-DRM drivers as base plane pixel format.
-
-This makes e.g. i.MX8M Nano work by default.
-
-Upstream-Status: Submitted [https://github.com/lvgl/lvgl/pull/5851]
-Signed-off-by: Marek Vasut <marex@denx.de>
----
-This is identical fix to lv_drivers https://github.com/lvgl/lv_drivers/p=
ull/282
----
- src/drivers/display/drm/lv_linux_drm.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/drivers/display/drm/lv_linux_drm.c b/src/drivers/displa=
y/drm/lv_linux_drm.c
-index c706f9cb2..faa2212bf 100644
---- a/src/drivers/display/drm/lv_linux_drm.c
-+++ b/src/drivers/display/drm/lv_linux_drm.c
-@@ -24,7 +24,7 @@
-  *      DEFINES
-  *********************/
- #if LV_COLOR_DEPTH =3D=3D 32
--    #define DRM_FOURCC DRM_FORMAT_ARGB8888
-+    #define DRM_FOURCC DRM_FORMAT_XRGB8888
- #elif LV_COLOR_DEPTH =3D=3D 16
-     #define DRM_FOURCC DRM_FORMAT_RGB565
- #else
---=20
-2.43.0
-
diff --git a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.0.0.bb b/meta-o=
e/recipes-graphics/lvgl/lvgl-demo-fb_9.1.0.bb
similarity index 92%
rename from meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.0.0.bb
rename to meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.1.0.bb
index 308e74897..542b70ea2 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.0.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.1.0.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D802d3d83ae80ef=
5f343050bf96cce3a4 \
 SRC_URI =3D "\
 	git://github.com/lvgl/lv_port_linux_frame_buffer.git;protocol=3Dhttps;b=
ranch=3Dmaster;name=3Ddemo \
 	git://github.com/lvgl/lvgl;protocol=3Dhttps;branch=3Dmaster;name=3Dlvgl=
;subdir=3Dgit/lvgl \
-	file://0001-fix-drm-Default-to-XRGB8888-framebuffer.patch;patchdir=3Dlv=
gl \
 	file://0002-fix-sdl-handle-both-LV_IMAGE_SRC_FILE-and-LV_IMAGE_S.patch;=
patchdir=3Dlvgl \
 	file://0003-Make-fbdev-device-node-runtime-configurable-via-envi.patch =
\
 	file://0004-Factor-out-fbdev-initialization-code.patch \
@@ -16,7 +15,7 @@ SRC_URI =3D "\
 	file://0007-fix-cmake-generate-versioned-shared-libraries.patch;patchdi=
r=3Dlvgl \
 	"
 SRCREV_demo =3D "dccc6a1ca48372aa993dbea7a8e17dec6f42df6a"
-SRCREV_lvgl =3D "e29d35b43c509b6d7189f5dac87139441669ae66"
+SRCREV_lvgl =3D "e1c0b21b2723d391b885de4b2ee5cc997eccca91"
 SRCREV_FORMAT =3D "demo_lvgl"
 PV .=3D "+git${SRCPV}"
=20
diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb b/meta-oe/recipe=
s-graphics/lvgl/lvgl_9.1.0.bb
similarity index 89%
rename from meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
rename to meta-oe/recipes-graphics/lvgl/lvgl_9.1.0.bb
index 0fb3ddecf..fc967e6d1 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl_9.1.0.bb
@@ -10,11 +10,10 @@ LIC_FILES_CHKSUM =3D "file://LICENCE.txt;md5=3Dbf1198=
c89ae87f043108cea62460b03a"
=20
 SRC_URI =3D "\
 	git://github.com/lvgl/lvgl;protocol=3Dhttps;branch=3Dmaster \
-	file://0001-fix-drm-Default-to-XRGB8888-framebuffer.patch \
 	file://0002-fix-sdl-handle-both-LV_IMAGE_SRC_FILE-and-LV_IMAGE_S.patch =
\
 	file://0007-fix-cmake-generate-versioned-shared-libraries.patch \
 	"
-SRCREV =3D "e29d35b43c509b6d7189f5dac87139441669ae66"
+SRCREV =3D "e1c0b21b2723d391b885de4b2ee5cc997eccca91"
 PV .=3D "+git${SRCPV}"
=20
 inherit cmake
--=20
2.43.0


