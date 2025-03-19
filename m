Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 225A8C35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 19:11:39 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.2999.1742411490496252190
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 12:11:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout04.t-online.de (Postfix) with SMTP id 5F0F1FE5
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 20:11:28 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.32.245]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tuyp4-4Zitec0; Wed, 19 Mar 2025 20:11:26 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/2] gnome-bluetooth: update 46.1 -> 47.1
Date: Wed, 19 Mar 2025 20:12:10 +0100
Message-ID: <20250319191210.328548-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319191210.328548-1-f_l_k@t-online.de>
References: <20250319191210.328548-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1742411486-A9FEDB7D-E714FEB9/0/0 CLEAN NORMAL
X-TOI-MSGID: 5ed8c1f6-eefc-4a43-916b-b12dc4da4603
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 19:11:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116105

ver 47.1:
This version contains a fix for the devices page staying empty on load
in some circumstances, as well as translation updates.

ver 47.0:
This versions contains translation updates, a crash fix when cancelling p=
airing,
pairing support for the Kawai CA501 music keyboard, and a fix for a devic=
e
properties accessibility regression.

ver 47.rc:
This version makes the pairing dialogue adaptive, as well as updating
translations.

ver 47.beta:
This version contains translation updates and build fixes. It also ports
some widgets to use libadwaita's spinner instead of GTK's, simplifying
the code.

ver 47.alpha:
This version fixes the devices list when empty, improves the dialogue whe=
n
removing a device, and ports a number of widgets to their modern libadwai=
ta
equivalents.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-bluetooth_46.1.bb =3D> gnome-bluetooth_47.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-bluetooth/{gnome-bluetooth_46.1.bb=
 =3D> gnome-bluetooth_47.1.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_46.=
1.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_47.1.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_46.1=
.bb
rename to meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_47.1.b=
b
index 980ff36782..e363db309d 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_46.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_47.1.bb
@@ -25,7 +25,7 @@ inherit features_check gnomebase gtk-icon-cache gtk-doc=
 gobject-introspection
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
=20
-SRC_URI[archive.sha256sum] =3D "56c44a17034598e9607458afae1be75f3de5efdf=
0e62355f09ba58fc7bc312ac"
+SRC_URI[archive.sha256sum] =3D "03e3e7403a15108ffc1496210a1da5c2961b2834=
a5c07eccc7a3f493195daba3"
=20
 BT_PULSE_PACKS =3D " \
     pulseaudio-lib-bluez5-util \
--=20
2.48.1


