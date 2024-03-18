Return-Path: <chris.chapuis@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 633B9C54E58
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 18:26:06 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.52810.1710786356236837197
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 11:25:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JpUtpZds;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: chris.chapuis@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4140fcf4d02so10430365e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 11:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710786354; x=1711391154; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RCsI/uoNsVQP9robha9gBr/W1x/fUf2UpklqS5R4rDA=;
        b=JpUtpZdsIOtePwIx2NPP1Fc0rY+7nboWCWSQiydbaO8OjG6veaFGpTvG6YpXan7CgH
         jRjWwZKQbVMoRqwnljpXP9A4c7NxyrHBQg+ATGnFs46udns3TqiwO6VrxDk/yE5RxOWr
         P0VIlY+EzZLxPjVyiJfPFE6M7jufDhXkm/zfnurnEOIXul7cGm74g4LtN+KB/oweRxJ9
         cF1QyTAKE5ukb4hMKIH6iHsOWxFjxggNVT7u4XS/Z9ZXw7v/peDsHrmJnD/fCEOTltau
         QPufBBo0cZWV9yKzr0baShs4FORmf7cX24zEDRtiWdXsUEnQsjEYpXbwWQhsIbkKTJRb
         M80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710786354; x=1711391154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RCsI/uoNsVQP9robha9gBr/W1x/fUf2UpklqS5R4rDA=;
        b=fvIoNL3L8sYLjbDPg8W5blOOxrgQdITBw+CEjELHpGLMfg1QK7rJBDmqwzxcp872tr
         SWR042XpuH3M1IKVBPVDkHGUTlD5TTdq2BqiaRMkw7R8OvgtlL75Va+LwqeAkv8g67/I
         O7C6l1grcAQ1xwrnh+Zylp4s2gAWKonjrCVo44cdvIA0cql3PuYXFUTAQ+qGcGVJ0HbT
         6/ozyY5ow+K/zE/X+reW2d6SS82AIhVv8R0mjrSRx/FUx2OBgH+rqPY8cokZVh3DhmbD
         fhjdmMSFTc0ZGKeFougrM9rbcWaeHU5AxMJbEy1bFhlzjw8v6MQtjAQIaMoM/HRIhzfJ
         ArIQ==
X-Gm-Message-State: AOJu0YzlIreT/7sNsI0vwyETQG/dRwiLaeiLZcVfuOGgobNI9/+sic3K
	jXsInVExm83Y5BeaRKldMd72hQk7ADTstKjJFvsRQ0cwuFRbAE5kTMGhQj42B9w=
X-Google-Smtp-Source: AGHT+IEAuBlmHwhSXwK3bJVn63F/G6fG3JAH8gvnd2NqBenZOaM5SgJ6CDHFI8KgX2x6xDTqBbHqhQ==
X-Received: by 2002:adf:ef02:0:b0:33e:7b77:b319 with SMTP id e2-20020adfef02000000b0033e7b77b319mr147379wro.60.1710786353867;
        Mon, 18 Mar 2024 11:25:53 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:5d9:6330:4d5:74f6:de66:f26e])
        by smtp.gmail.com with ESMTPSA id p6-20020adfe606000000b0033e79eca6dfsm10300957wrm.50.2024.03.18.11.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 11:25:53 -0700 (PDT)
From: Christophe Chapuis <chris.chapuis@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Fabio Estevam <festevam@denx.de>,
	Christophe Chapuis <chris.chapuis@gmail.com>
Subject: [meta-oe][PATCH 1/2] lvgl: make libdrm include conditional
Date: Mon, 18 Mar 2024 19:25:50 +0100
Message-ID: <20240318182551.16648-1-chris.chapuis@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 18:26:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109410

The libdrm include is only needed when "drm" is selected in
PACKAGECONFIG.

In addition, move the TARGET_CFLAG addition to lv-conf.inc, where the
DRM configuration is actually selected for LVGL.

Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>
---
 meta-oe/recipes-graphics/lvgl/lv-conf.inc           | 3 +++
 meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.0.0.bb | 2 --
 meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb         | 2 --
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
index 2b5d4a14a..542e90ae5 100644
--- a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
+++ b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
@@ -2,6 +2,9 @@ PACKAGECONFIG[drm] = ",,libdrm"
 PACKAGECONFIG[fbdev] = ",,"
 PACKAGECONFIG[sdl] = ",,virtual/libsdl2 libsdl2-image"
 
+# Add libdrm include if drm is selected in PACKAGECONFIG
+TARGET_CFLAGS += "${@bb.utils.contains('PACKAGECONFIG', 'drm', '-I${STAGING_INCDIR}/libdrm', '', d)}"
+
 LVGL_CONFIG_USE_DRM = "${@bb.utils.contains('PACKAGECONFIG', 'drm', '1', '0', d)}"
 
 LVGL_CONFIG_USE_EVDEV = "${@bb.utils.contains_any('PACKAGECONFIG', 'drm fbdev', '1', '0', d)}"
diff --git a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.0.0.bb b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.0.0.bb
index 6d3ae1ec3..5ae930f5c 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.0.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.0.0.bb
@@ -30,8 +30,6 @@ inherit cmake
 
 S = "${WORKDIR}/git"
 
-TARGET_CFLAGS += "-I${STAGING_INCDIR}/libdrm"
-
 do_configure:prepend() {
 	if [ "${LVGL_CONFIG_USE_SDL}" -eq 1 ] ; then
 		# Add libsdl build dependency, SDL2_image has no cmake file
diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb b/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
index fddaef4b4..0fb3ddecf 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
@@ -22,8 +22,6 @@ inherit cmake
 EXTRA_OECMAKE = "-DLIB_INSTALL_DIR=${baselib} -DBUILD_SHARED_LIBS=ON"
 S = "${WORKDIR}/git"
 
-TARGET_CFLAGS += "-I${STAGING_INCDIR}/libdrm"
-
 ALLOW_EMPTY:${PN} = "1"
 
 PACKAGECONFIG ??= "drm"
-- 
2.44.0


