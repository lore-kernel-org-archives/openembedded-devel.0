Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57F27C25B6B
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 09:09:55 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.195840.1698311387607236254
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Oct 2023 02:09:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout02.t-online.de (Postfix) with SMTP id 9769F8573
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 11:09:44 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.32.112]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qvwN5-3EEu4P0; Thu, 26 Oct 2023 11:09:43 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/3] gnome-software: Update 45.0 -> 45.1
Date: Thu, 26 Oct 2023 11:09:57 +0200
Message-ID: <20231026090959.764445-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1698311383-3EFFAEA2-D4C0B318/0/0 CLEAN NORMAL
X-TOI-MSGID: 99983807-47b4-41f5-8dbc-47f3f672e759
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 09:09:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105733

Released: 2023-10-20
This is a stable release with the following changes:

Various styling fixes
Report PackageKit GPG-related errors in the GUI
Flatpak permission checks improvements
Optimize loading of the details page

This release also updates translations:

Catalan (Jordi Mas)
Chinese (Taiwan) (Cheng-Chia Tseng)
English (United Kingdom) (Bruce Cowan)
Esperanto (Kristjan SCHMIDT)
French (Ir=C3=A9n=C3=A9e THIRION)
Friulian (Fabio Tomat)
Romanian (Florentina Mu=C8=99at)
Turkish (Sabri =C3=9Cnal)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-software_45.0.bb =3D> gnome-software_45.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-software/{gnome-software_45.0.bb =3D=
> gnome-software_45.1.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/gnome-software/gnome-software_45.0.=
bb b/meta-gnome/recipes-gnome/gnome-software/gnome-software_45.1.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/gnome-software/gnome-software_45.0.b=
b
rename to meta-gnome/recipes-gnome/gnome-software/gnome-software_45.1.bb
index 89a6f05f4..d5ed29c8a 100644
--- a/meta-gnome/recipes-gnome/gnome-software/gnome-software_45.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-software/gnome-software_45.1.bb
@@ -29,7 +29,7 @@ RDEPENDS:${PN} =3D "iso-codes"
=20
 EXTRA_OEMESON +=3D "-Dtests=3Dfalse -Dsoup2=3Dfalse"
=20
-SRC_URI[archive.sha256sum] =3D "61f42c2fd4d19b894a2484f691369032dc8b2a32=
a014ce6ca4d02c4fa4f75a14"
+SRC_URI[archive.sha256sum] =3D "d72485f7a6e0917f64edbedd68fd7b57246c6ebf=
10c5a45108b63946635778a2"
=20
 PACKAGECONFIG ?=3D "flatpak"
 PACKAGECONFIG[flatpak] =3D "-Dflatpak=3Dtrue,-Dflatpak=3Dfalse,flatpak o=
stree"
--=20
2.42.0


