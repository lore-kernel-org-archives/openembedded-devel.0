Return-Path: <mail@michael-fitzmayer.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB9B4E6400D
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 20:29:30 +0000 (UTC)
Received: from mailserv.regfish.com (mailserv.regfish.com [52.57.101.90])
 by mx.groups.io with SMTP id smtpd.web10.8443.1732220963499043447
 for <Openembedded-devel@lists.openembedded.org>;
 Thu, 21 Nov 2024 12:29:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: michael-fitzmayer.de, ip: 52.57.101.90, mailfrom: mail@michael-fitzmayer.de)
Received: by mailserv.regfish.com (Postfix, from userid 706)
	id B872762048; Thu, 21 Nov 2024 20:29:21 +0000 (UTC)
Received: from localhost.localdomain (ip-046-223-148-253.um13.pools.vodafone-ip.de [46.223.148.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: 46272-0001)
	by mailserv.regfish.com (Postfix) with ESMTPSA id 93EC3618CA;
	Thu, 21 Nov 2024 20:29:21 +0000 (UTC)
From: Michael Fitzmayer <mail@michael-fitzmayer.de>
To: Openembedded-devel@lists.openembedded.org
Cc: Michael Fitzmayer <mail@michael-fitzmayer.de>
Subject: [PATCH 1/2] Add recipe: pocketpy 2.0.2
Date: Thu, 21 Nov 2024 21:28:35 +0100
Message-Id: <20241121202835.2703871-1-mail@michael-fitzmayer.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <CAMKF1sqJ15FYzLHUbFfB1mRq6tbH=gzhwAn07kx85TQobsFX0A@mail.gmail.com>
References: <CAMKF1sqJ15FYzLHUbFfB1mRq6tbH=gzhwAn07kx85TQobsFX0A@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 20:29:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113977

pocketpy is a portable Python 3.x Interpreter in Modern C.

It aims to be an alternative to lua for game scripting, with elegant
syntax, powerful features and competitive performance.  pkpy is
extremely easy to embed via a single header file pocketpy.h, without
external dependencies.

Signed-off-by: Michael Fitzmayer <mail@michael-fitzmayer.de>
---
 .../pocketpy/pocketpy_2.0.2.bb                | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.2.bb

diff --git a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.2.bb b/meta-o=
e/recipes-devtools/pocketpy/pocketpy_2.0.2.bb
new file mode 100644
index 000000000..28ac67d8d
--- /dev/null
+++ b/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.2.bb
@@ -0,0 +1,32 @@
+SUMMARY =3D "A Portable Python 3.x Interpreter in Modern C."
+DESCRIPTION =3D "pkpy is a lightweight(~15K LOC) Python 3.x \
+              interpreter for game scripting, written in C11. \
+              It aims to be an alternative to lua for game \
+              scripting, with elegant syntax, powerful features \
+              and competitive performance.  pkpy is extremely \
+              easy to embed via a single header file pocketpy.h, \
+              without external dependencies. \
+              "
+HOMEPAGE =3D "https://pocketpy.dev/"
+BUGTRACKER =3D "https://github.com/pocketpy/pocketpy/issues"
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8cdfa87bc5e09bc07f8cf64135026=
d91"
+
+SRC_URI =3D "git://github.com/pocketpy/pocketpy.git;protocol=3Dhttps;bra=
nch=3Dmain"
+SRCREV =3D "b5a443efa11e7d6576025d1b9a397ead9e9260c9"
+
+S =3D "${WORKDIR}/git"
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
+FILES:${PN} =3D "${libdir}/libpocketpy.so"
+FILES:${PN}-dev =3D "${includedir}/pocketpy"
+FILES:${PN}-dbg +=3D "${libdir}/.debug/libpocketpy.so"
--=20
2.39.5


