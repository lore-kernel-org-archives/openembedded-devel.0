Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5702C4321E
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 14:47:25 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.17017.1670251642400815235
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Dec 2022 06:47:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout09.t-online.de (Postfix) with SMTP id 51DA816D6
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 Dec 2022 15:47:20 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.47.205]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p2Cka-1wyh2v0; Mon, 5 Dec 2022 15:47:20 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH] gnome-photos: update dependencies
Date: Mon,  5 Dec 2022 15:47:13 +0100
Message-Id: <20221205144713.144260-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670251640-78BAC9DD-89D54C03/0/0 CLEAN NORMAL
X-TOI-MSGID: 162db12e-c2a2-4dfd-b98b-deae33f35645
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Dec 2022 14:47:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99952

- add PACKAGECONFIG for DOC
-remove references to TMPDIR

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-photos/gnome-photos_43.0.bb         | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_43.0.bb b=
/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_43.0.bb
index c87823ce3..d9f71806c 100644
--- a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_43.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_43.0.bb
@@ -4,19 +4,19 @@ LICENSE =3D "GPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e440=
464"
=20
 DEPENDS =3D " \
+    cairo \
     glib-2.0-native \
     gdk-pixbuf-native \
     librsvg-native \
     gtk+3 \
     babl \
+    dbus \
     gegl \
     geocode-glib \
+    gexiv2 \
     gnome-online-accounts \
-    grilo \
     gsettings-desktop-schemas \
     libdazzle \
-    libgdata \
-    gfbgraph \
     tracker \
     libhandy \
     libportal \
@@ -31,6 +31,9 @@ def gnome_verdir(v):
=20
 REQUIRED_DISTRO_FEATURES =3D "x11"
=20
+PACKAGECONFIG ?=3D ""
+PACKAGECONFIG[doc] =3D "-Dmanuals=3Dtrue,-Dmanuals=3Dfalse,libxslt-nativ=
e docbook-xsl-stylesheets-native"
+
 SRC_URI[archive.sha256sum] =3D "c7ac7458d533f29d955011c74b76224d79ea31bc=
c12e9d6d0ce7b6c3704d08e1"
=20
 do_install:append() {
@@ -44,4 +47,12 @@ FILES:${PN} +=3D " \
     ${datadir}/gnome-shell \
 "
=20
-RRECOMMENDS:${PN} =3D "grilo-plugins"
+do_compile:append() {
+    # glib-mkenums is embedding full paths into this file. There's no
+    # option to it to use a sysroot style variable. So to avoid QA
+    # errors, we sed WORKDIR out and make its includes relative
+    sed -i "s|${B}||" src/photos-enums.h
+    sed -i "s|${B}||" src/photos-enums.c
+    sed -i "s|${B}||" src/photos-enums-gegl.c
+    sed -i "s|${B}||" src/photos-enums-gegl.h
+}
--=20
2.34.1


