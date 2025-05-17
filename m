Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34810C2D0CD
	for <webhook@archiver.kernel.org>; Sat, 17 May 2025 16:51:39 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.15270.1747500690144917373
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 May 2025 09:51:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout07.t-online.de (Postfix) with SMTP id 32D742392
	for <openembedded-devel@lists.openembedded.org>; Sat, 17 May 2025 18:51:28 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.172.191]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uGKkw-2hDexG0; Sat, 17 May 2025 18:51:26 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/2] gfbgraph: remove recipe
Date: Sat, 17 May 2025 18:51:17 +0200
Message-ID: <20250517165117.11649-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250517165117.11649-1-f_l_k@t-online.de>
References: <20250517165117.11649-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1747500686-A77FC4E5-72268F42/0/0 CLEAN NORMAL
X-TOI-MSGID: 2ff809d1-4ef7-4679-8f51-329e1f5544e3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 May 2025 16:51:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117443

The project was archived and uses deprecated libsoup-2

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/gfbgraph/gfbgraph_0.2.5.bb  | 26 -------------------
 1 file changed, 26 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.5.bb

diff --git a/meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.5.bb b/meta-g=
nome/recipes-gnome/gfbgraph/gfbgraph_0.2.5.bb
deleted file mode 100644
index 9b1a02bb09..0000000000
--- a/meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.5.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY =3D "A GObject library for Facebook Graph API"
-SECTION =3D "x11/gnome"
-LICENSE =3D "LGPL-2.1-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5804fe91d3294da4ac47c02b454bb=
c8a"
-
-DEPENDS =3D " \
-    glib-2.0 \
-    json-glib \
-    librest \
-    libsoup-2.4 \
-    gnome-online-accounts \
-"
-GNOMEBASEBUILDCLASS =3D "autotools"
-inherit gnomebase gtk-doc gobject-introspection pkgconfig features_check
-
-# for gnome-online-accounts
-REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
-
-#SRC_URI +=3D " file://0001-Update-rest-requirement-to-rest-1.0.patch"
-SRC_URI[archive.sha256sum] =3D "9cb381b3f78ba1136df97af3f06e3b11dcc2ab33=
9ac08f74eda0f8057d6603e3"
-
-do_install:append() {
-    # they install all the autotools files (NEWS AUTHORS..) to /usr/doc =
which
-    # is not a standard path exactly
-    rm -rf ${D}${prefix}/doc
-}
--=20
2.49.0


