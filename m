Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D49BC63700
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:01 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web08.6703.1649513816616216102
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Apr 2022 07:16:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20,
 mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout08.t-online.de (Postfix) with SMTP id 75A04866E
	for <openembedded-devel@lists.openembedded.org>;
 Sat,  9 Apr 2022 16:16:54 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([79.219.227.42]) by fwd78.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1ndBtV-0RJcDh0; Sat, 9 Apr 2022 16:16:53 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCHv4] gparted: update to v1.4.0
Date: Sat,  9 Apr 2022 16:16:42 +0200
Message-Id: <20220409141642.2469608-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1649513813-0000AD4E-9FE6EB24/0/0 CLEAN NORMAL
X-TOI-MSGID: 46f53ea6-cf09-49ea-9764-1ff790c564f0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96497

- remove x11 features-check because there aren't dependencies that would
  explicilty require x11 as a DISTRO_FEATURE
- use POSIX basename() to fix up musl build

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
 .../files/0001-use-posix-basename.patch       | 30 +++++++++++++++++++
 .../{gparted_1.3.1.bb =3D> gparted_1.4.0.bb}    |  6 ++--
 2 files changed, 33 insertions(+), 3 deletions(-)
 create mode 100644 meta-gnome/recipes-extended/gparted/files/0001-use-po=
six-basename.patch
 rename meta-gnome/recipes-extended/gparted/{gparted_1.3.1.bb =3D> gparte=
d_1.4.0.bb} (83%)

diff --git a/meta-gnome/recipes-extended/gparted/files/0001-use-posix-bas=
ename.patch b/meta-gnome/recipes-extended/gparted/files/0001-use-posix-ba=
sename.patch
new file mode 100644
index 000000000..aae200e27
--- /dev/null
+++ b/meta-gnome/recipes-extended/gparted/files/0001-use-posix-basename.p=
atch
@@ -0,0 +1,30 @@
+Subject: [PATCH] BCache_Info.cc: use posix basename
+
+gnu 'basename' is undeclared for cplusplus if using musl. Use posix base=
name instead.
+
+fdebug-prefix-map=3DTOPDIR/build/tmp/work/cortexa57-yoe-linux-musl/gpart=
ed/1.4.0-r0/
+recipe-sysroot-native=3D-fvisibility-inlines-hidden  -c -o Dialog_Diskla=
bel.o ../../
+gparted-1.4.0/src/Dialog_Disklabel.cc ../../gparted-1.4.0/src/BCache_Inf=
o.cc:52:33:
+
+error: use of undeclared identifier 'basename'; did you mean 'g_basename=
'?
+        return "/dev/" + Glib::ustring(basename(buf));
+                                       ^~~~~~~~
+                                       g_basename
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+Upstream-Status: Submitted
+
+https://gitlab.gnome.org/GNOME/gparted/-/merge_requests/99
+
+--- a/src/BCache_Info.cc	2022-03-02 22:04:17.000000000 +0100
++++ b/src/BCache_Info.cc	2022-04-09 15:02:56.932218665 +0200
+@@ -17,7 +17,7 @@
+=20
+ #include "BCache_Info.h"
+=20
+-#include <string.h>  // GNU version of basename()
++#include <libgen.h>  // POSIX version of basename()
+ #include <unistd.h>
+ #include <glibmm/ustring.h>
+ #include <glibmm/fileutils.h>
diff --git a/meta-gnome/recipes-extended/gparted/gparted_1.3.1.bb b/meta-=
gnome/recipes-extended/gparted/gparted_1.4.0.bb
similarity index 83%
rename from meta-gnome/recipes-extended/gparted/gparted_1.3.1.bb
rename to meta-gnome/recipes-extended/gparted/gparted_1.4.0.bb
index d1a975930..6f774904b 100644
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
+    file://0001-use-posix-basename.patch \
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


