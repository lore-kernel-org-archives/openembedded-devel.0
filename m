Return-Path: <mail@michael-fitzmayer.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D39CA1012
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 18:19:20 +0000 (UTC)
Received: from mailserv.regfish.com (mailserv.regfish.com [52.57.101.90])
 by mx.groups.io with SMTP id smtpd.web11.1930.1757009950601178782
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Sep 2025 11:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: michael-fitzmayer.de, ip: 52.57.101.90, mailfrom: mail@michael-fitzmayer.de)
Received: by mailserv.regfish.com (Postfix, from userid 706)
	id 77A0561FC5; Thu,  4 Sep 2025 18:19:08 +0000 (UTC)
Received: from DESKTOP-B84SDL6.localdomain (ip-046-223-149-161.um13.pools.vodafone-ip.de [46.223.149.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: 46272-0001)
	by mailserv.regfish.com (Postfix) with ESMTPSA id 578196089F;
	Thu,  4 Sep 2025 18:19:08 +0000 (UTC)
From: Michael Fitzmayer <mail@michael-fitzmayer.de>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Fitzmayer <mail@michael-fitzmayer.de>
Subject: [meta-oe][PATCH] canopenterm: Upgrade to version 1.0.13
Date: Thu,  4 Sep 2025 20:19:00 +0200
Message-ID: <20250904181900.662-1-mail@michael-fitzmayer.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 18:19:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119289

Update license checksum: the year in the copyright notice has been
updated.

- Various improvements and bug fixes
- Visualise CAN data using graphical widgets
- Migrate from SDL2 to SDL3
- Support for CANopen profile databases (including several common
  application and device profiles)
- Basic autocomplete functionality
- Persistent command history

Signed-off-by: Michael Fitzmayer <mail@michael-fitzmayer.de>
---
 .../{canopenterm_1.0.10.bb =3D> canopenterm_1.0.13.bb}      | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-extended/canopenterm/{canopenterm_1.0.10.bb =3D> =
canopenterm_1.0.13.bb} (74%)

diff --git a/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.10.bb b=
/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.13.bb
similarity index 74%
rename from meta-oe/recipes-extended/canopenterm/canopenterm_1.0.10.bb
rename to meta-oe/recipes-extended/canopenterm/canopenterm_1.0.13.bb
index 26c80195b0..a81ed30f72 100644
--- a/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.10.bb
+++ b/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.13.bb
@@ -11,13 +11,13 @@ HOMEPAGE =3D "https://canopenterm.de"
 BUGTRACKER =3D "https://github.com/CANopenTerm/CANopenTerm/issues"
=20
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D10e84ea70e8c3a1fbc462f5424=
806474"
+LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D5f8a62fabd50ce3f1d7794bc84=
9ae7a5"
=20
-DEPENDS =3D "cjson libinih virtual/libsdl2 lua libsocketcan pocketpy"
+DEPENDS =3D "cjson libinih libsdl3 lua libsocketcan pocketpy"
=20
 SRC_URI =3D "git://github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhtt=
ps;branch=3Dmain"
=20
-SRCREV  =3D "e0760b2e9657907e691be4df384ca7617109635d"
+SRCREV  =3D "b0555360e5e8b444a2a9e14088fd253412184eb8"
=20
=20
 inherit cmake ptest
@@ -26,4 +26,4 @@ EXTRA_OECMAKE +=3D "-DBUILD_YOCTO=3DON"
=20
 FILES:${PN} +=3D "${bindir}/CANopenTerm ${bindir}/codb2json ${datadir}"
=20
-RDEPENDS:${PN} =3D "cjson libinih libsdl2 lua libsocketcan pocketpy"
+RDEPENDS:${PN} =3D "cjson libinih libsdl3 lua libsocketcan pocketpy"
--=20
2.47.2


