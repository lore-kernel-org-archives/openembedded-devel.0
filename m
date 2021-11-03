Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10FB8C433EF
	for <webhook@archiver.kernel.org>; Wed,  3 Nov 2021 13:33:24 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.7680.1635946403674774157
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Nov 2021 06:33:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bUMOGY1U;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id v20so2473454plo.7
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Nov 2021 06:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/3w1938MFBhd8WM1lK+uaOgD97pTzi14ZREyZPLBRuk=;
        b=bUMOGY1UntszwrE6eZevATQ4mgNruPTGxqDXyjNcJOaAYotGQeCIiYkTPVTzzwfnKm
         baysd8m/CcPF8nMGWR9jD8PAtII7bwGgSjy8xoPoMXMKCX4wqnapZg7z6l+7GdIYhcUu
         9/gZZ31PYj5Y5j9Q20d/uT7DRzVIN7552d0BAlyULlAZGcaqAQZTBHu9qr2Rt9PqHc/P
         s093dTaLjNzBjxp7gDduOWXw6rjRQN+3qncRZ9mtGd28Cgq5gBBrgx2pJRLCVrJB2oap
         GPBRMRXyPgMMMueH3Wf39iPe11CDzcGYYxEunYDoe0WU2TFZbviRDCmMeQVcBg45Csoo
         6Epw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/3w1938MFBhd8WM1lK+uaOgD97pTzi14ZREyZPLBRuk=;
        b=bhE07ExQ2GwmAAT9aNmgssRVuFLL5wl+DJHh8b23MmBrVfYII6qNE02oj6ug7ttee9
         vfolBARYqUmBWwAbly4Inf01sr6/WEe/5HFvaRMRcT8RLIy8kEYual6tGFVe8tALBoHG
         noOoisUvP0pjvP3j5oXr8b6zkd3dkr0f82L/cejJh5iDjhOJRX/0hybpE+jyFg31HeDI
         dHKdkEFQ5SQWWczGU4kNC0ql+VSinZqLzMICiW+5FVo8isZiNZWefc2o+2C+OKlvKTlX
         jZQ0cDLev2FZKSUnY73b/wYekHoYxV4RQKF6CJGGx1jndIPvqvDierfBFGOKwGmM+l7e
         5oHw==
X-Gm-Message-State: AOAM531rVbyhQva06T3B0N9G6vrxn4sxycdZOTuO/BYTna4YT89Tbm8E
	CC28m901bJ/9W9681f9NVhj35OTJBKY=
X-Google-Smtp-Source: 
 ABdhPJz4VyjpUBoZQEcS46rU1dLiUpiO2AXt8DIwYiZi9VVSxf3e306x9uv4uifd2j0G15OxzB8y5Q==
X-Received: by 2002:a17:90b:110d:: with SMTP id
 gi13mr14782108pjb.1.1635946402925;
        Wed, 03 Nov 2021 06:33:22 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id
 y32sm2905226pfa.145.2021.11.03.06.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 06:33:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-kivy: Use branch parameter in SRC_URI
Date: Wed,  3 Nov 2021 06:33:20 -0700
Message-Id: <20211103133320.2224162-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Nov 2021 13:33:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93808

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb b/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb
index 030134d297..3daf13473a 100644
--- a/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f0c851d60495c7e27225a819e179208a"
 inherit setuptools3 pkgconfig features_check
 
 SRC_URI = "\
-    git://github.com/kivy/kivy.git;protocol=https;\
+    git://github.com/kivy/kivy.git;protocol=https;branch=master \
 "
 
 # Kivy's setup files only look for GLES libraries for Android, iOS, RPi,
-- 
2.33.1


