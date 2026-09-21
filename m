Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA57BC982FF
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 11:56:10 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47396.1789991767350884526
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2026 04:56:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=a+RV8CKg;
 spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd91.aul.t-online.de (fwd91.aul.t-online.de [10.223.144.117])
	by mailout09.t-online.de (Postfix) with SMTP id DD4343817C
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 13:55:21 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.133]) by fwd91.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x8cc9-04X1z70; Mon, 21 Sep 2026 13:55:17 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 10/24] python3-pathlib2: remove the recipe
Date: Mon, 21 Sep 2026 13:54:46 +0200
Message-ID: <20260921115500.53770-10-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921115500.53770-1-f_l_k@t-online.de>
References: <20260921115500.53770-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789991717-EBFF4A93-D1C34737/0/0 CLEAN NORMAL
X-TOI-MSGID: 3eaee751-6552-499c-bbea-f8288f01a5fe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789991721; i=f_l_k@t-online.de;
	bh=oRCImSXKw5x9NgLNYREEIoMoFmw5+vMD2sL7/Bm5x5w=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=a+RV8CKgzYEQC4cC2SiMkKtSMjM1wcYxlUAvHpeVPkm1hbdtahWKPDuQx61usFO26
	 FC92eZL6GocQbLHfuOaRoMz8iHo00wObWwU1i3zB7O307Pgf9eSzO47oj9IkDyv+F1
	 cmlx0vbH+5G1kYAYMK3eQMoHwBgF6j9M+0a62hRpTsOhOUSvsYStxIG5rQVRU4u8pV
	 25JYbSV+fYw39SYWlXdeuMAC1yDhX1MP8wh97F8z3qmjDy98Mu6PRzR1nXGquh/mrX
	 haR/4zL5RnmHBa61z1DZGAbWBVVowmiaqeenhX2avPNNWYaSwpZZNCagkba2yj/ZB4
	 rvSjnIhD/Fifw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 11:56:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130147

pathlib2 is a backport of the Python 3 pathlib module for Python 2 and
early Python 3, and it pulls in six. Nothing in the layers depends on it
any more, so drop it rather than carry a Python 2 compatibility package.

Verified that no recipe references python3-pathlib2.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../python/python3-pathlib2_2.3.7.bb                 | 12 ------------
 1 file changed, 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pathlib2_=
2.3.7.bb

diff --git a/meta-python/recipes-devtools/python/python3-pathlib2_2.3.7.b=
b b/meta-python/recipes-devtools/python/python3-pathlib2_2.3.7.bb
deleted file mode 100644
index d4de40893a..0000000000
--- a/meta-python/recipes-devtools/python/python3-pathlib2_2.3.7.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY =3D "Object-oriented filesystem paths"
-HOMEPAGE =3D "https://github.com/mcmtroffaes/pathlib2"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3D2dc08586cce3ab91bfa091b65=
5c0e440"
-
-SRC_URI[sha256sum] =3D "7a4329d67beff9a712e1d3ae147e4e3e108b0bfd284ffdea=
03a635126c76b3c0"
-
-inherit pypi setuptools3
-
-RDEPENDS:${PN} +=3D "python3-six python3-ctypes"
-
-BBCLASSEXTEND =3D "native nativesdk"
--=20
2.55.0


