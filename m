Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59874C433F5
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 06:34:57 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.3885.1643092496466739404
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jan 2022 22:34:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19,
 mailfrom: f_l_k@t-online.de)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout06.t-online.de (Postfix) with SMTP id 05C6E11141
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 07:34:55 +0100 (CET)
Received: from localhost.localdomain ([84.163.43.159]) by fwd75.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nCFPn-2FRReD0; Tue, 25 Jan 2022 07:34:51 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCHv2] folks: disable tests; fix dependencies
Date: Tue, 25 Jan 2022 07:34:44 +0100
Message-Id: <20220125063444.19265-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1643092491-000184BD-C6EF1E40/0/0 CLEAN NORMAL
X-TOI-MSGID: 7b7aaa18-2ae7-4473-abef-2446871607bd
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jan 2022 06:34:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95051

disable tests and remove the now unneeded python3 dbusmock module
add libebook dependency to all backends that need it

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb b/meta=
-gnome/recipes-connectivity/folks/folks_0.15.4.bb
index 7dc72f822..79f1f5f6a 100644
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
@@ -16,9 +15,11 @@ GNOMEBASEBUILDCLASS =3D "meson"
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
--=20
2.25.1


