Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CEB5C02188
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 19:00:12 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web11.2820.1737140409257631655
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jan 2025 11:00:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-84cdacbc3dbso192456039f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 11:00:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737140408; x=1737745208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WVHXSZ4xVQbntbKXy4itOCsIgtRYU2+YdQc2eepkcxs=;
        b=DhjWyMI2JoooP05o7CZMuv3Fl3qiCyTHFiPtU+zRZa+Rwhs5h3R6XHfQcJCK3U/aId
         XUfaJTHrQMvlz4uW0nfHptbte9hhB28InxfEBKwDh5cTlXoaY05/Kky6xOAuSnFpXsX3
         Wt8Xf+7Ge/+buHqXJFH2rMfJnKFLhnN3vxfLvC7du8YV1j1wh+o2zE8K6cn5iLqIxUnA
         X4qMTXUQGvKonPvsCj0UcVYD09WezhvJwPaiYM227gkGF10NDGVqgmzobbAJlOuhoLMi
         G+4Af08J8pxBxaUVGxtq5XDqLOVvZgw+mozj90pZyZJhTrSFUQHA1rJ8zgSF8m2wmO1E
         jBew==
X-Gm-Message-State: AOJu0YyD1cP0inr7D/MJWn5LIpemw8sl6a58mbxSBtQ+bK0RvXk2wpud
	24SgEWR5QQWq/dRk2A/lDEj9bz7vG+ohxHlQ1JCoKNCPb0eB39I5isMSKg==
X-Gm-Gg: ASbGnctOmhH9M5Wf6D+k3AWBQAfe9AqxxD0R9XHHvUKVajfAXegjoHHtScGySguvQzE
	ou33HNxrhlpGHQnsQkpovUmz9JAIZF+QytfS7iHkkdMWDn7iFpRQgJA5nbpcInUVzBIKcG/G/u5
	u12kgRlYtLK6Hid2peM+CxW7imWfOKWs+DpiAGlTG47nueMpTM+AqIP5Qnzy1I6V+vB4CJANKTs
	FjBVPvFFiEQPLRdGb95mhVS7ccJj4s3FdQ5IXxm/kfKmVNpZjAkD7oNvcgZcfZT7QQUEjrHfnBU
	clMIMSlAgIvFokAUbJDDTy4qMg==
X-Google-Smtp-Source: AGHT+IFDjr6wH0wWfrZef7UT/y/Bj6IopZLWL3PIvOkjgGiJYn1rbRHC111kSaK8masbjW8di6JP3g==
X-Received: by 2002:a05:6602:2c90:b0:84a:7963:7043 with SMTP id ca18e2360f4ac-851b6162861mr378222239f.1.1737140407961;
        Fri, 17 Jan 2025 11:00:07 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea75495f5dsm761396173.60.2025.01.17.11.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 11:00:07 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 03/10] python3-requests-toolbelt: update recipe to use the ptest-python-pytest class
Date: Fri, 17 Jan 2025 18:59:37 +0000
Message-Id: <20250117185944.3434424-3-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117185944.3434424-1-derek@asterius.io>
References: <20250117185944.3434424-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 19:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114924

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-requests-toolbelt/run-ptest            | 3 ---
 .../python/python3-requests-toolbelt_1.0.0.bb             | 8 +++-----
 2 files changed, 3 insertions(+), 8 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-requests-toolbelt/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-requests-toolbelt/run-ptest b/meta-python/recipes-devtools/python/python3-requests-toolbelt/run-ptest
deleted file mode 100644
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-requests-toolbelt/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-requests-toolbelt_1.0.0.bb b/meta-python/recipes-devtools/python/python3-requests-toolbelt_1.0.0.bb
index 9cbe4927a..8956dee1f 100644
--- a/meta-python/recipes-devtools/python/python3-requests-toolbelt_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-toolbelt_1.0.0.bb
@@ -4,14 +4,14 @@ HOMEPAGE = "https://toolbelt.readthedocs.org"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6f14302a4b4099009ab38b4dde5f1075"
 
-SRC_URI = "file://run-ptest \
+SRC_URI = " \
 	   file://090856f4159c40a2927fb88546419f2e1697ad5f.patch \
 	   file://720240501dca0b4eacc3295665d7ced8719e11d2.patch \
           "
 
 SRC_URI[sha256sum] = "7681a0a3d047012b5bdc0ee37d7f8f07ebe76ab08caeccfc3921ce23c88d5bc6"
 
-inherit pypi setuptools3 ptest
+inherit pypi setuptools3 ptest-python-pytest
 
 RDEPENDS:${PN} += " \
     python3-requests (>=2.0.1) \
@@ -21,12 +21,10 @@ RDEPENDS:${PN}-ptest += " \
     python3-betamax \
     python3-mock \
     python3-multiprocessing \
-    python3-pytest \
     python3-trustme \
-    python3-unittest-automake-output \
 "
 
-do_install_ptest() {
+do_install_ptest:append() {
 	install -d ${D}${PTEST_PATH}/tests
 	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
 	cp -rf ${S}/setup.py ${D}${PTEST_PATH}
-- 
2.34.1


