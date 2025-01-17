Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E315FC02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 20:30:42 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web11.4846.1737145842469919841
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jan 2025 12:30:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-84cdacbc373so83170439f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 12:30:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737145841; x=1737750641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8YIuxYbTabZuZdKS5Vev3rDoGVDMjDU7UnvUbCb/JU4=;
        b=ttAA077DYuCl5oVVU+Co5h5/3JOO/tPfoAqKe6d8Jxz02plF+Hwqd9XbpmmsNBPhhT
         6yOm39/nYferyaLyXpebD1GtrQlypARsroXWNLFI6pH9HD55YCO6vhXhhz3BlewS12kD
         c39jUWqX2LZ8X6gL1g7u7EZ0n+JEzNNLrpeYvbz509CqctryFIbbEseIkJMFE3cIeX3j
         T6cZvN4WzsXHqSV2oPA1CdEst8MlHfK9PeH3DYiZvQlKSfzxz+nPaLUC6N4/szNiUP1G
         etV0tSmCh5GYT3M0EgmVGTNdLAE7vn0rMNkdU6EKFaKnsHgexPqhIgXU+5ZPdzqHTig/
         6Cgg==
X-Gm-Message-State: AOJu0Yy3mqn00ziaHKxgDmD6vDANdE62AVdXCAagBZaddSQLYLDy+7Kw
	KTOMUUy+CWZ0BgNyf10yyO0D8Fwrgi8DJymvK4QbIezhHz/pxxfxHThT6g==
X-Gm-Gg: ASbGncsqmqULf9A3s49oQEPY2/wSIHM+/780vBIwtGvulHLLdBTlgc20ktZ3CPvWBAI
	uvjsRa1gOvDNaoN1KS5DO5pmLI5xSmQKpsLqZhPg/DJjfSA6afi1g9yWW8fWns7ZYIr89roSBQT
	0PAv/LqPESxOaCnxdIFL2SJD2QeB1fPNp1cRfZBKuR9x9rb8ogK5niW7iQmZmbNdTBgvne4gtPk
	W6NdI7I2hl9dcZq8BaBF5zCuJ/4EZrMpe866BVIJkbPDtQWiGcV+qEBs3quU3AUsDO08VTrGpxZ
	uAmSWQkGspPDgVWSgHK9uR1t6w==
X-Google-Smtp-Source: AGHT+IE/bZv+SFvSQn/Y/VreGMJjS0OAzwpLwjiaHZGPiNne3l9TpbG34G0RMS4ZSZ7hSp6JBJGSgw==
X-Received: by 2002:a05:6e02:2194:b0:3ce:5af3:79d5 with SMTP id e9e14a558f8ab-3cf743eb4aemr28521655ab.6.1737145840657;
        Fri, 17 Jan 2025 12:30:40 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea7566e687sm801814173.128.2025.01.17.12.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 12:30:40 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 01/10] python3-pyroute2: update recipe to use the ptest-python-pytest class
Date: Fri, 17 Jan 2025 20:30:21 +0000
Message-Id: <20250117203030.3648575-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 20:30:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114934

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python3-pyroute2/run-ptest |  4 ----
 .../recipes-devtools/python/python3-pyroute2_0.8.1.bb  | 10 ++--------
 2 files changed, 2 insertions(+), 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyroute2/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2/run-ptest b/meta-python/recipes-devtools/python/python3-pyroute2/run-ptest
deleted file mode 100644
index f1c8729f0..000000000
--- a/meta-python/recipes-devtools/python/python3-pyroute2/run-ptest
+++ /dev/null
@@ -1,4 +0,0 @@
-#!/bin/sh
-
-pytest --automake
-
diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.8.1.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.8.1.bb
index 048b0ca07..8f5ec7fcb 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.8.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=dccbff78d7d79ae7e53953d43445c6e6 \
 
 SRC_URI[sha256sum] = "b91f4a1f7abb9824637b1fe67e6e4a0a071d98d4a1a1b47ef792304ff3adad11"
 
-inherit python_setuptools_build_meta pypi ptest
+inherit python_setuptools_build_meta pypi ptest-python-pytest
 
 RDEPENDS:${PN} += " \
     python3-ctypes \
@@ -22,20 +22,14 @@ RDEPENDS:${PN} += " \
     python3-unixadmin \
 "
 
-SRC_URI += " \
-    file://run-ptest \
-"
-
 RDEPENDS:${PN}-ptest += " \
     python3-fcntl \
     python3-html \
     python3-netclient \
-    python3-pytest \
     python3-sqlite3 \
-    python3-unittest-automake-output \
 "
 
-do_install_ptest() {
+do_install_ptest:append () {
     install -d ${D}${PTEST_PATH}/tests
     cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
     sed -e  "s|'test_unit|'tests/test_unit|g" -i  ${D}${PTEST_PATH}/tests/test_unit/test_nlmsg/test_marshal.py \
-- 
2.34.1


