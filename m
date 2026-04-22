Return-Path: <mail@michael-fitzmayer.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C45FFA1FE5
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 18:29:24 +0000 (UTC)
Received: from mailserv.regfish.com (mailserv.regfish.com [52.57.101.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.89558.1776882560071238647
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2026 11:29:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: michael-fitzmayer.de, ip: 52.57.101.90, mailfrom: mail@michael-fitzmayer.de)
Received: by mailserv.regfish.com (Postfix, from userid 706)
	id BA91662114; Wed, 22 Apr 2026 18:29:18 +0000 (UTC)
Received: from NB10174-DEV.jetter.local (ipservice-092-208-170-243.092.208.pools.vodafone-ip.de [92.208.170.243])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: 46272-0001)
	by mailserv.regfish.com (Postfix) with ESMTPSA id 9A4C662101;
	Wed, 22 Apr 2026 18:29:18 +0000 (UTC)
From: Michael Fitzmayer <mail@michael-fitzmayer.de>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Fitzmayer <mail@michael-fitzmayer.de>
Subject: [meta-oe][PATCH 2/2] canopenterm: delete recipe of previous version 2.01
Date: Wed, 22 Apr 2026 20:28:55 +0200
Message-ID: <20260422182855.10796-2-mail@michael-fitzmayer.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260422182855.10796-1-mail@michael-fitzmayer.de>
References: <20260422182855.10796-1-mail@michael-fitzmayer.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 18:29:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126557

Signed-off-by: Michael Fitzmayer <mail@michael-fitzmayer.de>
---
 .../canopenterm/canopenterm_2.01.bb           | 28 -------------------
 1 file changed, 28 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/canopenterm/canopenterm_2.01=
.bb

diff --git a/meta-oe/recipes-extended/canopenterm/canopenterm_2.01.bb b/m=
eta-oe/recipes-extended/canopenterm/canopenterm_2.01.bb
deleted file mode 100644
index f44312a6e4..0000000000
--- a/meta-oe/recipes-extended/canopenterm/canopenterm_2.01.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-
-SUMMARY =3D "CANopenTerm is a versatile software tool to analyse and \
-          configure CANopen devices. \
-          "
-DESCRIPTION =3D "CANopenTerm is an open-source software tool designed fo=
r the \
-              development, testing, and analysis of CANopen CC networks =
and \
-              devices.  It extends its capabilities to support other CAN=
 CC \
-              protocols, including SAE J1939 and OBD-II. \
-              "
-HOMEPAGE =3D "https://canopenterm.de"
-BUGTRACKER =3D "https://github.com/CANopenTerm/CANopenTerm/issues"
-
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Dbd2edc721b4a0289efe949bdbe=
7dda79"
-
-DEPENDS =3D "canvenient cjson isocline libinih libsdl3 lua pocketpy"
-
-SRC_URI =3D "git://github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhtt=
ps;branch=3Dmain;tag=3Dv${PV}"
-SRCREV  =3D "4196097f71c7e59b27e9d8ac3c6cf58f44fa9f19"
-
-
-inherit cmake ptest
-
-EXTRA_OECMAKE +=3D "-DBUILD_YOCTO=3DON"
-
-FILES:${PN} +=3D "${bindir}/CANopenTerm ${bindir}/codb2json ${datadir}"
-
-RDEPENDS:${PN} =3D "canvenient cjson libinih libsdl3 lua pocketpy"

