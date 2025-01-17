Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CD13C02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 19:00:22 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web10.2748.1737140412319270215
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jan 2025 11:00:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-844d555491eso75244739f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 11:00:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737140411; x=1737745211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hl4k3c4PyTu3TpGzhDGxS1fIn6hRZ1KRjpwm6sc1AxU=;
        b=KmoOMKRugsOV+K8Jt4ViEdV98hNAqczQFuOrZuN5SduA/nF/YYv85//04HBQlsqGca
         nXniDT+wWXkMCanvym1KzYSoGIe8rJ2VHCdcXXfWUymSRbGjq8d00W+w55hGM1A5hZTJ
         V7alOnMHeeBSiUH1bLYDk7KmzHiRkfY1lLZKeIzHGroINRyGUAdp4v67iPmTBCKCjOQ6
         mmciURODXrLR0cDJmybQ7wrV50InaqltGAuJOffjIdaK3rnfsBsXQxbsa3ryu9eUvplU
         jn++v6WgF72aQr9wejkjRqmDv5ogA6ueZqOOgYdnE8Sj0g2E/cXNvVosZRV9fzYj/A3D
         Dp5Q==
X-Gm-Message-State: AOJu0YwJfao+eWIHE75fWQwxUDKnJuNvJj5kgLW00fxgAN2HooNjIZEY
	HXuW5qxmig4R5TzG8Y/sOhZD0Xv8u2l7JUIj18uhSxwm7sTaFtn9IXUd0A==
X-Gm-Gg: ASbGnctovGNfYR9Z3M94csz41g/XL6FYSpSpCOZAhWfH1/B/BtfN51R2h3wT6yHhPwU
	iUqs8KLQUYRu4tQk9ygIzes2pY/GUpqHPOQ7WZR6bayuQM5Uw+ENvxsA/Ml5e78QIg+rYUAR+xW
	nwGI2MFIWJkq+N2XHtOx1Thwqt/taZZW1B7lwaFxiJMveDeXhtSyL8PIs/nlMDiPuokcZpEwNxt
	6yZtein/KA/WEC5LD9hTsu5RxE9Qbg1cl3kQzhQjJlhu2ZdX2aYyEgNbpp/Jwd94+1pPGuZaMQ2
	eZQ3wbdmIj+u9itWU7VV77CNwQ==
X-Google-Smtp-Source: AGHT+IFu4Lu2/09qXrQNl2ilHGVi71BaOLpuJ85il+VMKEXuvaz14SjreOZkt2nzj4rsuBchbkSPxw==
X-Received: by 2002:a05:6e02:3a08:b0:3ce:7b61:588 with SMTP id e9e14a558f8ab-3cf744962d3mr26175165ab.14.1737140410697;
        Fri, 17 Jan 2025 11:00:10 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea75495f5dsm761396173.60.2025.01.17.11.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 11:00:09 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 05/10] python3-rapidjson: update recipe to use the ptest-python-pytest class
Date: Fri, 17 Jan 2025 18:59:39 +0000
Message-Id: <20250117185944.3434424-5-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117185944.3434424-1-derek@asterius.io>
References: <20250117185944.3434424-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 19:00:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114926

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-rapidjson/run-ptest             |  3 ---
 .../python/python3-rapidjson_1.19.bb               | 14 +-------------
 2 files changed, 1 insertion(+), 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-rapidjson/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-rapidjson/run-ptest b/meta-python/recipes-devtools/python/python3-rapidjson/run-ptest
deleted file mode 100644
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-rapidjson/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-rapidjson_1.19.bb b/meta-python/recipes-devtools/python/python3-rapidjson_1.19.bb
index bfc05a735..5c47e0691 100644
--- a/meta-python/recipes-devtools/python/python3-rapidjson_1.19.bb
+++ b/meta-python/recipes-devtools/python/python3-rapidjson_1.19.bb
@@ -7,25 +7,18 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6fe0b2465366662d7cfa6793ccbab563"
 SRC_URI[sha256sum] = "81e7260f6297cad564389b700783c0a33de71310b9eb01fd013faec5e7ed4eff"
 
 # Inheriting ptest provides functionality for packaging and installing runtime tests for this recipe
-inherit setuptools3 pypi ptest
+inherit setuptools3 pypi ptest-python-pytest
 
 PYPI_PACKAGE = "python-rapidjson"
 
 SETUPTOOLS_BUILD_ARGS += " --rj-include-dir=${RECIPE_SYSROOT}${includedir}"
 
-# run-ptest is a shell script that starts the test suite
-SRC_URI += " \
-    file://run-ptest \
-"
-
 DEPENDS += " \
     rapidjson \
 "
 
 # Adding required python package for the ptest (pytest and pytest->automake report translation)
 RDEPENDS:${PN}-ptest += " \
-    python3-pytest \
-    python3-unittest-automake-output \
     python3-pytz \
 "
 
@@ -33,8 +26,3 @@ RDEPENDS:${PN} += " \
     python3-core \
 "
 
-# Installing the test suite on the target
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
-    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-- 
2.34.1


