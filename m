Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E7DCD3425
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 21:52:18 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.4199.1695073932082803612
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Sep 2023 14:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout06.t-online.de (Postfix) with SMTP id 949E454F2
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 23:52:09 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.161.214]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qiMA1-3qxV2C0; Mon, 18 Sep 2023 23:52:05 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 12/18] gnome-control-center: upgrade 44.3 -> 45.0
Date: Mon, 18 Sep 2023 23:51:47 +0200
Message-ID: <20230918215156.1920452-12-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918215156.1920452-1-f_l_k@t-online.de>
References: <20230918215156.1920452-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1695073925-46FF85E3-EA761E86/0/0 CLEAN NORMAL
X-TOI-MSGID: 305e4051-5145-4eb5-a43f-7630ca85fdf8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 21:52:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104939

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-Add-meson-option-to-pass-sysroot.patch  | 16 ++++++++--------
 ...nter_44.3.bb =3D> gnome-control-center_45.0.bb} |  8 ++++----
 2 files changed, 12 insertions(+), 12 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-cent=
er_44.3.bb =3D> gnome-control-center_45.0.bb} (90%)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center/0001-Add-meson-option-to-pass-sysroot.patch b/meta-gnome/recipes-g=
nome/gnome-control-center/gnome-control-center/0001-Add-meson-option-to-p=
ass-sysroot.patch
index 5c0eee576..7cd7c0469 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/=
0001-Add-meson-option-to-pass-sysroot.patch
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/=
0001-Add-meson-option-to-pass-sysroot.patch
@@ -19,7 +19,7 @@ Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail=
.com>
  2 files changed, 2 insertions(+), 1 deletion(-)
=20
 diff --git a/meson_options.txt b/meson_options.txt
-index dbca723..af0f871 100644
+index 8ee7b6e0e..7e6adc668 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
 @@ -1,3 +1,4 @@
@@ -28,28 +28,28 @@ index dbca723..af0f871 100644
  option('ibus', type: 'boolean', value: true, description: 'build with I=
Bus support')
  option('privileged_group', type: 'string', value: 'wheel', description:=
 'name of group that has elevated permissions')
 diff --git a/panels/background/meson.build b/panels/background/meson.bui=
ld
-index 69af0cfea..6edcaa5ff 100644
+index 9bf543538..97f1e0117 100644
 --- a/panels/background/meson.build
 +++ b/panels/background/meson.build
 @@ -19,7 +19,7 @@ common_sources =3D []
 =20
  enums =3D 'gdesktop-enums-types'
  enums_header =3D files(
--  gsettings_desktop_dep.get_pkgconfig_variable('prefix') + '/include/gs=
ettings-desktop-schemas/gdesktop-enums.h',
-+  get_option('oe_sysroot') + gsettings_desktop_dep.get_pkgconfig_variab=
le('prefix') + '/include/gsettings-desktop-schemas/gdesktop-enums.h',
+-  gsettings_desktop_dep.get_variable(pkgconfig: 'prefix') + '/include/g=
settings-desktop-schemas/gdesktop-enums.h',
++  get_option('oe_sysroot') + gsettings_desktop_dep.get_variable(pkgconf=
ig: 'prefix') + '/include/gsettings-desktop-schemas/gdesktop-enums.h',
    'cc-background-item.h'
  )
 =20
 diff --git a/panels/datetime/meson.build b/panels/datetime/meson.build
-index 3b6f5e197..30b207882 100644
+index 8cb3b63f0..8c5a45e7c 100644
 --- a/panels/datetime/meson.build
 +++ b/panels/datetime/meson.build
-@@ -45,7 +45,7 @@ sources =3D files(
+@@ -37,7 +37,7 @@ sources =3D files(
 =20
  enums =3D 'gdesktop-enums-types'
  enums_header =3D files(
--  gsettings_desktop_dep.get_pkgconfig_variable('prefix') + '/include/gs=
ettings-desktop-schemas/gdesktop-enums.h',
-+  get_option('oe_sysroot') + gsettings_desktop_dep.get_pkgconfig_variab=
le('prefix') + '/include/gsettings-desktop-schemas/gdesktop-enums.h',
+-  gsettings_desktop_dep.get_variable(pkgconfig: 'prefix') + '/include/g=
settings-desktop-schemas/gdesktop-enums.h',
++  get_option('oe_sysroot') + gsettings_desktop_dep.get_variable(pkgconf=
ig: 'prefix') + '/include/gsettings-desktop-schemas/gdesktop-enums.h',
    'cc-datetime-panel.h'
  )
 =20
diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_44.3.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-cont=
rol-center_45.0.bb
similarity index 90%
rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-control-c=
enter_44.3.bb
rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-cen=
ter_45.0.bb
index 0066f5885..41777d9f6 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
44.3.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
45.0.bb
@@ -28,6 +28,8 @@ DEPENDS =3D " \
     polkit \
     pulseaudio \
     samba \
+    setxkbmap-native \
+    tecla \
     udisks2 \
     upower \
 "
@@ -37,16 +39,14 @@ inherit gtk-icon-cache pkgconfig gnomebase gsettings =
gettext upstream-version-is
 REQUIRED_DISTRO_FEATURES +=3D "opengl polkit pulseaudio systemd x11"
=20
 SRC_URI +=3D "file://0001-Add-meson-option-to-pass-sysroot.patch"
-SRC_URI[archive.sha256sum] =3D "066a65052fc3ecfae860025e85f797e6ab2b87a5=
8c4f8ab9c66ec20718a80c7a"
+SRC_URI[archive.sha256sum] =3D "83df6a90f98914f2c19a872ce06562acef409276=
37f679c383099265ccfa42cf"
=20
 PACKAGECONFIG ??=3D "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'wayland=
', d)}"
 PACKAGECONFIG[cups] =3D ",,cups,cups"
 PACKAGECONFIG[ibus] =3D "-Dibus=3Dtrue, -Dibus=3Dfalse, ibus"
 PACKAGECONFIG[wayland] =3D "-Dwayland=3Dtrue, -Dwayland=3Dfalse, wayland=
"
=20
-EXTRA_OEMESON =3D " \
-    -Doe_sysroot=3D${STAGING_DIR_HOST} \
-"
+EXTRA_OEMESON +=3D "-Doe_sysroot=3D${STAGING_DIR_HOST}"
=20
 USERADD_PACKAGES =3D "${PN}"
 USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group --home-d=
ir ${sysconfdir}/polkit-1 polkitd"
--=20
2.41.0


