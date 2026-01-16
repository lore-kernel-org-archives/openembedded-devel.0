Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6715AC982CF
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 15:33:17 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8679.1768577594792450705
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Jan 2026 07:33:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DHaAf0G6;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so16968375e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jan 2026 07:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768577593; x=1769182393; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RTdhscGz/iC5ItNGxfFbd03I1lBx5qSUHWiB+dkaTlo=;
        b=DHaAf0G6Sevzqlw0vz4LMlTmG9Nu0rQtxqqwC8bRPqcGZGCsI87ffu7I7LhzKf1C4t
         CuAxt04IvCw6TCrRpnFmq+Q2zHHUeEr6I+E/s+jgdY/RTWUnaKP0Sc9ljvKlITYIQQww
         uTJ1/ABPB2B116LawFLkercwedP73ujpUF8uOz0fZqTLIYaP0Rd3WzaS3LxmgDb+GoAo
         hYak/t8RZXLbZhvGnBKtpbnhVV93fZDjKOaOCNpB46tEWFGeaDwtcOiHoXdLFath7IzR
         5/gVvW5tTsNB7TDhSxIHGVs+kjV5shvn/+Z6Zr7qNAMoCyOWONYirfqWq5UEr42GB1ac
         bRVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768577593; x=1769182393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RTdhscGz/iC5ItNGxfFbd03I1lBx5qSUHWiB+dkaTlo=;
        b=ZipwDxW3auXElYSf0e5aNQtGQMC10PX0rxU4G0RrNzgRmqDRXTNqJufu/5/EDqrstJ
         H1pn0sB0PRjATE8A1c5FgGn3SrUAGkcWCYMM5TOLcAHqW1clapzbJhbNY7CvocnHmlmI
         0qXyilP3p5TD/LPjAsRSIIDHmqXTdjUAxUyYTMtx6H0e28h/dF/GgDzHI+NyjBfz1hFG
         Q4jAcfEXzc6OeKHt3WmV7mb53VCSUll2rZ8fsIFCjGN/v1Eg37axJHcAsFRSyDCJRVw1
         ko4OkGqY314llH1M9o/IhNU2/cTJWoX3kYQW5By/iB4DDY/5J8Ev/YgquGWIb0/qPBUI
         5aVQ==
X-Gm-Message-State: AOJu0Yw+deZ2FjG0xOnks3vRDiBzyhuGPW78sgNUdCzT3f23YUcN/4tP
	EQ0Lr/CCNUVj6a1SS9x+KZ9ZU70+QhM6FlYn9ufQiSBv0UQ/j5Uu4G0OaS63Iw==
X-Gm-Gg: AY/fxX6PJpJIcgQE0ZWQR2tfmjerTK5ivNcjSyiXGQ13mN2nJrsPvO3xzlg68MPhqlW
	qTY2sL8Tf44uZyA1TkJkw7+WJuGF1OQQpFMxL35gfSQ9Z4LsW+2XTSAYYVUJ4r1x5vsnqXlJT8B
	8bhj6rG7NtSWXbvkcQcPJS8lrOdIBxskyE2xgxTr4AGjIWfwoWygROsa1RCPxTU7anP/dghYxxc
	AcL6YsImZwEDdh19xhIKu29eWfn5oegAJwkHOlxLHh6CPWXGnNSeuCdHgry/J5qIdsX63GIh5KM
	Ab19G9KBSV/vABWB9JSNd1s1lOuoJFdsBATCm11WhOo+L932CXsHUxnfgygZOROcSFkrf9cZMGk
	g2vDSR7gf+qKPonYi8VFDPK1Cwt55ieYWCH5fhRnGZkFrbHwKETSyk/EciVDCjfXFTV38g6TjS0
	58V4k94AC9
X-Received: by 2002:a05:600c:6048:b0:47d:87ac:73ef with SMTP id 5b1f17b1804b1-4801d7d2524mr38181195e9.13.1768577593024;
        Fri, 16 Jan 2026 07:33:13 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801ea19f94sm21010985e9.3.2026.01.16.07.33.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 07:33:12 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/5] python3-tblib: add recipe
Date: Fri, 16 Jan 2026 16:33:07 +0100
Message-ID: <20260116153311.3444648-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Jan 2026 15:33:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123532

Serialization library for Exceptions and Tracebacks.

It is a runtime dependency for python3-django ptests.

The ptests for this recipe run under a second.

Sample output:

root@qemux86-64:~# ptest-runner
START: ptest-runner
2026-01-15T19:37
BEGIN: /usr/lib/python3-tblib/ptest
PASS: tests/test_issue30.py:test_30
PASS: tests/test_issue65.py:test_65
PASS: tests/test_perf.py:test_perf
[...many passing lines...]
PASS: tests/test_tblib.py:test_parse_traceback
PASS: tests/test_tblib.py:test_large_line_number
PASS: tests/test_tblib.py:test_pytest_integration
============================================================================
Testsuite summary
DURATION: 1
END: /usr/lib/python3-tblib/ptest
2026-01-15T19:37
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-tblib_3.2.2.bb             | 22 +++++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-tblib_3.2.2.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index d83ac85f1b..3b21c7cfa2 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -104,6 +104,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-soupsieve \
     python3-sqlparse \
     python3-starlette \
+    python3-tblib \
     python3-tenacity \
     python3-tomli-w \
     python3-tomlkit \
diff --git a/meta-python/recipes-devtools/python/python3-tblib_3.2.2.bb b/meta-python/recipes-devtools/python/python3-tblib_3.2.2.bb
new file mode 100644
index 0000000000..ae3ba730c5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tblib_3.2.2.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Serialization library for Exceptions and Tracebacks."
+HOMEPAGE = "https://github.com/ionelmc/python-tblib"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=810c4c43873f8d9331fb067a6473a960"
+
+inherit pypi python_setuptools_build_meta ptest-python-pytest
+
+SRC_URI[sha256sum] = "e9a652692d91bf4f743d4a15bc174c0b76afc750fe8c7b6d195cc1c1d6d2ccec"
+
+do_install_ptest:append(){
+    install -m 0644 ${S}/pytest.ini ${D}${PTEST_PATH}
+    # The tests are comparing exception outputs with expected ones, and it doesn't
+    # expect carets in the exception.
+    sed -i 's/pytest/PYTHONNODEBUGRANGES=1 pytest/' ${D}${PTEST_PATH}/run-ptest
+}
+
+RDEPENDS:${PN}-ptest += " \
+    python3-misc \
+    python3-pytest-benchmark \
+    python3-statistics \
+    python3-twisted \
+"

