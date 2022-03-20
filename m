Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C4AC433EF
	for <webhook@archiver.kernel.org>; Sun, 20 Mar 2022 18:59:02 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web09.21638.1647802741407012934
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 11:59:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J4nIzeJ7;
 spf=pass (domain: gmail.com, ip: 209.85.215.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id c2so8840389pga.10
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 11:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ibsw+odFjv1od3O7zmvaUetyxqbB0W3xsv6Zfx2VVX8=;
        b=J4nIzeJ7JxabOSRT/i9Vil7BQaBb+P2PahHhe7P9xwk+yEwn7E5N9+RKZMWoQOkQWW
         5BcStaRDpLmcmooqdmFDf34zSy/rhLcaiPv3cjcLfmKIDAXNeJ93jyGA7CHxgNuXT9hP
         AzjxaF63gJ9+dNjPTBMbHOek2KN8bcL8tHwOwtxDqXPMIK/+a2EbRfCdtBpGIs0vM5FH
         iVuwwY326WIdvtyoaCo5vAC/HeU6TDd9e3Rl4qm4ceBtZv+rtbQWxt+eiKRbuGZY/jCI
         VlESw/LMb3RPjFRfpxqHIy1ovQafD9swoCHTZvdSSXWQBiBr/Sa2rzg05x3SazL7FLly
         K4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ibsw+odFjv1od3O7zmvaUetyxqbB0W3xsv6Zfx2VVX8=;
        b=qMfK/NCSPCKOK9EhOagnt6tMP2eoD6apq3NyaZoGfA6bStU8TatsR0vTP9gV6lfScL
         7aDue8qhcSRmKe6kp8PtKjMAOUQwwMLuh1Lxm0Y3iY6jOC6nwCWslhJfP0tGlNCcAyhJ
         DsM5CRpEQRCpqeVA8MGkrbrE6wzsGVKB+gkyrlE9z0L0a1FclDil2aPZFcXrp9S2CCwq
         8EtOiZLe3mcUvdOUBZioKQl4sHtwO35iWjAliklTUofB3KyRvYAtxGVyOkZuYAkMPEdz
         8b3pa/awye8RMwiqdiCSQKaQD9zO5pTBid9RJn01VZQ9kCxsGVIq0bmglDpSiIhdVF3J
         Tggw==
X-Gm-Message-State: AOAM530XS7BRADUew3Kl63tU0q2uSkInW47wYqruOsEf2qDy7P/vbNpu
	BhPkmQzhVFsJUTnxyRD+vkiXnKHqP/3QTw==
X-Google-Smtp-Source: 
 ABdhPJzYuaLNhv8nZozQDLBMGHc3oswYGRqvRhCSZQFDpVB9ZONuU5hNasOwR/cNMRhpDkOgBZRtjw==
X-Received: by 2002:a63:6949:0:b0:380:94ab:9333 with SMTP id
 e70-20020a636949000000b0038094ab9333mr15314226pgc.199.1647802740747;
        Sun, 20 Mar 2022 11:59:00 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 u10-20020a17090a2b8a00b001c6594e5ddcsm13884074pjd.15.2022.03.20.11.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 11:59:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/4] lvgl,lv-lib-png,lv-drivers: Pass libdir via
 LIB_INSTALL_DIR to cmake
Date: Sun, 20 Mar 2022 11:58:55 -0700
Message-Id: <20220320185856.3302842-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220320185856.3302842-1-raj.khem@gmail.com>
References: <20220320185856.3302842-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Mar 2022 18:59:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96088

Ensures it packages correclty on all platforms e.g. pp64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/lvgl/lv-drivers_7.11.0.bb | 2 +-
 meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb  | 2 ++
 meta-oe/recipes-graphics/lvgl/lvgl_8.1.0.bb        | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/lvgl/lv-drivers_7.11.0.bb b/meta-oe/recipes-graphics/lvgl/lv-drivers_7.11.0.bb
index 7ccee6bf11..1a94215839 100644
--- a/meta-oe/recipes-graphics/lvgl/lv-drivers_7.11.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lv-drivers_7.11.0.bb
@@ -24,7 +24,7 @@ S = "${WORKDIR}/${PN}-${PV}"
 LVGL_CONFIG_WAYLAND_HOR_RES ?= "480"
 LVGL_CONFIG_WAYLAND_VER_RES ?= "320"
 
-EXTRA_OECMAKE += "-Dinstall:BOOL=ON"
+EXTRA_OECMAKE += "-Dinstall:BOOL=ON -DLIB_INSTALL_DIR=${BASELIB}"
 
 TARGET_CFLAGS += "-DLV_CONF_INCLUDE_SIMPLE=1"
 TARGET_CFLAGS += "-I${RECIPE_SYSROOT}/${includedir}/lvgl"
diff --git a/meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb b/meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb
index 5b3b38d4a6..032e85f522 100644
--- a/meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb
+++ b/meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb
@@ -16,6 +16,8 @@ REQUIRED_DISTRO_FEATURES = "wayland"
 
 DEPENDS += "lvgl"
 
+EXTRA_OECMAKE += "-DLIB_INSTALL_DIR=${BASELIB}"
+
 inherit cmake
 inherit features_check
 
diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_8.1.0.bb b/meta-oe/recipes-graphics/lvgl/lvgl_8.1.0.bb
index 958639b046..2005afa2fd 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl_8.1.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl_8.1.0.bb
@@ -16,6 +16,7 @@ REQUIRED_DISTRO_FEATURES = "wayland"
 inherit cmake
 inherit features_check
 
+EXTRA_OECMAKE = "-DLIB_INSTALL_DIR=${BASELIB}"
 S = "${WORKDIR}/${PN}-${PV}"
 
 LVGL_CONFIG_LV_MEM_CUSTOM ?= "0"
-- 
2.35.1


