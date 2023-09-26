Return-Path: <michal.iwanicki@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E98F0E7D245
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 07:32:09 +0000 (UTC)
Received: from 4.mo583.mail-out.ovh.net (4.mo583.mail-out.ovh.net [178.33.111.247])
 by mx.groups.io with SMTP id smtpd.web11.13542.1695713519152627185
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Sep 2023 00:32:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: 3mdeb.com, ip: 178.33.111.247, mailfrom: michal.iwanicki@3mdeb.com)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.156.6])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4424324459
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 07:31:57 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-jkfts (unknown [10.110.115.73])
	by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id BB7F81FDEC;
	Tue, 26 Sep 2023 07:31:56 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.106])
	by ghost-submission-6684bf9d7b-jkfts with ESMTPSA
	id lV/hIOyIEmV9KQAAPw0M9A
	(envelope-from <michal.iwanicki@3mdeb.com>); Tue, 26 Sep 2023 07:31:56 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-106R0060af614ab-7106-4776-8d0d-30e9ab0a01f6,
                    F2EE7D885D6C68A6AA5B8BA59AA342426243BCF6) smtp.auth=michal.iwanicki@3mdeb.com
X-OVh-ClientIp: 213.192.77.249
From: =?UTF-8?q?Micha=C5=82=20Iwanicki?= <michal.iwanicki@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Micha=C5=82=20Iwanicki?= <michal.iwanicki@3mdeb.com>
Subject: [PATCH] python3-pyu2f: add recipe
Date: Tue, 26 Sep 2023 09:31:30 +0200
Message-ID: <20230926073131.43635-1-michal.iwanicki@3mdeb.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 9866542359036911198
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudelhedguddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefoihgthhgrlhcukfifrghnihgtkhhiuceomhhitghhrghlrdhifigrnhhitghkihesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepgefhffdvvedvgfekheefiedtheefieeuleeltdefheekiedufeeikedtieefueehnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeomhhitghhrghlrdhifigrnhhitghkihesfehmuggvsgdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdguvghvvghlsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheekfedpmhhouggvpehsmhhtphhouhht
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 07:32:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105138

Signed-off-by: Micha=C5=82 Iwanicki <michal.iwanicki@3mdeb.com>
---
 .../python/python3-pyu2f_0.1.5.bb             | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyu2f_0.1=
.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-pyu2f_0.1.5.bb b=
/meta-python/recipes-devtools/python/python3-pyu2f_0.1.5.bb
new file mode 100644
index 000000000000..c58981a32799
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyu2f_0.1.5.bb
@@ -0,0 +1,20 @@
+SUMMARY =3D "U2F host library for interacting with a U2F device over USB=
."
+HOMEPAGE =3D "https://github.com/google/pyu2f/"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
+
+SRC_URI[sha256sum] =3D "a3caa3a11842fc7d5746376f37195e6af5f17c0a15737538=
bb1cebf656fb306b"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} +=3D " \
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-crypt \
+    ${PYTHON_PN}-ctypes \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-threading \
+    ${PYTHON_PN}-six \
+"
--=20
2.41.0


