Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ADA9D0D78F
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 13:05:30 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.11020.1728651920774354320
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Oct 2024 06:05:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a86YXgjn;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539e1543ab8so858024e87.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 06:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728651918; x=1729256718; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMdKcwykEJ5DXtLwBa75eQRYegcmlbvuo9lvXBbeNS0=;
        b=a86YXgjnpTB0znmq3poGnkVaNdfzAh1CcsQbpF84IHG+XkULBjq0zRKjvJrsdxQ4ms
         GWedi/8rcAGPcmnIsYIFz3sb5Ut5Je2wIq4kael+bX0CEiAiG7Zl6mvA6K1FX9kOzh8U
         dQQH3rhsnLK0F1LTSxbQiqv3dzJZ+mb+x2vZ0Dv3xVEcm5+HI6pPfQN37alG3AQyvIQR
         juBR6pnZxB8hd9nOXWXJOvNTqxgBOo8K6mVgwedXIBl26IdCaqgpZhlF645aaICnHxey
         +dwcQ+4jdUuGwRVa8CzCyRXwtHNPlRjXAuxGOQT9+EKIVIDrSXHXeZrfXRWBx+ZL5Ma4
         rNPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728651918; x=1729256718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vMdKcwykEJ5DXtLwBa75eQRYegcmlbvuo9lvXBbeNS0=;
        b=NapKHnyveDv9/VoLnGAd1fPT2EsHjH6pHOrtAPc/m3cOoisId5Jy91012i0U0meiQQ
         EmacOMIejDJjf1unFqsLwUYsgXdunYa6oB7gpPgMB6XuDxCnc0uwzGItfOuAQCzsDWcw
         XHpiuUPw6FpfatwMtUfZZ0eE4oRLD44FwwlECBkxW5zSQk+6Uqt9lWT6izLUZ0lmJTIg
         r57E75nfr2mzRK8LKgx8tH1J8yuS9cKwaCpzkwoj+AzooIQt2yIJlP2FOKqwULzzGQH4
         n4Y0mfDEeE6I6dffo0TRL04sh7VoGIB5NMZR6ZfmOR/URLWGBw6NNheXR0CtLuDedlst
         NBvA==
X-Gm-Message-State: AOJu0YzI6xKl4XtIBd4Kda6wjuRHXTu9K863lTjOzslwRhTuZ6Qrplm2
	bQR4sQ35I2RJKGCEWOxypJ01l5AKbhJ/HW7zES2iO2/z1fNwKyzuNtF7BCDG
X-Google-Smtp-Source: AGHT+IG5cNeTruCjCe54ndQh0m87mnnd/ZsAnjtxJe998vfM8ig5Z2/0CKzbcd784HC4RxXv6Z2VXg==
X-Received: by 2002:a05:6512:3b10:b0:539:8cd1:848 with SMTP id 2adb3069b0e04-539da5aa786mr1772560e87.61.1728651918035;
        Fri, 11 Oct 2024 06:05:18 -0700 (PDT)
Received: from localhost.localdomain ([176.33.66.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a7ec56eesm210466066b.31.2024.10.11.06.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:05:17 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 3/5] python3-outcome: enable ptest
Date: Fri, 11 Oct 2024 16:04:39 +0300
Message-Id: <20241011130441.2919272-3-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241011130441.2919272-1-alperyasinak1@gmail.com>
References: <20241011130441.2919272-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 13:05:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112799

- Tested on qemux86-64 and qemuarm64

- Added ptest into PTESTS_FAST_META_PYTHON

- The PyPi package name defaults to PN without the python3- prefix, so there is no need to set PYPI_PACKAGE as outcome, it is by default.

Ptest result:
=============

qemux86-64:

Testsuite summary
TOTAL: 10
PASS: 10
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 7
END: /usr/lib/python3-outcome/ptest
2024-10-11T09:27
STOP: ptest-runner
TOTAL: 1 FAIL: 0

qemuarm64:

Testsuite summary
TOTAL: 10
PASS: 10
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 6
END: /usr/lib/python3-outcome/ptest
2024-10-11T09:24
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-outcome/run-ptest          |  3 +++
 .../python/python3-outcome_1.3.0.post0.bb     | 26 ++++++++++++++++---
 3 files changed, 26 insertions(+), 4 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-outcome/run-ptest

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 7864b632a..8f739f24f 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -42,6 +42,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-multidict \
     python3-netaddr \
     python3-ordered-set \
+    python3-outcome \
     python3-parse \
     python3-parse-type \
     python3-platformdirs \
diff --git a/meta-python/recipes-devtools/python/python3-outcome/run-ptest b/meta-python/recipes-devtools/python/python3-outcome/run-ptest
new file mode 100644
index 000000000..8d2017d39
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-outcome/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-outcome_1.3.0.post0.bb b/meta-python/recipes-devtools/python/python3-outcome_1.3.0.post0.bb
index 89c0da470..971430187 100644
--- a/meta-python/recipes-devtools/python/python3-outcome_1.3.0.post0.bb
+++ b/meta-python/recipes-devtools/python/python3-outcome_1.3.0.post0.bb
@@ -7,10 +7,28 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fa7b86389e58dd4087a8d2b833e5fe96 \
 
 SRC_URI[sha256sum] = "9dcf02e65f2971b80047b377468e72a268e15c0af3cf1238e6ff14f7f91143b8"
 
-inherit pypi setuptools3
+inherit pypi setuptools3 ptest
 
-RDEPENDS:${PN} += "python3-attrs"
+SRC_URI += " \
+	file://run-ptest \
+"
 
-RDEPENDS:${PN} += "python3-asyncio python3-core python3-pytest python3-typing-extensions"
+RDEPENDS:${PN}-ptest += " \
+	python3-pytest \
+	python3-pytest-asyncio \
+	python3-unittest-automake-output \
+	python3-outcome \
+"
 
-PYPI_PACKAGE = "outcome"
+RDEPENDS:${PN} += " \
+	python3-asyncio \
+	python3-attrs \
+	python3-core \
+	python3-pytest \
+	python3-typing-extensions \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
-- 
2.25.1


