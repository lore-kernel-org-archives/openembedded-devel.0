Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD6DD0D78D
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 13:05:30 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.11021.1728651922666780181
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Oct 2024 06:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CfrKLx/d;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a99cc265e0aso36080366b.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 06:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728651920; x=1729256720; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHyLR8bsXKGyqQH45ypedRSjH33MqZEcciWqsYm3ZYQ=;
        b=CfrKLx/dNAApAPbqs+2wL09yRSqwz/uNpq7f2IwmlFFeUogo63MBBuzMnWRL0QT8+z
         7KekplIVCm6WgvQx24O9qfetyvpAThLUVcIEsdXvVpx2TUiXSZSVfz8Ht+y1iRMcq3iw
         hTlH9GR+BYJNH0eNIuCKW4FqFpXN4tnSvlk0ATlfcct8ApA/QsLhWQ2tWeE6CtztNsVZ
         d07LOd60XuHmfRQp6wVhdgs6UtBdJ7TlQiClhXYQ/jshEcQw6+2JWweDOJ87DbhROcrG
         SEjTsuRbUuhN4kuOPF+MdfTqQJufdMlj5vvAFz9Zt18ciPZHVfctYLUzU/+DbqDW4XWY
         I0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728651920; x=1729256720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uHyLR8bsXKGyqQH45ypedRSjH33MqZEcciWqsYm3ZYQ=;
        b=kjGfko2kvOeVIlsU9Kov2ixZaKVspEm53wCxEmAVEZL+c+8FY8UL4TB8gC4PoEhC28
         d0JfyLYt3eVORMTjxB0svmNgs0+u1tIYCm4qiNuILmtAGVw7OJ6K5knYXy9/ptajLndU
         /J3/L5qsmy2EtlGemh7zQ4NgCRiV9VAvys2JAYw53VxndW3Gg6TlZ1fr02x7hFEeaOFL
         jVGFuYX3VMRihWoDgFkZlrdo/+JsHKXygxSktkYpdvsy/qOvu8UvYY9dmWVI2ZK4HK6q
         G9lKDAMY0uuG5S3/BYxMhYIIJPHHvtZbI7agxfRTq+mSm0MQVlyhEOdvSoIsSQMprOzd
         TR5Q==
X-Gm-Message-State: AOJu0YwBD7mOsnG2SJjq0QDwcKSfKqAK/6PSnely6UZSWzBLxTFiefKF
	dcXyBiEiAgY8szECpqMR2SZ0qKTCsLmIZFo3bteynRqieyA6seId41C6X1Od
X-Google-Smtp-Source: AGHT+IF+nFHDhFCjaqmHQ7OrL+DOvWrawmEgypX2fbAGVlN2vmmxYneBn7iCqjTTA47TPah1vcqSsQ==
X-Received: by 2002:a17:907:3ea2:b0:a99:501c:b841 with SMTP id a640c23a62f3a-a99b93c7fe3mr225630066b.28.1728651919682;
        Fri, 11 Oct 2024 06:05:19 -0700 (PDT)
Received: from localhost.localdomain ([176.33.66.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a7ec56eesm210466066b.31.2024.10.11.06.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:05:18 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 4/5] python3-portion: enable ptest
Date: Fri, 11 Oct 2024 16:04:40 +0300
Message-Id: <20241011130441.2919272-4-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241011130441.2919272-1-alperyasinak1@gmail.com>
References: <20241011130441.2919272-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 13:05:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112800

- Tested on qemux86-64 and qemuarm64

- Added ptest into PTESTS_FAST_META_PYTHON

Ptest result:
=============

qemux86-64:

Testsuite summary
TOTAL: 205
PASS: 205
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 27
END: /usr/lib/python3-portion/ptest
2024-10-11T12:13
STOP: ptest-runner
TOTAL: 1 FAIL: 0

qemuarm64:

Testsuite summary
TOTAL: 205
PASS: 205
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 25
END: /usr/lib/python3-portion/ptest
2024-10-11T12:18
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-portion/run-ptest          |  3 +++
 .../python/python3-portion_2.5.0.bb           | 22 ++++++++++++++++---
 3 files changed, 23 insertions(+), 3 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-portion/run-ptest

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 8f739f24f..196ff6a73 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -48,6 +48,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-platformdirs \
     python3-polyline \
     python3-portalocker \
+    python3-portion \
     python3-precise-runner \
     python3-prettytable \
     python3-propcache \
diff --git a/meta-python/recipes-devtools/python/python3-portion/run-ptest b/meta-python/recipes-devtools/python/python3-portion/run-ptest
new file mode 100644
index 000000000..8d2017d39
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-portion/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-portion_2.5.0.bb b/meta-python/recipes-devtools/python/python3-portion_2.5.0.bb
index f4e5d2036..269473e93 100644
--- a/meta-python/recipes-devtools/python/python3-portion_2.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-portion_2.5.0.bb
@@ -5,12 +5,28 @@ SECTION = "devel/python"
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3000208d539ec061b899bce1d9ce9404"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_setuptools_build_meta ptest
 
 SRC_URI[sha256sum] = "80ae7bab71f4844e3eb33c57954d76a3bd4cb351039b6e260e779325aeb4a487"
 
-RDEPENDS:${PN} = "\
-    python3-sortedcontainers \
+SRC_URI += " \
+	file://run-ptest \
 "
 
+RDEPENDS:${PN} += "\
+	python3-sortedcontainers \
+"
+
+RDEPENDS:${PN}-ptest += " \
+	python3-pytest \
+	python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	# This file tests README.md and deleted as redundant.
+	rm -f ${S}/tests/test_doc.py
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
 BBCLASSEXTEND = "native"
-- 
2.25.1


