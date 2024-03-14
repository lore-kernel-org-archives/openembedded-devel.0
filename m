Return-Path: <chris.chapuis@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1221DC54E5D
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 19:25:32 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.1713.1710444325360822445
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Mar 2024 12:25:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dyEHQt42;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: chris.chapuis@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-33ec8aa8b6bso628997f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Mar 2024 12:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710444323; x=1711049123; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V3BItnYMHZB/yzL0L14c1QH+/xoNvG15Vb5uL/j76w0=;
        b=dyEHQt42DcwqU3z8/xOdBTscFCryMdlsmpkxcfWWvM9whgGUHvvfjpFoChaDISqLDi
         NYiBBNs0NbEbEYSfolcjTve11U39+FkVtzHU3i3nHKhg7NpWdLaejEMtClbWv5B16dr0
         B+LiAkM0IWwV8E6X5up+mv+w8uHT7ML9kzWZOYaeFr1BeHkqG7dsn3c/rBCUBBb6VEBl
         yEcsQYQxztq4fVCY5SP1qiBeJVxc84WzJCwM127ylIBjzwC+HTjuyYSHXDMU8UL+44P+
         cHr8w41A8ntMXM0omD6nNHIKHu5uKmVTsCT3m1gkMuBbJ16BphLSBgWVGJuXniihIw+6
         VozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710444323; x=1711049123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V3BItnYMHZB/yzL0L14c1QH+/xoNvG15Vb5uL/j76w0=;
        b=dTw0G+p/NbvjkeukbKs69gpRSO5OrLwJkUsKXmSSAY5W5bGf7eRGZ71OyA7Qlw0Gh2
         mfo+OfoDPIWm/pkYrWUDYAZxojnwMJpJwLoEsQNvrJ3xHywq99AlGS4BTeob9/nJu/9U
         BjM31Jd5hKgpS9EYWXNcMz70vmr575dN98Iwu1eIsnR4ekMQqSNe9kmw7h6VFLTVZWNk
         ngk4zxWW1W7KQatTHvdBfPsfeRWKzYfVmW19f9V8ziF1l2OgmZOIXTPY3UzoUZO3pvHN
         S3BdP0MJ1oe7kZveFyVSZ70om2Lrg1IDiQKEQYW/JgaTnJXRjy2209MKSf5oZ+46osOb
         xhWg==
X-Gm-Message-State: AOJu0Ywkv5IMOgjBuY/yVjnvjigAaPGBgU8Oyu3BjPDQcU/FfyaEwvsd
	P0gbVrWGdnVWlkOnsR0McvWhLctQqEYJsrxBpntNhqE9bNi/abNvJ3G8UHX+
X-Google-Smtp-Source: AGHT+IG3Omfm4t/WPJmxNxKnBq92P5SV47jdrDg+Zh7Usbq5orQxTTd2HilFouy8w2y9QSNg/gZOog==
X-Received: by 2002:a5d:6a90:0:b0:33e:c677:3272 with SMTP id s16-20020a5d6a90000000b0033ec6773272mr869939wru.56.1710444323315;
        Thu, 14 Mar 2024 12:25:23 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:5d9:6330:4d5:74f6:de66:f26e])
        by smtp.gmail.com with ESMTPSA id o14-20020adfe80e000000b0033e8c50fc3fsm1363103wrm.90.2024.03.14.12.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 12:25:22 -0700 (PDT)
From: Christophe Chapuis <chris.chapuis@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Christophe Chapuis <chris.chapuis@gmail.com>
Subject: [meta-oe][PATCHv2 1/3] lvgl: fix typo and install lv_conf.h
Date: Thu, 14 Mar 2024 20:21:51 +0100
Message-ID: <20240314192153.202513-1-chris.chapuis@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Mar 2024 19:25:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109318

* Fix a typo in the first sed instruction,
  and therefore the #if 0 is never changed
  to #if 1 at the beginning of lv_conf.h.

* Add an install append to copy the generated
  lv_conf.h as part of the lvgl package, so that
  it will be found and used by the recipes that
  want to use lvgl.

Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>
---
 meta-oe/recipes-graphics/lvgl/lv-conf.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
index cb676ac62..cd14412e1 100644
--- a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
+++ b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
@@ -24,7 +24,7 @@ do_configure:append() {
     # If there is a configuration template, start from that
     [ -r "${S}/lv_conf_template.h" ] && cp -Lv "${S}/lv_conf_template.h" "${S}/lv_conf.h"
 
-    sed -e "s|#if 0 .*Set it to \"1\" to enable the content.*|#if 1 // Enabled by ${PN}|g" \
+    sed -e "s|#if 0 .*Set it to \"1\" to enable content.*|#if 1 // Enabled by ${PN}|g" \
         \
         -e "s|\(^#define LV_USE_LINUX_DRM \).*|#define LV_USE_LINUX_DRM ${LVGL_CONFIG_USE_DRM}|g" \
         \
@@ -52,3 +52,8 @@ do_configure:append() {
         \
         -i "${S}/lv_conf.h"
 }
+
+do_install:append() {
+    install -d "${D}${includedir}/lvgl"
+    install -m 0644 "${S}/lv_conf.h" "${D}${includedir}/lvgl/lv_conf.h"
+}
-- 
2.44.0


