Return-Path: <mail@michael-fitzmayer.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 575F110D1488
	for <webhook@archiver.kernel.org>; Sat, 28 Mar 2026 21:30:59 +0000 (UTC)
Received: from mailserv.regfish.com (mailserv.regfish.com [52.57.101.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19424.1774733450903585710
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Mar 2026 14:30:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: michael-fitzmayer.de, ip: 52.57.101.90, mailfrom: mail@michael-fitzmayer.de)
Received: by mailserv.regfish.com (Postfix, from userid 706)
	id 3B67A6072A; Sat, 28 Mar 2026 21:30:49 +0000 (UTC)
Received: from DESKTOP-B84SDL6.localdomain (ipservice-092-209-208-070.092.209.pools.vodafone-ip.de [92.209.208.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: 46272-0001)
	by mailserv.regfish.com (Postfix) with ESMTPSA id 1855F60622;
	Sat, 28 Mar 2026 21:30:49 +0000 (UTC)
From: Michael Fitzmayer <mail@michael-fitzmayer.de>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Fitzmayer <mail@michael-fitzmayer.de>
Subject: [meta-oe][PATCH] Add recipe: canvenient 1.00
Date: Sat, 28 Mar 2026 22:30:46 +0100
Message-ID: <20260328213046.2297947-1-mail@michael-fitzmayer.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Mar 2026 21:30:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125802

CANvenient is an abstraction layer for multiple CAN APIs on Windows and L=
inux. It provides a unified
interface for CAN communication, allowing developers to write code that i=
s portable across different
platforms and CAN hardware.

Signed-off-by: Michael Fitzmayer <mail@michael-fitzmayer.de>
---
 .../canvenient/canvenient_1.00.bb             | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/canvenient/canvenient_1.00.b=
b

diff --git a/meta-oe/recipes-devtools/canvenient/canvenient_1.00.bb b/met=
a-oe/recipes-devtools/canvenient/canvenient_1.00.bb
new file mode 100644
index 0000000000..a4d5a212c1
--- /dev/null
+++ b/meta-oe/recipes-devtools/canvenient/canvenient_1.00.bb
@@ -0,0 +1,41 @@
+
+SUMMARY =3D "CANvenient is an abstraction layer for multiple CAN APIs \
+          on Windows and Linux. \
+          "
+DESCRIPTION =3D "CANvenient is an abstraction layer for multiple CAN API=
s on \
+              Windows and Linux. It provides a unified interface for CAN=
 \
+              communication, allowing developers to write code that is \
+              portable across different platforms and CAN hardware. \
+              "
+HOMEPAGE =3D "https://canopenterm.de/canvenient"
+BUGTRACKER =3D "https://github.com/CANopenTerm/CANvenient/issues"
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Dbd2edc721b4a0289efe949bdbe=
7dda79"
+
+DEPENDS =3D "libsocketcan"
+
+SRC_URI =3D "git://github.com/CANopenTerm/CANvenient.git;protocol=3Dhttp=
s;branch=3Dmain"
+
+SRCREV  =3D "abdfc48b316b3644ec1d0d225c45fd0fd8b07dd7"
+
+inherit cmake ptest
+
+
+do_install:append() {
+    install -d ${D}${includedir}
+    install -d ${D}${libdir}
+
+    install -m 0644 ${S}/include/CANvenient.h ${D}${includedir}/
+    install -m 0755 ${B}/libCANvenient.so.1.0.0 ${D}${libdir}/
+
+    ln -sf libCANvenient.so.1.0.0 ${D}${libdir}/libCANvenient.so.1
+    ln -sf libCANvenient.so.1.0.0 ${D}${libdir}/libCANvenient.so
+}
+
+FILES:${PN} +=3D "${libdir}/libCANvenient.so ${libdir}/libCANvenient.so.=
*"
+FILES:${PN}-dev +=3D "${includedir}"
+
+SOLIBS =3D ".so"
+
+RDEPENDS:${PN} =3D "libsocketcan"
--=20
2.47.3


