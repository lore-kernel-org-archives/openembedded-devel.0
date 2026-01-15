Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12AFED3CCB7
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 07:21:31 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30609.1768461680721122693
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jan 2026 23:21:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout02.t-online.de (Postfix) with SMTP id D6752E788
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 08:20:51 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.47.171]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vgHeu-48gKSv0; Thu, 15 Jan 2026 08:20:44 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH] libxfce4windowing: switch to meson buildsystem
Date: Thu, 15 Jan 2026 08:20:35 +0100
Message-ID: <20260115072035.466298-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1768461644-D2FFAA17-9005D731/0/0 CLEAN NORMAL
X-TOI-MSGID: 2db85d75-2e09-40d3-8cf3-e2a968559443
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 07:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123490

Motivation for this is to get vapi files created which are required to
e.g. build the budgie desktop

-Add PACKAGECONFIG for x11 and build depending on DISTRO_FEATURES
-Build vala by default

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libxfce4windowing_4.20.4.bb                | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4=
.20.4.bb b/meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.2=
0.4.bb
index 5791d48895..a3f1dae3da 100644
--- a/meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.4.b=
b
+++ b/meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.4.b=
b
@@ -6,20 +6,16 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D435ed639f84d=
4585d93824e7da3d85da"
=20
 DEPENDS =3D "xfce4-dev-tools-native libdisplay-info libwnck3"
=20
+XFCEBASEBUILDCLASS =3D "meson"
 SRC_URI[sha256sum] =3D "db467f9ac4bac8f1c4e82667902841fc0957af835c29603d=
6659a57440b6f8cb"
=20
-inherit features_check gobject-introspection gtk-doc xfce
+inherit features_check gobject-introspection gtk-doc xfce vala
=20
 # Currently, X11 is fully supported. Wayland is partially supported
-REQUIRED_DISTRO_FEATURES =3D "x11"
+ANY_OF_DISTRO_FEATURES =3D "wayland x11"
=20
-PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)=
}"
-PACKAGECONFIG[wayland] =3D "--enable-wayland, --disable-wayland, wayland=
-native"
+PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11'=
, d)}"
+PACKAGECONFIG[x11] =3D "-Dwayland=3Denabled, -Dwayland=3Ddisabled, wayla=
nd-native"
+PACKAGECONFIG[wayland] =3D "-Dwayland=3Denabled, -Dwayland=3Ddisabled, w=
ayland-native"
=20
-EXTRA_OECONF =3D "--enable-x11 \
-                WAYLAND_SCANNER=3D${STAGING_BINDIR_NATIVE}/wayland-scann=
er \
-                "
-
-do_compile:prepend() {
-    export GIR_EXTRA_LIBS_PATH=3D${B}/libxfce4windowing/.libs
-}
+GTKDOC_MESON_OPTION =3D "gtk-doc"
--=20
2.52.0


