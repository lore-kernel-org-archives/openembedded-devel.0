Return-Path: <samantha.jalabert@syslinbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35C9DCE7A94
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 11:42:31 +0000 (UTC)
Received: from 9.mo582.mail-out.ovh.net (9.mo582.mail-out.ovh.net [87.98.171.146])
 by mx.groups.io with SMTP id smtpd.web11.59267.1695642143304429324
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Sep 2023 04:42:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: syslinbit.com, ip: 87.98.171.146, mailfrom: samantha.jalabert@syslinbit.com)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.108.16.177])
	by mo582.mail-out.ovh.net (Postfix) with ESMTP id 534E928518
	for <openembedded-devel@lists.openembedded.org>; Mon, 25 Sep 2023 11:42:21 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-qwhs7 (unknown [10.111.208.234])
	by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id B9F511FE07;
	Mon, 25 Sep 2023 11:42:20 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.96])
	by ghost-submission-6684bf9d7b-qwhs7 with ESMTPSA
	id aMoFLBxyEWWc0AUA4dzdTw
	(envelope-from <samantha.jalabert@syslinbit.com>); Mon, 25 Sep 2023 11:42:20 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-96R001fb27ae3f-566f-4bb9-9541-08c01688ffe1,
                    FBD810A19267834B149CBBD30CC19800876A49ED) smtp.auth=samantha.jalabert@syslinbit.com
X-OVh-ClientIp: 141.94.99.231
From: samantha.jalabert@syslinbit.com
To: openembedded-devel@lists.openembedded.org,
	mrybczynska@syslinbit.com
Cc: Samantha Jalabert <samantha.jalabert@syslinbit.com>
Subject: [meta-python][PATCH 1/6] Remove python3-xmltodict
Date: Mon, 25 Sep 2023 11:41:37 +0000
Message-Id: <20230925114142.2508458-2-samantha.jalabert@syslinbit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230925114142.2508458-1-samantha.jalabert@syslinbit.com>
References: <20230925114142.2508458-1-samantha.jalabert@syslinbit.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 8222728498351048969
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudelgedggedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepshgrmhgrnhhthhgrrdhjrghlrggsvghrthesshihshhlihhnsghithdrtghomhenucggtffrrghtthgvrhhnpeehfefhteelveekheehhfegjeehkeeuvddtteefjeetlefhkeeffedtffdtteffvdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeduvdejrddtrddtrddupddugedurdelgedrleelrddvfedupdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehsrghmrghnthhhrgdrjhgrlhgrsggvrhhtsehshihslhhinhgsihhtrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdquggvvhgvlheslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehkedvpdhmohguvgepshhmthhpohhuth
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Sep 2023 11:42:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105122

From: Samantha Jalabert <samantha.jalabert@syslinbit.com>

python3-xmltodict recipe is moved to openembedded-core.

Signed-off-by: Marta Rybczynska <mrybczynska@syslinbit.com>
Signed-off-by: Samantha Jalabert <samantha.jalabert@syslinbit.com>
---
 .../python/python3-xmltodict/run-ptest        |  3 --
 .../python/python3-xmltodict_0.13.0.bb        | 29 -------------------
 2 files changed, 32 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-xmltodict=
/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-xmltodict=
_0.13.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-xmltodict/run-pt=
est b/meta-python/recipes-devtools/python/python3-xmltodict/run-ptest
deleted file mode 100644
index 3385d68939..0000000000
--- a/meta-python/recipes-devtools/python/python3-xmltodict/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e 's/\[...%\]//g=
'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SK=
IP/g'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" ||=
 $NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS"){printf "%s: %s\n", $NF, $0}else{pr=
int}}'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" |=
| $NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS") {$NF=3D"";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-xmltodict_0.13.0=
.bb b/meta-python/recipes-devtools/python/python3-xmltodict_0.13.0.bb
deleted file mode 100644
index a1f3957adc..0000000000
--- a/meta-python/recipes-devtools/python/python3-xmltodict_0.13.0.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY =3D "Makes working with XML feel like you are working with JSON"
-HOMEPAGE =3D "https://github.com/martinblech/xmltodict"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D01441d50dc74476db58a41ac10cb9=
fa2"
-
-SRC_URI[sha256sum] =3D "341595a488e3e01a85a9d8911d8912fd922ede5fecc4dce4=
37eb4b6c8d037e56"
-
-PYPI_PACKAGE =3D "xmltodict"
-
-inherit pypi setuptools3 ptest
-
-SRC_URI +=3D " \
-	file://run-ptest \
-"
-
-RDEPENDS:${PN} +=3D " \
-	${PYTHON_PN}-core \
-	${PYTHON_PN}-xml \
-	${PYTHON_PN}-io \
-"
-
-RDEPENDS:${PN}-ptest +=3D " \
-	${PYTHON_PN}-pytest \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
--=20
2.34.1


