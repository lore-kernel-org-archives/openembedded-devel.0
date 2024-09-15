Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F8EC3ABAF
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 23:03:05 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.125160.1726441382511846259
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Sep 2024 16:03:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jcHNfn9+;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2055136b612so47818225ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 16:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726441382; x=1727046182; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qhguynP01aA5Ttf05Bb2P0wTk/K1kYGAJKD2S+7KFBc=;
        b=jcHNfn9+NYPOxgGJxNEbYFJ2IT1ZrXNd6QAT+LxXbKn0/JSMWVtAYdEERGh8U9W1Ua
         3gAdytqHLuEuXGlN/zuwQWCSJEsatTeVc8b44NoS81qrXfLJFRfZjyN8Klc1umIjOCmJ
         P7r0hnWX6U/X59MGslUwQjKns+ZK4rOJc6N4RctLKJLpvvTZS8jC5f9vt9qI8tYMeFYV
         sTmMWMWqdMSmpkjZUbyw8klfzWuvPrJiGK+kk2Nb3VNRGVYrLF11DXF63RTejJCR+pxd
         OqFX3rQt8g8CDSL7OKAoBCVgOJrxFDXredGW174zqcd3v//DjTR+NZqRLZrdIyS+waUZ
         pKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726441382; x=1727046182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qhguynP01aA5Ttf05Bb2P0wTk/K1kYGAJKD2S+7KFBc=;
        b=ogI91XlqjNuz7kz0pie0VR2+feR2Q2HrOiFJuckUMaqNFNRz44eLRsOPhVBcYELPcv
         BcdbERZ/V89VOY+8BNco1//omBdVAxKDCp3/w3nR7p6YE5XU0zWdCOKRhLmgNRPLwjkA
         P07l9v9isaZbObseGjnQ9+jEzVcI1O0VpyPsw+4cbq3Pxct/fzJS5S1VpcFnOFZhnObX
         w1gPKORAS0uvDuAlbijKbZJtL38yNKE6jn3sxIcdQUblUPg7SoVEyei6REdfJVrB03fM
         uxlEyw7iqz1EDKzfl/c0csF0rYE/GrDxjfEt1mmURGcGX2SmVcB8Q1vm8QzpoG57IPRL
         aLuQ==
X-Gm-Message-State: AOJu0Yyim6dA4wZ1QwqNt3/RrvxYbQdV8r9kc6f9HKb8mgpghvpbH2ro
	JeBS74Y4qOBQj+28lmXFh5X6uoCA+7qvS3V2y9TKqq/gPQjyKsHeiEZDDFZJ
X-Google-Smtp-Source: AGHT+IH6VYOdzILHKj+FxXGLi60nglCKGjPsnP0F70aGez1MZgHhWnlP9i3KzG3bySe4/3eEpMHvlg==
X-Received: by 2002:a17:902:d510:b0:206:b4cf:3107 with SMTP id d9443c01a7336-2076e422055mr225921395ad.49.1726441381510;
        Sun, 15 Sep 2024 16:03:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9c53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20794730629sm26309235ad.247.2024.09.15.16.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 16:03:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-pytest-mock: Upgrade to 3.14.0
