Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2235CD13DF
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 21:52:17 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.4030.1695073930996708130
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Sep 2023 14:52:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout06.t-online.de (Postfix) with SMTP id 56BC654F8
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 23:52:08 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.161.214]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qiM9z-3qxV240; Mon, 18 Sep 2023 23:52:03 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 04/18] gnome-shell: upgrade 44.3 -> 45.0
Date: Mon, 18 Sep 2023 23:51:39 +0200
Message-ID: <20230918215156.1920452-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918215156.1920452-1-f_l_k@t-online.de>
References: <20230918215156.1920452-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1695073923-47FFE5E3-92D71F4E/0/0 CLEAN NORMAL
X-TOI-MSGID: 9ac02e70-9655-4e6d-9ff0-ebf532afb6ee
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 21:52:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104933

- refresh patches
- remove soup2 option as soup2 support was removed

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...s-gjs_path-to-optionally-set-path-to.patch | 23 +++++++++++--------
 ...nome-shell_44.3.bb =3D> gnome-shell_45.0.bb} |  3 +--
 2 files changed, 15 insertions(+), 11 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell_44.3.bb =3D> gn=
ome-shell_45.0.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0001-Introd=
uce-options-gjs_path-to-optionally-set-path-to.patch b/meta-gnome/recipes=
-gnome/gnome-shell/gnome-shell/0001-Introduce-options-gjs_path-to-optiona=
lly-set-path-to.patch
index b583199e9..e8c7e79aa 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0001-Introduce-opt=
ions-gjs_path-to-optionally-set-path-to.patch
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0001-Introduce-opt=
ions-gjs_path-to-optionally-set-path-to.patch
@@ -1,4 +1,4 @@
-From 9f11c9e53d91b23113202b40500540242bcabdb0 Mon Sep 17 00:00:00 2001
+From b2710a880b366201f07752e87d35bb52ea69cbbe Mon Sep 17 00:00:00 2001
 From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
 Date: Thu, 28 Oct 2021 18:57:24 +0200
 Subject: [PATCH] Introduce options 'gjs_path' to optionally set path to =
gjs
@@ -11,6 +11,11 @@ MIME-Version: 1.0
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
@@ -38,10 +43,10 @@ index 48b7f89..700b590 100644
 =20
    configure_file(
 diff --git a/meson.build b/meson.build
-index 252fb1e..250f722 100644
+index 70ba711..f0ab158 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -125,7 +125,11 @@ endif
+@@ -135,7 +135,11 @@ endif
 =20
  mutter_typelibdir =3D mutter_dep.get_variable('typelibdir')
  python =3D find_program('python3')
@@ -55,12 +60,12 @@ index 252fb1e..250f722 100644
  cc =3D meson.get_compiler('c')
 =20
 diff --git a/meson_options.txt b/meson_options.txt
-index 46ca8e7..3e9a31f 100644
+index 6e83d92..1bf0ecb 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
-@@ -45,3 +45,9 @@ option('soup2',
-   value: false,
-   description: 'Use Soup 2.4 instead of Soup 3. Must be in sync with li=
bgweather'
+@@ -45,3 +45,9 @@ option('systemd',
+   value: true,
+   description: 'Enable systemd integration'
  )
 +
 +option('gjs_path',
@@ -69,7 +74,7 @@ index 46ca8e7..3e9a31f 100644
 +  description: 'Instead of searching gjs executable, configure path'
 +)
 diff --git a/subprojects/extensions-app/js/meson.build b/subprojects/ext=
ensions-app/js/meson.build
-index ce2a776..8f7bba4 100644
+index c9a67f8..91ae887 100644
 --- a/subprojects/extensions-app/js/meson.build
 +++ b/subprojects/extensions-app/js/meson.build
 @@ -9,7 +9,7 @@ endif
@@ -82,7 +87,7 @@ index ce2a776..8f7bba4 100644
  configure_file(
    input: prgname + '.in',
 diff --git a/subprojects/extensions-app/meson.build b/subprojects/extens=
ions-app/meson.build
-index 66a39e9..331dc1d 100644
+index 6c9639e..3fe1ce0 100644
 --- a/subprojects/extensions-app/meson.build
 +++ b/subprojects/extensions-app/meson.build
 @@ -46,7 +46,12 @@ localedir =3D join_paths(datadir, 'locale')
diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_44.3.bb b/m=
eta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.0.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell_44.3.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.0.bb
index e1aa051ef..66c05a1ff 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_44.3.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.0.bb
@@ -32,7 +32,7 @@ GIR_MESON_OPTION =3D ""
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES +=3D "gobject-introspection-data"
=20
-SRC_URI[archive.sha256sum] =3D "55694b71c2ee4eaef60d93428003f2eaa4cf0018=
6848f5e36b45cfe506fc31bf"
+SRC_URI[archive.sha256sum] =3D "3cabe40bdd4e379c7082b39ffa45b8bef5c9cf86=
408fb0d836e1571c443217cd"
 SRC_URI +=3D "file://0001-Introduce-options-gjs_path-to-optionally-set-p=
ath-to.patch"
=20
 PACKAGECONFIG ??=3D "bluetooth nm ${@bb.utils.filter('DISTRO_FEATURES', =
'systemd', d)}"
@@ -45,7 +45,6 @@ EXTRA_OEMESON =3D " \
     -Dextensions-app:gjs_path=3D${bindir}/gjs \
     -Dtests=3Dfalse \
     -Dman=3Dfalse \
-    -Dsoup2=3Dfalse \
 "
=20
 do_install:append() {
--=20
2.41.0


