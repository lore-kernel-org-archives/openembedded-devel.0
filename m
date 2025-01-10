Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE683E77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 20:09:31 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web10.687.1736539761862949058
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 12:09:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-844e161a8b4so78836939f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 12:09:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736539761; x=1737144561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jXMTHp2ohwbQxm5IxWcRrK2DLTv6JON/0XtPTR2WiOQ=;
        b=J+3VAiPaeSNpRKNqaxO3cIpF695TQgH+RG9TOoJD4xPwEqWqi5kBrbPD6M29oKFY7g
         PXW8vnP16Qeh4X/SDki+/RWlCnpb/TN6BFQ2QZKoWz0Diry9DJYxw7uqIBVmBR9Q6QQ5
         qO8dAOtGEKZIJkvrOnUcf6xcf3t1qYz5fv9CvQaup5lTdGpvktHEbSj4TVX2khJnuTKZ
         PLkd+4+w0zoOLJiA+mGh/QhJLn4y8Y+RD4duo3zenxs03I8WCXSo6cyiQJ0i46GBF8IB
         Sh6XX4t6GBV/l2G0XeNK4mt4bNg8ymPpHZ3ZM2ngydYT6gmzvSl7EVvEsWHFWI9zgz7H
         L3dw==
X-Gm-Message-State: AOJu0YydlsjREHSMAk+L93cXMIGzJrbM2mP2+jQzMidOaRuT787lykC8
	bI4U3NXjp24HmLdk61BT2/pK8Bh50vND0g+4BfBvEX7OW8HQa/yjpo36mg==
X-Gm-Gg: ASbGncvS6brarsbU45gOGGVYhV2DaLcyh/WdqR6BYfk0DYOrywVDABDo4Za7ksPIAI7
	KB7VbBKa3DMuSpfHyyRloq7LSqpkvo5eLTSfuBFKKtvsKJMah3SKx0Y8jZFteUc3GkAEcAzyzK+
	ZnULPJndElPEdXwY55/QGyLGZSNzi8SkoP2AeriQEkLK/pfK0nYm0QUptvtGb58zIHUQCFSv/zJ
	nYdYVHjSE2UmbtWHMBYK7fJGUgCwh8J2CGEsjoH9iKBgcUHHNegZOB/R7NboeF4Y6k/hcCHAzZF
	dCUgwibisXkcy8O09vPCvKHAPA==
X-Google-Smtp-Source: AGHT+IFwCSOfxTzRuyHVJpqqReBnabkC5uTGVT5j0GdExPI1lrw9NiN1s4SpL3QmRBRPGwr6fKJtcg==
X-Received: by 2002:a05:6602:358c:b0:849:c82e:c082 with SMTP id ca18e2360f4ac-84ce008198cmr1228824239f.6.1736539760664;
        Fri, 10 Jan 2025 12:09:20 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-84d61fc84dasm104467139f.46.2025.01.10.12.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 12:09:19 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 11/13] python3-tzdata: update recipe to use the ptest-python-pytest class
Date: Fri, 10 Jan 2025 20:08:20 +0000
Message-Id: <20250110200822.3958062-11-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110200822.3958062-1-derek@asterius.io>
References: <20250110200822.3958062-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 20:09:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114801

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python3-tzdata/run-ptest  |  3 ---
 .../recipes-devtools/python/python3-tzdata_2024.2.bb  | 11 ++---------
 2 files changed, 2 insertions(+), 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-tzdata/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-tzdata/run-ptest b/meta-python/recipes-devtools/python/python3-tzdata/run-ptest
deleted file mode 100644
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-tzdata/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-tzdata_2024.2.bb b/meta-python/recipes-devtools/python/python3-tzdata_2024.2.bb
index 614d813e8..20e9715dd 100644
--- a/meta-python/recipes-devtools/python/python3-tzdata_2024.2.bb
+++ b/meta-python/recipes-devtools/python/python3-tzdata_2024.2.bb
@@ -6,20 +6,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fca9fd5c15a28eb874ba38577a585d48 \
 
 SRC_URI[sha256sum] = "7d85cc416e9382e69095b7bdf4afd9e3880418a2413feec7069d533d6b4e31cc"
 
-inherit pypi python_setuptools_build_meta
-
-inherit ptest
-
-SRC_URI += "file://run-ptest"
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 RDEPENDS:${PN}-ptest += "\
     python3-attrs \
-    python3-pytest \
     python3-pytest-subtests \
-    python3-unittest-automake-output \
 "
 
-do_install_ptest() {
-    cp -rf ${S}/tests/ ${D}${PTEST_PATH}/
+do_install_ptest:append() {
 	install ${S}/VERSION ${D}${PTEST_PATH}/
 }
-- 
2.34.1


