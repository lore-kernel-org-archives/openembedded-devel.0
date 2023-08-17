Return-Path: <tymoteusz.burak@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D18CEB64DD
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 08:56:38 +0000 (UTC)
Received: from 1.mo582.mail-out.ovh.net (1.mo582.mail-out.ovh.net [46.105.56.136])
 by mx.groups.io with SMTP id smtpd.web10.183070.1692262594677808355
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Aug 2023 01:56:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: 3mdeb.com, ip: 46.105.56.136, mailfrom: tymoteusz.burak@3mdeb.com)
Received: from director1.ghost.mail-out.ovh.net (unknown [10.108.20.237])
	by mo582.mail-out.ovh.net (Postfix) with ESMTP id A142425E81
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 08:56:32 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-kvhjc (unknown [10.110.208.116])
	by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 0EFA81FE62;
	Thu, 17 Aug 2023 08:56:31 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.103])
	by ghost-submission-6684bf9d7b-kvhjc with ESMTPSA
	id JmBmGL/g3WQXhAEA9ELxxg
	(envelope-from <tymoteusz.burak@3mdeb.com>); Thu, 17 Aug 2023 08:56:31 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-103G0056cb2d800-d01b-48a6-9fe7-0f574f67c478,
                    05FB791017C74160A0BF3C0A500D873A876168E7) smtp.auth=tymoteusz.burak@3mdeb.com
X-OVh-ClientIp: 213.192.77.249
From: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Cc: piotr.krol@3mdeb.com,
	tomasz.zyjewski@3mdeb.com
Subject: [meta-oe][PATCH v2] ttf-google-fira: add recipe
Date: Thu, 17 Aug 2023 10:56:04 +0200
Message-ID: <20230817085604.24511-1-tymoteusz.burak@3mdeb.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 16194944263846416537
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudduuddguddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvhihmohhtvghushiiuceuuhhrrghkuceothihmhhothgvuhhsiidrsghurhgrkhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepjeegleduhfduhfefueeileetudeuffeutdekffduheevhedugeetteethfelteefnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeothihmhhothgvuhhsiidrsghurhgrkhesfehmuggvsgdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdguvghvvghlsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheekvddpmhhouggvpehsmhhtphhouhht
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 08:56:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104451

Added recipe for Google Fira Fonts collection (Fira Mono, Fira Code, Fira=
 Sans, Fira Sans Condensed, Fira Sans Extra Condensed) to meta-oe. This c=
ommit introduces support for integrating the highly legible and versatile=
 Fira Fonts into the project, enhancing typographic options for user inte=
rfaces and code display.

Signed-off-by: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
---
 .../ttf-fonts/ttf-google-fira.bb                 | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-google-fira.bb b/meta=
-oe/recipes-graphics/ttf-fonts/ttf-google-fira.bb
index b330f40387bb..10047c6f7da6 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-google-fira.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-google-fira.bb
@@ -8,13 +8,17 @@ LIC_FILES_CHKSUM =3D " \
     file://${S}/firasanscondensed/OFL.txt;md5=3Dde28deb2f8c1f23fd4d69181=
13ac3ddd \
     file://${S}/firasansextracondensed/OFL.txt;md5=3Dde28deb2f8c1f23fd4d=
6918113ac3ddd \
 "
-SRCREV =3D "47a6c224b3e0287b2e48e3ffef8c9ce2ca4931f4"
+SRCREV_firamono =3D "701bd391b1a4b3238de193a8523009ecef1be42c"
+SRCREV_firacode =3D "701bd391b1a4b3238de193a8523009ecef1be42c"
+SRCREV_firasans =3D "701bd391b1a4b3238de193a8523009ecef1be42c"
+SRCREV_firasanscondensed =3D "701bd391b1a4b3238de193a8523009ecef1be42c"
+SRCREV_firasansextracondensed =3D "701bd391b1a4b3238de193a8523009ecef1be=
42c"
=20
-SRC_URI =3D "git://github.com/google/fonts.git;protocol=3Dhttps;branch=3D=
main;subpath=3Dofl/firamono \
-           git://github.com/google/fonts.git;protocol=3Dhttps;branch=3Dm=
ain;subpath=3Dofl/firacode \
-           git://github.com/google/fonts.git;protocol=3Dhttps;branch=3Dm=
ain;subpath=3Dofl/firasans \
-           git://github.com/google/fonts.git;protocol=3Dhttps;branch=3Dm=
ain;subpath=3Dofl/firasanscondensed \
-           git://github.com/google/fonts.git;protocol=3Dhttps;branch=3Dm=
ain;subpath=3Dofl/firasansextracondensed"
+SRC_URI =3D "git://github.com/google/fonts.git;protocol=3Dhttps;branch=3D=
main;subpath=3Dofl/firamono;name=3Dfiramono \
+           git://github.com/google/fonts.git;protocol=3Dhttps;branch=3Dm=
ain;subpath=3Dofl/firacode;name=3Dfiracode \
+           git://github.com/google/fonts.git;protocol=3Dhttps;branch=3Dm=
ain;subpath=3Dofl/firasans;name=3Dfirasans \
+           git://github.com/google/fonts.git;protocol=3Dhttps;branch=3Dm=
ain;subpath=3Dofl/firasanscondensed;name=3Dfirasanscondensed \
+           git://github.com/google/fonts.git;protocol=3Dhttps;branch=3Dm=
ain;subpath=3Dofl/firasansextracondensed;name=3Dfirasansextracondensed"
=20
 S =3D "${WORKDIR}"
=20
--=20
2.41.0


