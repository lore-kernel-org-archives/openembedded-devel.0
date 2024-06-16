Return-Path: <sbabic@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81339C27C79
	for <webhook@archiver.kernel.org>; Sun, 16 Jun 2024 13:06:57 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.33589.1718543216160256302
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Jun 2024 06:06:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=VXA5mm4w;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: sbabic@denx.de)
Received: from paperino.fritz.box (unknown [IPv6:2001:a61:5210:b101:5ae6:8b1f:db3e:99cc])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: sbabic@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 1AF1D86EB5;
	Sun, 16 Jun 2024 15:06:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1718543214;
	bh=TuDsPd4PHsAta5eb5SFK/UgELl/frFO0TbJ5LZ3RcvA=;
	h=From:To:Cc:Subject:Date:From;
	b=VXA5mm4wH2j7VTRSQ1vavtQPpNfJOxS9tMrwkB/G2xpGGLJ7xN0t2MQUASd5qY7sJ
	 o3yBxfEfyOyur34+kVsmw2I3b95aa14F4McshssQf3WO9NegllHt/TXsaNPHEA4kqg
	 uyOSBwKaEUBeuVZOxmP7HoQz1TKkcMzULPeY5jF7KPaWVjJue0hK2cy+e9Fc5ycRqn
	 Bluf27fSuvpJnjZIcAdpdg1N8x+/ay+eEYw8Kr1vBnhn4GpSxk0PkeHDnRkr/1GL/I
	 AGSa/dFqwt/d6MBfGFRrNwghny9lFFTRGA0wz+C4CBM4nDzYjJWpjEj72tOyyWyW5C
	 L24AAv7YuiFuA==
From: Stefano Babic <sbabic@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Stefano Babic <sbabic@denx.de>,
	Marek Vasut <marex@denx.de>
Subject: [PATCH V2] lvgl: add gridnav to packageconfig
Date: Sun, 16 Jun 2024 15:06:42 +0200
Message-Id: <20240616130642.65873-1-sbabic@denx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Jun 2024 13:06:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110918

Some packages require to activate LVGL_CONFIG_LV_USE_GRIDNAV, so let
configure it.

Signed-off-by: Stefano Babic <sbabic@denx.de>
Reviewed-by: Marek Vasut <marex@denx.de>
---

Changes since V1:
	- maintain list sorted
	- fix QA warning due to missing PACKAGECONFIG[gridnav]

 meta-oe/recipes-graphics/lvgl/lv-conf.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc b/meta-oe/recipes-=
graphics/lvgl/lv-conf.inc
index 8fd3412c0..918601553 100644
--- a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
+++ b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
@@ -2,6 +2,7 @@ PACKAGECONFIG ??=3D "drm"
=20
 PACKAGECONFIG[drm] =3D ",,libdrm"
 PACKAGECONFIG[fbdev] =3D ",,"
+PACKAGECONFIG[gridnav] =3D ",,"
 PACKAGECONFIG[sdl] =3D ",,virtual/libsdl2 libsdl2-image"
=20
 # Add libdrm include if drm is selected in PACKAGECONFIG
@@ -14,6 +15,7 @@ LVGL_CONFIG_USE_EVDEV =3D "${@bb.utils.contains_any('PA=
CKAGECONFIG', 'drm fbdev',
 LVGL_CONFIG_USE_FBDEV =3D "${@bb.utils.contains('PACKAGECONFIG', 'fbdev'=
, '1', '0', d)}"
=20
 LVGL_CONFIG_USE_SDL =3D "${@bb.utils.contains('PACKAGECONFIG', 'sdl', '1=
', '0', d)}"
+
 LVGL_CONFIG_SDL_FULLSCREEN ?=3D "0"
=20
 LVGL_CONFIG_LV_MEM_CUSTOM ?=3D "0"
@@ -26,6 +28,8 @@ LVGL_CONFIG_LV_LOG_PRINTF ?=3D "0"
=20
 LVGL_CONFIG_LV_USE_FONT_COMPRESSED ?=3D "0"
=20
+LVGL_CONFIG_LV_USE_GRIDNAV =3D "${@bb.utils.contains('PACKAGECONFIG', 'g=
ridnav', '1', '0', d)}"
+
 LVGL_CONFIG_LV_THEME_DEFAULT_DARK ?=3D "0"
=20
 DEBUG_BUILD ??=3D "0"
@@ -70,6 +74,7 @@ do_configure:append() {
         -e "s|^([[:space:]]*#define LV_LOG_PRINTF[[:space:]]).*|\1${LVGL=
_CONFIG_LV_LOG_PRINTF}|" \
         \
         -e "s|^([[:space:]]*#define LV_USE_FONT_COMPRESSED[[:space:]]).*=
|\1${LVGL_CONFIG_LV_USE_FONT_COMPRESSED}|" \
+        -e "s|^([[:space:]]*#define LV_USE_GRIDNAV[[:space:]]).*|\1${LVG=
L_CONFIG_LV_USE_GRIDNAV}|" \
         -e "s|^([[:space:]]*#define LV_THEME_DEFAULT_DARK[[:space:]]).*|=
\1${LVGL_CONFIG_LV_THEME_DEFAULT_DARK}|" \
         \
         -i "${S}/lv_conf.h"
--=20
2.34.1


