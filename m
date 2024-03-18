Return-Path: <chris.chapuis@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64704C54E5D
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 18:26:06 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.52812.1710786356664925985
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 11:25:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZGwNew3s;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: chris.chapuis@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3412f49bac7so1360927f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 11:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710786355; x=1711391155; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oSvxnp3Kmd1x7VmLUYTSpNxr0U8mTwtcLTvV3Hc3lsU=;
        b=ZGwNew3sKzBWozD3BhsHdqeKm6opVt27LitFy04dqNTbOmYjRVS8dz/lO/WHz6B//E
         zzoojRHqmUcWPacK0MUIJLUcJkcZgHSYWtuCa12zIWe5/IKdN5dBgEPqJi7L3UObTmkP
         ueTlEJOnbV7vNP8AuIyswEdYQJhPeGss24zC/0zIng+JBeGo8qVbqUpZms4BZwevJipn
         pAJuQ4zJqcE4bA4gTzf+7hFUeBrCkWRORfA9+Ws6Vbx89BNZGNioDSRFi5ArG7I8VShq
         UGCc7THzwDzI/UFDg4bEYssWCekbc97kf0R8NbxQKbKBfc1gorpx+NQ3CsuUciqTmMCK
         A8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710786355; x=1711391155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oSvxnp3Kmd1x7VmLUYTSpNxr0U8mTwtcLTvV3Hc3lsU=;
        b=YiWvrNPM53qntTBeYRZ8mfe5nS+3hKQBm37v0iKavtF1DjuWIGuLxeIzgev2AknbYx
         L1A6drffFod2G3n7RijbtdSNIj+bz12MiMKEL6Eg9QUZnvcGYZhDHUPKTdriRrggnGsh
         3UFl74XfuNsy94ycnA1nv0tSeNGS3RivXs6JW4+49oL8/vn6byleABDMJSoDQaxw6d1z
         X375j3Fwe/WEKUYDtwGjKnKCOKtjgp4Tx7H7G5hQeHTJNGnLxD/45x1mdbtKi5Nw9TXv
         T/UE7RsAbIvDxRuiaMWo5saKny4T8a8r/L/MtazXZxCQwDdCAbuNbJJ+sxA3k/nYRyS1
         mDnw==
X-Gm-Message-State: AOJu0Yw5+pJs8tll5mVN1L0I/jyYG7EA5I8+DE48KIjH9IvG+5XgPeqP
	oXaijcHoZ+Kbokera3fFGsfDaaYDB23KXNtfFQtbsftTU4mEq7D1PnThnWRanAU=
X-Google-Smtp-Source: AGHT+IFsvFD8mehZlfmWdZs7BoS08k64wTvQTDrp+s7Xlhkmh0PBsYGw8bwT2fAnQP3rzHuy2upBSQ==
X-Received: by 2002:a05:6000:1a8c:b0:341:80b4:f479 with SMTP id f12-20020a0560001a8c00b0034180b4f479mr1657861wry.29.1710786354475;
        Mon, 18 Mar 2024 11:25:54 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:5d9:6330:4d5:74f6:de66:f26e])
        by smtp.gmail.com with ESMTPSA id p6-20020adfe606000000b0033e79eca6dfsm10300957wrm.50.2024.03.18.11.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 11:25:54 -0700 (PDT)
From: Christophe Chapuis <chris.chapuis@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Fabio Estevam <festevam@denx.de>,
	Christophe Chapuis <chris.chapuis@gmail.com>
Subject: [meta-oe][PATCH 2/2] lvgl: cleanup sed expression
Date: Mon, 18 Mar 2024 19:25:51 +0100
Message-ID: <20240318182551.16648-2-chris.chapuis@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240318182551.16648-1-chris.chapuis@gmail.com>
References: <20240318182551.16648-1-chris.chapuis@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 18:26:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109411

* use [[:space:]] instead of [ \t]
* remove global replace, as there is only one instance to replace for
  each expression
* use extended regular expressions and remove escape characters

Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>
---
 meta-oe/recipes-graphics/lvgl/lv-conf.inc | 48 +++++++++++------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
