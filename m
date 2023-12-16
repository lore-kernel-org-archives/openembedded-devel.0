Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABC47C38147
	for <webhook@archiver.kernel.org>; Sat, 16 Dec 2023 08:07:40 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.11805.1702714052284117552
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Dec 2023 00:07:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LDmn9yJC;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40c29f7b068so15160745e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 16 Dec 2023 00:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702714051; x=1703318851; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pQMyRM8uqMchsafPlskVl4TLddPWg7xIxePX83rHwoM=;
        b=LDmn9yJCNwKGmsux2PX36ziT2f5qjZR92BO+iimWTBqVmyX6DOG9BGgimYXYADqboH
         QU+7qHBdnwEIKCKn4M4VXeo2+d60sU16mv1XEP0UQ/SpXjnmJ/mpVxC5/m4D+91G6URU
         /uP53nIoRSNnq8IxpjX/ykLUMTNAvZkXG77jjxae37AE6oGZ7w2wk/PXQxiy65KnqS2P
         Ql3vbEtrDTAiC6MQmeB8cRHhWFr3zeeVBRXouUxLd1ONXakFuLDjXRbrz6wTzIzINlyp
         0qzB/XPkrpr142Q+LA4zu066PSeBYbyMoHWckyQ38dIlADJWGldV58M/0WdR3/LFjf4N
         xTqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702714051; x=1703318851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pQMyRM8uqMchsafPlskVl4TLddPWg7xIxePX83rHwoM=;
        b=D5E+W905X1U0NxvDV7l8UN3CM08W7H0CkFcDDyxFCKgEpnnuu6/7EJE642T2Gi+a0y
         4zWCGRPNkXgtQQMvdaXfKLhbDVwuhSCOd0tI+m5f4IswSzMYkbGzNzajQJRUYLMCuhj2
         mgwYi5ov34Stsn+27+uTPgrP7pP4uk7K9w2Vvk5XW52FTO6v+b8ebkCdeIejilxyleW6
         WwYqXLZumEoJLS78kaclZEba9Q4G9iZnSoHL3mTu4/uM0FEeX3J96/2wEm9tWSqFlWpS
         nKg5o1uCH2Q5Zkdusr5ZEJt4vHMkOg4Pj0p3sC1JcmyenJUqtgxPLldAthvqrW6yyIg6
         6TAg==
X-Gm-Message-State: AOJu0YwAeQwd/z13wAw6pUCfKxeqzxH6dEV/1TJf47BcIyYNqdGj/BzS
	QKusfBKKl8CXf0KRh5XEKLegxbYGHs4=
X-Google-Smtp-Source: AGHT+IErA3z0fzipzUNaQZSuCjvmp6Dn8vTuJn6qHVp+wHmEqieYjQXro9kpn0kqunS3DBWDmljGhg==
X-Received: by 2002:a05:600c:198b:b0:40c:4be1:ae11 with SMTP id t11-20020a05600c198b00b0040c4be1ae11mr4863299wmq.188.1702714050559;
        Sat, 16 Dec 2023 00:07:30 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id vk2-20020a170907cbc200b00a1d3e9e888bsm11621556ejc.55.2023.12.16.00.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 00:07:30 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [meta-oe][nanbield][PATCH] poco: fix branch
Date: Sat, 16 Dec 2023 09:07:25 +0100
Message-ID: <20231216080725.3637701-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Dec 2023 08:07:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107532

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

The current SRCREV is not on any branch anymore, switch to the 1.12.4
branch HEAD which is similar and the only change is irrelevant.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 meta-oe/recipes-support/poco/poco_1.12.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/poco/poco_1.12.4.bb b/meta-oe/recipes-support/poco/poco_1.12.4.bb
index 12532e4ef1..96817c140e 100644
--- a/meta-oe/recipes-support/poco/poco_1.12.4.bb
+++ b/meta-oe/recipes-support/poco/poco_1.12.4.bb
@@ -8,13 +8,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4267f48fc738f50380cbeeb76f95cebc"
 # These dependencies are required by Foundation
 DEPENDS = "libpcre2 zlib"
 
-SRC_URI = "git://github.com/pocoproject/poco.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/pocoproject/poco.git;branch=1.12.4;protocol=https \
            file://0001-Use-std-atomic-int-instead-of-std-atomic-bool.patch \
            file://0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch \
            file://0001-Fix-data-race-when-create-POSIX-thread.patch \
            file://run-ptest \
            "
-SRCREV = "1211613642269b7d53bea58b02de7fcd25ece3b9"
+SRCREV = "3572a1fb981672e2cd1d2533ffd836da7db0f414"
 
 UPSTREAM_CHECK_GITTAGREGEX = "poco-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


