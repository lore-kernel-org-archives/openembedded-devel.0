Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D88C0218C
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 19:00:22 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web11.2824.1737140413863297008
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jan 2025 11:00:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-844de072603so185224039f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 11:00:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737140412; x=1737745212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=juo3U230YAjvgiXDORjkP52VGFDZWCExXiJ4vHDsYnM=;
        b=VakfS3Zr7lk8C6JNCElX8YPYc71HZ3UtORihq9Gmpm2wDMqzjGY8/dwwR2jEXQCw6g
         0q67y2f/TKChjfj4reXL0eIXirMg1h2anYP0ExsCN2+nYA5Pt+bAP1T6VOQ7sb/so+Tk
         f1CDD1JqfwP34Vn7TM0g7MHrQTEks2ImXjHWRg/BHmPYhiLYCn5c6gcplIRUa8DU8gmQ
         cyZeKWmDYh4osip1+7Ydx6JM0/zl5aOHfab7j2cb6Me+WJ7sllt91HKUhQxR01gVNmbH
         4p2Qasoe9ug/0xBErWzem3ksWqhYF+2jpOl6hD3v57e/zrOSIRL9qz7R3bEHgsOXa2/j
         nD6Q==
X-Gm-Message-State: AOJu0YxTigFPP/n9hIeb9Ygu68lmwMEf2WykY4Exqe4mxRJsKVAkVB3d
	e/15zHCRed8qYcyPvMNlGWvlw8JUGHGDaflERHpA4VoPRx5YASX87L77ig==
X-Gm-Gg: ASbGncuMr7Pa5Zpi7ZmK5rir2ZBexFDMrkaJUBDnKFCQSJT7n4uvy5oFPalaZnd2Jos
	vw0/+IjqRM+/FDcCH0sPqDDnLjq4ZBmXs9Td/Vo6En3TFLGJiXt4S52LAvqCzXEqHzAQiGyJALX
	RvbfytU+Ij/1ogNj0dzD1PL7dmoGx8l4YLFzm7WA+AnUAWgQjB9hFJPIPIquoabp41sE1GZsVBg
	51+2gG2TiiwIqkQ2RY9b9Ta2WwXdGfBJXPYGH+Glsukoax+8FWeyYFEq4THY3pHQavckyM0Drhy
	EfyqKL7GfU9hqwa/p26w7AzeAw==
X-Google-Smtp-Source: AGHT+IHJF7ReyGah2XQpeCKPYCAhzBPd9WZJa88AKeY6Ni0fj/mOYKJ9BkTPqzVjeXcQ7eQSoiyCPA==
X-Received: by 2002:a05:6602:488d:b0:849:a2bb:ffdd with SMTP id ca18e2360f4ac-851b618abd4mr392705739f.4.1737140412257;
        Fri, 17 Jan 2025 11:00:12 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea75495f5dsm761396173.60.2025.01.17.11.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 11:00:11 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 06/10] python3-pyyaml-include: update recipe to use the ptest-python-pytest class
Date: Fri, 17 Jan 2025 18:59:40 +0000
Message-Id: <20250117185944.3434424-6-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117185944.3434424-1-derek@asterius.io>
References: <20250117185944.3434424-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 19:00:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114927

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-pyyaml-include/run-ptest            |  3 ---
 .../python/python3-pyyaml-include_2.2.bb               | 10 +---------
 2 files changed, 1 insertion(+), 12 deletions(-)
 delete mode 100755 meta-python/recipes-devtools/python/python3-pyyaml-include/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-pyyaml-include/run-ptest b/meta-python/recipes-devtools/python/python3-pyyaml-include/run-ptest
deleted file mode 100755
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-pyyaml-include/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-pyyaml-include_2.2.bb b/meta-python/recipes-devtools/python/python3-pyyaml-include_2.2.bb
index a93a2391d..49e643c71 100644
--- a/meta-python/recipes-devtools/python/python3-pyyaml-include_2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyyaml-include_2.2.bb
@@ -7,17 +7,11 @@ SRCREV = "c5be2b7dfc4aaa91e44dbeb6fa42adc80936ef9d"
 
 SRC_URI = " \
             git://github.com/tanbro/pyyaml-include;protocol=https;branch=main \
-            file://run-ptest \
           "
 
 S = "${WORKDIR}/git"
 
-inherit python_setuptools_build_meta ptest
-
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
-    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
+inherit python_setuptools_build_meta ptest-python-pytest
 
 RDEPENDS:${PN} += " \
     python3-pyyaml \
@@ -27,7 +21,5 @@ RDEPENDS:${PN}-ptest += " \
     python3-fsspec \
     python3-aiohttp \
     python3-requests \
-    python3-pytest \
-    python3-unittest-automake-output \
 "
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


