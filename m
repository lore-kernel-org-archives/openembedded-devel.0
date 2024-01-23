Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E19C47258
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 20:49:34 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.5650.1706042970652823979
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Jan 2024 12:49:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SMPD8OHO;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1d76943baafso13462075ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 12:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706042970; x=1706647770; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bcbU67UF2F41QlMPjF6VYhix9A/KaWKNxRyKnePE0Kw=;
        b=SMPD8OHOdJvK60etD6uRuUkXOOylNDoW63G5UOCE9MtieD2i6/fJsOwHjE2cfKY8Ay
         s+4uF03y5x7q8w0PqbNEx956MsEhJtxXvtXIowSC2ttH3XxPspSwjHrH4/EWHxj2CTUT
         X7l5be1Dxq7Z3JIjELvEx+Ez8wp4HqQqOuja+r3h4k8TDHdHIX3lDcULJlzLFpAgx648
         KZwiYTcpv2mLT2eixfd9mBFncEb0ZPUxM57q/ychiHnYlM3JXt/Veb6m0oZFfom7JsLI
         fIMSaUk9ykCApRm9iTjL+re8INDyCQai1WeZIogyAJ9/foZjhpL9qxpfd5yhVeZlHHJv
         NtQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706042970; x=1706647770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bcbU67UF2F41QlMPjF6VYhix9A/KaWKNxRyKnePE0Kw=;
        b=WNYPmCD2e+zoXAffSMKaorzJxfwQV4WFToy73lRoTYZltdkIyTLTVQ0snQeRqV2plV
         IIXSxT0Vhwz0rNKew8Rg2DzC1eAH9/eDet30V+Y3fShM83X+evC66yW1zwc/Wq0xPHGd
         Z3R+nNf4xtZal9w6PYvGYoaML/+3QVfTQxXk7TZOLHPL/QNSjreMoZTiKjPIAz0rEdDw
         p2Q9mrZxYJc33JP0LMfaMJSGBLBiL3t0yNrrp65Fw1AQkDKt5b2gUUoiBLzUBTS7G92x
         3MqfL45k3XV8/nACGtCYFvjV6U3OgyT6AgPBM44GlPRYm1oMaZIje8fjkb9DnZqi6+co
         xt4Q==
X-Gm-Message-State: AOJu0YzXQ97x9eEnI7gXCgbTi0UpgKUvckyew7NcMKvHCKOggDabd4Tq
	hjVPpcIh9grGXMOOrS5OPHNBv53/38Qf8vhaRKkZm9/vjzCdUXboqlwbZzf0oGY=
X-Google-Smtp-Source: AGHT+IE6GCioeFfg4HiZrsz6Cl5e5GY5KcxSHENj0nKhypaiNL6mNmWQm+n7pQsPj7suFhm7lwYs6g==
X-Received: by 2002:a17:903:2112:b0:1d7:1e5d:ab3e with SMTP id o18-20020a170903211200b001d71e5dab3emr2991747ple.87.1706042969664;
        Tue, 23 Jan 2024 12:49:29 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::d592])
        by smtp.gmail.com with ESMTPSA id i5-20020a170902c28500b001d73a2acc0csm5083794pld.283.2024.01.23.12.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 12:49:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-pytest-mock: Fix ptest failures with python 3.12
Date: Tue, 23 Jan 2024 12:49:27 -0800
Message-ID: <20240123204927.3953238-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 20:49:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108440

Fixes following regressions seen with python 3.12 upgrade

AssertionError:
Failed ptests:
{'python3-pytest-mock': ['tests/test_pytest_mock.py::TestMockerStub::test_failure_message_with_no_name',
                         'tests/test_pytest_mock.py::TestMockerStub::test_failure_message_with_name[None]',
                         'tests/test_pytest_mock.py::TestMockerStub::test_failure_message_with_name[]',
                         'tests/test_pytest_mock.py::TestMockerStub::test_failure_message_with_name[f]',
                         'tests/test_pytest_mock.py::TestMockerStub::test_failure_message_with_name[The_Castle_of_aaarrrrggh]']}

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-pytest-mock/403.patch      | 92 +++++++++++++++++++
 .../python/python3-pytest-mock_3.12.0.bb      |  4 +-
 2 files changed, 93 insertions(+), 3 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-mock/403.patch

