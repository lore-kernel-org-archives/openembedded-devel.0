Return-Path: <dmkhn@proton.me>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB4E1C3ABDA
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 22:16:34 +0000 (UTC)
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by mx.groups.io with SMTP id smtpd.web11.13.1747260984540134249
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 May 2025 15:16:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@proton.me header.s=5geeh7jhjzfanmioq4mdtq5aku.protonmail header.b=TW96M6IV;
 spf=pass (domain: proton.me, ip: 185.70.43.22, mailfrom: dmkhn@proton.me)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=5geeh7jhjzfanmioq4mdtq5aku.protonmail; t=1747260981; x=1747520181;
	bh=cEfro5iKV8Fp2x2+aPBt/KQO23MLAuCNwJGMDGw9oVA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=TW96M6IVKGiUgi8lVbEhI1lBTnEvsTj+k930vtXgnzrK4FUEdHs1TkSYmp53COj2t
	 aG988Q7XEXSbiMrscN9JLIW7o79d/wewMqPebRysPRkkZQVuD2hrE8DJSssczC3qlh
	 yESJlshEq6dstRL+PNONybEnXWFXbGK7O5EfjIDrQ3AemeKUlCec1zcDTOXTuwG2D5
	 V0FQi1Zl588wDYLwiMt18Ab0UihGg5hlm6ePVFj4SnNqzFqpTzNG4EDX1kn2+LIIFL
	 wNIENgwGqVZWTTlU9Blg97V3OCUb84q3yJpEHjEGoXQkRX5roBZzXruUQd8B8TevgJ
	 HvsQ5/UWAD1YA==
Date: Wed, 14 May 2025 22:16:18 +0000
To: openembedded-devel@lists.openembedded.org
From: dmkhn@proton.me
Cc: raj.khem@gmail.com, Denis Mukhin <dmukhin@ford.com>
Subject: [meta-oe][PATCH v3] dediprog-flasher: enable native builds
Message-ID: <20250514221315.102195-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 151bc3558d4940c24d45967cfb60af7f9ba2be58
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 May 2025 22:16:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117419

From: Denis Mukhin <dmukhin@ford.com>

Update dediprog-flasher recipe to support native class variants.

Normally, the recipe comes with a USB udev rule. Do not package USB udev ru=
le
into nativesdk artifacts because this will pollute the host environment, wh=
ich
is not desired.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v2:
- fixed spelling
- dropped FILES target override
---
 .../dediprog-flasher/dediprog-flasher_1.14.20.bb | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.=
bb b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb
index 83a88ab75f..42256a7afd 100644
--- a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb
+++ b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb
@@ -12,18 +12,28 @@ SRC_URI =3D " \
     file://0002-Makefile-add-conditional-stripping.patch \
     "
=20
-EXTRA_OEMAKE =3D "NOSTRIP=3D1"
+EXTRA_OEMAKE =3D "NOSTRIP=3D1 DESTDIR=3D${D} PREFIX=3D${prefix}"
=20
 PV =3D "1.0+${SRCPV}"
=20
 S =3D "${WORKDIR}/git"
=20
-do_install () {
-    oe_runmake DESTDIR=3D${D} PREFIX=3D/usr install
+do_install() {
+    oe_runmake install
+}
+
+do_install:append:class-nativesdk() {
+    # QA override: omit packaging dediprog's udev rule under /etc/udev.
+    # The file resides outside the nativesdk ${prefix} and must not pollut=
e the
+    # host environment.
+    rm -rf ${D}/etc
 }
=20
 FILES:${PN} +=3D " \
+    ${bindir} \
     ${datadir}/DediProg \
 "
=20
 inherit pkgconfig
+
+BBCLASSEXTEND +=3D " native nativesdk"
--=20
2.34.1



