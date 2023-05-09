Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64550C7EE22
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 01:59:39 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.3795.1683597571086701350
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 18:59:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=KpHab99X;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id E91FF85FE2;
	Tue,  9 May 2023 03:59:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1683597569;
	bh=Hy6/a2YEe9FiUykpiGL7XcsaKXX9pyIWtXUOdQTkgbU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KpHab99XuGk+i+MjB1dH8MdYgjuXOAYDFmA7NIOCxOs2+xK/RRGezoWK2X1304m2t
	 oM8HkZXoN/1GyF6V+CENU685BlgMT59SLjsz6wWTXRXrJZKx2HZnJ/aHPvJWJtk4Q/
	 NqaRO1FYWsAN8pIJSQ4lH7OWOe5wPnUc1Bez/8ufeOltIZMh+MEJmvSeKBX8UnXelP
	 aUmrQ6J+Pw5v4cvkoo/6xt5N37oetlsw9j9HEiLZ84B98jftiBf3i68gVO4pZ8lnZE
	 LCC2yPQ6ey9jW3GUBgcyWpFgdty+RXUlWnVFFYsjzTDx0ccZgbt4Sw1yOQz2xLlwPC
	 Zhjzyn40m1E6w==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Fabio Estevam <festevam@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	Philippe Coval <philippe.coval.ext@huawei.com>,
	Philippe Coval <philippe.coval@huawei.com>
Subject: [meta-oe][PATCH 3/3] lvgl: Add dependency on fbdev into lvgl-demo-fb DISTRO_FEATURES
Date: Tue,  9 May 2023 03:59:15 +0200
Message-Id: <20230509015915.77182-3-marex@denx.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230509015915.77182-1-marex@denx.de>
References: <20230509015915.77182-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 01:59:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102448

This recipe hard depends on fbdev, since it specifically targets
systems using it. Add the DISTRO_FEATURES dependency to indicate
it.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Fabio Estevam <festevam@denx.de>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Cc: Philippe Coval <philippe.coval.ext@huawei.com>
Cc: Philippe Coval <philippe.coval@huawei.com>
---
 meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb b/meta-o=
e/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb
index d86d6ff9c..8e0b91cac 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb
@@ -10,6 +10,8 @@ SRCREV =3D "adf2c4490e17a1b9ec1902cc412a24b3b8235c8e"
=20
 S =3D "${WORKDIR}/git"
=20
+REQUIRED_DISTRO_FEATURES =3D "fbdev"
+
 EXTRA_OEMAKE =3D "DESTDIR=3D${D}"
=20
 do_install() {
--=20
2.39.2


