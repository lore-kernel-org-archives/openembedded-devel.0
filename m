Return-Path: <chris.chapuis@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FFD8C54E60
	for <webhook@archiver.kernel.org>; Sat, 16 Mar 2024 10:01:08 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.3726.1710583264139396030
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Mar 2024 03:01:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZwNTpQir;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: chris.chapuis@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-41403889b6aso8449055e9.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 16 Mar 2024 03:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710583262; x=1711188062; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ToXMMtdAOvdiqzyRI+QGYY3SA9vf+4jZkPdLRprnb0=;
        b=ZwNTpQirvjPHOXgdD6nLe2SmmkbBN6hSdYNl1Qmgj4lrI4Ake877Yu3+PiF4c2inbg
         1WmMaRqUoYVUJgXH+rAcfXAarg/csMxMGzIQ+GRFGHDxA9uHog6/Ry97mqcymR5bdTWM
         nrwreuaRhGGSRuN/MBqPZPmknXobVuDrF0Stkm30Lmzuci5pAH7mm5lTi2VqoUJCLboQ
         mLUyLiqupNVhZweaMtVIPBtdn0y+EgSv94rolZQm+kmpHx4henXHpRQHn+6RSulCfFE5
         AjTJ6ErE7v9TBz+eZ6LpVlzjGn2ZmyHhxPMojhtcy5WYx4O+JVgmk1CqUmdAqPYDE7KN
         DOyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710583262; x=1711188062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ToXMMtdAOvdiqzyRI+QGYY3SA9vf+4jZkPdLRprnb0=;
        b=ol3xrzlKLMEdV4sBcL5e0RecB751sQJD13Na7Vv6LqQKAYnNCJ2CB/tMi0WFYdx59N
         BEc5VHZMD3/oxarEMQt66QGwmkcYurlzmX8HhF0dWWL8OCWb7FducW/+B5D2aBv3U19O
         crq6Eg9/avf80tggKeWLd9N50rG3371O0R5PU/38tLbGbRaivB8oC2SVHr+yM9n1P3zt
         PiUS4gFqys37jaLB7VrYRzeRoTVDjm7rfCWOOCq2U8lEH5mAtmDzXM/GleQIlDkL2c+/
         9VoY6S5Ah6fZcKuO87jr6OgIqyiafRgI6x1xNNDgMllGmon+fHa6rO+3Obu9pE1EXrjS
         xJtA==
X-Gm-Message-State: AOJu0Yx772UfvUI8bS4tJOPZf9z+oOWOu3ncgKzX2+ZbS5dkmU3je9+K
	REyymSqeLht6LxU0iq9HClW098OwmZUtzdzxnsZLWBkAeDJZJ4IAcO7ENW+O8EM=
X-Google-Smtp-Source: AGHT+IGxeZ3NDUQTH281c5PzdS/rKqK5VkEDLECZriZVi3f8fOzoYpcua973esPrIZ/WrKli4ORwBw==
X-Received: by 2002:a05:600c:3b98:b0:412:e55e:83de with SMTP id n24-20020a05600c3b9800b00412e55e83demr6390278wms.7.1710583261835;
        Sat, 16 Mar 2024 03:01:01 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:5d9:6330:4d5:74f6:de66:f26e])
        by smtp.gmail.com with ESMTPSA id je2-20020a05600c1f8200b004133072017csm11679806wmb.42.2024.03.16.03.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Mar 2024 03:01:01 -0700 (PDT)
From: Christophe Chapuis <chris.chapuis@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Fabio Estevam <festevam@denx.de>,
	Christophe Chapuis <chris.chapuis@gmail.com>
Subject: [meta-oe][PATCH v4 7/7] lvgl: lv-conf.inc: generalize sed instructions
Date: Sat, 16 Mar 2024 11:00:56 +0100
Message-ID: <20240316100056.409758-7-chris.chapuis@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240316100056.409758-1-chris.chapuis@gmail.com>
References: <20240316100056.409758-1-chris.chapuis@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Mar 2024 10:01:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109362

