Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D92B7C10F15
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 13:32:56 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.16550.1713965569797038142
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Apr 2024 06:32:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout10.t-online.de (Postfix) with SMTP id 40C5714DC5
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Apr 2024 15:32:48 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.39.163]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rzcju-1LHtQn0; Wed, 24 Apr 2024 15:32:46 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCHv2] gnome-control-center: update 46.0.1 -> 46.1
Date: Wed, 24 Apr 2024 15:33:10 +0200
Message-ID: <20240424133310.3660-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1713965566-215BAE88-A10C1F13/0/0 CLEAN NORMAL
X-TOI-MSGID: c7b138d6-275a-4886-9e68-5e875dc9a328
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Apr 2024 13:32:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110129

- add PACKAGECONFIGS for file-share and media-share

46.1

* Accessibility
 - Improve accessibility of "Typing" settings sliders

* Display
 - Fix crash when pressing Escape in the display settings

* Network
 - Add stable-ssid support for cloned-mac

* Privacy
 - Add build option to enable Location services
 - Fix opening of Help pages while viewing Privacy settings

* Sharing
 - Auto hide Sharing panel when Rygel AND gnome-user-share are not availa=
ble

* System
 - Don't show auto-timezone setting when Location services unavailable
 - Avoid unnecessary time-change requests
 - Fix issue with sensitivity of "Add" and "Enroll" Enterprise Login butt=
ons
 - Improve generated passwords capacity in Remote Desktop settings

* Wacom
 - Check for the right output connector name

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-Add-meson-option-to-pass-sysroot.patch     | 13 +++++--------
 ...enter_46.0.1.bb =3D> gnome-control-center_46.1.bb} |  9 ++++-----
 2 files changed, 9 insertions(+), 13 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-cent=
er_46.0.1.bb =3D> gnome-control-center_46.1.bb} (87%)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center/0001-Add-meson-option-to-pass-sysroot.patch b/meta-gnome/recipes-g=
nome/gnome-control-center/gnome-control-center/0001-Add-meson-option-to-p=
ass-sysroot.patch
index 4ae923f87..7d17817bc 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/=
0001-Add-meson-option-to-pass-sysroot.patch
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/=
0001-Add-meson-option-to-pass-sysroot.patch
@@ -1,4 +1,4 @@
-From 1a48df2a8da44410bbd767c2420d363f6180c79a Mon Sep 17 00:00:00 2001
+From 8e542784b8ca49c655df0f251a1a1dec724a522e Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Mon, 18 Mar 2024 05:50:21 +0100
 Subject: [PATCH] Add meson option to pass sysroot
@@ -13,16 +13,16 @@ Upstream-Status: Inappropriate [OE specific]
  3 files changed, 3 insertions(+), 2 deletions(-)
=20
 diff --git a/meson_options.txt b/meson_options.txt
-index e53d6e3f3..8fae4c824 100644
+index f415a7e..8966632 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
 @@ -1,3 +1,4 @@
 +option('oe_sysroot', type: 'string', value: '', description: 'Directory=
 for OE-sysroot')
  option('deprecated-declarations', type: 'feature', value: 'disabled', d=
escription: 'build with deprecated declaration warnings')
  option('documentation', type: 'boolean', value: false, description: 'bu=
ild documentation')
- option('ibus', type: 'boolean', value: true, description: 'build with I=
Bus support')
+ option('location-services', type: 'feature', value: 'disabled', descrip=
tion: 'build with location services')
 diff --git a/panels/background/meson.build b/panels/background/meson.bui=
ld
-index 6ced050f9..df1f80896 100644
+index 6ced050..df1f808 100644
 --- a/panels/background/meson.build
 +++ b/panels/background/meson.build
 @@ -24,7 +24,7 @@ common_sources +=3D gnome.mkenums_simple(
@@ -35,7 +35,7 @@ index 6ced050f9..df1f80896 100644
 =20
  common_sources +=3D gnome.mkenums(
 diff --git a/panels/system/meson.build b/panels/system/meson.build
-index 4fee82210..979332a0e 100644
+index 4fee822..979332a 100644
 --- a/panels/system/meson.build
 +++ b/panels/system/meson.build
 @@ -73,7 +73,7 @@ sources +=3D gnome.compile_resources(
@@ -47,6 +47,3 @@ index 4fee82210..979332a0e 100644
    'datetime/cc-datetime-page.h'
  )
 =20
---=20
-2.44.0
-
diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_46.0.1.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-co=
ntrol-center_46.1.bb
similarity index 87%
rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-control-c=
enter_46.0.1.bb
rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-cen=
ter_46.1.bb
index de11239ed..87daec0c2 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
46.0.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
46.1.bb
@@ -37,16 +37,15 @@ inherit gtk-icon-cache pkgconfig gnomebase gsettings =
gettext upstream-version-is
=20
 REQUIRED_DISTRO_FEATURES +=3D "opengl polkit pulseaudio systemd x11"
=20
-SRC_URI =3D "gitsm://gitlab.gnome.org/GNOME/gnome-control-center.git;pro=
tocol=3Dhttps;nobranch=3D1"
 SRC_URI +=3D "file://0001-Add-meson-option-to-pass-sysroot.patch"
-
-S =3D "${WORKDIR}/git"
-SRCREV =3D "005f40dcfa464f113a1c95f97673bc5505fc15ad"
+SRC_URI[archive.sha256sum] =3D "81792423019deda1d2a074c1ecf6a7e6ef3172c0=
9cbe6f4d7995a4b5dea28312"
=20
 PACKAGECONFIG ??=3D "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'wayland=
', d)}"
 PACKAGECONFIG[cups] =3D ",,cups,cups"
 PACKAGECONFIG[ibus] =3D "-Dibus=3Dtrue, -Dibus=3Dfalse, ibus"
 PACKAGECONFIG[wayland] =3D "-Dwayland=3Dtrue, -Dwayland=3Dfalse, wayland=
"
+PACKAGECONFIG[file-share] =3D ",,,gnome-user-share"
+PACKAGECONFIG[media-share] =3D ",,,rygel-meta tumbler"
=20
 EXTRA_OEMESON +=3D "-Doe_sysroot=3D${STAGING_DIR_HOST}"
=20
@@ -72,4 +71,4 @@ FILES:${PN} +=3D " \
=20
 FILES:${PN}-dev +=3D "${datadir}/gettext"
=20
-RDEPENDS:${PN} +=3D "gsettings-desktop-schemas tecla system-config-print=
er cups-pk-helper ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'gno=
me-user-share', '' , d)}"
+RDEPENDS:${PN} +=3D "gsettings-desktop-schemas tecla system-config-print=
er cups-pk-helper"
--=20
2.44.0


