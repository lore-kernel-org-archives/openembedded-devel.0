Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B36D2C4708E
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 23:04:38 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.81052.1669503869909285861
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Nov 2022 15:04:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout10.t-online.de (Postfix) with SMTP id 72AC069B5
	for <openembedded-devel@lists.openembedded.org>; Sun, 27 Nov 2022 00:04:28 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.224.10]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oz4Db-1zml0R0; Sun, 27 Nov 2022 00:04:19 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCHv2 07/14] gnome-shell: update 42.0 -> 43.1
Date: Sun, 27 Nov 2022 00:03:44 +0100
Message-Id: <20221126230351.1431843-7-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221126230351.1431843-1-f_l_k@t-online.de>
References: <20221126230351.1431843-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1669503859-2588998D-69EED29D/0/0 CLEAN NORMAL
X-TOI-MSGID: cca1bf4d-e77f-4e5c-842e-1c5f26216ea3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Nov 2022 23:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99758

- build with gtk4

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...42.0.bb =3D> gnome-shell-extensions_43.1.bb} |  0
 ...s-gjs_path-to-optionally-set-path-to.patch | 27 ++++++++++---------
 ...nome-shell_42.0.bb =3D> gnome-shell_43.1.bb} |  9 ++++---
 3 files changed, 21 insertions(+), 15 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell-extensions_42.0=
.bb =3D> gnome-shell-extensions_43.1.bb} (100%)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell_42.0.bb =3D> gn=
ome-shell_43.1.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_=
42.0.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_43.=
1.bb
similarity index 100%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_4=
2.0.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_43.=
1.bb
diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0001-Introd=
uce-options-gjs_path-to-optionally-set-path-to.patch b/meta-gnome/recipes=
-gnome/gnome-shell/gnome-shell/0001-Introduce-options-gjs_path-to-optiona=
lly-set-path-to.patch
index 4a3662518..b583199e9 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0001-Introduce-opt=
ions-gjs_path-to-optionally-set-path-to.patch
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0001-Introduce-opt=
ions-gjs_path-to-optionally-set-path-to.patch
@@ -1,4 +1,4 @@
-From 3bf597b16e23cd2ce0ee3b05c23b46add5e26cd4 Mon Sep 17 00:00:00 2001
+From 9f11c9e53d91b23113202b40500540242bcabdb0 Mon Sep 17 00:00:00 2001
 From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
 Date: Thu, 28 Oct 2021 18:57:24 +0200
 Subject: [PATCH] Introduce options 'gjs_path' to optionally set path to =
gjs
@@ -6,9 +6,15 @@ MIME-Version: 1.0
 Content-Type: text/plain; charset=3DUTF-8
 Content-Transfer-Encoding: 8bit
=20
+From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
 Upstream-Status: Pending
=20
 Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
+
 ---
  js/dbusServices/meson.build                  | 2 +-
  meson.build                                  | 6 +++++-
@@ -19,10 +25,10 @@ Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gma=
il.com>
  6 files changed, 25 insertions(+), 4 deletions(-)
=20
 diff --git a/js/dbusServices/meson.build b/js/dbusServices/meson.build
-index eb941ed..16efaeb 100644
+index 48b7f89..700b590 100644
 --- a/js/dbusServices/meson.build
 +++ b/js/dbusServices/meson.build
-@@ -27,7 +27,7 @@ foreach service, dir : dbus_services
+@@ -22,7 +22,7 @@ foreach service, dir : dbus_services
 =20
    serviceconf =3D configuration_data()
    serviceconf.set('service', service)
@@ -32,10 +38,10 @@ index eb941ed..16efaeb 100644
 =20
    configure_file(
 diff --git a/meson.build b/meson.build
-index 8d7478f..7c9cc6a 100644
+index 252fb1e..250f722 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -138,7 +138,11 @@ endif
+@@ -125,7 +125,11 @@ endif
 =20
  mutter_typelibdir =3D mutter_dep.get_variable('typelibdir')
  python =3D find_program('python3')
@@ -49,11 +55,11 @@ index 8d7478f..7c9cc6a 100644
  cc =3D meson.get_compiler('c')
 =20
 diff --git a/meson_options.txt b/meson_options.txt
-index f0f2ecf..a45f2e4 100644
+index 46ca8e7..3e9a31f 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
 @@ -45,3 +45,9 @@ option('soup2',
-   value: true,
+   value: false,
    description: 'Use Soup 2.4 instead of Soup 3. Must be in sync with li=
bgweather'
  )
 +
@@ -76,10 +82,10 @@ index ce2a776..8f7bba4 100644
  configure_file(
    input: prgname + '.in',
 diff --git a/subprojects/extensions-app/meson.build b/subprojects/extens=
ions-app/meson.build
-index c260d7a..c5b7554 100644
+index 66a39e9..331dc1d 100644
 --- a/subprojects/extensions-app/meson.build
 +++ b/subprojects/extensions-app/meson.build
-@@ -44,7 +44,12 @@ localedir =3D join_paths(datadir, 'locale')
+@@ -46,7 +46,12 @@ localedir =3D join_paths(datadir, 'locale')
  metainfodir =3D join_paths(datadir, 'metainfo')
  servicedir =3D join_paths(datadir, 'dbus-1', 'services')
 =20
@@ -107,6 +113,3 @@ index ca2eb41..2787785 100644
 +  value: '',
 +  description: 'Instead of searching gjs executable, configure path'
 +)
---=20
-2.34.1
-
diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_42.0.bb b/m=
eta-gnome/recipes-gnome/gnome-shell/gnome-shell_43.1.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell_42.0.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell_43.1.bb
index f54d966c7..81d8dac48 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_42.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_43.1.bb
@@ -10,12 +10,14 @@ DEPENDS =3D " \
     gtk4 \
     mutter \
     evolution-data-server \
-    gcr \
+    gcr4 \
+    geocode-glib \
     gjs \
     gnome-autoar \
     polkit \
     libcroco \
-    startup-notification \
+    libsoup-3.0 \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '', 'startup-noti=
fication', d)} \
     ibus \
     gsettings-desktop-schemas \
 "
@@ -31,7 +33,7 @@ GIR_MESON_OPTION =3D ""
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES +=3D "gobject-introspection-data"
=20
-SRC_URI[archive.sha256sum] =3D "33d404fb3c93b9de42984f0110a2969d6a4a7247=
c27fe7f5e24c67ecfec75094"
+SRC_URI[archive.sha256sum] =3D "df0444765def1bd0afee9617d2b5919bc79b4db8=
6e7e757ac0e1f73748ec1bdc"
 SRC_URI +=3D "file://0001-Introduce-options-gjs_path-to-optionally-set-p=
ath-to.patch"
=20
 PACKAGECONFIG ??=3D "bluetooth nm ${@bb.utils.filter('DISTRO_FEATURES', =
'systemd', d)}"
@@ -44,6 +46,7 @@ EXTRA_OEMESON =3D " \
     -Dextensions-app:gjs_path=3D${bindir}/gjs \
     -Dtests=3Dfalse \
     -Dman=3Dfalse \
+    -Dsoup2=3Dfalse \
 "
=20
 do_install:append() {
--=20
2.34.1


