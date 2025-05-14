Return-Path: <dmkhn@proton.me>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58022C3ABD8
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 21:23:34 +0000 (UTC)
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by mx.groups.io with SMTP id smtpd.web10.113326.1747257812081911637
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 May 2025 14:23:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@proton.me header.s=hhuuv2aiifeuvg2ty7rj5kl2am.protonmail header.b=eG6gE1nN;
 spf=pass (domain: proton.me, ip: 185.70.43.16, mailfrom: dmkhn@proton.me)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=hhuuv2aiifeuvg2ty7rj5kl2am.protonmail; t=1747257810; x=1747517010;
	bh=nOzuq207xJtSR9L3bk5ZK5fZ3ohOI6ad9y+Hkq4Foko=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=eG6gE1nNk505PYYX3+nPIrcWV/Abjto+yqMrdgifVqlilKkg5440fL+F59jsKWGbH
	 UpJFSsPcmMICSFwRUU7pKfT0D/s22I4+2D9mK4TCBLm1p4Qka59YcZtJp6fIzcfNUg
	 2lEGhvdxwITmKeCRzv/mnNRhrRqv4J8nU/UdXQrPqP1+b9GqgStwvB/lhV6kPlRPMr
	 9zKW/xHCCuFJIXs8nawLjeVADo7DSGVa+DtbQxx184iuvdoW10moUb9YJ+6khIxs+F
	 rcbTP7Oqu27qJxJtseSYMm95tJYQOttHjvQw8jeQ/CFjBvXFxYELUFEcwvzi23hqE4
	 QPlaAyvJjcbiQ==
Date: Wed, 14 May 2025 21:23:26 +0000
To: openembedded-devel@lists.openembedded.org
From: dmkhn@proton.me
Cc: raj.khem@gmail.com, Denis Mukhin <dmukhin@ford.com>
Subject: [meta-oe][PATCH v2] dediprog-flasher: enable native builds
Message-ID: <20250514212249.74664-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 67b52ab8be44d541434b832a2a788f6e0123a30f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 May 2025 21:23:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117417

From: Denis Mukhin <dmukhin@ford.com>

Update dediprog-flasher recipe to support native class variants.

Normally, the recipe comes with a USB udev rule. Do not package USB udev ru=
le
into nativesdk artifacts because this will pollute the host environment, wh=
ich
is not desired.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 .../dediprog-flasher_1.14.20.bb               | 20 ++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.=
bb b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb
index 83a88ab75f..3d55b34a8d 100644
--- a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb
+++ b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb
@@ -12,18 +12,32 @@ SRC_URI =3D " \
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
+    # The file redides outside the nativesdk ${prefix} and must not pollut=
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
+FILES:${PN}:append:class-target =3D " \
+    ${sysconfdir}/udev \
+"
+
 inherit pkgconfig
+
+BBCLASSEXTEND +=3D " native nativesdk"
--=20
2.34.1



