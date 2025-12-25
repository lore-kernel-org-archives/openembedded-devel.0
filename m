Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D7AE7AD6C
	for <webhook@archiver.kernel.org>; Thu, 25 Dec 2025 19:35:23 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.143639.1766691320722468907
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Dec 2025 11:35:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout06.t-online.de (Postfix) with SMTP id F1C08168
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 20:34:45 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.239.223]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vYr6f-135MiP0; Thu, 25 Dec 2025 20:34:41 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/2] gnome-software: fix build with flatpak 1.17.1
Date: Thu, 25 Dec 2025 20:34:30 +0100
Message-ID: <20251225193431.1365161-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1766691281-C27D04AF-0F845CE5/0/0 CLEAN NORMAL
X-TOI-MSGID: 0b739ab1-b281-449b-a3c7-66bc0c5c393b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 19:35:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122933

fixes:
../sources/gnome-software-49.1/meson.build:218:32: ERROR: Could not get p=
kg-config variable and no default provided for <PkgConfigDependency flatp=
ak: True ['>=3D 1.14.1']>

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-look-for-flatpak-http_backend-varia.patch | 56 +++++++++++++++++++
 .../gnome-software/gnome-software_49.1.bb     |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-software/gnome-softwar=
e/0001-meson.build-dont-look-for-flatpak-http_backend-varia.patch

diff --git a/meta-gnome/recipes-gnome/gnome-software/gnome-software/0001-=
meson.build-dont-look-for-flatpak-http_backend-varia.patch b/meta-gnome/r=
ecipes-gnome/gnome-software/gnome-software/0001-meson.build-dont-look-for=
-flatpak-http_backend-varia.patch
new file mode 100644
index 0000000000..2296b7acd2
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-software/gnome-software/0001-meson.b=
uild-dont-look-for-flatpak-http_backend-varia.patch
@@ -0,0 +1,56 @@
+From 4588a3d34f574619c6f3a4290d53e2ac063ab56a Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Thu, 25 Dec 2025 20:04:49 +0100
+Subject: [PATCH] meson.build: dont look for flatpak http_backend variabl=
e
+
+flatpak 1.17.1 release dropped libsoup2 support:
+[https://github.com/flatpak/flatpak/blob/c324778b0720cb2d01c217fdc70358e=
232c38b4d/NEWS#L20]
+
+* Drop libsoup2 support in favor of libcurl. The `http_backend` build op=
tion has
+  been dropped as well. (#6395)
+
+gnome-software still searches for the http_backend variable and fails:
+ ../sources/gnome-software-49.1/meson.build:218:32: ERROR: Could not get=
 pkg-config variable and no default provided for <PkgConfigDependency fla=
tpak: True ['>=3D 1.14.1']>
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+Upstream-Status: Inappropriate
+---
+ meson.build | 20 +-------------------
+ 1 file changed, 1 insertion(+), 19 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 3704e2abc..7e0496a22 100644
+--- a/meson.build
++++ b/meson.build
+@@ -212,26 +212,8 @@ if get_option('fwupd')
+ endif
+=20
+ if get_option('flatpak')
+-  flatpak =3D dependency('flatpak', version : '>=3D 1.14.1')
++  flatpak =3D dependency('flatpak', version : '>=3D 1.17.1')
+   ostree =3D dependency('ostree-1')
+-
+-  flatpak_httpbackend =3D flatpak.get_variable('httpbackend')
+-  if flatpak_httpbackend =3D=3D 'soup'
+-    flatpak_soupapiversion =3D flatpak.get_variable('soupapiversion', d=
efault_value: '2')
+-    if flatpak_soupapiversion.version_compare('< 3')
+-      error('''Flatpak library has been built with 'libsoup2' http back=
end, which conflicts with 'libsoup3' used by gnome-software.
+-
+-You can either:
+-
+-1. Build gnome-software without flatpak support (with -Dflatpak=3Dfalse=
) or
+-2. Rebuild flatpak library with http backend other than 'libsoup2'.''')
+-    else
+-      flatpak_summary =3D '@0@ (@1@)'.format(flatpak_httpbackend, flatp=
ak_soupapiversion)
+-    endif
+-  else
+-    flatpak_summary =3D flatpak_httpbackend
+-  endif
+-  summary('Flatpak http backend', '@0@'.format(flatpak_summary), sectio=
n : 'Misc')
+ endif
+=20
+ if get_option('malcontent')
+--=20
+2.52.0
+
diff --git a/meta-gnome/recipes-gnome/gnome-software/gnome-software_49.1.=
bb b/meta-gnome/recipes-gnome/gnome-software/gnome-software_49.1.bb
index 14ea91359e..9c441f5b2f 100644
--- a/meta-gnome/recipes-gnome/gnome-software/gnome-software_49.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-software/gnome-software_49.1.bb
@@ -28,6 +28,7 @@ RDEPENDS:${PN} =3D "iso-codes"
=20
 EXTRA_OEMESON +=3D "-Dtests=3Dfalse"
=20
+SRC_URI +=3D "file://0001-meson.build-dont-look-for-flatpak-http_backend=
-varia.patch"
 SRC_URI[archive.sha256sum] =3D "49dfeca77928801756d0c5386c1d20454ca07760=
0a5d1ed66ec46ee33a32c66d"
=20
 PACKAGECONFIG ?=3D "flatpak"
--=20
2.52.0


