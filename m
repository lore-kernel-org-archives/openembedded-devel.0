Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C44A1E7719C
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 20:09:01 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web11.682.1736539740614464000
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 12:09:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-844e9b83aaaso178496439f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 12:09:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736539739; x=1737144539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i52f+x+KtHC9bo0i76ZWvENUqetTXIixMVz4namopeA=;
        b=AReo8XpNLUKVDtldbUWn5nqzVPkNv1maaqCRCvZ5dGdIqTQhQJ4YXARMCkcrSGUMpd
         WIfWSIJXrcxav5NiaHOjgHAVoH9SnDwkDmRFWZHm+pqLcxFqzXrC5HAVDz7sCI1EZZRU
         BpNPTWgNJj5Ohx1GczT68hfLKCXepdsrhxPTVtHxVhUsfhOG3FzNB18c0XnjuJFkwI3s
         CMy91tOwvvfEy18C6/Q78dbPAQXnL8lAj2mcR4N/z3Zi6umy5oM258/Kh8hOIW3EmvHq
         Y3g7dX3419CLUUxhnVIoLaNwyvKDH+jmqfZPshHK4PDxAEZ83ImfEFdVMF9z7RwqXiO1
         UvjA==
X-Gm-Message-State: AOJu0YwA0jDLzdjmwVRsoqGcnjOpAi//3bfH+KFMpxWmkHUJHNMRxQIz
	JdRsp3l/uIzWfc8VA4uwyu9Of3ihSbZ5yq55Bl14oKfW0Qw8SXAHZNpSig==
X-Gm-Gg: ASbGncvq8Zgyw7naK6d0PcBMOOP/+AmvNpOLAgAcxrEVeujCiy5wmqREJ7PQNXLHCc6
	VfO0sSxq/A8pzHYVghFwlGM460e0WbLjKr9n45O32VQp01G7Jyja60hwjvval1XMeSU8Q0xWOFX
	oQwhLHMKwTRpVTYWeSQy/V095DlOYVp792z4PdMPTwAOaubu5LWhLU5NujgKD49bv6KwRHRbjwK
	jjryewx/DIUjMqgBBLjYszhLqPYZetlil1oTnZ4xrMjdmWMxNM8Z2BM3HIDavfuqerUBhZiBDJV
	5c/Lw1dCeQpNOx9rQlIT0ypskQ==
X-Google-Smtp-Source: AGHT+IFwQ1DtX2b0iZ4Q0R4IFikuhIIJPJsWgonSXtjJI3/v9S2rqNHRkQy61lFrlB+CDJCfHubvog==
X-Received: by 2002:a05:6602:399a:b0:84a:810c:cf43 with SMTP id ca18e2360f4ac-84ce00ed9d1mr1061601739f.9.1736539738948;
        Fri, 10 Jan 2025 12:08:58 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-84d61fc84dasm104467139f.46.2025.01.10.12.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 12:08:58 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 02/13] python3-yappi: update recipe to use the ptest-python-pytest class
Date: Fri, 10 Jan 2025 20:08:11 +0000
Message-Id: <20250110200822.3958062-2-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110200822.3958062-1-derek@asterius.io>
References: <20250110200822.3958062-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 20:09:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114792

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python3-yappi/run-ptest       | 3 ---
 .../recipes-devtools/python/python3-yappi_1.6.10.bb       | 8 +++-----
 2 files changed, 3 insertions(+), 8 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-yappi/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-yappi/run-ptest b/meta-python/recipes-devtools/python/python3-yappi/run-ptest
deleted file mode 100644
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-yappi/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-yappi_1.6.10.bb b/meta-python/recipes-devtools/python/python3-yappi_1.6.10.bb
index c87d5aca6..bced340b9 100644
--- a/meta-python/recipes-devtools/python/python3-yappi_1.6.10.bb
+++ b/meta-python/recipes-devtools/python/python3-yappi_1.6.10.bb
@@ -6,12 +6,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=71c208c9a4fd864385eb69ad4caa3bee"
 
 SRC_URI[sha256sum] = "463b822727658937bd95a7d80ca9758605b8cd0014e004e9e520ec9cb4db0c92"
 
-SRC_URI += "file://run-ptest \
+SRC_URI += " \
            file://0001-test_functionality-convert-line-endings-to-Unix.patch \
            file://0002-Fix-import-of-tests.utils-to-enable-pytest.patch \
            "
 
-inherit pypi python_setuptools_build_meta ptest
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 RDEPENDS:${PN} += "\
     python3-datetime \
@@ -28,9 +28,7 @@ RDEPENDS:${PN}-ptest += " \
     python3-zopeinterface \
 "
 
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
-    cp -rf ${S}/tests ${D}${PTEST_PATH}
+do_install_ptest:append() {
     cp -f ${S}/run_tests.py ${D}${PTEST_PATH}
 }
 
-- 
2.34.1


