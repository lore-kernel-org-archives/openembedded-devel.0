Return-Path: <mail@michael-fitzmayer.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 818E5E64011
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 20:30:00 +0000 (UTC)
Received: from mailserv.regfish.com (mailserv.regfish.com [52.57.101.90])
 by mx.groups.io with SMTP id smtpd.web10.8455.1732220998391913298
 for <Openembedded-devel@lists.openembedded.org>;
 Thu, 21 Nov 2024 12:29:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: michael-fitzmayer.de, ip: 52.57.101.90, mailfrom: mail@michael-fitzmayer.de)
Received: by mailserv.regfish.com (Postfix, from userid 706)
	id 0BA9D6202C; Thu, 21 Nov 2024 20:29:57 +0000 (UTC)
Received: from localhost.localdomain (ip-046-223-148-253.um13.pools.vodafone-ip.de [46.223.148.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: 46272-0001)
	by mailserv.regfish.com (Postfix) with ESMTPSA id E2AC86187C;
	Thu, 21 Nov 2024 20:29:56 +0000 (UTC)
From: Michael Fitzmayer <mail@michael-fitzmayer.de>
To: Openembedded-devel@lists.openembedded.org
Cc: Michael Fitzmayer <mail@michael-fitzmayer.de>
Subject: [PATCH 2/2] Add recipe: canopenterm 1.0.8
Date: Thu, 21 Nov 2024 21:29:32 +0100
Message-Id: <20241121202932.2703888-1-mail@michael-fitzmayer.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <CAMKF1sqJ15FYzLHUbFfB1mRq6tbH=gzhwAn07kx85TQobsFX0A@mail.gmail.com>
References: <CAMKF1sqJ15FYzLHUbFfB1mRq6tbH=gzhwAn07kx85TQobsFX0A@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 20:30:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113978

CANopenTerm is an open-source software tool designed for the development,
testing, and analysis of CANopen CC networks and devices. It extends its
capabilities to support other CAN CC protocols, including SAE J1939 and
OBD-II.

Signed-off-by: Michael Fitzmayer <mail@michael-fitzmayer.de>
---
 .../canopenterm/canopenterm_1.0.8.bb          | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-extended/canopenterm/canopenterm_1.0.=
8.bb

diff --git a/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.8.bb b/=
meta-oe/recipes-extended/canopenterm/canopenterm_1.0.8.bb
new file mode 100644
index 000000000..191225bb1
--- /dev/null
+++ b/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.8.bb
@@ -0,0 +1,29 @@
+
+SUMMARY =3D "CANopenTerm is a versatile software tool to analyse and \
+          configure CANopen devices. \
+          "
+DESCRIPTION =3D "CANopenTerm is an open-source software tool designed fo=
r the \
+              development, testing, and analysis of CANopen CC networks =
and \
+              devices.  It extends its capabilities to support other CAN=
 CC \
+              protocols, including SAE J1939 and OBD-II. \
+              "
+HOMEPAGE =3D "https://canopenterm.de"
+BUGTRACKER =3D "https://github.com/CANopenTerm/CANopenTerm/issues"
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D10e84ea70e8c3a1fbc462f5424=
806474"
+
+DEPENDS =3D "libinih libsdl2 lua libsocketcan pocketpy"
+
+SRC_URI =3D "git://github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhtt=
ps;branch=3Dmain"
+SRCREV =3D "5bc04e09351f68e889381e1912b0445c4f18ee32"
+
+S =3D "${WORKDIR}/git"
+
+inherit cmake
+
+EXTRA_OECMAKE +=3D "-DBUILD_YOCTO=3DON"
+
+FILES:${PN} +=3D "${bindir}/CANopenTerm ${datadir}"
+
+RDEPENDS:${PN} =3D "libinih libsdl2 lua libsocketcan pocketpy"
--=20
2.39.5


