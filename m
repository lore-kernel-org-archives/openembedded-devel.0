Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63CEBC0218D
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 19:00:22 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web11.2827.1737140415292585780
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jan 2025 11:00:15 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-844e1eb50e2so74117239f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 11:00:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737140414; x=1737745214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h0FFiyiE0KPHDpCNDRENDLAl8sRdJrHY3pj+7NmjKRU=;
        b=IId+lBCZ4eLjLKKNmTSXWuviyhKSGRo8Ijcm6X/GFmCc3ElVdNTp5FXL7eADgdvlB+
         AXzdfKvcvAgtuu/T/7KPdfoD5AVNSFwHxZ2e67FTlTxMSvrAaXpAH2ayd79s0F1f17Wd
         vwZ7m+Pg2PpDpo1+iwQxvyLoGR5HuyZR/5AyjASPVORkSjicUtibHCx0cAJnMq7bznMY
         xhhadNz3UOL+qSYH1SB6GHxzF0XOPvcaSZ9Wex+gnPCxqa4NEW/WBku5Zp8MQGOaw666
         p0tLBbtMEfw42qY3jgD/+mgDBId3S61xwEuz/Uj+OgvjAJQk8Ro3CFHkJwvBERr0/q36
         DrCQ==
X-Gm-Message-State: AOJu0YzA79gUN52Ajxpmm1uateBlUz5NnlmsrsZz53NJga1ccnOwRlCg
	QHvTkB4b6McNp7x4HLq8sFqcJeHe4B8ndMT7ZbcBV17q66CB9uCz9bxdNQ==
X-Gm-Gg: ASbGncuMFQRhIIEiC3sq13oVyE0+yZAkQqZLcNa4lBe2WGqr7kH5AifxFhoiE+o0SPx
	mLuQJfVC2biWmEmPc/1VI47/TnF23+xeSolilz6NA+WA8AIFaid0+/KXpKb7PAL6EBBmQ32V9qh
	hpFFBtS/oJIjQEeNz6LN5tB4BAg0T12KXh5qvZjP3Rzt0qSrWpEfLA8sUqybHpiFlBpB2Vf1htQ
	XBGwgMO9Wi73EkZaBPziU7+UkuMsRlGk9psOsD7wuN8jwdoY+1zXMz05GJqBxvgwdYBuqtTa/Rk
	gfufJWOrOmRSZmC+GIxEcEuI3g==
X-Google-Smtp-Source: AGHT+IHnGbgZbmMmpmcCd90gvmTr6+7qbsHyEJJqusgM8wW0l3ktXW6jM+TiCTwpejFh99LTKIHuiw==
X-Received: by 2002:a05:6e02:1d8b:b0:3a7:820c:180a with SMTP id e9e14a558f8ab-3cf74493955mr28289675ab.19.1737140413680;
        Fri, 17 Jan 2025 11:00:13 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea75495f5dsm761396173.60.2025.01.17.11.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 11:00:12 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 07/10] python3-pytoml: update recipe to use the ptest-python-pytest class
Date: Fri, 17 Jan 2025 18:59:41 +0000
Message-Id: <20250117185944.3434424-7-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117185944.3434424-1-derek@asterius.io>
References: <20250117185944.3434424-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 19:00:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114928

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-pytoml/run-ptest             |  3 ---
 .../python/python3-pytoml_0.1.21.bb             | 17 +++--------------
 2 files changed, 3 insertions(+), 17 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pytoml/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-pytoml/run-ptest b/meta-python/recipes-devtools/python/python3-pytoml/run-ptest
deleted file mode 100644
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-pytoml/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-pytoml_0.1.21.bb b/meta-python/recipes-devtools/python/python3-pytoml_0.1.21.bb
index 49390df83..15dc2f2c4 100644
--- a/meta-python/recipes-devtools/python/python3-pytoml_0.1.21.bb
+++ b/meta-python/recipes-devtools/python/python3-pytoml_0.1.21.bb
@@ -6,25 +6,14 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=cfff423699bdaef24331933ac4f56078"
 
 SRC_URI[sha256sum] = "8eecf7c8d0adcff3b375b09fe403407aa9b645c499e5ab8cac670ac4a35f61e7"
 
-inherit pypi setuptools3 ptest
+inherit pypi setuptools3 ptest-python-pytest
 
-BBCLASSEXTEND = "native nativesdk"
+PTEST_PYTEST_DIR = "test"
 
-SRC_URI += " \
-	file://run-ptest \
-"
+BBCLASSEXTEND = "native nativesdk"
 
 RDEPENDS:${PN} += " \
     python3-datetime \
     python3-stringold \
     "
 
-RDEPENDS:${PN}-ptest += " \
-    python3-pytest \
-    python3-unittest-automake-output \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/test
-	cp -rf ${S}/test/* ${D}${PTEST_PATH}/test/
-}
-- 
2.34.1


