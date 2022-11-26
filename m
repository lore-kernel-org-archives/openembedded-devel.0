Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE399C43217
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 13:16:45 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.69786.1669468596426809887
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Nov 2022 05:16:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout01.t-online.de (Postfix) with SMTP id BA864D21
	for <openembedded-devel@lists.openembedded.org>; Sat, 26 Nov 2022 14:16:34 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.224.10]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oyv2l-28mQBm0; Sat, 26 Nov 2022 14:16:31 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 2/4] libgweather: update 4.0.0 -> 4.2.0
Date: Sat, 26 Nov 2022 14:16:10 +0100
Message-Id: <20221126131612.1435270-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221126131612.1435270-1-f_l_k@t-online.de>
References: <20221126131612.1435270-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1669468591-ED7EC7E2-B988B1B0/0/0 CLEAN NORMAL
X-TOI-MSGID: 9b28b71f-baec-43aa-9bda-d51a495c89f5
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Nov 2022 13:16:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99747

- use gtk4
- build with libsoup-3.0

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...w-building-gir-in-cross-environments.patch | 21 +++++++------------
 ...eather4_4.0.0.bb =3D> libgweather4_4.2.0.bb} |  6 +++---
 2 files changed, 10 insertions(+), 17 deletions(-)
 rename meta-gnome/recipes-gnome/libgweather/{libgweather4_4.0.0.bb =3D> =
libgweather4_4.2.0.bb} (82%)

diff --git a/meta-gnome/recipes-gnome/libgweather/libgweather4/0001-Allow=
-building-gir-in-cross-environments.patch b/meta-gnome/recipes-gnome/libg=
weather/libgweather4/0001-Allow-building-gir-in-cross-environments.patch
index 6c6a643ed..3a075de65 100644
--- a/meta-gnome/recipes-gnome/libgweather/libgweather4/0001-Allow-buildi=
ng-gir-in-cross-environments.patch
+++ b/meta-gnome/recipes-gnome/libgweather/libgweather4/0001-Allow-buildi=
ng-gir-in-cross-environments.patch
@@ -11,23 +11,16 @@ For us this works perfectly fine
 Upstream-Status: Inappropriate [OE-specific]
=20
 Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
----
- libgweather/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
=20
-diff --git a/libgweather/meson.build b/libgweather/meson.build
-index 08311af..ef554f2 100644
---- a/libgweather/meson.build
-+++ b/libgweather/meson.build
-@@ -208,7 +208,7 @@ lib_libgweather =3D library('gweather-4',
- )
+--- a/meson.build	2022-09-18 14:48:53.000000000 +0200
++++ b/meson.build	2022-11-26 14:05:13.302487232 +0100
+@@ -51,7 +51,7 @@
+ gen_locations_variant =3D find_program('build-aux/meson/gen_locations_v=
ariant.py')
 =20
  g_ir_scanner =3D find_program('g-ir-scanner', required: get_option('int=
rospection'))
 -build_gir =3D get_option('introspection') and g_ir_scanner.found() and =
not meson.is_cross_build()
 +build_gir =3D get_option('introspection') and g_ir_scanner.found()
+ build_docs =3D get_option('gtk_doc') and build_gir
 =20
- enable_vala =3D get_option('enable_vala')
- vapigen =3D find_program('vapigen', required: enable_vala =3D=3D 'true'=
)
---=20
-2.34.1
-
+ schemas_srcdir =3D meson.project_source_root() / 'schemas'
diff --git a/meta-gnome/recipes-gnome/libgweather/libgweather4_4.0.0.bb b=
/meta-gnome/recipes-gnome/libgweather/libgweather4_4.2.0.bb
similarity index 82%
rename from meta-gnome/recipes-gnome/libgweather/libgweather4_4.0.0.bb
rename to meta-gnome/recipes-gnome/libgweather/libgweather4_4.2.0.bb
index 708d27a61..34d259ff3 100644
--- a/meta-gnome/recipes-gnome/libgweather/libgweather4_4.0.0.bb
+++ b/meta-gnome/recipes-gnome/libgweather/libgweather4_4.2.0.bb
@@ -10,15 +10,15 @@ S =3D "${WORKDIR}/${GNOMEBN}-${PV}"
 inherit gnomebase gsettings gobject-introspection gettext gtk-doc vala
=20
 SRC_URI +=3D "file://0001-Allow-building-gir-in-cross-environments.patch=
"
-SRC_URI[archive.sha256sum] =3D "440d44801b6f72b48c676e5e37f9109cfee1394f=
d74cc92725e1b1ba4fae834c"
+SRC_URI[archive.sha256sum] =3D "af8a812da0d8976a000e1d62572c256086a81732=
3fbf35b066dbfdd8d2ca6203"
=20
 GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
 DEPENDS =3D " \
     geocode-glib \
-    gtk+3 \
+    gtk4 \
     json-glib \
-    libsoup-2.4 \
+    libsoup-3.0 \
     python3-pygobject-native \
 "
=20
--=20
2.34.1


