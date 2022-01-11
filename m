Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A13B7C433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 22:47:40 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.15470.1641941258987603422
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 14:47:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=oJozpvEO;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id CF6F580882;
	Tue, 11 Jan 2022 23:47:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1641941255;
	bh=CfybnL4yGlF9g7M9lJNATbOR2OtVAUh0xs8pp4Gxz3w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oJozpvEOGncXIQlNkVRIz2z/T1aqBcn4Kj+ptOTfH5rsjoLIsAjaMdze4Azc9rHvY
	 Jg9GnZfcP7W8BCfxICkGGyalT7HiBWKYy2/ir1e8WpzhPxV4IXhIgUg3SgEw6h6VdS
	 f4+KOyIL5kZAOnCMyxRUqp0dSVhpStRc0/diTfqlv8wEc841gmjQobHKLcIpOqo3Dv
	 j4Q3Jpk7r5oU+jsxDL6wvLxZK8XbbqMNB75/wJcFnVqNuZnLKtrwlrfg8UnTLWlPHQ
	 e9dKzuzcQMzjBnJeXYl6bi0uiZ1wnCi4JU/IFS54UZ7eDeFerM1DVv9gN6Z3YX72uh
	 Pvsbbv6OkhzMg==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Alejandro Hernandez Samaniego <alejandro@enedino.org>,
	Marek Vasut <marex@denx.de>
Subject: [meta-oe][dunfell][PATCH 2/5] freerdp: Upgrade 2.2.0 -> 2.3.0
Date: Tue, 11 Jan 2022 23:47:11 +0100
Message-Id: <20220111224714.1289840-2-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220111224714.1289840-1-marex@denx.de>
References: <20220111224714.1289840-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jan 2022 22:47:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94762

From: Alejandro Hernandez Samaniego <alejandro@enedino.org>

(cherry picked from commit c6a5fa624c4c196782f6a6acc1f4426df3dce781)
Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Marek Vasut <marex@denx.de>
---
 .../freerdp/{freerdp_2.2.0.bb =3D> freerdp_2.3.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/freerdp/{freerdp_2.2.0.bb =3D> freerdp_2.=
3.0.bb} (98%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.2.0.bb b/meta-oe/r=
ecipes-support/freerdp/freerdp_2.3.0.bb
similarity index 98%
rename from meta-oe/recipes-support/freerdp/freerdp_2.2.0.bb
rename to meta-oe/recipes-support/freerdp/freerdp_2.3.0.bb
index 90ede1297..e37e71b32 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.2.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.3.0.bb
@@ -13,7 +13,7 @@ inherit pkgconfig cmake gitpkgv
 PE =3D "1"
 PKGV =3D "${GITPKGVTAG}"
=20
-SRCREV =3D "d2ba84a6885f57674098fe8e76c5f99d880e580d"
+SRCREV =3D "14c7f7aed7dd4e2454ee0cd81028b9f790885021"
 SRC_URI =3D "git://github.com/FreeRDP/FreeRDP.git;branch=3Dstable-2.0;pr=
otocol=3Dhttps \
     file://winpr-makecert-Build-with-install-RPATH.patch \
 "
--=20
2.34.1


