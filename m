Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B4EDE77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 20:57:52 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web11.1817.1736542668283461330
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 12:57:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-844d5444b3dso82750839f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 12:57:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736542667; x=1737147467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VmGoKbbGM+BZbgBbMINOnwpWInxFEIeRzU9rW/uibrY=;
        b=vWgWcXgC294uFvqMkR+31DFiF6wL8tmw/af+RfsxBjBP18FZ4IQWR/vCJ4q521F9mh
         yZiRy/rkLYUAk0ncPlXdgmxAfcc0o63i4u2PSnTY+z2nxsf/JJ2rOTdK+UbZB55rcSOI
         C/vWvNAWxhD+et1nPWSihZmtDVYBnGUmsdHXok0BL+PCNtk4q7wVrL642OdWW6azj8cF
         guQkoOnx5OOz/94wOddI4g147stSMDnkHyMYGZinDONmRCPY3qSIa3mXTn2Y6UxIMX+c
         sZs3UkQWuv7GOIr7voMuWMVWgAn8AQostIO1mpmUgWg9g1K9iJ7v7P9ETks2z1yikCpG
         q+Ew==
X-Gm-Message-State: AOJu0Yxo1m2dhIODH62JBlLzZjew7g0K+Ci9BubW8JMSSa7mAOVKaRXu
	lD4KpGJEW8jJUb3oTOcr0m0IyfxQfD4vwZ3jmi2Py2tbTGXbTXTSWxiSMQ==
X-Gm-Gg: ASbGncvobqB2SXFM0t1vv8H4sAnpZVKdq82vNcW77e+NWDGz5PnFozDfSTAQfA3degs
	SYb0MGVbduRi2b/1p+2ff2/hrAfVaXdUtQkpCKimAjN/Pkd6c7ikx9bdRjlflS2VXeADtdfludG
	ZzXbKYmf+fKkQk+UupJZsZQQ6rRF7ckAu7BQ2inirC6ALDJYk2yqDgGVrHVAXMLkb9y6tD5JFqH
	QxLXffyi3NmfCcos4Mf/zl+Zge3nfgalDwRmHFa31jPhzWXc9xjAiP4ZbUWY6sKqTV7jhf5H2wt
	J9bBoBPfpQdvMKLJ6CDMdmKFpg==
X-Google-Smtp-Source: AGHT+IGG0gUNxy3UsW9/H++76sS6BnayaOLS+ejjD9obGxFfToGd/yZVUAK8sKgD9GoXJ7e8Aw5niw==
X-Received: by 2002:a05:6602:3a87:b0:84a:5ded:b7c6 with SMTP id ca18e2360f4ac-84cebef565emr650120939f.5.1736542667034;
        Fri, 10 Jan 2025 12:57:47 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-84d4faee16bsm106960939f.4.2025.01.10.12.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 12:57:45 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 2/3] python3-tomli-w: update recipe to use the ptest-python-pytest class
Date: Fri, 10 Jan 2025 20:57:28 +0000
Message-Id: <20250110205729.4088028-2-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110205729.4088028-1-derek@asterius.io>
References: <20250110205729.4088028-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 20:57:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114806

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-tomli-w/run-ptest                 |  3 ---
 .../recipes-devtools/python/python3-tomli-w_1.1.0.bb | 12 ++----------
 2 files changed, 2 insertions(+), 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-tomli-w/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-tomli-w/run-ptest b/meta-python/recipes-devtools/python/python3-tomli-w/run-ptest
deleted file mode 100644
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-tomli-w/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-tomli-w_1.1.0.bb b/meta-python/recipes-devtools/python/python3-tomli-w_1.1.0.bb
index dded2cbf4..94ea20049 100644
--- a/meta-python/recipes-devtools/python/python3-tomli-w_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tomli-w_1.1.0.bb
@@ -6,24 +6,16 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5"
 SRCREV = "179105660c367874818f2cdd1e06ed98eea668f1"
 PYPI_SRC_URI = "git://github.com/hukkin/tomli-w.git;protocol=https;branch=master"
 
-inherit pypi python_flit_core ptest
+inherit pypi python_flit_core ptest-python-pytest
 
 S = "${WORKDIR}/git"
 
-SRC_URI += " \
-        file://run-ptest \
-"
-
 RDEPENDS:${PN}-ptest += " \
-        python3-pytest \
         python3-tomli \
-        python3-unittest-automake-output \
 "
 
-do_install_ptest() {
-        install -d ${D}${PTEST_PATH}/tests
+do_install_ptest:append() {
         install -d ${D}${PTEST_PATH}/benchmark
-        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
         cp -rf ${S}/benchmark/* ${D}${PTEST_PATH}/benchmark/
 }
 
-- 
2.34.1


