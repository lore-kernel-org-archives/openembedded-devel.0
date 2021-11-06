Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A555FC433F5
	for <webhook@archiver.kernel.org>; Sat,  6 Nov 2021 18:17:56 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.22204.1636222675993149590
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Nov 2021 11:17:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EcoprPUx;
 spf=pass (domain: gmail.com, ip: 209.85.210.180,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id g19so5985508pfb.8
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Nov 2021 11:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8ma35NZCybT0XTS55PXBoG4dwQWmwe6abPdKxzTdTT8=;
        b=EcoprPUxuEKpzUXdKczKd3ZL2bIN7Y+Mv0v9EJNzcRLlbsy8IiTGSb+iDhlicGpxEh
         avXpPhDcEj5o1sNzZcCG5Izw9CffUpthGE0SNgo8qfchol7qxO2Abdukxd53ak75y4/C
         frkc8u/jkjdrc43pIWeOOfQLUouLjHw3lsuBCG/3e/ZCWDXunNxZxynhBFrZo4GXqLUW
         xSyYmBO//t3MH0lXBSKOogKNQoLqB3qVC5iWiIRi5DmIlTjh0v9ZQ7JiGgBDpagHQgOP
         inup+w81hn4ykSLv2JQq0cCgqeMpEDzp/8T4jDwY1SGlqN11pSW3Kzy1xmuIOFqUOU4h
         fWCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8ma35NZCybT0XTS55PXBoG4dwQWmwe6abPdKxzTdTT8=;
        b=8O6WdXRIByExNXQLCD1j0IN60uSOkYRu2iBv94GbZArl2gaeBKbNZWeFblH1Us2mmj
         zRsUi2n6LDCiNZt7Xe7nF5TWMIu60g4D03v9tpsnZhW/mWCJrVd1yA6c8SmdmuYEEBey
         cfaX2LsV1NuzaLHC49AxAX31d3bbE7LgYINJxLgFL6J+iHXG8npAZUrE93vI+hm+lToG
         R+LjeLwqqcodf2wtq+pTZ3m/3fGjaZ65y1VdNDSYwn4crDjF1J4YBYM77nJDyRZ7hxVU
         CjXuZd3zYkfUPkyV7KYMod5jmKB9YFHHMnq1fMGBHqpOUoxL9fGoZym+wzWl6g//Vxkp
         iUFg==
X-Gm-Message-State: AOAM531lSlujImTKXAzC4zzXXEEH+RYVjoBOQykA10lTNlLe+rNXc9jF
	oFmE/c4o1kVhe3g263HaB9s8lGCymFg=
X-Google-Smtp-Source: 
 ABdhPJzUrQbTfLICnPFWAryjvn6jupuM+kraDcbtuXI5ArRyjO/4DS67Y8m0e6DC6Sa+tJ3EisSdBQ==
X-Received: by 2002:a63:da0a:: with SMTP id
 c10mr50996178pgh.333.1636222675318;
        Sat, 06 Nov 2021 11:17:55 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:68d9:b431:d568:20cb])
        by smtp.gmail.com with ESMTPSA id
 p23sm12186820pjg.55.2021.11.06.11.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Nov 2021 11:17:55 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][honister][PATCH 4/4] python3-kivy: Use branch parameter in
 SRC_URI
Date: Sat,  6 Nov 2021 11:17:50 -0700
Message-Id: <20211106181750.869596-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211106181750.869596-1-akuster808@gmail.com>
References: <20211106181750.869596-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Nov 2021 18:17:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93858

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 671f9d7b2d06d3bfa4b3c7d34da9473b05bcf5f4)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb b/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb
index bd72beb5d0..7cb8cae9e0 100644
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
2.25.1


