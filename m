Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA4ECD1281
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 08:41:27 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.5316.1711183282141395568
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Mar 2024 01:41:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout03.t-online.de (Postfix) with SMTP id 47CB0452ED
	for <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 09:41:18 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.167.162]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rnwwE-1MMRGh0; Sat, 23 Mar 2024 09:41:14 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 07/13] gnome-bluetooth: update 42.8 -> 46.0
Date: Sat, 23 Mar 2024 09:41:32 +0100
Message-ID: <20240323084138.178281-7-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240323084138.178281-1-f_l_k@t-online.de>
References: <20240323084138.178281-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1711183274-0CA7E850-FCF27F19/0/0 CLEAN NORMAL
X-TOI-MSGID: 623596c1-858b-4c27-be36-c09c73a28176
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 08:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109539

ver 46.0:
This version contains translation updates.

ver 46.beta:
This version modernises the look of the properties dialogue. It also incl=
udes
all the fixes available in version 42.8.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-bluetooth_42.8.bb =3D> gnome-bluetooth_46.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-bluetooth/{gnome-bluetooth_42.8.bb=
 =3D> gnome-bluetooth_46.0.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.=
8.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_46.0.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.8=
.bb
rename to meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_46.0.b=
b
index 6d4d84e1e..1b29e52c7 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.8.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_46.0.bb
@@ -25,7 +25,7 @@ inherit features_check gnomebase gtk-icon-cache gtk-doc=
 gobject-introspection
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
=20
-SRC_URI[archive.sha256sum] =3D "76c241e8ca2c9b1035364535ca26084f89fc5c0e=
1829510f8909583115fcc2db"
+SRC_URI[archive.sha256sum] =3D "13fe1e75f317acdbdf5e80c9029d2e0632d60a9c=
cf72a43ae36eb7545021fbef"
=20
 BT_PULSE_PACKS =3D " \
     pulseaudio-lib-bluez5-util \
--=20
2.44.0


