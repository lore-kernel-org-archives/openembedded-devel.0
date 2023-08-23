Return-Path: <pawel.langowski@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC01EE49B4
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 11:47:56 +0000 (UTC)
Received: from 5.mo561.mail-out.ovh.net (5.mo561.mail-out.ovh.net [87.98.178.36])
 by mx.groups.io with SMTP id smtpd.web10.9368.1692791270945246962
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Aug 2023 04:47:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: 3mdeb.com, ip: 87.98.178.36, mailfrom: pawel.langowski@3mdeb.com)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.108.16.142])
	by mo561.mail-out.ovh.net (Postfix) with ESMTP id A0D57205C1
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 11:47:48 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-5gdkn (unknown [10.110.115.71])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 1D7E91FD42;
	Wed, 23 Aug 2023 11:47:47 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.105])
	by ghost-submission-6684bf9d7b-5gdkn with ESMTPSA
	id ezQWM+Px5WTN5wAAkJk7fw
	(envelope-from <pawel.langowski@3mdeb.com>); Wed, 23 Aug 2023 11:47:47 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-105G006f7e863bd-0b3f-45c2-b526-2869c4d445a9,
                    9F87A999A58848E422D1785D445934894C28AF5B) smtp.auth=pawel.langowski@3mdeb.com
X-OVh-ClientIp: 213.192.77.249
From: Pawel Langowski <pawel.langowski@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Cc: piotr.krol@3mdeb.com,
	tomasz.zyjewski@3mdeb.com
Subject: [meta-oe][PATCH v4] qcbor: add recipe
Date: Wed, 23 Aug 2023 13:47:18 +0200
Message-ID: <20230823114718.130305-1-pawel.langowski@3mdeb.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 17430056459950142105
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedruddvgedggeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrrgifvghlucfnrghnghhofihskhhiuceophgrfigvlhdrlhgrnhhgohifshhkihesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepkeefhefhkeffieetjedvffettdeigfeufeehgefgteejudfgfeelfeeiteeggfejnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeophgrfigvlhdrlhgrnhhgohifshhkihesfehmuggvsgdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdguvghvvghlsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheeiuddpmhhouggvpehsmhhtphhouhht
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 11:47:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104537

This adds QCBOR - a CBOR encoder/decoder library

Signed-off-by: Pawel Langowski <pawel.langowski@3mdeb.com>
---
 meta-oe/recipes-extended/qcbor/qcbor_git.bb | 32 +++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-extended/qcbor/qcbor_git.bb

diff --git a/meta-oe/recipes-extended/qcbor/qcbor_git.bb b/meta-oe/recipe=
s-extended/qcbor/qcbor_git.bb
new file mode 100644
index 000000000000..9c562d5a6671
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
+PV =3D "1.2+git${SRCPV}"
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