diff --git a/meta-python/recipes-devtools/python/python3-pytest-mock/403.patch b/meta-python/recipes-devtools/python/python3-pytest-mock/403.patch
new file mode 100644
index 0000000000..6787c2a3dc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-mock/403.patch
@@ -0,0 +1,92 @@
+From 8480bb6d0500f933be039cfec65e04157e6ecffe Mon Sep 17 00:00:00 2001
+From: Bruno Oliveira <nicoddemus@gmail.com>
+Date: Tue, 19 Dec 2023 08:24:23 -0300
+Subject: [PATCH 1/3] Fix tests for Python 3.11 and 3.12
+
+Fixes #401.
+Upstream-Status: Backport [https://github.com/pytest-dev/pytest-mock/pull/403]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/test_pytest_mock.py | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/tests/test_pytest_mock.py b/tests/test_pytest_mock.py
+index 3ee00da..7acb361 100644
+--- a/tests/test_pytest_mock.py
++++ b/tests/test_pytest_mock.py
+@@ -246,9 +246,8 @@ def __test_failure_message(self, mocker: MockerFixture, **kwargs: Any) -> None:
+             msg = "Expected call: {0}()\nNot called"
+         expected_message = msg.format(expected_name)
+         stub = mocker.stub(**kwargs)
+-        with pytest.raises(AssertionError) as exc_info:
++        with pytest.raises(AssertionError, match=re.escape(expected_message)) as exc_info:
+             stub.assert_called_with()
+-        assert str(exc_info.value) == expected_message
+ 
+     def test_failure_message_with_no_name(self, mocker: MagicMock) -> None:
+         self.__test_failure_message(mocker)
+
+From c596504e062be06475b03122c9c0cc732ae87840 Mon Sep 17 00:00:00 2001
+From: "pre-commit-ci[bot]"
+ <66853113+pre-commit-ci[bot]@users.noreply.github.com>
+Date: Tue, 19 Dec 2023 11:24:38 +0000
+Subject: [PATCH 2/3] [pre-commit.ci] auto fixes from pre-commit.com hooks
+
+for more information, see https://pre-commit.ci
+---
+ tests/test_pytest_mock.py | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/tests/test_pytest_mock.py b/tests/test_pytest_mock.py
+index 7acb361..c185f2a 100644
+--- a/tests/test_pytest_mock.py
++++ b/tests/test_pytest_mock.py
+@@ -246,7 +246,9 @@ def __test_failure_message(self, mocker: MockerFixture, **kwargs: Any) -> None:
+             msg = "Expected call: {0}()\nNot called"
+         expected_message = msg.format(expected_name)
+         stub = mocker.stub(**kwargs)
+-        with pytest.raises(AssertionError, match=re.escape(expected_message)) as exc_info:
++        with pytest.raises(
++            AssertionError, match=re.escape(expected_message)
++        ) as exc_info:
+             stub.assert_called_with()
+ 
+     def test_failure_message_with_no_name(self, mocker: MagicMock) -> None:
+
+From 6da5b0506d6378a8dbe5ae314d5134e6868aeabd Mon Sep 17 00:00:00 2001
+From: danigm <daniel.garcia@suse.com>
+Date: Wed, 20 Dec 2023 16:02:13 +0100
+Subject: [PATCH 3/3] Update expected message to match python 3.11.7 (#404)
+
+https://github.com/python/cpython/issues/111019
+
+Fixes #401.
+Closes #403.
+---
+ tests/test_pytest_mock.py | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/tests/test_pytest_mock.py b/tests/test_pytest_mock.py
+index c185f2a..01534a4 100644
+--- a/tests/test_pytest_mock.py
++++ b/tests/test_pytest_mock.py
+@@ -25,6 +25,8 @@
+ 
+ # Python 3.8 changed the output formatting (bpo-35500), which has been ported to mock 3.0
+ NEW_FORMATTING = sys.version_info >= (3, 8)
++# Python 3.11.7 changed the output formatting, https://github.com/python/cpython/issues/111019
++NEWEST_FORMATTING = sys.version_info >= (3, 11, 7)
+ 
+ if sys.version_info[:2] >= (3, 8):
+     from unittest.mock import AsyncMock
+@@ -240,7 +242,9 @@ def test_repr_with_name(self, mocker: MockerFixture) -> None:
+ 
+     def __test_failure_message(self, mocker: MockerFixture, **kwargs: Any) -> None:
+         expected_name = kwargs.get("name") or "mock"
+-        if NEW_FORMATTING:
++        if NEWEST_FORMATTING:
++            msg = "expected call not found.\nExpected: {0}()\n  Actual: not called."
++        elif NEW_FORMATTING:
+             msg = "expected call not found.\nExpected: {0}()\nActual: not called."
+         else:
+             msg = "Expected call: {0}()\nNot called"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-mock_3.12.0.bb b/meta-python/recipes-devtools/python/python3-pytest-mock_3.12.0.bb
index ac6f8e8313..bad3df11ae 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-mock_3.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-mock_3.12.0.bb
@@ -9,12 +9,10 @@ SRC_URI = " \
     git://github.com/pytest-dev/pytest-mock;branch=main;protocol=https \
     file://run-ptest \
     file://0001-test_pytest_mock-skip-args-introspection-tests.patch \
+    file://403.patch \
 "
-
 SRCREV = "69adc6f76c1a7baf4e7a728da9eec38741d5783e"
 
-SRC_URI[sha256sum] = "fbbdb085ef7c252a326fd8cdcac0aa3b1333d8811f131bdcc701002e1be7ed4f"
-
 inherit setuptools3 ptest
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
-- 
2.43.0


