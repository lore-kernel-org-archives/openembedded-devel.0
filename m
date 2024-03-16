Return-Path: <chris.chapuis@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D93C54E6E
	for <webhook@archiver.kernel.org>; Sat, 16 Mar 2024 10:01:18 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.3723.1710583262477347645
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Mar 2024 03:01:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YG2W5Aeu;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: chris.chapuis@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-513d599dbabso2749918e87.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 16 Mar 2024 03:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710583260; x=1711188060; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bE50ZDvGyWcxiWlkEojYtVSiaD9jz1Lilwg0dL+d7hI=;
        b=YG2W5AeudNxoTLmbaNmD2pQk7X9ol3nmfwXqcsD4W/NY/S0h59k4J8lvuSDVtcBIPt
         WLjpzTz11kJW44eHR47SO8/5fmMlhw1sfIvquA+DKjlhSjE/v6G2K0/O9eUiIumhpTQS
         obcYNrLW7o/6mV5douobMpciUnXvS+9iMjkN0lBg99LwvNO8W+Yym/1Z7XFjVsN+SsdJ
         nJdXHEgNa0+oagbhe62p64hCum6JFNzU8owMfHtVDJDZe1FC1uppbZ+PCWWOdI//T91Q
         EIWUtw6MDNMgg3e7LQcyocmSasEW8eScZvhzLveqDmjK9XeewnK+6UYpaldgoe8qKC6P
         WXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710583260; x=1711188060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bE50ZDvGyWcxiWlkEojYtVSiaD9jz1Lilwg0dL+d7hI=;
        b=cljEV/e+rdQnGIjH8++yfB06H1QAmHaZxfehR6b7Ii8SZKsjSKokVfvgEP5chCerCn
         Am0xIvkCEEONT8SpnnoNp3nQhIbfqjBwsqxhQRlw5q9A6YXmfQb1AmTDPPDVDutm0GID
         TGR/RC0yUOnmTx8iCCCRaZG8qUO34YTbZtLruJlbQjhVoBPsSfk9kxHeOojgseYLw0D2
         q20bXNWklAQ0wOoty+MuI9zdYm7/u2zwTS1FML39Sbn/X0LScDYwMMrrK2ZvH/Dyf8X8
         3gubxpq9EUlhRhXrtVdcKAK5x6jJZ/RZ1Eol5fVfaOpTndJS2hdY8XMVA3nkowZxoM09
         0HKQ==
X-Gm-Message-State: AOJu0Yxc2ZxAvo/7JEwvZs0niq/zzKkud9J+Zc3W9DUBdBpstCVQRsVw
	DYqaeYg4DKr6k5UH+AaOVxz6qJBr1GG7csq0h/74esFf1wgSpbVkLYc+rAZTo7c=
X-Google-Smtp-Source: AGHT+IEaZuZwaB6/AG4wB7t0BOBy9TfZERSF1YL8tC7nujdFs5m0E/5bVGzvppx7R00acCa35/WPpA==
X-Received: by 2002:ac2:596c:0:b0:513:a944:704e with SMTP id h12-20020ac2596c000000b00513a944704emr4451519lfp.63.1710583260043;
        Sat, 16 Mar 2024 03:01:00 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:5d9:6330:4d5:74f6:de66:f26e])
        by smtp.gmail.com with ESMTPSA id je2-20020a05600c1f8200b004133072017csm11679806wmb.42.2024.03.16.03.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Mar 2024 03:00:59 -0700 (PDT)
From: Christophe Chapuis <chris.chapuis@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Fabio Estevam <festevam@denx.de>,
	Christophe Chapuis <chris.chapuis@gmail.com>
Subject: [meta-oe][PATCH v4 4/7] lvgl: cleanup sed instructions in lv-conf.inc
Date: Sat, 16 Mar 2024 11:00:53 +0100
Message-ID: <20240316100056.409758-4-chris.chapuis@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240316100056.409758-1-chris.chapuis@gmail.com>
References: <20240316100056.409758-1-chris.chapuis@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Mar 2024 10:01:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109359

Use back reference instead of repeating the search pattern. Later on
this could lead to a more generic way of replacing values in the .h file.

Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>
---
 meta-oe/recipes-graphics/lvgl/lv-conf.inc | 28 +++++++++++------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
