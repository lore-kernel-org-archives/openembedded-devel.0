Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E36C25B78
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 10:25:21 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.18721.1716891914429597891
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 May 2024 03:25:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout11.t-online.de (Postfix) with SMTP id 2EB96F15F
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 12:25:05 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.40.240]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sBu0u-1bCWuX0; Tue, 28 May 2024 12:25:05 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/2] gnome-software: update 46.1 -> 46.2
Date: Tue, 28 May 2024 12:25:42 +0200
Message-ID: <20240528102543.2444748-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1716891905-473ED322-933BF718/0/0 CLEAN NORMAL
X-TOI-MSGID: ade8e1dc-9b15-41c2-a445-52f4015222a5
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:25:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110586

Version 46.2
~~~~~~~~~~~~
Released: 2024-05-24

This is a stable release with the following changes:
 * Fix a crash when no appstream data is found
 * Correct app safety calculation
 * Correct Flatpak system and user apps recognition
 * Slightly speed-up rpm-ostree metadata refresh

This release also updates translations:
 * Kabyle (Rachida SACI)
 * Portuguese (Hugo Carvalho)
 * Spanish (Daniel Mustieles)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-software_46.1.bb =3D> gnome-software_46.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-software/{gnome-software_46.1.bb =3D=
> gnome-software_46.2.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/gnome-software/gnome-software_46.1.=
bb b/meta-gnome/recipes-gnome/gnome-software/gnome-software_46.2.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/gnome-software/gnome-software_46.1.b=
b
rename to meta-gnome/recipes-gnome/gnome-software/gnome-software_46.2.bb
index 2327a6640..244941786 100644
--- a/meta-gnome/recipes-gnome/gnome-software/gnome-software_46.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-software/gnome-software_46.2.bb
@@ -28,7 +28,7 @@ RDEPENDS:${PN} =3D "iso-codes"
=20
 EXTRA_OEMESON +=3D "-Dtests=3Dfalse -Dsoup2=3Dfalse"
=20
-SRC_URI[archive.sha256sum] =3D "b6eeb789100de94b50ebe2e77f16b26be4c2db15=
489905f198d060c425e19076"
+SRC_URI[archive.sha256sum] =3D "e700cba287764f5e2255514e312e160550fdbf7a=
5d3fe16358bb6f7b6732b974"
=20
 PACKAGECONFIG ?=3D "flatpak"
 PACKAGECONFIG[flatpak] =3D "-Dflatpak=3Dtrue,-Dflatpak=3Dfalse,flatpak o=
stree"
--=20
2.45.1


