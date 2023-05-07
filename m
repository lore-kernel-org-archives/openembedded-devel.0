Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5989CC7EE22
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 13:24:22 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.65319.1683465853387329980
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 06:24:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=H8hAJMA2;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 5C70B842D0;
	Sun,  7 May 2023 15:24:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1683465850;
	bh=tfFJMdk6kX1q0pMTRBPinRdOFfPesvFI8c/gl7+T2Mg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H8hAJMA2CJrXOLoRknfexchlilUinVI2qV66qdYawx5xf1ZqWXzml2iazWXPY3KiW
	 lPD+F9fMYpYs+xemCZURBRpAtw8nXxuOdA0tqHAhP+cBSJDXqnx1BtMMqV5J8A9ID7
	 AvjIC2+8Y8PEvukTtDZZYzVFZ6s0IAZn6Rkf3YZk9Wl5KaHyXCRuMhT1Yl6I5XziB1
	 XS2g8d5ShWFFio7hoqPAJtOCno1o+6GmCxUwb46NWypocIc5xzaTyG7/hPuP5PRJd1
	 5fD8IzDWC7xdx3XMRBk+pk5PLJOjhSKtjeqMeTc25BlIoxnpFOnkzE994Qv6UuM3B1
	 c9ZINZa4NEQUw==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Fabio Estevam <festevam@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	Philippe Coval <philippe.coval.ext@huawei.com>,
	Philippe Coval <philippe.coval@huawei.com>
Subject: [meta-oe][PATCH 2/5] lvgl: Activate custom tick implementation
Date: Sun,  7 May 2023 15:23:46 +0200
Message-Id: <20230507132349.10674-2-marex@denx.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507132349.10674-1-marex@denx.de>
References: <20230507132349.10674-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 13:24:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102326

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