index 3dbdf769f..e43a4d508 100644
--- a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
+++ b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
@@ -26,29 +26,29 @@ do_configure:append() {
 
     sed -e "s|#if 0 .*Set it to \"1\" to enable content.*|#if 1 // Enabled by ${PN}|g" \
         \
-        -e "s|\(^#define LV_USE_LINUX_DRM \).*|#define LV_USE_LINUX_DRM ${LVGL_CONFIG_USE_DRM}|g" \
+        -e "s|\(^#define LV_USE_LINUX_DRM \).*|\1${LVGL_CONFIG_USE_DRM}|g" \
         \
-        -e "s|\(^#define LV_USE_LINUX_FBDEV \).*|#define LV_USE_LINUX_FBDEV ${LVGL_CONFIG_USE_FBDEV}|g" \
+        -e "s|\(^#define LV_USE_LINUX_FBDEV \).*|\1${LVGL_CONFIG_USE_FBDEV}|g" \
         \
-        -e "s|\(^#define LV_USE_SDL \).*|#define LV_USE_SDL ${LVGL_CONFIG_USE_SDL}|g" \
-        -e "s|\(^#define LV_USE_DRAW_SDL \).*|#define LV_USE_DRAW_SDL ${LVGL_CONFIG_USE_SDL}|g" \
-        -e "s|\(^    #define LV_SDL_BUF_COUNT \).*|    #define LV_SDL_BUF_COUNT 2|g" \
-        -e "s|\(^    #define LV_SDL_FULLSCREEN \).*|    #define LV_SDL_FULLSCREEN ${LVGL_CONFIG_SDL_FULLSCREEN}|g" \
+        -e "s|\(^#define LV_USE_SDL \).*|\1${LVGL_CONFIG_USE_SDL}|g" \
+        -e "s|\(^#define LV_USE_DRAW_SDL \).*|\1${LVGL_CONFIG_USE_SDL}|g" \
+        -e "s|\(^ \+#define LV_SDL_BUF_COUNT \).*|\1 2|g" \
+        -e "s|\(^ \+#define LV_SDL_FULLSCREEN \).*|\1${LVGL_CONFIG_SDL_FULLSCREEN}|g" \
         \
-        -e "s|\(^#define LV_COLOR_DEPTH \).*|#define LV_COLOR_DEPTH ${LVGL_CONFIG_LV_COLOR_DEPTH}|g" \
-        -e "s|\(#define LV_MEM_CUSTOM .*\)0|\1${LVGL_CONFIG_LV_MEM_CUSTOM}|g" \
+        -e "s|\(^#define LV_COLOR_DEPTH \).*|\1${LVGL_CONFIG_LV_COLOR_DEPTH}|g" \
+        -e "s|\(#define LV_MEM_CUSTOM .*\).*|\1${LVGL_CONFIG_LV_MEM_CUSTOM}|g" \
         \
         -e "s|\(#define LV_TICK_CUSTOM \).*|\1 1|g" \
         -e "s|\(#define LV_TICK_CUSTOM_INCLUDE \).*|\1 <stdint.h>|g" \
         -e "s|\(#define LV_TICK_CUSTOM_SYS_TIME_EXPR \).*|extern uint32_t custom_tick_get(void);\n\1 (custom_tick_get())|g" \
         \
-        -e "s|\(^#define LV_USE_EVDEV \).*|#define LV_USE_EVDEV ${LVGL_CONFIG_USE_EVDEV}|g" \
+        -e "s|\(^#define LV_USE_EVDEV \).*|\1${LVGL_CONFIG_USE_EVDEV}|g" \
         \
-        -e "s|\(^#define LV_USE_ASSERT_NULL \).*|#define LV_USE_ASSERT_NULL ${DEBUG_BUILD}|g" \
-        -e "s|\(^#define LV_USE_ASSERT_MALLOC \).*|#define LV_USE_ASSERT_MALLOC ${DEBUG_BUILD}|g" \
-        -e "s|\(^#define LV_USE_ASSERT_STYLE \).*|#define LV_USE_ASSERT_STYLE ${DEBUG_BUILD}|g" \
-        -e "s|\(^#define LV_USE_ASSERT_MEM_INTEGRITY \).*|#define LV_USE_ASSERT_MEM_INTEGRITY ${DEBUG_BUILD}|g" \
-        -e "s|\(^#define LV_USE_ASSERT_OBJ \).*|#define LV_USE_ASSERT_OBJ ${DEBUG_BUILD}|g" \
+        -e "s|\(^#define LV_USE_ASSERT_NULL \).*|\1${DEBUG_BUILD}|g" \
+        -e "s|\(^#define LV_USE_ASSERT_MALLOC \).*|\1${DEBUG_BUILD}|g" \
+        -e "s|\(^#define LV_USE_ASSERT_STYLE \).*|\1${DEBUG_BUILD}|g" \
+        -e "s|\(^#define LV_USE_ASSERT_MEM_INTEGRITY \).*|\1${DEBUG_BUILD}|g" \
+        -e "s|\(^#define LV_USE_ASSERT_OBJ \).*|\1${DEBUG_BUILD}|g" \
         \
         -i "${S}/lv_conf.h"
 }
-- 
2.44.0


