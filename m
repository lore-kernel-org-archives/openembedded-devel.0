Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C0AC98310
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 05:59:49 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1603.1790229583824278315
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 22:59:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=AM+6zT1P;
 spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout07.t-online.de (Postfix) with SMTP id 9B6ACEF02
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 07:59:41 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.161.151]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x9cUe-4OuUPx0; Thu, 24 Sep 2026 07:59:40 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/4] simpleiot: drop the require of the generated files
Date: Thu, 24 Sep 2026 07:59:24 +0200
Message-ID: <20260924055926.7886-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924055926.7886-1-f_l_k@t-online.de>
References: <20260924055926.7886-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1790229580-6B7FD986-83754419/0/0 CLEAN NORMAL
X-TOI-MSGID: d5f56411-c87b-486d-9893-87040a95e31d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1790229581; i=f_l_k@t-online.de;
	bh=vGseXYUIodUXVmkPhUZWYDofIn6V78B9cS8wAHz7EDk=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=AM+6zT1PHhblxYq7eeW/93wHl0/d7Z8pZs3b0DWxSePgH/bDd189KSUngMX1gV+vo
	 lRCNqPe7640JbVUjefUQpCgJremGKp8NTnD+dQnIcVsqUBOXKi5oLd9aoNST0sFuIp
	 Lyyw2DfV4esbc8qDJxYajn9SyUV3Dj7ss7shMcFtYqBW8RqMsWZcNKZe5B9WK/+z6S
	 iXas46Pvdh6/+zZwBPD9ppi3v7i7JQMufTDTv1si7REwrgwj9TIiY2r2iwm96IknyR
	 G2aQK70kUzlUVdATpNJiWH3M1V37R5a3F8gCruzbtGkXMnfJwww31sgss/a8p7JAdG
	 ju8wdlbgOarpg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 05:59:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130277

go-mod-update-modules includes the -licenses.inc and -go-mods.inc files
itself now, requiring them again includes them twice.

AI-Generated: Uses Claude Code (Claude Fable 5.1)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-extended/simpleiot/simpleiot_0.18.5.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-oe/recipes-extended/simpleiot/simpleiot_0.18.5.bb b/met=
a-oe/recipes-extended/simpleiot/simpleiot_0.18.5.bb
index e852e3d3e5..736c3554f0 100644
--- a/meta-oe/recipes-extended/simpleiot/simpleiot_0.18.5.bb
+++ b/meta-oe/recipes-extended/simpleiot/simpleiot_0.18.5.bb
@@ -10,9 +10,6 @@ SRC_URI =3D "git://${GO_IMPORT};protocol=3Dhttps;branch=
=3Dmaster;destsuffix=3D${GO_SRCUR
=20
 SRCREV =3D "9addf01e40eae111f59c822141a47aa87caf04b6"
=20
-require ${BPN}-licenses.inc
-require ${BPN}-go-mods.inc
-
 LIC_FILES_CHKSUM:remove:riscv64 =3D "file://pkg/mod/github.com/remyoudom=
pheng/bigfft@v0.0.0-20230129092748-24d4a6f8daec/LICENSE;md5=3D591778525c8=
69cdde0ab5a1bf283cd81;spdx=3DBSD-3-Clause"
=20
 GO_IMPORT =3D "github.com/simpleiot/simpleiot"
--=20
2.55.0


