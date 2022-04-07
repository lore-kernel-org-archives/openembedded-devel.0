Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E58C35294
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 15:41:14 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web08.4485.1649322263305595136
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Apr 2022 02:04:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84,
 mailfrom: f_l_k@t-online.de)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout09.t-online.de (Postfix) with SMTP id 3123810F50
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Apr 2022 11:04:03 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.46.130]) by fwd89.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1ncO3e-0LCPmD0; Thu, 7 Apr 2022 11:04:02 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCHv2] gparted: update to v1.4.0
Date: Thu,  7 Apr 2022 11:03:53 +0200
Message-Id: <20220407090354.4040-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1649322242-0000F5B3-69DECA7F/0/0 CLEAN NORMAL
X-TOI-MSGID: d26d7b50-660b-491d-868c-dcfc2321d7ac
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Apr 2022 15:41:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96449

- remove x11 features-check because there aren't dependencies that would
  explicilty require x11 as a DISTRO_FEATURE
- replace basename() by g_path_get_basename() to fix up musl build

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
GParted 1.4.0   (2022-03-28)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D

Release Notes
-------------
  This release of GParted includes enhancements, bug fixes and
  language translation updates.

  * Add labelling of mounted btrfs, ext2/3/4 and xfs file systems
  * Fix detection of mount points for encrypted file systems
  * Fix crash scrolling quickly in the drive selection combobox
  * Add bcache detection
  * Add JBD external EXT3/4 journal detection

Bug Fixes
---------
  * Add labelling of mounted btrfs, ext2/3/4 and xfs file systems (#163, =
!87)
  * Fix detection of mount points for encrypted file systems (#162, !88)
  * Fix unmount error when unmounting below a bind mount point (!89)
  * Fix crash scrolling quickly in the drive selection combobox (#165, !9=
1)
  * Add initial Indonesian translation of help (!90)
  * Add accessibility relations for screen readers like Orca (!92)
  * Fix partition creation at sector 2048 if partition before it (#172, !=
93)
  * Make more getter methods use return-by-constant-reference (!94)
  * Check copy destination instead of source (!95)
  * Add bcache detection (#183, !96)
  * Add JBD external EXT3/4 journal detection (#89, !97)
  * Fix translation of DocBook markup tag of the GParted Manual (!98)

Code Credits
------------
  Code enhancements are courtesy of Movie Ma, Pascal Eng=C3=A9libert, and
  Mike Fleetwood.

Translations (new/updated)
--------------------------
  cs(Marek =C4=8Cernock=C3=BD), da(Alan Mortensen), eu(Asier Sarasua Garm=
endia),
  fur(Fabio Tomat), he(Yaron Shahrabani), hr(Goran Vidovi=C4=87),
  hu(Bal=C3=A1zs =C3=9Ar), id(Andika Triwidada), it(Milo Casagrande),
  ko(Seong-ho Cho), lt(Aurimas =C4=8Cernius), lv(R=C5=ABdolfs Mazurs),
  nb(Kjell Cato Heskjestad), nl(Nathan Follens), pa(A S Alam),
  pt(Hugo Carvalho), ru(Aleksandr Melman, Sergej A), sk(Du=C5=A1an Kazik)=
,
  sl(Matej Urban=C4=8Di=C4=8D), sr(=D0=9C=D0=B8=D1=80=D0=BE=D1=81=D0=BB=D0=
=B0=D0=B2 =D0=9D=D0=B8=D0=BA=D0=BE=D0=BB=D0=B8=D1=9B), zh_CN(Luming Zh)

Dependencies (new/updated)
--------------------------
  * n/a

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gparted/files/0001-replace-gnu-basename.patch | 15 +++++++++++++++
 .../{gparted_1.3.1.bb =3D> gparted_1.4.0.bb}        |  6 +++---
 2 files changed, 18 insertions(+), 3 deletions(-)
 create mode 100644 meta-gnome/recipes-extended/gparted/files/0001-replac=
e-gnu-basename.patch
 rename meta-gnome/recipes-extended/gparted/{gparted_1.3.1.bb =3D> gparte=
d_1.4.0.bb} (83%)

diff --git a/meta-gnome/recipes-extended/gparted/files/0001-replace-gnu-b=
asename.patch b/meta-gnome/recipes-extended/gparted/files/0001-replace-gn=
u-basename.patch
new file mode 100644
index 000000000..ff06911ab
--- /dev/null
+++ b/meta-gnome/recipes-extended/gparted/files/0001-replace-gnu-basename=
.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Pending
+
+Signed-off-by: Markus Volk f_l_k@t-online.de
+
+--- a/src/BCache_Info.cc	2022-04-07 09:56:08.589006367 +0200
++++ b/src/BCache_Info.cc	2022-04-07 09:55:34.573186965 +0200
+@@ -49,7 +49,7 @@
+ 		return Glib::ustring("");
+ 	buf[len] =3D '\0';
+=20
+-	return "/dev/" + Glib::ustring(basename(buf));
++	return "/dev/" + Glib::ustring(g_path_get_basename(buf));
+ }
+=20
+=20
diff --git a/meta-gnome/recipes-extended/gparted/gparted_1.3.1.bb b/meta-=
gnome/recipes-extended/gparted/gparted_1.4.0.bb
similarity index 83%
rename from meta-gnome/recipes-extended/gparted/gparted_1.3.1.bb
rename to meta-gnome/recipes-extended/gparted/gparted_1.4.0.bb
index d1a975930..a4b653ceb 100644
--- a/meta-gnome/recipes-extended/gparted/gparted_1.3.1.bb
+++ b/meta-gnome/recipes-extended/gparted/gparted_1.4.0.bb
@@ -3,16 +3,16 @@ HOMEPAGE =3D "http://gparted.org/index.php"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
=20
-inherit features_check autotools pkgconfig python3native gnome-help gtk-=
icon-cache
+inherit autotools pkgconfig python3native gnome-help gtk-icon-cache
=20
-REQUIRED_DISTRO_FEATURES =3D "x11"
=20
 SRC_URI =3D " \
     ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BPN}-${PV}/${BPN}-${PV=
}.tar.gz \
     file://0001-Install-polkit-action-unconditionally-executable-pke.pat=
ch \
     file://0001-Do-not-use-NULL-where-boolean-is-expected.patch \
+    file://0001-replace-gnu-basename.patch \
 "
-SRC_URI[sha256sum] =3D "5eee2e6d74b15ef96b13b3a2310c868ed2298e03341021e7=
d12a5a98a1d1e109"
+SRC_URI[sha256sum] =3D "e5293a792e53fdbeba29c4a834113cd9603d0d639330da93=
1a468bf3687887be"
=20
 UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/gparted/files/g=
parted/"
 UPSTREAM_CHECK_REGEX =3D "gparted-(?P<pver>\d+\.(\d+)+(\.\d+)+)"
--=20
2.25.1


