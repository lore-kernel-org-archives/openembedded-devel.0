Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14481C77B7A
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 07:08:45 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.7780.1686640120087969551
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jun 2023 00:08:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout05.t-online.de (Postfix) with SMTP id 2E2A57310
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 09:08:38 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.41.153]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1q8y8r-0Mebon0; Tue, 13 Jun 2023 09:08:38 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH] gnome-software: upgrade 44.1 -> 44.2
Date: Tue, 13 Jun 2023 09:08:28 +0200
Message-Id: <20230613070828.16093-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1686640118-4E3BC3BC-9DC7F41C/0/0 CLEAN NORMAL
X-TOI-MSGID: ef5abb31-2d94-4f68-bc0d-8e038153218d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 07:08:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103261

Version 44.2
~~~~~~~~~~~~
Released: 2023-05-25

This is a stable release with the following changes:
 * Fix subsequent checking for updates if the first check after login fai=
ls
 * Fix checking for updates when automatic updates are disabled
 * Fix rare stall when many background jobs are running
 * Don=E2=80=99t download rpm-ostree updates when only checking if update=
s are available
 * Fix bug with listing flatpak addons when multiple flathub remotes are =
enabled
 * Fix duplicated sources in app details page when using an appstream URL
 * Reduce background resource consumption when idle

This release also updates translations:
 * Czech (Daniel Rusek)
 * Italian (Gianvito Cavasoli)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-software_44.1.bb =3D> gnome-software_44.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-software/{gnome-software_44.1.bb =3D=
> gnome-software_44.2.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/gnome-software/gnome-software_44.1.=
bb b/meta-gnome/recipes-gnome/gnome-software/gnome-software_44.2.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/gnome-software/gnome-software_44.1.b=
b
rename to meta-gnome/recipes-gnome/gnome-software/gnome-software_44.2.bb
index beec3de52..60aeecd18 100644
--- a/meta-gnome/recipes-gnome/gnome-software/gnome-software_44.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-software/gnome-software_44.2.bb
@@ -29,7 +29,7 @@ RDEPENDS:${PN} =3D "iso-codes"
=20
 EXTRA_OEMESON +=3D "-Dtests=3Dfalse -Dsoup2=3Dfalse"
=20
-SRC_URI[archive.sha256sum] =3D "9dc6551512cf0a26d03e0d79f494870a6916d43c=
14d82199c43a11d9cc0ad5aa"
+SRC_URI[archive.sha256sum] =3D "c02dce70e52b37cd29c037650b372adb19b27d20=
fe44bc0921d81a959d35616c"
=20
 PACKAGECONFIG ?=3D "flatpak"
 PACKAGECONFIG[flatpak] =3D "-Dflatpak=3Dtrue,-Dflatpak=3Dfalse,flatpak o=
stree"
--=20
2.34.1


