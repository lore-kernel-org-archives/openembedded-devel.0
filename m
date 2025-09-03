Return-Path: <mail@michael-fitzmayer.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0E3ACA1012
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 19:37:54 +0000 (UTC)
Received: from mailserv.regfish.com (mailserv.regfish.com [52.57.101.90])
 by mx.groups.io with SMTP id smtpd.web11.21985.1756928267430876687
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 12:37:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: michael-fitzmayer.de, ip: 52.57.101.90, mailfrom: mail@michael-fitzmayer.de)
Received: by mailserv.regfish.com (Postfix, from userid 706)
	id A56E862071; Wed,  3 Sep 2025 19:37:45 +0000 (UTC)
Received: from DESKTOP-B84SDL6.localdomain (ip-046-223-149-161.um13.pools.vodafone-ip.de [46.223.149.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: 46272-0001)
	by mailserv.regfish.com (Postfix) with ESMTPSA id 8504461400;
	Wed,  3 Sep 2025 19:37:45 +0000 (UTC)
From: Michael Fitzmayer <mail@michael-fitzmayer.de>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Fitzmayer <mail@michael-fitzmayer.de>
Subject: [meta-oe][PATCH] pocketpy: Upgrade to 2.1.1
Date: Wed,  3 Sep 2025 21:37:39 +0200
Message-ID: <20250903193739.3070198-1-mail@michael-fitzmayer.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 19:37:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119267

Update LICENSE checksum: the year in the copyright notice has been update=
d.

Enable CMake option PK_ENABLE_OS which allows PocketPy to perform file op=
erations.

Signed-off-by: Michael Fitzmayer <mail@michael-fitzmayer.de>
---
 .../pocketpy/{pocketpy_2.0.6.bb =3D> pocketpy_2.1.1.bb}     | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/pocketpy/{pocketpy_2.0.6.bb =3D> pocketp=
y_2.1.1.bb} (86%)

diff --git a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.6.bb b/meta-o=
e/recipes-devtools/pocketpy/pocketpy_2.1.1.bb
similarity index 86%
rename from meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.6.bb
rename to meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.1.bb
index f3ffccf626..c5fc4f0f6e 100644
--- a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.6.bb
+++ b/meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.1.bb
@@ -11,14 +11,18 @@ HOMEPAGE =3D "https://pocketpy.dev/"
 BUGTRACKER =3D "https://github.com/pocketpy/pocketpy/issues"
=20
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8cdfa87bc5e09bc07f8cf64135026=
d91"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc292beb20a17db07c359b0cc2c039=
027"
=20
 SRC_URI =3D "git://github.com/pocketpy/pocketpy.git;protocol=3Dhttps;bra=
nch=3Dmain"
-SRCREV =3D "8a3bdd7e0a43b44e3b32548543128d95e68a3802"
+SRCREV =3D "b6a6aa85a6cbfe0427b48e523d53ee3832bf5bd2"
=20
=20
 inherit cmake
=20
+EXTRA_OECMAKE =3D "\
+    -DPK_ENABLE_OS=3DON \
+"
+
 CFLAGS +=3D "-fPIC"
=20
 do_install() {
--=20
2.47.2