index 542e90ae5..8596790ae 100644
--- a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
+++ b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
@@ -36,39 +36,39 @@ do_configure:append() {
     # If there is a configuration template, start from that
     [ -r "${S}/lv_conf_template.h" ] && cp -Lv "${S}/lv_conf_template.h" "${S}/lv_conf.h"
 
-    sed -e "s|#if 0 .*Set it to \"1\" to enable content.*|#if 1 // Enabled by ${PN}|g" \
+    sed -r -e "s|#if 0 .*Set it to \"1\" to enable content.*|#if 1 // Enabled by ${PN}|" \
         \
-        -e "s|\(^[ \t]*#define LV_USE_LINUX_DRM[ \t]\).*|\1${LVGL_CONFIG_USE_DRM}|g" \
+        -e "s|^([[:space:]]*#define LV_USE_LINUX_DRM[[:space:]]).*|\1${LVGL_CONFIG_USE_DRM}|" \
         \
-        -e "s|\(^[ \t]*#define LV_USE_LINUX_FBDEV[ \t]\).*|\1${LVGL_CONFIG_USE_FBDEV}|g" \
+        -e "s|^([[:space:]]*#define LV_USE_LINUX_FBDEV[[:space:]]).*|\1${LVGL_CONFIG_USE_FBDEV}|" \
         \
-        -e "s|\(^[ \t]*#define LV_USE_SDL[ \t]\).*|\1${LVGL_CONFIG_USE_SDL}|g" \
-        -e "s|\(^[ \t]*#define LV_USE_DRAW_SDL[ \t]\).*|\1${LVGL_CONFIG_USE_SDL}|g" \
-        -e "s|\(^[ \t]*#define LV_SDL_BUF_COUNT[ \t]\).*|\1 2|g" \
-        -e "s|\(^[ \t]*#define LV_SDL_FULLSCREEN[ \t]\).*|\1${LVGL_CONFIG_SDL_FULLSCREEN}|g" \
+        -e "s|^([[:space:]]*#define LV_USE_SDL[[:space:]]).*|\1${LVGL_CONFIG_USE_SDL}|" \
+        -e "s|^([[:space:]]*#define LV_USE_DRAW_SDL[[:space:]]).*|\1${LVGL_CONFIG_USE_SDL}|" \
+        -e "s|^([[:space:]]*#define LV_SDL_BUF_COUNT[[:space:]]).*|\1 2|" \
+        -e "s|^([[:space:]]*#define LV_SDL_FULLSCREEN[[:space:]]).*|\1${LVGL_CONFIG_SDL_FULLSCREEN}|" \
         \
-        -e "s|\(^[ \t]*#define LV_COLOR_DEPTH[ \t]\).*|\1${LVGL_CONFIG_LV_COLOR_DEPTH}|g" \
-        -e "s|\(^[ \t]*#define LV_MEM_CUSTOM[ \t].*\).*|\1${LVGL_CONFIG_LV_MEM_CUSTOM}|g" \
-        -e "s|\(^[ \t]*#define LV_MEM_SIZE[ \t]\).*|\1${LVGL_CONFIG_LV_MEM_SIZE}|g" \
+        -e "s|^([[:space:]]*#define LV_COLOR_DEPTH[[:space:]]).*|\1${LVGL_CONFIG_LV_COLOR_DEPTH}|" \
+        -e "s|^([[:space:]]*#define LV_MEM_CUSTOM[[:space:]]).*|\1${LVGL_CONFIG_LV_MEM_CUSTOM}|" \
+        -e "s|^([[:space:]]*#define LV_MEM_SIZE[[:space:]]).*|\1${LVGL_CONFIG_LV_MEM_SIZE}|" \
         \
-        -e "s|\(^[ \t]*#define LV_TICK_CUSTOM[ \t]\).*|\1 1|g" \
-        -e "s|\(^[ \t]*#define LV_TICK_CUSTOM_INCLUDE[ \t]\).*|\1 <stdint.h>|g" \
-        -e "s|\(^[ \t]*#define LV_TICK_CUSTOM_SYS_TIME_EXPR[ \t]\).*|extern uint32_t custom_tick_get(void);\n\1 (custom_tick_get())|g" \
+        -e "s|^([[:space:]]*#define LV_TICK_CUSTOM[[:space:]]).*|\1 1|" \
+        -e "s|^([[:space:]]*#define LV_TICK_CUSTOM_INCLUDE[[:space:]]).*|\1 <stdint.h>|" \
+        -e "s|^([[:space:]]*#define LV_TICK_CUSTOM_SYS_TIME_EXPR[[:space:]]).*|extern uint32_t custom_tick_get(void);\n\1 (custom_tick_get())|" \
         \
-        -e "s|\(^[ \t]*#define LV_USE_EVDEV[ \t]\).*|\1${LVGL_CONFIG_USE_EVDEV}|g" \
+        -e "s|^([[:space:]]*#define LV_USE_EVDEV[[:space:]]).*|\1${LVGL_CONFIG_USE_EVDEV}|" \
         \
-        -e "s|\(^[ \t]*#define LV_USE_ASSERT_NULL[ \t]\).*|\1${DEBUG_BUILD}|g" \
-        -e "s|\(^[ \t]*#define LV_USE_ASSERT_MALLOC[ \t]\).*|\1${DEBUG_BUILD}|g" \
-        -e "s|\(^[ \t]*#define LV_USE_ASSERT_STYLE[ \t]\).*|\1${DEBUG_BUILD}|g" \
-        -e "s|\(^[ \t]*#define LV_USE_ASSERT_MEM_INTEGRITY[ \t]\).*|\1${DEBUG_BUILD}|g" \
-        -e "s|\(^[ \t]*#define LV_USE_ASSERT_OBJ[ \t]\).*|\1${DEBUG_BUILD}|g" \
+        -e "s|^([[:space:]]*#define LV_USE_ASSERT_NULL[[:space:]]).*|\1${DEBUG_BUILD}|" \
+        -e "s|^([[:space:]]*#define LV_USE_ASSERT_MALLOC[[:space:]]).*|\1${DEBUG_BUILD}|" \
+        -e "s|^([[:space:]]*#define LV_USE_ASSERT_STYLE[[:space:]]).*|\1${DEBUG_BUILD}|" \
+        -e "s|^([[:space:]]*#define LV_USE_ASSERT_MEM_INTEGRITY[[:space:]]).*|\1${DEBUG_BUILD}|" \
+        -e "s|^([[:space:]]*#define LV_USE_ASSERT_OBJ[[:space:]]).*|\1${DEBUG_BUILD}|" \
         \
-        -e "s|\(^[ \t]*#define LV_USE_LOG[ \t]\).*|\1${LVGL_CONFIG_LV_USE_LOG}|g" \
-        -e "s|\(^[ \t]*#define LV_LOG_LEVEL[ \t]\).*|\1${LVGL_CONFIG_LV_LOG_LEVEL}|g" \
-        -e "s|\(^[ \t]*#define LV_LOG_PRINTF[ \t]\).*|\1${LVGL_CONFIG_LV_LOG_PRINTF}|g" \
+        -e "s|^([[:space:]]*#define LV_USE_LOG[[:space:]]).*|\1${LVGL_CONFIG_LV_USE_LOG}|" \
+        -e "s|^([[:space:]]*#define LV_LOG_LEVEL[[:space:]]).*|\1${LVGL_CONFIG_LV_LOG_LEVEL}|" \
+        -e "s|^([[:space:]]*#define LV_LOG_PRINTF[[:space:]]).*|\1${LVGL_CONFIG_LV_LOG_PRINTF}|" \
         \
-        -e "s|\(^[ \t]*#define LV_USE_FONT_COMPRESSED[ \t]\).*|\1${LVGL_CONFIG_LV_USE_FONT_COMPRESSED}|g" \
-        -e "s|\(^[ \t]*#define LV_THEME_DEFAULT_DARK[ \t]\).*|\1${LVGL_CONFIG_LV_THEME_DEFAULT_DARK}|g" \
+        -e "s|^([[:space:]]*#define LV_USE_FONT_COMPRESSED[[:space:]]).*|\1${LVGL_CONFIG_LV_USE_FONT_COMPRESSED}|" \
+        -e "s|^([[:space:]]*#define LV_THEME_DEFAULT_DARK[[:space:]]).*|\1${LVGL_CONFIG_LV_THEME_DEFAULT_DARK}|" \
         \
         -i "${S}/lv_conf.h"
 }
-- 
2.44.0


