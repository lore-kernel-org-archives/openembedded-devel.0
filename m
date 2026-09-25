Return-Path: <mail@michael-fitzmayer.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7295AC98321
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 17:57:39 +0000 (UTC)
Received: from mailserv.regfish.com (mailserv.regfish.com [52.57.101.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4246.1790359053047374994
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Sep 2026 10:57:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: michael-fitzmayer.de, ip: 52.57.101.90, mailfrom: mail@michael-fitzmayer.de)
Received: by mailserv.regfish.com (Postfix, from userid 706)
	id C2B3C60714; Fri, 25 Sep 2026 17:57:30 +0000 (UTC)
Received: from debian.mupf.local (ipservice-092-208-170-213.092.208.pools.vodafone-ip.de [92.208.170.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: 46272-0001)
	by mailserv.regfish.com (Postfix) with ESMTPSA id 9FDB6606F7;
	Fri, 25 Sep 2026 17:57:30 +0000 (UTC)
From: Michael Fitzmayer <mail@michael-fitzmayer.de>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Fitzmayer <mail@michael-fitzmayer.de>
Subject: [meta-oe][PATCH] canopenterm: Upgrade 2.03 -> 2.04
Date: Fri, 25 Sep 2026 19:57:27 +0200
Message-ID: <20260925175727.1293417-1-mail@michael-fitzmayer.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 17:57:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130313

- New API functions:

  - oscilloscope_buffer_create()
  - oscilloscope_buffer_destroy()
  - oscilloscope_buffer_push()
  - widget_oscilloscope()
  - widget_theme()

- Various bug fixes

- Add new scripts:
  - csv.lua to export PCAN TRC trace files to CSV format for analysis in =
Excel/Calc.
  - scope.lua to demonstrate how to use the new oscilloscope widget.
  - Update trace.lua and replay.lua to be able to handle basic ISOBUS (IS=
O 11783)
    CAN traffic.

Signed-off-by: Michael Fitzmayer <mail@michael-fitzmayer.de>
---
 .../canopenterm/{canopenterm_2.03.bb =3D> canopenterm_2.04.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/canopenterm/{canopenterm_2.03.bb =3D> ca=
nopenterm_2.04.bb} (94%)

diff --git a/meta-oe/recipes-extended/canopenterm/canopenterm_2.03.bb b/m=
eta-oe/recipes-extended/canopenterm/canopenterm_2.04.bb
similarity index 94%
rename from meta-oe/recipes-extended/canopenterm/canopenterm_2.03.bb
rename to meta-oe/recipes-extended/canopenterm/canopenterm_2.04.bb
index 0ee94bb052..53fd9e82a7 100644
--- a/meta-oe/recipes-extended/canopenterm/canopenterm_2.03.bb
+++ b/meta-oe/recipes-extended/canopenterm/canopenterm_2.04.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D8977ecf3a=
f54da2a5271158cc969bd45"
 DEPENDS =3D "canvenient cjson isocline libinih libsdl3 lua pocketpy"
=20
 SRC_URI =3D "git://github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhtt=
ps;branch=3Dmain;tag=3Dv${PV}"
-SRCREV  =3D "63ccae8262f5e796ffca0c8a44fdf7ff0bd28571"
+SRCREV  =3D "786e89e5378f5b4cc9371029eda86ca0c3b76498"
=20
=20
 inherit cmake ptest

