Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF946C27C44
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 10:16:21 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.18879.1716891373251319982
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 May 2024 03:16:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout09.t-online.de (Postfix) with SMTP id D028D17622
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 12:16:11 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.40.240]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sBtsE-0356zS0; Tue, 28 May 2024 12:16:06 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/3] gnome-control-center: update 46.1 -> 46.2
Date: Tue, 28 May 2024 12:16:42 +0200
Message-ID: <20240528101643.2314146-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240528101643.2314146-1-f_l_k@t-online.de>
References: <20240528101643.2314146-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1716891366-D3FFCD0F-31AF6842/0/0 CLEAN NORMAL
X-TOI-MSGID: 6004865c-d221-4969-8880-6b96a60962bc
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:16:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110583

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 46.2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Enable the "Location" settings panel by default (build-optional)
- Various translation updates
- Improve accessibility of some secondary-labels in settings rows
- Increase default log verbosity level

Accessibility
- Fix icon name of accessibility panel desktop file
- Fix flash area settings selection shown incorrectly

Display
- Fix crash when closing laptop lid

Keyboard
- Fix keyboard navigation of keyboard shortcuts dialog categories

Mouse and Touchpad
- Remove unnecessary a11y label

Network
- Fix crash when removing bluetooth network adapter row
- Sort VPN connections list alphabetically
- Remove incorrect assertion that breaks proxy settings page

Sound
- Make sliders more accessible by keyboard
- Remove need for translating speaker test button tooltip

System
- Improve accessibility of "Copy" buttons in Remote Desktop
- Fix crash in Date And Time settings closing before async calls finish
- Fix reuse of remote-desktop verify encryption fingerprint dialog

Users
- Fix visibility issue in parental controls row

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-Add-meson-option-to-pass-sysroot.patch             | 6 +++---
 ...-control-center_46.1.bb =3D> gnome-control-center_46.2.bb} | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-cent=
er_46.1.bb =3D> gnome-control-center_46.2.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center/0001-Add-meson-option-to-pass-sysroot.patch b/meta-gnome/recipes-g=
nome/gnome-control-center/gnome-control-center/0001-Add-meson-option-to-p=
ass-sysroot.patch
index 7d17817bc..c1bd34d14 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/=
0001-Add-meson-option-to-pass-sysroot.patch
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/=
0001-Add-meson-option-to-pass-sysroot.patch
@@ -1,4 +1,4 @@
-From 8e542784b8ca49c655df0f251a1a1dec724a522e Mon Sep 17 00:00:00 2001
+From 9b88f816ffbe3dd35d0260974e246f6694983500 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Mon, 18 Mar 2024 05:50:21 +0100
 Subject: [PATCH] Add meson option to pass sysroot
@@ -13,14 +13,14 @@ Upstream-Status: Inappropriate [OE specific]
  3 files changed, 3 insertions(+), 2 deletions(-)
=20
 diff --git a/meson_options.txt b/meson_options.txt
-index f415a7e..8966632 100644
+index b2302bf..5b9baf5 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
 @@ -1,3 +1,4 @@
 +option('oe_sysroot', type: 'string', value: '', description: 'Directory=
 for OE-sysroot')
  option('deprecated-declarations', type: 'feature', value: 'disabled', d=
escription: 'build with deprecated declaration warnings')
  option('documentation', type: 'boolean', value: false, description: 'bu=
ild documentation')
- option('location-services', type: 'feature', value: 'disabled', descrip=
tion: 'build with location services')
+ option('location-services', type: 'feature', value: 'enabled', descript=
ion: 'build with location services')
 diff --git a/panels/background/meson.build b/panels/background/meson.bui=
ld
 index 6ced050..df1f808 100644
 --- a/panels/background/meson.build
diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_46.1.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-cont=
rol-center_46.2.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-control-c=
enter_46.1.bb
rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-cen=
ter_46.2.bb
index d88c42531..152e803b5 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
46.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
46.2.bb
@@ -38,7 +38,7 @@ inherit gtk-icon-cache pkgconfig gnomebase gsettings ge=
ttext upstream-version-is
 REQUIRED_DISTRO_FEATURES +=3D "opengl polkit pulseaudio systemd x11"
=20
 SRC_URI +=3D "file://0001-Add-meson-option-to-pass-sysroot.patch"
-SRC_URI[archive.sha256sum] =3D "81792423019deda1d2a074c1ecf6a7e6ef3172c0=
9cbe6f4d7995a4b5dea28312"
+SRC_URI[archive.sha256sum] =3D "6335c6cb8164e574db521fff61cfa3dfaa55f1db=
66ae3bca02750a193e1c4f3d"
=20
 PACKAGECONFIG ??=3D "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'wayland=
', d)}"
 PACKAGECONFIG[cups] =3D ",,cups,cups system-config-printer cups-pk-helpe=
r"
--=20
2.45.1


