Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0675FC47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 21:13:48 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web10.1263.1706303619209717313
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jan 2024 13:13:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7bf7e37dc60so25913239f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jan 2024 13:13:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706303618; x=1706908418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mkpKG/nCfLPl5Niyue1S43E7A1iWUjJrBM3v1hYO8oQ=;
        b=kM7FdeGYDNHPrzige3H04V5mQaE1+vAxndGBVSF4f5DFXwzhTw5tnx/BhTQzP6egw1
         tmvddBoz62MBchI3P83I4HjBJukIBi6USsVaQCgfWHygCbXQY9pielvrzbUWfJ7FmzJ4
         3m1/G27aJfASGW3soVzpwtEXtOlufRB+k5vKWlVmeNU41GzANU/Z76+gBURs2G9PjuZ5
         OxDgfSwR/TpaAyRJ98kIiWcKcuaHTaDLr2vZfezAPSHBBL/SK9PhNqJe6VTs6Pxq0+kc
         72gucXGmRU+Yr7Hga38pDUZDX4/P2BkokylU7ExI1aOkLfcculJifBwRT/3cDq03df6r
         S69g==
X-Gm-Message-State: AOJu0YzlGi/9jLEMDKywWcBck8oc5IqudVv5IopSrJPg+uES8OVa6Au/
	603wHmdLm/iJytGz4Bdj/8NIBIgGhx9WBV4ymdNN7wePdenHqzj6S5PN7YYsw1ATKcIP
X-Google-Smtp-Source: AGHT+IFvFe8C2aQizcKkxhC3Xf8sCdw5nOk3/8kl31ANu5L8b8tpOHViNO2prVv2B11JuBnAFlXZpA==
X-Received: by 2002:a05:6e02:12b0:b0:361:aa6d:f84e with SMTP id f16-20020a056e0212b000b00361aa6df84emr403567ilr.2.1706303617980;
        Fri, 26 Jan 2024 13:13:37 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id j20-20020a05663822d400b0046e36921276sm453336jat.139.2024.01.26.13.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 13:13:37 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-argcomplete: update to version 3.2.2
Date: Fri, 26 Jan 2024 21:13:27 +0000
Message-Id: <20240126211327.1574302-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jan 2024 21:13:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108468

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...ython3-argcomplete_3.2.1.bb => python3-argcomplete_3.2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-argcomplete_3.2.1.bb => python3-argcomplete_3.2.2.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_3.2.1.bb b/meta-python/recipes-devtools/python/python3-argcomplete_3.2.2.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-argcomplete_3.2.1.bb
rename to meta-python/recipes-devtools/python/python3-argcomplete_3.2.2.bb
index e6b9af084..fffecf521 100644
--- a/meta-python/recipes-devtools/python/python3-argcomplete_3.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-argcomplete_3.2.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/kislyuk/argcomplete"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "437f67fb9b058da5a090df505ef9be0297c4883993f3f56cb186ff087778cfb4"
+SRC_URI[sha256sum] = "f3e49e8ea59b4026ee29548e24488af46e30c9de57d48638e24f54a1ea1000a2"
 
 PYPI_PACKAGE = "argcomplete"
 
-- 
2.34.1


