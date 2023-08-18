Return-Path: <ewa.kujawska@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27BC9C001DE
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 11:24:32 +0000 (UTC)
Received: from 5.mo584.mail-out.ovh.net (5.mo584.mail-out.ovh.net [188.165.44.50])
 by mx.groups.io with SMTP id smtpd.web11.9058.1692357870913196444
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Aug 2023 04:24:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: 3mdeb.com, ip: 188.165.44.50, mailfrom: ewa.kujawska@3mdeb.com)
Received: from director3.ghost.mail-out.ovh.net (unknown [10.109.156.220])
	by mo584.mail-out.ovh.net (Postfix) with ESMTP id 3557C241EA
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Aug 2023 11:24:29 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-hzztm (unknown [10.110.115.73])
	by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 9F44C1FE45;
	Fri, 18 Aug 2023 11:24:28 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.110])
	by ghost-submission-6684bf9d7b-hzztm with ESMTPSA
	id XsD2FuxU32QObAMAA+ci2A
	(envelope-from <ewa.kujawska@3mdeb.com>); Fri, 18 Aug 2023 11:24:28 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-110S004f124ccc4-cdf7-4074-bcbe-6c3942626ee9,
                    9874EC95A4A1C37C7275AEE24D908C0ECD57E829) smtp.auth=ewa.kujawska@3mdeb.com
X-OVh-ClientIp: 213.192.77.249
From: Ewa Kujawska <ewa.kujawska@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Cc: piotr.krol@3mdeb.com,
	tomasz.zyjewski@3mdeb.com
Subject: [meta-python][PATCH] python3-oauth2client_4.1.2.bb: recipe added
Date: Fri, 18 Aug 2023 13:24:05 +0200
Message-ID: <20230818112416.3669866-1-ewa.kujawska@3mdeb.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 6119547470788791705
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedruddufedggedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefgfigrucfmuhhjrgifshhkrgcuoegvfigrrdhkuhhjrgifshhkrgesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepgeejvdetffeiudevheegffejgfduieelfeekieehkeeivedviedukeekhffgtdegnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrdduuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeovgifrgdrkhhujhgrfihskhgrseefmhguvggsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdquggvvhgvlheslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehkeegpdhmohguvgepshhmthhpohhuth
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Aug 2023 11:24:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104487

Signed-off-by: Ewa Kujawska <ewa.kujawska@3mdeb.com>
---
 .../python3-oauth2client_4.1.2.bb             | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python3_oauth2client/pyt=
hon3-oauth2client_4.1.2.bb

diff --git a/meta-python/recipes-devtools/python3_oauth2client/python3-oa=
uth2client_4.1.2.bb b/meta-python/recipes-devtools/python3_oauth2client/p=
ython3-oauth2client_4.1.2.bb
new file mode 100644
index 000000000000..0301763030e0
--- /dev/null
+++ b/meta-python/recipes-devtools/python3_oauth2client/python3-oauth2cli=
ent_4.1.2.bb
@@ -0,0 +1,19 @@
+DESCRIPTION =3D "OAuth 2.0 client library"
+
+HOMEPAGE =3D "http://github.com/google/oauth2client/"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D038e1390e94fe637991fa5569daa6=
2bc"
+
+inherit pypi
+
+SRC_URI[sha256sum] =3D "bd3062c06f8b10c6ef7a890b22c2740e5f87d61b6e1f4b1c=
90d069cdfc9dadb5"
+
+RDEPENDS:${PN} +=3D " \
+        ${PYTHON_PN}-httplib2 \
+        ${PYTHON_PN}-pyasn1 \
+        ${PYTHON_PN}-pyasn1-modules \
+        ${PYTHON_PN}-rsa \
+        ${PYTHON_PN}-six \
+        "
+
+inherit setuptools3
--=20
2.41.0


