Return-Path: <tomasz.zyjewski@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1C69C4332F
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 08:43:23 +0000 (UTC)
Received: from 4.mo584.mail-out.ovh.net (4.mo584.mail-out.ovh.net [178.32.98.131])
 by mx.groups.io with SMTP id smtpd.web11.10717.1670229797437209354
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Dec 2022 00:43:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: 3mdeb.com, ip: 178.32.98.131, mailfrom: tomasz.zyjewski@3mdeb.com)
Received: from player168.ha.ovh.net (unknown [10.110.171.136])
	by mo584.mail-out.ovh.net (Postfix) with ESMTP id 230DE223F2
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 Dec 2022 08:43:14 +0000 (UTC)
Received: from 3mdeb.com (84-10-27-202.static.chello.pl [84.10.27.202])
	(Authenticated sender: tomasz.zyjewski@3mdeb.com)
	by player168.ha.ovh.net (Postfix) with ESMTPSA id 5394F316C2A9E;
	Mon,  5 Dec 2022 08:43:13 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-100R00386d19fe5-b0ba-4c87-85c8-adfadacb5814,
                    1E67064A9E8056A726906ED957211C8DFB43AFA2) smtp.auth=tomasz.zyjewski@3mdeb.com
X-OVh-ClientIp: 84.10.27.202
From: tomasz.zyjewski@3mdeb.com
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Tomasz=20=C5=BByjewski?= <tomasz.zyjewski@3mdeb.com>
Subject: [meta-python][PATCH V3] python3-uefi-firmware: add recipe for version 1.9
Date: Mon,  5 Dec 2022 09:42:52 +0100
Message-Id: <20221205084252.3972744-1-tomasz.zyjewski@3mdeb.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 12619649107595401625
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudefgdduvdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpehtohhmrghsiidriiihjhgvfihskhhiseefmhguvggsrdgtohhmnecuggftrfgrthhtvghrnhepfeejffekiedthfefleegveettddvhedtgfevkedugffhledulefgvdefjefhhfdtnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpkeegrddutddrvdejrddvtddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeothhomhgrshiirdiihihjvgifshhkihesfehmuggvsgdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdguvghvvghlsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheekgedpmhhouggvpehsmhhtphhouhht
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Dec 2022 08:43:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99950

From: Tomasz =C5=BByjewski <tomasz.zyjewski@3mdeb.com>

Install uefi-firmware-parser tool

The UEFI firmware parseer is a simple module and set of scripts for
parsing, extracting, and recreating UEFI firmware volumes.

Signed-off-by: Tomasz =C5=BByjewski <tomasz.zyjewski@3mdeb.com>
---
 .../python/python3-uefi-firmware_1.9.bb         | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-uefi-firm=
ware_1.9.bb

diff --git a/meta-python/recipes-devtools/python/python3-uefi-firmware_1.=
9.bb b/meta-python/recipes-devtools/python/python3-uefi-firmware_1.9.bb
new file mode 100644
index 000000000000..3837a17437b1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-uefi-firmware_1.9.bb
@@ -0,0 +1,17 @@
+SUMMARY =3D "Various data structures and parsing tools for UEFI firmware=
."
+DESCRIPTION =3D "This package contains Python UEFI firmware parser tool.=
 The \
+UEFI firmware parser is a simple module and set of scripts for parsing, =
\
+extracting, and recreating UEFI firmware volumes. This includes parsing =
\
+modules for BIOS, OptionROM, Intel ME and other formats too."
+HOMEPAGE =3D "https://github.com/theopolis/uefi-firmware-parser"
+AUTHOR =3D "Teddy Reed <teddy@prosauce.org>"
+LICENSE =3D "BSD-2-Clause & BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://setup.py;md5=3D90fa5bae1547550f1c1993f651ed=
a955"
+
+SRC_URI =3D "git://github.com/theopolis/uefi-firmware-parser;protocol=3D=
https;branch=3Dmaster"
+
+SRCREV =3D "502f1bada1ed11fdd1792646fda0bfafb8fa57fb"
+
+S =3D "${WORKDIR}/git"
+
+inherit setuptools3
--=20
2.25.1


