Return-Path: <mail@michael-fitzmayer.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDBFFE7717F
	for <webhook@archiver.kernel.org>; Sun,  8 Dec 2024 21:22:07 +0000 (UTC)
Received: from mailserv.regfish.com (mailserv.regfish.com [52.57.101.90])
 by mx.groups.io with SMTP id smtpd.web11.86705.1733692927077476441
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Dec 2024 13:22:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: michael-fitzmayer.de, ip: 52.57.101.90, mailfrom: mail@michael-fitzmayer.de)
Received: by mailserv.regfish.com (Postfix, from userid 706)
	id 36C7E620B1; Sun,  8 Dec 2024 21:22:05 +0000 (UTC)
Received: from localhost.localdomain (ip-046-223-149-087.um13.pools.vodafone-ip.de [46.223.149.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: 46272-0001)
	by mailserv.regfish.com (Postfix) with ESMTPSA id 150A161995;
	Sun,  8 Dec 2024 21:22:05 +0000 (UTC)
From: Michael Fitzmayer <mail@michael-fitzmayer.de>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Fitzmayer <mail@michael-fitzmayer.de>
Subject: [meta-oe][PATCH] pocketpy: update to version 2.0.3
Date: Sun,  8 Dec 2024 22:21:40 +0100
Message-Id: <20241208212140.11714-1-mail@michael-fitzmayer.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Dec 2024 21:22:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114243

- Fix some type annotation usage e.g. int | None.
- Fix some builtins hash functions
- Fix a severe bug of dict
- Clean up #defines
- Improve array2d
- Fix a bug of super
- Fix a bug of context manager

Signed-off-by: Michael Fitzmayer <mail@michael-fitzmayer.de>
---
 .../pocketpy/{pocketpy_2.0.2.bb =3D> pocketpy_2.0.3.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/pocketpy/{pocketpy_2.0.2.bb =3D> pocketp=
y_2.0.3.bb} (95%)

diff --git a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.2.bb b/meta-o=
e/recipes-devtools/pocketpy/pocketpy_2.0.3.bb
similarity index 95%
rename from meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.2.bb
rename to meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.3.bb
index 28ac67d8d..2c0ecf0e6 100644
--- a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.2.bb
+++ b/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.3.bb
@@ -14,7 +14,7 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8cdfa87bc5e09bc07f8cf64135026=
d91"
=20
 SRC_URI =3D "git://github.com/pocketpy/pocketpy.git;protocol=3Dhttps;bra=
nch=3Dmain"
-SRCREV =3D "b5a443efa11e7d6576025d1b9a397ead9e9260c9"
+SRCREV =3D "3be557f95dbc706716b9a9947e41c1f2db92e251"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.39.5


