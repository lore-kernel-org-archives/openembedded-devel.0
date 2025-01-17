Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF2E2C0218A
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 20:30:52 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web10.4857.1737145849350264807
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jan 2025 12:30:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3ce915a8a25so8824175ab.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 12:30:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737145848; x=1737750648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8m88Ac1P859FHkbQOuUz5YKS0mXBKfkv/BRodhAl1tA=;
        b=Kbk695UGR29eE4Dj8eQTuwcBpNO9EehSz3eiSARbpxzF4pWtSlbh7z8h4EUHHYQ/l2
         7ib/A0VWN0eoVqOGcxeLYuHI8iIe6z1DSuK+P7lgIYgNIpbTVEUJC0HbrOeC5LB6Gy4s
         FSyQPIPMLvj0eq27lPfmiYrR2hhbhOKEf/ziFhIseg/LipWxGq2XRxDcUvCIZ2rr1cZo
         VzLJkGE8D7lkldXQPiNndDvb1t61fyzLlvZCkv8xsK61ixB0mpG0rpFzQND0py+cqVqV
         +VkWYNKlwl9E/61APULtPKlHLsls2i4B/fsJ1byXqYRjUI1fkNbfqXOCnQInRsgZetaZ
         N+0w==
X-Gm-Message-State: AOJu0YwBhyiuO4Us+QavoWQIuF3BoH+xnfkVcoqtoBJ9h5F9JY58FAbT
	jOJYzcwkStqONxB0oIcSUI5ZdM0UJ7eQcuVSqt8bchdmgc6OldE7IDvZIg==
X-Gm-Gg: ASbGnct+aUijQCvwa2rUWsdhzb2RTU8u6MZF38mvH250tQtxahpdtbN/YzUIBXqOk9f
	SRD5UUrliRF2xgS3z1a185wHtyMveOk/FoC7ppd8tyMuWJC919jzs8zovmrIKO2wTBYrrZANKy8
	mdA3ve4tGjLMQOzClOF0+d5mcfbgZDy92zN+lUD+cgn+yw+aa6vtuzIx6gsw8DxIPCsBkV4g8Fs
	jn/0If9BAxaMBfSNRDxNsfd448aIMqbWw67EjmuqAZXSF5jm7g6CTbpX/K2b9Wz7z8iLDQTEJ2B
	LvQOC92bjynWxxFvoSlKCu0cIg==
X-Google-Smtp-Source: AGHT+IFCIPW6nY9EufLydJg6JWevcV+LFKb9hmLdWUhl40+pw9cinaqNDN8i1MUQwXeTV/KCcZq6lQ==
X-Received: by 2002:a05:6e02:16ce:b0:3ce:8d4e:9c79 with SMTP id e9e14a558f8ab-3cf743d2bcamr35256535ab.4.1737145847765;
        Fri, 17 Jan 2025 12:30:47 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea7566e687sm801814173.128.2025.01.17.12.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 12:30:47 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 06/10] python3-ptyprocess: update recipe to use the ptest-python-pytest class
Date: Fri, 17 Jan 2025 20:30:26 +0000
Message-Id: <20250117203030.3648575-6-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117203030.3648575-1-derek@asterius.io>
References: <20250117203030.3648575-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 20:30:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114939

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-ptyprocess/run-ptest            |  3 ---
 .../python/python3-ptyprocess_0.7.0.bb             | 14 +-------------
 2 files changed, 1 insertion(+), 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-ptyprocess/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-ptyprocess/run-ptest b/meta-python/recipes-devtools/python/python3-ptyprocess/run-ptest
deleted file mode 100644
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-ptyprocess/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb b/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb
index 12f10d824..e63c2c50b 100644
--- a/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb
@@ -9,7 +9,7 @@ SRCNAME = "ptyprocess"
 SRC_URI += "file://a44312974bd9084aa568d2e18ce5b2a7e0e45983.patch"
 SRC_URI[sha256sum] = "5c5d0a3b48ceee0b48485e0c26037c0acd7d29765ca3fbb5cb3831d347423220"
 
-inherit pypi python_flit_core
+inherit pypi python_flit_core ptest-python-pytest
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
@@ -22,22 +22,10 @@ RDEPENDS:${PN} = "\
 
 BBCLASSEXTEND = "native nativesdk"
 
-inherit ptest
-
-SRC_URI += " \
-	file://run-ptest \
-"
-
 RDEPENDS:${PN}-ptest += " \
     bash \
     python3-fcntl \
-    python3-pytest \
     python3-resource \
     python3-terminal \
-    python3-unittest-automake-output \
 "
 
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-- 
2.34.1


