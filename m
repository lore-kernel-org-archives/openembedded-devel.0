Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26643C3DA78
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 14:34:55 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web10.197784.1673966086900879238
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Jan 2023 06:34:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=U5iP2xf9;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: festevam@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id v17so4692520oie.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 06:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZi3SdhbWw/ug/LW2pFJwqf2N9qi4BAkUDqRO4SKDVs=;
        b=U5iP2xf976JWX3C69AOpqLSM6xK9eprGJqc5w/DsOP7vG7V/sy+3Qbiu8L75lMDZQu
         wtiG43r4+Y36NIY1q49wkocZ7Uufkxn0hqmLRfWos5vWCkWIU1HXmqkcqT8FsGIfB995
         QCyIVqYb59HFAB1suzBynuySZTtv5vnMU3Hk0D91yXufwlSRtFpxojgmBKi6emR/YLcY
         r8CeFslknjS376EMNw8izXv6FYEvtkU/yKts5afYX+L6LNIELCeB8aFH3LLB/bh+gwC/
         nLUqJN7vs8jFVZB7ZqakTfKfwHl4xuG2xSiqmXD7N9z20i+CCTh8iYbiGzdMukmxYENE
         2Ymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZZi3SdhbWw/ug/LW2pFJwqf2N9qi4BAkUDqRO4SKDVs=;
        b=pDVtXE13O32Ao5e57nK36Yn34P5Gp+XnkXcoJ9/yMGmK0o2CdcAS3Qakz11o/fRc2q
         xvatBdZuSYkUsijriQ5UOuQ1/iyJoxxlP+rKFxcZ/nNxB2o3QwLrbIK9Q4aFjWRYY476
         FqEexrg/bNd9kXPUJQ/zthL7HxYX1AuvIk7yBUZVo7hXHlBdLnd4rtroYlTFtuRFzvQu
         KDBdXp/Hj3SZxyzwkPO+Vdwl+hfJSxECi31sO7qSjww9K/uTNsqzmMubnCdm5OfinzwN
         vkTvxM6YKvOOjiuqFr6nh/QoPjeiSe3bahgGPRQdlKB9X9Iu1OUdeJ3vw2X5oywvUx2k
         6Jgw==
X-Gm-Message-State: AFqh2kow3+bC205y5+/A2sM46fL6nH3CD94ktqftNy5CP82uAwcw/8zW
	62R0vbQHa4p1XZtom6/r7vEuqge8owU=
X-Google-Smtp-Source: AMrXdXurJtEPp3Q/SFzkCDaGG3sB2Ui1b9X6hX6MV6rb6g2qnb2GfmsZVg0Bg4qOLXAG9mpMpqGlQA==
X-Received: by 2002:a05:6808:301f:b0:360:fe3d:8b32 with SMTP id ay31-20020a056808301f00b00360fe3d8b32mr1846482oib.49.1673966085747;
        Tue, 17 Jan 2023 06:34:45 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:4b69:397b:3f71:abf6:af24])
        by smtp.gmail.com with ESMTPSA id r132-20020acaf38a000000b003539686cb7bsm14490639oih.53.2023.01.17.06.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 06:34:45 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH] lvgl-demo-fb: Add recipe
Date: Tue, 17 Jan 2023 11:34:34 -0300
Message-Id: <20230117143434.139905-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 14:34:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100636

From: Fabio Estevam <festevam@denx.de>

Add a recipe for the LVGL framebuffer GUI demo.

This allows to quickly test the LVGL framebuffer GUI demo application
by running the "demo" binary.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 meta-oe/recipes-graphics/lvgl/lvgl-demo-fb.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/lvgl/lvgl-demo-fb.bb

diff --git a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb.bb b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb.bb
new file mode 100644
index 000000000..3430c2491
--- /dev/null
+++ b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb.bb
@@ -0,0 +1,17 @@
+SUMMARY = "LVGL Demo Application for Framebuffer"
+HOMEPAGE = "https://github.com/lvgl/lv_port_linux_frame_buffer"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=802d3d83ae80ef5f343050bf96cce3a4 \
+                    file://lv_drivers/LICENSE;md5=d6fc0df890c5270ef045981b516bb8f2 \
+                    file://lvgl/LICENCE.txt;md5=bf1198c89ae87f043108cea62460b03a"
+
+SRC_URI = "gitsm://github.com/lvgl/lv_port_linux_frame_buffer.git;branch=master;protocol=https"
+SRCREV = "dd010430b959f40b8f25a51c76bc920cbc2550cc"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = "DESTDIR=${D}"
+
+do_install() {
+	oe_runmake install
+}
-- 
2.25.1


