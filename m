Return-Path: <samantha.jalabert@syslinbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D253CE7A99
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 11:42:31 +0000 (UTC)
Received: from 8.mo575.mail-out.ovh.net (8.mo575.mail-out.ovh.net [46.105.74.219])
 by mx.groups.io with SMTP id smtpd.web10.58660.1695642148052040958
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Sep 2023 04:42:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: syslinbit.com, ip: 46.105.74.219, mailfrom: samantha.jalabert@syslinbit.com)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.156.77])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id 35F28256BB
	for <openembedded-devel@lists.openembedded.org>; Mon, 25 Sep 2023 11:42:26 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-qwhs7 (unknown [10.111.208.234])
	by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id E83E91FD3C;
	Mon, 25 Sep 2023 11:42:25 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.96])
	by ghost-submission-6684bf9d7b-qwhs7 with ESMTPSA
	id AChQNyFyEWWc0AUA4dzdTw
	(envelope-from <samantha.jalabert@syslinbit.com>); Mon, 25 Sep 2023 11:42:25 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-96R001902136d8-9c45-49eb-a8e7-157d2ac4d41f,
                    FBD810A19267834B149CBBD30CC19800876A49ED) smtp.auth=samantha.jalabert@syslinbit.com
X-OVh-ClientIp: 141.94.99.231
From: samantha.jalabert@syslinbit.com
To: openembedded-devel@lists.openembedded.org,
	mrybczynska@syslinbit.com
Cc: Samantha Jalabert <samantha.jalabert@syslinbit.com>
Subject: [meta-python][PATCH 6/6] Remove python3-isodate
Date: Mon, 25 Sep 2023 11:41:42 +0000
Message-Id: <20230925114142.2508458-7-samantha.jalabert@syslinbit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230925114142.2508458-1-samantha.jalabert@syslinbit.com>
References: <20230925114142.2508458-1-samantha.jalabert@syslinbit.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 8224135871776557321
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudelgedggedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepshgrmhgrnhhthhgrrdhjrghlrggsvghrthesshihshhlihhnsghithdrtghomhenucggtffrrghtthgvrhhnpeetleffjeffvdejvdfgueelvdfgheejieetheevteehleeljeduuedtteekgfeuffenucfkphepuddvjedrtddrtddruddpudeguddrleegrdelledrvdefuddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshgrmhgrnhhthhgrrdhjrghlrggsvghrthesshihshhlihhnsghithdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdguvghvvghlsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheejhedpmhhouggvpehsmhhtphhouhht
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Sep 2023 11:42:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105127

From: Samantha Jalabert <samantha.jalabert@syslinbit.com>

python3-isodate recipe is moved to openembedded-core.

Signed-off-by: Marta Rybczynska <mrybczynska@syslinbit.com>
Signed-off-by: Samantha Jalabert <samantha.jalabert@syslinbit.com>
---
 .../python/python3-isodate_0.6.1.bb                | 14 --------------
 1 file changed, 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-isodate_0=
.6.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-isodate_0.6.1.bb=
 b/meta-python/recipes-devtools/python/python3-isodate_0.6.1.bb
deleted file mode 100644
index c65083b777..0000000000
--- a/meta-python/recipes-devtools/python/python3-isodate_0.6.1.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY =3D "ISO 8601 date/time parser"
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D8;endline=3D8;md5=3De9=
10b35b0ef4e1f665b9a75d6afb7709"
-
-SRC_URI[sha256sum] =3D "48c5881de7e8b0a0d648cb024c8062dc84e7b840ed81e864=
c7614fd3c127bde9"
-
-inherit pypi setuptools3
-
-RDEPENDS:${PN} +=3D " \
-    python3-numbers \
-    python3-six \
-"
-
-BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


