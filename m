Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7880BC54E6E
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 04:51:28 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.9110.1710305480573111971
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Mar 2024 21:51:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=IA+MqMfe;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 2650387DE5;
	Wed, 13 Mar 2024 05:51:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710305478;
	bh=iQ1APZnRBBD25OqpPntDlAdAm6C80uSanFU6Bvz4eTo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IA+MqMfe+NQcHk3/ZSwHmF52PioGVKaKRislY3HFKiECjsrVVF3NMgzElEAXadGlA
	 QQHVkjc2JwaCWv42Ojo+WzqfiLZA/Y4ZMr7gbNfcZx171DFxTnIOzOQiZhvZaJ2GPf
	 sgj46WoPxJyipiyztkwUtmZPPM+mGFDNeU03KHQi0aBwissxB9ELVQnJZb62y9TAn+
	 IZr7miG2PYXd6u/eXJTuvls7hsmTJFmR6OSbio3v4jHF/dbxVljcAUhCfC0cViIXPj
	 qnYbpjJ06aFneTprMlqRcstO9J7colGD13DccCxKz04DeEN6/V15Xox5llKcRul9xT
	 pCK130csIPaTw==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Fabio Estevam <festevam@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 7/8] lvgl: Build shared library
Date: Wed, 13 Mar 2024 05:40:10 +0100
Message-ID: <20240313045038.90500-8-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240313045038.90500-1-marex@denx.de>
References: <20240313045038.90500-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Mar 2024 04:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109287

Build LVGL as shared library instead of static library. In case
there are multiple applications linking against LVGL, this is more
efficient, and it also makes it possible to update only the LVGL
library separately from the applications.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Fabio Estevam <festevam@denx.de>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb b/meta-oe/recipe=
s-graphics/lvgl/lvgl_9.0.0.bb
index bdd61d891..d147e8920 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
@@ -14,7 +14,7 @@ PV .=3D "+git${SRCPV}"
=20
 inherit cmake
=20
-EXTRA_OECMAKE =3D "-DLIB_INSTALL_DIR=3D${baselib}"
+EXTRA_OECMAKE =3D "-DLIB_INSTALL_DIR=3D${baselib} -DBUILD_SHARED_LIBS=3D=
ON"
 S =3D "${WORKDIR}/git"
=20
 ALLOW_EMPTY:${PN} =3D "1"
--=20
2.43.0


