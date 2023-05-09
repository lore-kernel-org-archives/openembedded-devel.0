Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 950E1C7EE22
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 02:44:19 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.6844.1683600257221950646
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 19:44:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=NDqhi16J;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 4E6CC84792;
	Tue,  9 May 2023 04:44:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1683600254;
	bh=JNNhoSFndvikrmwVIHpLDRBwMvuDkuAGmQoAETZzjq4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NDqhi16JFyIydg0AVSwoWka+YkQW7bxMjWGz7qy5bUoBXYZR0/iU8HAIM8tKvV4F0
	 r6s+i6/pDUzVFe+JZAJ7dTBVvzVqMgQE0ktTK2K5a3FwRebFR8ZakZJWoWLA0eA4m8
	 bKvNQGYUn6+vOfPcVK2L1IGuE0Hk7DpYI0Rn29gzyRdseN6e4FMpmHOgxh5XlFVDOv
	 epyZFEXuPt8HAnhldHK218cvXDDvBHsoWj5FN1m235dtxlyf5XCesw0+DIkWUZImSL
	 TK0zSDZemRxK96m1D6T+IWBZsGQ9KMJz9k3bl2iy5PsO9PoQoq3LQelrE4EwDnYa+X
	 XkTU0xhHUjZkw==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Fabio Estevam <festevam@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	Philippe Coval <philippe.coval.ext@huawei.com>,
	Philippe Coval <philippe.coval@huawei.com>
Subject: [meta-oe][PATCH v2 2/7] lvgl: Activate custom tick implementation
Date: Tue,  9 May 2023 04:43:50 +0200
Message-Id: <20230509024355.79006-2-marex@denx.de>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102454

Use a custom tick source that tells the elapsed time in milliseconds.
It removes the need to manually update the tick with `lv_tick_inc()`.
This is the behavior which ought to be used for LVGL running on Linux
compared to LVGL running on microcontroller.

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
 meta-oe/recipes-graphics/lvgl/lvgl_8.3.7.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_8.3.7.bb b/meta-oe/recipe=
s-graphics/lvgl/lvgl_8.3.7.bb
index a82ab3b74..5f3fc44cf 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl_8.3.7.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl_8.3.7.bb
@@ -28,6 +28,11 @@ do_configure:prepend() {
     [ -r "${S}/lv_conf.h" ] \
         || sed -e 's|#if 0 .*Set it to "1" to enable .*|#if 1 // Enabled=
|g' \
 	    -e "s|\(#define LV_MEM_CUSTOM .*\)0|\1${LVGL_CONFIG_LV_MEM_CUSTOM}|=
g" \
+	    \
+	    -e "s|\(#define LV_TICK_CUSTOM \).*|\1 1|g" \
+	    -e "s|\(#define LV_TICK_CUSTOM_INCLUDE \).*|\1 <stdint.h>|g" \
+	    -e "s|\(#define LV_TICK_CUSTOM_SYS_TIME_EXPR \).*|extern uint32_t c=
ustom_tick_get(void);\n\1 (custom_tick_get())|g" \
+	    \
             < "${S}/lv_conf_template.h" > "${S}/lv_conf.h"
 }
=20
--=20
2.39.2


