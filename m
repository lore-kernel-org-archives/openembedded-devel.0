Return-Path: <pawel.langowski@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4646DEB64DD
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 09:20:08 +0000 (UTC)
Received: from 7.mo583.mail-out.ovh.net (7.mo583.mail-out.ovh.net [178.32.124.100])
 by mx.groups.io with SMTP id smtpd.web11.183009.1692264002158156184
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Aug 2023 02:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: 3mdeb.com, ip: 178.32.124.100, mailfrom: pawel.langowski@3mdeb.com)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.109.146.122])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 561832471B
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 09:20:00 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-9sxk2 (unknown [10.110.171.251])
	by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id AE03B1FE45;
	Thu, 17 Aug 2023 09:19:59 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.98])
	by ghost-submission-6684bf9d7b-9sxk2 with ESMTPSA
	id DamrHz/m3WTfygEARSjnVQ
	(envelope-from <pawel.langowski@3mdeb.com>); Thu, 17 Aug 2023 09:19:59 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-98R0024a934497-6fda-41f3-a5a6-46531bbc52b3,
                    24B04C67D9B2C368F82D87F48383B3ED5D49B353) smtp.auth=pawel.langowski@3mdeb.com
X-OVh-ClientIp: 213.192.77.249
From: Pawel Langowski <pawel.langowski@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Cc: piotr.krol@3mdeb.com,
	tomasz.zyjewski@3mdeb.com
Subject: [meta-oe][PATCH v2] recipes-extended: add qcbor recipe
Date: Thu, 17 Aug 2023 11:19:48 +0200
Message-ID: <20230817091948.62744-1-pawel.langowski@3mdeb.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 16591261028114281113
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudduuddgudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrrgifvghlucfnrghnghhofihskhhiuceophgrfigvlhdrlhgrnhhgohifshhkihesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepkeefhefhkeffieetjedvffettdeigfeufeehgefgteejudfgfeelfeeiteeggfejnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehprgifvghlrdhlrghnghhofihskhhiseefmhguvggsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdquggvvhgvlheslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehkeefpdhmohguvgepshhmthhpohhuth
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 09:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104454

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


