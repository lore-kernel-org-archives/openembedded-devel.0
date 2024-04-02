Return-Path: <tomasz.zyjewski@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36CD5CD1284
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 11:53:40 +0000 (UTC)
Received: from 13.mo582.mail-out.ovh.net (13.mo582.mail-out.ovh.net [188.165.56.124])
 by mx.groups.io with SMTP id smtpd.web11.10498.1712058812329062706
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Apr 2024 04:53:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: 3mdeb.com, ip: 188.165.56.124, mailfrom: tomasz.zyjewski@3mdeb.com)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.109.176.95])
	by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4V85qt4GHtz1Brf
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Apr 2024 11:53:30 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-llttr (unknown [10.110.113.80])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 0A0A61FF18;
	Tue,  2 Apr 2024 11:53:29 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.95])
	by ghost-submission-6684bf9d7b-llttr with ESMTPSA
	id TQBFLLnxC2YytRMAsM737g
	(envelope-from <tomasz.zyjewski@3mdeb.com>); Tue, 02 Apr 2024 11:53:29 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-95G001f7a5c6d2-898a-478b-adbd-601aaad77d20,
                    B1736EE6EA13A3A25AD3EFE290086A7F3CE0A358) smtp.auth=tomasz.zyjewski@3mdeb.com
X-OVh-ClientIp: 213.192.77.249
From: =?UTF-8?q?Tomasz=20=C5=BByjewski?= <tomasz.zyjewski@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Cc: piotr.krol@3mdeb.com
Subject: [meta-python][PATCH] python: python-libusb1: add recipe
Date: Tue,  2 Apr 2024 13:53:06 +0200
Message-ID: <20240402115306.3105966-1-tomasz.zyjewski@3mdeb.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 17418234513061419280
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrudefvddggeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepvfhomhgrshiiucjlhihjvgifshhkihcuoehtohhmrghsiidriiihjhgvfihskhhiseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvffdthfdvgedtleegkeejtdeijeeigfduhefgvdekteeijeehhfeuvdehuefgjeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeduvdejrddtrddtrddupddvudefrdduledvrdejjedrvdegledpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehtohhmrghsiidriiihjhgvfihskhhiseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdguvghvvghlsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheekvddpmhhouggvpehsmhhtphhouhht
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Apr 2024 11:53:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109779

Signed-off-by: Tomasz =C5=BByjewski <tomasz.zyjewski@3mdeb.com>
---
 .../python/python-libusb1_3.1.0.bb             | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-libusb1_3.=
1.0.bb

diff --git a/meta-python/recipes-devtools/python/python-libusb1_3.1.0.bb =
b/meta-python/recipes-devtools/python/python-libusb1_3.1.0.bb
new file mode 100644
index 000000000000..a045dfa8bc9f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-libusb1_3.1.0.bb
@@ -0,0 +1,18 @@
+SUMMARY =3D "Pure-python wrapper for libusb-1.0"
+HOMEPAGE =3D "http://github.com/vpelletier/python-libusb1"
+AUTHOR =3D "Vincent Pelletier <plr.vincent@gmail.com>"
+LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D " \
+    file://COPYING;md5=3D751419260aa954499f7abaabaa882bbe \
+    file://COPYING.LESSER;md5=3D4fbd65380cdd255951079008b364516c \
+"
+
+SRC_URI =3D "https://github.com/vpelletier/${BPN}/releases/download/${PV=
}/libusb1-${PV}.tar.gz"
+SRC_URI[md5sum] =3D "7b4f094786d1dfc8d011c7649d8ccb97"
+SRC_URI[sha256sum] =3D "4ee9b0a55f8bd0b3ea7017ae919a6c1f439af742c4a4b045=
43c5fd7af89b828c"
+
+S =3D "${WORKDIR}/libusb1-${PV}"
+
+RDEPENDS:${PN} =3D "libusb1"
+
+inherit setuptools3
--=20
2.44.0


