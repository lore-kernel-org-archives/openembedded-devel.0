Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F8EEC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 05:34:05 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web10.15688.1702532043346218257
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Dec 2023 21:34:03 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-7b6fa79b547so463095439f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 21:34:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702532041; x=1703136841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QaFp9CNU6Tq4jO+EC6By2dCGMoJ7vB0jRBgcCHLovr4=;
        b=r41C8ixAgJCqsKhm8J+btGdItx9EKDWFSsLqJkf1+9Lz1/2TYw9Fjs/hKLT/HEy6Uw
         lR4IszsuNEYyYEMTxNkU6ABzSshmTgZPfXKas/OZQ1WkEjZvLPq+sNPu36kBoRiLVfSB
         pZxDH+Pk15tN8A3DzVLjyS0yFVtUs10EzywCDHHCGzMR0mI04B5y/EfrJjqpkevrJnzz
         fBAiBtFQNDJl7V6grC7nTO5IeXGg1iuVXCgARLVQ+jhDgWET2Fi5Vfsn2HB++a9+5ruk
         7O/UhP3bAo5z+XhXJ58k8pWECBOb21M8CA2LPzAOlMYq+iEBkhfLeMeMBldUcqLCRy92
         XrlQ==
X-Gm-Message-State: AOJu0Yx72g+FeIC6IahV2fyna22b9Hk2IA1XSkLSVVLLFQtF9btiqvYb
	ZhSQtoPN8bEJAw5fcvSVM6fHBuclG9jBLA==
X-Google-Smtp-Source: AGHT+IGLjHVs+bzKtZFQPjmUYFhi6X3Uz/3wuJnbtXAzCPbATLd60IsFG3252ku8vTf4HPZ5Byehzw==
X-Received: by 2002:a5e:9e05:0:b0:7b7:727e:ed27 with SMTP id i5-20020a5e9e05000000b007b7727eed27mr3148292ioq.42.1702532041634;
        Wed, 13 Dec 2023 21:34:01 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id n1-20020a5ed901000000b00786cf14a8absm3559355iop.43.2023.12.13.21.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 21:34:01 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-asyncinotify: update to version 4.0.4
Date: Thu, 14 Dec 2023 05:33:48 +0000
Message-Id: <20231214053348.1213663-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 05:34:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107419

NOTE: License changed from MIT -> MPL-2.0 in version 4.0.3

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...-asyncinotify_4.0.2.bb => python3-asyncinotify_4.0.4.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-asyncinotify_4.0.2.bb => python3-asyncinotify_4.0.4.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-asyncinotify_4.0.2.bb b/meta-python/recipes-devtools/python/python3-asyncinotify_4.0.4.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-asyncinotify_4.0.2.bb
rename to meta-python/recipes-devtools/python/python3-asyncinotify_4.0.4.bb
index 08dc77bd1..c11b2d5e0 100644
--- a/meta-python/recipes-devtools/python/python3-asyncinotify_4.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-asyncinotify_4.0.4.bb
@@ -1,9 +1,9 @@
 SUMMARY = "A simple optionally-async python inotify library, focused on simplicity of use and operation, and leveraging modern Python features"
 HOMEPAGE = "https://gitlab.com/Taywee/asyncinotify"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6ec941a1cd6616454970d03cb9c9e8f8"
+LICENSE = "MPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f75d2927d3c1ed2414ef72048f5ad640"
 
-SRC_URI[sha256sum] = "bcac19425b1b418bbbc4d31193ea3c39e24343cd7ddff2074ae7b599f1a04829"
+SRC_URI[sha256sum] = "811051db219e8d6bee14ac7cb58a0ebe565094f7aabb988943b1d9d58e994381"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


