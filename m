Return-Path: <mail@michael-fitzmayer.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C356EC43458
	for <webhook@archiver.kernel.org>; Sat,  4 Jul 2026 05:37:06 +0000 (UTC)
Received: from mailserv.regfish.com (mailserv.regfish.com [52.57.101.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.106666.1783143419938819273
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2026 22:37:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: michael-fitzmayer.de, ip: 52.57.101.90, mailfrom: mail@michael-fitzmayer.de)
Received: by mailserv.regfish.com (Postfix, from userid 706)
	id 96FAD60777; Sat,  4 Jul 2026 05:36:58 +0000 (UTC)
Received: from debian.mupf.local (ipservice-092-208-170-243.092.208.pools.vodafone-ip.de [92.208.170.243])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: 46272-0001)
	by mailserv.regfish.com (Postfix) with ESMTPSA id 779446076F;
	Sat,  4 Jul 2026 05:36:58 +0000 (UTC)
From: Michael Fitzmayer <mail@michael-fitzmayer.de>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Fitzmayer <mail@michael-fitzmayer.de>
Subject: [PATCH] canopenterm: update to version 2.03
Date: Sat,  4 Jul 2026 07:36:56 +0200
Message-ID: <20260704053656.648316-1-mail@michael-fitzmayer.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Jul 2026 05:37:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128018

- Added new script to interface CiA 305: Layer setting services (LSS)
- New API function to set baud rate: can_set_baudrate()
- Remove usage of white text-color
- License-Update: update year in copyright

Signed-off-by: Michael Fitzmayer <mail@michael-fitzmayer.de>
---
 .../{canopenterm_2.02.bb =3D> canopenterm_2.03.bb}          | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-extended/canopenterm/{canopenterm_2.02.bb =3D> ca=
nopenterm_2.03.bb} (84%)

diff --git a/meta-oe/recipes-extended/canopenterm/canopenterm_2.02.bb b/m=
eta-oe/recipes-extended/canopenterm/canopenterm_2.03.bb
similarity index 84%
rename from meta-oe/recipes-extended/canopenterm/canopenterm_2.02.bb
rename to meta-oe/recipes-extended/canopenterm/canopenterm_2.03.bb
index 0e8a7a1c8a..0ee94bb052 100644
--- a/meta-oe/recipes-extended/canopenterm/canopenterm_2.02.bb
+++ b/meta-oe/recipes-extended/canopenterm/canopenterm_2.03.bb
@@ -11,14 +11,12 @@ HOMEPAGE =3D "https://canopenterm.de"
 BUGTRACKER =3D "https://github.com/CANopenTerm/CANopenTerm/issues"
=20
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Dbd2edc721b4a0289efe949bdbe=
7dda79"
+LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D8977ecf3af54da2a5271158cc9=
69bd45"
=20
 DEPENDS =3D "canvenient cjson isocline libinih libsdl3 lua pocketpy"
=20
-PV .=3D "+git"
-
-SRC_URI =3D "git://github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhtt=
ps;branch=3Dmain"
-SRCREV  =3D "7a9466029a6e88345e65e794ff1779f778c9358a"
+SRC_URI =3D "git://github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhtt=
ps;branch=3Dmain;tag=3Dv${PV}"
+SRCREV  =3D "63ccae8262f5e796ffca0c8a44fdf7ff0bd28571"
=20
=20
 inherit cmake ptest

