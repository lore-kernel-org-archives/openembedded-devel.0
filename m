Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C89ACE7A81
	for <webhook@archiver.kernel.org>; Sat, 23 Sep 2023 01:09:40 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.12989.1695431370602969253
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Sep 2023 18:09:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: straka.derek@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-77412b91c41so134933185a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 18:09:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695431369; x=1696036169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pQuOWaXrz3M1U//2eZvqXed+cDeUIXm8dmlmVpkNapw=;
        b=uh08Pa+ekib7PFWMieRnFICKQk8sCH9R4l+lovAunhV4/ZY3exs7EfZ6y29fePufUl
         RzXyDJk/211DWdXLMpUwRmJTgIT7hTn/ItQaXh7IW5QkMSeXU91fLJy5AX09ydV4yN/H
         62Szr5c20SrMXcbEx/ME///do1Yml/Nioxzv/qDZ0T2CMXifh1ZQ7iIKiKFYDlyBUQ6l
         mXCUfM6ntkeftJuBfTqs7LBWd7YOtkc7Qvft9DcbapOCg3dp2DMJ9ogKQDI6XEMUH3Sk
         kjjfc1ZXx0hQJxaGMcE4sFRcYwuisgC4Pqjopr1+WHLmtiPXlgo+KyIG++wagEU/4Obn
         Y9pQ==
X-Gm-Message-State: AOJu0Yy25WFe73BFod1kP8EPn31mQsk1gdVA98tI5RnyYfmuwRqNzzwz
	64DQc1jFmQ/FA+kwmakTIoKrm11SuzyExw==
X-Google-Smtp-Source: AGHT+IF0BYKDI17LZyVJFEqpMqQXZEYyL5yR1ZQQRZmqEytL0rekJjwLk4LXytjiTheLRV30N1saaA==
X-Received: by 2002:a05:620a:3888:b0:770:67e3:1fee with SMTP id qp8-20020a05620a388800b0077067e31feemr873171qkn.65.1695431369248;
        Fri, 22 Sep 2023 18:09:29 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id dy52-20020a05620a60f400b007678973eaa1sm1851589qkb.127.2023.09.22.18.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 18:09:28 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-web3: Update version 6.9.0 -> 6.10.0
Date: Sat, 23 Sep 2023 01:09:19 +0000
Message-Id: <20230923010919.3257528-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Sep 2023 01:09:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105086

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-web3_6.9.0.bb => python3-web3_6.10.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_6.9.0.bb => python3-web3_6.10.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_6.9.0.bb b/meta-python/recipes-devtools/python/python3-web3_6.10.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-web3_6.9.0.bb
rename to meta-python/recipes-devtools/python/python3-web3_6.10.0.bb
index 92146696e..cba7ffe0d 100644
--- a/meta-python/recipes-devtools/python/python3-web3_6.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_6.10.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=373fede350846fdffd23648fba504635"
 
-SRC_URI[sha256sum] = "cb454d0180e63ba1d83143dccf7c623581ba58e222edb006f48252d8a7b948e0"
+SRC_URI[sha256sum] = "ea89f8a6ee74b74c3ff21954eafe00ec914365adb904c6c374f559bc46d4a61c"
 
 inherit pypi setuptools3
 
-- 
2.34.1


