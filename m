Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA156CA5FE0
	for <webhook@archiver.kernel.org>; Sat, 17 Jan 2026 19:25:38 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1803.1768677931831058195
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Jan 2026 11:25:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout04.t-online.de (Postfix) with SMTP id BD8E86E4
	for <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 20:25:29 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.47.142]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vhBvN-4BST570; Sat, 17 Jan 2026 20:25:29 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] highway: allow native build
Date: Sat, 17 Jan 2026 20:25:21 +0100
Message-ID: <20260117192522.52214-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1768677929-F67FB925-0FDD64B9/0/0 CLEAN NORMAL
X-TOI-MSGID: 603eeebf-c830-42ac-8caa-f5d021778d50
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 19:25:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123557

---
 meta-oe/recipes-extended/highway/highway_1.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/highway/highway_1.3.0.bb b/meta-oe/=
recipes-extended/highway/highway_1.3.0.bb
index 81b71b1f21..d279994301 100644
--- a/meta-oe/recipes-extended/highway/highway_1.3.0.bb
+++ b/meta-oe/recipes-extended/highway/highway_1.3.0.bb
@@ -16,3 +16,5 @@ EXTRA_OECMAKE =3D "-DBUILD_TESTING=3D0 -DCMAKE_BUILD_TY=
PE=3DRelease"
 CXXFLAGS:append:arm =3D " -mfp16-format=3Dieee"
 # Option not supported with clang and its default format for __fp16 anyw=
ay with clang
 CXXFLAGS:remove:toolchain-clang =3D "-mfp16-format=3Dieee"
+
+BBCLASSEXTEND =3D "native"
--=20
2.52.0


