Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C9EC98304
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 11:56:12 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47403.1789991769452952304
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2026 04:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=n90cfIhm;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd91.aul.t-online.de (fwd91.aul.t-online.de [10.223.144.117])
	by mailout01.t-online.de (Postfix) with SMTP id 686521C462
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 13:55:22 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.133]) by fwd91.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x8ccB-04X1zL0; Mon, 21 Sep 2026 13:55:19 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 24/24] python3-attrdict3: remove the recipe
Date: Mon, 21 Sep 2026 13:55:00 +0200
Message-ID: <20260921115500.53770-24-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921115500.53770-1-f_l_k@t-online.de>
References: <20260921115500.53770-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789991719-E8FEEA93-34761AA6/0/0 CLEAN NORMAL
X-TOI-MSGID: f6345a0f-ed72-4ce6-b68e-5e9a7d464980
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789991722; i=f_l_k@t-online.de;
	bh=+xd15gOAKIwu1X2KYxXBvjOasfTOzIKnvYVkzFCwpMM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=n90cfIhm2WvgePijDxqefCFS0HB4MKqTYf0Zg8Pl6y91Yvd5+z5yuZkAobZimDC6H
	 c00UsGfcfKmBIKbwJz1UpuBTEGCilPemr7WBOZuNbZ91D4FJLM1ItRXiNPwl+UPWvX
	 1vMGe38l4rSsgaxHk+W+3+V+jMTz1+lk4TNmajrDUCAE7SmIZpRBYbPxEuV+zH37cj
	 yh1wq6tZMFgpvvgDMsrAJ4DIHAsgfyTf/RyvfmaKWg9yuLX5wbTFofizA9KpgxRWLs
	 3QF94UsL4z7eWFUY7G+bgC3r2f807A04Sj837BLQLB9qexrPt4/rY9GLgwYPw4BHzh
	 P6RY2kByhSH6w==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 11:56:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130154

attrdict3 is a fork of the unmaintained attrdict package; its last
release is from 2022 and it still relies on six. With the native
dependency gone from python3-wxgtk4 nothing in the layers requires it
any more, and it is not part of any packagegroup. Remove it instead of
carrying a dead Python 2 compatibility package.

Verified that no recipe references python3-attrdict3.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../python3-attrdict3/python3-attrdict3_2.0.2.bb   | 14 --------------
 1 file changed, 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python3-attrdict3/python=
3-attrdict3_2.0.2.bb

diff --git a/meta-python/recipes-devtools/python3-attrdict3/python3-attrd=
ict3_2.0.2.bb b/meta-python/recipes-devtools/python3-attrdict3/python3-at=
trdict3_2.0.2.bb
deleted file mode 100644
index ee099c7ac9..0000000000
--- a/meta-python/recipes-devtools/python3-attrdict3/python3-attrdict3_2.=
0.2.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY =3D "AttrDict is an MIT-licensed library that provides mapping o=
bjects that allow their elements to be accessed both as keys and as attri=
butes"
-HOMEPAGE =3D "https://pypi.org/project/attrdict3/"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D2b37be7e71ebfc92a94bfacf6=
b20a1cc"
-
-DEPENDS =3D ""
-
-SRC_URI[sha256sum] =3D "004c171ca1120cc1755701db99d7fa4944afb1e68950434e=
fdaa542513335fe8"
-
-inherit pypi setuptools3
-
-BBCLASSEXTEND =3D "native"
-
-RDEPENDS:${PN} +=3D "python3-six"
--=20
2.55.0


