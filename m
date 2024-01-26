Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A2DC47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 21:21:58 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web11.1528.1706304110700884563
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jan 2024 13:21:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7bf2c826a5aso28823539f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jan 2024 13:21:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706304109; x=1706908909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LiWH+Q33+MBu+Qv4BdfWTCDmBh00BB13f8rI5xwj3pg=;
        b=YdV1pTQjNYVes/MRtsDN+n6ULO0SufdAk8G+9zMimlRao9tLrO+rXOjtTNCuyZcctT
         RREl77HdmxxCB4QTMh4f+64QNPwAlX1kFWKB+kCkJbiX4oqXX5BoQMg9mBFoQx9QWh3v
         IO6x9bdpf8UQzT/Ejcz3nqzoQGCZ10Xm4xTCMg5qKEKFmU06PC2Si35i/1YV4hwNjX8X
         37ucVR36H/0BG9oxhHjmv3YQ2a7SFQTzqWfc9405ycztVKHYrGWUhaA8tu1m1G4lOaxW
         smLoUVMh+R1Ud+8byzoC3YWKsLMns5wQM4PBN1xUxxNPnWXnje45v06+CEpmhFkS4Pp7
         D2HQ==
X-Gm-Message-State: AOJu0Yyz38nLl7po1WxfgtDZERgBvQE0s02ca55pi1MOXWSEgKjJ8teN
	aR9ZL87JpN0GJeygNP5K6+kXXhLZs5862iQfDTmv93yEmJ7RmRJweEUs28dpJCC5mcjN
X-Google-Smtp-Source: AGHT+IG7LSbLmbmzjjxEx8l2EVPkzE8RDji0g25YYNPbpQvFNPFLen93FDZhe2Us47pqmpMx+/WWfQ==
X-Received: by 2002:a6b:5f1e:0:b0:7bf:98e9:c9a4 with SMTP id t30-20020a6b5f1e000000b007bf98e9c9a4mr513529iob.8.1706304109090;
        Fri, 26 Jan 2024 13:21:49 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id p1-20020a6b6301000000b007bf32234124sm558214iog.32.2024.01.26.13.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 13:21:48 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-google-api-python-client: update to version 2.115.0
Date: Fri, 26 Jan 2024 21:21:39 +0000
Message-Id: <20240126212139.1580209-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jan 2024 21:21:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108471

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...t_2.114.0.bb => python3-google-api-python-client_2.115.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.114.0.bb => python3-google-api-python-client_2.115.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.114.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.115.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.114.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.115.0.bb
index 9564bff70..63628904a 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.114.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.115.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "e041bbbf60e682261281e9d64b4660035f04db1cccba19d1d68eebc24d1465ed"
+SRC_URI[sha256sum] = "96af11376535236ba600ebbe23588cfe003ec9b74e66dd6ddb53aa3ec87e1b52"
 
 inherit pypi setuptools3
 
-- 
2.34.1


