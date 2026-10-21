Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8057.1792577264967223672
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 03:07:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=mUReL9cg;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout02.t-online.de (Postfix) with SMTP id 54F6CE964
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 12:07:40 +0200 (CEST)
Received: from localhost.localdomain ([84.163.40.237]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xJTEM-0cELaN0; Wed, 21 Oct 2026 12:07:34 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 20/26] gthumb: upgrade 3.12.10 -> 4.0
Date: Wed, 21 Oct 2026 12:07:08 +0200
Message-ID: <20261021100717.11068-20-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021100717.11068-1-f_l_k@t-online.de>
References: <20261021100717.11068-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1792577254-B99FD903-2B784CAE/0/0 CLEAN NORMAL
X-TOI-MSGID: 21d90cb8-01b4-453c-994d-b1b74a88c21d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1792577260; i=f_l_k@t-online.de;
	bh=dQLP/A2BhZLEa9OTV724iDofkesocvChvB6SHP3u0fw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=mUReL9cgh3JVmQ8nSxTsFqdC/JB+5vISiM6RGdP7sEPnA7FlHSsLsGXhm+WW9nIqH
	 nyKJT7R83G1VHzTlUGSYtZDzks4xiSawNC3iMFkAa9+kl1yhRL2l6zx4bR2zZnJek9
	 InwRYBrqq4lLSgCHrxpWbkxsQ284Aaxrj+ogINzhhVE0+bEPgxaqtxPzWkarRCO/eS
	 QVNGWXpAiS5u0Ed+40RTHuQxS5vd4JpWoLvCmCoRt3+QBnnehNyU1PV75lZb8mOZVs
	 jTkpbb6AzXDVMfb1LPPqjrSDnVujDaAMWjzoqupJeVA26VJ9nvy8FhUuTg8bL1pWgg
	 RDp9GpCH4GAQA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 10:07:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131255
Content-Type: text/plain; charset="utf-8"

gthumb 4 is ported to GTK 4, libadwaita and Vala. Update DEPENDS (gtk4,
libadwaita, libportal, gstreamer, lcms and libpng are required now; bison=
,
json-glib and gsettings-desktop-schemas are gone) and the PACKAGECONFIG
options to the new meson options. The help moved out of the tarball, so
gnome-help and itstool are dropped. GTK 4 needs opengl.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gthumb_3.12.10.bb =3D> gthumb_4.0.bb}      | 34 ++++++++++++-------
 1 file changed, 21 insertions(+), 13 deletions(-)
 rename meta-gnome/recipes-gnome/gthumb/{gthumb_3.12.10.bb =3D> gthumb_4.=
0.bb} (53%)

diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.10.bb b/meta-gno=
me/recipes-gnome/gthumb/gthumb_4.0.bb
similarity index 53%
rename from meta-gnome/recipes-gnome/gthumb/gthumb_3.12.10.bb
rename to meta-gnome/recipes-gnome/gthumb/gthumb_4.0.bb
index 58aefbff2e..f534d5f1f4 100644
--- a/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.10.bb
+++ b/meta-gnome/recipes-gnome/gthumb/gthumb_4.0.bb
@@ -5,26 +5,34 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf3365=
9b29e73d4adb9f9f6552"
 DEPENDS =3D " \
     glib-2.0 \
     glib-2.0-native \
-    bison-native \
     desktop-file-utils-native \
     exiv2 \
-    gtk+3 \
-    gsettings-desktop-schemas \
-    zlib \
+    gstreamer1.0 \
+    gstreamer1.0-plugins-base \
+    gtk4 \
     jpeg \
-    json-glib \
+    lcms \
+    libadwaita \
+    libpng \
+    libportal \
+    zlib \
 "
=20
-PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'c=
olord', '', d)} gstreamer lcms libjxl libraw librsvg libwebp"
-PACKAGECONFIG[gstreamer] =3D "-Dgstreamer=3Dtrue,-Dgstreamer=3Dfalse,gst=
reamer1.0 gstreamer1.0-plugins-base"
-PACKAGECONFIG[libwebp] =3D "-Dlibwebp=3Dtrue,-Dlibwebp=3Dfalse,libwebp"
-PACKAGECONFIG[libjxl] =3D "-Dlibjxl=3Dtrue,-Dlibjxl=3Dfalse,libjxl"
-PACKAGECONFIG[lcms] =3D "-Dlcms2=3Dtrue,-Dlcms2=3Dfalse,lcms"
+PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'c=
olord', '', d)} libgif libjxl libraw librsvg libtiff libwebp"
+
 PACKAGECONFIG[colord] =3D "-Dcolord=3Dtrue,-Dcolord=3Dfalse,colord"
-PACKAGECONFIG[librsvg] =3D "-Dlibrsvg=3Dtrue,-Dlibrsvg=3Dfalse,librsvg"
+PACKAGECONFIG[libgif] =3D "-Dlibgif=3Dtrue,-Dlibgif=3Dfalse,giflib"
+PACKAGECONFIG[libheif] =3D "-Dlibheif=3Dtrue,-Dlibheif=3Dfalse,libheif"
+PACKAGECONFIG[libjxl] =3D "-Dlibjxl=3Dtrue,-Dlibjxl=3Dfalse,libjxl"
 PACKAGECONFIG[libraw] =3D "-Dlibraw=3Dtrue,-Dlibraw=3Dfalse,libraw"
+PACKAGECONFIG[librsvg] =3D "-Dlibrsvg=3Dtrue,-Dlibrsvg=3Dfalse,librsvg"
+PACKAGECONFIG[libtiff] =3D "-Dlibtiff=3Dtrue,-Dlibtiff=3Dfalse,tiff"
+PACKAGECONFIG[libwebp] =3D "-Dlibwebp=3Dtrue,-Dlibwebp=3Dfalse,libwebp"
+
+inherit gnomebase gsettings gtk-icon-cache mime-xdg vala features_check
+
+REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
-inherit gnomebase gnome-help gsettings itstool gtk-icon-cache mime-xdg
-SRC_URI[archive.sha256sum] =3D "3222344653cd6fb5d7981b73951ae3d90c414f74=
220a8b1c8665b25574284c75"
+SRC_URI[archive.sha256sum] =3D "a24aaa72b5637f49097dedc9c141a33615da770d=
029315f3285ebf2156cf7b61"
=20
 FILES:${PN} +=3D "${datadir}/metainfo"
--=20
2.56.0

