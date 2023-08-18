Return-Path: <tymoteusz.burak@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E202BC001DE
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 10:52:41 +0000 (UTC)
Received: from 11.mo583.mail-out.ovh.net (11.mo583.mail-out.ovh.net [46.105.47.167])
 by mx.groups.io with SMTP id smtpd.web11.8640.1692355952309740552
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Aug 2023 03:52:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: 3mdeb.com, ip: 46.105.47.167, mailfrom: tymoteusz.burak@3mdeb.com)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.109.143.216])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 25B4B249FA
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Aug 2023 10:52:29 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-prlcp (unknown [10.110.115.102])
	by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 67C971FEB0;
	Fri, 18 Aug 2023 10:52:29 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.95])
	by ghost-submission-6684bf9d7b-prlcp with ESMTPSA
	id 9rbSCG1N32TMggAA4dmeJw
	(envelope-from <tymoteusz.burak@3mdeb.com>); Fri, 18 Aug 2023 10:52:29 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-95G0012909af33-726e-4dc4-87d6-9905a81fecb2,
                    93BD7409364DBD10EE1484F369572579063D6806) smtp.auth=tymoteusz.burak@3mdeb.com
X-OVh-ClientIp: 213.192.77.249
From: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Cc: piotr.krol@3mdeb.com,
	tomasz.zyjewski@3mdeb.com
Subject: [meta-oe][PATCH v2] libfaketime: add recipe
Date: Fri, 18 Aug 2023 12:52:12 +0200
Message-ID: <20230818105212.34481-1-tymoteusz.burak@3mdeb.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 5579115514386370713
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedruddufedgfeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvhihmohhtvghushiiuceuuhhrrghkuceothihmhhothgvuhhsiidrsghurhgrkhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepjeegleduhfduhfefueeileetudeuffeutdekffduheevhedugeetteethfelteefnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehthihmohhtvghushiirdgsuhhrrghkseefmhguvggsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdquggvvhgvlheslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehkeefpdhmohguvgepshhmthhpohhuth
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Aug 2023 10:52:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104485

This commit adds the libfaketime library recipe, which provides time
manipulation capabilities for testing and debugging purposes. libfaketime=
 allows
developers to modify the system time reported to applications, aiding in =
scenarios
where accurate time emulation is required.

GitHub Repository: https://github.com/wolfcw/libfaketime

Signed-off-by: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
---
 .../libfaketime/libfaketime_0.9.10.bb         | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.b=
b

diff --git a/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb b/met=
a-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
new file mode 100644
index 000000000000..f26e5b0db872
--- /dev/null
+++ b/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
@@ -0,0 +1,34 @@
+DESCRIPTION =3D "A library for faking the system time in user-space prog=
rams"
+SECTION =3D "libs"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
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


