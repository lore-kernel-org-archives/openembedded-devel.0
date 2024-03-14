Return-Path: <chris.chapuis@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCF78C54E60
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 18:28:11 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.283.1710440882860854979
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Mar 2024 11:28:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GxoVyc2a;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: chris.chapuis@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-413f2366ef5so6126975e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Mar 2024 11:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710440881; x=1711045681; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kKxVqzgPsZGZlB/WwK5TlfwoI2qeDPl5dejthyeV2pM=;
        b=GxoVyc2afZZDU8nvKZrbpDw2uUet1GchJPqF9B4MB/3qaiHWHM4xS3tGpBBXqb7KPO
         qzvuSe228T6AI0/S5dqcPQ+Q/Kl02/Kvxzj8P53TPkksUMP/QdK2gXh3iKMV/Qvb1GUG
         WlC1lwFauc2OKTRTPzXrcbQ6FQnSwhreAwdZc1HD+ZGwqsBZxIWSksFVQvomT8TWbxg5
         87vbIyABCOA9jEPUB0dgut9aP6ufcE9+EAqoJ7ncGeZ0VAahmeJ87FbbOCQK/QOQ55cx
         E77bn7x12aZWcI88vtWta9L11Ytq1Vj0L4dAxIEZzzkMSX+hC+vJKm7UESWcc8fP1Tus
         njVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710440881; x=1711045681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kKxVqzgPsZGZlB/WwK5TlfwoI2qeDPl5dejthyeV2pM=;
        b=Cp0vgU0gQrUv7+606hKxGK9SAckr/Ui+XFBIIyUv0MlGLIKt+cAX8rqBfYeLk4JnFB
         RxcXh05/qSeqqiUmpBB4m7LeVzdb1kvL/EbzS1R4Uo/ep+3GM2N0BD7PfEFNepsJPoJq
         YoWbtMNio9CDhq4qOCwwzWyflOmYkDnUsBwQFuWEr1zd9FlwPem8rOYgfj6sq+aNL5cp
         0YwQ31wN1zv0rrTEVdQt4s+xG1OZmi+osIMvp7/eyagDdDBcXKTe5r6WCO5oJlJJKiTw
         +ggZYjbxzAi+/z6JgqmrxpuMzotN9Uk4M151+QiLx5oQkWNC16nk3gwAixr72oDJidFu
         KKtg==
X-Gm-Message-State: AOJu0Yzw87YJalHAALGk5KQZIyBP9hC38doMQc+9ShP0NKQbSenObPwP
	fO1l5OgOIbltTxWGIccd9UUZwPGfZKp3O/k9Ozg+SSFvjZ6itLcfsPfyuSTf
X-Google-Smtp-Source: AGHT+IFCyae4gkbO30FOnOaWlBVF1fSiKEKogxC46Kmkel6/jm+DayHw66tVaLEDVO94dPH0cI+mUg==
X-Received: by 2002:a05:600c:a007:b0:413:f5d1:b278 with SMTP id jg7-20020a05600ca00700b00413f5d1b278mr1539627wmb.33.1710440880692;
        Thu, 14 Mar 2024 11:28:00 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:5d9:6330:4d5:74f6:de66:f26e])
        by smtp.gmail.com with ESMTPSA id j30-20020a05600c1c1e00b004133825e6cfsm6336710wms.24.2024.03.14.11.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 11:28:00 -0700 (PDT)
From: Christophe Chapuis <chris.chapuis@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Christophe Chapuis <chris.chapuis@gmail.com>
Subject: [meta-oe][PATCH] lvgl: fix typo and install lv_conf.h
Date: Thu, 14 Mar 2024 19:27:56 +0100
Message-ID: <20240314182756.184896-1-chris.chapuis@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Mar 2024 18:28:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109316

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


