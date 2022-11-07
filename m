Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F31C433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 19:05:22 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.1936.1667847915043808377
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 11:05:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout04.t-online.de (Postfix) with SMTP id 1E7F49CE
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 20:05:13 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.226.160]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1os7Qm-28ACOJ0; Mon, 7 Nov 2022 20:05:12 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 3/5] rest: upgrade 0.8.1 -> 0.9.0
Date: Mon,  7 Nov 2022 20:04:52 +0100
Message-Id: <20221107190454.39581-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221107190454.39581-1-f_l_k@t-online.de>
References: <20221107190454.39581-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1667847912-60A0E2DC-339F5D6E/0/0 CLEAN NORMAL
X-TOI-MSGID: f075e0a7-d57d-4c24-9dfd-df3e109a0a10
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 19:05:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99479

---
 meta-gnome/recipes-gnome/rest/rest_0.8.1.bb | 33 ---------------------
 meta-gnome/recipes-gnome/rest/rest_0.9.0.bb | 22 ++++++++++++++
 2 files changed, 22 insertions(+), 33 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/rest/rest_0.8.1.bb
 create mode 100644 meta-gnome/recipes-gnome/rest/rest_0.9.0.bb

diff --git a/meta-gnome/recipes-gnome/rest/rest_0.8.1.bb b/meta-gnome/rec=
ipes-gnome/rest/rest_0.8.1.bb
deleted file mode 100644
index f1c9915c0..000000000
--- a/meta-gnome/recipes-gnome/rest/rest_0.8.1.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-SUMMARY =3D "library to access web services that claim to be "RESTful""
-HOMEPAGE =3D "https://wiki.gnome.org/Projects/Librest"
-LICENSE =3D "LGPL-2.1-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b=
0a1"
-
-GNOMEBASEBUILDCLASS =3D "autotools"
-
-DEPENDS =3D " \
-    libxml2-native \
-    glib-2.0-native \
-    glib-2.0 \
-    libsoup-2.4 \
-"
-
-inherit gnomebase gobject-introspection gtk-doc vala
-
-PV .=3D "+git${SRCPV}"
-SRCREV =3D "7b46065dea860ef09861f4d70124728b8270c8b7"
-SRC_URI =3D "git://gitlab.gnome.org/GNOME/librest;protocol=3Dhttps;branc=
h=3Dmaster \
-    file://0001-Use-GUri-instead-of-SoupURI.patch \
-    file://0002-Port-to-libsoup3.patch \
-"
-S =3D "${WORKDIR}/git"
-
-do_configure:prepend() {
-    # rest expects introspection.m4 at custom location (see aclocal.m4).
-    cp -f ${STAGING_DIR_TARGET}/${datadir}/aclocal/introspection.m4 ${S}=
/build
-}
-
-do_compile:prepend() {
-    export GIR_EXTRA_LIBS_PATH=3D"${B}/rest/.libs"
-}
-
diff --git a/meta-gnome/recipes-gnome/rest/rest_0.9.0.bb b/meta-gnome/rec=
ipes-gnome/rest/rest_0.9.0.bb
new file mode 100644
index 000000000..6fb208abd
--- /dev/null
+++ b/meta-gnome/recipes-gnome/rest/rest_0.9.0.bb
@@ -0,0 +1,22 @@
+SUMMARY =3D "library to access web services that claim to be "RESTful""
+HOMEPAGE =3D "https://wiki.gnome.org/Projects/Librest"
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b=
0a1"
+
+GNOMEBASEBUILDCLASS =3D "meson"
+
+DEPENDS =3D " \
+    gi-docgen \
+    gi-docgen-native \
+    glib-2.0 \
+    glib-2.0-native \
+    json-glib \
+    libsoup-3.0 \
+    libxml2-native \
+"
+
+inherit gnomebase gobject-introspection vala pkgconfig
+
+EXTRA_OEMESON =3D "-Dsoup2=3Dfalse"
+
+SRC_URI[archive.sha256sum] =3D "85b2bc9341128139539b53ee53f0533310bc9639=
2fd645863a040410b81ebe66"
--=20
2.34.1


