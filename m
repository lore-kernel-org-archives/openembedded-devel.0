Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CC97C5DF6A
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:08:47 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28074.1786651726998844573
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:08:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jgc87wNi;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so189948a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651726; x=1787256526; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LPhP16TpsXj4LDFA7wA2W7X9mAC1P83zyceQQVHxCC0=;
        b=jgc87wNi5klOjNdGYvOQzslZttZZfWHlbK2E9svckoBBMa73ZSU5UDSTENRsxmKH2k
         a+z3dwp4uMVsVjP8/Nmcgir4Z0OgDmjk2jCFV5lWSDX+yo946eGpt8TBRd4sN8NZxIsS
         jLR9ZFNLx68xjHMl4UZ35AW1aNEC9Dn0RConAtFbXIeVQLftxgWSQekkx+3OVG3hIUVt
         dE04MwHqBjJxRBRXhqNO14vDrflHB19CpMJ887fPkvAfiWKFvuUZIO9lTKybSMBXCYxQ
         GVUz6UsSoqTWRYjsCQ6f3NnLo3wgOY56o8qiNuW60mMe+z8tL3BwGH9W3fcHzz7nPNlP
         rIqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651726; x=1787256526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LPhP16TpsXj4LDFA7wA2W7X9mAC1P83zyceQQVHxCC0=;
        b=eRUcLmm8L8jmJyoI99Td+8zyFRH3pIgHf4JLOYTuaf4gvP/NdL0aybHzfFUxSegnyR
         OrLr51RsMkuBZArWF4oBJcr6iMyHNJDn+GhOmnGrmvkWSWFNMzeobMxVVwumqe1YdrGi
         REvBFicDbkEVym4kGbbNxw/RnKjxYxoglIC2e2VNihcCukp8YXo8hxvumNCBkxep8P/t
         Ea+MOZUenR9n4VWFRE0LU3MKD4ynbXZSQVdsBb1tCC7DsxSU8KB6xP7IuD+Piu+dhxl7
         jb4t+HA0IXwbyDhQu9b7tfFDyz5KQPfp35KvsREVowEc2dGDyDL6urUUXDIz92XgyGr4
         Be1A==
X-Gm-Message-State: AOJu0YzQTp4cqK9ZEDojoLdK1APGAIf6rUHZRm+AXn2ckhGLHd9qWJCO
	Cnp2+Mv2Sv/5yBmsfFPk9rF+prNWysqcuOI7wqZ177jiOPV7Btn+hKpUEaxD8Q==
X-Gm-Gg: AR+sD12w+NfmrdC0GGUxDVC81hAFcy2ReWXqN+JITGv0zfBlQe4wUYV2vgPqwscB8Ec
	yTz8zRkKeD47WRpmnuYx64Uun+d8iVis9t7SjpW89t/hnHCFQRPuTxRegABo9IyZI9TgWDqnIcO
	S9zgV1zAYTrXfBJQ39gZXg2CZd9b+iiPHg44erkT2iWBcGij3a3W49qjg/uRzSGdtb6lzoQdcEI
	eIlPAWEBb+CnM51N8oPtPItfFOE4Vo0LWoc3B23hXoT8JWmo5ZDC5amKxN87dTerF6nkBtf7pTu
	MlF1TJ07DaeI+rCOVY53umT4rCR+v6KSHTZTaAQkxIGslEUfsvw6c0at0cFvXh8ASaAC7n4LAZu
	8bIAtyq/sSZVvKO6CEGswGgLLz+issYm4XlcDcBbuZouG1QFn8GgWzWpzDRYjd1MBHHAyTCacWv
	EonqmvtwVHdJPRq+Xyy+zb1eBj57LHcKK4nznssmNqS6JXhhdPoynBysWg6lsVYg8qWVKq7zpAV
	A4p53awlpTia8MCMtJuSRuFq4lSi4AkN8nFhEK1Sevy4vT1SimicI6GnZGaP4UAa4dI1+K4Zf6O
	SJY/FfDve2QPKZ8drbHTZBh4JDC0Y2VMnhdLxU4B1JblqtWB0oaQYj9T0gci632cM/7TL3kVex0
	1dMHgXs2/xxgtJwPCROw7FfIOEU6jcYm4s7lzpxwwWrNfXQ==
X-Received: by 2002:a17:90b:264c:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-3933b714f34mr600502a91.1.1786651726228;
        Thu, 13 Aug 2026 13:08:46 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:08:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 04/80] python3-h2: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:18 -0700
Message-ID: <20260813200834.1302829-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128948

setuptools3.bbclass and python_setuptools_build_meta.bbclass no longer
add python3-wheel-native to DEPENDS by default, following oe-core
commit e546c697b7 ("classes/setuptools3: remove wheel dependency"),
since setuptools >= 70.1.0 no longer needs the external wheel package
to build a wheel.

This recipe's pyproject.toml/setup.py still declares wheel as a build
requirement, so pyproject-build's --no-isolation dependency check now
fails:

  ERROR Unmet dependencies (checked against .../recipe-sysroot-native/usr/bin/nativepython3):
  	wheel
  		wanted: any
  		found: not installed

Add python3-wheel-native to DEPENDS directly to satisfy it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-connectivity/python-h2/python3-h2_4.4.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-connectivity/python-h2/python3-h2_4.4.1.bb b/meta-python/recipes-connectivity/python-h2/python3-h2_4.4.1.bb
index 0ae7e1a102..007f46d016 100644
--- a/meta-python/recipes-connectivity/python-h2/python3-h2_4.4.1.bb
+++ b/meta-python/recipes-connectivity/python-h2/python3-h2_4.4.1.bb
@@ -8,6 +8,8 @@ SRC_URI[sha256sum] = "4e866ffb1a869ae14dd9b5e6beb5c24a13da0495ad72b65925ded18252
 
 inherit ptest-python-pytest pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 RDEPENDS:${PN} += "python3-hpack python3-hyperframe"
 RDEPENDS:${PN}-ptest += "python3-hypothesis"
 

