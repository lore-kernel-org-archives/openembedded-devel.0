Return-Path: <ewa.kujawska@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20318C2FC14
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 12:47:59 +0000 (UTC)
Received: from 9.mo583.mail-out.ovh.net (9.mo583.mail-out.ovh.net [178.32.96.204])
 by mx.groups.io with SMTP id smtpd.web10.186347.1692276475460455431
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Aug 2023 05:47:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: 3mdeb.com, ip: 178.32.96.204, mailfrom: ewa.kujawska@3mdeb.com)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.108.16.108])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 1D64527444
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 12:47:52 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-2hkcz (unknown [10.110.103.92])
	by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 6023E1FEAA;
	Thu, 17 Aug 2023 12:47:52 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.105])
	by ghost-submission-6684bf9d7b-2hkcz with ESMTPSA
	id xc5fCPgW3mTa7AYAsXhSjg
	(envelope-from <ewa.kujawska@3mdeb.com>); Thu, 17 Aug 2023 12:47:52 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-105G0067ba3b264-6d6b-4070-b023-8e4db9cab176,
                    746B728346A88655F675273AEEE7EA7B681C06C7) smtp.auth=ewa.kujawska@3mdeb.com
X-OVh-ClientIp: 213.192.77.249
From: Ewa Kujawska <ewa.kujawska@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Cc: piotr.krol@3mdeb.com,
	tomasz.zyjewski@3mdeb.com
Subject: [meta-python][PATCH v2] python3-libusb1_1.7.1.bb: recipe added
Date: Thu, 17 Aug 2023 14:47:26 +0200
Message-ID: <20230817124736.3524633-1-ewa.kujawska@3mdeb.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 1655072864304139673
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudduuddgheeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefgfigrucfmuhhjrgifshhkrgcuoegvfigrrdhkuhhjrgifshhkrgesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepjefggfefvddutdekheegtedttdejvddttddvheejfeejtdeikedugedvvdejleeunecuffhomhgrihhnpehgihhthhhusgdrtghomhdpphihthhhohhnhhhoshhtvggurdhorhhgnecukfhppeduvdejrddtrddtrddupddvudefrdduledvrdejjedrvdegledpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegvfigrrdhkuhhjrgifshhkrgesfehmuggvsgdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdguvghvvghlsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheekfedpmhhouggvpehsmhhtphhouhht
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 12:47:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104463

A pure-python wrapper for libusb-1.0 refers to a Python module or
package that provides an interface to interact with the libusb-1.0
library using Python code. libusb-1.0 is a cross-platform library
that allows applications to communicate with USB devices without
the need for platform-specific drivers. It provides a standardized
way to access USB devices from various operating systems.

Signed-off-by: Ewa Kujawska <ewa.kujawska@3mdeb.com>
---
 .../python/python3-libusb1_1.7.1.bb                 | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-libusb1_1.7.1.bb=
 b/meta-python/recipes-devtools/python/python3-libusb1_1.7.1.bb
index 476966c2178b..9f95e5595178 100644
--- a/meta-python/recipes-devtools/python/python3-libusb1_1.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-libusb1_1.7.1.bb
@@ -1,15 +1,16 @@
 SUMMARY =3D "Pure-python wrapper for libusb-1.0"
+
 HOMEPAGE =3D "http://github.com/vpelletier/python-libusb1"
-AUTHOR =3D "Vincent Pelletier <plr.vincent@gmail.com>"
-LICENSE =3D "LGPL-2.1"
+LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
=20
-SRC_URI =3D "https://files.pythonhosted.org/packages/80/bb/4ee9d760dd294=
99d877ee384f1d2bc6bb9923defd4c69843aef5e729972d/libusb1-1.7.1.tar.gz"
-SRC_URI[md5sum] =3D "cb4073182fef4cee6ab9c6666b48d1a1"
+SRC_URI =3D "https://files.pythonhosted.org/packages/80/bb/4ee9d760dd294=
99d877ee384f1d2bc6bb9923defd4c69843aef5e729972d/libusb1-${PV}.tar.gz"
 SRC_URI[sha256sum] =3D "adf64a4f3f5c94643a1286f8153bcf4bc787c348b38934aa=
cd7fe17fbeebc571"
=20
-S =3D "${WORKDIR}/libusb1-1.7.1"
+PV =3D "1.7.1"
+
+S =3D "${WORKDIR}/libusb1-${PV}"
=20
-RDEPENDS_${PN} =3D "libusb1"
+RDEPENDS:${PN} =3D "libusb1"
=20
 inherit setuptools3
--=20
2.41.0


