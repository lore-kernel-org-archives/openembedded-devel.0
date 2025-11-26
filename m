Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41CF7D111AA
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 21:58:12 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5552.1764194288980973850
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Nov 2025 13:58:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tr4iou17;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b73545723ebso52621066b.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 13:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764194287; x=1764799087; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6/hAjYY5uooW9lcXcUxL7ayr61YW4WXwIzENt6Xfo5M=;
        b=Tr4iou172oMBer02f5hctqBv75zIseRH9mwWg2fSXO44CrQll+tFhfJuHDrZOFct+k
         9XuITABz31JSqYGw73FHg4QDGwoSSXxay8tp98dH1uXAbP8ctAREc6XdcNrQMQE9Wj69
         2QjjMWU9XEH7tWLFxiQ1ybs1Pq4KAGDYXvyranUzZseK2H93BkWIvXt325UDevU5elCq
         7Umdz+bWg9PW5FnyEijp6YBkVvtP4nENRtk3UxvBCSjhOr8K5xKLyxI1FMgkDYBAiqz8
         4vEtAHhEBy5cm/pP/tLZldryNtXiAr0LM6/jxQtMahMsG79oeDFahF4PctjHBtJ1prIH
         s50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764194287; x=1764799087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/hAjYY5uooW9lcXcUxL7ayr61YW4WXwIzENt6Xfo5M=;
        b=lOeiE6RP2e5gdD117AI9uEtohgIC8EPWyn9j+rRklh1tDLQFsIFGT/63xPwJ2TQalt
         kx8vGVWa9nkdPHYA1UAum3QO2nNIpSLs1hwfAkWTItCEa9ITLC3gt8juIn1zkn5j/mjX
         QbDLM+R8LcqueAGj8NhL47KPHRLlPczkQSbBgxOIRWhMb5d7h5uQnUAaxve8XDIXpw5v
         8mcd7IIPLHy5qmph2lPhfw8Sb3EWjN5GIBfw7FEQZXBaauo4aD61tgQuOd8lhXWeV0ia
         yU50FsWHRcU/ngxSoltty3NFcCN4C6VA2lfoAAUPtIuUgi6XIxWcIsJ/ZDjaBKVLLJUz
         cQzA==
X-Gm-Message-State: AOJu0Ywq0r2MMvSu5vJ4EaKmsBfaQinC9ma/aQmWrs9UnWnZL+xs4rO8
	PopUoCw+W2vCPa6crtQYQlHfWhFrdAc6uOJG0bkvI5HqlmkxWURAO2FaqsTxFA==
X-Gm-Gg: ASbGncspfuP5v+F0EA2XfOKN08PiZhRWb8Sh8ejYysdvXdnovqsLXh7zCm6MhPJXLgj
	cGLxHuYLqtLyhslXSvWdRHgVAtq8ODgIm2YHkWdiAbxpfM5FKuczd8nKXF3faVtc/w3MTCbstFn
	rHcCYe8UYuUrvniNtiiiTiasVJ1AjEg7cXnIFIpnMs9I6XoyPJ8QBw2atr6560Amz4x4Kk22XBW
	L+GWZyAbAFuOWbcB42QqGvbXFRzhE4pEzx3LEeh4WG3pY4B9JMISwGfztZejtpvShKgU88buEsg
	7XU30msKsuzGYeoct/CLmjsd7sPdVlLNcKL4cdOXSVVc27VVQOhIRn/b7AEcXim7d4NuRyEthx8
	ExMuRl6JnRd/s+E6Ue4S1XRyi5LWkXu661FlEXReqcLO9gbw5pCQznsFIIn6v0/q95rgTGkm/2M
	EzDe1kvz0pLx/HqMcExCZauZehrgxzOTcBi+Wj3reUM/iej4Gq/K7qLMowgMrHu12/
X-Google-Smtp-Source: AGHT+IGVtahW32vgcgN8jR3rYD2y6VpLBqT5fSWBxfMSpEBTWkbiKvjX7/kc4Xoa4LYcNnLd3uOzpg==
X-Received: by 2002:a17:907:72c2:b0:b71:29f7:47ef with SMTP id a640c23a62f3a-b7671b50083mr2245502166b.61.1764194286429;
        Wed, 26 Nov 2025 13:58:06 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654d7cb3bsm2009071266b.27.2025.11.26.13.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 13:58:05 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH v3] New recipe: python3-pytest-picked 0.5.1
Date: Wed, 26 Nov 2025 22:57:19 +0100
Message-ID: <20251126215718.286295-2-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 21:58:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122094

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


