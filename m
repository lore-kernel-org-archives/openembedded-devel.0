Return-Path: <chris.chapuis@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1918DC54E68
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 19:25:32 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.1714.1710444326372655685
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Mar 2024 12:25:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NMzebgT0;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: chris.chapuis@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33e1d327595so884354f8f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Mar 2024 12:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710444324; x=1711049124; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfYR2mSMTSgrA4MOh8aboXjK1YkqXJrLfH7pS2l4JnM=;
        b=NMzebgT0uWH6x2NBgnxGd3ggMKWYKvcNUyCIf+rNR6uvoVYb+tHi8F33tYVzLGm6WU
         Yr+3BzpiTUBa6tKWjRVAER8gnwwgFeskQPC5J6RqoNKR3KaZkF1dFqdHOMTzZ3vHFstB
         xDjiIHFCWPWFqIWvNzDlyemGjKKFqyWEH4T3yCTNF2VjBpcuAjihGAm1L6RqSPkznpW4
         W0PfyqZVlYOXxN39BflkYqls2bQywk1m7IsHxSFJVA2bv1TIh84eKeHOin+bpjcbVxCX
         27/2KyJ2wudYE0DHBMrtUXVXP5CXUBvMEdFxgKsPygZiF/YR3TvjqENVUt9zBpwJn8cT
         89Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710444324; x=1711049124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfYR2mSMTSgrA4MOh8aboXjK1YkqXJrLfH7pS2l4JnM=;
        b=XZiQZejwIulyZ/MtLKLSKlbSkqYGwlMFveQD2Wvy8RB/RY6g/ZFOU11TyhS3+beRHJ
         k6aAJHnWLwycEsK24scnrBvL/pnsIpjrgetkiC3K7zZ+ZIvalsDbvn815IPq2nqVRRtV
         exoU7hec5mQWpveodEoWSYWQbl4GgzYyVbU0f3G0UwP3VsoyaM6e9lzduVxistUeuf8c
         fMbxMWr3XvqwYbt48dP7X0xrSs0IQBZkMAYx286MAeoP4YrN6N+fjjnPF/vcNRFW39PP
         YM5QwnuUoA1ZV4yVgHrsgbRBateHcrM0d1lIA3gAdR0D9TQA2KUk42uQAVuznRp+CqZl
         jxLQ==
X-Gm-Message-State: AOJu0Yyrzf/BVmNdyvJlD2+VAycbnWxGnR6V7iTwcRg+/aJ00vzHquAz
	WrfBGQpAVRWpz8gvWa9WOYRo5lC7EyDKW2WOQ4jNbbxV/Ptiph1rKSqmko9h
X-Google-Smtp-Source: AGHT+IGOcBwcksj+x5bijmXsD+nIIlwL3fcAH5RPVGv91R7SLUNlixMNECZq7Z4f2LRs3UZr4J60Gw==
X-Received: by 2002:a5d:45c1:0:b0:33e:cf43:fdb5 with SMTP id b1-20020a5d45c1000000b0033ecf43fdb5mr457384wrs.0.1710444324424;
        Thu, 14 Mar 2024 12:25:24 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:5d9:6330:4d5:74f6:de66:f26e])
        by smtp.gmail.com with ESMTPSA id o14-20020adfe80e000000b0033e8c50fc3fsm1363103wrm.90.2024.03.14.12.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 12:25:24 -0700 (PDT)
From: Christophe Chapuis <chris.chapuis@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Christophe Chapuis <chris.chapuis@gmail.com>
Subject: [meta-oe][PATCHv2 3/3] lvgl: add more variables to lv-conf.inc
Date: Thu, 14 Mar 2024 20:21:53 +0100
Message-ID: <20240314192153.202513-3-chris.chapuis@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240314192153.202513-1-chris.chapuis@gmail.com>
References: <20240314192153.202513-1-chris.chapuis@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Mar 2024 19:25:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109320

As it can be usefull to customize these other variables, let's
add them in lv-conf.inc.

Also, fix the install path to use ${PN} instead of "lvgl".

Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>
---
 meta-oe/recipes-graphics/lvgl/lv-conf.inc | 49 +++++++++++++++--------
 1 file changed, 33 insertions(+), 16 deletions(-)

diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
index cd14412e1..088842490 100644
--- a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
+++ b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
@@ -12,8 +12,17 @@ LVGL_CONFIG_USE_SDL = "${@bb.utils.contains('PACKAGECONFIG', 'sdl', '1', '0', d)
 LVGL_CONFIG_SDL_FULLSCREEN ?= "0"
 
 LVGL_CONFIG_LV_MEM_CUSTOM ?= "0"
