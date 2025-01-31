Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBFA9C02190
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 01:40:17 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web11.10332.1738287612558050767
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jan 2025 17:40:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-71e3eb8d224so467736a34.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 17:40:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738287611; x=1738892411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VNn93qE+BrlEZy3krURKg76rVhy+ziQ6BVNNlS8pXhA=;
        b=pxp38VxAtL0DEyNRvNevbNCIPQZVUaya0FslLq22gJQSZoCQozubcs4ppNK6aWVyQE
         /56C0UqMuL2eZRnrxULRGshQ7nnzhAgjwwulwyrdLvAR9QT839DtzvZdVopc+fKAvI7K
         szoAFljeiaZrWR+VJyQ0yqnQCUphcutq8ke4kaTDMZJ/0uCl7MA1b/yq1xoW6M3vBo54
         Evs57zoiZhFhmLewYgU0VQl1ZROgqC4y0brmvFuN6uaGUT7d3SRaFWHIiJ3F4PC5LW6s
         kfPQgoix+F/v8NzQo4IrxTK0PFfoGjwL7VwWKhVoZQkym4pGrS6ojmXEciAmsIdJJSEW
         HY8Q==
X-Gm-Message-State: AOJu0YxPNdxNLwuj6IJM9OS5OGb3iNKdoVd/ooEX5KGN2GymEtopQG+O
	gw0caci7KBPOFEfo1cfeHLLYVf3ekB8flvQc6Hh/FyY6AWePZOe8TLSIHyDF
X-Gm-Gg: ASbGncsO493cJBIVOsLYDRfS0xOW/FQfextcUpj2t+5ZoYx5D9OtZhSXohp9JV3U4h2
	i4iEox0RCTpC9Fs0hOWVJVLrOCRLcFgLX3NlQQZ7Dj2QMmRsYe9TPQ3l/vgbrasax70t8y56SvD
	GWXifSAudc21S10dUn2giZ01QyP6D2Gx/NX0/jVuCdpPc7RGYYwXv1ZlV2u2NgROYxtnH4FIUnX
	2FyE8qkVSc+3LY0a5rTubMKbbJE+MWpqU4aArEPfPwXnzONgqKTsf37O+9UD4oISqPKyDHMYzId
	B5YAByE3fEFPOou+J20BrkHXwST0r9G9ce8XTtDCrq8SwZrhuL79wmpqZaR2
X-Google-Smtp-Source: AGHT+IFWvvHyp6trt6e/lMtrJZzhx6M4qWjxmxhM9RYZ85YgzEanFZ9o7+cg4C/cZ/jqQ5xXUDegRw==
X-Received: by 2002:a05:6830:dca:b0:71e:1c5:4f77 with SMTP id 46e09a7af769-726568d9162mr7319894a34.20.1738287611040;
        Thu, 30 Jan 2025 17:40:11 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726618b9f49sm659875a34.54.2025.01.30.17.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 17:40:09 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 10/11] python3-appdirs: update recipe to use the ptest-python-pytest class
Date: Fri, 31 Jan 2025 01:39:34 +0000
Message-Id: <20250131013935.3714521-10-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131013935.3714521-1-derek@asterius.io>
References: <20250131013935.3714521-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 01:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115187

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-appdirs/run-ptest             |  3 ---
 .../python/python3-appdirs_1.4.4.bb              | 16 ++--------------
 2 files changed, 2 insertions(+), 17 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-appdirs/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-appdirs/run-ptest b/meta-python/recipes-devtools/python/python3-appdirs/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta-python/recipes-devtools/python/python3-appdirs/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb b/meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb
index eab39312ae..bee0b7d815 100644
--- a/meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb
@@ -2,22 +2,10 @@ SUMMARY = "A small Python module for determining appropriate + platform-specific
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=31625363c45eb0c67c630a2f73e438e4"
 
-SRC_URI += " \
-	file://run-ptest \
-"
-
 SRC_URI[sha256sum] = "7d5d0167b2b1ba821647616af46a749d1c653740dd0d2415100fe26e27afdf41"
 
-inherit pypi setuptools3 ptest
-
-RDEPENDS:${PN}-ptest += " \
-    python3-pytest \
-    python3-unittest-automake-output \
-"
+inherit pypi setuptools3 ptest-python-pytest
 
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/test
-	cp -rf ${S}/test/* ${D}${PTEST_PATH}/test/
-}
+PTEST_PYTEST_DIR = "test"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


