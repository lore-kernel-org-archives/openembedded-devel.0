Return-Path: <sbabic@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6658C27C53
	for <webhook@archiver.kernel.org>; Sun, 16 Jun 2024 10:35:46 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.31355.1718534144355999991
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Jun 2024 03:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=JSytZ7kv;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: sbabic@denx.de)
Received: from paperino.fritz.box (unknown [IPv6:2001:a61:5210:b101:5ae6:8b1f:db3e:99cc])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: sbabic@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 3BD1387964;
	Sun, 16 Jun 2024 12:35:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1718534142;
	bh=RCmOIKRNvTlxffrPntMFIrX1q6FxJ2deSnlGqkeocKo=;
	h=From:To:Cc:Subject:Date:From;
	b=JSytZ7kvADNx2ciE3+OKDdmoEI+mOj2IOFetxb1KrIDoTTKIenUiLMVs5nFe+vtMI
	 xfcOCeA35vK/PcoukvV2/YcLaGuzFqOOr0KQtr1fO6y3ksqxdZ4vXhRqTIKXR9fb/7
	 29d/WevzQUIDJORJnfHCbZafQe1UpCcTp1vp/c8R9jL3YrnNVJH3WvLgeG2X4V6nRX
	 VDsRJYw9WyrFlOVjsBVfWwBfCH7MnZOQYpZS34eJ/zQkRy/VNJGl+l3gqUT8+alnbB
	 qvhAuYqOAgON6VO/jaX29Qp4hoc8uEFNiBNqMtf9AZjR2MhSeM0hvOYqK2vy9+McJU
	 HNpcIWx8nFltw==
From: sbabic@denx.de
To: openembedded-devel@lists.openembedded.org
Cc: Stefano Babic <sbabic@denx.de>
Subject: [PATCH] lvgl: add gridnav to packageconfig
Date: Sun, 16 Jun 2024 12:35:38 +0200
Message-Id: <20240616103538.19293-1-sbabic@denx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Jun 2024 10:35:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110915

From: Stefano Babic <sbabic@denx.de>

Some packages require to activate LVGL_CONFIG_LV_USE_GRIDNAV}, so let
configure it.

Signed-off-by: Stefano Babic <sbabic@denx.de>
---

 meta-oe/recipes-graphics/lvgl/lv-conf.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc b/meta-oe/recipes-=
graphics/lvgl/lv-conf.inc
index 8fd3412c0..c24df1b01 100644
--- a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
+++ b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
@@ -14,6 +14,9 @@ LVGL_CONFIG_USE_EVDEV =3D "${@bb.utils.contains_any('PA=
CKAGECONFIG', 'drm fbdev',
 LVGL_CONFIG_USE_FBDEV =3D "${@bb.utils.contains('PACKAGECONFIG', 'fbdev'=
, '1', '0', d)}"
=20
 LVGL_CONFIG_USE_SDL =3D "${@bb.utils.contains('PACKAGECONFIG', 'sdl', '1=
', '0', d)}"
+
+LVGL_CONFIG_LV_USE_GRIDNAV =3D "${@bb.utils.contains('PACKAGECONFIG', 'g=
ridnav', '1', '0', d)}"
+
 LVGL_CONFIG_SDL_FULLSCREEN ?=3D "0"
=20
 LVGL_CONFIG_LV_MEM_CUSTOM ?=3D "0"
@@ -71,6 +74,7 @@ do_configure:append() {
         \
         -e "s|^([[:space:]]*#define LV_USE_FONT_COMPRESSED[[:space:]]).*=
|\1${LVGL_CONFIG_LV_USE_FONT_COMPRESSED}|" \
         -e "s|^([[:space:]]*#define LV_THEME_DEFAULT_DARK[[:space:]]).*|=
\1${LVGL_CONFIG_LV_THEME_DEFAULT_DARK}|" \
+        -e "s|^([[:space:]]*#define LV_USE_GRIDNAV[[:space:]]).*|\1${LVG=
L_CONFIG_LV_USE_GRIDNAV}|" \
         \
         -i "${S}/lv_conf.h"
 }
--=20
2.34.1


