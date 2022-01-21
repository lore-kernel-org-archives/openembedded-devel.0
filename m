Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FB48C433F5
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 13:33:18 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web09.11707.1642771997575496969
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 05:33:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84,
 mailfrom: f_l_k@t-online.de)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout09.t-online.de (Postfix) with SMTP id 4592017275
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 14:33:16 +0100 (CET)
Received: from localhost.localdomain ([84.163.45.199]) by fwd85.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nAu2W-1rotAT0; Fri, 21 Jan 2022 14:33:16 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCHv2 5/5] folks: initial add recipe
Date: Fri, 21 Jan 2022 14:32:55 +0100
Message-Id: <20220121133255.2464068-5-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220121133255.2464068-1-f_l_k@t-online.de>
References: <20220121133255.2464068-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1642771996-00014AB5-0C02BF31/0/0 CLEAN NORMAL
X-TOI-MSGID: 4bb2ece4-8f93-4c63-a540-694c53dac08a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jan 2022 13:33:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94975

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../folks/folks_0.15.4.bb                     | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb

diff --git a/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb b/meta=
-gnome/recipes-connectivity/folks/folks_0.15.4.bb
new file mode 100644
index 000000000..3e57fbb0d
--- /dev/null
+++ b/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
@@ -0,0 +1,29 @@
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


