Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A042DC77B7A
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 16:46:16 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.1624.1686069973525507459
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jun 2023 09:46:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout11.t-online.de (Postfix) with SMTP id 2963B23829
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Jun 2023 18:46:04 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.154.173.9]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1q6Zoo-4TIzsv0; Tue, 6 Jun 2023 18:46:02 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 1/3] gnome-control-center: upgrade 44.1 -> 44.2
Date: Tue,  6 Jun 2023 18:45:49 +0200
Message-Id: <20230606164551.4874-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686069962-ADD8FDAB-56B67B7E/0/0 CLEAN NORMAL
X-TOI-MSGID: 56a4d5e9-e4fd-43ff-9b1b-b0a3c1b4b910
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 16:46:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103149

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-Add-meson-option-to-pass-sysroot.patch | 17 +++++++++++++++--
 ...ter_44.1.bb =3D> gnome-control-center_44.2.bb} |  2 +-
 2 files changed, 16 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-cent=
er_44.1.bb =3D> gnome-control-center_44.2.bb} (94%)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center/0001-Add-meson-option-to-pass-sysroot.patch b/meta-gnome/recipes-g=
nome/gnome-control-center/gnome-control-center/0001-Add-meson-option-to-p=
ass-sysroot.patch
index 11ad30eda..5c0eee576 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/=
0001-Add-meson-option-to-pass-sysroot.patch
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/=
0001-Add-meson-option-to-pass-sysroot.patch
@@ -28,10 +28,10 @@ index dbca723..af0f871 100644
  option('ibus', type: 'boolean', value: true, description: 'build with I=
Bus support')
  option('privileged_group', type: 'string', value: 'wheel', description:=
 'name of group that has elevated permissions')
 diff --git a/panels/background/meson.build b/panels/background/meson.bui=
ld
-index 3634c47..459ccfe 100644
+index 69af0cfea..6edcaa5ff 100644
 --- a/panels/background/meson.build
 +++ b/panels/background/meson.build
-@@ -25,7 +25,7 @@ common_sources =3D []
+@@ -19,7 +19,7 @@ common_sources =3D []
 =20
  enums =3D 'gdesktop-enums-types'
  enums_header =3D files(
@@ -40,5 +40,18 @@ index 3634c47..459ccfe 100644
    'cc-background-item.h'
  )
 =20
+diff --git a/panels/datetime/meson.build b/panels/datetime/meson.build
+index 3b6f5e197..30b207882 100644
+--- a/panels/datetime/meson.build
++++ b/panels/datetime/meson.build
+@@ -45,7 +45,7 @@ sources =3D files(
+=20
+ enums =3D 'gdesktop-enums-types'
+ enums_header =3D files(
+-  gsettings_desktop_dep.get_pkgconfig_variable('prefix') + '/include/gs=
ettings-desktop-schemas/gdesktop-enums.h',
++  get_option('oe_sysroot') + gsettings_desktop_dep.get_pkgconfig_variab=
le('prefix') + '/include/gsettings-desktop-schemas/gdesktop-enums.h',
+   'cc-datetime-panel.h'
+ )
+=20
 --=20
 2.34.1
diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_44.1.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-cont=
rol-center_44.2.bb
similarity index 94%
rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-control-c=
enter_44.1.bb
rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-cen=
ter_44.2.bb
index a64c2410a..b2c04c2f6 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
44.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
44.2.bb
@@ -37,7 +37,7 @@ inherit gtk-icon-cache pkgconfig gnomebase gsettings ge=
ttext upstream-version-is
 REQUIRED_DISTRO_FEATURES +=3D "opengl polkit pulseaudio systemd x11"
=20
 SRC_URI +=3D "file://0001-Add-meson-option-to-pass-sysroot.patch"
-SRC_URI[archive.sha256sum] =3D "7abd365018e28679def60a5ecd3049db0fb85de6=
da49a96dadd21fba8db002e7"
+SRC_URI[archive.sha256sum] =3D "0623d7d21cfe970d2ef34420623545a5945b9892=
e641f9a011cecec21afda10c"
=20
 PACKAGECONFIG ??=3D "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'wayland=
', d)}"
 PACKAGECONFIG[cups] =3D ",,cups,cups"
--=20
2.34.1


