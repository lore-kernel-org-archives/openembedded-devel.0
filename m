Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58F1DC61DA3
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 20:06:39 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.53451.1677009997909110209
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Feb 2023 12:06:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout02.t-online.de (Postfix) with SMTP id 10F121B7B0
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Feb 2023 21:06:34 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.165.85]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pUYuH-1tIjVB0; Tue, 21 Feb 2023 21:06:33 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH] gparted: update 1.4.0 -> 1.5.0
Date: Tue, 21 Feb 2023 21:06:25 +0100
Message-Id: <20230221200625.494020-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1677009993-DA6182C4-B1D65697/0/0 CLEAN NORMAL
X-TOI-MSGID: 54a9827a-79b3-4525-8d51-e502625fe304
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Feb 2023 20:06:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101196

- Remove unneeded patches

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...t-use-NULL-where-boolean-is-expected.patch | 33 -------------------
 .../files/0001-use-posix-basename.patch       | 30 -----------------
 .../{gparted_1.4.0.bb =3D> gparted_1.5.0.bb}    |  6 ++--
 3 files changed, 2 insertions(+), 67 deletions(-)
 delete mode 100644 meta-gnome/recipes-extended/gparted/files/0001-Do-not=
-use-NULL-where-boolean-is-expected.patch
 delete mode 100644 meta-gnome/recipes-extended/gparted/files/0001-use-po=
six-basename.patch
 rename meta-gnome/recipes-extended/gparted/{gparted_1.4.0.bb =3D> gparte=
d_1.5.0.bb} (78%)

diff --git a/meta-gnome/recipes-extended/gparted/files/0001-Do-not-use-NU=
LL-where-boolean-is-expected.patch b/meta-gnome/recipes-extended/gparted/=
files/0001-Do-not-use-NULL-where-boolean-is-expected.patch
deleted file mode 100644
index 1b0d24024..000000000
--- a/meta-gnome/recipes-extended/gparted/files/0001-Do-not-use-NULL-wher=
e-boolean-is-expected.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 9af84e1c08a2159c10baf13244e2c8a7d7e837e9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 27 Jan 2022 23:02:20 -0800
-Subject: [PATCH] Do not use NULL where boolean is expected
-
-Fixes
-src/GParted_Core.cc:73:57: error: static_cast from 'nullptr_t' to 'PedPa=
rtitionFlag' (aka '_PedPartitionFlag') is not allowed
-|         for ( PedPartitionFlag flag =3D ped_partition_flag_next( stati=
c_cast<PedPartitionFlag>( NULL ) ) ;
-|                                                                ^~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-| 1 error generated.
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/GParted_Core.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/GParted_Core.cc b/src/GParted_Core.cc
-index f7ac970..3290c66 100644
---- a/src/GParted_Core.cc
-+++ b/src/GParted_Core.cc
-@@ -70,7 +70,7 @@ GParted_Core::GParted_Core()
- 	ped_exception_set_handler( ped_exception_handler ) ;=20
-=20
- 	//get valid flags ...
--	for ( PedPartitionFlag flag =3D ped_partition_flag_next( static_cast<P=
edPartitionFlag>( NULL ) ) ;
-+	for ( PedPartitionFlag flag =3D ped_partition_flag_next( static_cast<P=
edPartitionFlag>( false ) ) ;
- 	      flag ;
- 	      flag =3D ped_partition_flag_next( flag ) )
- 		flags .push_back( flag ) ;
---=20
-2.35.0
-
diff --git a/meta-gnome/recipes-extended/gparted/files/0001-use-posix-bas=
ename.patch b/meta-gnome/recipes-extended/gparted/files/0001-use-posix-ba=
sename.patch
deleted file mode 100644
index aae200e27..000000000
--- a/meta-gnome/recipes-extended/gparted/files/0001-use-posix-basename.p=
atch
+++ /dev/null
@@ -1,30 +0,0 @@
-Subject: [PATCH] BCache_Info.cc: use posix basename
-
-gnu 'basename' is undeclared for cplusplus if using musl. Use posix base=
name instead.
-
-fdebug-prefix-map=3DTOPDIR/build/tmp/work/cortexa57-yoe-linux-musl/gpart=
ed/1.4.0-r0/
-recipe-sysroot-native=3D-fvisibility-inlines-hidden  -c -o Dialog_Diskla=
bel.o ../../
-gparted-1.4.0/src/Dialog_Disklabel.cc ../../gparted-1.4.0/src/BCache_Inf=
o.cc:52:33:
-
-error: use of undeclared identifier 'basename'; did you mean 'g_basename=
'?
-        return "/dev/" + Glib::ustring(basename(buf));
-                                       ^~~~~~~~
-                                       g_basename
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
-
-Upstream-Status: Submitted
-
-https://gitlab.gnome.org/GNOME/gparted/-/merge_requests/99
-
---- a/src/BCache_Info.cc	2022-03-02 22:04:17.000000000 +0100
-+++ b/src/BCache_Info.cc	2022-04-09 15:02:56.932218665 +0200
-@@ -17,7 +17,7 @@
-=20
- #include "BCache_Info.h"
-=20
--#include <string.h>  // GNU version of basename()
-+#include <libgen.h>  // POSIX version of basename()
- #include <unistd.h>
- #include <glibmm/ustring.h>
- #include <glibmm/fileutils.h>
diff --git a/meta-gnome/recipes-extended/gparted/gparted_1.4.0.bb b/meta-=
gnome/recipes-extended/gparted/gparted_1.5.0.bb
similarity index 78%
rename from meta-gnome/recipes-extended/gparted/gparted_1.4.0.bb
rename to meta-gnome/recipes-extended/gparted/gparted_1.5.0.bb
index dde5a02ab..be7a96ea8 100644
--- a/meta-gnome/recipes-extended/gparted/gparted_1.4.0.bb
+++ b/meta-gnome/recipes-extended/gparted/gparted_1.5.0.bb
@@ -3,17 +3,15 @@ HOMEPAGE =3D "http://gparted.org/index.php"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
=20
-inherit autotools pkgconfig python3native gnome-help gtk-icon-cache feat=
ures_check
+inherit autotools pkgconfig python3native gettext gnome-help gtk-icon-ca=
che features_check
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
 SRC_URI =3D " \
     ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BPN}-${PV}/${BPN}-${PV=
}.tar.gz \
     file://0001-Install-polkit-action-unconditionally-executable-pke.pat=
ch \
-    file://0001-Do-not-use-NULL-where-boolean-is-expected.patch \
-    file://0001-use-posix-basename.patch \
 "
-SRC_URI[sha256sum] =3D "e5293a792e53fdbeba29c4a834113cd9603d0d639330da93=
1a468bf3687887be"
+SRC_URI[sha256sum] =3D "3c95ea26a944083ff1d9b17639b1e2ad9758df225dc751ff=
407b2a6aa092a8de"
=20
 UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/gparted/files/g=
parted/"
 UPSTREAM_CHECK_REGEX =3D "gparted-(?P<pver>\d+\.(\d+)+(\.\d+)+)"
--=20
2.34.1


