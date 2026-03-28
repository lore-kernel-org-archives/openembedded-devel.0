Return-Path: <mail@michael-fitzmayer.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 021AB10D1487
	for <webhook@archiver.kernel.org>; Sat, 28 Mar 2026 21:19:49 +0000 (UTC)
Received: from mailserv.regfish.com (mailserv.regfish.com [52.57.101.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19265.1774732783811205726
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Mar 2026 14:19:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: michael-fitzmayer.de, ip: 52.57.101.90, mailfrom: mail@michael-fitzmayer.de)
Received: by mailserv.regfish.com (Postfix, from userid 706)
	id D50EF60782; Sat, 28 Mar 2026 21:19:41 +0000 (UTC)
Received: from DESKTOP-B84SDL6.localdomain (ipservice-092-209-208-070.092.209.pools.vodafone-ip.de [92.209.208.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: 46272-0001)
	by mailserv.regfish.com (Postfix) with ESMTPSA id B1F2C6076F;
	Sat, 28 Mar 2026 21:19:41 +0000 (UTC)
From: Michael Fitzmayer <mail@michael-fitzmayer.de>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Fitzmayer <mail@michael-fitzmayer.de>
Subject: [meta-oe][PATCH] Add recipe: isocline 1.0.9
Date: Sat, 28 Mar 2026 22:19:38 +0100
Message-ID: <20260328211938.2297408-1-mail@michael-fitzmayer.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Mar 2026 21:19:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125801

Isocline is a pure C library that can be used as an alternative to the GN=
U readline library.

Signed-off-by: Michael Fitzmayer <mail@michael-fitzmayer.de>
---
 .../isocline/isocline_1.0.9.bb                | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/isocline/isocline_1.0.9.bb

diff --git a/meta-oe/recipes-devtools/isocline/isocline_1.0.9.bb b/meta-o=
e/recipes-devtools/isocline/isocline_1.0.9.bb
new file mode 100644
index 0000000000..2afc4500df
--- /dev/null
+++ b/meta-oe/recipes-devtools/isocline/isocline_1.0.9.bb
@@ -0,0 +1,28 @@
+SUMMARY =3D "Isocline is a portable GNU readline alternative."
+DESCRIPTION =3D "Isocline is a pure C library that can be used \
+              as an alternative to the GNU readline library. \
+              "
+HOMEPAGE =3D "https://github.com/daanx/isocline"
+BUGTRACKER =3D "https://github.com/daanx/isocline/issues"
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8d05469c537534c7405c82c81a526=
bcd"
+
+SRC_URI =3D "git://github.com/daanx/isocline.git;protocol=3Dhttps;branch=
=3Dmain;tag=3Dv${PV}"
+SRCREV =3D "74d34bc453f5b91f1f8d8ded2840e1553623d135"
+
+
+inherit cmake
+
+CFLAGS +=3D "-fPIC"
+
+do_install() {
+    install -d ${D}${libdir}
+    install -m 0644 ${B}/libisocline.a ${D}${libdir}/
+    install -d ${D}${includedir}
+    cp ${S}/include/isocline.h ${D}${includedir}/
+}
+
+FILES:${PN}-dev =3D "${libdir}/libisocline.a"
+FILES:${PN}-dev =3D "${includedir}/isocline.h"
+FILES:${PN}-dbg +=3D "${libdir}/.debug/libisocline.a"
--=20
2.47.3


