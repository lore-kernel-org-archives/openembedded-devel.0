Return-Path: <chris.chapuis@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58FF8C54E67
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 18:03:28 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.5.1710525800670177583
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Mar 2024 11:03:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b1rCN4M2;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: chris.chapuis@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-414037e9acdso4539685e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 Mar 2024 11:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710525799; x=1711130599; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sgHubziGPBSPEBCvMp3/7v8WFnBcrq6OrK0Cz+xAg5E=;
        b=b1rCN4M2RWZnMyiMPY2ooAS0bUriLac8jKCJIBN6ndUaIOBW92X+MMwCVMGWdX2lyx
         WSWJWlMAzp8WWOMpjvbf3v+Hcw7oWI8EOuC/p8b2TociwlDASkyJf08jHUMs72grq+RP
         wCh9gaTe+9saU97GcibBuHSNvxLl5vkDrRhbBIvxZpVdBg0m37KYXhzL+gRe7Ms+20ZE
         UzJzDtxi8OTVlFjkFF0/rqC9sGnSHBy22BpVIDmS9PTV3UEFWCEElsm2wGsOdO1FFtJc
         VLsjoVmsHdEERd6v2KC4MAeJzkCgGLuydhKNDycJXqMv/ABd57DyDJsZTQAvSMbQNVW0
         fiUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710525799; x=1711130599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sgHubziGPBSPEBCvMp3/7v8WFnBcrq6OrK0Cz+xAg5E=;
        b=KmaolLplLb0KxqPzKiFfrUrSfCbFUBEL+zdMbaMpjZv9zscO5D6pbFw56BU9TAcuq7
         tXIJD4DWZKzL5Dc6If9hHeGShgzUV7wSAhBMt6I8aM3krW3rs8usKJihVCXq1UXi8ehu
         hUJDitcFf5BYy5YH0GgZbYUgfgQnVRmBSQxKX7Nieu/CA0vKlpe84Xwa+KxpwBCxCANM
         F9rUZ4FNANBOGyW/vcdc1vIQFFQjF1eKL/DV56NqtpauQNqOaV9ymoRnwwaPJ97OAos9
         uOa+X6C3ty5v/lahDNS6qSNd4q61yZyYq9IgKKbiX90uMldv0Pi3H995A4E4XzrQ3ZId
         Zt7w==
X-Gm-Message-State: AOJu0YxPGX/YKDDDPOC19YkZmCYVdWHRlXoo667t4SOpFjaz8kUC8ydB
	z3O34lqFduH9ioraEDxHsfqjTebdM3nGG4/Vy4vdlqb57E+NQeDHhyb1m++0t48=
X-Google-Smtp-Source: AGHT+IFkdhqNhP9X/5cKa3+91oN4iqVcheThPf7xLO5gzk+aUHb/mGub7jM5eE4XZEJ82c9Z70AyPg==
X-Received: by 2002:a05:600c:4fd3:b0:413:2705:a1f with SMTP id o19-20020a05600c4fd300b0041327050a1fmr5530059wmq.8.1710525798265;
        Fri, 15 Mar 2024 11:03:18 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:5d9:6330:4d5:74f6:de66:f26e])
        by smtp.gmail.com with ESMTPSA id bu27-20020a056000079b00b0033ecbfc6941sm3366832wrb.110.2024.03.15.11.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 11:03:17 -0700 (PDT)
From: Christophe Chapuis <chris.chapuis@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Fabio Estevam <festevam@denx.de>,
	Martin Jansa <martin.jansa@gmail.com>,
	Christophe Chapuis <chris.chapuis@gmail.com>
Subject: [meta-oe][PATCH v3 1/5] lvgl: fix typo in lv-conf.inc
Date: Fri, 15 Mar 2024 19:03:10 +0100
Message-ID: <20240315180314.9111-1-chris.chapuis@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Mar 2024 18:03:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109340

Fix a typo in the first sed instruction, where the #if 0 is
never changed to #if 1 at the beginning of lv_conf.h.

Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>
---
 meta-oe/recipes-graphics/lvgl/lv-conf.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
index cb676ac62..3dbdf769f 100644
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
-- 
2.44.0


