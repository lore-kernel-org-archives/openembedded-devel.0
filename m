Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF76C3DA7F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 11:52:29 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.31616.1723031545600079828
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Aug 2024 04:52:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J/iMy0zI;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-368526b1333so492777f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 04:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723031544; x=1723636344; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lT1Y8fxjvF4ozgtcELlcnGhrPFZKyliO43XRKqskEwo=;
        b=J/iMy0zIK2b3XU1Y0uWmp3t9EJejMsNOh/LJUY4rc+O2XPnB/nlAlnFfZqEL4Q8/WC
         ocne0urBXzZHeW1u6vj18G1s3L1wmcy73wA5HqPreDA+1jPxNRIwq6Z2VvUVKDKjVAr2
         9a6jlZ0zRZqqv+x/ix0SgcBlIWvjLoH1/2c7CrqA1BA5dQdZbsn0oJfaN/0uPGY1RTdD
         cHgNVpshdVm22eXI3lQBG9TgnGNVH+OxzryShzhk8JJ9qY+A5bO1K/5wow7J9r2eqlr1
         u06q1etCwkLPoT3NXCq0thRkyg+qdgt5snTrl6gte9Vdes2B8Htg90ZDzOyYQGLSSLY+
         cyUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723031544; x=1723636344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lT1Y8fxjvF4ozgtcELlcnGhrPFZKyliO43XRKqskEwo=;
        b=ZUAEoOyKwRJelBeJdKxazZVyya8g1J4LFY31IbBzOFAovTQkZtaI3gZdmNzWeq7qBS
         S6PIPD8NUpBp5oNSvOYbV4hhaA3rtIXB52kbQ8WYS51Y+NWdzGK44qf40k8sRUZxCLWT
         rUrrDahr6qejO6t/dkPw9CibeFGUFJz9kUBEfeGVc3QeQJT99B0o3O3L0uPq7rbQek3A
         xp/wuVKxhDFYY3NOD3a9b25lu4OE/nKX+wIhE82D/0fmLaMvQlXeo53e6SrUYVnTeP1y
         hz7k7u1cHih6gnxssSpCw1FumrugKa/ukCYONVnRd/BC10ABEBnNi5FQzR1mLSqHe3Y5
         96BQ==
X-Gm-Message-State: AOJu0Yz//QcWf087eKAGsprS8WxRQ7DEseqCIGZWGoa89X2Y3+Fw/UK+
	fWvOvaPTpqKUJRqSX3PAP6wVRLwP2mSDxINWmRgU4hE0a+qvc10rox0WVt0n
X-Google-Smtp-Source: AGHT+IENw5YigxAka6X9WNahf5rgEPrfh0L1hrkNNDLjUooTTup1tXBdGpNOmqa8ptQddfw0sGnsjg==
X-Received: by 2002:a05:6000:41:b0:367:8f89:f7c9 with SMTP id ffacd0b85a97d-36bf0f25e32mr1489803f8f.33.1723031543266;
        Wed, 07 Aug 2024 04:52:23 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd0597f6sm15790190f8f.66.2024.08.07.04.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 04:52:22 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-qrcode:
Date: Wed,  7 Aug 2024 14:52:20 +0300
Message-Id: <20240807115220.95251-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 11:52:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111621

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-qrcode-7.4.2-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/recipes-devtools/python/python3-qrcode_7.4.2.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-qrcode_7.4.2.bb b/meta-python/recipes-devtools/python/python3-qrcode_7.4.2.bb
index 204f4ecee..49cf62860 100644
--- a/meta-python/recipes-devtools/python/python3-qrcode_7.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-qrcode_7.4.2.bb
@@ -3,10 +3,9 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4b802d2a65df4626623c79757f486af9"
 
-PYPI_PACKAGE = "qrcode"
 SRC_URI[sha256sum] = "9dd969454827e127dbd93696b20747239e6d540e082937c90f14ac95b30f5845"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} = " \
     python3-six \
-- 
2.25.1


