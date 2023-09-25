Return-Path: <samantha.jalabert@syslinbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 376C1CE7A95
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 11:42:31 +0000 (UTC)
Received: from 8.mo550.mail-out.ovh.net (8.mo550.mail-out.ovh.net [178.33.110.239])
 by mx.groups.io with SMTP id smtpd.web10.58657.1695642144410177526
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Sep 2023 04:42:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: syslinbit.com, ip: 178.33.110.239, mailfrom: samantha.jalabert@syslinbit.com)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.146.131])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id 545AB28FF4
	for <openembedded-devel@lists.openembedded.org>; Mon, 25 Sep 2023 11:42:22 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-qwhs7 (unknown [10.111.208.234])
	by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id D82C51FE9F;
	Mon, 25 Sep 2023 11:42:21 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.96])
	by ghost-submission-6684bf9d7b-qwhs7 with ESMTPSA
	id OGsBMx1yEWWc0AUA4dzdTw
	(envelope-from <samantha.jalabert@syslinbit.com>); Mon, 25 Sep 2023 11:42:21 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-96R001578369a8-afcc-4c3e-a4d8-b785b32e3ef6,
                    FBD810A19267834B149CBBD30CC19800876A49ED) smtp.auth=samantha.jalabert@syslinbit.com
X-OVh-ClientIp: 141.94.99.231
From: samantha.jalabert@syslinbit.com
To: openembedded-devel@lists.openembedded.org,
	mrybczynska@syslinbit.com
Cc: Samantha Jalabert <samantha.jalabert@syslinbit.com>
Subject: [meta-python][PATCH 2/6] Remove python3-rdflib
Date: Mon, 25 Sep 2023 11:41:38 +0000
Message-Id: <20230925114142.2508458-3-samantha.jalabert@syslinbit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230925114142.2508458-1-samantha.jalabert@syslinbit.com>
References: <20230925114142.2508458-1-samantha.jalabert@syslinbit.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 8223009970452433161
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudelgedggedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepshgrmhgrnhhthhgrrdhjrghlrggsvghrthesshihshhlihhnsghithdrtghomhenucggtffrrghtthgvrhhnpeetleffjeffvdejvdfgueelvdfgheejieetheevteehleeljeduuedtteekgfeuffenucfkphepuddvjedrtddrtddruddpudeguddrleegrdelledrvdefuddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshgrmhgrnhhthhgrrdhjrghlrggsvghrthesshihshhlihhnsghithdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdguvghvvghlsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheehtddpmhhouggvpehsmhhtphhouhht
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Sep 2023 11:42:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105123

From: Samantha Jalabert <samantha.jalabert@syslinbit.com>

python3-rdflib recipe is moved to openembedded-core.

Signed-off-by: Marta Rybczynska <mrybczynska@syslinbit.com>
Signed-off-by: Samantha Jalabert <samantha.jalabert@syslinbit.com>
---
 .../python/python3-rdflib_7.0.0.bb            | 19 -------------------
 1 file changed, 19 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-rdflib_7.=
0.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-rdflib_7.0.0.bb =
b/meta-python/recipes-devtools/python/python3-rdflib_7.0.0.bb
deleted file mode 100644
index 952c210116..0000000000
--- a/meta-python/recipes-devtools/python/python3-rdflib_7.0.0.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY =3D "RDFLib is a pure Python package for working with RDF"
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D37d489c0cefe52a17e1d5007e1964=
64a"
-
-SRC_URI[sha256sum] =3D "9995eb8569428059b8c1affd26b25eac510d64f5043d9ce8=
c84e0d0036e995ae"
-
-inherit pypi python_poetry_core
-
-RDEPENDS:${PN} +=3D " \
-    ${PYTHON_PN}-isodate \
-    ${PYTHON_PN}-pyparsing \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-xml \
-    ${PYTHON_PN}-compression \
-    ${PYTHON_PN}-core \
-"
-
-BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


