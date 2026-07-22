Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15139C44512
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 06:01:02 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41836.1784700059183012460
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jul 2026 23:00:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=pdP3C8D6;
 spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd96.aul.t-online.de (fwd96.aul.t-online.de [10.223.144.122])
	by mailout07.t-online.de (Postfix) with SMTP id A28A4E2AD
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 08:00:56 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.162.124]) by fwd96.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wmQ0l-0K9FBZ0; Wed, 22 Jul 2026 08:00:55 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] dav1d: update 1.5.3 -> 1.5.4
Date: Wed, 22 Jul 2026 08:00:48 +0200
Message-ID: <20260722060048.49786-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1784700055-457F9957-D24956A8/0/0 CLEAN NORMAL
X-TOI-MSGID: 70622b90-a998-4e45-acb9-d1aab0a9dc39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1784700056; i=f_l_k@t-online.de;
	bh=bGgLltxAZjeUJ4RWfxaHwlg0Del9kkZuq7iaB+25h2o=;
	h=From:To:Subject:Date;
	b=pdP3C8D62ti99YhmkpT6AMUIqjGpZyRskT+LhKnDhz8/ZOCxQZHVNN8MFx2Gc0mzK
	 TnwLswtKPn7O5SNKzdBSa9tL23K4ywzAyBZGME1wzeXlkgkusSPMfrL0PRSwspNJy8
	 P/2clbI3D9E2c2M0zqhkHUPnzAfAdj14uEPjzjEbr3J/nMNqStII9a0S2R1aoZG7QP
	 bBJ7I56G4Pu5Vc7vBmXj8Sy81Om7BNu8I7rPrKI9teFWKWVO9RHtpf4Et45l9KLKGP
	 GPEq37YBWkz0T5J7mkhn8ds+cLHoUerR9x70ycQLQkPTHV/Op4ph8pTx52F3/LhVBt
	 pbFdM+XNgniqQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 06:01:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128361

Changes for 1.5.4 'Sonic':
--------------------------

1.5.4 is a minor release of dav1d, focused on optimizations and maintenan=
ce:
 - Support for OS/2, including API exports and assembly
 - Switch to external checkasm
 - Add Armv9.3-A GCS (Guarded Control Stack) support
 - AArch64: optimize ipred_v, ipred_h and ipred_smooth_* 8bpc functions, =
and
   reduce .text size
 - ARM32: optimize prep_neon
 - RISC-V: ipred_(dc, h, v, pal) optimizations for 8 and 16bpc,
   generate_grain_y for 8bpc, and optimizations (prep/put_8tap, 6-tap and=
 copy paths)
 - Portability improvements for non-POSIX systems (signal() fallback)
 - Schedule tile tasks for all passes at once, improving threading
 - Precompute the quantization matrix tables at build time
 - Move loop-invariant computations out of hot loops

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-multimedia/dav1d/{dav1d_1.5.3.bb =3D> dav1d_1.5.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/dav1d/{dav1d_1.5.3.bb =3D> dav=
1d_1.5.4.bb} (91%)

diff --git a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.3.bb b/me=
ta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.4.bb
similarity index 91%
rename from meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.3.bb
rename to meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.4.bb
index 6c092c1649..ed45711b12 100644
--- a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.3.bb
+++ b/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.4.bb
@@ -7,7 +7,7 @@ LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D48d9210a87a24f62609b5a4f777d8=
dfe"
=20
 SRC_URI =3D "git://code.videolan.org/videolan/dav1d.git;protocol=3Dhttps=
;nobranch=3D1"
-SRCREV =3D "b546257f770768b2c88258c533da38b91a06f737"
+SRCREV =3D "54706fc6bc0cdecab7e9593974a4039cc038fca7"
=20
 DEPENDS:append:x86 =3D " nasm-native"
 DEPENDS:append:x86-64 =3D " nasm-native"
--=20
2.55.0


