Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F188FC27C7A
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 12:04:28 +0000 (UTC)
Received: from 11.mo550.mail-out.ovh.net (11.mo550.mail-out.ovh.net [188.165.48.29])
 by mx.groups.io with SMTP id smtpd.web10.156625.1692174878500041358
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Aug 2023 01:34:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: 3mdeb.com, ip: 188.165.48.29, mailfrom: pawel.langowski@3mdeb.com)
Received: from director2.ghost.mail-out.ovh.net (unknown [10.109.143.249])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id A524B23C80
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 08:34:36 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-ftsrk (unknown [10.110.115.32])
	by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 204351FE44;
	Wed, 16 Aug 2023 08:34:35 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.97])
	by ghost-submission-6684bf9d7b-ftsrk with ESMTPSA
	id tYWRMhuK3GQ5GQAA6CAPKA
	(envelope-from <pawel.langowski@3mdeb.com>); Wed, 16 Aug 2023 08:34:35 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-97G002e398ef6c-b2a8-4599-9e1e-42d5d8511437,
                    93A237E87ED1339E13AED04D535165A97E4753C9) smtp.auth=pawel.langowski@3mdeb.com
X-OVh-ClientIp: 213.192.77.249
From: pawel.langowski@3mdeb.com
To: openembedded-devel@lists.openembedded.org
Cc: piotr.krol@3mdeb.com,
	tomasz.zyjewski@3mdeb.com
Subject: [PATCH] recipes-extended: add qcbor recipe
Date: Wed, 16 Aug 2023 10:34:13 +0200
Message-ID: <20230816083418.1397949-1-pawel.langowski@3mdeb.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 9951829277287953049
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedruddtledgtdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrrgifvghlucfnrghnghhofihskhhiuceophgrfigvlhdrlhgrnhhgohifshhkihesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepkeefhefhkeffieetjedvffettdeigfeufeehgefgteejudfgfeelfeeiteeggfejnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehprgifvghlrdhlrghnghhofihskhhiseefmhguvggsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdquggvvhgvlheslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehhedtpdhmohguvgepshhmthhpohhuth
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 12:04:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104460

---
 meta-oe/recipes-extended/qcbor/qcbor_git.bb | 32 +++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-extended/qcbor/qcbor_git.bb

diff --git a/meta-oe/recipes-extended/qcbor/qcbor_git.bb b/meta-oe/recipe=
s-extended/qcbor/qcbor_git.bb
new file mode 100644
index 000000000000..6e87458c3a3e
--- /dev/null
+++ b/meta-oe/recipes-extended/qcbor/qcbor_git.bb
@@ -0,0 +1,32 @@
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
+INSANE_SKIP:${PN}-dev +=3D "ldflags"
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


