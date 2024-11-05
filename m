Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D546FD2C12D
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:11 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.19624.1730817423878506974
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BuZfaFnW;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e5b7cd1ef5so46669587b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817423; x=1731422223; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4iaLXmzwpWawF/i9J5zrEIQCLkSNvHIZAd6TNgm74uM=;
        b=BuZfaFnWPiPPJEdm6t1f/PHRG2QQsOQkivJUW7w/tU2pPCjaY5WgcbVKUesP5aRLGp
         cuyTGPn3egpvLGQGCVAyk8FZ/cXp+U+38D0O9OAxNxtaCGyLgtjkUfHwscu7JLId56Tx
         7MZpFHLAz2yXi8ijh4JJNNFbNxneWAA7RKcCeTXwF4pGt1I7AnpD3si+KGR4H7YTKP4x
         N1Lo7ZbuRH6EIxE4gYdEZAJZSMb/NV1ea0TyJzvmw1P9odyO0II7pwNzT4AmKqVEgf+J
         RhxNYlMR8kBAOAG6XrT/07HIqgZPwARpNn6+cgnIldX2JDt9WibgIvyHn4jIPcgXXDNM
         8zoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817423; x=1731422223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4iaLXmzwpWawF/i9J5zrEIQCLkSNvHIZAd6TNgm74uM=;
        b=ss/Fe/WfwZexQXcd3hmbLs09uqBvFobeawkTttyOzZOLYuG0pU9xd72rjK3zmBo189
         rPgb7beRVYMDOaj3Wxdik8UfBaN3oYc69Ds+maLU6DpNCddiG3XSNN3pN45fLFHgQbo8
         l0/KidfnJM34LnMyc+WSqXvv6P4TL5CSxm5QB86oZ/QeHx56vHqzqxJaGJNlz72ZeVlg
         OrjhISBJEW1ZeD4RFBPqL1IQxqfBLD7noWPNigUuXhfgtDDIgPXcUW8zVRNL1eALqmm6
         pohFMWPMjP6huhZxsHfrFI1QkNvqjCTj75S60pSlU1lHbAbGJ7Eldl7rg/rdn99WP1c2
         bs6w==
X-Gm-Message-State: AOJu0Yx1i46tvOVG2Or+iUDWMYgse3uK7gicyeHXMItv0L7/FPohHQHt
	qsgqQYYdQOeK7k4RfI5ySH4ldFTYWSBfUpTquNYLqaY77hsh/s1b/2ua2g==
X-Google-Smtp-Source: AGHT+IEBr7LzhRmSwWNlv0HmHCTw9Q1NiZKw5krcVkOCeunodfoHWmV4YYZVRoh6VVuW+OWDRs216g==
X-Received: by 2002:a05:690c:6402:b0:6e3:32e2:ecbf with SMTP id 00721157ae682-6e9d89951a7mr377588257b3.24.1730817422890;
        Tue, 05 Nov 2024 06:37:02 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:37:02 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>
Subject: [meta-oe][styhead][PATCH 52/90] python3-pytest-mock: Fix ptests
Date: Tue,  5 Nov 2024 09:35:17 -0500
Message-ID: <20241105143638.2301245-53-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113470

From: Khem Raj <raj.khem@gmail.com>

- Drop the patch to add additional checks to disable failing introspection
  tests, use plain asserts instead

- Switch to pypi fetcher

- Add missing rdeps needed for ptest runs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
-- 
2.43.0


