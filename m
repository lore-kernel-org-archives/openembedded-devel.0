Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61745C54EBE
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 13:08:11 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.44276.1673183282256530719
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Jan 2023 05:08:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout03.t-online.de (Postfix) with SMTP id B745B25C33
	for <openembedded-devel@lists.openembedded.org>; Sun,  8 Jan 2023 14:07:56 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.228.124]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pEVP2-43c1Z50; Sun, 8 Jan 2023 14:07:56 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 3/5] libdecor: import recipe
Date: Sun,  8 Jan 2023 14:07:41 +0100
Message-Id: <20230108130743.983639-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108130743.983639-1-f_l_k@t-online.de>
References: <20230108130743.983639-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1673183276-F2FF5ECF-639C45DF/0/0 CLEAN NORMAL
X-TOI-MSGID: 874ab0b5-028d-4f0c-b6f2-fa8c65c3efbc
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 13:08:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100443

libdecor is a window decoration library that is required for shells that
require client side decoration. It is e.g. useful to get window decoratio=
n
for libsdl apps if running under weston or gnome-shell.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libdecor/libdecor_0.1.1.bb                | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libdecor/libdecor_0.1.1.bb

diff --git a/meta-oe/recipes-graphics/libdecor/libdecor_0.1.1.bb b/meta-o=
e/recipes-graphics/libdecor/libdecor_0.1.1.bb
new file mode 100644
index 000000000..4e396d83e
--- /dev/null
+++ b/meta-oe/recipes-graphics/libdecor/libdecor_0.1.1.bb
@@ -0,0 +1,29 @@
+SUMMARY =3D "libdecor - A client-side decorations library for Wayland cl=
ients"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7ae2be7fb1637141840314b51970a=
9f7"
+
+SRC_URI =3D "git://gitlab.gnome.org/jadahl/libdecor.git;protocol=3Dhttps=
;branch=3Dmaster"
+
+DEPENDS =3D " \
+	cairo \
+	pango \
+	wayland \
+	wayland-native \
+	wayland-protocols \
+"
+
+S =3D "${WORKDIR}/git"
+SRCREV =3D "e87dcfdaf83f332fa83b43c804fcf93c151ff0f5"
+
+PACKAGECONFIG ?=3D "dbus ${@bb.utils.filter('DISTRO_FEATURES', 'gtk3 ope=
ngl', d)}"
+
+PACKAGECONFIG[dbus] =3D "-Ddbus=3Denabled,-Ddbus=3Ddisabled,dbus"
+PACKAGECONFIG[demo] =3D "-Ddemo=3Dtrue,-Ddemo=3Dfalse,virtual/libegl lib=
xkbcommon"
+PACKAGECONFIG[gtk3] =3D "-Dgtk=3Denabled,-Dgtk=3Ddisabled,gtk+3"
+PACKAGECONFIG[opengl] =3D ",,virtual/libgl"
+
+inherit meson pkgconfig
+
+EXTRA_OEMESON +=3D "--buildtype release"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


