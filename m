Return-Path: <mail@michael-fitzmayer.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE106C43458
	for <webhook@archiver.kernel.org>; Sat,  4 Jul 2026 05:35:16 +0000 (UTC)
Received: from mailserv.regfish.com (mailserv.regfish.com [52.57.101.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.107509.1783143315713849641
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2026 22:35:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: michael-fitzmayer.de, ip: 52.57.101.90, mailfrom: mail@michael-fitzmayer.de)
Received: by mailserv.regfish.com (Postfix, from userid 706)
	id 9DFED60771; Sat,  4 Jul 2026 05:35:13 +0000 (UTC)
Received: from debian.mupf.local (ipservice-092-208-170-243.092.208.pools.vodafone-ip.de [92.208.170.243])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: 46272-0001)
	by mailserv.regfish.com (Postfix) with ESMTPSA id 807B2606DA;
	Sat,  4 Jul 2026 05:35:13 +0000 (UTC)
From: Michael Fitzmayer <mail@michael-fitzmayer.de>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Fitzmayer <mail@michael-fitzmayer.de>
Subject: [meta-oe][PATCH] canvenient: update to version 1.02
Date: Sat,  4 Jul 2026 07:35:11 +0200
Message-ID: <20260704053511.647800-1-mail@michael-fitzmayer.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Jul 2026 05:35:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128017

- New API function: can_find_interfaces_mask()
- License-Update: update year in copyright

Signed-off-by: Michael Fitzmayer <mail@michael-fitzmayer.de>
---
 .../{canvenient_1.01.bb =3D> canvenient_1.02.bb}     | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-devtools/canvenient/{canvenient_1.01.bb =3D> canv=
enient_1.02.bb} (73%)

diff --git a/meta-oe/recipes-devtools/canvenient/canvenient_1.01.bb b/met=
a-oe/recipes-devtools/canvenient/canvenient_1.02.bb
similarity index 73%
rename from meta-oe/recipes-devtools/canvenient/canvenient_1.01.bb
rename to meta-oe/recipes-devtools/canvenient/canvenient_1.02.bb
index 8ae41f0a83..ea5634ec07 100644
--- a/meta-oe/recipes-devtools/canvenient/canvenient_1.01.bb
+++ b/meta-oe/recipes-devtools/canvenient/canvenient_1.02.bb
@@ -11,13 +11,15 @@ HOMEPAGE =3D "https://canopenterm.de/canvenient"
 BUGTRACKER =3D "https://github.com/CANopenTerm/CANvenient/issues"
=20
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Dbd2edc721b4a0289efe949bdbe=
7dda79"
+LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D8977ecf3af54da2a5271158cc9=
69bd45"
=20
 DEPENDS =3D "libsocketcan"
=20
-SRC_URI =3D "git://github.com/CANopenTerm/CANvenient.git;protocol=3Dhttp=
s;branch=3Dmain;tag=3Dv${PV}"
+PV .=3D "+git"
=20
-SRCREV  =3D "b8b37e3915caf5bce93f38c2c6cca71356dcfcab"
+SRC_URI =3D "git://github.com/CANopenTerm/CANvenient.git;protocol=3Dhttp=
s;branch=3Dmain"
+
+SRCREV  =3D "23408935f230f59632eafd56056824f8e91cd896"
=20
 inherit cmake ptest
=20
@@ -27,10 +29,10 @@ do_install:append() {
     install -d ${D}${libdir}
=20
     install -m 0644 ${S}/include/CANvenient.h ${D}${includedir}/
-    install -m 0755 ${B}/libCANvenient.so.1.0.1 ${D}${libdir}/
+    install -m 0755 ${B}/libCANvenient.so.1.0.2 ${D}${libdir}/
=20
-    ln -sf libCANvenient.so.1.0.1 ${D}${libdir}/libCANvenient.so.1
-    ln -sf libCANvenient.so.1.0.1 ${D}${libdir}/libCANvenient.so
+    ln -sf libCANvenient.so.1.0.2 ${D}${libdir}/libCANvenient.so.1
+    ln -sf libCANvenient.so.1.0.2 ${D}${libdir}/libCANvenient.so
 }
=20
 FILES:${PN} +=3D "${libdir}/libCANvenient.so ${libdir}/libCANvenient.so.=
*"

