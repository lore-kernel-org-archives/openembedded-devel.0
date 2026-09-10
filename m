Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C104C79FBF
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 17:47:31 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20828.1789062445940194650
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 10:47:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=lJQIiuss;
 spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd97.aul.t-online.de (fwd97.aul.t-online.de [10.223.144.123])
	by mailout12.t-online.de (Postfix) with SMTP id 67D74E616
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 19:47:23 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.164.57]) by fwd97.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x4irp-47xmXg0; Thu, 10 Sep 2026 19:47:21 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libsdl2-compat: add runtime dependency on libsdl3
Date: Thu, 10 Sep 2026 19:47:15 +0200
Message-ID: <20260910174715.12014-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789062441-9BFFC9A9-5BEE06FA/0/0 CLEAN NORMAL
X-TOI-MSGID: 7e9c58f3-42eb-41e8-8aba-eefee668d9b2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789062443; i=f_l_k@t-online.de;
	bh=ZZWgxgTurSBfxvNJl94PcapDvoFDc013bG5fdcx4ULk=;
	h=From:To:Subject:Date;
	b=lJQIiussfBYHJo/czghqvF5eHaCxnj27VBAkx9pR1DC2HupBWUFr9+zb2Y88eCfQm
	 /oOgAYurDqwHQToP3c78J8xHJjdHXDPW44r+7g8PjF/giZ0dfVzJuZRBawGh4og0Yd
	 GW4kRWXcEKou9hwaggvoj8Ra9bmRfOYcXCESq3yY/f92MKhDLykhDhUbCy4JBXpCUz
	 PXVueXTY2fibqpPZgoBTArR8YvmZ51PHOkHkcATMHJ0r5FOmoxzX/jrT835kApNYkL
	 evwVzDsK95g3vFyAAO3xKLlsrYbDv6GBWkvSGHaS21lMZ8OdZ8OpCZypuAR1vfCUkF
	 7uU2r6abjr6Uw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 17:47:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129917

libSDL2-2.0.so.0 from sdl2-compat lists only libc.so.6 as NEEDED and
loads libSDL3.so.0 through dlopen(), so shlibs does not generate a
runtime dependency on libsdl3. An image that installs an SDL2 consumer
without pulling in libsdl3 by other means therefore gets a library that
fails to initialize at runtime. This was seen with plasma-desktop, whose
game controller KCM links against SDL2 and made systemsettings fail to
start on an image that had no other SDL user.

Tested by checking readelf -d on the installed libSDL2-2.0.so.0 and by
rebuilding the package for corei7-64.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.70.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.70.bb b=
/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.70.bb
index 56134f805f..ccc9f4e62f 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.70.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.70.bb
@@ -31,6 +31,8 @@ do_install:append() {
=20
 FILES:${PN} +=3D "${datadir}/licenses"
=20
+RDEPENDS:${PN} +=3D "libsdl3"
+
 RCONFLICTS:${PN} =3D "libsdl2"
 RPROVIDES:${PN} =3D "libsdl2"
=20
--=20
2.55.0


