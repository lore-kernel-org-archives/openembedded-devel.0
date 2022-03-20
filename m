Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D513C433FE
	for <webhook@archiver.kernel.org>; Sun, 20 Mar 2022 08:08:19 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web08.16226.1647763698782722394
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 01:08:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SP8kQPwq;
 spf=pass (domain: gmail.com, ip: 209.85.214.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id n18so10297660plg.5
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 01:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GB+7A1gwYLk+Asb3CyeG7ippi0fldTTl1T82/CHnVKM=;
        b=SP8kQPwqqPk/nXr8aRiIHYBYyBIbIQQ9SzqhJ7duDv9Pro/nOQO3CVRKNNFaSnHgtq
         OH23J5RTYNVNhm1wzNbdtxEtzAT65ysmM13UbU4Wzc7dE66GfSU4DXYBjiuvde/Ev5a3
         UbXlz0CIgxi8dq195zlP5ftE46vH4gcJb6aQlNpYd9oNY0ze2MrQOKCDTHcY1aANo8iB
         ka/a+4NoNSsBlnvwPPlmxQ2dDv83hB8uy4DSPMfcJ97ZQq2gJQDkNRK6VimWvoK9bEAy
         VxuwMRxa4/zeqwELkPr4K8O94Y5RRcqi53Z4LhMaiBFZJFaxGGL51ziVym1AzDTi8mBe
         +j9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GB+7A1gwYLk+Asb3CyeG7ippi0fldTTl1T82/CHnVKM=;
        b=agogyGUW6MQVTcKOwgT97dMcdO+P0po6utICymWRRwwiTIeqDbQnwZvfXc3mD9yOVz
         2KavzJOxE6sBEgYQkndXcN8khgLSe6mima6x+Zom2Bqby/ifRf0bmOPOU5SA9bPi//C0
         cYmdtyQNllyuR087F100sedgFFoXDnvo3pRMEvEsVo9k11/Tfts7F1StCOAu6KeRPc9b
         uO/eBQ4qriU8g3eOjNXwfSBJEXIdBkB4/7GPMdQkXIfiZSFhXZ/f18WKSwiGkkYy2aVv
         ypS88bMT4ZTBAjJlGW6taoZ1wK7U2e3J505YZ52GP3C1o1TugGieHTAJmEQl7NMvP1YG
         zqeQ==
X-Gm-Message-State: AOAM532KY51XqKCA8Lg5V5EDFClBY7bob6JhCTjW2h2xsVGwhWeRRDjw
	Y4LFOnpv9y1NT/z62usdJx1u+VWSJYk60w==
X-Google-Smtp-Source: 
 ABdhPJz5wZThCje+va5xt7hkV8KCl1lyaD1rDnlfxI35mUKDmZr1z3z4O3AuqpXsdK021Eg7Ymu9iQ==
X-Received: by 2002:a17:90a:c70f:b0:1bf:3e2d:6cfa with SMTP id
 o15-20020a17090ac70f00b001bf3e2d6cfamr20074887pjt.70.1647763697857;
        Sun, 20 Mar 2022 01:08:17 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 s6-20020a056a0008c600b004f667b8a6b6sm15607763pfu.193.2022.03.20.01.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 01:08:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 02/17] lvgl: Pass libdir via LIB_INSTALL_DIR to cmake
Date: Sun, 20 Mar 2022 01:08:00 -0700
Message-Id: <20220320080815.825928-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220320080815.825928-1-raj.khem@gmail.com>
References: <20220320080815.825928-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Mar 2022 08:08:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96066

Ensures it packages correclty on all platforms e.g. pp64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/lvgl/lvgl_8.1.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_8.1.0.bb b/meta-oe/recipes-graphics/lvgl/lvgl_8.1.0.bb
index 958639b046..50d6978442 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl_8.1.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl_8.1.0.bb
@@ -16,6 +16,7 @@ REQUIRED_DISTRO_FEATURES = "wayland"
 inherit cmake
 inherit features_check
 
+EXTRA_OECMAKE = "-DLIB_INSTALL_DIR=${libdir}"
 S = "${WORKDIR}/${PN}-${PV}"
 
 LVGL_CONFIG_LV_MEM_CUSTOM ?= "0"
-- 
2.35.1


