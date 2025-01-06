Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40FEDE77188
	for <webhook@archiver.kernel.org>; Mon,  6 Jan 2025 18:01:21 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.743.1736186476105993519
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jan 2025 10:01:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout07.t-online.de (Postfix) with SMTP id 93B1B445
	for <openembedded-devel@lists.openembedded.org>; Mon,  6 Jan 2025 19:01:14 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.236.190]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tUrPd-0Py1Lt0; Mon, 6 Jan 2025 19:01:13 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 1/2] x265: drop restriction for x86/x86-64
Date: Mon,  6 Jan 2025 19:01:32 +0100
Message-ID: <20250106180133.308686-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1736186473-5FFFC99A-3F1CD34C/0/0 CLEAN NORMAL
X-TOI-MSGID: db05b2d6-ba21-4829-b906-dd783499195d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jan 2025 18:01:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114668

It can be built for various platforms

Remove SRC_URI[md5sum]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb b/meta=
-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
index 2d4f389e34..225fbdee87 100644
--- a/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
+++ b/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
@@ -12,7 +12,6 @@ SRC_URI =3D "http://ftp.videolan.org/pub/videolan/x265/=
x265_${PV}.tar.gz"
=20
 S =3D "${WORKDIR}/x265_${PV}/source"
=20
-SRC_URI[md5sum] =3D "94808045a34d88a857e5eaf3f68f4bca"
 SRC_URI[sha256sum] =3D "fb9badcf92364fd3567f8b5aa0e5e952aeea7a39a2b86438=
7cec31e3b58cbbcc"
=20
 inherit lib_package pkgconfig cmake
@@ -25,5 +24,3 @@ EXTRA_OECMAKE:append:x86 =3D " -DENABLE_ASSEMBLY=3DOFF"
 EXTRA_OECMAKE:append:aarch64 =3D " -DENABLE_PIC=3DON"
=20
 AS[unexport] =3D "1"
-
-COMPATIBLE_HOST =3D '(x86_64|i.86|aarch64).*-linux'
--=20
2.47.1


