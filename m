Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36B1CC10F1A
	for <webhook@archiver.kernel.org>; Sun, 12 May 2024 09:48:42 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.32075.1715507317456392362
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 May 2024 02:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout09.t-online.de (Postfix) with SMTP id 7BD99418DB
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 May 2024 11:48:35 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.32.90]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1s65op-2AJq9x0; Sun, 12 May 2024 11:48:35 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHv2] malcontent: add recipe
Date: Sun, 12 May 2024 11:49:00 +0200
Message-ID: <20240512094900.94946-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1715507315-3F18FC7B-7F62E432/0/0 CLEAN NORMAL
X-TOI-MSGID: 9bccb801-29fb-49d1-89eb-db3ddbd3506e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 May 2024 09:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110317

malcontent is an optional dependency for flatpak and gnome-software

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../malcontent/malcontent_0.12.0.bb           | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-gnome/malcontent/malcontent_0.12.0.bb

diff --git a/meta-oe/recipes-gnome/malcontent/malcontent_0.12.0.bb b/meta=
-oe/recipes-gnome/malcontent/malcontent_0.12.0.bb
new file mode 100644
index 000000000..a21241901
--- /dev/null
+++ b/meta-oe/recipes-gnome/malcontent/malcontent_0.12.0.bb
@@ -0,0 +1,31 @@
+SUMMARY =3D "malcontent implements support for restricting the type of c=
ontent."
+HOMEPAGE =3D "https://gitlab.freedesktop.org/pwithnall/malcontent"
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
+
+SRC_URI =3D "git://gitlab.freedesktop.org/pwithnall/malcontent.git;proto=
col=3Dhttps;branch=3Dmain"
+
+S =3D "${WORKDIR}/git"
+SRCREV =3D "3ba80995bb25b7aeda7e21d547f9e39ff9a81736"
+
+DEPENDS =3D " \
+	accountsservice \
+	glib-2.0 \
+	glib-testing \
+	dbus \
+	desktop-file-utils-native \
+	itstool-native \
+	libpam \
+	polkit \
+"
+
+GTKIC_VERSION =3D "4"
+inherit  meson pkgconfig gtk-icon-cache gobject-introspection-data gette=
xt features_check
+
+REQUIRED_DISTRO_FEATURES =3D "pam polkit"
+
+# If building with ui, we run into circular dependency flatpak <-> malco=
ntent
+PACKAGECONFIG ?=3D ""
+PACKAGECONFIG[ui] =3D "-Dui=3Denabled,-Dui=3Ddisabled,appstream flatpak =
libadwaita gtk4"
+
+FILES:${PN} +=3D "${libdir} ${datadir}"
--=20
2.44.0


