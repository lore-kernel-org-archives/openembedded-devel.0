Return-Path: <mail@michael-fitzmayer.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D71B510F9313
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 18:09:25 +0000 (UTC)
Received: from mailserv.regfish.com (mailserv.regfish.com [52.57.101.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19705.1775066963799893257
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 11:09:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: michael-fitzmayer.de, ip: 52.57.101.90, mailfrom: mail@michael-fitzmayer.de)
Received: by mailserv.regfish.com (Postfix, from userid 706)
	id 1FB79607B3; Wed,  1 Apr 2026 18:09:22 +0000 (UTC)
Received: from DESKTOP-B84SDL6.localdomain (ipservice-092-209-208-070.092.209.pools.vodafone-ip.de [92.209.208.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: 46272-0001)
	by mailserv.regfish.com (Postfix) with ESMTPSA id EE6E760773;
	Wed,  1 Apr 2026 18:09:21 +0000 (UTC)
From: Michael Fitzmayer <mail@michael-fitzmayer.de>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Fitzmayer <mail@michael-fitzmayer.de>
Subject: [meta-oe][PATCH] canopenterm: Update to intermediate version 2.01
Date: Wed,  1 Apr 2026 20:09:20 +0200
Message-ID: <20260401180920.14918-1-mail@michael-fitzmayer.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Apr 2026 18:09:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125911

- Intermediate release to be able to use a proper version tag
  in the Yocto recipe.

Signed-off-by: Michael Fitzmayer <mail@michael-fitzmayer.de>
---
 .../canopenterm/{canopenterm_2.00.bb =3D> canopenterm_2.01.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/canopenterm/{canopenterm_2.00.bb =3D> ca=
nopenterm_2.01.bb} (91%)

diff --git a/meta-oe/recipes-extended/canopenterm/canopenterm_2.00.bb b/m=
eta-oe/recipes-extended/canopenterm/canopenterm_2.01.bb
similarity index 91%
rename from meta-oe/recipes-extended/canopenterm/canopenterm_2.00.bb
rename to meta-oe/recipes-extended/canopenterm/canopenterm_2.01.bb
index 1e86a76927..f44312a6e4 100644
--- a/meta-oe/recipes-extended/canopenterm/canopenterm_2.00.bb
+++ b/meta-oe/recipes-extended/canopenterm/canopenterm_2.01.bb
@@ -15,8 +15,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Dbd2edc721=
b4a0289efe949bdbe7dda79"
=20
 DEPENDS =3D "canvenient cjson isocline libinih libsdl3 lua pocketpy"
=20
-SRC_URI =3D "git://github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhtt=
ps;branch=3Dmain"
-SRCREV  =3D "6024d99d1d34f8e3fec20a2150fc44380cf40fb2"
+SRC_URI =3D "git://github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhtt=
ps;branch=3Dmain;tag=3Dv${PV}"
+SRCREV  =3D "4196097f71c7e59b27e9d8ac3c6cf58f44fa9f19"
=20
=20
 inherit cmake ptest
--=20
2.47.3


