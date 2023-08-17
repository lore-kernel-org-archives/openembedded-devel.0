Return-Path: <tymoteusz.burak@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28521C27C7A
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 08:45:08 +0000 (UTC)
Received: from 4.mo575.mail-out.ovh.net (4.mo575.mail-out.ovh.net [46.105.59.63])
 by mx.groups.io with SMTP id smtpd.web11.182558.1692261905091045091
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Aug 2023 01:45:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: 3mdeb.com, ip: 46.105.59.63, mailfrom: tymoteusz.burak@3mdeb.com)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.108.16.251])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id BBD1D2710C
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 08:45:02 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-hq9z7 (unknown [10.110.115.220])
	by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 8F32C1FE94;
	Thu, 17 Aug 2023 08:45:00 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.110])
	by ghost-submission-6684bf9d7b-hq9z7 with ESMTPSA
	id TlG5NQze3WTkJAMAm5yGVw
	(envelope-from <tymoteusz.burak@3mdeb.com>); Thu, 17 Aug 2023 08:45:00 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-110S004eadc8dc2-d94c-422c-ba8d-32c4b1fe7ef6,
                    05FB791017C74160A0BF3C0A500D873A876168E7) smtp.auth=tymoteusz.burak@3mdeb.com
X-OVh-ClientIp: 213.192.77.249
From: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Cc: piotr.krol@3mdeb.com,
	tomasz.zyjewski@3mdeb.com
Subject: [meta-oe][PATCH] libfaketime: add recipe
Date: Thu, 17 Aug 2023 10:44:23 +0200
Message-ID: <20230817084423.20928-1-tymoteusz.burak@3mdeb.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 16000726529502597273
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudduuddgtdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvhihmohhtvghushiiuceuuhhrrghkuceothihmhhothgvuhhsiidrsghurhgrkhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepjeegleduhfduhfefueeileetudeuffeutdekffduheevhedugeetteethfelteefnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrdduuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeothihmhhothgvuhhsiidrsghurhgrkhesfehmuggvsgdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdguvghvvghlsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheejhedpmhhouggvpehsmhhtphhouhht
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 08:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104450

This commit adds the libfaketime library recipe, which provides time
manipulation capabilities for testing and debugging purposes. libfaketime=
 allows
developers to modify the system time reported to applications, aiding in =
scenarios
where accurate time emulation is required.

GitHub Repository: https://github.com/wolfcw/libfaketime

Signed-off-by: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
---
 .../recipes-test/libfaketime/libfaketime.bb   | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-test/libfaketime/libfaketime.bb

diff --git a/meta-oe/recipes-test/libfaketime/libfaketime.bb b/meta-oe/re=
cipes-test/libfaketime/libfaketime.bb
new file mode 100644
index 000000000000..fadf9c432292
--- /dev/null
+++ b/meta-oe/recipes-test/libfaketime/libfaketime.bb
@@ -0,0 +1,34 @@
+DESCRIPTION =3D "A library for faking the system time in user-space prog=
rams"
+SECTION =3D "libs"
+LICENSE =3D "GPLv2"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
+PV =3D "v0.9.10"
+
+SRC_URI =3D "\
+    git://git@github.com/wolfcw/libfaketime.git;branch=3Dmaster;tag=3D${=
PV};protocol=3Dssh \
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


