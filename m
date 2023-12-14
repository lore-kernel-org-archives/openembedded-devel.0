Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 613D6C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 05:21:55 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web10.15558.1702531310525223614
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Dec 2023 21:21:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-7b724fa9d09so228210539f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 21:21:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702531309; x=1703136109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9f8JPGfEqrCn6qJYVVZhsWV0PFd/MOIykrDg4pRY0M4=;
        b=PiWT0+MKAO6w1ROkgzXvmwy0DME8/cc2SDjjAzOfjDbi3/p86UtpQFkwXbk+7vLdjM
         YELXTjxdaw99gk2fwpVoBgPs5en9iq2RTSDcZuUUK84m9mGHCCyt3JqpGHnTC89oyy0J
         mg84AxhyDvwCFYg901X5lt//xqQuCbfu+FnU8hwFl6//BrsaFRwUTyTxMk3KvAvE6Hoh
         WnGTADWHGElLDr8/pjgPel0ORRv5Wbu44Np9eyNyjciV6vPDzWUQE7U1tDqQmGCxNDhL
         I+lqYU7MjjThK/Igp8cPQbAEHq0CQfigU2lwMA6WDW2EEqs11qCSStHGZs65Z/I+RVRc
         VrnQ==
X-Gm-Message-State: AOJu0YxbMfi/kFCintbFpFd2aOTMHPnyOjI5U+L5hw/GD3dJ9KPnzOjH
	r6w0NlvF/4TfLck5PaJ48QuV5ef8hzeAgg==
X-Google-Smtp-Source: AGHT+IGOKUh32sEFTi70Pu0VJ5TplLg22kd08pFzHZK8ppkJTdfKQWcekf/+o5i05jj1r3SPilcg3A==
X-Received: by 2002:a5d:9ecb:0:b0:7b7:8429:68e1 with SMTP id a11-20020a5d9ecb000000b007b7842968e1mr1884376ioe.20.1702531309375;
        Wed, 13 Dec 2023 21:21:49 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id f65-20020a0284c7000000b004665e8a0608sm3250897jai.137.2023.12.13.21.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 21:21:49 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-gmqtt: update to version 0.6.13
Date: Thu, 14 Dec 2023 05:21:40 +0000
Message-Id: <20231214052140.1209348-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 05:21:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107416

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-gmqtt_0.6.12.bb => python3-gmqtt_0.6.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gmqtt_0.6.12.bb => python3-gmqtt_0.6.13.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.12.bb b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.13.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-gmqtt_0.6.12.bb
rename to meta-python/recipes-devtools/python/python3-gmqtt_0.6.13.bb
index c06e94e7a..101bfb9aa 100644
--- a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.12.bb
+++ b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.13.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/wialon/gmqtt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=903f1792621a3b35ee546da75d139177"
 
-SRC_URI[sha256sum] = "7df03792343089ae62dc7cd6f8be356861c4fc68768cefa22f3d8de5e7e5be48"
+SRC_URI[sha256sum] = "b4623d3e32ba266e96c04b0871bb057d05414371c1d279550648b390e6ba7577"
 
 inherit pypi setuptools3
 
-- 
2.34.1


