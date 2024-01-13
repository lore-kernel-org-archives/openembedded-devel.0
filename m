Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40AC0C4707B
	for <webhook@archiver.kernel.org>; Sat, 13 Jan 2024 09:47:20 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.16041.1705139236825851582
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jan 2024 01:47:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout02.t-online.de (Postfix) with SMTP id 056D2F90E
	for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jan 2024 10:47:15 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.175.218]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rOabh-131n4z0; Sat, 13 Jan 2024 10:47:13 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gvfs: drop gnome-keyring rdepend
Date: Sat, 13 Jan 2024 10:47:09 +0100
Message-ID: <20240113094709.59365-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1705139233-34F1AC95-18F7B59A/0/0 CLEAN NORMAL
X-TOI-MSGID: 8a5e92a5-91fc-4aba-9c9a-c88d38ab2f7c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Jan 2024 09:47:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108263

gnome-keyring is nowadays integrated in gnome-shell. This will prevent fr=
om
getting it installed/running twice.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gvfs/gvfs_1.52.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.52.1.bb b/meta-gnome/re=
cipes-gnome/gvfs/gvfs_1.52.1.bb
index 627b499fe..7ac6c3ef2 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.52.1.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.52.1.bb
@@ -58,7 +58,7 @@ PACKAGECONFIG[admin] =3D "-Dadmin=3Dtrue, -Dadmin=3Dfal=
se, libcap polkit"
 PACKAGECONFIG[afc] =3D "-Dafc=3Dtrue, -Dafc=3Dfalse, libimobiledevice li=
bplist"
 PACKAGECONFIG[archive] =3D "-Darchive=3Dtrue, -Darchive=3Dfalse, libarch=
ive"
 PACKAGECONFIG[dnssd] =3D "-Ddnssd=3Dtrue, -Ddnssd=3Dfalse, avahi"
-PACKAGECONFIG[gcr] =3D "-Dgcr=3Dtrue, -Dgcr=3Dfalse, gcr3, gnome-keyring=
"
+PACKAGECONFIG[gcr] =3D "-Dgcr=3Dtrue, -Dgcr=3Dfalse, gcr3"
 PACKAGECONFIG[gcrypt] =3D "-Dgcrypt=3Dtrue, -Dgcrypt=3Dfalse, libgcrypt"
 PACKAGECONFIG[goa] =3D "-Dgoa=3Dtrue, -Dgoa=3Dfalse, gnome-online-accoun=
ts"
 PACKAGECONFIG[google] =3D "-Dgoogle=3Dtrue, -Dgoogle=3Dfalse, libgdata"
--=20
2.43.0