+LVGL_CONFIG_LV_MEM_SIZE ?= "(64 * 1024U)"
 LVGL_CONFIG_LV_COLOR_DEPTH ?= "32"
 
+LVGL_CONFIG_LV_USE_LOG    ?= "0"
+LVGL_CONFIG_LV_LOG_LEVEL  ?= "LV_LOG_LEVEL_WARN"
+LVGL_CONFIG_LV_LOG_PRINTF ?= "0"
+
+LVGL_CONFIG_LV_USE_FONT_COMPRESSED ?= "0"
+
+LVGL_CONFIG_LV_THEME_DEFAULT_DARK ?= "0"
+
 DEBUG_BUILD ??= "0"
 
 ALLOW_EMPTY:${PN} = "1"
@@ -26,34 +35,42 @@ do_configure:append() {
 
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
+        -e "s|\(^ \+#define LV_MEM_SIZE \).*|\1${LVGL_CONFIG_LV_MEM_SIZE}|g" \
         \
         -e "s|\(#define LV_TICK_CUSTOM \).*|\1 1|g" \
         -e "s|\(#define LV_TICK_CUSTOM_INCLUDE \).*|\1 <stdint.h>|g" \
         -e "s|\(#define LV_TICK_CUSTOM_SYS_TIME_EXPR \).*|extern uint32_t custom_tick_get(void);\n\1 (custom_tick_get())|g" \
         \
-        -e "s|\(^#define LV_USE_EVDEV \).*|#define LV_USE_EVDEV ${LVGL_CONFIG_USE_EVDEV}|g" \
+        -e "s|\(^#define LV_USE_EVDEV \).*|\1${LVGL_CONFIG_USE_EVDEV}|g" \
+        \
+        -e "s|\(^#define LV_USE_ASSERT_NULL \).*|\1${DEBUG_BUILD}|g" \
+        -e "s|\(^#define LV_USE_ASSERT_MALLOC \).*|\1${DEBUG_BUILD}|g" \
+        -e "s|\(^#define LV_USE_ASSERT_STYLE \).*|\1${DEBUG_BUILD}|g" \
+        -e "s|\(^#define LV_USE_ASSERT_MEM_INTEGRITY \).*|\1${DEBUG_BUILD}|g" \
+        -e "s|\(^#define LV_USE_ASSERT_OBJ \).*|\1${DEBUG_BUILD}|g" \
+        \
+        -e "s|\(^#define LV_USE_LOG \).*|\1${LVGL_CONFIG_LV_USE_LOG}|g" \
+        -e "s|\(^ \+#define LV_LOG_LEVEL \).*|\1${LVGL_CONFIG_LV_LOG_LEVEL}|g" \
+        -e "s|\(^ \+#define LV_LOG_PRINTF \).*|\1${LVGL_CONFIG_LV_LOG_PRINTF}|g" \
         \
-        -e "s|\(^#define LV_USE_ASSERT_NULL \).*|#define LV_USE_ASSERT_NULL ${DEBUG_BUILD}|g" \
-        -e "s|\(^#define LV_USE_ASSERT_MALLOC \).*|#define LV_USE_ASSERT_MALLOC ${DEBUG_BUILD}|g" \
-        -e "s|\(^#define LV_USE_ASSERT_STYLE \).*|#define LV_USE_ASSERT_STYLE ${DEBUG_BUILD}|g" \
-        -e "s|\(^#define LV_USE_ASSERT_MEM_INTEGRITY \).*|#define LV_USE_ASSERT_MEM_INTEGRITY ${DEBUG_BUILD}|g" \
-        -e "s|\(^#define LV_USE_ASSERT_OBJ \).*|#define LV_USE_ASSERT_OBJ ${DEBUG_BUILD}|g" \
+        -e "s|\(^#define LV_USE_FONT_COMPRESSED \).*|\1${LVGL_CONFIG_LV_USE_FONT_COMPRESSED}|g" \
+        -e "s|\(^ \+#define LV_THEME_DEFAULT_DARK \).*|\1${LVGL_CONFIG_LV_THEME_DEFAULT_DARK}|g" \
         \
         -i "${S}/lv_conf.h"
 }
 
 do_install:append() {
-    install -d "${D}${includedir}/lvgl"
-    install -m 0644 "${S}/lv_conf.h" "${D}${includedir}/lvgl/lv_conf.h"
+    install -d "${D}${includedir}/${PN}"
+    install -m 0644 "${S}/lv_conf.h" "${D}${includedir}/${PN}/lv_conf.h"
 }
-- 
2.44.0


