Return-Path: <pawel.langowski@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ACBEC001E0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 09:41:18 +0000 (UTC)
Received: from 8.mo550.mail-out.ovh.net (8.mo550.mail-out.ovh.net [178.33.110.239])
 by mx.groups.io with SMTP id smtpd.web10.156774.1692175848774455601
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Aug 2023 01:50:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: 3mdeb.com, ip: 178.33.110.239, mailfrom: pawel.langowski@3mdeb.com)
Received: from director1.ghost.mail-out.ovh.net (unknown [10.108.16.60])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id 1B60126072
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 08:50:47 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-m5lsp (unknown [10.110.103.93])
	by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 752AE1FE5B;
	Wed, 16 Aug 2023 08:50:46 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.106])
	by ghost-submission-6684bf9d7b-m5lsp with ESMTPSA
	id 7uilDOaN3GToRwAAHf3dkw
	(envelope-from <pawel.langowski@3mdeb.com>); Wed, 16 Aug 2023 08:50:46 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-106R006aeff0e96-7659-4eae-8f8e-250056539298,
                    93A237E87ED1339E13AED04D535165A97E4753C9) smtp.auth=pawel.langowski@3mdeb.com
X-OVh-ClientIp: 213.192.77.249
From: "Pawel Langowski" <pawel.langowski@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Cc: piotr.krol@3mdeb.com,
	tomasz.zyjewski@3mdeb.com
Subject: [meta-oe] [PATCH] recipes-extended: add qcbor recipe
Date: Wed, 16 Aug 2023 02:41:09 -0700
Message-ID: <20230816085042.1399670-1-pawel.langowski@3mdeb.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 10225141479582053017
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedruddtledgtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrrgifvghlucfnrghnghhofihskhhiuceophgrfigvlhdrlhgrnhhgohifshhkihesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepkeefhefhkeffieetjedvffettdeigfeufeehgefgteejudfgfeelfeeiteeggfejnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeophgrfigvlhdrlhgrnhhgohifshhkihesfehmuggvsgdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdguvghvvghlsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheehtddpmhhouggvpehsmhhtphhouhht
X-Old-Date: Wed, 16 Aug 2023 10:50:27 +0200
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 09:41:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104421
Message-ID: <20230816094109.qcIocx7Ah1z7hUPMLhhUBuQ3XA05D5M9FxPjL0Q_HGA@z>

Recipe for QCBOR - a CBOR encoder/decoder
---
 meta-oe/recipes-extended/qcbor/qcbor_git.bb | 32 +++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-extended/qcbor/qcbor_git.bb

diff --git a/meta-oe/recipes-extended/qcbor/qcbor_git.bb b/meta-oe/recipe=
=3D
s-extended/qcbor/qcbor_git.bb
new file mode 100644
index 000000000000..6e87458c3a3e
--- /dev/null
+++ b/meta-oe/recipes-extended/qcbor/qcbor_git.bb
@@ -0,0 +1,32 @@
+DESCRIPTION =3D3D " \
+    QCBOR is a powerful, commercial-quality CBOR encoder/decoder that \
+    implements these RFCs: RFC8949, RFC7049, RFC8742, RFC8943 \
+"
+
+HOMEPAGE =3D3D "https://github.com/laurencelundblade/QCBOR"
+
+LICENSE =3D3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D3D "file://README.md;beginline=3D3D442;endline=3D3D463=
;md5=3D
=3D3Db55643261d6d221dac2b7a395105af62"
+
+SRC_URI =3D3D "git://github.com/laurencelundblade/QCBOR;protocol=3D3Dhttps=
;b=3D
ranch=3D3Dmaster"
+
+SRCREV =3D3D "44754f738c6534a4304a83d4c6e97b3d3193d887"
+
+S =3D3D "${WORKDIR}/git"
+
+INSANE_SKIP:${PN}-dev +=3D3D "ldflags"
+
+inherit pkgconfig
+
+CFLAGS +=3D3D " \
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
--=3D20
2.41.0


