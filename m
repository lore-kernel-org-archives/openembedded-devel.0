Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73D09EB64DC
	for <webhook@archiver.kernel.org>; Sun, 25 Jun 2023 13:49:25 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.11739.1687700960598488438
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jun 2023 06:49:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=zYmGd/ct;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 0DBA2861AA;
	Sun, 25 Jun 2023 15:49:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1687700958;
	bh=IAkBsbbVQN0tCwcswF1hdqNYm4TjXGKsLtr1fchmOzE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=zYmGd/ct/2L4yDzHb4ihWzo8syWDMt+V8fErX9H712fC42IK6U7/6vnsB3b2ObsGc
	 LyDkGF6pE/q0On/v7Jo69pDukoeDXJt6BEfWrO4E4OuhC7nsakIPqQkyFOCSKNP1wZ
	 pEiKlio/q0fhZNqn6hnvJxI8eZCyYEPk1FgymymQJbPm4Box1S8Xs3oLRo0nMh7zWz
	 DswdSeyoBvURXDnREylziBFoDKMh3G/fcb2kLPRckBiz00NGadz8ubeeggx2rusu75
	 2AMS74rBABKMOKAyOHyZ6QCz2A74R+FiReFEyXlh8CsL9NOlgUFFcEXtDg0AXOlOr3
	 Ww8enZNes3Zog==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Fabio Estevam <festevam@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] lvgl: Add default input device configuration option
Date: Sun, 25 Jun 2023 15:49:02 +0200
Message-Id: <20230625134902.104109-2-marex@denx.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230625134902.104109-1-marex@denx.de>
References: <20230625134902.104109-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Jun 2023 13:49:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103563

Add the ability to override default touch input device hard-coded into LV=
GL.
The current default in the code is "/dev/input/event10" for whatever reas=
on,
let user override this. Pick "/dev/input/touchscreen" as the OE default, =
as
that is more likely to be present on embedded hardware.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Fabio Estevam <festevam@denx.de>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-graphics/lvgl/lv-drivers.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/lvgl/lv-drivers.inc b/meta-oe/recip=
es-graphics/lvgl/lv-drivers.inc
index 284d8421b..dcf1ad14b 100644
--- a/meta-oe/recipes-graphics/lvgl/lv-drivers.inc
+++ b/meta-oe/recipes-graphics/lvgl/lv-drivers.inc
@@ -7,6 +7,7 @@ LVGL_CONFIG_USE_DRM =3D "${@bb.utils.contains('PACKAGECON=
FIG', 'drm', '1', '0', d)
 LVGL_CONFIG_DRM_CARD ?=3D "/dev/dri/card0"
=20
 LVGL_CONFIG_USE_EVDEV =3D "${@bb.utils.contains_any('PACKAGECONFIG', 'dr=
m fbdev', '1', '0', d)}"
+LVGL_CONFIG_EVDEV_INPUT ?=3D "/dev/input/touchscreen"
=20
 LVGL_CONFIG_USE_FBDEV =3D "${@bb.utils.contains('PACKAGECONFIG', 'fbdev'=
, '1', '0', d)}"
=20
@@ -29,6 +30,7 @@ do_configure:append() {
         -e "s|\(^#  define DRM_CARD \).*|#  define DRM_CARD \"${LVGL_CON=
FIG_DRM_CARD}\"|g" \
 	\
         -e "s|\(^#  define USE_EVDEV \).*|#  define USE_EVDEV ${LVGL_CON=
FIG_USE_EVDEV}|g" \
+        -e "s|\(^#  define EVDEV_NAME \).*|#  define EVDEV_NAME \"${LVGL=
_CONFIG_EVDEV_INPUT}\"|g" \
         \
         -e "s|\(^#  define USE_FBDEV \).*|#  define USE_FBDEV ${LVGL_CON=
FIG_USE_FBDEV}|g" \
         \
--=20
2.40.1


