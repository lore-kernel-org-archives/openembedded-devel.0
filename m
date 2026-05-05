Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F0CECD3430
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 12:17:15 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37368.1777983428396189979
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 May 2026 05:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=EzM4Sn4X;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout02.t-online.de (Postfix) with SMTP id 85620EE11
	for <openembedded-devel@lists.openembedded.org>; Tue,  5 May 2026 14:17:04 +0200 (CEST)
Received: from fedora.fritz.box ([79.219.234.37]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wKEi0-3vH3cP0; Tue, 5 May 2026 14:17:04 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 1/3] svt-av1: add recipe
Date: Tue,  5 May 2026 14:16:53 +0200
Message-ID: <20260505121655.131622-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1777983424-497F9855-9FD3CF04/0/0 CLEAN NORMAL
X-TOI-MSGID: 1bff2eb2-60d2-41ff-acad-b6088418b597
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1777983424; i=f_l_k@t-online.de;
	bh=rGxQaKh4PidHmZDXJcjBRFum7/AhQawQ9ibBrLGwgvY=;
	h=From:To:Subject:Date;
	b=EzM4Sn4X8Pq6D3EwOo2MMqczJ6W4xtav7kUjYMc9Xdtg4Fg3fDptu0rH0/o4MJkpa
	 WbH7VmUJlxVbkHpsR3zMZPTM0ouGAomRsQ3cLBR8XWRNCTlLsGqbOQdK0Lp+RLPCXV
	 7NORhG3t1fCfLjaYsM8FZKuXSq3nSpuhnR0fO4eR2tiv4iYad8PzT7syNy7pMw89do
	 eVM1HD5VBBAVf2ZYHMEPdERab9rd56fIJY+99VlTHArMq0WJW3sXHS56e5EW18N1Mz
	 TzGqw95uwhkAXuIbwjD9XOdSfwimlaB7M9Q9Zj3MX1Rsp/IOKSfbKRoqza9RnJakR8
	 8nSg5iKZPaC7A==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 May 2026 12:17:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126784

This adds a recipe for the svt-av1 encoder/decoder

- dont create dbg package to avoid buildpath issues

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-multimedia/svt-av1/svt-av1_4.1.0.bb    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/svt-av1/svt-av1_4.=
1.0.bb

diff --git a/meta-multimedia/recipes-multimedia/svt-av1/svt-av1_4.1.0.bb =
b/meta-multimedia/recipes-multimedia/svt-av1/svt-av1_4.1.0.bb
new file mode 100644
index 0000000000..8321d01057
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/svt-av1/svt-av1_4.1.0.bb
@@ -0,0 +1,14 @@
+SUMMARY =3D "Scalable Video Technology for AV1 (SVT-AV1 Encoder and Deco=
der)"
+HOMEPAGE =3D "https://gitlab.com/AOMediaCodec/SVT-AV1"
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D87a85a33479e0270481b17d657=
c1949f"
+
+inherit cmake
+
+DEPENDS =3D "nasm-native"
+
+SRC_URI =3D "git://gitlab.com/AOMediaCodec/SVT-AV1.git;protocol=3Dhttps;=
nobranch=3D1;tag=3Dv${PV}"
+SRCREV =3D "c04f951541ad600e0d9c10836f2ab7b9bc69816d"
+
+INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
+
--=20
2.54.0


