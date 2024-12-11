Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72DF0E77180
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 08:07:13 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.5751.1733904428912521932
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Dec 2024 00:07:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout04.t-online.de (Postfix) with SMTP id 562EFA7E
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Dec 2024 09:07:07 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.33.231]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tLHkL-0OXTbX0; Wed, 11 Dec 2024 09:07:01 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 3/4] gnome-shell: update 47.1 -> 47.2
Date: Wed, 11 Dec 2024 09:06:59 +0100
Message-ID: <20241211080700.104771-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241211080700.104771-1-f_l_k@t-online.de>
References: <20241211080700.104771-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1733904421-77FF486F-60710D73/0/0 CLEAN NORMAL
X-TOI-MSGID: 2892d3c6-8e67-49fb-827b-728bd57bfff4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Dec 2024 08:07:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114273

- Remove patch to set gjs path. It would require rework.
  Set the path from a cross-file instead

47.2
=3D=3D=3D=3D
* Fix graphical artifacts in partially-rounded buttons [Sebastian; #7996]
* Fix caret tracking in magnifier [Bilal; !3522]
* Improve accessibility of keyboard backlight quick settings toggle
  [Luk=C3=A1=C5=A1, Florian; !3538, !3545]
* Fix resetting non-caps shift key in on-screen keyboard [Jonas; !3286]
* Misc. bug fixes and cleanups [Florian, Bilal, Automeris, Daniel, Jonas;
  !3520, !3518, !3521, !3529, !3535, !3532, !3540, !3549, !3548, !3539]

Contributors:
  Jonas Dre=C3=9Fler, Bilal Elmoussaoui, Sebastian Keller, Florian M=C3=BC=
llner,
  Automeris naranja, Daniel Rusek, Luk=C3=A1=C5=A1 Tyrychtr

Translators:
  Aefgh Threenine [th], Fabio Tomat [fur], Nathan Follens [nl],
  =D0=9C=D0=B0=D1=80=D0=BA=D0=BE =D0=9A=D0=BE=D1=81=D1=82=D0=B8=D1=9B [sr=
]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...47.1.bb =3D> gnome-shell-extensions_47.2.bb} |   2 +-
 ...s-gjs_path-to-optionally-set-path-to.patch | 124 ------------------
 ...nome-shell_47.1.bb =3D> gnome-shell_47.2.bb} |  15 ++-
 3 files changed, 11 insertions(+), 130 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell-extensions_47.1=
