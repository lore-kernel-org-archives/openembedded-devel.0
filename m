Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0ED9D10C13
	for <webhook@archiver.kernel.org>; Sun, 27 Oct 2024 07:20:51 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.25584.1730013648912236443
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Oct 2024 00:20:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout08.t-online.de (Postfix) with SMTP id 37322545E
	for <openembedded-devel@lists.openembedded.org>; Sun, 27 Oct 2024 08:20:42 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.173.215]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1t4xZo-2ieknl0; Sun, 27 Oct 2024 08:20:40 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 5/5] gnome-software: update 47.0 -> 47.1
Date: Sun, 27 Oct 2024 08:22:42 +0100
Message-ID: <20241027072242.381222-5-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241027072242.381222-1-f_l_k@t-online.de>
References: <20241027072242.381222-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1730013640-CAFFB40D-8D1B1E70/0/0 CLEAN NORMAL
X-TOI-MSGID: 24a3db1a-0f5c-4253-bbfa-6090d3da635b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Oct 2024 07:20:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113240

Version 47.1
~~~~~~~~~~~~
Released: 2024-10-10

This is a stable release with the following changes:
 * Fix crash in snap plugin when launching apps
 * Fix display of versions for packages being installed as part of an upd=
ate
 * Various minor improvements to the review submission dialog
 * Fix a crash in the DKMS plugin

This release also updates translations:
 * Catalan (Jordi Mas i Hernandez, Jordi Mas)
 * French (Guillaume Bernard)
 * Indonesian (Andika Triwidada)
 * Russian (Artur S0)
 * Slovak (Jose Riha)
 * Thai (Aefgh Threenine)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-software_47.0.bb =3D> gnome-software_47.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-software/{gnome-software_47.0.bb =3D=
> gnome-software_47.1.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/gnome-software/gnome-software_47.0.=
bb b/meta-gnome/recipes-gnome/gnome-software/gnome-software_47.1.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/gnome-software/gnome-software_47.0.b=
b
rename to meta-gnome/recipes-gnome/gnome-software/gnome-software_47.1.bb
index 4ed8ee396..a18d6db66 100644
--- a/meta-gnome/recipes-gnome/gnome-software/gnome-software_47.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-software/gnome-software_47.1.bb
@@ -28,7 +28,7 @@ RDEPENDS:${PN} =3D "iso-codes"
=20
 EXTRA_OEMESON +=3D "-Dtests=3Dfalse -Dsoup2=3Dfalse"
=20
-SRC_URI[archive.sha256sum] =3D "4f3e9b30f2d4885198329e46076e5ed9b5bd7e09=
9062ae627377ad8d9b9556ef"
+SRC_URI[archive.sha256sum] =3D "93ca500366316745594ef05fcad1c05cf43f02ef=
8f66080c17f7ebb8ca3f34bf"
=20
 PACKAGECONFIG ?=3D "flatpak"
 PACKAGECONFIG[flatpak] =3D "-Dflatpak=3Dtrue,-Dflatpak=3Dfalse,flatpak o=
stree"
--=20
2.47.0


