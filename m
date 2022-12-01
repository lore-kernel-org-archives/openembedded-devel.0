Return-Path: <tomasz.zyjewski@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 735E0C43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 08:35:30 +0000 (UTC)
Received: from 6.mo576.mail-out.ovh.net (6.mo576.mail-out.ovh.net [46.105.50.107])
 by mx.groups.io with SMTP id smtpd.web11.37946.1669883726821340015
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Dec 2022 00:35:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: 3mdeb.com, ip: 46.105.50.107, mailfrom: tomasz.zyjewski@3mdeb.com)
Received: from player797.ha.ovh.net (unknown [10.110.171.96])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id D588524E56
	for <openembedded-devel@lists.openembedded.org>; Thu,  1 Dec 2022 08:35:24 +0000 (UTC)
Received: from 3mdeb.com (84-10-27-202.static.chello.pl [84.10.27.202])
	(Authenticated sender: tomasz.zyjewski@3mdeb.com)
	by player797.ha.ovh.net (Postfix) with ESMTPSA id 3116D2D3EA515;
	Thu,  1 Dec 2022 08:35:22 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-102R0041cbfa7c1-49d9-4e87-9d5c-f990170d6be6,
                    CD9E635A71B48C9C013169077C1BC37D21AD11CE) smtp.auth=tomasz.zyjewski@3mdeb.com
X-OVh-ClientIp: 84.10.27.202
From: =?UTF-8?q?Tomasz=20=C5=BByjewski?= <tomasz.zyjewski@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Cc: michal.kotyla@3mdeb.com
Subject: [meta-python][PATCH V3 1/2] python3-binwalk: add recipe for version 2.3.3
Date: Thu,  1 Dec 2022 09:34:55 +0100
Message-Id: <20221201083456.1573628-1-tomasz.zyjewski@3mdeb.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 7443324285146012030
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrtdeggdduvdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepvfhomhgrshiiucjlhihjvgifshhkihcuoehtohhmrghsiidriiihjhgvfihskhhiseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvffdthfdvgedtleegkeejtdeijeeigfduhefgvdekteeijeehhfeuvdehuefgjeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeduvdejrddtrddtrddupdekgedruddtrddvjedrvddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehtohhmrghsiidriiihjhgvfihskhhiseefmhguvggsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdquggvvhgvlheslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehjeeipdhmohguvgepshhmthhpohhuth
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Dec 2022 08:35:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99882

Install binwalk utility.

Binwalk is a fast, easy to use tool for analyzing, reverse engineering,
and extracting firmware images.

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