.bb =3D> gnome-shell-extensions_47.2.bb} (84%)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0001=
-Introduce-options-gjs_path-to-optionally-set-path-to.patch
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell_47.1.bb =3D> gn=
ome-shell_47.2.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_=
47.1.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_47.=
2.bb
similarity index 84%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_4=
7.1.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_47.=
2.bb
index a47548fbb..6567704c4 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_47.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_47.2.bb
@@ -6,7 +6,7 @@ inherit gnomebase gettext gsettings features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 polkit systemd pam gobject-introspecti=
on-data"
=20
-SRC_URI[archive.sha256sum] =3D "e9438cc5d39f9875dfd04ea0abb51e5962eaad5c=
20274123243b1612098b3a85"
+SRC_URI[archive.sha256sum] =3D "dd774a0291584917abde88bbc4eccf9244178e3c=
269ce0618d0495177c12652d"
=20
 EXTRA_OEMESON +=3D " \
     -Dextension_set=3Dall \
diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0001-Introd=
uce-options-gjs_path-to-optionally-set-path-to.patch b/meta-gnome/recipes=
-gnome/gnome-shell/gnome-shell/0001-Introduce-options-gjs_path-to-optiona=
lly-set-path-to.patch
deleted file mode 100644
index 8ef0da16f..000000000
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0001-Introduce-opt=
ions-gjs_path-to-optionally-set-path-to.patch
+++ /dev/null
@@ -1,124 +0,0 @@
-From e9835f650d70bf22ad0e5d8c2179aa01b2d18955 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
-Date: Thu, 28 Oct 2021 18:57:24 +0200
-Subject: [PATCH] Introduce options 'gjs_path' to optionally set path to =
gjs
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
----
- js/dbusServices/meson.build                  | 2 +-
- meson.build                                  | 6 +++++-
- meson_options.txt                            | 6 ++++++
- subprojects/extensions-app/js/meson.build    | 2 +-
- subprojects/extensions-app/meson.build       | 7 ++++++-
- subprojects/extensions-app/meson_options.txt | 6 ++++++
- 6 files changed, 25 insertions(+), 4 deletions(-)
-
-diff --git a/js/dbusServices/meson.build b/js/dbusServices/meson.build
-index 48b7f89..700b590 100644
---- a/js/dbusServices/meson.build
-+++ b/js/dbusServices/meson.build
-@@ -22,7 +22,7 @@ foreach service, dir : dbus_services
-=20
-   serviceconf =3D configuration_data()
-   serviceconf.set('service', service)
--  serviceconf.set('gjs', gjs.full_path())
-+  serviceconf.set('gjs', gjs)
-   serviceconf.set('pkgdatadir', pkgdatadir)
-=20
-   configure_file(
-diff --git a/meson.build b/meson.build
-index a6d83b1..2c612a8 100644
---- a/meson.build
-+++ b/meson.build
-@@ -134,7 +134,11 @@ endif
-=20
- mutter_typelibdir =3D mutter_dep.get_variable('typelibdir')
- python =3D find_program('python3')
--gjs =3D find_program('gjs')
-+if get_option('gjs_path') =3D=3D ''
-+  gjs =3D find_program('gjs')
-+else
-+  gjs =3D get_option('gjs_path')
-+endif
-=20
- cc =3D meson.get_compiler('c')
-=20
-diff --git a/meson_options.txt b/meson_options.txt
-index 6e83d92..1bf0ecb 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -45,3 +45,9 @@ option('systemd',
-   value: true,
-   description: 'Enable systemd integration'
- )
-+
-+option('gjs_path',
-+  type: 'string',
-+  value: '',
-+  description: 'Instead of searching gjs executable, configure path'
-+)
-diff --git a/subprojects/extensions-app/js/meson.build b/subprojects/ext=
ensions-app/js/meson.build
-index c9a67f8..91ae887 100644
---- a/subprojects/extensions-app/js/meson.build
-+++ b/subprojects/extensions-app/js/meson.build
-@@ -9,7 +9,7 @@ endif
- launcherconf.set('prefix', prefix)
- launcherconf.set('libdir', libdir)
- launcherconf.set('pkgdatadir', pkgdatadir)
--launcherconf.set('gjs', gjs.full_path())
-+launcherconf.set('gjs', gjs)
-=20
- configure_file(
-   input: prgname + '.in',
-diff --git a/subprojects/extensions-app/meson.build b/subprojects/extens=
ions-app/meson.build
-index 45f391b..d581408 100644
---- a/subprojects/extensions-app/meson.build
-+++ b/subprojects/extensions-app/meson.build
-@@ -47,7 +47,12 @@ metainfodir =3D join_paths(datadir, 'metainfo')
- schemadir =3D join_paths(datadir, 'glib-2.0', 'schemas')
- servicedir =3D join_paths(datadir, 'dbus-1', 'services')
-=20
--gjs =3D find_program('gjs')
-+if get_option('gjs_path') =3D=3D ''
-+  gjs =3D find_program('gjs')
-+else
-+  gjs =3D get_option('gjs_path')
-+endif
-+
- appstream_util =3D find_program('appstream-util', required: false)
- appstreamcli =3D find_program('appstreamcli', required: false)
- desktop_file_validate =3D find_program('desktop-file-validate', require=
d: false)
-diff --git a/subprojects/extensions-app/meson_options.txt b/subprojects/=
extensions-app/meson_options.txt
-index ca2eb41..2787785 100644
---- a/subprojects/extensions-app/meson_options.txt
-+++ b/subprojects/extensions-app/meson_options.txt
-@@ -10,3 +10,9 @@ option('profile',
-   ],
-   value: 'default'
- )
-+
-+option('gjs_path',
-+  type: 'string',
-+  value: '',
-+  description: 'Instead of searching gjs executable, configure path'
-+)
diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_47.1.bb b/m=
eta-gnome/recipes-gnome/gnome-shell/gnome-shell_47.2.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell_47.1.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell_47.2.bb
index 042b3935a..417f0a181 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_47.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_47.2.bb
@@ -33,21 +33,26 @@ GIR_MESON_OPTION =3D ""
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES +=3D "gobject-introspection-data"
=20
-SRC_URI[archive.sha256sum] =3D "b467575f8c159d20557258517f0dd68dfd0147d1=
1b48d97ab8e1f709bc522a63"
-SRC_URI +=3D "file://0001-Introduce-options-gjs_path-to-optionally-set-p=
ath-to.patch"
+SRC_URI[archive.sha256sum] =3D "4184d01a1ab82cb421d1ca2e2bcce0292ceb46c4=
c749e61b0bde4b75004d2e00"
=20
 PACKAGECONFIG ??=3D "bluetooth nm ${@bb.utils.filter('DISTRO_FEATURES', =
'systemd', d)}"
 PACKAGECONFIG[bluetooth] =3D ",,gnome-bluetooth"
 PACKAGECONFIG[nm] =3D "-Dnetworkmanager=3Dtrue, -Dnetworkmanager=3Dfalse=
,networkmanager libsecret,networkmanager"
 PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue, -Dsystemd=3Dfalse, systemd=
"
=20
-EXTRA_OEMESON =3D " \
-    -Dgjs_path=3D${bindir}/gjs \
-    -Dextensions-app:gjs_path=3D${bindir}/gjs \
+EXTRA_OEMESON +=3D " \
     -Dtests=3Dfalse \
     -Dman=3Dfalse \
+    --cross-file=3D${WORKDIR}/meson-${PN}.cross \
 "
=20
+do_write_config:append() {
+    cat >${WORKDIR}/meson-${PN}.cross <<EOF
+[binaries]
+gjs =3D '${bindir}/gjs'
+EOF
+}
+
 do_install:append() {
     # fix shebangs
     for tool in `find ${D}${bindir} -name '*-tool'`; do
--=20
2.47.0


