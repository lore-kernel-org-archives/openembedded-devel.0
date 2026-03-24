Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD7BF532FA
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 08:57:50 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15325.1774342663110640068
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 01:57:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=DAIA0I29;
 spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd94.mgt.mul.t-online.de (fwd94.aul.t-online.de [10.223.144.120])
	by mailout07.t-online.de (Postfix) with SMTP id F0BC7EE51
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 09:57:40 +0100 (CET)
Received: from fedora.fritz.box ([79.219.226.164]) by fwd94.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1w4xZs-4QxFxp0; Tue, 24 Mar 2026 09:57:32 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libsdl3-mixer: add tag=release-${PV}
Date: Tue, 24 Mar 2026 09:57:17 +0100
Message-ID: <20260324085717.216130-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1774342652-297F86AB-83B80F35/0/0 CLEAN NORMAL
X-TOI-MSGID: 9a71133f-4705-4242-86a3-56e373a5b625
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1774342660; i=f_l_k@t-online.de;
	bh=6aaWaDqS+qZtWLLX5QSz0PlIY8OxQlG+EqfPC/1r9jY=;
	h=From:To:Subject:Date;
	b=DAIA0I29F/GNeP8FXjK4vJjZ6kZcb+AvX73dC46Hv0gjVf/4PnYgdeqbdcFV6vq/7
	 FB6rIaW1eVvLk+N8G1J7IVVog7HaYhaC99qvHuFjVBS282bru9/hD3SJY/8ugaWZ1d
	 dub7K4xLrUWqL/8cw88POrAHCzYPGm9EG1vJ1EiLxqfA/IzUCiRwGA4WZPPJ2XJVhU
	 evPy2EBXwBypYHRuoMP9Lzm7gWPhyaXnUaNs+1aOls4G2t2UZd4iv2Ae5f1Woq5Kg6
	 60vU3U2iGaef2f17wcTxI2wvP65QN5S+MkfkCvUjUw6w37V9U9Ryx9OsJUIWZkAzoi
	 O7Hq9xvcVNfgw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 08:57:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125549

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-graphics/libsdl3/libsdl3-mixer_3.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3-mixer_3.2.0.bb b/me=
ta-oe/recipes-graphics/libsdl3/libsdl3-mixer_3.2.0.bb
index c5af2f038f..27a02fcc32 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3-mixer_3.2.0.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3-mixer_3.2.0.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Ddf8f4d887d=
3997f6e9cf81bb7f43dbf7"
=20
 DEPENDS =3D "libsdl3"
=20
-SRC_URI =3D "git://github.com/libsdl-org/SDL_mixer.git;protocol=3Dhttps;=
branch=3Drelease-3.2.x"
+SRC_URI =3D "git://github.com/libsdl-org/SDL_mixer.git;protocol=3Dhttps;=
branch=3Drelease-3.2.x;tag=3Drelease-${PV}"
 SRCREV =3D "cedfeef30e93db35eee6b25759117da63f8e5a4f"
=20
 inherit cmake pkgconfig
--=20
2.53.0


