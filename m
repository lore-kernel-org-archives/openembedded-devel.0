Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95477C46CD3
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 22:55:11 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web11.7033.1703199306300775115
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 14:55:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7b7d55d7717so51626239f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 14:55:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703199305; x=1703804105;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T3YzzLFG92fttVGuWv0Ih5OZNYUkWMJExaTlZhdzbWE=;
        b=Nuwmr/hW3T5BS4kXwM+uwhJCSCwX0VaqFSqt6a8TJU8BHhgrYLKApDfHtDv4Zx8t1a
         RRlDdhaLtLGbEdBzRkj1ob4VYvLMO+IMkP8ZPeuT4PLByuCilxniuBnlJWA1GpbG6LPb
         pcHfBGwAbSP0kZUqE8Kxhf5nRdXqkspA0AH2iP1tplsRWHb1T4pYlr3vqmada0Do1fLL
         eIE4CVhjmlI6g5EW2Gg8MV66PuVlxucFYc/Qn0kOvBCmQpCKM9uZDPvfAf/D9LyCxghA
         m5sDGzK1U2GRkKzRcjR91wq5qSzI+7uriRYeFrQ3wPSDZuf0x8+DJer/Xg2mUDayJVlm
         nDmQ==
X-Gm-Message-State: AOJu0YwnlxvV7AFPsvi8tXOqrdK2GF5b+vO0KwgenDXjjQMF1L84Fwgl
	UnBxBobqdX62ZL1j+3pPq6HXKwpwsvBQSQ==
X-Google-Smtp-Source: AGHT+IHlYO5gQrL+4xEUhr1GVd6qeYf1fAixAie3W4ehJcOrLeQ7ZbVDBrp6Cxlfi37XAZt/OxtmUA==
X-Received: by 2002:a05:6602:4a:b0:7ba:9198:f322 with SMTP id z10-20020a056602004a00b007ba9198f322mr505355ioz.37.1703199304727;
        Thu, 21 Dec 2023 14:55:04 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id ei11-20020a05663829ab00b0046ce54fea8bsm699624jab.131.2023.12.21.14.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 14:55:04 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-web3: update to version 6.13.0
Date: Thu, 21 Dec 2023 22:54:57 +0000
Message-Id: <20231221225457.3953906-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 22:55:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107741

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-web3_6.12.0.bb => python3-web3_6.13.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_6.12.0.bb => python3-web3_6.13.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_6.12.0.bb b/meta-python/recipes-devtools/python/python3-web3_6.13.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-web3_6.12.0.bb
rename to meta-python/recipes-devtools/python/python3-web3_6.13.0.bb
index c54f362c6..0f0682fca 100644
--- a/meta-python/recipes-devtools/python/python3-web3_6.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_6.13.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=373fede350846fdffd23648fba504635"
 
-SRC_URI[sha256sum] = "81a68519ff4416eee7f16d4dbc498e70deb90908c7c1d7bebc950e5f3d1f29d5"
+SRC_URI[sha256sum] = "769ab3cfffea69c6b495c63a1aecdb522651c0304260fc25467a886d0be622e2"
 
 inherit pypi setuptools3
 
-- 
2.34.1


