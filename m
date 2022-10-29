Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 066EBC433FE
	for <webhook@archiver.kernel.org>; Sat, 29 Oct 2022 15:41:59 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web08.4479.1667058108852863585
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Oct 2022 08:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout12.t-online.de (Postfix) with SMTP id 3C933118F9
	for <openembedded-devel@lists.openembedded.org>; Sat, 29 Oct 2022 17:41:46 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([79.219.224.130]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oonxw-3mkXcQ0; Sat, 29 Oct 2022 17:41:44 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-openembedded][PATCH 2/3] spice-gtk: add recipe
Date: Sat, 29 Oct 2022 17:41:15 +0200
Message-Id: <20221029154116.3128371-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221029154116.3128371-1-f_l_k@t-online.de>
References: <20221029154116.3128371-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1667058104-2508E98D-59EE4DF1/0/0 CLEAN NORMAL
X-TOI-MSGID: 9d23b90e-f29e-45ad-a8ec-85723249791a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Oct 2022 15:41:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99341

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-support/spice/spice-gtk_0.4.1.bb  | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 meta-networking/recipes-support/spice/spice-gtk_0.4.1=
.bb

diff --git a/meta-networking/recipes-support/spice/spice-gtk_0.4.1.bb b/m=
eta-networking/recipes-support/spice/spice-gtk_0.4.1.bb
new file mode 100644
index 000000000..b878a5d5e
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
+	polkit \
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


