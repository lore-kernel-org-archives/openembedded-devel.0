Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBDE5EB64DD
	for <webhook@archiver.kernel.org>; Sun, 25 Jun 2023 21:42:37 +0000 (UTC)
Received: from mx.walter.deinstapel.de (mx.walter.deinstapel.de [62.176.232.99])
 by mx.groups.io with SMTP id smtpd.web11.20613.1687729311826769548
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jun 2023 14:41:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fancydomain.eu header.s=mail header.b=b3y5TkQ5;
 spf=pass (domain: fancydomain.eu, ip: 62.176.232.99, mailfrom: jasper@fancydomain.eu)
From: "Jasper Orschulko" <jasper@fancydomain.eu>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fancydomain.eu;
	s=mail; t=1687729310;
	bh=CQknQTQxmTO/Vzc+7AIA+dSKQ/t6XG9PT9xJ4vdX5XU=;
	h=From:To:Cc:Subject:In-Reply-To:References;
	b=b3y5TkQ5FkaSGPao8AM8jYOj1c13Z3b6m/Ru8Z9Nv05KNDzGiGE29hwk5fbv/6TIg
	 UXrl5vzfQQeAxI6d38nKvw/LECbfubuTk92SsTxtVuuk0o7aZ5FmsS6wfE/JN/Qmcj
	 zV/6EBuP2fhOweArafAqGx4CqYIx5ZFGn6BDx07JRdDY/IWT9JBq8BS8Cyma8i66pD
	 ry/MvOuK7ExnYjpWBj67L/Cl6Sk521LN/onWvAzo8MYW3f06+/YCauIeUvKWOUOguy
	 Q1Soi1yq4zpsCnZ/8YKBmufpK5hH6YA0bvfCsgDvctsXrkBkAzNH7fx773FTtK6FWh
	 BDRdrFtoyhj4g==
To: openembedded-devel@lists.openembedded.org
Cc: Jasper Orschulko <jasper@fancydomain.eu>
Subject: [meta-python][PATCH 3/3] python3-platformdirs: Fix recipe version 3.6.0
Date: Sun, 25 Jun 2023 23:39:59 +0200
Message-ID: <20230625213959.2791472-3-jasper@fancydomain.eu>
In-Reply-To: <20230625213959.2791472-1-jasper@fancydomain.eu>
References: <20230625213959.2791472-1-jasper@fancydomain.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Jun 2023 21:42:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103568

python3-platformdirs version 3.6.0 requires hatchling build system.
Before this fix it would previously build without issue but throw error w=
hen
used in the final image.

Additionally, fixing the ptest which now requires two additional
dependencies.
---
 .../python/python3-platformdirs_3.6.0.bb       | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_3.6=
.0.bb b/meta-python/recipes-devtools/python/python3-platformdirs_3.6.0.bb
index 20b3299ac7..6444fde7ea 100644
--- a/meta-python/recipes-devtools/python/python3-platformdirs_3.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-platformdirs_3.6.0.bb
@@ -3,32 +3,28 @@ HOMEPAGE =3D "https://github.com/platformdirs/platformd=
irs"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dea4f5a41454746a9ed111e3d8723d=
17a"
=20
-SRC_URI =3D " \
-    git://github.com/platformdirs/platformdirs.git;branch=3Dmain;protoco=
l=3Dhttps \
+SRC_URI +=3D " \
     file://run-ptest \
 "
=20
-SRCREV ?=3D "85b0b67eb33a835b797c1d52dab4a06c5554b7ee"
-SRC_URI[sha256sum] =3D "7954a68d0ba23558d753f73437c55f89027cf8f5108c1984=
4d4b82e5af396335"
+SRC_URI[sha256sum] =3D "57e28820ca8094678b807ff529196506d7a21e17156cb1cd=
db3e74cebce54640"
=20
-inherit python_setuptools_build_meta ptest
+inherit pypi python_hatchling ptest
=20
 DEPENDS +=3D " \
-    python3-hatch-vcs-native \
-    python3-setuptools-scm-native \
-    python3-toml-native \
+    ${PYTHON_PN}-hatch-vcs-native \
 "
=20
-S =3D "${WORKDIR}/git"
-
 RDEPENDS:${PN}-ptest +=3D " \
     ${PYTHON_PN}-appdirs \
+    ${PYTHON_PN}-covdefaults \
     ${PYTHON_PN}-pytest \
     ${PYTHON_PN}-pytest-mock \
+    ${PYTHON_PN}-pytest-cov \
 "
=20
 do_install_ptest() {
-        install -d ${D}${PTEST_PATH}/Tests
+        install -d ${D}${PTEST_PATH}
         cp -rf ${S}/tests ${D}${PTEST_PATH}/
 }
=20
--=20
2.41.0


