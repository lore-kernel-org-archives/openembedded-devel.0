Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27E56FCA170
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 18:17:59 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21601.1773080271157767520
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 11:17:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd95.mgt.mul.t-online.de (fwd95.aul.t-online.de [10.223.144.121])
	by mailout02.t-online.de (Postfix) with SMTP id DFBE5F34A
	for <openembedded-devel@lists.openembedded.org>; Mon,  9 Mar 2026 19:17:48 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.45.136]) by fwd95.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vzfAg-2USXFR0; Mon, 9 Mar 2026 19:17:38 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gvfs: update 1.58.1 -> 1.58.2
Date: Mon,  9 Mar 2026 19:17:28 +0100
Message-ID: <20260309181728.3087782-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1773080258-288FA520-622EB497/0/0 CLEAN NORMAL
X-TOI-MSGID: 0e55d37d-20cd-4d3c-a1cb-d6236f8a8587
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 18:17:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125001

- Make sftp optional
- inherit pkgconfig

This removes a default runtime recommendation on openssh

Major changes in 1.58.2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* client: Fix use-after-free when creating async proxy failed (Ondrej Hol=
y)
* daemon: Fix race on subscribers list when on thread (Ondrej Holy)
* ftp: Validate fe_size when parsing symlink target (Ondrej Holy)
* ftp: Check localtime() return value before use (Ondrej Holy)
* CVE-2026-28295: ftp: Use control connection address for PASV data (Ondr=
ej Holy)
* CVE-2026-28296: ftp: Reject paths containing CR/LF characters (Ondrej H=
oly)
* gphoto2: Use g_try_realloc() instead of g_realloc() (Ondrej Holy)
* cdda: Reject path traversal in mount URI host (Ondrej Holy)
* client: Fail when URI has invalid UTF-8 chars (Ondrej Holy)
* Some other fixes (correctmost, Ondrej Holy)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/gvfs/{gvfs_1.58.1.bb =3D> gvfs_1.58.2.bb}  | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.58.1.bb =3D> gvfs_1.58.2.bb=
} (93%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.58.1.bb b/meta-gnome/re=
cipes-gnome/gvfs/gvfs_1.58.2.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.58.1.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.58.2.bb
index 6dfed59d86..fe5cb1fcfe 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.58.1.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.58.2.bb
@@ -2,7 +2,7 @@ DESCRIPTION =3D "gvfs is a userspace virtual filesystem"
 LICENSE =3D "LGPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D05df38dd77c35ec8431f212410a33=
29e"
=20
-inherit gnomebase gsettings bash-completion gettext upstream-version-is-=
even features_check
+inherit gnomebase gsettings bash-completion gettext upstream-version-is-=
even features_check pkgconfig
=20
 DEPENDS +=3D "\
     dbus \
@@ -18,7 +18,7 @@ DEPENDS +=3D "\
 RDEPENDS:${PN} +=3D "gsettings-desktop-schemas"
=20
 SRC_URI =3D "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("=
${PV}")}/${BPN}-${PV}.tar.xz;name=3Darchive"
-SRC_URI[archive.sha256sum] =3D "fc537d6bbab1ffa76972df7d4a1819b0c0fe19eb=
d1dfe82421d1f32e14b5dc3b"
+SRC_URI[archive.sha256sum] =3D "ad9d5bf0b45caf232520df0adee51eb650200b03=
70680f80a350ead9d1d61ddf"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
@@ -44,8 +44,6 @@ FILES:gvfsd-ftp =3D "${libexecdir}/gvfsd-ftp ${datadir}=
/gvfs/mounts/ftp.mount"
 FILES:gvfsd-sftp =3D "${libexecdir}/gvfsd-sftp ${datadir}/gvfs/mounts/sf=
tp.mount"
 FILES:gvfsd-trash =3D "${libexecdir}/gvfsd-trash ${datadir}/gvfs/mounts/=
trash.mount"
=20
-RRECOMMENDS:gvfsd-ftp +=3D "openssh-sftp openssh-ssh"
-
 PACKAGECONFIG ?=3D "libgphoto2 \
                   ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
                   ${@bb.utils.contains('DISTRO_FEATURES','polkit','udisk=
s2','',d)} \
@@ -68,6 +66,7 @@ PACKAGECONFIG[libgphoto2] =3D "-Dgphoto2=3Dtrue, -Dgpho=
to2=3Dfalse, libgphoto2"
 PACKAGECONFIG[nfs] =3D "-Dnfs=3Dtrue, -Dnfs=3Dfalse,libnfs"
 PACKAGECONFIG[onedrive] =3D "-Donedrive=3Dtrue, -Donedrive=3Dfalse, msgr=
aph"
 PACKAGECONFIG[samba] =3D "-Dsmb=3Dtrue, -Dsmb=3Dfalse, samba"
+PACKAGECONFIG[sftp] =3D "-Dsftp=3Dtrue, -Dsftp=3Dfalse,,openssh-sftp ope=
nssh-ssh"
 PACKAGECONFIG[systemd] =3D "-Dsystemduserunitdir=3D${systemd_user_unitdi=
r} -Dtmpfilesdir=3D${libdir}/tmpfiles.d, -Dsystemduserunitdir=3Dno -Dtmpf=
ilesdir=3Dno, systemd"
=20
 # needs meta-filesystems
--=20
2.53.0