Date: Sun, 15 Sep 2024 16:02:58 -0700
Message-ID: <20240915230258.1327144-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 23:03:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112317

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-pytest-mock/403.patch      | 92 -------------------
 ....12.0.bb => python3-pytest-mock_3.14.0.bb} |  8 +-
 2 files changed, 4 insertions(+), 96 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pytest-mock/403.patch
 rename meta-python/recipes-devtools/python/{python3-pytest-mock_3.12.0.bb => python3-pytest-mock_3.14.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-mock/403.patch b/meta-python/recipes-devtools/python/python3-pytest-mock/403.patch
deleted file mode 100644
index 6787c2a3dc..0000000000
--- a/meta-python/recipes-devtools/python/python3-pytest-mock/403.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From 8480bb6d0500f933be039cfec65e04157e6ecffe Mon Sep 17 00:00:00 2001
-From: Bruno Oliveira <nicoddemus@gmail.com>
-Date: Tue, 19 Dec 2023 08:24:23 -0300
-Subject: [PATCH 1/3] Fix tests for Python 3.11 and 3.12
-
-Fixes #401.
-Upstream-Status: Backport [https://github.com/pytest-dev/pytest-mock/pull/403]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tests/test_pytest_mock.py | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/tests/test_pytest_mock.py b/tests/test_pytest_mock.py
-index 3ee00da..7acb361 100644
---- a/tests/test_pytest_mock.py
-+++ b/tests/test_pytest_mock.py
-@@ -246,9 +246,8 @@ def __test_failure_message(self, mocker: MockerFixture, **kwargs: Any) -> None:
-             msg = "Expected call: {0}()\nNot called"
-         expected_message = msg.format(expected_name)
-         stub = mocker.stub(**kwargs)
--        with pytest.raises(AssertionError) as exc_info:
-+        with pytest.raises(AssertionError, match=re.escape(expected_message)) as exc_info:
-             stub.assert_called_with()
--        assert str(exc_info.value) == expected_message
- 
-     def test_failure_message_with_no_name(self, mocker: MagicMock) -> None:
-         self.__test_failure_message(mocker)
-
-From c596504e062be06475b03122c9c0cc732ae87840 Mon Sep 17 00:00:00 2001
-From: "pre-commit-ci[bot]"
- <66853113+pre-commit-ci[bot]@users.noreply.github.com>
-Date: Tue, 19 Dec 2023 11:24:38 +0000
-Subject: [PATCH 2/3] [pre-commit.ci] auto fixes from pre-commit.com hooks
-
-for more information, see https://pre-commit.ci
----
- tests/test_pytest_mock.py | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/tests/test_pytest_mock.py b/tests/test_pytest_mock.py
-index 7acb361..c185f2a 100644
---- a/tests/test_pytest_mock.py
-+++ b/tests/test_pytest_mock.py
-@@ -246,7 +246,9 @@ def __test_failure_message(self, mocker: MockerFixture, **kwargs: Any) -> None:
-             msg = "Expected call: {0}()\nNot called"
-         expected_message = msg.format(expected_name)
-         stub = mocker.stub(**kwargs)
--        with pytest.raises(AssertionError, match=re.escape(expected_message)) as exc_info:
-+        with pytest.raises(
-+            AssertionError, match=re.escape(expected_message)
-+        ) as exc_info:
-             stub.assert_called_with()
- 
-     def test_failure_message_with_no_name(self, mocker: MagicMock) -> None:
-
-From 6da5b0506d6378a8dbe5ae314d5134e6868aeabd Mon Sep 17 00:00:00 2001
-From: danigm <daniel.garcia@suse.com>
-Date: Wed, 20 Dec 2023 16:02:13 +0100
-Subject: [PATCH 3/3] Update expected message to match python 3.11.7 (#404)
-
-https://github.com/python/cpython/issues/111019
-
-Fixes #401.
-Closes #403.
----
- tests/test_pytest_mock.py | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/tests/test_pytest_mock.py b/tests/test_pytest_mock.py
-index c185f2a..01534a4 100644
---- a/tests/test_pytest_mock.py
-+++ b/tests/test_pytest_mock.py
-@@ -25,6 +25,8 @@
- 
- # Python 3.8 changed the output formatting (bpo-35500), which has been ported to mock 3.0
- NEW_FORMATTING = sys.version_info >= (3, 8)
-+# Python 3.11.7 changed the output formatting, https://github.com/python/cpython/issues/111019
-+NEWEST_FORMATTING = sys.version_info >= (3, 11, 7)
- 
- if sys.version_info[:2] >= (3, 8):
-     from unittest.mock import AsyncMock
-@@ -240,7 +242,9 @@ def test_repr_with_name(self, mocker: MockerFixture) -> None:
- 
-     def __test_failure_message(self, mocker: MockerFixture, **kwargs: Any) -> None:
-         expected_name = kwargs.get("name") or "mock"
--        if NEW_FORMATTING:
-+        if NEWEST_FORMATTING:
-+            msg = "expected call not found.\nExpected: {0}()\n  Actual: not called."
-+        elif NEW_FORMATTING:
-             msg = "expected call not found.\nExpected: {0}()\nActual: not called."
-         else:
-             msg = "Expected call: {0}()\nNot called"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-mock_3.12.0.bb b/meta-python/recipes-devtools/python/python3-pytest-mock_3.14.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pytest-mock_3.12.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-mock_3.14.0.bb
index e9a9a4fbc5..fe2479c836 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-mock_3.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-mock_3.14.0.bb
@@ -7,18 +7,18 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI = " \
     git://github.com/pytest-dev/pytest-mock;branch=main;protocol=https \
-    file://run-ptest \
     file://0001-test_pytest_mock-skip-args-introspection-tests.patch \
-    file://403.patch \
+    file://run-ptest \
 "
-SRCREV = "69adc6f76c1a7baf4e7a728da9eec38741d5783e"
+SRCREV = "8733134b6194395e9cd3c745adcc9a9c09b0279e"
 
-inherit setuptools3 ptest
+inherit python_setuptools_build_meta ptest
 
 DEPENDS += "python3-setuptools-scm-native"
 
 RDEPENDS:${PN} += " \
     python3-asyncio \
+    python3-mock \
     python3-pytest \
     python3-pytest-asyncio \
     python3-unittest \

