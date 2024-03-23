Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30616C6FD1F
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 14:40:29 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.9995.1711204828646111912
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Mar 2024 07:40:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout02.t-online.de (Postfix) with SMTP id B8BCC109CF
	for <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 15:40:26 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.167.162]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ro2Xp-3iirD70; Sat, 23 Mar 2024 15:40:25 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] gnome-themes-extra: build with gtk+3
Date: Sat, 23 Mar 2024 15:40:47 +0100
Message-ID: <20240323144047.1149242-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1711204825-FAFFA94C-83208020/0/0 CLEAN NORMAL
X-TOI-MSGID: ac91f054-04cb-4da0-972f-8d419c286680
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 14:40:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109552

- disable gtk2
- update dependencies

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/gnome-themes/gnome-themes-extra_3.28.bb  | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-gnome/gnome-themes/gnome-themes-extra_3.28.b=
b b/meta-oe/recipes-gnome/gnome-themes/gnome-themes-extra_3.28.bb
index c85366894..3456383c3 100644
--- a/meta-oe/recipes-gnome/gnome-themes/gnome-themes-extra_3.28.bb
+++ b/meta-oe/recipes-gnome/gnome-themes/gnome-themes-extra_3.28.bb
@@ -7,18 +7,19 @@ LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2d5025d4aa3495befef8f17206a5b=
0a1"
=20
 GNOMEBASEBUILDCLASS =3D "autotools"
+GTKIC_VERSION =3D '3'
 inherit gnomebase gettext gtk-icon-cache upstream-version-is-even featur=
es_check
=20
-ANY_OF_DISTRO_FEATURES =3D "${GTK2DISTROFEATURES}"
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
-DEPENDS +=3D "intltool-native gtk+"
+DEPENDS +=3D "intltool-native gtk+3 librsvg"
=20
 # PV is 3.28 not 3.28.0, so the gnomebase SRC_URI isn't right.
 SRC_URI =3D "${GNOME_MIRROR}/${BPN}/${PV}/${BPN}-${PV}.tar.xz;name=3Darc=
hive"
 SRC_URI[archive.md5sum] =3D "f9f2c6c521948da427f702372e16f826"
 SRC_URI[archive.sha256sum] =3D "7c4ba0bff001f06d8983cfc105adaac42df1d126=
7a2591798a780bac557a5819"
=20
-EXTRA_OECONF =3D "--disable-gtk3-engine"
+EXTRA_OECONF =3D "--disable-gtk2-engine"
=20
 do_install:append() {
         # Only building Adwaita, remove highcontrast files
--=20
2.44.0


