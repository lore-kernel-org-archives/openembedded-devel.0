Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AADCCD111BD
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 23:25:52 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7037.1764199545948795285
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Nov 2025 15:25:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=njryPLOB;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b7370698a8eso39501066b.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 15:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764199544; x=1764804344; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6/hAjYY5uooW9lcXcUxL7ayr61YW4WXwIzENt6Xfo5M=;
        b=njryPLOBg+hxYtSbK3yn5qE64sJFNh0iUBSfN7YutEh9a2WXMFOKo4UAuxHkkAn2c2
         YzvOH8qd9uZdmzJhVrrwmczDVWo7DISdvFS4+FlJkzvrzQZVtmjvdRer3dKhnqFPIjVd
         tfyoVBJPKLFgMx25lwOSW9fOC9RV1Ip/qHVk4femdzshlBqBUt334sWKPyItc/VTO/AC
         T5lnLHVvFBUAtX8GizYNe3A0lCfeZBXnPfPgoJFwKqM7EJz0rPUkEiN+5OsqPGKzj1BD
         l3HZBlVsAJwf7tadgHE/RdkymP4ORVfb9Mi7KTsMOlMalqjbWOoJfwszXEbscQxdTmY7
         x7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764199544; x=1764804344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/hAjYY5uooW9lcXcUxL7ayr61YW4WXwIzENt6Xfo5M=;
        b=bIean2I25nxRCgnie3Og2PFSRefTPenkNh3NHN0640NLa1RGtbokywCSl0g9ogvSg6
         om5eg1eXPYR/DjH7oH/P0OfgE9+BeJckXrIshBIU0Db12l+8EtwYTXth5gkXjU+lcRsg
         HqTQlCp6RDcNU/CcqpWWZ0HQWl16FmXTACGfYBNsprKYLOj50UYPxkypNv7xd1cwxDs/
         GnbTWfnI4Q3tjj7DvL4ztdOKxy3ioB7tiHCQ/XX47H3D/9BH0FMX03S1UegmXucKnhv0
         Mj9Y1DBJFfTLHvR5bka0D/gK27Z1bMLxBkdhMYm15yjBeWljlIepyTU1M7k/m38i5cry
         EPHA==
X-Gm-Message-State: AOJu0YwqKrYTxiGFVnxDdz+YHkTfB+PC2qPVVrMM1rjlVJzHviCZwFvE
	YzVb2IGGl8iPryRAPu8JSuo+U7AyKgSWN51gqpsT1dwYqcvcN9BUwML/Rx5BzA==
X-Gm-Gg: ASbGnctHSgykpqURG+xXRGOp8CFzDyASgHBDdMnl6bVDhHW/A7qTOQD2wTGEGrW6D+l
	V3rhBagVTdCzEwe6INOh0eUftdwLqN4koL5TnBNKZQWhMrt2ny5/XXwpMU26juk7jy6E0BT4wFN
	h6dICrICucYAelew1lV0s0DaRgBky70XORmcaDjcSCsRbaaAgSqJynISQbxlO3jkVDfJXapFa6G
	tOsI8bAnBe7mlZ5y8uqfPjlYZTLvb0ooDSNF8+07zCFmVoX/zvwdV/fQ19ewwkqdxuBMOmMQV4X
	16Me8rc4U52BcMz3J+6srPbJcLz1+ecHytsU2vNtaGq5AfSRmxD8N4ENUHF9PQ4AA2lsHkm2TvG
	FfjyG5wzhg+Co6mTLrmQ9HDVkpiqthkdgSyzFV3jUt44zebQD2ccJuRlRLq5E2vVdIG2dheYqTt
	3/SeMHGyUZkjXnHOy+fj8uxuWjsAYOVlJyGjcXKFvf2+8LMRoLH2ZRK5UsedNY37zs
X-Google-Smtp-Source: AGHT+IEqXlr02kULPR64EB8d8SAGN6gLaUoL57YrMqg7txF3YVydX3NH0uFEgexD4pETArZmK5fDGA==
X-Received: by 2002:a17:907:741:b0:b76:3548:b741 with SMTP id a640c23a62f3a-b767153f880mr2381205066b.10.1764199543738;
        Wed, 26 Nov 2025 15:25:43 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59aea6bsm682266b.35.2025.11.26.15.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 15:25:43 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH v4] python3-pytest-picked: Add recipe for version 0.5.1
Date: Thu, 27 Nov 2025 00:25:22 +0100
Message-ID: <20251126232521.1133242-2-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 23:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122099

Python package description: Run the tests related to the unstaged files or the current branch (according to Git)
More information: https://pypi.org/project/pytest-picked/

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../packagegroups/packagegroup-meta-python.bb |  1 +
 ...g-tests-to-capture-only-ptest-output.patch | 51 +++++++++++++++++++
 .../python/python3-pytest-picked/run-ptest    |  5 ++
 .../python/python3-pytest-picked_0.5.1.bb     | 20 ++++++++
 5 files changed, 78 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-picked/0001-adjust-failing-tests-to-capture-only-ptest-output.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-picked/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-picked_0.5.1.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index a172f8c676..1cb419a721 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -76,6 +76,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-pyserial \
     python3-pytest-httpx \
     python3-pytest-mock \
