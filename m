Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB6F3E7719C
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 20:09:21 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web10.682.1736539754820580922
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 12:09:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-844d5444b3dso80875239f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 12:09:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736539753; x=1737144553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Utw3jgWdF/VRR7omeE/IEYK2/jpM29juwY8/IY3d7Y=;
        b=jSO+LOPNhTdisaZowZE95aAHbCuWAp0EOCM4dvoQsvxqKn60uArrlFpqdkDFmI3AkD
         lnu/Ypsc64aJZNNTqvQQGlXE+k4yws4Sp4lJ09+VuLwIJOLJRjBC7nxBREjg+C+OGD5t
         uXz/MIvr6uSre7/Q6yN0d7y0wndI4Wcgw7ztBrrBs1noR2DkTAqog7wBlm+/x2njM4gQ
         /r0SfxhlJhrOG4vTctWbWCU58GamFY+0+u1y9M9BUBH97ohMCy2ClvcCGzZpqHVwcCYa
         rEdFJPnytLG+KwiACAJ53wCx9fGw92gHZLzYG/rymaefWJmTKnJUWfFU+WnUYZS1Xmut
         76+g==
X-Gm-Message-State: AOJu0YyIg8WUqCsE0o3JJnsLCHpaJkLwWQrJv1htVlARX2V47EGKHmzx
	fzRdKmCMt3lOpgnyT5Xf2gQ/o+LZbZMxQ4aTvAT6eG1G7saKKAgDCn1F3A==
X-Gm-Gg: ASbGncsJnsJUAd+swAE8fPHXHW6y1FrCKD+Rmp0bALFrAuhEMlAgwhrKFKsNGNz36Rp
	yt/o3/EjXUuO0xxjnRHMWkirkH1jB26SSo/DyIVrvWiX4qD7Qnpt7FVEyZ8n52xYyC0m9FCBJ8D
	NkKw52E9fE77julVa/oUpQQiWsIAqS9qeI241if8y2vzVgFya8A342CKqdB05I5Jgc6ddaCk7HD
	dj/Cqbn9S1s2NkcsApPxhnXJeZBe9jlZ+gan3jdriYuFJlifrh1S9vN0vdrohQPsxwzb1voCRGy
	nqqyk+HdpEUcwrX8p/HZvlFVNw==
X-Google-Smtp-Source: AGHT+IGczVEfJdsQbRdAEVsnK0nmIdgM2IPhp2N49+Y6ivq2GVcx0ws8V1R4EbLS02NeDcCmUBBUMA==
X-Received: by 2002:a05:6602:4015:b0:841:8345:5eed with SMTP id ca18e2360f4ac-84cebdb57b1mr549358439f.0.1736539753203;
        Fri, 10 Jan 2025 12:09:13 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-84d61fc84dasm104467139f.46.2025.01.10.12.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 12:09:11 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 08/13] python3-unidiff: update recipe to use the ptest-python-pytest class
Date: Fri, 10 Jan 2025 20:08:17 +0000
Message-Id: <20250110200822.3958062-8-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110200822.3958062-1-derek@asterius.io>
References: <20250110200822.3958062-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 20:09:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114798

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-unidiff/run-ptest             |  3 ---
 .../python/python3-unidiff_0.7.5.bb              | 16 +---------------
 2 files changed, 1 insertion(+), 18 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-unidiff/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-unidiff/run-ptest b/meta-python/recipes-devtools/python/python3-unidiff/run-ptest
deleted file mode 100644
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-unidiff/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-unidiff_0.7.5.bb b/meta-python/recipes-devtools/python/python3-unidiff_0.7.5.bb
index d77252bea..c1e931e07 100644
--- a/meta-python/recipes-devtools/python/python3-unidiff_0.7.5.bb
+++ b/meta-python/recipes-devtools/python/python3-unidiff_0.7.5.bb
@@ -5,21 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4c434b08ef42fea235bb019b5e5a97b3"
 
 SRC_URI[sha256sum] = "2e5f0162052248946b9f0970a40e9e124236bf86c82b70821143a6fc1dea2574"
 
-inherit pypi setuptools3 ptest
-
-SRC_URI += " \
-        file://run-ptest \
-"
-
-RDEPENDS:${PN}-ptest += " \
-       python3-pytest \
-       python3-unittest-automake-output \
-"
-
-do_install_ptest() {
-      install -d ${D}${PTEST_PATH}/tests
-        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
+inherit pypi setuptools3 ptest-python-pytest
 
 RDEPENDS:${PN} += " \
     python3-codecs \
-- 
2.34.1


