Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE933C83F1A
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 16:58:04 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.18942.1753203476000780818
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Jul 2025 09:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout06.t-online.de (Postfix) with SMTP id 376D21C75A
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 18:57:53 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.37.113]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ueGJL-0cmRe50; Tue, 22 Jul 2025 18:57:51 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-software: update 48.2 -> 48.3
Date: Tue, 22 Jul 2025 18:57:46 +0200
Message-ID: <20250722165746.183396-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1753203471-9AFEE78B-5A66FE2E/0/0 CLEAN NORMAL
X-TOI-MSGID: b092836c-8ba0-4e87-a2b4-5619dae2f475
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 16:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118697

Version 48.3
~~~~~~~~~~~~
Released: 2025-06-27

This is a stable release with the following change:
 * Fix crash on application shutdown

This release also updates translation:
 * Chinese (Taiwan) (Cheng-Chia Tseng)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-software_48.2.bb =3D> gnome-software_48.3.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-software/{gnome-software_48.2.bb =3D=
> gnome-software_48.3.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/gnome-software/gnome-software_48.2.=
bb b/meta-gnome/recipes-gnome/gnome-software/gnome-software_48.3.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/gnome-software/gnome-software_48.2.b=
b
rename to meta-gnome/recipes-gnome/gnome-software/gnome-software_48.3.bb
index 00efac5b4f..beca1e76a0 100644
--- a/meta-gnome/recipes-gnome/gnome-software/gnome-software_48.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-software/gnome-software_48.3.bb
@@ -28,7 +28,7 @@ RDEPENDS:${PN} =3D "iso-codes"
=20
 EXTRA_OEMESON +=3D "-Dtests=3Dfalse"
=20
-SRC_URI[archive.sha256sum] =3D "abfd30643a86c65f4886b6765eb3bb6215c9ea09=
817d6bd165c50056890822c9"
+SRC_URI[archive.sha256sum] =3D "126971e8bc000ddc200178c8fac8f7114eed42de=
4a4e2012ba06b3ffe707e23a"
=20
 PACKAGECONFIG ?=3D "flatpak"
 PACKAGECONFIG[flatpak] =3D "-Dflatpak=3Dtrue,-Dflatpak=3Dfalse,flatpak o=
stree"
--=20
2.50.1


