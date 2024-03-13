Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D2D2C54E68
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 04:51:28 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.9107.1710305478432790721
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Mar 2024 21:51:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=oC2KE+ye;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id ADD0687DCA;
	Wed, 13 Mar 2024 05:51:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710305476;
	bh=mNF+GE44hR5IIpJS8oD1Oq1ifhyu8cxZFk9+cdjKhAQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oC2KE+yew1q3ccuP3jwDyI/DZb9Zkzw5jHwnxsh6k2IN2Mp+DVloA5c9UWrJLEXdE
	 FAZf+OCx9aJhHT4vICaP65GipZv3No3piLf68s27VgDOqooyAssw8YVQv9xpgRq5Qr
	 GYScSBq7EocVzGRgH3z7lll/YWkWPOqbw2D7VvslP6YdcBxVqDJZwZcRcaCvXgXaat
	 0xrYI2cheAwsVliqzdpcFage+8X9NT0YHhbTRBt5H8cLrwniZ6Oq11jufMaFQbHjV+
	 n8/vMqBEAOeQ0NTQgdQ93PDMTjV6bhdTrWhJhkQRSN1GmcKAgp7tN5Vwpr6aAEgvwY
	 a5GQOvKN8J3+g==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Fabio Estevam <festevam@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 3/8] lvgl: Rename lv-drivers.inc to lv-conf.inc
Date: Wed, 13 Mar 2024 05:40:06 +0100
Message-ID: <20240313045038.90500-4-marex@denx.de>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109283

The lv-conf.inc is much more fitting name, since there is now only one
configuration file and that is called lv_conf.h . No functional change.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Fabio Estevam <festevam@denx.de>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-graphics/lvgl/{lv-drivers.inc =3D> lv-conf.inc} | 0
 meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.0.0.bb           | 2 +-
 meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb                   | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/lvgl/{lv-drivers.inc =3D> lv-conf.inc} (=
100%)

diff --git a/meta-oe/recipes-graphics/lvgl/lv-drivers.inc b/meta-oe/recip=
es-graphics/lvgl/lv-conf.inc
similarity index 100%
rename from meta-oe/recipes-graphics/lvgl/lv-drivers.inc
rename to meta-oe/recipes-graphics/lvgl/lv-conf.inc
diff --git a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.0.0.bb b/meta-o=
e/recipes-graphics/lvgl/lvgl-demo-fb_9.0.0.bb
index fc675a518..0045706ef 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.0.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.0.0.bb
@@ -17,7 +17,7 @@ EXTRA_OEMAKE =3D "DESTDIR=3D${D}"
=20
 PACKAGECONFIG ??=3D "drm"
 LVGL_CONFIG_DRM_CARD ?=3D "/dev/dri/card0"
-require lv-drivers.inc
+require lv-conf.inc
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb b/meta-oe/recipe=
s-graphics/lvgl/lvgl_9.0.0.bb
index d8ed4ec81..7a109df45 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
@@ -20,7 +20,7 @@ S =3D "${WORKDIR}/git"
 ALLOW_EMPTY:${PN} =3D "1"
=20
 PACKAGECONFIG ??=3D "drm"
-require lv-drivers.inc
+require lv-conf.inc
=20
 FILES:${PN}-dev +=3D "\
     ${includedir}/${PN}/ \
--=20
2.43.0


