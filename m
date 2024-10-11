Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B887D0D78C
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 13:05:20 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.11015.1728651918542022588
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Oct 2024 06:05:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MXPnI/xl;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a993302fa02so318350566b.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 06:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728651916; x=1729256716; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xTa4CWZv9A+6qI7v/iOSeJKB9RjbvZAlxEKmgJ3Vdcs=;
        b=MXPnI/xlSDhXjRydgmuzg/swtQQAoisJEw7XKfTc4eKXG5bK4T1Rq0+yv+/QhaS61V
         tbVjEyFED+PC5th0Uuteai2dVEXzRq29tN8eFy7CtXauehyyJNAlNqWUYnEyaY03dmN5
         R5p91Mweox5e6hWZy+N/T2PArQW4s8+ZQnAXHkaTcb2wgMukzKjp63SXDTnn4KcoWxZl
         5hHRiqRzrLgwhDx0r9z4tE2EZgx2qYGamH+m+9WypZeyi/08xal90pesN8GUEhN7HYcC
         vyvKRVcDxzI5i6b81i/rsVRmIyibZN93uL7/Q8jUcycES51j7Ln9Tfsi48rJuKE80Aml
         kioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728651916; x=1729256716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xTa4CWZv9A+6qI7v/iOSeJKB9RjbvZAlxEKmgJ3Vdcs=;
        b=s/OJsmc9AxraCW6zBSSuUzndpiDJOXvZLM+Xa6cL4Et3tgY5ZkMGVBAHoIp2YG34tM
         bzKB2s6N0dUF/aWEXAyVpuysHxvGUVD0V7s4ddp2FgkIBYgegogxN8N8rnMSJu8Rsnyo
         oDqszaCCePg6OV18kE/g7ooYAAv7wRCciESw1r6KoU99QnmX58RFjDNvYWvJbQbmPr8v
         7jQu+Z1a8NO4Jdiq8ozDONNsaTxAePQoHuSm1arm0eiZON+jtfZl2ZnpUIzNocmwVPWq
         aSx0r4dhA+u/lpFZOetAR98+K00+ZwQxspv9rQ02sxv2S3xlwn77lly8oOslGHIgXgGY
         lOew==
X-Gm-Message-State: AOJu0Yy8r7C1nZC09y33PEWusQqypwNoA1eVbniZ/nf/xphLU5c/A78A
	zp3DSI4nU6ljTc9PO85CcadBrEu8bq5t/BmjWE4Ynx/ZPWk6wnhsId84X758
X-Google-Smtp-Source: AGHT+IHLOEYkmf0o+w+to8861fML6DfgzemCAHkMbG+l8BtEvR0XZTXqnt03DAQ8EzVM2iWddmaMjA==
X-Received: by 2002:a17:907:841:b0:a99:4615:f58c with SMTP id a640c23a62f3a-a99b93059d7mr215262166b.2.1728651916438;
        Fri, 11 Oct 2024 06:05:16 -0700 (PDT)
Received: from localhost.localdomain ([176.33.66.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a7ec56eesm210466066b.31.2024.10.11.06.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:05:15 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 2/5] python3-python-multipart: upgrade 0.0.11 > 0.0.12 and enable ptest
Date: Fri, 11 Oct 2024 16:04:38 +0300
Message-Id: <20241011130441.2919272-2-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241011130441.2919272-1-alperyasinak1@gmail.com>
References: <20241011130441.2919272-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 13:05:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112798

- Tested on qemux86-64 and qemuarm64

- Added ptest into PTESTS_FAST_META_PYTHON

Ptest result:
=============

qemux86-64:

Testsuite summary
TOTAL: 115
PASS: 115
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 24
END: /usr/lib/python3-python-multipart/ptest
2024-10-11T09:02
STOP: ptest-runner
TOTAL: 1 FAIL: 0

qemuarm64:

Testsuite summary
TOTAL: 115
PASS: 115
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 22
END: /usr/lib/python3-python-multipart/ptest
2024-10-11T09:08
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Changelog:

- Enforce 100% coverage
- Add mypy strict typing
- Improve error message when boundary character does not match

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-python-multipart/run-ptest |  3 +++
 .../python/python3-python-multipart_0.0.11.bb |  9 -------
 .../python/python3-python-multipart_0.0.12.bb | 24 +++++++++++++++++++
 4 files changed, 28 insertions(+), 9 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-python-multipart/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-python-multipart_0.0.11.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-python-multipart_0.0.12.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 25d71a2b6..7864b632a 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -53,6 +53,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-pydantic \
     python3-pydantic-core \
     python3-pylint \
+    python3-python-multipart \
     python3-ptyprocess \
     python3-py-cpuinfo \
     python3-pyasn1-modules \
diff --git a/meta-python/recipes-devtools/python/python3-python-multipart/run-ptest b/meta-python/recipes-devtools/python/python3-python-multipart/run-ptest
new file mode 100644
index 000000000..8d2017d39
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-python-multipart/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.11.bb b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.11.bb
deleted file mode 100644
index b325f90ad..000000000
--- a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.11.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-SUMMARY = "A streaming multipart parser for Python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3d98f0d58b28321924a89ab60c82410e"
-
-SRC_URI[sha256sum] = "1d377f074b69a47dd204c990de57a7cf03d9b85695a3e57faec32d54b78e3e48"
-
-inherit pypi python_hatchling
-
-PYPI_PACKAGE = "python_multipart"
diff --git a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.12.bb b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.12.bb
new file mode 100644
index 000000000..340e297b8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.12.bb
@@ -0,0 +1,24 @@
+SUMMARY = "A streaming multipart parser for Python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3d98f0d58b28321924a89ab60c82410e"
+
+SRC_URI[sha256sum] = "045e1f98d719c1ce085ed7f7e1ef9d8ccc8c02ba02b5566d5f7521410ced58cb"
+
+inherit pypi python_hatchling ptest
+
+PYPI_PACKAGE = "python_multipart"
+
+SRC_URI += " \
+	file://run-ptest \
+"
+
+RDEPENDS:${PN}-ptest = " \
+	python3-pytest \
+	python3-pyyaml \
+	python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
-- 
2.25.1


