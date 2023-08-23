Return-Path: <tymoteusz.burak@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC0B8EE4993
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 08:53:45 +0000 (UTC)
Received: from 1.mo576.mail-out.ovh.net (1.mo576.mail-out.ovh.net [178.33.251.173])
 by mx.groups.io with SMTP id smtpd.web10.7255.1692780821081750614
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Aug 2023 01:53:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: 3mdeb.com, ip: 178.33.251.173, mailfrom: tymoteusz.burak@3mdeb.com)
Received: from director3.ghost.mail-out.ovh.net (unknown [10.108.16.43])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id CF1A425A67
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 08:53:38 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-2ql9x (unknown [10.110.103.53])
	by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id C8EB81FE45;
	Wed, 23 Aug 2023 08:53:37 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.106])
	by ghost-submission-6684bf9d7b-2ql9x with ESMTPSA
	id XQ3AJBHJ5WTylx8AxBkiIA
	(envelope-from <tymoteusz.burak@3mdeb.com>); Wed, 23 Aug 2023 08:53:37 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-106R00677e49a25-fe30-41e8-80ce-8730a3455ce1,
                    72D5459AC6468A1708DDBA2A52BB16EE728E8F76) smtp.auth=tymoteusz.burak@3mdeb.com
X-OVh-ClientIp: 213.192.77.249
From: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Cc: piotr.krol@3mdeb.com,
	tomasz.zyjewski@3mdeb.com,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v3] libfaketime: add recipe
Date: Wed, 23 Aug 2023 10:53:10 +0200
Message-ID: <20230823085310.339821-1-tymoteusz.burak@3mdeb.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 14488642952105283632
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedruddvgedgtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepvfihmhhothgvuhhsiicuuehurhgrkhcuoehthihmohhtvghushiirdgsuhhrrghkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpefhkedvgeffteduhfevgeehtdejteeuudfhvddugffgvdefkeeuvdegteefteefkeenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeothihmhhothgvuhhsiidrsghurhgrkhesfehmuggvsgdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdguvghvvghlsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheejiedpmhhouggvpehsmhhtphhouhht
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 08:53:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104531

This commit adds the libfaketime library recipe, which provides time
manipulation capabilities for testing and debugging purposes. libfaketime=
 allows
developers to modify the system time reported to applications, aiding in =
scenarios
where accurate time emulation is required.

I deleted the extra flags altogether as they seem to be only necessary
for old versions of this project (0.9.6).

CC: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
---
 .../libfaketime/libfaketime_0.9.10.bb         | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.b=
b

diff --git a/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb b/met=
a-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
new file mode 100644
index 000000000000..7500e57658aa
--- /dev/null
+++ b/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
@@ -0,0 +1,30 @@
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


