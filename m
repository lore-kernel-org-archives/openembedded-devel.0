Return-Path: <tomasz.zyjewski@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D59A7C4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 11:44:27 +0000 (UTC)
Received: from 1.mo576.mail-out.ovh.net (1.mo576.mail-out.ovh.net [178.33.251.173])
 by mx.groups.io with SMTP id smtpd.web10.45325.1669376659168370076
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Nov 2022 03:44:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: 3mdeb.com, ip: 178.33.251.173, mailfrom: tomasz.zyjewski@3mdeb.com)
Received: from player734.ha.ovh.net (unknown [10.108.16.216])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id 41EC425CB6
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 11:44:17 +0000 (UTC)
Received: from 3mdeb.com (84-10-27-202.static.chello.pl [84.10.27.202])
	(Authenticated sender: tomasz.zyjewski@3mdeb.com)
	by player734.ha.ovh.net (Postfix) with ESMTPSA id 9760830EFD517;
	Fri, 25 Nov 2022 11:44:14 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-99G00313297bd3-c8fd-4a6b-9f74-36a6feb9c5e3,
                    74700EFE4BFF86247FC1340FF407CFB4262E75AB) smtp.auth=tomasz.zyjewski@3mdeb.com
X-OVh-ClientIp: 84.10.27.202
From: =?UTF-8?q?Tomasz=20=C5=BByjewski?= <tomasz.zyjewski@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Cc: piotr.krol@3mdeb.com,
	maciej.pijanowski@3mdeb.com
Subject: [meta-python][PATCH 1/2] python3-binwalk: add recipe for version 2.3.3
Date: Fri, 25 Nov 2022 12:44:10 +0100
Message-Id: <20221125114411.128952-1-tomasz.zyjewski@3mdeb.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 12290323386011654440
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrieehgdefvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefvohhmrghsiiculjihjhgvfihskhhiuceothhomhgrshiirdiihihjvgifshhkihesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepvdfftdfhvdegtdelgeekjedtieejiefgudehgfdvkeetieejhefhuedvheeugfejnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpkeegrddutddrvdejrddvtddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeothhomhgrshiirdiihihjvgifshhkihesfehmuggvsgdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdguvghvvghlsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheejiedpmhhouggvpehsmhhtphhouhht
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 11:44:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99728

Install binwalk utility

Signed-off-by: Tomasz =C5=BByjewski <tomasz.zyjewski@3mdeb.com>
---
 .../python/python3-binwalk_2.3.3.bb             | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-binwalk_2=
.3.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-binwalk_2.3.3.bb=
 b/meta-python/recipes-devtools/python/python3-binwalk_2.3.3.bb
new file mode 100644
index 000000000000..362efa275148
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-binwalk_2.3.3.bb
@@ -0,0 +1,17 @@
+SUMMARY =3D "Firmware analysis tool"
+DESCRIPTION =3D "This package contains Python Binwalk tool. Binwalk is a=
 fast, \
+easy to use tool for analyzing, reverse engineering, and extracting firm=
ware \
+images."
+HOMEPAGE =3D "https://github.com/ReFirmLabs/binwalk"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D65bbee055d3ea3bfc475f07aecf4d=
e64"
+
+SRC_URI =3D "git://github.com/ReFirmLabs/binwalk;protocol=3Dhttps;branch=
=3Dmaster"
+
+SRCREV =3D "fa0c0bd59b8588814756942fe4cb5452e76c1dcd"
+
+S =3D "${WORKDIR}/git"
+
+inherit setuptools3
+
+RDEPENDS:${PN} +=3D "python3-core"
--=20
2.25.1


