Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 135F0C54E6A
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 17:11:46 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.50686.1710781898728640933
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 10:11:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout06.t-online.de (Postfix) with SMTP id AB87B6972
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 18:11:35 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.38.150]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rmGWM-23Orrd0; Mon, 18 Mar 2024 18:11:34 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/2] gnome-control-center: update 45.3 -> 46.0
Date: Mon, 18 Mar 2024 18:11:58 +0100
Message-ID: <20240318171204.30153-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1710781894-337FD937-0CB8CE89/0/0 CLEAN NORMAL
X-TOI-MSGID: 685d605c-ea1d-4811-8cfe-a3596e631978
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 17:11:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109407

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...001-Add-meson-option-to-pass-sysroot.patch | 51 ++++++++-----------
 ...r_45.3.bb =3D> gnome-control-center_46.0.bb} |  2 +-
 2 files changed, 23 insertions(+), 30 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-cent=
er_45.3.bb =3D> gnome-control-center_46.0.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center/0001-Add-meson-option-to-pass-sysroot.patch b/meta-gnome/recipes-g=
nome/gnome-control-center/gnome-control-center/0001-Add-meson-option-to-p=
ass-sysroot.patch
index 7cd7c0469..a2c237c18 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/=
0001-Add-meson-option-to-pass-sysroot.patch
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/=
0001-Add-meson-option-to-pass-sysroot.patch
@@ -1,57 +1,50 @@
-From ba8aebe1259ae3f7f5a4827e5a47bb95c568b218 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
-Date: Tue, 21 May 2019 16:07:46 +0200
+From 1a48df2a8da44410bbd767c2420d363f6180c79a Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Mon, 18 Mar 2024 05:50:21 +0100
 Subject: [PATCH] Add meson option to pass sysroot
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
=20
-We need to pass this to meson to help it finding gdesktop-enums.h:
-
-| panels/background/meson.build:38:0: ERROR: File /usr/include/gsettings=
-desktop-schemas/gdesktop-enums.h does not exist.
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
 ---
  meson_options.txt             | 1 +
  panels/background/meson.build | 2 +-
- 2 files changed, 2 insertions(+), 1 deletion(-)
+ panels/system/meson.build     | 2 +-
+ 3 files changed, 3 insertions(+), 2 deletions(-)
=20
 diff --git a/meson_options.txt b/meson_options.txt
-index 8ee7b6e0e..7e6adc668 100644
+index e53d6e3f3..8fae4c824 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
 @@ -1,3 +1,4 @@
 +option('oe_sysroot', type: 'string', value: '', description: 'Directory=
 for OE-sysroot')
+ option('deprecated-declarations', type: 'feature', value: 'disabled', d=
escription: 'build with deprecated declaration warnings')
  option('documentation', type: 'boolean', value: false, description: 'bu=
ild documentation')
  option('ibus', type: 'boolean', value: true, description: 'build with I=
Bus support')
- option('privileged_group', type: 'string', value: 'wheel', description:=
 'name of group that has elevated permissions')
 diff --git a/panels/background/meson.build b/panels/background/meson.bui=
ld
-index 9bf543538..97f1e0117 100644
+index 6ced050f9..df1f80896 100644
 --- a/panels/background/meson.build
 +++ b/panels/background/meson.build
-@@ -19,7 +19,7 @@ common_sources =3D []
+@@ -24,7 +24,7 @@ common_sources +=3D gnome.mkenums_simple(
 =20
  enums =3D 'gdesktop-enums-types'
  enums_header =3D files(
--  gsettings_desktop_dep.get_variable(pkgconfig: 'prefix') + '/include/g=
settings-desktop-schemas/gdesktop-enums.h',
-+  get_option('oe_sysroot') + gsettings_desktop_dep.get_variable(pkgconf=
ig: 'prefix') + '/include/gsettings-desktop-schemas/gdesktop-enums.h',
-   'cc-background-item.h'
+-  gsettings_desktop_dep.get_variable(pkgconfig: 'prefix') + '/include/g=
settings-desktop-schemas/gdesktop-enums.h'
++  get_option('oe_sysroot') + gsettings_desktop_dep.get_variable(pkgconf=
ig: 'prefix') + '/include/gsettings-desktop-schemas/gdesktop-enums.h'
  )
 =20
-diff --git a/panels/datetime/meson.build b/panels/datetime/meson.build
-index 8cb3b63f0..8c5a45e7c 100644
---- a/panels/datetime/meson.build
-+++ b/panels/datetime/meson.build
-@@ -37,7 +37,7 @@ sources =3D files(
+ common_sources +=3D gnome.mkenums(
+diff --git a/panels/system/meson.build b/panels/system/meson.build
+index 4fee82210..979332a0e 100644
+--- a/panels/system/meson.build
++++ b/panels/system/meson.build
+@@ -73,7 +73,7 @@ sources +=3D gnome.compile_resources(
+ )
 =20
- enums =3D 'gdesktop-enums-types'
  enums_header =3D files(
 -  gsettings_desktop_dep.get_variable(pkgconfig: 'prefix') + '/include/g=
settings-desktop-schemas/gdesktop-enums.h',
 +  get_option('oe_sysroot') + gsettings_desktop_dep.get_variable(pkgconf=
ig: 'prefix') + '/include/gsettings-desktop-schemas/gdesktop-enums.h',
-   'cc-datetime-panel.h'
+   'datetime/cc-datetime-page.h'
  )
 =20
 --=20
-2.34.1
+2.44.0
+
diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_45.3.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-cont=
rol-center_46.0.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-control-c=
enter_45.3.bb
rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-cen=
ter_46.0.bb
index 96fe9c9ff..53643c680 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
45.3.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
46.0.bb
@@ -38,7 +38,7 @@ inherit gtk-icon-cache pkgconfig gnomebase gsettings ge=
ttext upstream-version-is
 REQUIRED_DISTRO_FEATURES +=3D "opengl polkit pulseaudio systemd x11"
=20
 SRC_URI +=3D "file://0001-Add-meson-option-to-pass-sysroot.patch"
-SRC_URI[archive.sha256sum] =3D "b1e949c4e86c0624ec6a6ed0df09c9fae2b22983=
c1dca60ed86aec8ef0b24004"
+SRC_URI[archive.sha256sum] =3D "25f67de05897868b2e97eaa0ecc986a408af08d4=
985c8a9da44f0d7bd8fea7a4"
=20
 PACKAGECONFIG ??=3D "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'wayland=
', d)}"
 PACKAGECONFIG[cups] =3D ",,cups,cups"
--=20
2.44.0


