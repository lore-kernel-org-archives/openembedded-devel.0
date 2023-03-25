Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E3A1C77B72
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 08:03:20 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.17405.1679731394356898605
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Mar 2023 01:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout04.t-online.de (Postfix) with SMTP id 4A93B1CBEC
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 09:03:12 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.174.49]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pfyrn-0RoPhW0; Sat, 25 Mar 2023 09:03:11 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 14/32] gnome-online-accounts: update 3.46.0 -> 3.48.0
Date: Sat, 25 Mar 2023 09:02:38 +0100
Message-Id: <20230325080256.923752-14-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325080256.923752-1-f_l_k@t-online.de>
References: <20230325080256.923752-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679731391-85D6DC08-BD9EC06A/0/0 CLEAN NORMAL
X-TOI-MSGID: 1aadca18-424a-44ef-a715-7603666756cc
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 08:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101726

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...se-the-appropriate-dependency-object.patch | 35 -------------------
 ...6.0.bb =3D> gnome-online-accounts_3.48.0.bb} | 12 +++----
 2 files changed, 5 insertions(+), 42 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-online-accounts/gnome-=
online-accounts/0001-build-Use-the-appropriate-dependency-object.patch
 rename meta-gnome/recipes-gnome/gnome-online-accounts/{gnome-online-acco=
unts_3.46.0.bb =3D> gnome-online-accounts_3.48.0.bb} (69%)

diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-=
accounts/0001-build-Use-the-appropriate-dependency-object.patch b/meta-gn=
ome/recipes-gnome/gnome-online-accounts/gnome-online-accounts/0001-build-=
Use-the-appropriate-dependency-object.patch
deleted file mode 100644
index 838ca1a7d..000000000
--- a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-account=
s/0001-build-Use-the-appropriate-dependency-object.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 06240574626eb21af37cf7dde5bf81e892dff467 Mon Sep 17 00:00:00 2001
-From: Emmanuele Bassi <ebassi@gnome.org>
-Date: Wed, 5 Oct 2022 22:15:37 +0100
-Subject: [PATCH] build: Use the appropriate dependency object
-
-Just using `link_with` will not ensure that the GOA web extension shared
-module is properly built against libgoa-backend and libgoa; the
-generated headers must be transitively available by the time we build
-the shared module.
-
-Fixes: #226
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gnome-online-a=
ccounts/-/commit/fe86bfb0271735c8130367c46536b08dad5c20d8]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/goabackend/meson.build | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/src/goabackend/meson.build b/src/goabackend/meson.build
-index f5382b3..865b2d2 100644
---- a/src/goabackend/meson.build
-+++ b/src/goabackend/meson.build
-@@ -157,9 +157,8 @@ libgoa_web_extension =3D shared_module(
-   'goawebextension',
-   libgoawebextension_sources,
-   include_directories: common_incs + [goa_inc],
--  dependencies: deps,
-+  dependencies: [deps, libgoa_backend_dep],
-   c_args: cflags,
--  link_with: libgoa_backend,
-   install: true,
-   install_dir: join_paths(goa_pkglibdir, 'web-extensions')
- )
---=20
-2.39.0
-
diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-=
accounts_3.46.0.bb b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome=
-online-accounts_3.48.0.bb
similarity index 69%
rename from meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-a=
ccounts_3.46.0.bb
rename to meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-acc=
ounts_3.48.0.bb
index ce02a507d..ddc039ec8 100644
--- a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-account=
s_3.46.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-account=
s_3.48.0.bb
@@ -6,22 +6,20 @@ GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase gsettings gobject-introspection gtk-icon-cache vala fe=
atures_check
=20
-DEPENDS =3D "gtk+3 gtk+3-native gdk-pixbuf dbus json-glib libxml2 webkit=
gtk glib-2.0 rest libsecret"
+DEPENDS =3D "gdk-pixbuf dbus glib-2.0"
=20
-SRC_URI +=3D "file://0001-build-Use-the-appropriate-dependency-object.pa=
tch"
-SRC_URI[archive.sha256sum] =3D "5e7859ce4858a6b99d3995ed70527d66e297bb90=
bbf75ec8780fe9da22c1fcaa"
+SRC_URI[archive.sha256sum] =3D "418bb9fcffdbd72a98205ad365137617fc1e3551=
a54de74f6a98d45d266175bf"
=20
-PACKAGECONFIG_SOUP ?=3D "soup3"
-PACKAGECONFIG ?=3D "kerberos owncloud lastfm google windows_live ${PACKA=
GECONFIG_SOUP}"
+PACKAGECONFIG ?=3D "goabackend kerberos owncloud lastfm google windows_l=
ive"
=20
+# goabackend requires webkitgtk to be built with gtk+3 and gcr3
+PACKAGECONFIG[goabackend] =3D "-Dgoabackend=3Dtrue,-Dgoabackend=3Dfalse,=
gtk+3 gtk+3-native json-glib libxml2 libsoup rest libsecret webkitgtk-4"
 PACKAGECONFIG[kerberos] =3D "-Dkerberos=3Dtrue, -Dkerberos=3Dfalse,krb5 =
gcr3"
 PACKAGECONFIG[exchange] =3D "-Dexchange=3Dtrue, -Dexchange=3Dfalse"
 PACKAGECONFIG[google] =3D "-Dgoogle=3Dtrue, -Dgoogle=3Dfalse"
 PACKAGECONFIG[owncloud] =3D "-Downcloud=3Dtrue, -Downcloud=3Dfalse"
 PACKAGECONFIG[windows_live] =3D "-Dwindows_live=3Dtrue, -Dwindows_live=3D=
false"
 PACKAGECONFIG[lastfm] =3D "-Dlastfm=3Dtrue, -Dlastfm=3Dfalse"
-PACKAGECONFIG[soup2] =3D ",,libsoup-2.4,,,soup3"
-PACKAGECONFIG[soup3] =3D ",,libsoup-3.0,,,soup2"
=20
 FILES:${PN} +=3D " \
     ${datadir}/dbus-1 \
--=20
2.34.1


