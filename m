Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF4C9C0219B
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 21:58:26 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
 by mx.groups.io with SMTP id smtpd.web10.6249.1738274294486710465
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jan 2025 13:58:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.169, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3cfc8772469so4732135ab.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 13:58:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738274293; x=1738879093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t5vFNuqu6fMh8BMieo5tO67MO/76nY7pPOAUdHhMvp4=;
        b=JX5bjFWGe2EDvkBq1aPOh6JwrNaGm0XQHC5e3Q2vhbcNCzaepAuFO/fY3aOtUrykPn
         8UGGGVesk+UfkWCRS1ZPISCxcAYmBfMoijXAJuuftWpC4VixqTxnEwHD+gHFOMSuHzZb
         00MsD98W58YfRKNt79NFEzlXUH8JEtMyQgTK7tnA0xqoqZo+dbeHcjW4QgToFZHOnKwD
         aHcCCmgt1TB/d2XeSy0KEhfmk9QSu5ee7b2dAjb/mcWAzrYz0T6nZWS84vqA6ujyZ2tG
         v879qNVTYNiqYWYIsDiXF6mUX1EBwbQRzUA8J4X4cIeSHsooj5OygTlhaHaLEO9geRFW
         eipA==
X-Gm-Message-State: AOJu0Yw2xHwuZ8TNFKYbJpXE2OKLN7VWutuVQGYrAEDYgenkUpugtHRF
	LFGxflWFKYdG539ZWEgrpPb13agSNhIgQbXtIUVYvKcl+7/OWCbEPncQla1tY7o=
X-Gm-Gg: ASbGnctD2EdcosHU85vKoBxS9c2xq4H8ZfZdKs3LTCEMu+9DhSgMGO+ESVGNWrtEw4R
	a7tfWSFQ/2pTEjf3iFdrn2+6rN0UGw7yfTNaMMGvrpB7YJGz4ksuSqCk3vEsDlEdVLKUxFa9ejs
	GS+jiWJRT/2mnzb2/xl3yNtzy9EKp9BaJ3uvrMzXafWJP7kXh67UGSgkDgre/haHcZFCZZvQ5c6
	XQXXz+dH1e+Uheu1YvoK+QMBt7HLEYVOz50typ13yL8TKZsYzoAThaRKC509rhKyF/X/XgW2O0D
	yRc3trQtI6z85xnw5Z74wc19mPsa4lL2iTUR5xMXv+hlwFPFs0Gxw+Pvcicc
X-Google-Smtp-Source: AGHT+IE5pox+ME0njIA+8YSwLBqTNGAFvkxxvprqLJOQ8+NkZkIXsG6ZlCBcXjTkPNG501cwz4hPKA==
X-Received: by 2002:a05:6e02:160d:b0:3ce:5af3:783e with SMTP id e9e14a558f8ab-3cffe39bfa4mr65573365ab.7.1738274292886;
        Thu, 30 Jan 2025 13:58:12 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec746e3e63sm519071173.144.2025.01.30.13.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 13:58:12 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 08/23] python3-lz4: update recipe to use the ptest-python-pytest class
Date: Thu, 30 Jan 2025 21:57:23 +0000
Message-Id: <20250130215738.3280576-8-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130215738.3280576-1-derek@asterius.io>
References: <20250130215738.3280576-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 21:58:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115162

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python3-lz4/run-ptest        | 3 ---
 meta-python/recipes-devtools/python/python3-lz4_4.3.3.bb | 9 ++-------
 2 files changed, 2 insertions(+), 10 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-lz4/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-lz4/run-ptest b/meta-python/recipes-devtools/python/python3-lz4/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta-python/recipes-devtools/python/python3-lz4/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-lz4_4.3.3.bb b/meta-python/recipes-devtools/python/python3-lz4_4.3.3.bb
index 746926da4e..7bbe59e8b7 100644
--- a/meta-python/recipes-devtools/python/python3-lz4_4.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-lz4_4.3.3.bb
@@ -9,24 +9,19 @@ DEPENDS += " \
     python3-pkgconfig-native \
 "
 
-SRC_URI += "file://run-ptest"
-
 SRC_URI[sha256sum] = "01fe674ef2889dbb9899d8a67361e0c4a2c833af5aeb37dd505727cf5d2a131e"
 
-inherit pkgconfig pypi python_setuptools_build_meta ptest
+inherit pkgconfig pypi python_setuptools_build_meta ptest-python-pytest
 
 RDEPENDS:${PN}-ptest += "\
     python3-coverage \
-    python3-pytest \
     python3-pytest-cov \
     python3-pytest-runner \
     python3-multiprocessing \
     python3-psutil \
-    python3-unittest-automake-output \
 "
 
-do_install_ptest() {
-    cp -rf ${S}/tests/ ${D}${PTEST_PATH}/
+do_install_ptest:append () {
     # The stream API is experimental and not enabled yet, so don't ship the test suite
     rm -rf ${D}${PTEST_PATH}/tests/stream
 }
-- 
2.34.1


