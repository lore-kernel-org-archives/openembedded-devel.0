Return-Path: <samantha.jalabert@syslinbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55559CE7A81
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 11:42:31 +0000 (UTC)
Received: from 6.mo583.mail-out.ovh.net (6.mo583.mail-out.ovh.net [178.32.119.138])
 by mx.groups.io with SMTP id smtpd.web10.58659.1695642146799516653
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Sep 2023 04:42:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: syslinbit.com, ip: 178.32.119.138, mailfrom: samantha.jalabert@syslinbit.com)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.108.16.84])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 3221928747
	for <openembedded-devel@lists.openembedded.org>; Mon, 25 Sep 2023 11:42:25 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-qwhs7 (unknown [10.111.208.234])
	by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id D9E6F1FEA9;
	Mon, 25 Sep 2023 11:42:24 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.96])
	by ghost-submission-6684bf9d7b-qwhs7 with ESMTPSA
	id YK7MMyByEWWc0AUA4dzdTw
	(envelope-from <samantha.jalabert@syslinbit.com>); Mon, 25 Sep 2023 11:42:24 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-96R00167b0b78a-0cd1-4419-ab0c-6027185e4b43,
                    FBD810A19267834B149CBBD30CC19800876A49ED) smtp.auth=samantha.jalabert@syslinbit.com
X-OVh-ClientIp: 141.94.99.231
From: samantha.jalabert@syslinbit.com
To: openembedded-devel@lists.openembedded.org,
	mrybczynska@syslinbit.com
Cc: Samantha Jalabert <samantha.jalabert@syslinbit.com>
Subject: [meta-python][PATCH 5/6] Remove python3-booleanpy
Date: Mon, 25 Sep 2023 11:41:41 +0000
Message-Id: <20230925114142.2508458-6-samantha.jalabert@syslinbit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230925114142.2508458-1-samantha.jalabert@syslinbit.com>
References: <20230925114142.2508458-1-samantha.jalabert@syslinbit.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 8223854396331067657
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudelgedggedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepshgrmhgrnhhthhgrrdhjrghlrggsvghrthesshihshhlihhnsghithdrtghomhenucggtffrrghtthgvrhhnpedvhfefleetveevtdegudekgeetjefhieelheffieekheettdetvdeihfdugfeiueenucffohhmrghinhepghhithhhuhgsrdgtohhmpdgsohholhgvrghnrdhphienucfkphepuddvjedrtddrtddruddpudeguddrleegrdelledrvdefuddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshgrmhgrnhhthhgrrdhjrghlrggsvghrthesshihshhlihhnsghithdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdguvghvvghlsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheekfedpmhhouggvpehsmhhtphhouhht
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Sep 2023 11:42:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105126

From: Samantha Jalabert <samantha.jalabert@syslinbit.com>

python3-booleanpy recipe is moved to openembedded-core.

Signed-off-by: Marta Rybczynska <mrybczynska@syslinbit.com>
Signed-off-by: Samantha Jalabert <samantha.jalabert@syslinbit.com>
---
 .../python/python3-booleanpy_4.0.bb                 | 13 -------------
 1 file changed, 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-booleanpy=
_4.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-booleanpy_4.0.bb=
 b/meta-python/recipes-devtools/python/python3-booleanpy_4.0.bb
deleted file mode 100644
index 41fd3d960a..0000000000
--- a/meta-python/recipes-devtools/python/python3-booleanpy_4.0.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY =3D "Define boolean algebras, create and parse boolean expressio=
ns and create custom boolean DSL"
-HOMEPAGE =3D "https://github.com/bastikr/boolean.py"
-
-LICENSE =3D "BSD-2-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dd118b5feceee598ebeca76e13=
395c2bd"
-
-SRC_URI[sha256sum] =3D "17b9a181630e43dde1851d42bef546d616d5d9b448035751=
4597e78b203d06e4"
-
-PYPI_PACKAGE =3D "boolean.py"
-
-inherit pypi setuptools3
-
-BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


