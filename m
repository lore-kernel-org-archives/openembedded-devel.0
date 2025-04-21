Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B914C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 09:49:06 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.11909.1745228945587827951
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Apr 2025 02:49:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout01.t-online.de (Postfix) with SMTP id 063EEF7
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 11:48:40 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.37.191]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u6nlX-0UaYJZ0; Mon, 21 Apr 2025 11:48:39 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 5/9] libsdl2-net: update anb build with cmake
Date: Mon, 21 Apr 2025 11:48:28 +0200
Message-ID: <20250421094832.67450-5-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250421094832.67450-1-f_l_k@t-online.de>
References: <20250421094832.67450-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1745228919-48FF694A-8F915CBC/0/0 CLEAN NORMAL
X-TOI-MSGID: 9ef9a120-873b-4499-ab25-adeef39e52ad
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 09:49:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116999

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libsdl/libsdl2-net_2.0.1.bb               | 26 -------------------
 .../libsdl/libsdl2-net_2.2.0.bb               | 17 ++++++++++++
 2 files changed, 17 insertions(+), 26 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/libsdl/libsdl2-net_2.0.1.bb
 create mode 100644 meta-oe/recipes-graphics/libsdl/libsdl2-net_2.2.0.bb

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-net_2.0.1.bb b/meta-=
oe/recipes-graphics/libsdl/libsdl2-net_2.0.1.bb
deleted file mode 100644
index d1f8905769..0000000000
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-net_2.0.1.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-DESCRIPTION =3D "Simple DirectMedia Layer networking library."
-SECTION =3D "libs/network"
-LICENSE =3D "Zlib"
-LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3Dfe9d52a78585a652247768755=
10ed127"
-
-SRC_URI =3D " \
-  https://www.libsdl.org/projects/SDL_net/release/SDL2_net-${PV}.tar.gz =
\
-"
-S =3D "${WORKDIR}/SDL2_net-${PV}"
-
-inherit autotools pkgconfig
-
-DEPENDS =3D "libsdl2"
-
-SRC_URI[sha256sum] =3D "15ce8a7e5a23dafe8177c8df6e6c79b6749a03fff1e81967=
42d3571657609d21"
-
-do_configure:prepend() {
-    # create dummy files which autotools consider as mandatory
-    touch ${S}/NEWS ${S}/README ${S}/AUTHORS ${S}/ChangeLog =20
-
-    # Remove old libtool macros.
-    for macro in libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltver=
sion.m4; do
-        echo ${S}/acinclude/macro
-        rm -f ${S}/acinclude/$macro
-    done
-}
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-net_2.2.0.bb b/meta-=
oe/recipes-graphics/libsdl/libsdl2-net_2.2.0.bb
new file mode 100644
index 0000000000..25a7dad86b
--- /dev/null
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-net_2.2.0.bb
@@ -0,0 +1,17 @@
+DESCRIPTION =3D "Simple DirectMedia Layer networking library."
+SECTION =3D "libs/network"
+LICENSE =3D "Zlib"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D68a088513da90254b2fbe664f=
42af315"
+
+SRC_URI =3D " \
+  https://www.libsdl.org/projects/SDL_net/release/SDL2_net-${PV}.tar.gz =
\
+"
+S =3D "${WORKDIR}/SDL2_net-${PV}"
+
+inherit cmake pkgconfig
+
+DEPENDS =3D "libsdl2"
+
+SRC_URI[sha256sum] =3D "4e4a891988316271974ff4e9585ed1ef729a123d22c08bd4=
73129179dc857feb"
+
+FILES:${PN} +=3D "${datadir}/licenses"
--=20
2.49.0


