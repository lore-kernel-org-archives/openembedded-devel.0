Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4566CD11DB
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 08:41:26 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.5245.1711183282510481783
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Mar 2024 01:41:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout03.t-online.de (Postfix) with SMTP id 51ACE5AAC5
	for <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 09:41:18 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.167.162]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rnwwF-1MMRGn0; Sat, 23 Mar 2024 09:41:15 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 13/13] gvfs: update 1.52.2 -> 1.54.0
Date: Sat, 23 Mar 2024 09:41:38 +0100
Message-ID: <20240323084138.178281-13-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240323084138.178281-1-f_l_k@t-online.de>
References: <20240323084138.178281-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1711183275-0CA7E850-84759BC4/0/0 CLEAN NORMAL
X-TOI-MSGID: 2003063d-189e-490a-8069-d03d7b650c96
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 08:41:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109544

- add PACKAGECONFIG for onedrive

Major changes in 1.54.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* Translation updates (GNOME Translation Project contributors)

Major changes in 1.53.91
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* onedrive: Fix several issues (Jan-Michael Brummer)
* wsdd: List just devices of pub:Computer type to filter out unwanted dev=
ices (Ondrej Holy)
* Translation updates (GNOME Translation Project contributors)

Major changes in 1.53.90
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* daemon: Add OneDrive support based on msgraph library (Jan-Michael Brum=
mer)
* client: Reduce synchronous metadata methods calls to improve performanc=
e (Corey Berla)
* network: Provide standard::content-type and access::can-rename attribut=
es (Ant=C3=B3nio Fernandes)
* build: Fix unknown arguments error on systems that don't use GNU C libr=
ary (Ondrej Holy)
* udisks2: Fix unmounting of mount paths that contain non-ASCII character=
s (Ondrej Holy)
* Translation updates (GNOME Translation Project contributors)

Major changes in 1.53.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* daemon: Add WS-Discovery support based on wsdd daemon (Ondrej Holy)
* network: Hide Windows Network folder and show the servers merged by def=
ault (Ondrej Holy)
* network: Various other fixes and enhancements (Ondrej Holy)
* daemon: Port to gcr4 (Ondrej Holy)
* smb: Fix livelock when mounting share without enough permissions (Ondre=
j Holy)
* smb: Fix moving files across filesystem boundaries (Ondrej Holy)
* Translation updates (GNOME Translation Project contributors)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/gvfs/{gvfs_1.52.2.bb =3D> gvfs_1.54.0.bb}      | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.52.2.bb =3D> gvfs_1.54.0.bb=
} (95%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.52.2.bb b/meta-gnome/re=
cipes-gnome/gvfs/gvfs_1.54.0.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.52.2.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.54.0.bb
index 519cc0924..525f8fe7e 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.52.2.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.54.0.bb
@@ -19,7 +19,7 @@ RDEPENDS:${PN} +=3D "gsettings-desktop-schemas"
=20
 SRC_URI =3D "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("=
${PV}")}/${BPN}-${PV}.tar.xz;name=3Darchive"
=20
-SRC_URI[archive.sha256sum] =3D "a643aceaa053caac0d8eff9a015f636e4bd1bb09=
cfe27864e347db67460e7b91"
+SRC_URI[archive.sha256sum] =3D "f53d81df86c2e86cdd25182c2d8a669a22371e83=
623ded1b9d5416dcfc6de366"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
@@ -67,6 +67,7 @@ PACKAGECONFIG[libmtp] =3D "-Dmtp=3Dtrue, -Dmtp=3Dfalse,=
 libmtp"
 PACKAGECONFIG[logind] =3D "-Dlogind=3Dtrue, -Dlogind=3Dfalse, systemd"
 PACKAGECONFIG[libgphoto2] =3D "-Dgphoto2=3Dtrue, -Dgphoto2=3Dfalse, libg=
photo2"
 PACKAGECONFIG[nfs] =3D "-Dnfs=3Dtrue, -Dnfs=3Dfalse,libnfs"
+PACKAGECONFIG[onedrive] =3D "-Donedrive=3Dtrue, -Donedrive=3Dfalse, msgr=
aph"
 PACKAGECONFIG[samba] =3D "-Dsmb=3Dtrue, -Dsmb=3Dfalse, samba"
 PACKAGECONFIG[systemd] =3D "-Dsystemduserunitdir=3D${systemd_user_unitdi=
r} -Dtmpfilesdir=3D${libdir}/tmpfiles.d, -Dsystemduserunitdir=3Dno -Dtmpf=
ilesdir=3Dno, systemd"
=20
--=20
2.44.0


