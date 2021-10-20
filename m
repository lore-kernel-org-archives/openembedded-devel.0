Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 803E7C433FE
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 17:30:45 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web09.551.1634751044326633057
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:30:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W0GEFsDa;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id y3so48637406wrl.1
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m2XoOsdNIbsGAXws99BZeIUIRucchW+BzKqNluUvz/0=;
        b=W0GEFsDaootAAnHwfl+tDqujy5MbwJsVidXMLRVAldxyPC35pSOtFrhqCVQB/YmlYD
         jfrowByu1jbXmUPOgeyQqOE86yNDOee596H4/8OIdVLYP/piuSPzr4l8pRNMAdWzzYj3
         w24GgHppVJu3gDHSiXU6euEPgKI7pivzCiy/IC6k0wsdPJHIgsn/0TaTxuFP5DzWp6so
         +cBFfsMxZMjVUz2N7r+HKERXlA0wDhgU5koEYI1pEmGyxlWWS70wIpU652r1GoP+Tr3e
         rK0cMmYSj6t1aDXpLDYqqT210tr7jPvVTcgrBhOJc49vMN6NGgzmMi7fG51Z4IlrhLyn
         DZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m2XoOsdNIbsGAXws99BZeIUIRucchW+BzKqNluUvz/0=;
        b=meH+YhD4BZNM25EYJ6tARf5DTeo6e32htqsfI0xc3QOrmwMGemqIwuvWU1cbDCn8kO
         LBUuEUTZkMyjF5nUJaLBsgdWjBlJTzIIOOgpocEPpLQJtJe6O/qKLi0QOBkFZtKy7VUh
         dwF4gxOrnNFf76P3uyb1yLLCyQEI17iu9lCW9sFLw87TzOsxSCCbxgZ8kude6wrCzp3v
         hPCbYWcNLZgSO4SuVgIo7bQdWPpw9KRXVuo89SzMbt5Fc7swoIva2Z2r2nKJ6tkVsACZ
         KcNKibVfcNeCOG07B/vBWoG+OXpHyf4Vmq9yyoxmNtijCRabBGJKQfmGLTsIPeYnP3Dg
         HD6w==
X-Gm-Message-State: AOAM533+1+xJCOFpXhFhJZ/5uJHashwfEE1mpo9masOQ4bpl9XaXhc4L
	D7rTfCeFEgWD9LLZOGHQIyMEZISvzUs=
X-Google-Smtp-Source: 
 ABdhPJyQfaCG16eATLNEYHZQ413L0biZ6d0meEdefX42LlaTXE73lUS6TFZ2X6Cb99DUuV2A/vLy2w==
X-Received: by 2002:adf:e0cc:: with SMTP id m12mr773051wri.62.1634751042792;
        Wed, 20 Oct 2021 10:30:42 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 v18sm2677569wrm.63.2021.10.20.10.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 10:30:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] lv-lib-png: add wayland to REQUIRED_DISTRO_FEATURES
Date: Wed, 20 Oct 2021 19:30:40 +0200
Message-Id: <20211020173040.577772-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Oct 2021 17:30:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93498

* fixes:
ERROR: Nothing PROVIDES 'lvgl' (but meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb DEPENDS on or otherwise requires it)
lvgl was skipped: missing required distro feature 'wayland' (not in DISTRO_FEATURES)
ERROR: Nothing RPROVIDES 'lv-lib-png-dev' (but meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'lv-lib-png-dev'
NOTE: Runtime target 'lv-lib-png-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['lv-lib-png-dev']
ERROR: Nothing RPROVIDES 'lv-lib-png' (but meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'lv-lib-png'
NOTE: Runtime target 'lv-lib-png' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['lv-lib-png']

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb b/meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb
index ada9423076..084070c436 100644
--- a/meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb
+++ b/meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb
@@ -12,9 +12,13 @@ HOMEPAGE = "https://docs.lvgl.io"
 SUMMARY = "PNG decoder for LVGL"
 DESCRIPTION = "Allow the use of PNG images in LVGL. This implementation uses lodepng"
 
+# because of lvgl dependency
+REQUIRED_DISTRO_FEATURES = "wayland"
+
 DEPENDS += "lvgl"
 
 inherit cmake
+inherit features_check
 
 TARGET_CFLAGS += "-DLV_CONF_INCLUDE_SIMPLE=1"
 TARGET_CFLAGS += "-I${RECIPE_SYSROOT}/${includedir}/lvgl"
-- 
2.32.0


