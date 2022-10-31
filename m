Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FB2CC38A02
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 06:50:59 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web09.6368.1667199056283169533
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Oct 2022 23:50:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout02.t-online.de (Postfix) with SMTP id 9AC833F49
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 07:50:53 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.229.64]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1opOdG-1AhVgn0; Mon, 31 Oct 2022 07:50:50 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-openembedded][PATCHv2] spice-gtk: add recipe
Date: Mon, 31 Oct 2022 07:50:35 +0100
Message-Id: <20221031065035.2308617-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1667199050-60A0E2DC-BFD47AED/0/0 CLEAN NORMAL
X-TOI-MSGID: 3b3981b9-794a-4ff1-ba36-e438dcc4d01c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 06:50:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99361

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-support/spice/spice-gtk_0.4.1.bb  | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 meta-networking/recipes-support/spice/spice-gtk_0.4.1=
.bb

diff --git a/meta-networking/recipes-support/spice/spice-gtk_0.4.1.bb b/m=
eta-networking/recipes-support/spice/spice-gtk_0.4.1.bb
new file mode 100644
index 000000000..58089c0a2
--- /dev/null
+++ b/meta-networking/recipes-support/spice/spice-gtk_0.4.1.bb
@@ -0,0 +1,43 @@
+SUMMARY =3D "A Gtk client and libraries for SPICE remote desktop servers=
."
+HOMEPAGE =3D "https://spice-space.org"
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
+
+SRCREV =3D "74e673d7c3d9cd281d85c691fbc520107066da01"
+
+SRC_URI =3D "gitsm://gitlab.freedesktop.org/spice/spice-gtk.git;protocol=
=3Dhttps;branch=3Dmaster"
+
+S =3D "${WORKDIR}/git"
+
+DEPENDS =3D " \
+	${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland wayland-nat=
ive wayland-protocols', '', d)} \
+	acl \
+	cyrus-sasl \
+	gstreamer1.0 \
+	gstreamer1.0-plugins-base \
+	gstreamer1.0-vaapi \
+	gtk+3 \
+	jpeg \
+	json-glib \
+	libcap-ng \
+	libepoxy \
+	libopus \
+	libusb1 \
+	lz4 \
+	pixman \
+	python3-pyparsing-native \
+	python3-six-native \
+	spice-protocol \
+	usbredir \
+	usbutils \
+	zlib \
+"
+
+RDEPENDS:${PN} =3D "python3-pyparsing python3-six"
+
+inherit meson pkgconfig vala gobject-introspection
+
+EXTRA_OEMESON =3D "-Dpie=3Dtrue -Dvapi=3Denabled -Dintrospection=3Denabl=
ed"
+
+FILES:${PN} +=3D "${datadir}"
--=20
2.34.1


