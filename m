Return-Path: <mail@michael-fitzmayer.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4048EE6400B
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 19:08:00 +0000 (UTC)
Received: from mailserv.regfish.com (mailserv.regfish.com [52.57.101.90])
 by mx.groups.io with SMTP id smtpd.web10.6635.1732216079481963250
 for <Openembedded-devel@lists.openembedded.org>;
 Thu, 21 Nov 2024 11:07:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: michael-fitzmayer.de, ip: 52.57.101.90, mailfrom: mail@michael-fitzmayer.de)
Received: by mailserv.regfish.com (Postfix, from userid 706)
	id 21B8162078; Thu, 21 Nov 2024 19:07:58 +0000 (UTC)
Received: from localhost.localdomain (ip-046-223-148-253.um13.pools.vodafone-ip.de [46.223.148.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: 46272-0001)
	by mailserv.regfish.com (Postfix) with ESMTPSA id 033A86205C;
	Thu, 21 Nov 2024 19:07:57 +0000 (UTC)
From: Michael Fitzmayer <mail@michael-fitzmayer.de>
To: Openembedded-devel@lists.openembedded.org
Cc: Michael Fitzmayer <mail@michael-fitzmayer.de>
Subject: [PATCH] add recipes: canopenterm 1.0.8, pocketpy 2.0.2
Date: Thu, 21 Nov 2024 20:04:42 +0100
Message-Id: <20241121190440.2685646-1-mail@michael-fitzmayer.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 19:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113975

CANopenTerm is a versatile software tool to analyse and configure CANopen
devices.  It extends its capabilities to support other CAN CC protocols,
including SAE J1939 and OBD-II.

pocketpy is a portable Python 3.x interpreter in modern C.  CANopenTerm
depends on it.

Signed-off-by: Michael Fitzmayer <mail@michael-fitzmayer.de>
---
 .../pocketpy/pocketpy_2.0.2.bb                | 25 +++++++++++++++++++
 .../canopenterm/canopenterm_1.0.8.bb          | 23 +++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.2.bb
 create mode 100644 meta-oe/recipes-extended/canopenterm/canopenterm_1.0.=
8.bb

diff --git a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.2.bb b/meta-o=
e/recipes-devtools/pocketpy/pocketpy_2.0.2.bb
new file mode 100644
index 000000000..4bbef91d5
--- /dev/null
+++ b/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.2.bb
@@ -0,0 +1,25 @@
+SUMMARY     =3D "pocketpy"
+DESCRIPTION =3D "A Portable Python 3.x Interpreter in Modern C"
+HOMEPAGE    =3D "https://pocketpy.dev/"
+BUGTRACKER  =3D "https://github.com/pocketpy/pocketpy/issues"
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8cdfa87bc5e09bc07f8cf64135026=
d91"
+
+SRC_URI =3D "git://github.com/pocketpy/pocketpy.git;protocol=3Dhttps;bra=
nch=3Dmain;tag=3Dv${PV}"
+S       =3D "${WORKDIR}/git"
+
+inherit cmake
+
+do_install() {
+    install -d ${D}${libdir}
+    install -m 0644 ${B}/libpocketpy.so ${D}${libdir}/
+    install -d ${D}${includedir}/pocketpy
+    cp -r ${S}/include/* ${D}${includedir}/pocketpy/
+}
+
+PACKAGES =3D "${PN} ${PN}-dev ${PN}-dbg"
+
+FILES:${PN}      =3D "${libdir}/libpocketpy.so"
+FILES:${PN}-dev  =3D "${includedir}/pocketpy"
+FILES:${PN}-dbg +=3D "${libdir}/.debug/libpocketpy.so"
diff --git a/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.8.bb b/=
meta-oe/recipes-extended/canopenterm/canopenterm_1.0.8.bb
new file mode 100644
index 000000000..82295303d
--- /dev/null
+++ b/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.8.bb
@@ -0,0 +1,23 @@
+
+SUMMARY     =3D "CANopenTerm"
+DESCRIPTION =3D "A versatile software tool to analyse and configure CANo=
pen devices"
+HOMEPAGE    =3D "https://canopenterm.de"
+BUGTRACKER  =3D "https://github.com/CANopenTerm/CANopenTerm/issues"
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D10e84ea70e8c3a1fbc462f5424=
806474"
+
+DEPENDS =3D "libinih libsdl2 lua libsocketcan pocketpy readline"
+
+SRC_URI =3D "git://github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhtt=
ps;branch=3Dmain;tag=3Dv${PV}"
+S       =3D "${WORKDIR}/git"
+
+inherit cmake
+
+EXTRA_OECMAKE +=3D "-DBUILD_YOCTO=3DON"
+
+FILES:${PN} +=3D "/usr/bin/CANopenTerm \
+                /usr/share/CANopenTerm \
+               "
+
+RDEPENDS:${PN} =3D "libinih libsdl2 lua libsocketcan pocketpy readline"
--=20
2.39.5


