Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 098D6C38142
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 05:19:40 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.16871.1675228773602834745
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Jan 2023 21:19:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout03.t-online.de (Postfix) with SMTP id 8CA33178EF
	for <openembedded-devel@lists.openembedded.org>; Wed,  1 Feb 2023 06:19:30 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.46.155]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pN5Wp-071IQ50; Wed, 1 Feb 2023 06:19:27 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCHv3] system-config-printer: add recipe
Date: Wed,  1 Feb 2023 06:19:19 +0100
Message-Id: <20230201051919.45856-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1675228767-9EA9F0AF-C351AC67/0/0 CLEAN NORMAL
X-TOI-MSGID: 39e6f8c0-912e-4d16-a10b-1ef3c60551b7
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Feb 2023 05:19:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100897

The OpenPrinting gui for cups configuration

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../system-config-printer_1.5.18.bb           | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-printing/system-config-printer/system=
-config-printer_1.5.18.bb

diff --git a/meta-oe/recipes-printing/system-config-printer/system-config=
-printer_1.5.18.bb b/meta-oe/recipes-printing/system-config-printer/syste=
m-config-printer_1.5.18.bb
new file mode 100644
index 000000000..ba2fbed98
--- /dev/null
+++ b/meta-oe/recipes-printing/system-config-printer/system-config-printe=
r_1.5.18.bb
@@ -0,0 +1,33 @@
+DESCRIPTION =3D "a graphical user interface that allows the user to chan=
ge print settings"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
+
+SRC_URI =3D "git://github.com/OpenPrinting/system-config-printer.git;pro=
tocol=3Dhttps;branch=3Dmaster"
+
+SRCREV =3D "895d3dec50c93bfd4f142bac9bfcc13051bf84cb"
+S =3D "${WORKDIR}/git"
+
+inherit autotools gettext pkgconfig python3native features_check
+
+REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
+
+DEPENDS =3D "cups glib-2.0 libusb xmlto-native intltool-native desktop-f=
ile-utils-native"
+
+do_configure:prepend() {
+    # This file is not provided if fetching from git but required for co=
nfigure
+    touch ${S}/ChangeLog
+}
+
+FILES:${PN} +=3D "${libdir} ${datadir}"
+
+RDEPENDS:${PN} =3D " \
+    dbus-x11 \
+    gtk+3 \
+    libnotify \
+    python3-core \
+    python3-dbus \
+    python3-firewall \
+    python3-pycups \
+    python3-pycurl \
+    python3-pygobject \
+"
--=20
2.34.1


