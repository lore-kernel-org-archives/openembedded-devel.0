Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21271C02185
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 22:59:29 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web10.812.1737154760788558528
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jan 2025 14:59:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.174, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3ce8c069840so19228265ab.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 14:59:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737154759; x=1737759559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/y8aEY88Oovz7c0JOSBBjzD5o6qH2PQ8OBws8BMbeKw=;
        b=xTaNThVEkZpx0VC/dzTirV2dAsnKX/oidRdQUdqvI2HqdsDsOHVjIOXwP1cuqNvMho
         oPcww4/mC6wm5l1egIek4gVq/JnKr8zbjxGRoflg8lqPYaHGE0si+WI5hb6KXv0+GVv3
         zBC6VvE9vRkNnz05SDkO28gD4/oN4S1zNmSx21bubFMJOW5bcL/zatrEXouYeEdL5tU3
         VAyShGe1I/OsyYuY+X+5APra7oAA4oIraYkWrc8asP/8kRV6sqWrN3c3hA5m2JtzI7E2
         GRjuFWnvUnDcpoO1nseTbuseTkZMYlJvXPFxah23+2lkauTSznY+me1eyQrBgQWSw1Tt
         8EIQ==
X-Gm-Message-State: AOJu0Yys54Zb8x3PRJYSeCFvcoB7ZS6Ic3sULijSAlNi9fGkr1MrdpR1
	mjIHvQ50dQfzZKRPPPOunqMj4rFbWTMrMyjkUV7CkBaINDNbZ0noyvB7Rw==
X-Gm-Gg: ASbGncvPZnPKDae1nhZbnzejO9FZ1zMChT0jSn7ajo99avOU7dHjWv/sLd/ht517A5G
	ftGx4pvYCt3Wzs8CT6c0Q1+KZELxfVjt4EyzQSiN3Vdwhxjvtjcf85noFrlxnfWL4lXFfmAv+39
	sMgJwZFZelEKS6hXCbqxeec8OF9tuJd8GhRwDy4M41pij6KEBv/qOXpz2eeXlP6fiw/KzX3dxaT
	bo/atj4py0EmdmlWbT+UFrLp8B3QfGK8HYoTZd4b0uIZFoU2TBkNwsxI5uaebeIFtdC06luXuDW
	GKdNhseKKvTR1lDP7wcUhNGZr3fttzIE8WuLKJ0=
X-Google-Smtp-Source: AGHT+IE0r2uJr5EbbbtTZL9UA2kVQ0eVJNS3Wd4y9Mqxp171QpMwSH6oswqG0qe9/hhDAVTXlNoqxg==
X-Received: by 2002:a92:c24b:0:b0:3ce:67ae:48f2 with SMTP id e9e14a558f8ab-3cf74495c6dmr33839005ab.15.1737154759543;
        Fri, 17 Jan 2025 14:59:19 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea7564943asm865259173.95.2025.01.17.14.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 14:59:18 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 3/4] python3-pint: update recipe to use the ptest-python-pytest class
Date: Fri, 17 Jan 2025 22:59:01 +0000
Message-Id: <20250117225902.4103075-3-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117225902.4103075-1-derek@asterius.io>
References: <20250117225902.4103075-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 22:59:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114946

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python3-pint/run-ptest   |  3 ---
 .../recipes-devtools/python/python3-pint_0.24.4.bb   | 12 ++----------
 2 files changed, 2 insertions(+), 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pint/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-pint/run-ptest b/meta-python/recipes-devtools/python/python3-pint/run-ptest
deleted file mode 100644
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-pint/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-pint_0.24.4.bb b/meta-python/recipes-devtools/python/python3-pint_0.24.4.bb
index 88efefff5..1bf62ca72 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.24.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pint_0.24.4.bb
@@ -6,7 +6,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bccf824202692270a1e0829a62e3f47b"
 
-inherit pypi ptest python_setuptools_build_meta
+inherit pypi ptest-python-pytest python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "35275439b574837a6cd3020a5a4a73645eb125ce4152a73a2f126bf164b91b80"
 
@@ -14,9 +14,7 @@ DEPENDS += "python3-setuptools-scm-native"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI += " \
-	file://run-ptest \
-"
+PTEST_PYTEST_DIR = "pint"
 
 RDEPENDS:${PN} += " \
 	python3-setuptools \
@@ -30,14 +28,8 @@ RDEPENDS:${PN}-ptest += " \
 	python3-flexcache \
 	python3-flexparser \
 	python3-misc \
-	python3-pytest \
 	python3-pytest-benchmark \
 	python3-pytest-subtests \
 	python3-statistics \
-	python3-unittest-automake-output \
 "
 
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/testsuite
-	cp -rf ${S}/pint/* ${D}${PTEST_PATH}/
-}
-- 
2.34.1


