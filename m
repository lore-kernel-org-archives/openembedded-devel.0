Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D16C6FD1C
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 08:26:01 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.17602.1679732751462767666
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Mar 2023 01:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout12.t-online.de (Postfix) with SMTP id CECAD12258
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 09:25:49 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.174.49]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pfzDh-1JhRvF0; Sat, 25 Mar 2023 09:25:49 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH] gvfs: add more PACKAGECONFIGS
Date: Sat, 25 Mar 2023 09:25:39 +0100
Message-Id: <20230325082539.997827-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679732749-E7FFCC37-66DCA672/0/0 CLEAN NORMAL
X-TOI-MSGID: 77ad5146-ae6c-4bfd-b588-b9e6458468fd
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 08:26:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101745

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gvfs/gvfs_1.50.4.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.4.bb b/meta-gnome/re=
cipes-gnome/gvfs/gvfs_1.50.4.bb
index 22dcf0538..31eea47ba 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.4.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.4.bb
@@ -26,9 +26,6 @@ ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
 EXTRA_OEMESON =3D " \
     -Dbluray=3Dfalse \
-    -Dgoa=3Dfalse \
-    -Dgoogle=3Dfalse \
-    -Dnfs=3Dfalse \
 "
=20
 PACKAGES =3D+ "gvfsd-ftp gvfsd-sftp gvfsd-trash"
@@ -62,11 +59,15 @@ PACKAGECONFIG[admin] =3D "-Dadmin=3Dtrue, -Dadmin=3Df=
alse, libcap polkit"
 PACKAGECONFIG[afc] =3D "-Dafc=3Dtrue, -Dafc=3Dfalse, libimobiledevice li=
bplist"
 PACKAGECONFIG[archive] =3D "-Darchive=3Dtrue, -Darchive=3Dfalse, libarch=
ive"
 PACKAGECONFIG[dnssd] =3D "-Ddnssd=3Dtrue, -Ddnssd=3Dfalse, avahi"
-PACKAGECONFIG[gcr] =3D "-Dgcr=3Dtrue, -Dgcr=3Dfalse, gcr3"
+PACKAGECONFIG[gcr] =3D "-Dgcr=3Dtrue, -Dgcr=3Dfalse, gcr3, gnome-keyring=
"
+PACKAGECONFIG[gcrypt] =3D "-Dgcrypt=3Dtrue, -Dgcrypt=3Dfalse, libgcrypt"
+PACKAGECONFIG[goa] =3D "-Dgoa=3Dtrue, -Dgoa=3Dfalse, gnome-online-accoun=
ts"
+PACKAGECONFIG[google] =3D "-Dgoogle=3Dtrue, -Dgoogle=3Dfalse, libgdata"
 PACKAGECONFIG[http] =3D "-Dhttp=3Dtrue, -Dhttp=3Dfalse, libsoup-3.0"
 PACKAGECONFIG[libmtp] =3D "-Dmtp=3Dtrue, -Dmtp=3Dfalse, libmtp"
 PACKAGECONFIG[logind] =3D "-Dlogind=3Dtrue, -Dlogind=3Dfalse, systemd"
 PACKAGECONFIG[libgphoto2] =3D "-Dgphoto2=3Dtrue, -Dgphoto2=3Dfalse, libg=
photo2"
+PACKAGECONFIG[nfs] =3D "-Dnfs=3Dtrue, -Dnfs=3Dfalse,libnfs"
 PACKAGECONFIG[samba] =3D "-Dsmb=3Dtrue, -Dsmb=3Dfalse, samba"
 PACKAGECONFIG[systemd] =3D "-Dsystemduserunitdir=3D${systemd_user_unitdi=
r} -Dtmpfilesdir=3D${libdir}/tmpfiles.d, -Dsystemduserunitdir=3Dno -Dtmpf=
ilesdir=3Dno, systemd"
=20
--=20
2.34.1


