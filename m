Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21BF6C433F5
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 06:25:23 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web08.3797.1643091922268074235
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jan 2022 22:25:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22,
 mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout12.t-online.de (Postfix) with SMTP id 9CA938F1B
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 07:25:19 +0100 (CET)
Received: from localhost.localdomain ([84.163.43.159]) by fwd82.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nCFGV-2AHdlh0; Tue, 25 Jan 2022 07:25:15 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH] folks: disable tests; fix dependencies
Date: Tue, 25 Jan 2022 07:25:03 +0100
Message-Id: <20220125062503.19073-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1643091915-0000B8A1-77E6A555/0/0 CLEAN NORMAL
X-TOI-MSGID: ab3edc61-0b54-4696-94fa-708bbbbf3de9
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jan 2022 06:25:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95049

disable tests and remove the now unneeded python3 dbusmock module
add libebook dependency to all backends that need it
---
 meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb b/meta=
-gnome/recipes-connectivity/folks/folks_0.15.4.bb
index 7dc72f822..1144ea8fc 100644
--- a/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
+++ b/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
@@ -7,7 +7,6 @@ DEPENDS =3D " \
     glib-2.0 \
     libgee \
     libxml2 \
-    python3-dbusmock-native \
 "
=20
 GNOMEBASEBUILDCLASS =3D "meson"
@@ -16,14 +15,16 @@ GNOMEBASEBUILDCLASS =3D "meson"
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
+PACKAGECONFIG[bluez] =3D "-Dbluez_backend=3Dtrue,-Dbluez_backend=3Dfalse=
,evolution-data-server"
+PACKAGECONFIG[ofono] =3D "-Dofono_backend=3Dtrue,-Dofono_backend=3Dfalse=
,evolution-data-server"
 PACKAGECONFIG[telepathy] =3D "-Dtelepathy_backend=3Dtrue,-Dtelepathy_bac=
kend=3Dfalse,telepathy-glib"
 PACKAGECONFIG[import_tool] =3D "-Dimport_tool=3Dtrue,-Dimport_tool=3Dfal=
se"
 PACKAGECONFIG[inspect_tool] =3D "-Dinspect_tool=3Dtrue,-Dinspect_tool=3D=
false"
=20
-PACKAGECONFIG ??=3D ""
+PACKAGECONFIG ??=3D "telepathy"
=20
 inherit pkgconfig gnomebase gettext gobject-introspection vala features_=
check
=20
--=20
2.25.1


