Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D585CD0EE22
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 20:21:59 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3577.1764102115833210748
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 12:21:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TfGWF8WI;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-640c6577120so10649256a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 12:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764102114; x=1764706914; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Al7kCAYxoUDRpDosm0ynpGllmm3KdN7i4dukgiPSM+Y=;
        b=TfGWF8WIgoIpmBKdDzyPQ8KFmblvEdLt/+7rxXoE3TswTays4sPiKmODunU/7zs6HV
         v76Y8ztjy/aK5+EVdgcc7x8DCmeIQONoIrE/ASyjJnTkewEtX8Fn2F91WVQz8KkednH5
         1nruW0eQA1rfLwDDitUDgty6A/vSdr/cpfbjNshbLafcKhBwpbHUbYtVY41c48EbKjVc
         Or7Xp/gdZ5PmegAp/WbHrvP8xl4W6orf8S4inciTQAUf1ArykepOfH1wF2V0vM3pBBRC
         V0/M69w3n0iS2/Xc1QwLQz4MbX3VluBr+LZGM+o0fwmUBtXv3yS39jweXM7PI/+lmJoZ
         kfKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764102114; x=1764706914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Al7kCAYxoUDRpDosm0ynpGllmm3KdN7i4dukgiPSM+Y=;
        b=oaaD8Q1jk2AJiVMC/JXGdsAPn8FU7KGKpS8wwXtaF65TkFyiH/zZKzdS8u/Pq06OTm
         NYJHlANh89FZqMdhhfv0PlRyn7Eo8F1TNut53qZU16cWFj49KfoUySv1S/9mKWhHj7Oo
         9wh9hxyJeOKWfdM1J62WOVmc+We7lszoWrGZySwW8rh33/DeIds3icq/WK3EUAidu6Ur
         2bo7nLXGkqz304LZWq4699KXm+d7bnhm+O/JPEdTcvVSNP8ZpBS1QWUv8Du8vUQh49HU
         JKn5aERo03C2lCZmEelAKdBLP0PnSHWveE3vSPtvH9I8GA/jdhs4xzelYzoolHjmQ6Sj
         Iqxg==
X-Gm-Message-State: AOJu0Yz5V/NEHpR+C0EJXhI/NmUmhlyL/z0MZ3y6K0I68EI/ebPx3qLh
	tMf1SXmrCQN/RIN7h0ILRZ86bCngjt0G/2Ainy6aiVPWrA4hAOF6S/8NQUGtMw==
X-Gm-Gg: ASbGncsvMWQZchN8NNAAk4AUReIZRQCxRvB7hMEbkhP5J5vhLdG6PIXtUrpoIvI/Y68
	6LMGterQuApblr25L6SkzVp9FFjF2Tn5JmL3wX5PfsCN+hXIdxO08obcIz4P4ddyng7janx+aJh
	vBXVNAHjsJGNMBXj4WULhYMQlN3A2WpD4qufkUeBEIY6M1QJ70cJz3pjrfw5y3uDrzJ98oU3kZM
	OJof6ZexAFN6zjupL8IK84ok5MKCVHVdKGewTvrgmU3xVKLuzIUTIb7H5pU/T2b+j85jc7M8aUq
	TKMIrssPYzB5pXtKEPOtq3BI1rB8Wvapp3NeedrMU8DO7lnORh85PWlNGhSqwWOiakqjrPcansj
	SogzVi+6KTLdPxh/0c5DQWKptmohBJJlDixwrM81ak3viAdcPx6L7e3/ik985Eb57d4fOZM3hIQ
	zrNA2ehuEw5v4+5fzwG3ph7pnmQq5TzOV8lSx+/j9r5MJX1wSvYSKjF/CyNozzGouUfOx14znJF
	zU=
X-Google-Smtp-Source: AGHT+IE5YAvzWxQvRwe6FubBWZ4zvuvV4KiFpPilULM7/PQn1b9bry5ZEyLcyfnzMh16orBeNEhXKw==
X-Received: by 2002:a17:907:3f17:b0:b73:7440:bd3a with SMTP id a640c23a62f3a-b767173e72bmr1800434066b.40.1764102113574;
        Tue, 25 Nov 2025 12:21:53 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654fd4f59sm1626888466b.36.2025.11.25.12.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 12:21:53 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH] new recipe: python3-pytest-picked
Date: Tue, 25 Nov 2025 21:20:49 +0100
Message-ID: <20251125202048.3753948-2-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 20:21:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122062

Sorry for the additional email. The previous patch still contained an erroneous line.

Description: Run the tests related to the changed files
Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../packagegroups/packagegroup-meta-python.bb |  1 +
 ...g-tests-to-capture-only-ptest-output.patch | 50 +++++++++++++++++++
 .../python/python3-pytest-picked/run-ptest    |  5 ++
 .../python/python3-pytest-picked_0.5.1.bb     | 20 ++++++++
 5 files changed, 77 insertions(+)
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
index 0000000000..dfb50ace75
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-picked/0001-adjust-failing-tests-to-capture-only-ptest-output.patch
@@ -0,0 +1,50 @@
+From b9341394314e5dcaca0aa1d91fc3af28c64db387 Mon Sep 17 00:00:00 2001
+From: Tom Geelen <t.f.g.geelen@gmail.com>
+Date: Tue, 25 Nov 2025 20:42:15 +0100
+Subject: [PATCH] adjust failing tests to capture only ptest output
+
+The tests should only check for warnings emitted by the plugin itself,
+not for any other warnings that may be emitted by other plugins or pytest
+itself.
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


