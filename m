Return-Path: <samantha.jalabert@syslinbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 454CFCE7A96
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 11:42:31 +0000 (UTC)
Received: from 13.mo550.mail-out.ovh.net (13.mo550.mail-out.ovh.net [178.33.253.128])
 by mx.groups.io with SMTP id smtpd.web10.58658.1695642144638721539
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Sep 2023 04:42:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: syslinbit.com, ip: 178.33.253.128, mailfrom: samantha.jalabert@syslinbit.com)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.146.131])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id 1AFC7290AE
	for <openembedded-devel@lists.openembedded.org>; Mon, 25 Sep 2023 11:42:23 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-qwhs7 (unknown [10.111.208.234])
	by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id DA68D1FE9F;
	Mon, 25 Sep 2023 11:42:22 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.96])
	by ghost-submission-6684bf9d7b-qwhs7 with ESMTPSA
	id 4MO+Mx5yEWWc0AUA4dzdTw
	(envelope-from <samantha.jalabert@syslinbit.com>); Mon, 25 Sep 2023 11:42:22 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-96R00196afbdac-dcfc-4f31-922e-21c6245adb67,
                    FBD810A19267834B149CBBD30CC19800876A49ED) smtp.auth=samantha.jalabert@syslinbit.com
X-OVh-ClientIp: 141.94.99.231
From: samantha.jalabert@syslinbit.com
To: openembedded-devel@lists.openembedded.org,
	mrybczynska@syslinbit.com
Cc: Samantha Jalabert <samantha.jalabert@syslinbit.com>
Subject: [meta-python][PATCH 3/6] Remove python3-license-expression
Date: Mon, 25 Sep 2023 11:41:39 +0000
Message-Id: <20230925114142.2508458-4-samantha.jalabert@syslinbit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230925114142.2508458-1-samantha.jalabert@syslinbit.com>
References: <20230925114142.2508458-1-samantha.jalabert@syslinbit.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 8223291447961782537
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudelgedggedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepshgrmhgrnhhthhgrrdhjrghlrggsvghrthesshihshhlihhnsghithdrtghomhenucggtffrrghtthgvrhhnpeehfefhteelveekheehhfegjeehkeeuvddtteefjeetlefhkeeffedtffdtteffvdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeduvdejrddtrddtrddupddugedurdelgedrleelrddvfedupdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehsrghmrghnthhhrgdrjhgrlhgrsggvrhhtsehshihslhhinhgsihhtrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdquggvvhgvlheslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehhedtpdhmohguvgepshhmthhpohhuth
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Sep 2023 11:42:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105124

From: Samantha Jalabert <samantha.jalabert@syslinbit.com>

python3-license-expression recipe is moved to openembedded-core.

Signed-off-by: Marta Rybczynska <mrybczynska@syslinbit.com>
Signed-off-by: Samantha Jalabert <samantha.jalabert@syslinbit.com>
---
 .../python3-license-expression/run-ptest      |  3 --
 .../python3-license-expression_30.1.1.bb      | 36 -------------------
 2 files changed, 39 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-license-e=
xpression/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-license-e=
xpression_30.1.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-license-expressi=
on/run-ptest b/meta-python/recipes-devtools/python/python3-license-expres=
sion/run-ptest
deleted file mode 100644
index 5cec711696..0000000000
--- a/meta-python/recipes-devtools/python/python3-license-expression/run-=
ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest
diff --git a/meta-python/recipes-devtools/python/python3-license-expressi=
on_30.1.1.bb b/meta-python/recipes-devtools/python/python3-license-expres=
sion_30.1.1.bb
deleted file mode 100644
index 31fb88d6e5..0000000000
--- a/meta-python/recipes-devtools/python/python3-license-expression_30.1=
.1.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-SUMMARY =3D "Utility library to parse, compare, simplify and normalize l=
icense expressions"
-HOMEPAGE =3D "https://github.com/nexB/license-expression"
-
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://apache-2.0.LICENSE;md5=3D86d3f3a95c324c9479=
bd8986968f4327"
-
-SRC_URI[sha256sum] =3D "42375df653ad85e6f5b4b0385138b2dbea1f5d66360783d8=
625c3e4f97f11f0c"
-
-inherit pypi ptest python_setuptools_build_meta
-
-DEPENDS +=3D "${PYTHON_PN}-setuptools-scm-native"
-
-RDEPENDS:${PN} +=3D "\
-    ${PYTHON_PN}-booleanpy \
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-stringold \
-    ${PYTHON_PN}-logging \
-"
-
-BBCLASSEXTEND =3D "native nativesdk"
-
-SRC_URI +=3D " \
-	file://run-ptest \
-"
-
-RDEPENDS:${PN}-ptest +=3D " \
-	${PYTHON_PN}-pytest \
-"
-
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
-    install -d ${D}${PTEST_PATH}/src
-    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-    cp -rf ${S}/src/* ${D}${PTEST_PATH}/src/
-}
--=20
2.34.1


