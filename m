Return-Path: <ewa.kujawska@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44FC2C001E0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 06:14:57 +0000 (UTC)
Received: from 7.mo560.mail-out.ovh.net (7.mo560.mail-out.ovh.net [188.165.48.182])
 by mx.groups.io with SMTP id smtpd.web10.155217.1692166495610966147
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 23:14:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: 3mdeb.com, ip: 188.165.48.182, mailfrom: ewa.kujawska@3mdeb.com)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.109.146.1])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id D95162701A
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 06:14:53 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-kr8sf (unknown [10.110.208.139])
	by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 41A961FD53;
	Wed, 16 Aug 2023 06:14:53 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.95])
	by ghost-submission-6684bf9d7b-kr8sf with ESMTPSA
	id RpyHAF1p3GS6EgAA7GwM1w
	(envelope-from <ewa.kujawska@3mdeb.com>); Wed, 16 Aug 2023 06:14:53 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-95G001915dcfe1-3451-460f-bfa0-0e0299cc2fc9,
                    1DE841C1F5B8BF0247BE2C2F91DC77C556E8685A) smtp.auth=ewa.kujawska@3mdeb.com
X-OVh-ClientIp: 213.192.77.249
From: Ewa Kujawska <ewa.kujawska@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Cc: piotr.krol@3mdeb.com,
	tomasz.zyjewski@3mdeb.com
Subject: [[meta-python][PATCH] 1/2]  recipes-devtools/python3-oauth2client/python3-oauth2client_4.1.2.bb: recipe added
Date: Wed, 16 Aug 2023 08:14:27 +0200
Message-ID: <20230816061437.3303787-1-ewa.kujawska@3mdeb.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 7592224548718218649
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedruddtkedguddtiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepgfifrgcumfhujhgrfihskhgruceovgifrgdrkhhujhgrfihskhgrseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeegjefhgfdtgfevhfetjeeugfejieeujedvgfejfeegheetgeegtddvkeeuieektdenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegvfigrrdhkuhhjrgifshhkrgesfehmuggvsgdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdguvghvvghlsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheeitddpmhhouggvpehsmhhtphhouhht
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 06:14:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104411

---
 .../python3-oauth2client/python3-oauth2client_4.1.2.bb          | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python3-oauth2client/pyt=
hon3-oauth2client_4.1.2.bb

diff --git a/meta-python/recipes-devtools/python3-oauth2client/python3-oa=
uth2client_4.1.2.bb b/meta-python/recipes-devtools/python3-oauth2client/p=
ython3-oauth2client_4.1.2.bb
new file mode 100644
index 000000000000..96508007b2f3
--- /dev/null
+++ b/meta-python/recipes-devtools/python3-oauth2client/python3-oauth2cli=
ent_4.1.2.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-oauth2client.inc
--=20
2.41.0


