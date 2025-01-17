Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB2EC02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 22:59:19 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web11.746.1737154758199774274
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jan 2025 14:59:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-844e161a8b4so87690639f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 14:59:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737154756; x=1737759556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=axnDlEOcehMVA97rkOoXarvneO5SzdD1Bjohr4Tcw6o=;
        b=nsqX2RvZWiQSnDtt6p5AXuqBSDhoA25RzCeHK9bmrsYH84RGc6558WwgEqU8HD1cUw
         9K8aPBsZteHT+HSIVzfrzXm/TL3nEKIw2C2OIWdFSZlDTcyvkX8ntu7W9EzBmujpFDxo
         LecHyssRol9e4RVBGnEUAR4sYCF82Hs3LoP6QtjREIH/I4vqnRqlmSwsiNAWhVWADu2N
         /kz/+T4YdMpb1anju7scWGAN1nBRurQdzkx796bIbhzwW1IumNw2DzuzScbEWCLb2i/e
         rmRs2e3Qf2eT5aPr4p2YGZtJoaqFk/gCyyP+KkwHuTSHsj5FSfylqauTYemedhnTq9Bl
         Q4tw==
X-Gm-Message-State: AOJu0YwsKD9l7i0xsTSpOaxaJy7tpp2wjM3lvIzFumARSkqoKwSyS79p
	NtPz4QZEjBxYJVTbzU8bB81q1gG0HIaGBYtqimn04J3fzmde14RdNBxxCA==
X-Gm-Gg: ASbGnct50Pl0AkgpPVXXZSz86/IjdkqNkS8kpP+PXH96KmvV1saLBlX2CJzB2ZFDyy4
	wN4fbVMZqQ1ShH8omA0OkqAf1oBih0906APfr9VDBJPCBT6UL5VpEgcpAe32i+/IAWFEx6hrG0j
	YrwzPkH7NjLrqUK3fb5BI9wqruHW2hinrtL7RuJe1Y7/n6aa4nSLjTEzX0uYHc7+MOCV9xBSlaJ
	Upc9cpJi8lrwvHBqrRfsa7biqRexilzAd26SMLc/h+oOGa+A3OXullroEmyuSB+5igh5aDWXQ7A
	iq6V9FSqMWrifMb9Kh1zij0Vxw==
X-Google-Smtp-Source: AGHT+IEcHusgFSHTlZDxmNDWsNlFUbg141ZZCBMvT/F/Sj6RGMMlGCOAthv1yNpuDf91t6lIwcScGw==
X-Received: by 2002:a05:6e02:260d:b0:3ce:8693:72a0 with SMTP id e9e14a558f8ab-3cf743ab5fdmr42127115ab.3.1737154756501;
        Fri, 17 Jan 2025 14:59:16 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea7564943asm865259173.95.2025.01.17.14.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 14:59:15 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 1/4] python3-polyline: update recipe to use the ptest-python-pytest class
Date: Fri, 17 Jan 2025 22:58:59 +0000
Message-Id: <20250117225902.4103075-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 22:59:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114944

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-polyline/run-ptest             |  3 ---
 .../python/python3-polyline_2.0.2.bb              | 15 +--------------
 2 files changed, 1 insertion(+), 17 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-polyline/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-polyline/run-ptest b/meta-python/recipes-devtools/python/python3-polyline/run-ptest
deleted file mode 100644
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-polyline/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-polyline_2.0.2.bb b/meta-python/recipes-devtools/python/python3-polyline_2.0.2.bb
index 00cb51be4..a91ceb76e 100644
--- a/meta-python/recipes-devtools/python/python3-polyline_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-polyline_2.0.2.bb
@@ -5,22 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1fb8d1dc685695195bb3c1e48adfef48"
 
 SRC_URI[sha256sum] = "10541e759c5fd51f746ee304e9af94744089a4055b6257b293b3afd1df64e369"
 
-inherit pypi python_setuptools_build_meta ptest
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 RDEPENDS:${PN} += "python3-six"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI += " \
-	file://run-ptest \
-"
-
-RDEPENDS:${PN}-ptest += " \
-    python3-pytest \
-    python3-unittest-automake-output \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/test
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/test/
-}
-- 
2.34.1


