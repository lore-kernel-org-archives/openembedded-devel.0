Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A46C433EF
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 07:17:10 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web08.4095.1643095028695897211
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jan 2022 23:17:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80,
 mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout01.t-online.de (Postfix) with SMTP id 5C0674B0
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 08:17:06 +0100 (CET)
Received: from localhost.localdomain ([84.163.43.159]) by fwd73.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nCG4f-19HEzR0; Tue, 25 Jan 2022 08:17:05 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCHv3] folks: disable tests; fix dependencies
Date: Tue, 25 Jan 2022 08:16:56 +0100
Message-Id: <20220125071656.76536-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1643095025-0000C4DD-34567160/0/0 CLEAN NORMAL
X-TOI-MSGID: 6d5cc19e-676f-4f7d-a091-829039ae111b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jan 2022 07:17:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95053

disable tests and remove the now unneeded python3 dbusmock module
add libebook dependency to all backends that need it
ofono backend depends on eds backend

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-connectivity/folks/folks_0.15.4.bb      | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb b/meta=
-gnome/recipes-connectivity/folks/folks_0.15.4.bb
index 7dc72f822..dbdc796d1 100644
--- a/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
+++ b/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
@@ -3,11 +3,8 @@ LICENSE =3D "LGPLv2.1"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b=
0a1"
=20
 DEPENDS =3D " \
-    dbus-glib \
     glib-2.0 \
     libgee \
-    libxml2 \
-    python3-dbusmock-native \
 "
=20
 GNOMEBASEBUILDCLASS =3D "meson"
@@ -16,11 +13,13 @@ GNOMEBASEBUILDCLASS =3D "meson"
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
 GIR_MESON_OPTION =3D ""
=20
+EXTRA_OEMESON +=3D "-Dtests=3Dfalse"
+
 PACKAGECONFIG[eds] =3D "-Deds_backend=3Dtrue,-Deds_backend=3Dfalse,evolu=
tion-data-server"
-PACKAGECONFIG[bluez] =3D "-Dbluez_backend=3Dtrue,-Dbluez_backend=3Dfalse=
"
-PACKAGECONFIG[ofono] =3D "-Dofono_backend=3Dtrue,-Dofono_backend=3Dfalse=
"
-PACKAGECONFIG[telepathy] =3D "-Dtelepathy_backend=3Dtrue,-Dtelepathy_bac=
kend=3Dfalse,telepathy-glib"
-PACKAGECONFIG[import_tool] =3D "-Dimport_tool=3Dtrue,-Dimport_tool=3Dfal=
se"
+PACKAGECONFIG[bluez] =3D "-Dbluez_backend=3Dtrue,-Dbluez_backend=3Dfalse=
,evolution-data-server"
+PACKAGECONFIG[ofono] =3D "-Deds_backend=3Dtrue -Dofono_backend=3Dtrue,-D=
ofono_backend=3Dfalse,evolution-data-server"
+PACKAGECONFIG[telepathy] =3D "-Dtelepathy_backend=3Dtrue,-Dtelepathy_bac=
kend=3Dfalse,telepathy-glib dbus-glib"
+PACKAGECONFIG[import_tool] =3D "-Dimport_tool=3Dtrue,-Dimport_tool=3Dfal=
se,libxml2"
 PACKAGECONFIG[inspect_tool] =3D "-Dinspect_tool=3Dtrue,-Dinspect_tool=3D=
false"
=20
 PACKAGECONFIG ??=3D ""
--=20
2.25.1


