Return-Path: <chris.chapuis@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8820CC54E71
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 18:03:28 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.6.1710525803419828039
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Mar 2024 11:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e4a09PX2;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: chris.chapuis@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-413f4cb646dso12195545e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 Mar 2024 11:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710525801; x=1711130601; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B02H3xTthZBvjyNie504IHR3fwZF4EN2oDR780kh7MA=;
        b=e4a09PX27AYKrbTRQMiEtL3wx9IH1OB00wEhPSmJpwSuzABKqp/4U4Nrwq4OygSJtW
         k+h17zLgDh5YOkvPg9kiMvzGQhPOg/nL6v/8z0wAeZXx4Mwu9NV8qJ/WrSWI2nqCfI1e
         TzAX3HO7gFz2fYT8E2sqiYx3INT95xv4EAcGA71gQ01Mtgv8ZN8pwHUE1nlgr4ZK0VtU
         WJZs5U4FY7NYEsnPZ2OzMh6vKshBXQyzKimyQsyIhjjt6soZSSDhq7MUayCDWuBKJSak
         peFDjE8CvRuRVSb4QsgDrjvPGNLc5mgvhaGu+Ypd+2E+zGhO/oIJVABc+8/ioskjtPc4
         GABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710525801; x=1711130601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B02H3xTthZBvjyNie504IHR3fwZF4EN2oDR780kh7MA=;
        b=rnslef4dimT4eyrnBB6x3KzgTkCPDImRIKt+5EWTHG1JMM2zwSpWuOyHgAvkO56pt2
         albTgmU3hhJax1bgZR/2zNeoEM+nwRSocwJNTyrvVQII8/nWzdHusKtek6tML7x2kvgT
         5QJVEZC+HpPo2yumT1TSBnflv224yTKe5kROpdQU8IatxQ/btZyVg03SyqGsllRYQDgs
         7R4N1alQfR/sNNPAdvlCTAYb/dAd+5Oyh3QeGLpULRpx4eSY8NJI9vnOQYU0Nw0vIeae
         85WXD3e3V7EOjxZqNZOmsQOw9Oha22mx8BaZy+ygDHiJDhozsLRz6yo+7D73ftmflhte
         nfAg==
X-Gm-Message-State: AOJu0YzrtS8VnuEuSQ+0itzFl6vqtYACa8iXntXaFpgJmqTRzepWFJBE
	mFZfQK/76fZIsx5p6/BiaWxFs2JcBGPPoBNP7LEjGZOAuueiWDkPRbJXgjUInII=
X-Google-Smtp-Source: AGHT+IHzXNyXIbsax08P2zy4IcdibGQDg6ViMy4PB1kzT49aAc6N+3Nm3gWXHElk2WqLzq3ejNsUrA==
X-Received: by 2002:a5d:568e:0:b0:33e:c385:7dce with SMTP id f14-20020a5d568e000000b0033ec3857dcemr3758884wrv.15.1710525801503;
        Fri, 15 Mar 2024 11:03:21 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:5d9:6330:4d5:74f6:de66:f26e])
        by smtp.gmail.com with ESMTPSA id bu27-20020a056000079b00b0033ecbfc6941sm3366832wrb.110.2024.03.15.11.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 11:03:21 -0700 (PDT)
From: Christophe Chapuis <chris.chapuis@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Fabio Estevam <festevam@denx.de>,
	Martin Jansa <martin.jansa@gmail.com>,
	Christophe Chapuis <chris.chapuis@gmail.com>
Subject: [meta-oe][PATCH v3 4/5] lvgl: cleanup sed instructions in lv-conf.inc
Date: Fri, 15 Mar 2024 19:03:13 +0100
Message-ID: <20240315180314.9111-4-chris.chapuis@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240315180314.9111-1-chris.chapuis@gmail.com>
References: <20240315180314.9111-1-chris.chapuis@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Mar 2024 18:03:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109343

Use back reference instead of repeating the search pattern. Later on
this could lead to a more generic way of replacing values in the .h file.

Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>
---
 meta-oe/recipes-graphics/lvgl/lv-conf.inc | 28 +++++++++++------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
index 6bcead628..f5a93dcae 100644
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


