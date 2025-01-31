Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 017E9C02194
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 01:40:18 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web10.10531.1738287613870607351
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jan 2025 17:40:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-71e3284f963so718161a34.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 17:40:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738287613; x=1738892413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/XINUck4mlQkTSYN9JppR+b2nYyRANfUkP+dCIaIm+E=;
        b=kxGhYKs51Dg1aIQLCu1SWb0PWNHRUh0mH/hNhBTBNE0Lg4sVnbQVmyIZQsDsSpt2b4
         SaQZwwsYjG7V16gbizs3Wi8mqqVYvz8qjeQ1sVbTDlt3DNMPFPajs+xN6Kt22tKDqYxb
         ZATb961a2ASQYy21G5lUgakKZrCexS0QK+RSRbL2LFNyEvQIszvAMtXrpBniN3dXEQum
         dT6XWgOtG4GbKyo+/Lzl8ilELl9hONmZCtK5KbXyZRaB1ZWYhOI7SY2lxYrSulGF/AGy
         p6YMmMLphVjDDEyzlX32BMbikVlaPS8jMgpOpeRy8VM8vRpBEGmGDjEpSXPVWjsLBodI
         Wriw==
X-Gm-Message-State: AOJu0Yx/LIRLYJ9QgV2PYtBqjA/rOa7ULt5YL6n40YvZyaj5KeSZuXx1
	XlktW8jC4L/zxWLJqc1iMEjkomk0skT/0/uw+y8oviNcEU2KCXa+RHIOqo2z
X-Gm-Gg: ASbGncuJUiIIY8/ugOexFzKSOqBuuBLOUYE3w5YGAfhJwEyvHVeUVwd455E27pBL0e2
	ApesdEQtIuPpHnWRR73u7Qhd7TDBPHprnMvwelsJEghl6DZcNukBn0Q9dTyWokIlaRaUcpHiEBF
	n3tIGNzT2cTdXwE0NWHJg9r+Gsbjd+M3mlpd0JbcU1xutJX24KiSi6P8ysYjoZG1Xe3vULhcEph
	J2rg+fMvrEVoCTMq6qRvQjuBmpg0aR/M3UXqHjQn4YqftQsagA7xkXHg1/YmPzi3zpD29a1W5/9
	CaNOaagZ1gOpUwEXNgTd+XBT2VSd7+2VJWYnLm3ISSo6kyv+73q8+IzWLG5C
X-Google-Smtp-Source: AGHT+IFfQnQzo66v7FY+bMw2+k2qCepnDXvLNPLWJP7NknWjhjeKRwaiMsn6VhzdRE2u+OTuixAShQ==
X-Received: by 2002:a05:6830:258a:b0:724:9f31:c1ac with SMTP id 46e09a7af769-72656777fe8mr5838721a34.14.1738287612763;
        Thu, 30 Jan 2025 17:40:12 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726618b9f49sm659875a34.54.2025.01.30.17.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 17:40:12 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 11/11] python3-asgiref: update recipe to use the ptest-python-pytest class
Date: Fri, 31 Jan 2025 01:39:35 +0000
Message-Id: <20250131013935.3714521-11-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131013935.3714521-1-derek@asterius.io>
References: <20250131013935.3714521-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 01:40:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115188

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-asgiref/run-ptest                 |  3 ---
 .../recipes-devtools/python/python3-asgiref_3.8.1.bb | 12 ++----------
 2 files changed, 2 insertions(+), 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-asgiref/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-asgiref/run-ptest b/meta-python/recipes-devtools/python/python3-asgiref/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta-python/recipes-devtools/python/python3-asgiref/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-asgiref_3.8.1.bb b/meta-python/recipes-devtools/python/python3-asgiref_3.8.1.bb
index 3b90eda5bb..5d68b3e3f9 100644
--- a/meta-python/recipes-devtools/python/python3-asgiref_3.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-asgiref_3.8.1.bb
@@ -4,27 +4,19 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
 
-SRC_URI += "file://run-ptest \
-	    "
 
 SRC_URI[sha256sum] = "c343bd80a0bec947a9860adb4c432ffa7db769836c64238fc34bdc3fec84d590"
 
 export BUILD_SYS
 export HOST_SYS
 
-inherit pypi ptest setuptools3
+inherit pypi ptest-python-pytest setuptools3
 
 RDEPENDS:${PN}-ptest += " \
     python3-asyncio \
     python3-io \
     python3-multiprocessing \
-    python3-pytest \
-    python3-unittest-automake-output \
+    python3-pytest-asyncio \
 "
 
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
-    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


