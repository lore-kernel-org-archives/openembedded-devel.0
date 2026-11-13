Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6288.1794554081023209444
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2026 23:14:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=M7/RZWYU;
 spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd91.aul.t-online.de (fwd91.aul.t-online.de [10.223.144.117])
	by mailout07.t-online.de (Postfix) with SMTP id DEAC4105B3
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 08:14:38 +0100 (CET)
Received: from localhost.localdomain ([79.219.233.205]) by fwd91.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xRlUb-3cnkv20; Fri, 13 Nov 2026 08:14:37 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] iniparser: fetch without the Git LFS content
Date: Fri, 13 Nov 2026 08:14:33 +0100
Message-ID: <20261113071433.2572153-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1794554078-40FF69BF-5E66E113/0/0 CLEAN NORMAL
X-TOI-MSGID: 11086f37-956b-47c6-9287-e753d11bfd56
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1794554078; i=f_l_k@t-online.de;
	bh=oGH7ZZ36+fiS/UhrU1VVpvJ9fAa/mu6K0JL/6DiwWeo=;
	h=From:To:Subject:Date;
	b=M7/RZWYUCe1llbgiriRTOHZzr3I1bJwCK4VmucZsB6K0wnB4sV7NqQecfyWzuS3/V
	 3giYvqVPiNtK5tSrb8OI96QRZ00/G+Gd1pJmd6KqnMIehHRxHchmmwjc34coJ4Bi/o
	 cGEINeU3qsl9eKDYWt5i+xKOWGaw9T8/l4B63UcslUcynbKslSW+nuc0V2lWysi4js
	 zGKFnv1lOXG1uqnZO86Y0as06mSCjuP7qeuzQsCI0zwMLnMPGR7oWZ32AKD18nzcLx
	 8A5ViIYWSgvuVVQ1hsLuwsuZlww2ueZ2JHA8OX25LwUJsKayjr/WkM3TBgIRWl/43h
	 2JXvr+Y+jYSaQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 07:14:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132226
Content-Type: text/plain; charset="utf-8"

The repository keeps its PNG images in Git LFS. They belong to the
documentation, which the recipe does not build, so the fetch no longer
needs git-lfs on the host. Tested by building iniparser for corei7-64.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-support/iniparser/iniparser_4.3.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/iniparser/iniparser_4.3.2.bb b/meta-=
oe/recipes-support/iniparser/iniparser_4.3.2.bb
index cf4e49744a..72c46a66ce 100644
--- a/meta-oe/recipes-support/iniparser/iniparser_4.3.2.bb
+++ b/meta-oe/recipes-support/iniparser/iniparser_4.3.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8474d3b745f77e=
203f1fc82fb0bb7678"
 SRCBRANCH =3D "main"
 SRCREV =3D "4fff3f22b63819d30ad5c2e4d7c7df9ec272cffc"
=20
-SRC_URI =3D "git://gitlab.com/iniparser/iniparser.git;protocol=3Dhttps;b=
ranch=3D${SRCBRANCH}"
+SRC_URI =3D "git://gitlab.com/iniparser/iniparser.git;protocol=3Dhttps;b=
ranch=3D${SRCBRANCH};lfs=3D0"
=20
 inherit cmake
=20
--=20
2.56.0

