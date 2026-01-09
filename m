Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C9C0D26D7B
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 18:03:31 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16296.1767981807736060044
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jan 2026 10:03:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bFUlR5BI;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so32002875e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 10:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767981806; x=1768586606; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4OA1Rfl3stzLpDJRFyKeTuw3TItMgJPPFtI0hG9VzQ8=;
        b=bFUlR5BIV8BAPqhel1R0lW4E7fsqfUM1ZD0M+hsk+H1o14Sw4RmXp035o5rergXTo7
         8bg+7gYCWLIhe9TeDOBbgKO81xoE9UJY1DCGkBqFgkFd1oOo+ZoqYa63cO3xsdiYKw05
         PVAzIStSNGzRJdNktBmQ+VoJFhKzlxyiHKS0CzWdmMJnFKILZndWy+6CScQ/0REcVLyq
         OoN6UnD+9MTvCZ/4lOolXt12P+wupUw53vLBP1SO3TgDDnnkm22QwiYdBGtaIPuqV/5F
         0LSsKjyOMjdoBJN+G4C157AFhCZnKQgoZ5CNPGcpdMb3KxfWs1hUpJS1oZyeyUFrDARV
         n2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767981806; x=1768586606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4OA1Rfl3stzLpDJRFyKeTuw3TItMgJPPFtI0hG9VzQ8=;
        b=EScyZrmQJZF1OSLN1urlDjPMXbBymKYoXlPrUkaMYxtFXAKj6ePLRXro7Lsu8uSF/G
         bMhINziQ1ar3xYxzluFa7ptfqW8YtKlX3WHPEhXP7QdXBTHBM1txx2wj5JZOfsyefdq7
         HSvpMEMoDY5+XKCSv6SorvzE7yD+uKIMCnHf6xCPfx/3Gqkqakzs43sLlXglQg+5Htbf
         DgudATJWvq9c+VuKf22EMGl+Yk8rXVJjtbIJXIwH9xLDDpBJjWn6P+g5vrthGMf0B8qf
         psbtz8jX20u1rZAb2Tmq/KDeaMhXtrzR7aual/aP9+KKZ3ybXXjHLImFQoRHSO9vLvp6
         Qfhg==
X-Gm-Message-State: AOJu0YyDmjIsvNJskYPntBwbd08TF99DLbwET61gSYyIBgNIoplHpguY
	TOlijPnz9JJf+WPFMH1nezABwvwJEpYh+WDx/UtLRg8xGdVyugLhy6bW4baxaA==
X-Gm-Gg: AY/fxX6Wdv6vXAd3w8IzljuEpqf62MbmXuLeQ8/dEzA2KqUgUrpDLfnOR/JpfH/5/Hh
	hdfhnfdEmKNB+5GN7BuKIc2sMui4e39znDRTFOqxEyfIw0RLGGFKbjSEimEZ3xgkWHlDSRZbtLc
	JudL0NTGLIKLSmSdiqwO5xB6XKL0jZlKVKT2sv/3cFchWqXMM8dvpa4uVVIPo4pdxy58AZoKbs2
	qI6+um0LVERlZ7UqfsSwgPFQQDpBwheLTWyW3WVWKrqwoSbhoAHJ3eNpjzy8s2f6x/hBNCVgOzk
	q9FNbuA7lt4kZn2yb5aHYJ5yTE+gULcfRxN1CCVdkOW9W8S9T88vTsOpQ4aqomxeWaxlftnoXmA
	eYCFiYlqO0mVfYs6E0OjFHtIpZ1+9iUtATWPcm6znLV5/eigiYeaKdG11ONCGguuspRvlJiwnjA
	fL1IDrZRoL
X-Google-Smtp-Source: AGHT+IGJjTNQDZXJaNTucConuGT89/pAsayYPn6QuL4epl5LL49J/e9TIrYBEDsq/RMpFbq7VIpOyA==
X-Received: by 2002:a05:600c:a04:b0:47d:5dae:73b1 with SMTP id 5b1f17b1804b1-47d84b3b668mr135307965e9.23.1767981805659;
        Fri, 09 Jan 2026 10:03:25 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df9afsm25563450f8f.24.2026.01.09.10.03.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 10:03:23 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/2] python3-send2trash: add ptest support
Date: Fri,  9 Jan 2026 19:03:21 +0100
Message-ID: <20260109180322.4028207-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 18:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123310

The tests take less than a second to execute.

The current source distribution is missing a test file,
which I added with a patch. The problem is already solved
by upstream just not tagged yet - the patch can be dropped
with the next update.

