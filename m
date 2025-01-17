Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7B05C0218D
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 20:30:52 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web11.4848.1737145846987171433
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jan 2025 12:30:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3ce915a8a25so8824055ab.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 12:30:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737145845; x=1737750645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4h57sUDa1UXYEKogdb2/9dWJQoa7iybW3Ly7a4rdvcA=;
        b=cya9exBxsqf2AQts3ryomcsUXLZ4gEmrYh9JFey8kiKzxGCsrwGWynVWMwOCF8zuV7
         f2WuChIDEfwLp4iAcfJqwrZr68PxgSkzG4Qc+XXUerMD0uHoXlky3bfLm23cAmVjXwUu
         guJazErHThm+99XMvgOp3F18hDq9KeXM7zMEl4er5VdiywLVh5g4oktJ6MwIEXfLTk/v
         9N/vwfV0/EOxbYDdI+9N8yhVANOwKyUIGJq4/qDgtuY2lscONyhd5gxzNEFYeRfwNioO
         90R/vSlT/SbqCkGcfsM2OoDct7HwtOsw5opOQfrsRNrV4cDBJLxxFqPeCMPqIEBswl51
         z5kg==
X-Gm-Message-State: AOJu0YxzKJkZRALH/R4lEtnKC1bYWQpbUdem+ZpUW1KjgVXIm47fKtet
	i7PQpE2lz3RdnP5sSTck3N2/W4IR0k87lhDA40wz9A0oIghMUHar2uLUZQ==
X-Gm-Gg: ASbGnct4wWrXvB8wSyOAENSHJiHOrR3Udq79VK4VpgjLkSG/S1GxrujlWTrvzXu40Zp
	YHCX+n1U18ZEVM9Ibd2BT2c4/NwrzqhxG10we0naMMvYTwPV0TOwd9GtL2PHqPoLYAmNfjYUHy0
	dKfs8qJsfyfAd28cbYxKhPxlFkx7R9lYh87YbEiYLBR5qEqTfmnY28YQytFdQ0uAOomDk2puhXL
	YEJe38yJXZhCGzeWfeLPvw+GzlIL9i0V5I1WjzT03pFK0HrGSWYe/i1G1GnUcDuoY2EL/IbmaFO
	qm3+MXizseKDXgeDxZ/QMaIBaA==
X-Google-Smtp-Source: AGHT+IG3+oblXu/+0sBeptKLRKyTsQAhqfyYA/bSWEHK3HY9rUuGPvWFydHYN2htIw9e3YrI7CPGiQ==
X-Received: by 2002:a05:6e02:1d82:b0:3a7:fe47:6228 with SMTP id e9e14a558f8ab-3cf743fe62fmr29588985ab.6.1737145845305;
        Fri, 17 Jan 2025 12:30:45 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea7566e687sm801814173.128.2025.01.17.12.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 12:30:44 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 04/10] python3-pyasn1-modules: update recipe to use the ptest-python-pytest class
Date: Fri, 17 Jan 2025 20:30:24 +0000
Message-Id: <20250117203030.3648575-4-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117203030.3648575-1-derek@asterius.io>
References: <20250117203030.3648575-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 20:30:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114937

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-pyasn1-modules/run-ptest       |  3 ---
 .../python/python3-pyasn1-modules_0.4.1.bb        | 15 +--------------
 2 files changed, 1 insertion(+), 17 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyasn1-modules/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-pyasn1-modules/run-ptest b/meta-python/recipes-devtools/python/python3-pyasn1-modules/run-ptest
deleted file mode 100644
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-pyasn1-modules/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.1.bb b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.1.bb
index 225da562c..0ef2eaa1d 100644
--- a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.1.bb
@@ -12,22 +12,9 @@ SRC_URI[sha256sum] = "c28e2dbf9c06ad61c71a075c7e0f9fd0f1b0bb2d2ad4377f240d33ac2a
 PYPI_PACKAGE = "pyasn1_modules"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-inherit pypi ptest python_setuptools_build_meta
+inherit pypi ptest-python-pytest python_setuptools_build_meta
 
 RDEPENDS:${PN} = "python3-pyasn1"
 
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
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-- 
2.34.1


