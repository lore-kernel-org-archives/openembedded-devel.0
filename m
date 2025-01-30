Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD29C02195
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 21:58:26 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web10.6254.1738274300611338247
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jan 2025 13:58:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.175, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3cfcf8b7455so10300165ab.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 13:58:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738274299; x=1738879099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eKOaFifL23KaO0HKp0NcRb9clo6e7i7bTNXPzd3ciQw=;
        b=ACx6WSOqFZZDkg/lTmvhYcrWf4JTvf6ESEePlp8XPYBauGNVH9hgVL26ei9hJ7dCm9
         YUZ9rlsnTAlExctp0WqLZKpCtfVKycui330MOVJlANr6xrAaDSJvfY0uCdMneh3UbJaB
         BadlpLVPRx3JcW3xSuvmPdbAACjEsrxfcePrLz767usUv8Nz7k4Wv9Kpedq5/j/W9Ycu
         6uV0VzUH2AsTxm/cWWMfiZdr820XI/q93PULjyvGrE0Ewwuc9vT/yQ8vrn95HKNkdPUg
         M/Ve05zkgo0vjQ4BXq0xffiNtT/y5C1oB/qlNsPnwGt86dMgkpi0iNjcR5LmapcjAnXe
         mkag==
X-Gm-Message-State: AOJu0Ywn5tpT07wZimYoP4LlntVJbb3WGPuPxbQQqI18rY1ULNn0KvL2
	5X6gOBg0lfJDCFmebVy6B2HuxymG/f7cXZiCnqqd/Hdysgd+/beycf0pXHXNfYU=
X-Gm-Gg: ASbGnctZPJXi8v5u0vDzAVbGbgnzYofQI4M5Y2NSFWWwGsy9KerD8Hg6tSOadTVmkfP
	yu3jkVUFkpLteDj3anxc+eYRJVAxPphuOjh0ZogPVGk0u45RvCsgdVHnMVls15Ra2ofb8qEL1p1
	Evh9VjxWj4TPAnzi9OGytSYz347xY5i40pY9A2TKS2BGw5JQ/5La1IF9EOoc5wDOchg1WIm21B/
	8wvZk4O2PccjiYMalGlXR134K8AO0ZFiTTKQ9vlgVUKqueXFiZXe2slaGXFSLYKdY3dt7RcFA2i
	NW0vH/0i0I7CZF/sAtTk7DQ9rkWXmoPArgzHRNqQVAc8rgfqbEUDWO4kNHwD
X-Google-Smtp-Source: AGHT+IHV3/1HwIerwuXKZnyOKyGp0j9ja7GixZNL4AFuzocW7rNJMjjZYtqAxpbFVhsEe0TguQS+Yw==
X-Received: by 2002:a05:6e02:1947:b0:3cf:f88b:b518 with SMTP id e9e14a558f8ab-3cffe47022dmr101543645ab.18.1738274298993;
        Thu, 30 Jan 2025 13:58:18 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec746e3e63sm519071173.144.2025.01.30.13.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 13:58:17 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 13/23] python3-httptools: update recipe to use the ptest-python-pytest class
Date: Thu, 30 Jan 2025 21:57:28 +0000
Message-Id: <20250130215738.3280576-13-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130215738.3280576-1-derek@asterius.io>
References: <20250130215738.3280576-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 21:58:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115167

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-httptools/run-ptest           |  3 ---
 .../python/python3-httptools_0.6.4.bb            | 16 +---------------
 2 files changed, 1 insertion(+), 18 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-httptools/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-httptools/run-ptest b/meta-python/recipes-devtools/python/python3-httptools/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta-python/recipes-devtools/python/python3-httptools/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-httptools_0.6.4.bb b/meta-python/recipes-devtools/python/python3-httptools_0.6.4.bb
index 730df90f1e..49f14da206 100644
--- a/meta-python/recipes-devtools/python/python3-httptools_0.6.4.bb
+++ b/meta-python/recipes-devtools/python/python3-httptools_0.6.4.bb
@@ -3,20 +3,6 @@ HOMEPAGE = "https://github.com/MagicStack/httptools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0a2d82955bf3facdf04cb882655e840e"
 
-inherit pypi setuptools3 ptest
+inherit pypi setuptools3 ptest-python-pytest
 
 SRC_URI[sha256sum] = "4e93eee4add6493b59a5c514da98c939b244fce4a0d8879cd3f466562f4b7d5c"
-
-SRC_URI += " \
-        file://run-ptest \
-"
-
-RDEPENDS:${PN}-ptest += " \
-        python3-pytest \
-        python3-unittest-automake-output \
-"
-
-do_install_ptest() {
-        install -d ${D}${PTEST_PATH}/tests
-        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-- 
2.34.1


