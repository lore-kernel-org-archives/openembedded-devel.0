Return-Path: <chris.chapuis@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F184C54E5D
	for <webhook@archiver.kernel.org>; Sat, 16 Mar 2024 10:01:18 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.3695.1710583260405089585
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Mar 2024 03:01:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cdxD8ApH;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: chris.chapuis@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-41408d7781cso1414385e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 16 Mar 2024 03:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710583258; x=1711188058; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sgHubziGPBSPEBCvMp3/7v8WFnBcrq6OrK0Cz+xAg5E=;
        b=cdxD8ApHYbVhfPXLlIT8wAG4gaBp9ATBmuOWCLpZRE48nPFnWO7FXN/UGBA6W3R5bD
         0n5Bch+Ma8mw9T79TWcOA97psy7xq7qfK3GB9ejJgOZdmZbA7aaNN1AMFN2OUlLop3lS
         4JexQ6Xy+L0eRTUT9UWnVnWniLC4cJxqX+oybHnXcGNNtqAtTRCylu8wErzdQ5MW73Kn
         x7o9AnvNk7hniMPp7/ku43V3z/gWdYcpi4+pWZxDmI6zym3G0L8i2LaigKGMWmDEhDYH
         uJwa0CymRjg/TEN15y02HM5eGBztw77ngyAEDSIF2dINbqFC1hjGixUIpdw0A0NaAhii
         HuDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710583258; x=1711188058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sgHubziGPBSPEBCvMp3/7v8WFnBcrq6OrK0Cz+xAg5E=;
        b=qHJ3HLt/7/XZCWRGbwGnvaXe4OM0EcFfbkyJDs9yPOVW2HhXJt/jalIGsMXYSDP0t1
         /1AFA1Qlgg1bj0URQJQ9ZFrvDlFFz2XF7Hbb0nhxUBpFg14NUFds6U9oMAZ8xuhLBqlS
         WEk+3diIW+zQ9jrLk42GGuIlNJDDV8DvZE5a7K+c1mKlEY0h+8/RSBakSi4NdM2gSTCi
         dJlJKFswg1dF6mG7BWb8eh7yvS9kNlWFMlqWarZOtZ2q1/t5Hy25zPbnTJKPvqJfDM31
         IunlxpU6Px3Zj0C8vtss/gBhnLe+YJH5QkUP7INgqHt5k75YmkmRZSlWEzGiIXZbhBZz
         XXaA==
X-Gm-Message-State: AOJu0Yy9XCfdcFf7Jo2mHizDAYmxVH5XaX/Or/BMouPJsCixNkic8PcK
	QkulyMmJKiyGhW3Nd8r2KQyr7GO0EH+DyNgkqG6X155Zf03ArOyFOaRchV1EGt8=
X-Google-Smtp-Source: AGHT+IElLSPeTdUe3o3EKDVq10nj5Cvamh8IlhTW/jfOkdm63uIx8oE5j3PZyWKV9BqWPXie0PZr6w==
X-Received: by 2002:a05:600c:a03:b0:414:9fa:1d4c with SMTP id z3-20020a05600c0a0300b0041409fa1d4cmr14579wmp.29.1710583258024;
        Sat, 16 Mar 2024 03:00:58 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:5d9:6330:4d5:74f6:de66:f26e])
        by smtp.gmail.com with ESMTPSA id je2-20020a05600c1f8200b004133072017csm11679806wmb.42.2024.03.16.03.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Mar 2024 03:00:57 -0700 (PDT)
From: Christophe Chapuis <chris.chapuis@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Fabio Estevam <festevam@denx.de>,
	Christophe Chapuis <chris.chapuis@gmail.com>
Subject: [meta-oe][PATCH v4 1/7] lvgl: fix typo in lv-conf.inc
Date: Sat, 16 Mar 2024 11:00:50 +0100
Message-ID: <20240316100056.409758-1-chris.chapuis@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Mar 2024 10:01:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109356

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


