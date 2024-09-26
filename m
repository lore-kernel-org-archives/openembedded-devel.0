Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE1CCDE02F
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 18:17:38 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web10.51083.1727374657147795429
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Sep 2024 11:17:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZA4aozYH;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-71100987d1cso748103a34.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Sep 2024 11:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727374656; x=1727979456; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9ngi0AgR00EKR0UySCqk0D4uzuZAtoN06IoNyxvrfI=;
        b=ZA4aozYHBKH/dnTLZSyPk+4AcJIkxclf6TNtM79M+Ink6I7NSzVxJ2Lj7yFF7RqZXX
         L+R8OMw+XKVt6q1ThoIDzg4Eke+kEFi/UPauZq2r6fSpwxfxZJ1ZqPD84gTeHsZNjBa5
         sfjIrHNPRcdQ4eWkz1Eh14MCB3wFGLn4c0cx3e051atSJOib0wlV1RBYi7WAEVsdCtdJ
         WustFuR366E6ZZxZAHmv2I6z3wp9wyPtvY5FcaALszMjivYcGL3Vw5LE++3lV8Zy+zT2
         jIDBrQNhumZZXwAUmKOYZTvcdWzkHZmnfdN5FS9ueeuexobKudl7o/4VvHZJFLnuVxcF
         1Y1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727374656; x=1727979456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S9ngi0AgR00EKR0UySCqk0D4uzuZAtoN06IoNyxvrfI=;
        b=VXdio+rMCLd1U2bvVD6y3TUvurNrwTtEBEaCrlBHiOZSYnlPvb0B9dKZzNpl77rWmt
         YfHOVo1jaSw24/1/F/VGkVZP+uHbZqGKGnbSL8kfyVVxQ2b4Rr3cizG1fbdT3wGutuDF
         1EoT9axzUs3bBhsRWgctzp7Jk7J7M+gc+Jd7x8cNY+q7ErM2RKY0gK3BHx83kFYMkgsj
         CiQRBrQYMJa3otct2YWmV/JQvrVlf+cxSYsDrnfm0jptA25a4P/+3yf3lxI+yGo2O6Gf
         s3CpVHf/Oo0HuxdMKZtGYTA70u6226nC7MOcPyQiMY4e/8XzCI1G5dA1VGJS0Lb/cZGV
         t2Jw==
X-Gm-Message-State: AOJu0YyKvj+cpZ4cMXbrHHDltRuZI7vwi+tOf/RxjpW8UlY+R9KXK1fC
	KSOTGFCnQKJhx3989r1udqNbkmFC+YTz3TXChz14PiTAN/8sZaKkBTqS9Uy7
X-Google-Smtp-Source: AGHT+IGuaxqN0D+jXoOjFCK5PRx6BCChXaTmNxeQUkX2HMdO9NYQnNYMr0eHfA6e6ew6kx/hX7okCQ==
X-Received: by 2002:a05:6358:e49b:b0:1b8:33b2:1482 with SMTP id e5c5f4694b2df-1becbb58579mr85375055d.1.1727374656134;
        Thu, 26 Sep 2024 11:17:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::ae14])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6db5ecd1fsm172049a12.58.2024.09.26.11.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 11:17:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>
Subject: [meta-python][PATCH 2/3] python3-pytest-mock: Fix ptests
Date: Thu, 26 Sep 2024 11:17:32 -0700
Message-ID: <20240926181733.932610-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240926181733.932610-1-raj.khem@gmail.com>
References: <20240926181733.932610-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Sep 2024 18:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112521

- Drop the patch to add additional checks to disable failing introspection
  tests, use plain asserts instead

- Switch to pypi fetcher

- Add missing rdeps needed for ptest runs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...t_mock-skip-args-introspection-tests.patch | 38 -------------------
 .../python/python3-pytest-mock/run-ptest      |  4 +-
 .../python/python3-pytest-mock_3.14.0.bb      | 19 +++++-----
 3 files changed, 11 insertions(+), 50 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pytest-mock/0001-test_pytest_mock-skip-args-introspection-tests.patch

