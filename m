Return-Path: <tomasz.zyjewski@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74221C47088
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 08:35:30 +0000 (UTC)
Received: from 1.mo560.mail-out.ovh.net (1.mo560.mail-out.ovh.net [46.105.63.121])
 by mx.groups.io with SMTP id smtpd.web10.37935.1669883729277959788
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Dec 2022 00:35:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: 3mdeb.com, ip: 46.105.63.121, mailfrom: tomasz.zyjewski@3mdeb.com)
Received: from player797.ha.ovh.net (unknown [10.111.172.33])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id 704FD24E70
	for <openembedded-devel@lists.openembedded.org>; Thu,  1 Dec 2022 08:35:27 +0000 (UTC)
Received: from 3mdeb.com (84-10-27-202.static.chello.pl [84.10.27.202])
	(Authenticated sender: tomasz.zyjewski@3mdeb.com)
	by player797.ha.ovh.net (Postfix) with ESMTPSA id BAEE32D3EA556;
	Thu,  1 Dec 2022 08:35:24 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-102R004f57db619-2669-4fcf-9320-9aa72499d7da,
                    CD9E635A71B48C9C013169077C1BC37D21AD11CE) smtp.auth=tomasz.zyjewski@3mdeb.com
X-OVh-ClientIp: 84.10.27.202
From: =?UTF-8?q?Tomasz=20=C5=BByjewski?= <tomasz.zyjewski@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Cc: michal.kotyla@3mdeb.com
Subject: [meta-python][PATCH V3 2/2] python3-uefi-firmware: add recipe for version 1.9
Date: Thu,  1 Dec 2022 09:34:56 +0100
Message-Id: <20221201083456.1573628-2-tomasz.zyjewski@3mdeb.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221201083456.1573628-1-tomasz.zyjewski@3mdeb.com>
References: <20221201083456.1573628-1-tomasz.zyjewski@3mdeb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 7444168711459150206
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrtdeggdduvdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepvfhomhgrshiiucjlhihjvgifshhkihcuoehtohhmrghsiidriiihjhgvfihskhhiseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeekleevffelieffvdfhkedtueegiedvtefgkeelleeiuedvjefgheeiueejveeiueenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeduvdejrddtrddtrddupdekgedruddtrddvjedrvddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehtohhmrghsiidriiihjhgvfihskhhiseefmhguvggsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdquggvvhgvlheslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehiedtpdhmohguvgepshhmthhpohhuth
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Dec 2022 08:35:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99883

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


