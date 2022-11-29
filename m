Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADF33C4332F
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 06:57:45 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.143167.1669705060827951990
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Nov 2022 22:57:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout01.t-online.de (Postfix) with SMTP id E31D56EC6
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Nov 2022 07:57:09 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.228.163]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ozuYA-3ii2450; Tue, 29 Nov 2022 07:57:02 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 5/7] tepl: update 6.0.0 -> 6.2.0
Date: Tue, 29 Nov 2022 07:56:41 +0100
Message-Id: <20221129065643.82373-5-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221129065643.82373-1-f_l_k@t-online.de>
References: <20221129065643.82373-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1669705022-08E92417-99A8548B/0/0 CLEAN NORMAL
X-TOI-MSGID: 217db79e-067f-40ae-9255-f5fd015454ce
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Nov 2022 06:57:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99843

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../tepl/{tepl_6.00.0.bb =3D> tepl_6.2.0.bb}         | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)
 rename meta-gnome/recipes-gnome/tepl/{tepl_6.00.0.bb =3D> tepl_6.2.0.bb}=
 (60%)

diff --git a/meta-gnome/recipes-gnome/tepl/tepl_6.00.0.bb b/meta-gnome/re=
cipes-gnome/tepl/tepl_6.2.0.bb
similarity index 60%
rename from meta-gnome/recipes-gnome/tepl/tepl_6.00.0.bb
rename to meta-gnome/recipes-gnome/tepl/tepl_6.2.0.bb
index 66de215cf..8173b6d31 100644
--- a/meta-gnome/recipes-gnome/tepl/tepl_6.00.0.bb
+++ b/meta-gnome/recipes-gnome/tepl/tepl_6.2.0.bb
@@ -3,21 +3,25 @@ LICENSE =3D "LGPL-3.0-or-later"
 LIC_FILES_CHKSUM =3D "file://LICENSES/LGPL-3.0-or-later.txt;md5=3Dc51d3e=
ef3be114124d11349ca0d7e117"
=20
 DEPENDS =3D " \
-    glib-2.0-native \
+    gsettings-desktop-schemas \
+    glib-2.0 \
     gtk+3 \
     gtksourceview4 \
     amtk \
     libxml2 \
     uchardet \
+    gtk-doc-native \
+    libxslt-native \
+    docbook-xsl-stylesheets-native \
 "
=20
-GNOMEBASEBUILDCLASS =3D "meson"
+inherit meson gobject-introspection gettext features_check pkgconfig
=20
-inherit gnomebase gobject-introspection gettext features_check
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
-
-SRC_URI[archive.sha256sum] =3D "a86397a895dca9c0de7a5ccb063bda8f7ef691cc=
cb950ce2cfdee367903e7a63"
+SRC_URI =3D "git://gitlab.gnome.org/swilmet/tepl;protocol=3Dhttps;branch=
=3Dmain"
+SRCREV =3D "34973a0d48ba5a0dd0a776c66bfc0c3f65682d9c"
+S =3D "${WORKDIR}/git"
=20
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES +=3D "gobject-introspection-data"
--=20
2.34.1


