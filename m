Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 446A1C433EF
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 18:13:49 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web08.710.1643134428311627270
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 10:13:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21,
 mailfrom: f_l_k@t-online.de)
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout10.t-online.de (Postfix) with SMTP id 8845B1A820
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 19:13:46 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.43.159]) by fwd70.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nCQKA-3h2uiv0; Tue, 25 Jan 2022 19:13:46 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH] folks: make some dependencies optional
Date: Tue, 25 Jan 2022 19:13:39 +0100
Message-Id: <20220125181339.114315-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1643134426-00004E7B-D0B29484/0/0 CLEAN NORMAL
X-TOI-MSGID: 02bdc208-5783-43df-95ee-072679b6de72
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jan 2022 18:13:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95082

make some dependencies optional
add libebook dependency to all backends that need it
ofono backend depends on eds backend

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-connectivity/folks/folks_0.15.4.bb    | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb b/meta=
-gnome/recipes-connectivity/folks/folks_0.15.4.bb
index 7dc72f822..d331dfdb5 100644
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
@@ -17,15 +14,15 @@ REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-d=
ata"
 GIR_MESON_OPTION =3D ""
=20
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
+PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse,python3-dbusmoc=
k-native"
=20
-PACKAGECONFIG ??=3D ""
+PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 't=
ests','', d)}"
=20
 inherit pkgconfig gnomebase gettext gobject-introspection vala features_=
check
=20
 SRC_URI[archive.sha256sum] =3D "e71099afc9e88fad4e757ae134bc3fd63e12b901=
ad62b0ed5536afb79124af5f"
-
--=20
2.25.1


