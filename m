Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A229AC4332F
	for <webhook@archiver.kernel.org>; Sat, 10 Dec 2022 09:28:31 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.11511.1670664505246133128
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Dec 2022 01:28:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout09.t-online.de (Postfix) with SMTP id 249992295C
	for <openembedded-devel@lists.openembedded.org>; Sat, 10 Dec 2022 10:28:22 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.225.165]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p3w9c-3AIRaj0; Sat, 10 Dec 2022 10:28:20 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH] gvfs: fix dependencies
Date: Sat, 10 Dec 2022 10:28:10 +0100
Message-Id: <20221210092810.132510-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670664500-E30B0E65-73098E3D/0/0 CLEAN NORMAL
X-TOI-MSGID: ec4fb4f5-0722-4959-9e39-6dac71f0e82c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Dec 2022 09:28:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100025

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb b/meta-gnome/re=
cipes-gnome/gvfs/gvfs_1.50.2.bb
index 0e7293734..5bad2153c 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb
@@ -12,6 +12,7 @@ DEPENDS +=3D "\
     gsettings-desktop-schemas \
     libgudev \
     libsecret \
+    libxml2 \
     shadow-native \
 "
=20
@@ -61,8 +62,8 @@ PACKAGECONFIG[admin] =3D "-Dadmin=3Dtrue, -Dadmin=3Dfal=
se, libcap polkit"
 PACKAGECONFIG[afc] =3D "-Dafc=3Dtrue, -Dafc=3Dfalse, libimobiledevice li=
bplist"
 PACKAGECONFIG[archive] =3D "-Darchive=3Dtrue, -Darchive=3Dfalse, libarch=
ive"
 PACKAGECONFIG[dnssd] =3D "-Ddnssd=3Dtrue, -Ddnssd=3Dfalse, avahi"
-PACKAGECONFIG[gcr] =3D "-Dgcr=3Dtrue, -Dgcr=3Dfalse, gcr"
-PACKAGECONFIG[http] =3D "-Dhttp=3Dtrue, -Dhttp=3Dfalse, libsoup-2.4"
+PACKAGECONFIG[gcr] =3D "-Dgcr=3Dtrue, -Dgcr=3Dfalse, gcr3"
+PACKAGECONFIG[http] =3D "-Dhttp=3Dtrue, -Dhttp=3Dfalse, libsoup-3.0"
 PACKAGECONFIG[libmtp] =3D "-Dmtp=3Dtrue, -Dmtp=3Dfalse, libmtp"
 PACKAGECONFIG[logind] =3D "-Dlogind=3Dtrue, -Dlogind=3Dfalse, systemd"
 PACKAGECONFIG[libgphoto2] =3D "-Dgphoto2=3Dtrue, -Dgphoto2=3Dfalse, libg=
photo2"
--=20
2.34.1


