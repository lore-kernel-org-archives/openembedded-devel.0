Return-Path: <pawel.langowski@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A277CEE49A5
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 06:32:56 +0000 (UTC)
Received: from 19.mo581.mail-out.ovh.net (19.mo581.mail-out.ovh.net [178.33.251.118])
 by mx.groups.io with SMTP id smtpd.web10.2637.1692685971378306946
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Aug 2023 23:32:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: 3mdeb.com, ip: 178.33.251.118, mailfrom: pawel.langowski@3mdeb.com)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.109.156.220])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id 14668247B7
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Aug 2023 06:32:48 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-x98c7 (unknown [10.110.115.240])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 23DBE1FE9E;
	Tue, 22 Aug 2023 06:32:47 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.103])
	by ghost-submission-6684bf9d7b-x98c7 with ESMTPSA
	id 178DNI9W5GSrTQkAmQLw6g
	(envelope-from <pawel.langowski@3mdeb.com>); Tue, 22 Aug 2023 06:32:47 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-103G00557b9b41a-c716-410a-b7b3-dcd5555c0e4f,
                    29A67629E1837C8660D93BDE728622DA2A414795) smtp.auth=pawel.langowski@3mdeb.com
X-OVh-ClientIp: 213.192.77.249
From: Pawel Langowski <pawel.langowski@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Cc: piotr.krol@3mdeb.com,
	tomasz.zyjewski@3mdeb.com
Subject: [meta-oe][PATCH v3] qcbor: add recipe
Date: Tue, 22 Aug 2023 08:32:13 +0200
Message-ID: <20230822063213.10060-1-pawel.langowski@3mdeb.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 6237485488006804121
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedruddvtddgudduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheprfgrfigvlhcunfgrnhhgohifshhkihcuoehprgifvghlrdhlrghnghhofihskhhiseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeekfeehhfekffeiteejvdfftedtiefgueefheeggfetjedugfefleefieetgefgjeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeduvdejrddtrddtrddupddvudefrdduledvrdejjedrvdegledpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehprgifvghlrdhlrghnghhofihskhhiseefmhguvggsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdquggvvhgvlheslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehkedupdhmohguvgepshhmthhpohhuth
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Aug 2023 06:32:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104516

This adds QCBOR - a CBOR encoder/decoder library

Signed-off-by: Pawel Langowski <pawel.langowski@3mdeb.com>
---
 meta-oe/recipes-extended/qcbor/qcbor_git.bb | 30 +++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-extended/qcbor/qcbor_git.bb

diff --git a/meta-oe/recipes-extended/qcbor/qcbor_git.bb b/meta-oe/recipe=
s-extended/qcbor/qcbor_git.bb
new file mode 100644
index 000000000000..a1bdf069936e
--- /dev/null
+++ b/meta-oe/recipes-extended/qcbor/qcbor_git.bb
@@ -0,0 +1,30 @@
+DESCRIPTION =3D " \
+    QCBOR is a powerful, commercial-quality CBOR encoder/decoder that \
+    implements these RFCs: RFC8949, RFC7049, RFC8742, RFC8943 \
+"
+
+HOMEPAGE =3D "https://github.com/laurencelundblade/QCBOR"
+
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://README.md;beginline=3D442;endline=3D463;md5=
=3Db55643261d6d221dac2b7a395105af62"
+
+SRC_URI =3D "git://github.com/laurencelundblade/QCBOR;protocol=3Dhttps;b=
ranch=3Dmaster"
+
+SRCREV =3D "44754f738c6534a4304a83d4c6e97b3d3193d887"
+
+S =3D "${WORKDIR}/git"
+
+inherit pkgconfig
+
+CFLAGS +=3D " \
+    -DUSEFULBUF_DISABLE_ALL_FLOAT \
+"
+
+do_install(){
+    install -d ${D}${libdir}
+    install -m 755 ${S}/libqcbor.a ${D}${libdir}/
+    install -d ${D}${includedir}/qcbor
+    install -m 644 ${S}/inc/*.h ${D}${includedir}
+    install -m 644 ${S}/inc/qcbor/*.h ${D}${includedir}/qcbor
+}
+
--=20
2.41.0


