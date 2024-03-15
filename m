Return-Path: <chris.chapuis@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D3DDC54E72
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 18:03:28 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.8.1710525804201449587
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Mar 2024 11:03:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dLD14W7a;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: chris.chapuis@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-33e1d327595so1583392f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 Mar 2024 11:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710525802; x=1711130602; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PzYJwpSaPIDs/hg4loV10dQbVh5hWgQ4H4jCLagEYw4=;
        b=dLD14W7aOu8bVlbOuAx55/WFPUW4MBexhntlM6NorYoYhctMGWx8lwFwCCpC45Vss9
         YIbpA3a1dUtP3fB0HLCFdAsHxQg1kbiLrz8bqGWvvuowNmWMl5lv+WHJyics448W2z1W
         IkMs8AXqvF5iLyosHd9QOWw77eOQH8pjRIkzMX92fM8xgUJTAiRjuL1YdnYf7iwN+Wp1
         CCWy/Pq0dlkwd63iCuq1x1Unx5NPWWVseL83/fDwjyUE/8GgMPT8fcHRQ04K0igCHAJ+
         +78CBW5hGNcSB72pP4vSw/UbD5rTasbTF7wXtj14QgJg83PvUM9nKnQv6q7mjxWemN9J
         eZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710525802; x=1711130602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PzYJwpSaPIDs/hg4loV10dQbVh5hWgQ4H4jCLagEYw4=;
        b=HdbChzVijiDmrZxnxtB+QCa1Oim4IMVTPl/Z5XH3tcezo6culdSYDMILVxVf+R+s5K
         j3zdVk44vDA3eH41NKXBUW1hveb8aofMPVpBgy/T4Rwwm7VbsD8EjugLKtIGqW0lDVkT
         dvpjIB0RG86mUQ2FKhjtC4dwo1Xg/C17P/jDBFtql35FEsAnbeJJylIbBGzP7LbftYSW
         0aS0CciAbk2MwEB2HUEJB2kK4pTG7m1V27drDDnMew+05rDHyF+JRYAgtYuwwIoky5U6
         FUIJw4ghOAFyN077VLm/5d//cV03iePLZDHRj+d1xTwqq7u3+M+UwYBK4lxpuY/QzOyj
         fpCA==
X-Gm-Message-State: AOJu0YwPDZN1fe5Vr9AxcBZCTI4MvEHupa9bgoISgg1fiVv+/t8tzWF7
	sxAOTfDiqs2P7E2W87OPXahV8C+OGhdVSxrJbUitogCCtA6ly4LMd3+EKJ2UmrU=
X-Google-Smtp-Source: AGHT+IHOpKLMSGXaA3Ft1AUqtc+p/qmCorx7LwT1C55WKJ8rLliUoWTNqbyGMOQCCDhbXoIdcN5gmQ==
X-Received: by 2002:adf:e392:0:b0:33e:9dd3:5998 with SMTP id e18-20020adfe392000000b0033e9dd35998mr3574007wrm.49.1710525802040;
        Fri, 15 Mar 2024 11:03:22 -0700 (PDT)
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
Subject: [meta-oe][PATCH v3 5/5] lvgl: add more variables to lv-conf.inc
Date: Fri, 15 Mar 2024 19:03:14 +0100
Message-ID: <20240315180314.9111-5-chris.chapuis@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240315180314.9111-1-chris.chapuis@gmail.com>
References: <20240315180314.9111-1-chris.chapuis@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Mar 2024 18:03:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109344

As it can be usefull to customize these other variables, let's
add them in lv-conf.inc.

Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>
---
 meta-oe/recipes-graphics/lvgl/lv-conf.inc | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
index f5a93dcae..088842490 100644
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
@@ -50,6 +60,13 @@ do_configure:append() {
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


