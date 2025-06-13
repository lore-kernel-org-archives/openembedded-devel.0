Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7BC8C61DB2
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 07:00:48 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.4094.1749798038484641931
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Jun 2025 00:00:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout04.t-online.de (Postfix) with SMTP id 7D64CF49A
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Jun 2025 09:00:36 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.173.204]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uPyOx-33Pfgf0; Fri, 13 Jun 2025 09:00:35 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-software: update 48.0 -> 48.2
Date: Fri, 13 Jun 2025 09:00:24 +0200
Message-ID: <20250613070024.969569-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1749798035-D17F8571-CD815FC6/0/0 CLEAN NORMAL
X-TOI-MSGID: 75d332a0-cccd-46d0-8d32-b4b509cf4c76
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Jun 2025 07:00:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117909

Version 48.2
~~~~~~~~~~~~
Released: 2025-06-02

This is a stable release with the following changes:
 * Improve memory fragmentation after checking for updates

This release also updates translations:
 * Czech (Daniel Rusek)
 * French (Vincent Chatelain)
 * Hindi (Scrambled 777)
 * Japanese (Takayuki Kusano)
 * Latvian (R=C5=ABdolfs Mazurs)
 * Swedish (Anders Jonsson)

Version 48.1
~~~~~~~~~~~~
Released: 2025-04-10

This is a stable release with the following changes:
 * Improve contrast of some app safety ratings in dark mode
 * Improve error handling when fetching app reviews

This release also updates translations:
 * English (United Kingdom) (Andi Chandler)
 * German (Philipp Kiemle, Martin Wagner)
 * Kabyle (Athmane MOKRAOUI)
 * Nepali (Pawan Chitrakar)
 * Panjabi (A S Alam)
 * Ukrainian (Yuri Chornoivan)
 * Uzbek (Baxrom Raxmatov)
 * Vietnamese (Cas Pascal)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-software_48.0.bb =3D> gnome-software_48.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-software/{gnome-software_48.0.bb =3D=
> gnome-software_48.2.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/gnome-software/gnome-software_48.0.=
bb b/meta-gnome/recipes-gnome/gnome-software/gnome-software_48.2.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/gnome-software/gnome-software_48.0.b=
b
rename to meta-gnome/recipes-gnome/gnome-software/gnome-software_48.2.bb
index 8dae95dddb..00efac5b4f 100644
--- a/meta-gnome/recipes-gnome/gnome-software/gnome-software_48.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-software/gnome-software_48.2.bb
@@ -28,7 +28,7 @@ RDEPENDS:${PN} =3D "iso-codes"
=20
 EXTRA_OEMESON +=3D "-Dtests=3Dfalse"
=20
-SRC_URI[archive.sha256sum] =3D "e607af554e838fd6d07c1631f634b20e8bd4e6ad=
f16fc7535c4520874af544f7"
+SRC_URI[archive.sha256sum] =3D "abfd30643a86c65f4886b6765eb3bb6215c9ea09=
817d6bd165c50056890822c9"
=20
 PACKAGECONFIG ?=3D "flatpak"
 PACKAGECONFIG[flatpak] =3D "-Dflatpak=3Dtrue,-Dflatpak=3Dfalse,flatpak o=
stree"
--=20
2.49.0


