Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D1CBC982E1
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 11:55:27 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47379.1789991724365812356
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2026 04:55:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=Hj9mzxPM;
 spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd91.aul.t-online.de (fwd91.aul.t-online.de [10.223.144.117])
	by mailout05.t-online.de (Postfix) with SMTP id 1E0A1897
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 13:55:22 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.133]) by fwd91.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x8ccA-04X1zB0; Mon, 21 Sep 2026 13:55:18 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 14/24] python3-pywbem: drop the six dependency
Date: Mon, 21 Sep 2026 13:54:50 +0200
Message-ID: <20260921115500.53770-14-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921115500.53770-1-f_l_k@t-online.de>
References: <20260921115500.53770-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789991718-8EFFAA93-439B79CF/0/0 CLEAN NORMAL
X-TOI-MSGID: c2f63c27-2df3-4d78-8cba-06d479b58d84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789991722; i=f_l_k@t-online.de;
	bh=b+e+EYs0z2lVb7P0Orx8D/AktJ64ibJSuwuVuo7EOyA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Hj9mzxPMMBYJj/ZmylnJkQl2uVb4ATjgBgn11ffogXkq5A0QS6lH4tAp9Qwd6Yw8P
	 hEXXoDabmTPGEKOjzoJHForIlCAu/aZXDweX5iup0WPCXQzuHWqhQ+Q8PR45aTzmj+
	 hw0CmYemaAydvt5PLx+kB2szYbWKuU6W6ZIBd65+IzTAFnlS1jIsrZgG4X3U8Klf1L
	 j1uVC8iGjGtQBVZlrPg87EE0Ou46oFhkI4g4bYrbPlLAhYzFsknvqSCEa08nah5RsC
	 tZGqRqLw1Ta3xvgGU+zIe2PokJQfu9jRS6u/gYUHhVGMBSI1tWLM7AabbSjLrTDKHK
	 XbPOEPElSAzOw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 11:55:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130131

pywbem has not used six since the 1.x series; both the native build
dependency and the runtime dependency are stale.

Built for intel-corei7-64.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-python/recipes-extended/pywbem/python3-pywbem_1.9.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_1.9.0.bb =
b/meta-python/recipes-extended/pywbem/python3-pywbem_1.9.0.bb
index c2fe5f9738..58c4ebbbc4 100644
--- a/meta-python/recipes-extended/pywbem/python3-pywbem_1.9.0.bb
+++ b/meta-python/recipes-extended/pywbem/python3-pywbem_1.9.0.bb
@@ -23,7 +23,6 @@ inherit pypi python_setuptools_build_meta update-altern=
atives
 DEPENDS +=3D " \
     python3-ply-native \
     python3-pyyaml-native \
-    python3-six-native \
     python3-wheel-native \
     python3-setuptools-scm-native \
 "
@@ -38,7 +37,6 @@ RDEPENDS:${PN} +=3D "\
     python3-ply \
     python3-pyyaml \
     python3-requests \
-    python3-six \
     python3-stringold \
     python3-threading \
     python3-unixadmin \
--=20
2.55.0