Use [ \t] to detect optionnal spaces at the beginning of each
line, and after the define.

Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>
---
 meta-oe/recipes-graphics/lvgl/lv-conf.inc | 46 +++++++++++------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
index 9ee9f283d..2b5d4a14a 100644
--- a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
+++ b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
@@ -35,37 +35,37 @@ do_configure:append() {
 
     sed -e "s|#if 0 .*Set it to \"1\" to enable content.*|#if 1 // Enabled by ${PN}|g" \
         \
-        -e "s|\(^#define LV_USE_LINUX_DRM \).*|\1${LVGL_CONFIG_USE_DRM}|g" \
+        -e "s|\(^[ \t]*#define LV_USE_LINUX_DRM[ \t]\).*|\1${LVGL_CONFIG_USE_DRM}|g" \
         \
-        -e "s|\(^#define LV_USE_LINUX_FBDEV \).*|\1${LVGL_CONFIG_USE_FBDEV}|g" \
+        -e "s|\(^[ \t]*#define LV_USE_LINUX_FBDEV[ \t]\).*|\1${LVGL_CONFIG_USE_FBDEV}|g" \
         \
-        -e "s|\(^#define LV_USE_SDL \).*|\1${LVGL_CONFIG_USE_SDL}|g" \
-        -e "s|\(^#define LV_USE_DRAW_SDL \).*|\1${LVGL_CONFIG_USE_SDL}|g" \
-        -e "s|\(^ \+#define LV_SDL_BUF_COUNT \).*|\1 2|g" \
-        -e "s|\(^ \+#define LV_SDL_FULLSCREEN \).*|\1${LVGL_CONFIG_SDL_FULLSCREEN}|g" \
+        -e "s|\(^[ \t]*#define LV_USE_SDL[ \t]\).*|\1${LVGL_CONFIG_USE_SDL}|g" \
+        -e "s|\(^[ \t]*#define LV_USE_DRAW_SDL[ \t]\).*|\1${LVGL_CONFIG_USE_SDL}|g" \
+        -e "s|\(^[ \t]*#define LV_SDL_BUF_COUNT[ \t]\).*|\1 2|g" \
+        -e "s|\(^[ \t]*#define LV_SDL_FULLSCREEN[ \t]\).*|\1${LVGL_CONFIG_SDL_FULLSCREEN}|g" \
         \
-        -e "s|\(^#define LV_COLOR_DEPTH \).*|\1${LVGL_CONFIG_LV_COLOR_DEPTH}|g" \
-        -e "s|\(#define LV_MEM_CUSTOM .*\).*|\1${LVGL_CONFIG_LV_MEM_CUSTOM}|g" \
-        -e "s|\(^ \+#define LV_MEM_SIZE \).*|\1${LVGL_CONFIG_LV_MEM_SIZE}|g" \
+        -e "s|\(^[ \t]*#define LV_COLOR_DEPTH[ \t]\).*|\1${LVGL_CONFIG_LV_COLOR_DEPTH}|g" \
+        -e "s|\(^[ \t]*#define LV_MEM_CUSTOM[ \t].*\).*|\1${LVGL_CONFIG_LV_MEM_CUSTOM}|g" \
+        -e "s|\(^[ \t]*#define LV_MEM_SIZE[ \t]\).*|\1${LVGL_CONFIG_LV_MEM_SIZE}|g" \
         \
-        -e "s|\(#define LV_TICK_CUSTOM \).*|\1 1|g" \
-        -e "s|\(#define LV_TICK_CUSTOM_INCLUDE \).*|\1 <stdint.h>|g" \
-        -e "s|\(#define LV_TICK_CUSTOM_SYS_TIME_EXPR \).*|extern uint32_t custom_tick_get(void);\n\1 (custom_tick_get())|g" \
+        -e "s|\(^[ \t]*#define LV_TICK_CUSTOM[ \t]\).*|\1 1|g" \
+        -e "s|\(^[ \t]*#define LV_TICK_CUSTOM_INCLUDE[ \t]\).*|\1 <stdint.h>|g" \
+        -e "s|\(^[ \t]*#define LV_TICK_CUSTOM_SYS_TIME_EXPR[ \t]\).*|extern uint32_t custom_tick_get(void);\n\1 (custom_tick_get())|g" \
         \
-        -e "s|\(^#define LV_USE_EVDEV \).*|\1${LVGL_CONFIG_USE_EVDEV}|g" \
+        -e "s|\(^[ \t]*#define LV_USE_EVDEV[ \t]\).*|\1${LVGL_CONFIG_USE_EVDEV}|g" \
         \
-        -e "s|\(^#define LV_USE_ASSERT_NULL \).*|\1${DEBUG_BUILD}|g" \
-        -e "s|\(^#define LV_USE_ASSERT_MALLOC \).*|\1${DEBUG_BUILD}|g" \
-        -e "s|\(^#define LV_USE_ASSERT_STYLE \).*|\1${DEBUG_BUILD}|g" \
-        -e "s|\(^#define LV_USE_ASSERT_MEM_INTEGRITY \).*|\1${DEBUG_BUILD}|g" \
-        -e "s|\(^#define LV_USE_ASSERT_OBJ \).*|\1${DEBUG_BUILD}|g" \
+        -e "s|\(^[ \t]*#define LV_USE_ASSERT_NULL[ \t]\).*|\1${DEBUG_BUILD}|g" \
+        -e "s|\(^[ \t]*#define LV_USE_ASSERT_MALLOC[ \t]\).*|\1${DEBUG_BUILD}|g" \
+        -e "s|\(^[ \t]*#define LV_USE_ASSERT_STYLE[ \t]\).*|\1${DEBUG_BUILD}|g" \
+        -e "s|\(^[ \t]*#define LV_USE_ASSERT_MEM_INTEGRITY[ \t]\).*|\1${DEBUG_BUILD}|g" \
+        -e "s|\(^[ \t]*#define LV_USE_ASSERT_OBJ[ \t]\).*|\1${DEBUG_BUILD}|g" \
         \
-        -e "s|\(^#define LV_USE_LOG \).*|\1${LVGL_CONFIG_LV_USE_LOG}|g" \
-        -e "s|\(^ \+#define LV_LOG_LEVEL \).*|\1${LVGL_CONFIG_LV_LOG_LEVEL}|g" \
-        -e "s|\(^ \+#define LV_LOG_PRINTF \).*|\1${LVGL_CONFIG_LV_LOG_PRINTF}|g" \
+        -e "s|\(^[ \t]*#define LV_USE_LOG[ \t]\).*|\1${LVGL_CONFIG_LV_USE_LOG}|g" \
+        -e "s|\(^[ \t]*#define LV_LOG_LEVEL[ \t]\).*|\1${LVGL_CONFIG_LV_LOG_LEVEL}|g" \
+        -e "s|\(^[ \t]*#define LV_LOG_PRINTF[ \t]\).*|\1${LVGL_CONFIG_LV_LOG_PRINTF}|g" \
         \
-        -e "s|\(^#define LV_USE_FONT_COMPRESSED \).*|\1${LVGL_CONFIG_LV_USE_FONT_COMPRESSED}|g" \
-        -e "s|\(^ \+#define LV_THEME_DEFAULT_DARK \).*|\1${LVGL_CONFIG_LV_THEME_DEFAULT_DARK}|g" \
+        -e "s|\(^[ \t]*#define LV_USE_FONT_COMPRESSED[ \t]\).*|\1${LVGL_CONFIG_LV_USE_FONT_COMPRESSED}|g" \
+        -e "s|\(^[ \t]*#define LV_THEME_DEFAULT_DARK[ \t]\).*|\1${LVGL_CONFIG_LV_THEME_DEFAULT_DARK}|g" \
         \
         -i "${S}/lv_conf.h"
 }
-- 
2.44.0


