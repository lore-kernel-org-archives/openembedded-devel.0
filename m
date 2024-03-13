Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53AAFC54E67
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 04:51:28 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.9067.1710305478790929358
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Mar 2024 21:51:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=yJN82/y7;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 10E5987DCC;
	Wed, 13 Mar 2024 05:51:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710305477;
	bh=ISA9+3RLiVeCbhAFaMKjKtBLMA24ZujH7loMBmoTlNA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=yJN82/y7Zb5ImoSovsUnZRbYeNznafEwj8V7MbU4OPLUsmIokewbowveNk8mfVBCw
	 f9a3FwgGS/PBfiWwShQ1IUCpEyGVm2efjK6jUNxWSeLvQV6+TetRyrU8WfCRovG44v
	 ZFXSDNpVRoCk3XRI9vmlasPabVLtZDddKvgNjBlzm2PHFsP7M8tKE0OR6EYYjR6e8p
	 YRbKaLgYxprf6ln+8zq2VWyep8OjUFppLP+tV2ZNVCKA5Hqx/5wEVuEdN9PdETGZ0l
	 dJMTIe5LfevSKgGlT1uN82lexfnnESaXL4N/V9nTRUP38rZ1WRvXzJOweqvuHXotNG
	 3HIpFHKrubKpw==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Fabio Estevam <festevam@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 4/8] lvgl: Add SDL2 fullscreen mode configuration option
Date: Wed, 13 Mar 2024 05:40:07 +0100
Message-ID: <20240313045038.90500-5-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240313045038.90500-1-marex@denx.de>
References: <20240313045038.90500-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Mar 2024 04:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109284

Expose SDL2 fullscreen mode as configuration option. The default
is disabled, which matches the SDL2 backend configuration in LVGL.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Fabio Estevam <festevam@denx.de>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-graphics/lvgl/lv-conf.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc b/meta-oe/recipes-=
graphics/lvgl/lv-conf.inc
index 97063adbc..85c08b0d5 100644
--- a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
+++ b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
@@ -9,6 +9,7 @@ LVGL_CONFIG_USE_EVDEV =3D "${@bb.utils.contains_any('PACK=
AGECONFIG', 'drm fbdev',
 LVGL_CONFIG_USE_FBDEV =3D "${@bb.utils.contains('PACKAGECONFIG', 'fbdev'=
, '1', '0', d)}"
=20
 LVGL_CONFIG_USE_SDL =3D "${@bb.utils.contains('PACKAGECONFIG', 'sdl', '1=
', '0', d)}"
+LVGL_CONFIG_SDL_FULLSCREEN ?=3D "0"
=20
 LVGL_CONFIG_LV_MEM_CUSTOM ?=3D "0"
 LVGL_CONFIG_LV_COLOR_DEPTH ?=3D "32"
@@ -30,6 +31,7 @@ do_configure:append() {
         -e "s|\(^#define LV_USE_SDL \).*|#define LV_USE_SDL ${LVGL_CONFI=
G_USE_SDL}|g" \
         -e "s|\(^#define LV_USE_DRAW_SDL \).*|#define LV_USE_DRAW_SDL ${=
LVGL_CONFIG_USE_SDL}|g" \
         -e "s|\(^    #define LV_SDL_BUF_COUNT \).*|    #define LV_SDL_BU=
F_COUNT 2|g" \
+        -e "s|\(^    #define LV_SDL_FULLSCREEN \).*|    #define LV_SDL_F=
ULLSCREEN ${LVGL_CONFIG_SDL_FULLSCREEN}|g" \
         \
         -e "s|\(^#define LV_COLOR_DEPTH \).*|#define LV_COLOR_DEPTH ${LV=
GL_CONFIG_LV_COLOR_DEPTH}|g" \
         -e "s|\(#define LV_MEM_CUSTOM .*\)0|\1${LVGL_CONFIG_LV_MEM_CUSTO=
M}|g" \
--=20
2.43.0


