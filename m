Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8805C7EE2D
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 02:44:19 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.6845.1683600257280305146
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 19:44:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=SG9mtzbi;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id A9EE78479B;
	Tue,  9 May 2023 04:44:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1683600254;
	bh=lSelbQBWlzAFbm6gheZVDb8OwvCEhBW0uaNngkAn7NU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SG9mtzbi6JJveD0IddNTh6Ai0HzxCwerB4vaM6cDBiowo8wHlb9E+nMQzDhyrSJQ1
	 V4Q0yrJBsveRyyL3+e0T60ZiQfL6CYH7rOTEAE1Jj8cVcPht+bsFGgV9K5vbRqzIeE
	 BIomIEjeIRl7b7GfbxObAXiKfBYVAcJMcyjNlO4aAz3ZV0bR2f5kjDR+SofWEICQq+
	 ioMSFs71SaO0aeGCvSKg7ilw3pFkACwkJfUiJrPIxhlaaFkqdfY4HvBkB1AqmDaW2b
	 G1goXTd/KplIs+/1wmaC1UIJflgeVUpOcXAYowueerVs1lQaPw/tLymRCjM9CUFPb8
	 EdfQnvDtHbGxQ==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Fabio Estevam <festevam@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	Philippe Coval <philippe.coval.ext@huawei.com>,
	Philippe Coval <philippe.coval@huawei.com>
Subject: [meta-oe][PATCH v2 3/7] lvgl: Add configurable color depth, default to 32bpp
Date: Tue,  9 May 2023 04:43:51 +0200
Message-Id: <20230509024355.79006-3-marex@denx.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230509024355.79006-1-marex@denx.de>
References: <20230509024355.79006-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 02:44:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102456

Make color depth configurable and default to 32bpp .

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Fabio Estevam <festevam@denx.de>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Cc: Philippe Coval <philippe.coval.ext@huawei.com>
Cc: Philippe Coval <philippe.coval@huawei.com>
---
V2: No change
---
 meta-oe/recipes-graphics/lvgl/lvgl_8.3.7.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_8.3.7.bb b/meta-oe/recipe=
s-graphics/lvgl/lvgl_8.3.7.bb
index 5f3fc44cf..a3fd7e04c 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl_8.3.7.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl_8.3.7.bb
@@ -20,6 +20,7 @@ EXTRA_OECMAKE =3D "-DLIB_INSTALL_DIR=3D${baselib}"
 S =3D "${WORKDIR}/git"
=20
 LVGL_CONFIG_LV_MEM_CUSTOM ?=3D "0"
+LVGL_CONFIG_LV_COLOR_DEPTH ?=3D "32"
=20
 # Upstream does not support a default configuration
 # but propose a default "disabled" template, which is used as reference
@@ -27,6 +28,8 @@ LVGL_CONFIG_LV_MEM_CUSTOM ?=3D "0"
 do_configure:prepend() {
     [ -r "${S}/lv_conf.h" ] \
         || sed -e 's|#if 0 .*Set it to "1" to enable .*|#if 1 // Enabled=
|g' \
+	    -e "s|\(#define LV_COLOR_DEPTH \).*|\1 ${LVGL_CONFIG_LV_COLOR_DEPTH=
}|g" \
+	    \
 	    -e "s|\(#define LV_MEM_CUSTOM .*\)0|\1${LVGL_CONFIG_LV_MEM_CUSTOM}|=
g" \
 	    \
 	    -e "s|\(#define LV_TICK_CUSTOM \).*|\1 1|g" \
--=20
2.39.2


