Return-Path: <tymoteusz.burak@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 733DDC001DE
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 09:17:01 +0000 (UTC)
Received: from 3.mo560.mail-out.ovh.net (3.mo560.mail-out.ovh.net [46.105.58.226])
 by mx.groups.io with SMTP id smtpd.web10.7333.1692350214431801043
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Aug 2023 02:16:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: 3mdeb.com, ip: 46.105.58.226, mailfrom: tymoteusz.burak@3mdeb.com)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.108.16.251])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4781424673
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Aug 2023 09:16:52 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-rm2cr (unknown [10.108.20.192])
	by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 818AB1FEBD;
	Fri, 18 Aug 2023 09:16:51 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.97])
	by ghost-submission-6684bf9d7b-rm2cr with ESMTPSA
	id 3b8uDwM332RxUiUAJd0zsQ
	(envelope-from <tymoteusz.burak@3mdeb.com>); Fri, 18 Aug 2023 09:16:51 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-97G00202e3c334-d07d-4fdd-aa61-2817bc9669f4,
                    93BD7409364DBD10EE1484F369572579063D6806) smtp.auth=tymoteusz.burak@3mdeb.com
X-OVh-ClientIp: 213.192.77.249
From: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Cc: piotr.krol@3mdeb.com,
	tomasz.zyjewski@3mdeb.com
Subject: [meta-oe][PATCH v2] libfaketime: add recipe
Date: Fri, 18 Aug 2023 11:16:17 +0200
Message-ID: <20230818091617.24061-1-tymoteusz.burak@3mdeb.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 3964293574422024345
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedruddufedgudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvhihmohhtvghushiiuceuuhhrrghkuceothihmhhothgvuhhsiidrsghurhgrkhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepjeegleduhfduhfefueeileetudeuffeutdekffduheevhedugeetteethfelteefnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehthihmohhtvghushiirdgsuhhrrghkseefmhguvggsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdquggvvhgvlheslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehiedtpdhmohguvgepshhmthhpohhuth
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Aug 2023 09:17:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104481

This commit adds the libfaketime library recipe, which provides time
manipulation capabilities for testing and debugging purposes. libfaketime=
 allows
developers to modify the system time reported to applications, aiding in =
scenarios
where accurate time emulation is required.

GitHub Repository: https://github.com/wolfcw/libfaketime

Signed-off-by: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
---
 .../libfaketime/libfaketime_0.9.10.bb         | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.b=
b

diff --git a/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb b/met=
a-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
new file mode 100644
index 000000000000..b49491bccbd8
--- /dev/null
+++ b/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
@@ -0,0 +1,35 @@
+DESCRIPTION =3D "A library for faking the system time in user-space prog=
rams"
+SECTION =3D "libs"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
+TAG =3D "v${PV}"
+
+SRCREV =3D "d475b925943ad404c6c728ac868dc73949e7281c"
+SRC_URI =3D "\
+    git://git@github.com/wolfcw/libfaketime.git;branch=3Dmaster;protocol=
=3Dhttps \
+    "
+
+S =3D "${WORKDIR}/git"
+
+EXTRA_OEMAKE +=3D "\
+    EXTRA_FLAGS=3D'-Wno-error=3Dnonnull-compare' \
+    "
+
+do_configure[noexec] =3D "1"
+do_compile () {
+    oe_runmake
+}
+do_install () {
+    install -d ${D}${libdir}/faketime
+    oe_libinstall -C src libfaketime ${D}${libdir}/faketime
+    install -d ${D}${bindir}
+    install -m 0755 src/faketime ${D}${bindir}
+}
+
+PACKAGES =3D+ "lib${PN}"
+
+FILES:${PN} =3D "${bindir}/faketime"
+FILES:lib${PN} =3D "${libdir}/faketime/*"
+
+INSANE_SKIP:${PN} +=3D "dev-so"
+INSANE_SKIP:lib${PN} +=3D "dev-so"
--=20
2.41.0