+    python3-pytest-picked \
     python3-pytest-sugar \
     python3-pytoml \
     python3-pyyaml-include \
diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index ad68d74205..d3abc0761f 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -351,6 +351,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-pytest-httpx \
     python3-pytest-lazy-fixtures \
     python3-pytest-metadata \
+    python3-pytest-picked\
     python3-pytest-tempdir \
     python3-pytest-timeout \
     python3-pytest-xdist \
diff --git a/meta-python/recipes-devtools/python/python3-pytest-picked/0001-adjust-failing-tests-to-capture-only-ptest-output.patch b/meta-python/recipes-devtools/python/python3-pytest-picked/0001-adjust-failing-tests-to-capture-only-ptest-output.patch
new file mode 100644
index 0000000000..b4d7794e47
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-picked/0001-adjust-failing-tests-to-capture-only-ptest-output.patch
@@ -0,0 +1,51 @@
+From b9341394314e5dcaca0aa1d91fc3af28c64db387 Mon Sep 17 00:00:00 2001
+From: Tom Geelen <t.f.g.geelen@gmail.com>
+Date: Tue, 25 Nov 2025 20:42:15 +0100
+Subject: [PATCH] adjust failing tests to capture only ptest output
+
+The tests should only check for warnings emitted by the plugin itself,
+not for any other warnings that may be emitted by other plugins or pytest
+itself. This behavior is caused by the fact that pytest might throw some deprecation warnings
+or other warnings that are unrelated to the plugin being tested.
+
+Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
+Upstream-Status: Inappropriate [OE specific]
+---
+ tests/test_pytest_picked.py | 17 ++++++++++++++---
+ 1 file changed, 14 insertions(+), 3 deletions(-)
+
+diff --git a/tests/test_pytest_picked.py b/tests/test_pytest_picked.py
+index fb2bedb..947b43a 100644
+--- a/tests/test_pytest_picked.py
++++ b/tests/test_pytest_picked.py
+@@ -182,8 +182,13 @@ def test_should_accept_branch_as_mode(testdir, tmpdir, recwarn):
+                 "Changed test folders... 0. []",
+             ]
+         )
+-        assert len(recwarn) == 1
+-        assert str(recwarn[0].message) == "Now `main` is the default parent branch"
++    # Only count the plugin's own UserWarning about default parent branch
++    plugin_warnings = [
++        w
++        for w in recwarn
++        if w.category is UserWarning and "default parent branch" in str(w.message)
++    ]
++    assert len(plugin_warnings) == 1
+ 
+ 
+ def test_should_accept_unstaged_as_mode(testdir, tmpdir, recwarn):
+@@ -211,7 +216,13 @@ def test_should_accept_unstaged_as_mode(testdir, tmpdir, recwarn):
+                 "Changed test folders... 0. []",
+             ]
+         )
+-        assert len(recwarn) == 0
++    # Ignore unrelated deprecation warnings from other plugins
++    plugin_warnings = [
++        w
++        for w in recwarn
++        if w.category is UserWarning and "default parent branch" in str(w.message)
++    ]
++    assert len(plugin_warnings) == 0
+ 
+ 
+ def test_should_not_run_the_tests_if_mode_is_invalid(testdir, tmpdir):
diff --git a/meta-python/recipes-devtools/python/python3-pytest-picked/run-ptest b/meta-python/recipes-devtools/python/python3-pytest-picked/run-ptest
new file mode 100644
index 0000000000..39f369f20b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-picked/run-ptest
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+# need to explicitly call the correct fixture as of pytest 8.x
+
+pytest -p pytester --automake
diff --git a/meta-python/recipes-devtools/python/python3-pytest-picked_0.5.1.bb b/meta-python/recipes-devtools/python/python3-pytest-picked_0.5.1.bb
new file mode 100644
index 0000000000..c7c2183337
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-picked_0.5.1.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Run the tests related to the changed files"
+HOMEPAGE = "https://github.com/anapaulagomes/pytest-picked"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6d374a27c85c3fcc979009952ec16f1b"
+RECIPE_MAINTAINER = "Tom Geelen <t.f.g.geelen@gmail.com>"
+
+SRC_URI += "file://run-ptest \
+           file://0001-adjust-failing-tests-to-capture-only-ptest-output.patch \
+           "
+SRC_URI[sha256sum] = "6634c4356a560a5dc3dba35471865e6eb06bbd356b56b69c540593e9d5620ded"
+
+inherit pypi python_setuptools_build_meta ptest-python-pytest
+
+RDEPENDS:${PN} += "\
+    git \
+    python3-pytest (>=3.7.0) \
+"
+
+PYPI_PACKAGE = "pytest_picked"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


