Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3628DC4707C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 22:32:26 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web11.7694.1705098739061300814
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jan 2024 14:32:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.175, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3606f57e08aso30724305ab.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 14:32:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705098737; x=1705703537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CdDe2pMVdaAq2xeqPWa12yIW7cA9+RgC6W1ReIlphE0=;
        b=U9poAqGkHNjXQJZ/y04bs2oR50PyXs7S1+k8mj/IOiece9mUOJHLrCV5iimOW4sUgv
         1W2gmZ7WC1enRUcYhJ4jaRD920DiaGNx4XpZgSMZTVhUwbX+gtC9Ut5n6TuIP1HXDnCw
         BVFBSJEfc2KbtuRhOJsNvj6nTJbY5Xo5MFxXCSCag34+QwRkFlD5JDnTPGZIRSzyLBej
         HIeQkVh0jFDDWxnfC3mFNEoUVeMk4ekz8G4yncD4WCY4ym+XyK2Fw3J/Jirj1IhCkWnK
         t3PIJRLMxXZGj9uVYnPPSUR6kCRhjZEGImS6LC8erUI+pc+MDFrHPiaGWw+f6GrfiVIe
         6LMQ==
X-Gm-Message-State: AOJu0Ywy5eyZ6MEbhHAdMglrQ5PgS9jlCeSmlPA8jC1r5/O0mBIBFejU
	gXBWe/PI0Rs9uGGUCUII5Aao0Yd7Kuz60g==
X-Google-Smtp-Source: AGHT+IHAQO8M33jEQWhH3rtjjX22yP1vj/2pHZ5nJjZX60jH0TgLP/7r5hQTYG+/i6yHeexvnMuyDg==
X-Received: by 2002:a05:6e02:5c2:b0:35f:f025:a88a with SMTP id l2-20020a056e0205c200b0035ff025a88amr1951000ils.30.1705098737529;
        Fri, 12 Jan 2024 14:32:17 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id g14-20020a056e021a2e00b0035d6f8d02d7sm1195016ile.7.2024.01.12.14.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 14:32:17 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-google-api-python-client: update to version 2.113.0
Date: Fri, 12 Jan 2024 22:32:09 +0000
Message-Id: <20240112223209.3050003-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 22:32:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108262

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...t_2.112.0.bb => python3-google-api-python-client_2.113.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.112.0.bb => python3-google-api-python-client_2.113.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.112.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.113.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.112.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.113.0.bb
index b1614b854..4e6bb7daf 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.112.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.113.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "c3bcb5fd70d57f4c94b30c0dbeade53c216febfbf1d771eeb1a2fa74bd0d6756"
+SRC_URI[sha256sum] = "bcffbc8ffbad631f699cf85aa91993f3dc03060b234ca9e6e2f9135028bd9b52"
 
 inherit pypi setuptools3
 
-- 
2.34.1


