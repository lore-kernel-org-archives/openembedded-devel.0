Return-Path: <lkml@jv-coder.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A280C433F5
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 09:04:02 +0000 (UTC)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 by mx.groups.io with SMTP id smtpd.web10.1999.1652346231196220049
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 02:03:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@jv-coder.de
 header.s=dkim header.b=uBcx1G/O;
 spf=pass (domain: jv-coder.de, ip: 5.9.79.73, mailfrom: lkml@jv-coder.de)
Received: from ubuntu.localdomain (unknown [37.24.96.116])
	by mail.jv-coder.de (Postfix) with ESMTPSA id 797CD9F69C;
	Thu, 12 May 2022 09:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
	t=1652346227; bh=nsbyn5jQbUkSjYhkHZoHFSsWwFywkfwWQcCGiZ1+/xk=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=uBcx1G/OnsSiwJbqX8rfiZsIa0CWsfIFL1G9HZV1edrKwYFrwhDnZFTk024wlE7uf
	 Gu1t5KEbwzHwMrFkeBqb6T4pJZPuxq/AzefbLeysWHbm1ZEkK6L8K7hiWVwIhztOk9
	 70/uvJJJcybPylxEvlfhDcuoRM5DWRO8Z7cQrY4g=
From: Joerg Vehlow <lkml@jv-coder.de>
To: openembedded-devel@lists.openembedded.org
Cc: Joerg Vehlow <joerg.vehlow@aox.de>
Subject: [meta-oe][PATCH] jq: Fix typo OE_EXTRACONF -> EXTRA_OECONF
Date: Thu, 12 May 2022 11:03:32 +0200
Message-Id: <20220512090332.2008862-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 May 2022 09:04:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97065

From: Joerg Vehlow <joerg.vehlow@aox.de>

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox.de>
---
 meta-oe/recipes-devtools/jq/jq_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/jq/jq_git.bb b/meta-oe/recipes-devt=
ools/jq/jq_git.bb
index d0c70da76..8b0218c83 100644
--- a/meta-oe/recipes-devtools/jq/jq_git.bb
+++ b/meta-oe/recipes-devtools/jq/jq_git.bb
@@ -21,7 +21,7 @@ PACKAGECONFIG[docs] =3D "--enable-docs,--disable-docs,r=
uby-native"
 PACKAGECONFIG[maintainer-mode] =3D "--enable-maintainer-mode,--disable-m=
aintainer-mode,flex-native bison-native"
 PACKAGECONFIG[oniguruma] =3D "--with-oniguruma,--without-oniguruma,onig"
=20
-OE_EXTRACONF +=3D " \
+EXTRA_OECONF +=3D " \
     --disable-valgrind \
 "
=20
--=20
2.25.1


