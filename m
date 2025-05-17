Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36494C3DA6D
	for <webhook@archiver.kernel.org>; Sat, 17 May 2025 16:51:39 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.15526.1747500690108645067
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 May 2025 09:51:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout07.t-online.de (Postfix) with SMTP id 312282307
	for <openembedded-devel@lists.openembedded.org>; Sat, 17 May 2025 18:51:28 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.172.191]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uGKkw-2hDexF0; Sat, 17 May 2025 18:51:26 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/2] librest: remove recipe
Date: Sat, 17 May 2025 18:51:16 +0200
Message-ID: <20250517165117.11649-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1747500686-49FF14E5-5A2D2C89/0/0 CLEAN NORMAL
X-TOI-MSGID: 63e0cf9d-7399-4c4d-b9d8-1033f02ef2a8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 May 2025 16:51:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117442

make rest PROVIDE librest

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/rest/librest_0.8.1.bb       | 33 -------------------
 meta-gnome/recipes-gnome/rest/rest_0.9.1.bb   |  2 ++
 2 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/rest/librest_0.8.1.bb

diff --git a/meta-gnome/recipes-gnome/rest/librest_0.8.1.bb b/meta-gnome/=
recipes-gnome/rest/librest_0.8.1.bb
deleted file mode 100644
index 63372afa5d..0000000000
--- a/meta-gnome/recipes-gnome/rest/librest_0.8.1.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-SUMMARY =3D "library to access web services that claim to be "RESTful""
-HOMEPAGE =3D "https://wiki.gnome.org/Projects/Librest"
-LICENSE =3D "LGPL-2.1-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b=
0a1"
-
-DEPENDS =3D " \
-    glib-2.0 \
-    glib-2.0-native \
-    libsoup-2.4 \
-    libxml2 \
-"
-
-GNOMEBASEBUILDCLASS =3D "autotools"
-inherit gnomebase gobject-introspection vala pkgconfig gtk-doc
-
-GNOMEBN =3D "rest"
-
-SRC_URI[archive.sha256sum] =3D "0513aad38e5d3cedd4ae3c551634e3be1b9baaa7=
9775e53b2dba9456f15b01c9"
-
-S =3D "${WORKDIR}/${GNOMEBN}-${PV}"
-# * gnome environment requires libsoup build with in gnome PACKAGECONFIG
-# * libsoup-gnome support was removed upstream three years ago [1]
-# [1] https://gitlab.gnome.org/GNOME/librest/commit/8f904a8e2bb38a7bf722=
45cdf2f1ecad17e9a720
-EXTRA_OECONF =3D "--without-gnome"
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
diff --git a/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb b/meta-gnome/rec=
ipes-gnome/rest/rest_0.9.1.bb
index 3b22fdfea2..0483d3070d 100644
--- a/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb
+++ b/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb
@@ -22,3 +22,5 @@ PACKAGECONFIG[examples] =3D "-Dexamples=3Dtrue,-Dexampl=
es=3Dfalse"
 PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse"
=20
 SRC_URI[archive.sha256sum] =3D "9266a5c10ece383e193dfb7ffb07b509cc1f5152=
1ab8dad76af96ed14212c2e3"
+
+PROVIDES =3D "librest"
--=20
2.49.0


