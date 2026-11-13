Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7416.1794562066568911657
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Nov 2026 01:27:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=AprU/C37;
 spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout05.t-online.de (Postfix) with SMTP id 854124E09
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 10:26:59 +0100 (CET)
Received: from localhost.localdomain ([79.219.233.205]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xRnYg-1i3vZQ0; Fri, 13 Nov 2026 10:26:58 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] udisks2: fetch 2.11.2 from the 2.11.x-branch
Date: Fri, 13 Nov 2026 10:26:50 +0100
Message-ID: <20261113092650.3890104-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1794562018-6BFFC9F4-FBA08A9D/0/0 CLEAN NORMAL
X-TOI-MSGID: d5867bbc-e8d5-4ecc-955a-ab77e326594e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1794562019; i=f_l_k@t-online.de;
	bh=z+BytbjVZSk+xzKSdqJoP7nU+kNZWMq11FSPQ+Y3CkQ=;
	h=From:To:Subject:Date;
	b=AprU/C37NFa6iCFhHyqHAnmKCnFJAK9Yx4ZokoDUryeZFOJX0BWnSqQlZ2TdytgJx
	 Fe9CqcLNQJN1ubOUWp6t8KDZPyVVwdtlp7zYYdMjrqzwIQtFALEOo9z9IOQ1o4AeUg
	 U4UJHsimFFv/gp8UnqUpTgUKqQQ7KtpA19S7rKzJB7jqRUCzTu436lgRi+irt+78m3
	 +ispbTgkv5clLRM1QZEXRVfs/lyXbmG5Op7HmvT5wHRhDh9rCEgCUMms9FzxB0l+3t
	 28qTBH6zsMRUcfUfLToFROAG384NQK4Y13s/oLXl9Az6i8tt3cFqCtscQOUthIC/JH
	 75ZfcFrVGK26g==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 09:27:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132229
Content-Type: text/plain; charset="utf-8"

SRCREV caffebe56d82 is on 2.11.x-branch, not 2.10.x-branch, so the
fetch failed. Tested by building udisks2 for corei7-64.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-support/udisks/udisks2_2.11.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/udisks/udisks2_2.11.2.bb b/meta-oe/r=
ecipes-support/udisks/udisks2_2.11.2.bb
index 6faf2291ee..5cf6431154 100644
--- a/meta-oe/recipes-support/udisks/udisks2_2.11.2.bb
+++ b/meta-oe/recipes-support/udisks/udisks2_2.11.2.bb
@@ -18,7 +18,7 @@ DEPENDS +=3D "${@bb.utils.filter('DISTRO_FEATURES', 'sy=
stemd', d)}"
 RDEPENDS:${PN} =3D "acl"
=20
 SRC_URI =3D " \
-    git://github.com/storaged-project/udisks.git;branch=3D2.10.x-branch;=
protocol=3Dhttps \
+    git://github.com/storaged-project/udisks.git;branch=3D2.11.x-branch;=
protocol=3Dhttps \
     file://0001-Makefile.am-Dont-include-buildpath.patch \
 "
 SRCREV =3D "caffebe56d8208365cf0d62e0d05d31260d91156"
--=20
2.56.0

