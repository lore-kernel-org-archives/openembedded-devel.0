Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F381C433EF
	for <webhook@archiver.kernel.org>; Sun, 23 Jan 2022 12:03:59 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web12.8650.1642939438086567472
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Jan 2022 04:03:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80,
 mailfrom: f_l_k@t-online.de)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout01.t-online.de (Postfix) with SMTP id 132263ACD
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Jan 2022 13:03:56 +0100 (CET)
Received: from localhost.localdomain ([84.163.32.167]) by fwd81.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nBbb9-0sWdGb0; Sun, 23 Jan 2022 13:03:55 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCHv3 1/2] folks: initial add recipe
Date: Sun, 23 Jan 2022 13:03:25 +0100
Message-Id: <20220123120326.37863-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1642939435-0000BD0E-2D255D2B/0/0 CLEAN NORMAL
X-TOI-MSGID: 2a9d406f-1a09-452a-9e19-75c12d8ced03
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Jan 2022 12:03:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95012

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../folks/folks_0.15.4.bb                     | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb

diff --git a/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb b/meta=
-gnome/recipes-connectivity/folks/folks_0.15.4.bb
new file mode 100644
index 000000000..7dc72f822
--- /dev/null
+++ b/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
@@ -0,0 +1,31 @@
+SUMMARY =3D "Folks is a contact aggregation library."
+LICENSE =3D "LGPLv2.1"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b=
0a1"
+
+DEPENDS =3D " \
+    dbus-glib \
+    glib-2.0 \
+    libgee \
+    libxml2 \
+    python3-dbusmock-native \
+"
+
+GNOMEBASEBUILDCLASS =3D "meson"
+
+# gobject-introspection is mandatory and cannot be configured
+REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
+GIR_MESON_OPTION =3D ""
+
+PACKAGECONFIG[eds] =3D "-Deds_backend=3Dtrue,-Deds_backend=3Dfalse,evolu=
tion-data-server"
+PACKAGECONFIG[bluez] =3D "-Dbluez_backend=3Dtrue,-Dbluez_backend=3Dfalse=
"
+PACKAGECONFIG[ofono] =3D "-Dofono_backend=3Dtrue,-Dofono_backend=3Dfalse=
"
+PACKAGECONFIG[telepathy] =3D "-Dtelepathy_backend=3Dtrue,-Dtelepathy_bac=
kend=3Dfalse,telepathy-glib"
+PACKAGECONFIG[import_tool] =3D "-Dimport_tool=3Dtrue,-Dimport_tool=3Dfal=
se"
+PACKAGECONFIG[inspect_tool] =3D "-Dinspect_tool=3Dtrue,-Dinspect_tool=3D=
false"
+
+PACKAGECONFIG ??=3D ""
+
+inherit pkgconfig gnomebase gettext gobject-introspection vala features_=
check
+
+SRC_URI[archive.sha256sum] =3D "e71099afc9e88fad4e757ae134bc3fd63e12b901=
ad62b0ed5536afb79124af5f"
+
--=20
2.25.1


