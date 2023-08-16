Return-Path: <ewa.kujawska@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 466FAC04A94
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 06:14:57 +0000 (UTC)
Received: from 2.mo576.mail-out.ovh.net (2.mo576.mail-out.ovh.net [178.33.251.80])
 by mx.groups.io with SMTP id smtpd.web11.155001.1692166496339497745
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 23:14:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: 3mdeb.com, ip: 178.33.251.80, mailfrom: ewa.kujawska@3mdeb.com)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.108.20.147])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id 57FB025F55
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 06:14:54 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-kr8sf (unknown [10.110.208.139])
	by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id C592B1FD5C;
	Wed, 16 Aug 2023 06:14:53 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.95])
	by ghost-submission-6684bf9d7b-kr8sf with ESMTPSA
	id cF71LF1p3GS6EgAA7GwM1w
	(envelope-from <ewa.kujawska@3mdeb.com>); Wed, 16 Aug 2023 06:14:53 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-95G001328e3a7e-1e48-4144-b590-5dcb3dab32fa,
                    1DE841C1F5B8BF0247BE2C2F91DC77C556E8685A) smtp.auth=ewa.kujawska@3mdeb.com
X-OVh-ClientIp: 213.192.77.249
From: Ewa Kujawska <ewa.kujawska@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Cc: piotr.krol@3mdeb.com,
	tomasz.zyjewski@3mdeb.com
Subject: [[meta-python][PATCH] 2/2]  recipes-devtools/python3-oauth2client/python3-oauth2client.inc: OAuth 2.0 client library added
Date: Wed, 16 Aug 2023 08:14:28 +0200
Message-ID: <20230816061437.3303787-2-ewa.kujawska@3mdeb.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816061437.3303787-1-ewa.kujawska@3mdeb.com>
References: <20230816061437.3303787-1-ewa.kujawska@3mdeb.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 7592506021904682393
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedruddtkedguddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepgfifrgcumfhujhgrfihskhgruceovgifrgdrkhhujhgrfihskhgrseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeevveefvedvledtlefgjefggffhgedtudeijeehjeetffehieduveetuddtveetkeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeduvdejrddtrddtrddupddvudefrdduledvrdejjedrvdegledpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeovgifrgdrkhhujhgrfihskhgrseefmhguvggsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdquggvvhgvlheslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehjeeipdhmohguvgepshhmthhpohhuth
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 06:14:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104412

---
 .../python-oauth2client.inc                    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python3-oauth2client/pyt=
hon-oauth2client.inc

diff --git a/meta-python/recipes-devtools/python3-oauth2client/python-oau=
th2client.inc b/meta-python/recipes-devtools/python3-oauth2client/python-=
oauth2client.inc
new file mode 100644
index 000000000000..40a960e2d2c1
--- /dev/null
+++ b/meta-python/recipes-devtools/python3-oauth2client/python-oauth2clie=
nt.inc
@@ -0,0 +1,18 @@
+DESCRIPTION =3D "OAuth 2.0 client library"
+AUTHOR =3D "Google Inc."
+HOMEPAGE =3D "http://github.com/google/oauth2client/"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D038e1390e94fe637991fa5569daa6=
2bc"
+
+inherit pypi
+
+SRC_URI[md5sum] =3D "bc30976cd1e859cd6199264a50c5ba72"
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
--=20
2.41.0