diff --git a/meta-python/recipes-devtools/python/python3-pytest-mock/0001-test_pytest_mock-skip-args-introspection-tests.patch b/meta-python/recipes-devtools/python/python3-pytest-mock/0001-test_pytest_mock-skip-args-introspection-tests.patch
deleted file mode 100644
index f024e79d93..0000000000
--- a/meta-python/recipes-devtools/python/python3-pytest-mock/0001-test_pytest_mock-skip-args-introspection-tests.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From e184fb950ad3b52c5c16438d39fe4d516c784e30 Mon Sep 17 00:00:00 2001
-From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Thu, 12 Oct 2023 17:32:40 -0400
-Subject: [PATCH] test_pytest_mock: skip args introspection tests
-
-Disable these two tests for now so that python3-pytest-mock can have
-successful ptest runs.
-
-Upstream-Status: Inappropriate [OE-Specific]
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
----
- tests/test_pytest_mock.py | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/tests/test_pytest_mock.py b/tests/test_pytest_mock.py
-index 3d53241..157b6c3 100644
---- a/tests/test_pytest_mock.py
-+++ b/tests/test_pytest_mock.py
-@@ -581,6 +581,7 @@ def test_assert_called_wrapper(mocker: MockerFixture) -> None:
-     stub.assert_called()
- 
- 
-+@pytest.mark.skip("Async not correctly detected, skip for now")
- @pytest.mark.usefixtures("needs_assert_rewrite")
- def test_assert_called_args_with_introspection(mocker: MockerFixture) -> None:
-     stub = mocker.stub()
-@@ -597,6 +598,7 @@ def test_assert_called_args_with_introspection(mocker: MockerFixture) -> None:
-         stub.assert_called_once_with(*wrong_args)
- 
- 
-+@pytest.mark.skip("Async not correctly detected, skip for now")
- @pytest.mark.usefixtures("needs_assert_rewrite")
- def test_assert_called_kwargs_with_introspection(mocker: MockerFixture) -> None:
-     stub = mocker.stub()
--- 
-2.41.0
-
diff --git a/meta-python/recipes-devtools/python/python3-pytest-mock/run-ptest b/meta-python/recipes-devtools/python/python3-pytest-mock/run-ptest
index 8d2017d39c..51ae892b01 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-mock/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-pytest-mock/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
-
-pytest --automake
+# see https://github.com/pytest-dev/pytest-mock/issues/102 for reasons to use plain asserts
+pytest --automake --assert=plain
diff --git a/meta-python/recipes-devtools/python/python3-pytest-mock_3.14.0.bb b/meta-python/recipes-devtools/python/python3-pytest-mock_3.14.0.bb
index fe2479c836..b968cf1cd4 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-mock_3.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-mock_3.14.0.bb
@@ -5,28 +5,27 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE;md5=b2ddb1e69238461b7e4ef2a84d874109 \
 "
 
-SRC_URI = " \
-    git://github.com/pytest-dev/pytest-mock;branch=main;protocol=https \
-    file://0001-test_pytest_mock-skip-args-introspection-tests.patch \
+SRC_URI += " \
     file://run-ptest \
 "
-SRCREV = "8733134b6194395e9cd3c745adcc9a9c09b0279e"
+SRC_URI[sha256sum] = "2719255a1efeceadbc056d6bf3df3d1c5015530fb40cf347c0f9afac88410bd0" 
 
-inherit python_setuptools_build_meta ptest
+inherit pypi python_setuptools_build_meta ptest
+
+PYPI_PACKAGE = "pytest-mock"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-RDEPENDS:${PN} += " \
-    python3-asyncio \
+RDEPENDS:${PN}-ptest += " \
+    python3-misc \
     python3-mock \
     python3-pytest \
     python3-pytest-asyncio \
-    python3-unittest \
+    python3-threading \
+    python3-tox \
     python3-unittest-automake-output \
 "
 
-S = "${WORKDIR}/git"
-
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests
     cp -rf ${S}/tests ${D}${PTEST_PATH}/

