Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FD89C54E67
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 09:56:41 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.39849.1710928590759617086
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Mar 2024 02:56:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=R1kJgzg4;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id B62F387F8F;
	Wed, 20 Mar 2024 10:56:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710928588;
	bh=NUk9J+LQAt3ltULalrpjkbdR2rmKKk46Bsk2nAqbwZc=;
	h=From:To:Cc:Subject:Date:From;
	b=R1kJgzg41MGHeEILegX22Uy45njyp//FAYLQ5P/Ccsfpdm7bpinmGFOwCvLEe6NpX
	 aiS4amvmkrb9uyoJJOEASSzSqkqdIBUtEBEZtoQsb5NdehZMsHnbFnTKLIs6QfBq0Y
	 fRD6Lp9MjsMoH3/RE5Tj/rvVeZL1i0qIlOG8+ORzuzz+wB/TzCyOrHGxwHEHybj9n/
	 Anh7gGCFeB0GO0D5t8Zrx83F9WemZi2fsrxm1y64YbTnmr7vnoPGMcqTHC5zxULKm1
	 2fUFlOasYqamjy+jKYO+8CFhWqMIbEtjofHo6hFEUx0eZR80Ynk9jjVp9fQg80juCg
	 xja14pthY+cSA==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Christophe Chapuis <chris.chapuis@gmail.com>,
	Fabio Estevam <festevam@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 1/2] lvgl: Reinstate demo configuration settings
Date: Wed, 20 Mar 2024 10:55:37 +0100
Message-ID: <20240320095612.176662-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Mar 2024 09:56:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109487

The LVGL demo is configured slightly differently than the LVGL itself.
Logging and printing is enabled, memory size is higher and compressed
fonts are enabled. Reinstate the settings, otherwise the demo keeps
crashing at least with SDL2 backend.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Christophe Chapuis <chris.chapuis@gmail.com>
Cc: Fabio Estevam <festevam@denx.de>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.0.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.0.0.bb b/meta-o=
e/recipes-graphics/lvgl/lvgl-demo-fb_9.0.0.bb
index 5ae930f5c..308e74897 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.0.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.0.0.bb
@@ -24,6 +24,10 @@ EXTRA_OEMAKE =3D "DESTDIR=3D${D}"
=20
 PACKAGECONFIG ??=3D "drm"
 LVGL_CONFIG_DRM_CARD ?=3D "/dev/dri/card0"
+LVGL_CONFIG_LV_USE_LOG    =3D "1"
+LVGL_CONFIG_LV_LOG_PRINTF =3D "1"
+LVGL_CONFIG_LV_MEM_SIZE =3D "(256 * 1024U)"
+LVGL_CONFIG_LV_USE_FONT_COMPRESSED =3D "1"
 require lv-conf.inc
=20
 inherit cmake
--=20
2.43.0


