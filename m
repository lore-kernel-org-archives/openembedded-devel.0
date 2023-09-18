Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46912CD37B0
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 05:56:51 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.45559.1695016604978596219
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Sep 2023 22:56:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VdMXI8oM;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-68fbd5cd0ceso3619969b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Sep 2023 22:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695016604; x=1695621404; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UBAJLmFu1I1XhtiaxxIf4iTZkWD83W2jSzFZLO27Uec=;
        b=VdMXI8oMdh/NR1v0YdQ45Fp+anrNG/t0csgZEV6AuSCkDPGz86w8d+SXYmb5PmKFrL
         4UvifFNd76ZvO+Sy+QJvuZ271pGRSJR/XvCO12SgNlRCf63FcuPRCWwrqXILAiiSwTpb
         NjupZfUVNV4S8MqGxecPhiXGpAFaQK4gOGbbdaCvpreQIDVzCq6WIpicsq6VqKDtHiP4
         mfduAo7EurrJ0NlPZqJx0o/Vam2940C80FDWr2NV3qCU+ENpF1fWJtNRPnctYikxEpn0
         TgNpSAQsrEi6MuWbCpg0XTXuTrhiOJz7pyw8wrmv0zikU/XE2tnzWj3NOKduBTY2zb7F
         iWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695016604; x=1695621404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UBAJLmFu1I1XhtiaxxIf4iTZkWD83W2jSzFZLO27Uec=;
        b=ZAp/xBlHg70P2NnNAqJozbWMBMDA5wdzibLfBqYN7aW6knx64pO0A/Y4kHzvYFpgMe
         ++f6FjPuJTQtfzAhUNKH8BhGza4hXwihVh2Z52DvK6hwksooqj7F1aDYwW2u2sz5qHfB
         No+Vs1StsEg3sgeVV/r5q93ndBF39KGKGzmSXZ+HhyOIpnlIKESj4MOv8BQcPBgdZo0D
         csEn3BFgbIk6uRvSf+PWkRe0/CqSLaCbpczYiVD1WmPNv3Z2kiDX6+PwuRjn41XbJCHM
         vwCpAMQIIAzdQJYUbbRd0NCsLT5bQWGxjGMpSuaKLbioxZDYwtP7018c8Pa3vmQkmQcS
         AKxg==
X-Gm-Message-State: AOJu0YyfUYKDHaBExc6oeE/iBH+Y5fJZ2TyfP6jqYvRs9uOlxNydPiOg
	401Na2snH7+hGOQk0z6iU2qY8PmFeuc=
X-Google-Smtp-Source: AGHT+IFrX9I4eRMHqCBtK9mfJiop2gwSQ6FNlT+lUBf0eJnam1MnOZkudyoMdl7mErisH6LUg2XJew==
X-Received: by 2002:a05:6a00:24d1:b0:690:33d6:11f6 with SMTP id d17-20020a056a0024d100b0069033d611f6mr10967218pfv.31.1695016604092;
        Sun, 17 Sep 2023 22:56:44 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::4880])
        by smtp.gmail.com with ESMTPSA id n24-20020a62e518000000b006875a366acfsm6495247pff.8.2023.09.17.22.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 22:56:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] meta-oe-ptest-image-poco: Increase size tp 1G
Date: Sun, 17 Sep 2023 22:56:40 -0700
Message-ID: <20230918055640.1903514-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 05:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104922

image size is >500M leaves no free space

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/images/meta-oe-ptest-image.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-core/images/meta-oe-ptest-image.bb b/meta-oe/recipes-core/images/meta-oe-ptest-image.bb
index 951d91f821..613da02977 100644
--- a/meta-oe/recipes-core/images/meta-oe-ptest-image.bb
+++ b/meta-oe/recipes-core/images/meta-oe-ptest-image.bb
@@ -23,6 +23,7 @@ IMAGE_OVERHEAD_FACTOR = "1.0"
 IMAGE_ROOTFS_EXTRA_SPACE = "324288"
 # If a particular ptest needs more space, it can be customized:
 #IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-<pn> = "1024288"
+IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-poco = "1024288"
 
 # ptests need more memory than standard to avoid the OOM killer
 QB_MEM = "-m 1024"
-- 
2.42.0


