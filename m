Return-Path: <tomasz.zyjewski@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D59F9C43217
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 11:44:27 +0000 (UTC)
Received: from 11.mo582.mail-out.ovh.net (11.mo582.mail-out.ovh.net [188.165.38.119])
 by mx.groups.io with SMTP id smtpd.web10.45326.1669376662923445269
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Nov 2022 03:44:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: 3mdeb.com, ip: 188.165.38.119, mailfrom: tomasz.zyjewski@3mdeb.com)
Received: from player734.ha.ovh.net (unknown [10.109.143.220])
	by mo582.mail-out.ovh.net (Postfix) with ESMTP id CBF2425DDF
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 11:44:20 +0000 (UTC)
Received: from 3mdeb.com (84-10-27-202.static.chello.pl [84.10.27.202])
	(Authenticated sender: tomasz.zyjewski@3mdeb.com)
	by player734.ha.ovh.net (Postfix) with ESMTPSA id 202C330EFD54D;
	Fri, 25 Nov 2022 11:44:17 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-99G0034996c2e3-bff4-4257-9c2b-8c28cc753860,
                    74700EFE4BFF86247FC1340FF407CFB4262E75AB) smtp.auth=tomasz.zyjewski@3mdeb.com
X-OVh-ClientIp: 84.10.27.202
From: =?UTF-8?q?Tomasz=20=C5=BByjewski?= <tomasz.zyjewski@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Cc: piotr.krol@3mdeb.com,
	maciej.pijanowski@3mdeb.com
Subject: [meta-python][PATCH 2/2] python3-uefi-firmware: add recipe for version 1.9
Date: Fri, 25 Nov 2022 12:44:11 +0100
Message-Id: <20221125114411.128952-2-tomasz.zyjewski@3mdeb.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221125114411.128952-1-tomasz.zyjewski@3mdeb.com>
References: <20221125114411.128952-1-tomasz.zyjewski@3mdeb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 12291449285354690856
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrieehgdefvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefvohhmrghsiiculjihjhgvfihskhhiuceothhomhgrshiirdiihihjvgifshhkihesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepgfffgffhueehteeghfetleeiueelteffteetuedttdefhfeghfelueeiteejgeejnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpphihthhhohhnhhhoshhtvggurdhorhhgnecukfhppeduvdejrddtrddtrddupdekgedruddtrddvjedrvddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehtohhmrghsiidriiihjhgvfihskhhiseefmhguvggsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdquggvvhgvlheslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehkedvpdhmohguvgepshhmthhpohhuth
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 11:44:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99729

Install uefi-firmware-parser tool

Signed-off-by: Tomasz =C5=BByjewski <tomasz.zyjewski@3mdeb.com>
---
 .../python/python3-uefi-firmware_1.9.bb         | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-uefi-firm=
ware_1.9.bb

diff --git a/meta-python/recipes-devtools/python/python3-uefi-firmware_1.=
9.bb b/meta-python/recipes-devtools/python/python3-uefi-firmware_1.9.bb
new file mode 100644
index 000000000000..ba3124b36e60
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
+SRC_URI =3D "https://files.pythonhosted.org/packages/7e/b4/a4ec646d24a1a=
ad709fdb83de6e5eddd6cb24faec02f3a94a3af3b0aba28/uefi_firmware-${PV}.tar.g=
z"
+SRC_URI[md5sum] =3D "ee5011b4d0bcb0eb7c06295e0107894f"
+SRC_URI[sha256sum] =3D "234119dd92780c67cce3b664e86119c41d0b2af188d7f372=
b69789b32c5d5cd0"
+
+S =3D "${WORKDIR}/uefi_firmware-${PV}"
+
+inherit setuptools3
--=20
2.25.1


