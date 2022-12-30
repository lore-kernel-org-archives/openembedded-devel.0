Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D85DC10F1B
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 10:59:02 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.15997.1672397939615019590
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Dec 2022 02:58:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout11.t-online.de (Postfix) with SMTP id A5EC9D752
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Dec 2022 11:58:57 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.234.94]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pBD6F-4cGBd70; Fri, 30 Dec 2022 11:58:55 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 5/5] gnome-bluetooth: update 42.4 -> 42.5
Date: Fri, 30 Dec 2022 11:58:44 +0100
Message-Id: <20221230105844.428064-5-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230105844.428064-1-f_l_k@t-online.de>
References: <20221230105844.428064-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672397935-3AFEA81E-8FD4AB4E/0/0 CLEAN NORMAL
X-TOI-MSGID: 12451502-cae9-43de-b0a8-7e962da8dd79
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Dec 2022 10:59:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100306

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-bluetooth_42.4.bb =3D> gnome-bluetooth_42.5.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-bluetooth/{gnome-bluetooth_42.4.bb=
 =3D> gnome-bluetooth_42.5.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.=
4.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.5.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.4=
.bb
rename to meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.5.b=
b
index 1c3180f9d..fa4f9cb78 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.4.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.5.bb
@@ -26,7 +26,7 @@ inherit features_check gnomebase gtk-icon-cache gtk-doc=
 gobject-introspection
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
=20
-SRC_URI[archive.sha256sum] =3D "1d6fcf1cdb6cc9923ab334a2c0bc37a2c1bba9d1=
8de153d484eedc04f3c0bcdc"
+SRC_URI[archive.sha256sum] =3D "a4f5f1ac2dbb7b7b92f7d6d2b42c030f62aed9b5=
426b9dc116946041f3cba8f7"
=20
 BT_PULSE_PACKS =3D " \
     pulseaudio-lib-bluez5-util \
--=20
2.34.1


