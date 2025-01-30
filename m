Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF5D1C0219A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 21:58:26 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web11.6227.1738274305696569320
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jan 2025 13:58:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-844ee43460aso73955639f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 13:58:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738274304; x=1738879104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fhr1FTX0GGTumwFU23nVH+49ilotJC3YkVUTj+xuvVI=;
        b=hMzlK2Q8BcHKK8wqpyjUqBeE3YkK9cEjcySWLPQYPbJ7Ad/YCPoR2yjgMUEznlDCTZ
         Gl0Dhnw096+ZutJGpVg6YUZ1kJKtEdzNwzTd5EuarGzpCjWmYl0JnPOuGk9KreoBtkYb
         /YY6/LEqOo++QsB8fDImwr+jLlwrdASy9g6tsZCChFgME3RpW5l2QfVdaTERq/WBc2pL
         1BjntBJF4bkF+UPvEwwkVwkKYlvSxmS4Gy9ejhwR1NoYeBv0d14U1ubA+aoX3ljp290F
         BzspAvvLd+3B7OH94a7vwXVev+Y6m5KtYjxMK59gu3LtLA6WsZeMs17GagVnZmZNKaYq
         54NA==
X-Gm-Message-State: AOJu0YwCCyqWYeaZbIdyaioxuBns1jV7KZ/R9e+NRjJmWLYX30+j4enj
	htO9WA+UMjVF6pwFnC/W8HrhU3SIjFraX4i1cYIrqvI3fzLRnVvC7eR6b5hVI5k=
X-Gm-Gg: ASbGncvHHVqB0Fbd+XTgB20QfZ6MgAL1N+keCMCwz5mC1Pq9fPW3eNfSLfo3QhplxgP
	ic5cJ8ak7VrYS90cOTRnUUapPeW+Rv8NBnmTkZye21/gAMkEbmLEvFOG0QfUjY/AHtqgvEmcq3A
	Sv6KWurmWAVU1KjmhNFd7WYGNGLpjxErQYX7LMJz6/l4uEwD0ndzGMWclYf11zLz6GMRNdfB1iU
	cyqTgWLbiUeRElWepc/IXKBut8P52pfLe//fjnbcsvvgRGLAXICbo/82Yor1hFjADcPdRn9FBUM
	q/fMYzyJD8Med+UpcvSAqFseEFRLAfVZloPMbjDOhQbkRtfZ/MgdHglR0UBj
X-Google-Smtp-Source: AGHT+IF1zMCsOHyBikGOBFDJ3qPxyDysXgz3NQdlYrYhkeua969N3iFdUSSXf0yWjAN1jCdZzftAzw==
X-Received: by 2002:a05:6e02:3101:b0:3ce:69ca:ef99 with SMTP id e9e14a558f8ab-3cffe3e5e4amr90690845ab.6.1738274304550;
        Thu, 30 Jan 2025 13:58:24 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec746e3e63sm519071173.144.2025.01.30.13.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 13:58:23 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 17/23] python3-flexparser: update recipe to use the ptest-python-pytest class
Date: Thu, 30 Jan 2025 21:57:32 +0000
Message-Id: <20250130215738.3280576-17-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130215738.3280576-1-derek@asterius.io>
References: <20250130215738.3280576-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 21:58:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115171

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-flexparser/run-ptest          |  3 ---
 .../python/python3-flexparser_0.4.bb             | 16 ++--------------
 2 files changed, 2 insertions(+), 17 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-flexparser/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-flexparser/run-ptest b/meta-python/recipes-devtools/python/python3-flexparser/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta-python/recipes-devtools/python/python3-flexparser/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-flexparser_0.4.bb b/meta-python/recipes-devtools/python/python3-flexparser_0.4.bb
index ef8cbe5a54..c3d8fe28ac 100644
--- a/meta-python/recipes-devtools/python/python3-flexparser_0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-flexparser_0.4.bb
@@ -6,23 +6,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=32f547dac365c355d2cdbcd7ebea9144"
 DEPENDS += "python3-setuptools-scm-native"
 SRC_URI[sha256sum] = "266d98905595be2ccc5da964fe0a2c3526fbbffdc45b65b3146d75db992ef6b2"
 
-inherit pypi python_setuptools_build_meta ptest
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 PYPI_PACKAGE = "flexparser"
 
-SRC_URI += " \
-	file://run-ptest \
-"
-
-RDEPENDS:${PN}-ptest += " \
-	python3-pytest \
-	python3-unittest-automake-output \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/testsuite
-	cp -rf ${S}/flexparser/testsuite/* ${D}${PTEST_PATH}/testsuite/
-}
+PTEST_PYTEST_DIR = "flexparser/testsuite"
 
 RDEPENDS:${PN} += " \
 	python3-compression \
-- 
2.34.1


