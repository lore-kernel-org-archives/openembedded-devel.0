Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C33ACC25B4F
	for <webhook@archiver.kernel.org>; Fri, 10 May 2024 06:51:41 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.6809.1715323889379250941
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 May 2024 23:51:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout12.t-online.de (Postfix) with SMTP id 5EB91EC94
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 May 2024 08:51:27 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.232.205]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1s5K6I-0ilffd0; Fri, 10 May 2024 08:51:26 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-software: update 46.0 -> 46.1
Date: Fri, 10 May 2024 08:51:49 +0200
Message-ID: <20240510065149.1800819-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1715323886-617F83C7-7E5C6F14/0/0 CLEAN NORMAL
X-TOI-MSGID: def2b82e-975b-45a1-a08c-126a96e2d72e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 May 2024 06:51:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110308

Version 46.1
~~~~~~~~~~~~
Released: 2024-04-25

This is a stable release with the following changes:
 * Fix a crash when updating apps when built with Mogwai
 * Fix a crash when installing flatpak application
 * Correct desktop/mobile hardware support detection
 * Correct state of Fedora upgrade
 * Several fixes in historical updates for rpm-ostree

This release also updates translations:
 * Catalan (Jordi Mas i Hernandez)
 * Czech (Daniel Rusek)
 * Dutch (Nathan Follens)
 * Friulian (Fabio Tomat)
 * Hindi (Guntupalli Karunakar)
 * Kabyle (Athmane MOKRAOUI)
 * Panjabi (A S Alam)
 * Russian (Artur S0)
 * Serbian (=D0=9C=D0=B8=D0=BB=D0=BE=D1=88 =D0=9F=D0=BE=D0=BF=D0=BE=D0=B2=
=D0=B8=D1=9B)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-software_46.0.bb =3D> gnome-software_46.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-software/{gnome-software_46.0.bb =3D=
> gnome-software_46.1.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/gnome-software/gnome-software_46.0.=
bb b/meta-gnome/recipes-gnome/gnome-software/gnome-software_46.1.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/gnome-software/gnome-software_46.0.b=
b
rename to meta-gnome/recipes-gnome/gnome-software/gnome-software_46.1.bb
index 40a7141fc..2327a6640 100644
--- a/meta-gnome/recipes-gnome/gnome-software/gnome-software_46.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-software/gnome-software_46.1.bb
@@ -28,7 +28,7 @@ RDEPENDS:${PN} =3D "iso-codes"
=20
 EXTRA_OEMESON +=3D "-Dtests=3Dfalse -Dsoup2=3Dfalse"
=20
-SRC_URI[archive.sha256sum] =3D "11893002bbb54082896683707bc3991ae55a2f30=
40811a760e3a92c96544f86e"
+SRC_URI[archive.sha256sum] =3D "b6eeb789100de94b50ebe2e77f16b26be4c2db15=
489905f198d060c425e19076"
=20
 PACKAGECONFIG ?=3D "flatpak"
 PACKAGECONFIG[flatpak] =3D "-Dflatpak=3Dtrue,-Dflatpak=3Dfalse,flatpak o=
stree"
--=20
2.44.0


