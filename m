Return-Path: <chris.chapuis@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41100C54E71
	for <webhook@archiver.kernel.org>; Sat, 16 Mar 2024 10:01:18 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.3698.1710583262664280853
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Mar 2024 03:01:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fEnKkNr4;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: chris.chapuis@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-413f4cb646dso15644695e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 16 Mar 2024 03:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710583261; x=1711188061; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wh0SpENHu/4/BbsrPCIQmlKCTbFZxwkZDJneA/W00/U=;
        b=fEnKkNr4OHVMe02Ub/rLuSKVrjb9Zcpbdi1wRXFjJTu7+eV40qhXarTPKCjOAVSw/l
         Yj0ZWVOJBz++IojJnFGn0YrgqnDY431uOXvGugzsBdQO6rZgY+dlX/Ukda00YMhajLu8
         ORpSrMg6izY187g7CJHgvpgv3/6tfMaGWROU3p1211gXjU48TUcifZ6GnrQW3G6fRoVA
         cjsmzgbfHux0eTQScIj+gvBjERoA0+hplNnYgrrYe3UoSP7KFIgLhVr4tTaT6wjgzPGR
         CyWzfooGFI4icUxKmg5N25zSwF8Rxp93opbG1dFat9sF20N9E9o3N2cyOLHNiFh3whwO
         RGZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710583261; x=1711188061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wh0SpENHu/4/BbsrPCIQmlKCTbFZxwkZDJneA/W00/U=;
        b=P1mdXuZMfrVRWeBlgGLafS2+6PicOAuQcG2HqvWKvchTHRL8h+0C36wUsAil+Z8Ldv
         Cowk0PMMJSI+/VpwgC9NI9Qvr2PHWFM04mFLEFvw8oyAE5LrKJaMg/NVVH2YNPO8ZJCh
         5/k/Mtje8wxV9j58aaEmhheat0znpjrLn6Bm0ZAnmwx50gGT7X1CpvggzDEzF+9Jm0Wj
         g0yv+VR3MSS2QvuxmoFqajFeL1UvCcGhZxJAL0xQ8mCfyUhmJ++M1AwrKOxDR9SceP9O
         D5KflvazX/c1UTiZ9C0vKiOb1Ds8wN9FUbhPNGBqMGwJxOXgQK6PJbTupk/rIWzr/Z++
         al3w==
X-Gm-Message-State: AOJu0Yw6peA090Q0Tv/+eyOpWOSXhERvj/hKx+EQXlGS06NHi753+afA
	jeaZ1kRTttGrG7NXcIHGDpvZzUxDTuTPDKP3JS51xNvxcyRaO/6svSYPeE5WyTc=
X-Google-Smtp-Source: AGHT+IEFa576ttDAGjWwWVeiyq/NiXQc0Minj7+td1rvGcasDN6l8v78QBqkLhx2T3ryCpJ3IQizGQ==
X-Received: by 2002:a05:600c:458d:b0:413:1131:e21a with SMTP id r13-20020a05600c458d00b004131131e21amr5116522wmo.14.1710583260663;
        Sat, 16 Mar 2024 03:01:00 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:5d9:6330:4d5:74f6:de66:f26e])
        by smtp.gmail.com with ESMTPSA id je2-20020a05600c1f8200b004133072017csm11679806wmb.42.2024.03.16.03.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Mar 2024 03:01:00 -0700 (PDT)
From: Christophe Chapuis <chris.chapuis@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Fabio Estevam <festevam@denx.de>,
	Christophe Chapuis <chris.chapuis@gmail.com>
Subject: [meta-oe][PATCH v4 5/7] lvgl: add more variables to lv-conf.inc
Date: Sat, 16 Mar 2024 11:00:54 +0100
Message-ID: <20240316100056.409758-5-chris.chapuis@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240316100056.409758-1-chris.chapuis@gmail.com>
References: <20240316100056.409758-1-chris.chapuis@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Mar 2024 10:01:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109360

As it can be usefull to customize these other variables, let's
add them in lv-conf.inc.

Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>
---
 meta-oe/recipes-graphics/lvgl/lv-conf.inc | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
index e43a4d508..9ee9f283d 100644
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
@@ -37,6 +46,7 @@ do_configure:append() {
         \
         -e "s|\(^#define LV_COLOR_DEPTH \).*|\1${LVGL_CONFIG_LV_COLOR_DEPTH}|g" \
         -e "s|\(#define LV_MEM_CUSTOM .*\).*|\1${LVGL_CONFIG_LV_MEM_CUSTOM}|g" \
+        -e "s|\(^ \+#define LV_MEM_SIZE \).*|\1${LVGL_CONFIG_LV_MEM_SIZE}|g" \
         \
         -e "s|\(#define LV_TICK_CUSTOM \).*|\1 1|g" \
         -e "s|\(#define LV_TICK_CUSTOM_INCLUDE \).*|\1 <stdint.h>|g" \
@@ -50,5 +60,12 @@ do_configure:append() {
         -e "s|\(^#define LV_USE_ASSERT_MEM_INTEGRITY \).*|\1${DEBUG_BUILD}|g" \
         -e "s|\(^#define LV_USE_ASSERT_OBJ \).*|\1${DEBUG_BUILD}|g" \
         \
+        -e "s|\(^#define LV_USE_LOG \).*|\1${LVGL_CONFIG_LV_USE_LOG}|g" \
+        -e "s|\(^ \+#define LV_LOG_LEVEL \).*|\1${LVGL_CONFIG_LV_LOG_LEVEL}|g" \
+        -e "s|\(^ \+#define LV_LOG_PRINTF \).*|\1${LVGL_CONFIG_LV_LOG_PRINTF}|g" \
+        \
+        -e "s|\(^#define LV_USE_FONT_COMPRESSED \).*|\1${LVGL_CONFIG_LV_USE_FONT_COMPRESSED}|g" \
+        -e "s|\(^ \+#define LV_THEME_DEFAULT_DARK \).*|\1${LVGL_CONFIG_LV_THEME_DEFAULT_DARK}|g" \
+        \
         -i "${S}/lv_conf.h"
 }
-- 
2.44.0


