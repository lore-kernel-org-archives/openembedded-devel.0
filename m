Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A210C77B7C
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 00:42:04 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.21333.1685234517694209772
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 May 2023 17:41:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=N1KL4GKv;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id C4DDE84676;
	Sun, 28 May 2023 02:41:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1685234514;
	bh=Y0HdrV5oHMhBziYa2pUSsZmbxIJBiGgtcW/vV7zL0SE=;
	h=From:To:Cc:Subject:Date:From;
	b=N1KL4GKvywZvAoh68onLTG3WlL+newhyMaJcV4Eo9v/R8sPu+Py5ZFCAgi7+gyzWV
	 9tBEtYZp9AQIH2tsF4sfiTspOKzYfhiFFPWQXLddu1NbNNdbPpy87tD1yzmYB98Jnf
	 awf+kuPn8BYEp1ed8snEM5WrzSkVZZYz3uGalf6Xo5l5mukrGyQZxQT1HJwlniz47Y
	 rZv2gkMbCkrw43a1ebpdfiFw0ah9HjGk/s1602pdPvfI9SyBwzwRBaEiOvgUEZdFv3
	 wxR3KLKp8Bhb5gPOar6LlPeQP2HLb3DeequVdC3zWehDmDu03j7k2piOE5bvoeb+eF
	 g/z0AScYwhvtQ==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [meta-oe][PATCH] v4l-utils: Update 1.23.0+9431e4b2 -> 1.24.1
Date: Sun, 28 May 2023 02:41:38 +0200
Message-Id: <20230528004138.279320-1-marex@denx.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 May 2023 00:42:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102883

Update V4L2 utils to actual release version 1.24.1 .

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Ross Burton <ross.burton@arm.com>
---
 .../v4l2apps/{v4l-utils_1.23.0.bb =3D> v4l-utils_1.24.1.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-multimedia/v4l2apps/{v4l-utils_1.23.0.bb =3D> v4l=
-utils_1.24.1.bb} (96%)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.23.0.bb b/me=
ta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.24.1.bb
similarity index 96%
rename from meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.23.0.bb
rename to meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.24.1.bb
index 21a080221..c02645a6b 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.23.0.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.24.1.bb
@@ -26,14 +26,14 @@ PACKAGECONFIG[qv4l2] =3D ",--disable-qv4l2"
 PACKAGECONFIG[qvidcap] =3D ",--disable-qvidcap"
=20
 SRC_URI =3D "\
-    git://git.linuxtv.org/v4l-utils.git;protocol=3Dhttps;branch=3Dmaster=
 \
+    git://git.linuxtv.org/v4l-utils.git;protocol=3Dhttps;branch=3Dstable=
-1.24 \
     file://0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.pat=
ch \
     file://0002-original-patch-mediactl-pkgconfig.patch \
     file://0003-original-patch-export-mediactl-headers.patch \
     file://0004-Do-not-use-getsubopt.patch \
 "
=20
-SRCREV =3D "9431e4b26b4842d1401e80ada9f14593dca3a94c"
+SRCREV =3D "8799081b143627c9c09dea0c60ad3d1cc17cc848"
=20
 PV .=3D "+git${SRCPV}"
=20
--=20
2.39.2


