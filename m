Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3FEAC98338
	for <webhook@archiver.kernel.org>; Sat, 17 Jan 2026 19:25:38 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1804.1768677931868800876
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Jan 2026 11:25:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout09.t-online.de (Postfix) with SMTP id D2F2738056
	for <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 20:25:29 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.47.142]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vhBvN-4BST580; Sat, 17 Jan 2026 20:25:29 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] libjxl: allow native build
Date: Sat, 17 Jan 2026 20:25:22 +0100
Message-ID: <20260117192522.52214-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260117192522.52214-1-f_l_k@t-online.de>
References: <20260117192522.52214-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1768677929-417F9925-E172F6C3/0/0 CLEAN NORMAL
X-TOI-MSGID: e4f797f9-4348-4a7d-8b3e-2701ffc96370
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 19:25:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123558

---
 meta-oe/recipes-multimedia/libjxl/libjxl_0.11.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-multimedia/libjxl/libjxl_0.11.1.bb b/meta-oe=
/recipes-multimedia/libjxl/libjxl_0.11.1.bb
index ad5b5d169b..8170c9055d 100644
--- a/meta-oe/recipes-multimedia/libjxl/libjxl_0.11.1.bb
+++ b/meta-oe/recipes-multimedia/libjxl/libjxl_0.11.1.bb
@@ -51,3 +51,5 @@ CFLAGS:append:toolchain-clang:arm =3D " -fno-integrated=
-as"
 CXXFLAGS:append:toolchain-clang:arm =3D " -fno-integrated-as"
=20
 FILES:${PN} +=3D "${libdir}/gdk-pixbuf-2.0 ${datadir}"
+
+BBCLASSEXTEND =3D "native"
--=20
2.52.0


