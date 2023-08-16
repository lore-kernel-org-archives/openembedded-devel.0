Return-Path: <ewa.kujawska@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 189BBC001E0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 09:11:28 +0000 (UTC)
Received: from 9.mo581.mail-out.ovh.net (9.mo581.mail-out.ovh.net [46.105.60.248])
 by mx.groups.io with SMTP id smtpd.web11.155249.1692167858643894402
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 23:37:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: 3mdeb.com, ip: 46.105.60.248, mailfrom: ewa.kujawska@3mdeb.com)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.109.138.52])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id 86AB8267E1
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 06:37:36 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-flrqv (unknown [10.110.103.73])
	by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id DD8DC1FE8C;
	Wed, 16 Aug 2023 06:37:35 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.105])
	by ghost-submission-6684bf9d7b-flrqv with ESMTPSA
	id vYi+Ja9u3GQeJwAAkLOu5A
	(envelope-from <ewa.kujawska@3mdeb.com>); Wed, 16 Aug 2023 06:37:35 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-105G006e247ce80-111d-40e8-bf8b-47f33c83e7fb,
                    1DE841C1F5B8BF0247BE2C2F91DC77C556E8685A) smtp.auth=ewa.kujawska@3mdeb.com
X-OVh-ClientIp: 213.192.77.249
From: "Ewa Kujawska" <ewa.kujawska@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Cc: piotr.krol@3mdeb.com,
	tomasz.zyjewski@3mdeb.com
Subject: [meta-python][PATCH] recipes-devtools/python/python3-libusb1_1.7.1.bb: recipe added
Date: Wed, 16 Aug 2023 02:11:22 -0700
Message-ID: <20230816063717.3305497-1-ewa.kujawska@3mdeb.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 7975874944060788121
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedruddtkedguddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepgfifrgcumfhujhgrfihskhgruceovgifrgdrkhhujhgrfihskhgrseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejgffgfedvuddtkeehgeettddtjedvtddtvdehjeefjedtieekudegvddvjeelueenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhphihthhhonhhhohhsthgvugdrohhrghenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeovgifrgdrkhhujhgrfihskhgrseefmhguvggsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdquggvvhgvlheslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehkedupdhmohguvgepshhmthhpohhuth
X-Old-Date: Wed, 16 Aug 2023 08:36:58 +0200
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 09:11:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104413
Message-ID: <20230816091122.pROFWx_oWA1RSyb9WnPZ5_h5i7olsxTxdgXphQTLE-w@z>

Signed-off-by: Ewa Kujawska <ewa.kujawska@3mdeb.com>
---
 .../python/python3-libusb1_1.7.1.bb               | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-libusb1_1=
=3D
.7.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-libusb1_1.7.1.bb=
=3D
 b/meta-python/recipes-devtools/python/python3-libusb1_1.7.1.bb
new file mode 100644
index 000000000000..476966c2178b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-libusb1_1.7.1.bb
@@ -0,0 +1,15 @@
+SUMMARY =3D3D "Pure-python wrapper for libusb-1.0"
+HOMEPAGE =3D3D "http://github.com/vpelletier/python-libusb1"
+AUTHOR =3D3D "Vincent Pelletier <plr.vincent@gmail.com>"
+LICENSE =3D3D "LGPL-2.1"
+LIC_FILES_CHKSUM =3D3D "file://COPYING;md5=3D3D751419260aa954499f7abaabaa8=
82=3D
bbe"
+
+SRC_URI =3D3D "https://files.pythonhosted.org/packages/80/bb/4ee9d760dd294=
=3D
99d877ee384f1d2bc6bb9923defd4c69843aef5e729972d/libusb1-1.7.1.tar.gz"
+SRC_URI[md5sum] =3D3D "cb4073182fef4cee6ab9c6666b48d1a1"
+SRC_URI[sha256sum] =3D3D "adf64a4f3f5c94643a1286f8153bcf4bc787c348b38934aa=
=3D
cd7fe17fbeebc571"
+
+S =3D3D "${WORKDIR}/libusb1-1.7.1"
+
+RDEPENDS_${PN} =3D3D "libusb1"
+
+inherit setuptools3
--=3D20
2.41.0


