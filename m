Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B29E1D0EE18
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 20:08:09 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3261.1764101287627102820
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 12:08:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KiUT8xoS;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b737cd03d46so807079666b.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 12:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764101286; x=1764706086; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h9pMRcpkmt3T8JEh8G/F6lEhdXChCRUvWu6n/Ut1VQ4=;
        b=KiUT8xoSIDQrFtIInqtT4fotY4Ovx+0k+1q3ISOdG8q0eMIGcyWRUgqjciFiwk8SAk
         3ffcvkAsInnYUv4MNJfwU9zwk8Hlefl5c18aKWERuxkGC0VwwzIl6TdCOVGRdpCprLnK
         YFIo23ykin3lohjeyQ+TRzLh2OvQfJnaQWZk7e+/EG9J+kLNN1yOFbyCurNaArN4+Iq9
         Kghv/75vnAb/S4eXFU6JVtKERuAs8ifKSJCCPz7Yw+5C+i4gLjVL1tFEyJH1p4q7oTu7
         xZ6S/vA5zIfqwfIs7MnU5qD6+JjITYxO8EopUxAO6QYImTys03TTgtk4WXqXi/SAZUD6
         XFkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764101286; x=1764706086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9pMRcpkmt3T8JEh8G/F6lEhdXChCRUvWu6n/Ut1VQ4=;
        b=q+XvecbaQUYZqMNGvSuXOeEF6SLFiiBceEeKL75IyViSzfqrPmBJYMb+T8OHHHjJMM
         yz+vX0QR4C9p+TzMoW9tMBk1DKmp7rh2cJbbF7FGrC++0ot7AWsPu0Df8KC5opKQNT31
         JLNa2/8w76kDKHDYVVHnz/pBgeehQ5qiDRwOwM8ke2aSNKv1F5AahXHuFR51lvWRL5mK
         X0zONzQLLZHMSyBVfp+IlY3bpq2dRNeZxTEF+YalM76zmtDj+e7zx3NytbyJJeslyDTR
         p7WAvpUXALpCWvzBwOhH7wEO+J2SWjDg5Diu4nUwUZEG3tFXjEq98UpCbPNPaLBYdaZK
         pukA==
X-Gm-Message-State: AOJu0YxYpBEW7W4xVmBPb3Zp8M71RaNQyu5+kvhcKvzdRxtvT/vcQvgw
	HtHtPpdPTOFv6pxhHGjloWdrKbpfupD24syamfRGCKJbtd/aoehw/oJpg6lpCg==
X-Gm-Gg: ASbGncs28W2gl/8gkDk3pykvuclmPIKY2zqQR5VyqKfnY9ZITjJ9IP1x1bQCP59Y4vp
	d5Yaz2+6CRnMt4FSrnR4snXiOx+vHHxJwyDKt9sXY4WHBXU6bVQtt4aNjocYuZP0w/GD3rbGKBz
	sMR8Q+VUL6qltFPEmUO3I9p1bq4vHvPatM9AOIe9xFVzXXb/0zgsAvXwi6JSI33XO9ZOgcob2SU
	6QrWNt+7YQiCjBF/HQynxvZz4RyFAbagwYGUh0fk5UyZwK36OjctStsT/zAjrNL19+0N4QmH0nU
	QViuJSAcQ+64PfoxpfiWaBClRK3aStJlhN+yg9bTnetSgYPVJ64ba4lUz+hvGPVCxjTHSMX3a+/
	ZXehB1ICwbQ7p+x7LZO3EL/dQdzQDlYwJPVqIq/U1M1ntbFABuLxLEkfz+x2uqFSnE59H6UN5gI
	ozfu3Sw2PlmVyNiHUywKjwP63vHUALOoEwPwcJbunQGm3hd2cMW5ddBifeau6O6Wp6
X-Google-Smtp-Source: AGHT+IGtDnABJUs7lfu2cpNiJItbxHq6HOwmLIJeO1hP/gN1/Ujsy51ZeXRgzSPQGgIEXzKk68vhfQ==
X-Received: by 2002:a17:907:a0d:b0:b70:be0b:6ba8 with SMTP id a640c23a62f3a-b76719d9598mr1735262366b.61.1764101285375;
        Tue, 25 Nov 2025 12:08:05 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76550283f4sm1639477466b.55.2025.11.25.12.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 12:08:04 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH] new recipe: python3-pytest-picked
Date: Tue, 25 Nov 2025 21:07:43 +0100
Message-ID: <20251125200743.3730553-2-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 20:08:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122061

Description: Run the tests related to the changed files
Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../packagegroups/packagegroup-meta-python.bb |  1 +
 ...g-tests-to-capture-only-ptest-output.patch | 50 +++++++++++++++++++
 .../python/python3-pytest-picked/run-ptest    |  5 ++
 .../python/python3-pytest-picked_0.5.1.bb     | 22 ++++++++
 5 files changed, 79 insertions(+)
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
index 0000000000..6636ede2ed
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-picked_0.5.1.bb
@@ -0,0 +1,22 @@
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
+
+INSANE_SKIP:${PN} += "buildpaths"
-- 
2.43.0


