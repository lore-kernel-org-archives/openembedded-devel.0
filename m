Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E581C3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 22:23:14 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web11.33822.1703110989904357756
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 14:23:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-35d82fb7e86so578755ab.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 14:23:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703110988; x=1703715788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4MlwB63HrEKOhHPW8kbWwFibFkMRFV5refr+k+pAdEQ=;
        b=fxcuVG5jKwmLYncBc1PFgh4gBfYJpqCb1LIkVHrhsAvl6r3l0YSqLEV1/FeutQnTg8
         RBmRYDG5RzjvV5aCj/O5LwxPm+C7StFcSiQdeufN0g2YkchMHjIrHMNtChEJgrwc3Bwp
         ND0uVWU+RKjguC3O/A33cyxNeTFkxgCD5eJR/4akw2PH2ih6L3v3kiG49n6veDXj8hn8
         463KUIveLsn9ERIOvjKB/OlmKooCx2/o5YIPNwqrzYH2OzlXePcGWW2xYOn3SiBF02z8
         uvhsrb+kfzrHgRC7nbmqMmuq6r/J0IHjMvObdaXPQR6E+qEPkas5Z50739FeOmyZor8T
         4sgQ==
X-Gm-Message-State: AOJu0Yx0X7+JGQL8n2iiDy4YFilH9kvyZCkamC6U0+z9+AqQDWwBPy0j
	fiYtdQs1wcHIRL9O1z+ELRH7uGdc5iZTIA==
X-Google-Smtp-Source: AGHT+IEWc+2brmNwYBqYFGk+0YUlL2owRjMVV/iLoRBLgbR/0nN739mpez3pMBxrVItworaJ7DK8Bg==
X-Received: by 2002:a05:6e02:1d91:b0:35f:c4c5:91e8 with SMTP id h17-20020a056e021d9100b0035fc4c591e8mr3738511ila.60.1703110988211;
        Wed, 20 Dec 2023 14:23:08 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id cr1-20020a05663847c100b004666d987222sm136808jab.29.2023.12.20.14.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 14:23:07 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-paramiko: update to version 3.4.0
Date: Wed, 20 Dec 2023 22:23:00 +0000
Message-Id: <20231220222300.3808649-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 22:23:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107682

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-paramiko_3.3.1.bb => python3-paramiko_3.4.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-paramiko_3.3.1.bb => python3-paramiko_3.4.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb b/meta-python/recipes-devtools/python/python3-paramiko_3.4.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb
rename to meta-python/recipes-devtools/python/python3-paramiko_3.4.0.bb
index da87e5199..0d32d361c 100644
--- a/meta-python/recipes-devtools/python/python3-paramiko_3.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-paramiko_3.4.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/paramiko/paramiko/"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
 
-SRC_URI[sha256sum] = "6a3777a961ac86dbef375c5f5b8d50014a1a96d0fd7f054a43bc880134b0ff77"
+SRC_URI[sha256sum] = "aac08f26a31dc4dffd92821527d1682d99d52f9ef6851968114a8728f3c274d3"
 
 PYPI_PACKAGE = "paramiko"
 
-- 
2.34.1