Sample output:
root@qemux86-64:~# ptest-runner
START: ptest-runner
2026-01-09T17:11
BEGIN: /usr/lib/python3-send2trash/ptest
SKIP: tests/test_plat_win.py:tests/test_plat_win.py # SKIP Skipping windows-only tests
PASS: tests/test_plat_other.py:test_trash
PASS: tests/test_plat_other.py:test_multitrash
PASS: tests/test_plat_other.py:test_trash_bytes
PASS: tests/test_plat_other.py:test_trash_unicode
PASS: tests/test_plat_other.py:test_trash_topdir
PASS: tests/test_plat_other.py:test_trash_topdir_fallback
PASS: tests/test_plat_other.py:test_trash_topdir_failure
PASS: tests/test_plat_other.py:test_trash_symlink
PASS: tests/test_script_main.py:test_trash
PASS: tests/test_script_main.py:test_no_args
============================================================================
Testsuite summary
DURATION: 1
END: /usr/lib/python3-send2trash/ptest
2026-01-09T17:11
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../0001-add-missing-conftest.py.patch        | 52 +++++++++++++++++++
 .../send2trash/python3-send2trash/run-ptest   | 10 ++++
 .../send2trash/python3-send2trash_2.0.0.bb    |  4 +-
 4 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-extended/send2trash/python3-send2trash/0001-add-missing-conftest.py.patch
 create mode 100644 meta-python/recipes-extended/send2trash/python3-send2trash/run-ptest

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index cdec25f876..a297441bf6 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -94,6 +94,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-rich-toolkit \
     python3-schedule \
     python3-semver \
+    python3-send2trash \
     python3-serpent \
     python3-service-identity \
     python3-setproctitle \
diff --git a/meta-python/recipes-extended/send2trash/python3-send2trash/0001-add-missing-conftest.py.patch b/meta-python/recipes-extended/send2trash/python3-send2trash/0001-add-missing-conftest.py.patch
new file mode 100644
index 0000000000..1592fd661c
--- /dev/null
+++ b/meta-python/recipes-extended/send2trash/python3-send2trash/0001-add-missing-conftest.py.patch
@@ -0,0 +1,52 @@
+From ed6d20884108fd7e681baf7278e38ac4800fb5c1 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Fri, 9 Jan 2026 18:04:08 +0100
+Subject: [PATCH] add missing conftest.py
+
+Conftest.py is missing from the source dictribution of v2.0.0,
+making the tests to fail.
+
+The issue is already solved by upstream, but not tagged yet.
+This patch can be removed with the next release.
+
+Upstream-Status: Inappropriate [workaround until https://github.com/arsenetar/send2trash/commit/f8a40143f696da41f81cae87e1c7f9a345cd4003 is tagged]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ tests/conftest.py | 27 +++++++++++++++++++++++++++
+ 1 file changed, 27 insertions(+)
+ create mode 100644 tests/conftest.py
+
+diff --git a/tests/conftest.py b/tests/conftest.py
+new file mode 100644
+index 0000000..0753384
+--- /dev/null
++++ b/tests/conftest.py
+@@ -0,0 +1,27 @@
++# encoding: utf-8
++import sys
++import os
++from tempfile import NamedTemporaryFile
++import pytest
++
++# Only import HOMETRASH on supported platforms
++if sys.platform != "win32":
++    from send2trash.plat_other import HOMETRASH
++
++
++@pytest.fixture(name="test_file")
++def fixture_test_file():
++    file = NamedTemporaryFile(dir=os.path.expanduser("~"), prefix="send2trash_test", delete=False)
++    file.close()
++    # Verify file was actually created
++    assert os.path.exists(file.name) is True
++    yield file.name
++    # Cleanup trash files on supported platforms
++    if sys.platform != "win32":
++        name = os.path.basename(file.name)
++        # Remove trash files if they exist
++        if os.path.exists(os.path.join(HOMETRASH, "files", name)):
++            os.remove(os.path.join(HOMETRASH, "files", name))
++            os.remove(os.path.join(HOMETRASH, "info", name + ".trashinfo"))
++    if os.path.exists(file.name):
++        os.remove(file.name)
diff --git a/meta-python/recipes-extended/send2trash/python3-send2trash/run-ptest b/meta-python/recipes-extended/send2trash/python3-send2trash/run-ptest
new file mode 100644
index 0000000000..d8d5e7bd08
--- /dev/null
+++ b/meta-python/recipes-extended/send2trash/python3-send2trash/run-ptest
@@ -0,0 +1,10 @@
+#!/bin/sh
+# Not all tests can run as root
+useradd tester || echo test user already exists
+
+# The test are running in /tmp folder by default, but
+# the tests expect the test folder to be a regular folder, not
+# a mount/symlink. Specify the TMP folder explicitly.
+export TMP=/var/volatile/tmp
+
+su tester -c "pytest --automake"
diff --git a/meta-python/recipes-extended/send2trash/python3-send2trash_2.0.0.bb b/meta-python/recipes-extended/send2trash/python3-send2trash_2.0.0.bb
index 0bd89f887a..48dc8e793f 100644
--- a/meta-python/recipes-extended/send2trash/python3-send2trash_2.0.0.bb
+++ b/meta-python/recipes-extended/send2trash/python3-send2trash_2.0.0.bb
@@ -2,8 +2,10 @@ SUMMARY = "Send file to trash natively under Mac OS X, Windows and Linux"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a02659c2d5f4cc626e4dcf6504b865eb"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 
+SRC_URI += "file://0001-add-missing-conftest.py.patch \
+            file://run-ptest"
 SRC_URI[sha256sum] = "1761421da3f9930bfe51ed7c45343948573383ad4c27e3acebc91be324e7770d"
 
 PYPI_PACKAGE = "send2trash"

