Return-Path: <samantha.jalabert@syslinbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BAA1CE7A98
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 11:42:31 +0000 (UTC)
Received: from 4.mo560.mail-out.ovh.net (4.mo560.mail-out.ovh.net [87.98.172.75])
 by mx.groups.io with SMTP id smtpd.web11.59268.1695642145872137041
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Sep 2023 04:42:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: syslinbit.com, ip: 87.98.172.75, mailfrom: samantha.jalabert@syslinbit.com)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.146.173])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4FAD027464
	for <openembedded-devel@lists.openembedded.org>; Mon, 25 Sep 2023 11:42:24 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-qwhs7 (unknown [10.111.208.234])
	by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id D5EA51FEA5;
	Mon, 25 Sep 2023 11:42:23 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.96])
	by ghost-submission-6684bf9d7b-qwhs7 with ESMTPSA
	id kMTNMh9yEWWc0AUA4dzdTw
	(envelope-from <samantha.jalabert@syslinbit.com>); Mon, 25 Sep 2023 11:42:23 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-96R0012b4d2997-312b-42fa-b5dc-0a3d7179d0a7,
                    FBD810A19267834B149CBBD30CC19800876A49ED) smtp.auth=samantha.jalabert@syslinbit.com
X-OVh-ClientIp: 141.94.99.231
From: samantha.jalabert@syslinbit.com
To: openembedded-devel@lists.openembedded.org,
	mrybczynska@syslinbit.com
Cc: Samantha Jalabert <samantha.jalabert@syslinbit.com>
Subject: [meta-python][PATCH 4/6] Remove python3-click
Date: Mon, 25 Sep 2023 11:41:40 +0000
Message-Id: <20230925114142.2508458-5-samantha.jalabert@syslinbit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230925114142.2508458-1-samantha.jalabert@syslinbit.com>
References: <20230925114142.2508458-1-samantha.jalabert@syslinbit.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 8223572923142244617
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudelgedggedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepshgrmhgrnhhthhgrrdhjrghlrggsvghrthesshihshhlihhnsghithdrtghomhenucggtffrrghtthgvrhhnpeekuefghedvtdehvedvtdetgeegledugedugeehveejgeeghfehvdehueegtdffhfenucffohhmrghinhepphhotghoohdrohhrghenucfkphepuddvjedrtddrtddruddpudeguddrleegrdelledrvdefuddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshgrmhgrnhhthhgrrdhjrghlrggsvghrthesshihshhlihhnsghithdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdguvghvvghlsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheeitddpmhhouggvpehsmhhtphhouhht
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Sep 2023 11:42:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105125

From: Samantha Jalabert <samantha.jalabert@syslinbit.com>

python3-click recipe is moved to openembedded-core.

Signed-off-by: Marta Rybczynska <mrybczynska@syslinbit.com>
Signed-off-by: Samantha Jalabert <samantha.jalabert@syslinbit.com>
---
 .../python/python3-click/run-ptest            |  3 --
 .../python/python3-click_8.1.7.bb             | 39 -------------------
 2 files changed, 42 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-click/run=
-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-click_8.1=
.7.bb

diff --git a/meta-python/recipes-devtools/python/python3-click/run-ptest =
b/meta-python/recipes-devtools/python/python3-click/run-ptest
deleted file mode 100644
index b63c4de0d9..0000000000
--- a/meta-python/recipes-devtools/python/python3-click/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e 's/\[...%\]//g=
'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/S=
KIP/g'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" |=
| $NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS"){printf "%s: %s\n", $NF, $0}else{p=
rint}}'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" =
|| $NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS") {$NF=3D"";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-click_8.1.7.bb b=
/meta-python/recipes-devtools/python/python3-click_8.1.7.bb
deleted file mode 100644
index a4ec6cd1ef..0000000000
--- a/meta-python/recipes-devtools/python/python3-click_8.1.7.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY =3D "A simple wrapper around optparse for powerful command line =
utilities."
-DESCRIPTION =3D "\
-Click is a Python package for creating beautiful command line interfaces=
 \
-in a composable way with as little code as necessary. It's the "Command =
\
-Line Interface Creation Kit". It's highly configurable but comes with \
-sensible defaults out of the box."
-HOMEPAGE =3D "http://click.pocoo.org/"
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3D1fa98232fd645608937a0fdc8=
2e999b8"
-
-SRC_URI[sha256sum] =3D "ca9853ad459e787e2192211578cc907e7594e294c7ccc834=
310722b41b9ca6de"
-
-inherit pypi setuptools3 ptest
-
-SRC_URI +=3D "file://run-ptest"
-
-RDEPENDS:${PN}-ptest +=3D " \
-	${PYTHON_PN}-pytest \
-	${PYTHON_PN}-terminal \
-	${PYTHON_PN}-unixadmin \
-"
-
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
-    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-    cp -rf ${S}/setup.cfg ${D}${PTEST_PATH}/
-    cp -rf ${S}/docs ${D}${PTEST_PATH}/
-}
-
-UPSTREAM_CHECK_REGEX =3D "click/(?P<pver>\d+(\.\d+)+)/"
-
-CLEANBROKEN =3D "1"
-
-RDEPENDS:${PN} +=3D "\
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-threading \
-    "
-
-BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


