Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC2DC02195
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 21:58:36 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web10.6262.1738274313123051787
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jan 2025 13:58:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-844eb33827eso36166939f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 13:58:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738274312; x=1738879112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SX/PxsVMgxfIVutXK4TOX9qRDtdYuC7zEkaxOQf9MtM=;
        b=Xx5aplf3TglYLCJn97zmHo2OiPfvm0WlaTqYqPjMABAFnaVQ3a36RYeC2PukGPHVs/
         pf+T+4qJ/3SlIxFnISKqKleWkU5ULsamZA9rTm+EaeAwvzHK6gU7tgpFjDaEuhZSWUHN
         WkbkpCwxN8XpAHcim8U712PIwzQcwDcgGjXtIzML47EQMBEiY3bA65BEYXSLbd2iiYhI
         kRuJzP3ilLZIzOlSmEAxknjBZUaD15z5p5idZa0QbnTn2r5V7+WSHG6N1Mi+Qk3O6CZU
         doQNgRZLueZHIneKvcMmAN8O3b/GNNFRyweTh5cMBEXoPThduVHe9lO2iSVlNDiGOIWi
         qHpA==
X-Gm-Message-State: AOJu0YwHKGpg0DGbGTEGsWcT8DwDXqGcarQMDw+OIN5DrMq905f4eb6t
	XWHACthIADZ4loRvVxmGqouXDpSIgLUZkOg8hUYZ017XFwjuqtw9fzEPXID3xwU=
X-Gm-Gg: ASbGncs1iKQHfNmlU+0CrGFNNfPqgBY76zS92tCjbHU44bBfcYMe8SV/QXCHGdEs3+t
	OX4QLJ8Cw+9uWfQPQiWWDF8VRte5s9Gua0b3r3mx4bBZKVs/oGn24Cg+4PLGWABu0Qfk0V1hDDP
	X8sk9Uc8SeMJOQpXKYTXaGoAkTgpqHwfDMnA1yqiX8y4wdFXJ0jovb6dph/P47H2m4awJPjwNGm
	usteGoPmfpqa+bf3ttjw8C/BmsfLX1aYqi8pDU7nVwDmxRQ/LDhqzxkGyQk0XhnfugP2fTRBXw/
	9srnkFXRm6aJs8zaU73acT1P0UYOLoA44r8VWj0hRj5NPCEV3MRNo5bSaQnq
X-Google-Smtp-Source: AGHT+IEvPN8icKIH7dXWYZ46m5RGnCcBL53M+qRhBBhxsKw7cubxX4le0fzf6KGm3DcwOGviGYxtSw==
X-Received: by 2002:a05:6602:2cc4:b0:84f:41e2:8087 with SMTP id ca18e2360f4ac-85427d78792mr942981839f.8.1738274311907;
        Thu, 30 Jan 2025 13:58:31 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec746e3e63sm519071173.144.2025.01.30.13.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 13:58:30 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 22/23] python3-ecdsa: update recipe to use the ptest-python-pytest class
Date: Thu, 30 Jan 2025 21:57:37 +0000
Message-Id: <20250130215738.3280576-22-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130215738.3280576-1-derek@asterius.io>
References: <20250130215738.3280576-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 21:58:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115176

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python3-ecdsa/run-ptest    |  3 ---
 .../recipes-devtools/python/python3-ecdsa_0.19.0.bb    | 10 ++--------
 2 files changed, 2 insertions(+), 11 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-ecdsa/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-ecdsa/run-ptest b/meta-python/recipes-devtools/python/python3-ecdsa/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta-python/recipes-devtools/python/python3-ecdsa/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-ecdsa_0.19.0.bb b/meta-python/recipes-devtools/python/python3-ecdsa_0.19.0.bb
index 8e967f9259..f26c90d83b 100644
--- a/meta-python/recipes-devtools/python/python3-ecdsa_0.19.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ecdsa_0.19.0.bb
@@ -6,19 +6,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=66ffc5e30f76cbb5358fe54b645e5a1d"
 PYPI_PACKAGE = "ecdsa"
 SRC_URI[sha256sum] = "60eaad1199659900dd0af521ed462b793bbdf867432b3948e87416ae4caf6bf8"
 
-inherit pypi setuptools3 python3native ptest
-
-SRC_URI += " \
-	file://run-ptest \
-"
+inherit pypi setuptools3 python3native ptest-python-pytest
 
 RDEPENDS:${PN}-ptest += " \
 	python3-hypothesis \
-	python3-pytest \
-	python3-unittest-automake-output \
 "
 
-do_install_ptest() {
+do_install_ptest:append () {
 	install -d ${D}${PTEST_PATH}/tests
 	cp -rf ${S}/src/ecdsa/* ${D}${PTEST_PATH}/tests/
 }
-- 
2.34.1


