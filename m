Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC67C43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 21:28:35 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.413.1783718911303317263
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jul 2026 14:28:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=pHA1KH6y;
 spf=pass (domain: konsulko.com, ip: 209.85.221.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47de0093c42so1225797f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jul 2026 14:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1783718909; x=1784323709; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=shsljdzHBurpPJWHvGtOVP17QHc1Yu2mZrWwrR84Eko=;
        b=pHA1KH6yIWmS+2TKw+0exig8Rj9+iryqKREBQmW9cDkiUYtIy5UpiYy5b56JNYcskO
         iUr806SPf+XX3XS6V9fDmiIb7deBrggqO38TkSc6vzXJekjEgYBAE2/0oUGgPcjjiJ2t
         BzviIh811gj/57und/Sy3liS6ionxhtkaFQXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783718909; x=1784323709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=shsljdzHBurpPJWHvGtOVP17QHc1Yu2mZrWwrR84Eko=;
        b=MNMHPRd4RpcoT1ghw3teshbHPxoBih0vmrc6bs3UAuf2DO39LPLAEgeFTa5t58zfCE
         nq+mrCpuHpHB29yW/wkDMX90abELP5OOQYb7upPUKi3690s7Jpmu4RJRDfZ0nuvrYWOf
         /7t1sLT7FCW0zaRLNjVX+W6DxYCb8Jsg3vysmUfTYcYTcmvERx1g6FejhbMWWFryF70w
         WK9ZBFQCyJhuME0mOhOOBM8yKcYQSMhJHXyjXi2ti6oY8eYjcoOsYJsuC3OlTyAC1opv
         FsNMTvlEwq7RkGoAl89qZr+30bt9tFN19duV1H+YusFz65vzULbR2xwaTzk+qa+vuJgq
         1wfw==
X-Gm-Message-State: AOJu0YwqKQeiEwZB74wVp+ExBtfetFCI1rkwLtW3L7iGHrT566WPNOCV
	b+1lWUyw2ZmsdixVnX8N/A4dbCDbgKzCUjFUt09JyzhZC1xN6nuhHt4ZByDVwpq1xjkG6BToA+v
	cQkkR
X-Gm-Gg: AfdE7clJCX1qqvT/corM3chqkjTf/eVs+0VS7ymtjSwOfaylMGTBIUbPfCyMTTK9kYn
	OnnqlZNaszlbi2vuNhnQ0rUDxDLAr4aePLJHkUfbvCdmCp/AnpFjJm8QPHdDHQfkwC8O/+/+d50
	yYnSGSNxXNjDMzPbXHELvLn1FFt0Olp466l2rkhjLIDt57QarihuDSJGhhXt1j+TsjFeRDKDphS
	soFXT7Vzb32BHG32DQVbrlVblRnQCKvKVA0I6+Bz+TOSHnrC0BBtCAaOn4nI3+nGYwc5MniEcRf
	85416eNtVh+LU1TtIt3bp1NdKZiVl3ZEjJP5Vyju+wv7mH4P2Riw42gVjntpiqnA5W0Cq0G5TMd
	yv9Gf8k24uGdrlVrgBm4S4pRdkPyczN+2Y8vmCqQ3L+BtLJtb8AThFn7iYyiUR9OjJQyjBo7LPY
	1fGK4lFWupTDIKIAF7PQYXaYjg6nF4JfqHO7dksWsO8thNbZngxJt8f8o7onSyEWQ3OD65p0MVc
	u6zeqFwOktAzx2bDarPn4oM9+GM50+2V6YLN4w1+Q==
X-Received: by 2002:a05:6000:24c2:b0:477:6da:1b83 with SMTP id ffacd0b85a97d-47f2dcc8ab8mr445999f8f.24.1783718909344;
        Fri, 10 Jul 2026 14:28:29 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47df6a31dd5sm17629103f8f.16.2026.07.10.14.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:28:28 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-wand: Enable tests
Date: Sat, 11 Jul 2026 00:28:23 +0300
Message-ID: <20260710212823.1567516-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260710212823.1567516-1-leon.anavi@konsulko.com>
References: <20260710212823.1567516-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jul 2026 21:28:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128132

Inherit ptest, include tests for wand and run the relevant
test cases. Add imagemagick as a runtime dependency.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-wand/run-ptest             |  5 ++++
 .../python/python3-wand_0.7.2.bb              | 23 ++++++++++++++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-wand/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-wand/run-ptest b/meta-python/recipes-devtools/python/python3-wand/run-ptest
new file mode 100644
index 0000000000..2aa830d161
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-wand/run-ptest
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+pytest --automake \
+    --deselect "tests/image_methods_test.py::test_inverse_fourier_transform" \
+    --deselect "tests/image_methods_test.py::test_forward_fourier_transform"
diff --git a/meta-python/recipes-devtools/python/python3-wand_0.7.2.bb b/meta-python/recipes-devtools/python/python3-wand_0.7.2.bb
index 8b46b28cb6..305aeaeb11 100644
--- a/meta-python/recipes-devtools/python/python3-wand_0.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-wand_0.7.2.bb
@@ -4,13 +4,34 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2a2b05e6331064556e971cfa0efca0bf"
 
+SRC_URI += "file://run-ptest"
+
 SRC_URI[sha256sum] = "0387fd08848d00cadd1d885fcb19a17dd4250df2029e5338b6b668b7fed64b5b"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_setuptools_build_meta ptest
 
 PYPI_PACKAGE = "wand"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 FILES:${PN}-doc += "${datadir}/README.rst"
 
+RDEPENDS:${PN} += " \
+    imagemagick \
+"
+
+RDEPENDS:${PN}-ptest += " \
+    python3-pytest \
+    python3-core \
+    python3-datetime \
+    python3-numbers \
+    python3-unittest \
+    python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+    cp -f ${S}/pyproject.toml ${D}${PTEST_PATH}/
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


