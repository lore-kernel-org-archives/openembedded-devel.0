Return-Path: <ewa.kujawska@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 246BDC27C7A
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 12:14:59 +0000 (UTC)
Received: from 17.mo583.mail-out.ovh.net (17.mo583.mail-out.ovh.net [46.105.56.132])
 by mx.groups.io with SMTP id smtpd.web11.185542.1692274496892670493
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Aug 2023 05:14:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: 3mdeb.com, ip: 46.105.56.132, mailfrom: ewa.kujawska@3mdeb.com)
Received: from director2.ghost.mail-out.ovh.net (unknown [10.108.16.43])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id DA6422249A
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 12:14:54 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-rqhrw (unknown [10.110.103.209])
	by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 40FF61FE50;
	Thu, 17 Aug 2023 12:14:53 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.109])
	by ghost-submission-6684bf9d7b-rqhrw with ESMTPSA
	id xb00Oz0P3mS2EwAA3xV4yw
	(envelope-from <ewa.kujawska@3mdeb.com>); Thu, 17 Aug 2023 12:14:53 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-109S0037a584818-c3bc-47f4-85bf-32522de29dd1,
                    746B728346A88655F675273AEEE7EA7B681C06C7) smtp.auth=ewa.kujawska@3mdeb.com
X-OVh-ClientIp: 213.192.77.249
From: Ewa Kujawska <ewa.kujawska@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Cc: piotr.krol@3mdeb.com,
	tomasz.zyjewski@3mdeb.com
Subject: [meta-python][PATCH v2] python3-oauth2client_4.1.2.bb: recipe added
Date: Thu, 17 Aug 2023 14:13:38 +0200
Message-ID: <20230817121421.3519563-1-ewa.kujawska@3mdeb.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 1098315361619119513
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudduuddghedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefgfigrucfmuhhjrgifshhkrgcuoegvfigrrdhkuhhjrgifshhkrgesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepgeejvdetffeiudevheegffejgfduieelfeekieehkeeivedviedukeekhffgtdegnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeovgifrgdrkhhujhgrfihskhgrseefmhguvggsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdquggvvhgvlheslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehkeefpdhmohguvgepshhmthhpohhuth
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 12:14:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104462

Signed-off-by: Ewa Kujawska <ewa.kujawska@3mdeb.com>
---
 .../python3-oauth2client_4.1.2.bb             | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python3-oauth2client/python3-oa=
uth2client_4.1.2.bb b/meta-python/recipes-devtools/python3-oauth2client/p=
ython3-oauth2client_4.1.2.bb
index 96508007b2f3..0301763030e0 100644
--- a/meta-python/recipes-devtools/python3-oauth2client/python3-oauth2cli=
ent_4.1.2.bb
+++ b/meta-python/recipes-devtools/python3-oauth2client/python3-oauth2cli=
ent_4.1.2.bb
@@ -1,2 +1,19 @@
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
 inherit setuptools3
-require python-oauth2client.inc
--=20
2.41.0


