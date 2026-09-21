Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D83D2C982FA
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 11:55:28 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47381.1789991726794818460
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2026 04:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=PQFPaUQQ;
 spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd91.aul.t-online.de (fwd91.aul.t-online.de [10.223.144.117])
	by mailout05.t-online.de (Postfix) with SMTP id 645948AC
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 13:55:22 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.133]) by fwd91.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x8ccB-04X1zK0; Mon, 21 Sep 2026 13:55:19 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 23/24] python3-wxgtk4: drop the six and attrdict3 dependencies
Date: Mon, 21 Sep 2026 13:54:59 +0200
Message-ID: <20260921115500.53770-23-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921115500.53770-1-f_l_k@t-online.de>
References: <20260921115500.53770-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789991719-83FFCA93-43778356/0/0 CLEAN NORMAL
X-TOI-MSGID: d6de3698-998f-4a13-8dc1-2c1dc771e203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789991722; i=f_l_k@t-online.de;
	bh=cCoJ+Sv4sdwsFBq/H11RLfDnKqmHgkCrexkFhgx3w7U=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=PQFPaUQQPxiMbt+NJyCBb4TeUuHSHQk85tbZC6q498I5S93h7Jp4dFf1Mv9JjWUe5
	 aBxZzP9gnMre2U6f/K8hzIzPNkDQ26D2IiyXst43w5TyyuCyAR3d7ytWRZTjeBFPx4
	 uzLZn2Csn59R7LAN+mgc6BnKcPv0L26u/hyexxjzac+LyxM+pKq4n3KP1ZwlZToykE
	 LUFZxZ0tZttwcAeqRPJmzJJPVDFYECNqKzuk769Z6mx11wqyeVFbKMZc6XqQzBv0Nn
	 4cad32rnM+4J7cb2fRPbAbcnuHNYadOzqyQM/Ml3qzuZO/HLEp5OK+028JfNRCRsxe
	 dQHRpKVT68pbA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 11:55:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130136

wxPython's build no longer imports six or attrdict; both native
dependencies are stale.

Built for intel-corei7-64.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.5.bb     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4=
.2.5.bb b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.=
5.bb
index a1ed78685e..d2f910c4da 100644
--- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.5.bb
+++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.5.bb
@@ -4,7 +4,7 @@ HOMEPAGE =3D "https://www.wxpython.org"
 LICENSE =3D "BSD-2-Clause AND LGPL-2.0-only AND LGPL-2.0-or-later WITH W=
xWindows-exception-3.1"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D102f37a0d23aa258e59e4cc8b=
5380b35"
=20
-DEPENDS =3D "python3-attrdict3-native python3-six-native wxwidgets-nativ=
e \
+DEPENDS =3D "wxwidgets-native \
            python3-requests-native wxwidgets \
            "
=20
--=20
2.55.0


