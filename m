Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 875D6CCFA13
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 17:27:05 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2180.1762795622566387836
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 09:27:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CkepfKeh;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47778704516so8181005e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 09:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762795621; x=1763400421; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kNA67666l2n1LalbX2t6rA9qJOqy0pNdFIR04dtgNJE=;
        b=CkepfKeheBPKeCu3aHuMMGwYfyrqFwM0DYZhR1i4AKjIvsHbFa4XvhT5awT7/MvNyG
         plki1S1rMYr/DXOTpxfieYKZKR1vhU1o61WUXmNNMud8LxIlnhN8Hl/UH1KafTUonVrp
         +oHFS+a5v8RCcrrfp+kPivxZTZlstF1s27/80WiP6f94zSIL516FdvhFfZW+BsgL8DYG
         JittKivGKCuqOVEn/KMuiczldcLefEALqAu+Z0RuvUF/vUVeVv95mOc9li6ZK0vxg8/c
         FMeu1wIicALl6oRbeLlzuZ8kVCYcsiXfuyf/5Ghg24rlnRyt/jvZy6pXcLun1zcd2LY3
         jEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762795621; x=1763400421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNA67666l2n1LalbX2t6rA9qJOqy0pNdFIR04dtgNJE=;
        b=b1yEvsXFtGEmLS5DcGfQwFeA8xNWZMgTfoS+zmhQ/FPW4ve+sB0JryL+hpLeSVxo9C
         1CVVqwzC5RirWeCvBcUINk2j4TurK9/rYP6IOzUSMnn/ez4bXRr4U3EDnwdDOvsALuip
         Ei1Gl6IzlviYDxxaye0ycQPgj3uDrOZOAZCFE8JlSuNsdx5Dl7FcqrSGJBfjE32qH3oA
         g1xC/wLJ56dP7WFMd/DoPZRu8uwviERLo8AAU98t1kMcxs0AIgSn8dQpl9g3wHHmVJMm
         CSIMxWfdo+iw1iqjjUjsBC89gQ0J9caCNJCsTrq25EEoZ2u79CSuR0ky1CYmVAl5AlVD
         BqTA==
X-Gm-Message-State: AOJu0YwtL+OXsapwiGOk0Aq2yT6hlaAeeG+SA5PfiMU3JB6qvq6nQgug
	3UZ8Tp7K+HhpGMHafHMWt5gvg1d3uzuBPpR4XNudj01FM2f5cAL5UJPq5PT7KsSS
X-Gm-Gg: ASbGncs1KSHAAE/arWeGqPA3tXCe0fNrSLgKkc1adGJxU8lQ09d/F3K25TZYFHjevnx
	iJOiQHvgtQjSHPv7JlYuRPOxfKw1VRBexME6LCfi5/HwT0Ugo8tZ2C2v/w20JiHm8gsTC6tkgDm
	JamtpMr800LrAPCcCeK5TZw5wylL/zVYw6BF0lLcCmQoLac1WzZmlz467XRj9sKk7AcaKmLxiZ+
	LFfozzzspfyNnw6UPgdXW62OXDIRSuRVzcGtBm96ExRrbcjLx2kAefWYAWcB+LdOPmYi6xA3l+c
	cHT9DgE4maxfLILHoVfqfRnPu7TAudAEiAnU1llu25HmYvyM7uKSLXl663rB7/j2IhUQMWtHTuQ
	7WfnvtT5Knle7hFTdZtR98Z0UC1mQGI2eByA+AoPnp7spN571JMptVUObD03k8w2lJxjj/2y8zk
	wc47AY6sFdFX6kVFHk6tArEA/zLVQZyRaPH2Us20xvQZ8Kawa4SzJc85ZBPog4H+zBW8tPtCjP3
	p9qPaRI1NGyRCnQnCLftsflwCHa9nUq/6i8ZWbubbuFpMUAQXs=
X-Google-Smtp-Source: AGHT+IF7GbxPCIcPKBol+Ll01+Ui74CPsG8Ek26yaA0q+Z3KiVAHLOfi0eKZVng4S0/2yXafe1I0XQ==
X-Received: by 2002:a05:600c:4e93:b0:46e:37fc:def0 with SMTP id 5b1f17b1804b1-47773239bf6mr75167235e9.9.1762795620510;
        Mon, 10 Nov 2025 09:27:00 -0800 (PST)
Received: from localhost.localdomain (2a02-1812-512-2c00-5cba-763c-2ed2-f98a.ip6.access.telenet.be. [2a02:1812:512:2c00:5cba:763c:2ed2:f98a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775ce2cde0sm334751275e9.15.2025.11.10.09.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 09:27:00 -0800 (PST)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: t.f.g.geelen@gmail.com,
	Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH] python3-python-dotenv: new recipe (1.2.1)
Date: Mon, 10 Nov 2025 18:26:44 +0100
Message-ID: <20251110172650.358256-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 17:27:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121467

Moving the recipe from meta-homeassistant to meta-opemembedded.

+ version bump 1.1.1 -> 1.2.1
+ add ptest
  - exclude 2 tests (oe-specific)
  - added to PTESTS_FAST_META_PYTHON

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 ...y-skip-two-test-when-running-as-root.patch | 39 +++++++++++++++++++
 .../python/python3-python-dotenv_1.2.1.bb     | 22 +++++++++++
 3 files changed, 62 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-python-dotenv/0001-test_main.py-skip-two-test-when-running-as-root.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-python-dotenv_1.2.1.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index f0411f269f..43518ea2c8 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -65,6 +65,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-pydantic \
     python3-pydantic-core \
     python3-pylint \
+    python3-python-dotenv \
     python3-python-multipart \
     python3-ptyprocess \
     python3-py-cpuinfo \
diff --git a/meta-python/recipes-devtools/python/python3-python-dotenv/0001-test_main.py-skip-two-test-when-running-as-root.patch b/meta-python/recipes-devtools/python/python3-python-dotenv/0001-test_main.py-skip-two-test-when-running-as-root.patch
new file mode 100644
index 0000000000..154ab559a4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-python-dotenv/0001-test_main.py-skip-two-test-when-running-as-root.patch
@@ -0,0 +1,39 @@
+From 68e4f05ece6b20e8a7d914d047185483373db759 Mon Sep 17 00:00:00 2001
+From: Jan Vermaete <jan.vermaete@gmail.com>
+Date: Mon, 10 Nov 2025 18:04:27 +0100
+Subject: [PATCH 1/1] test_main.py: skip two test when running as root
+
+Upstream-Status: Inappropriate [oe-specific]
+
+The patch will only work for Linux and not for Windows.
+And it's not common to run the tests of a Python module as root in the
+not Yocto world.
+
+Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
+---
+ tests/test_main.py | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tests/test_main.py b/tests/test_main.py
+index 4496111..182bc33 100644
+--- a/tests/test_main.py
++++ b/tests/test_main.py
+@@ -61,6 +61,7 @@ def test_set_key_encoding(dotenv_path):
+     assert dotenv_path.read_text(encoding=encoding) == "a='é'\n"
+ 
+ 
++@pytest.mark.skipif(os.geteuid() == 0, reason="Skipping becuase user is root")
+ def test_set_key_permission_error(dotenv_path):
+     dotenv_path.chmod(0o000)
+ 
+@@ -167,6 +168,7 @@ def test_unset_encoding(dotenv_path):
+     assert dotenv_path.read_text(encoding=encoding) == ""
+ 
+ 
++@pytest.mark.skipif(os.geteuid() == 0, reason="Skipping becuase user is root")
+ def test_set_key_unauthorized_file(dotenv_path):
+     dotenv_path.chmod(0o000)
+ 
+-- 
+2.47.3
+
diff --git a/meta-python/recipes-devtools/python/python3-python-dotenv_1.2.1.bb b/meta-python/recipes-devtools/python/python3-python-dotenv_1.2.1.bb
new file mode 100644
index 0000000000..73af9c7906
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-python-dotenv_1.2.1.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Read key-value pairs from a .env file and set them as environment variables"
+HOMEPAGE = "https://github.com/theskumar/python-dotenv"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e914cdb773ae44a732b392532d88f072"
+RECIPE_MAINTAINER = "Tom Geelen <t.f.g.geelen@gmail.com>"
+
+SRC_URI[sha256sum] = "42667e897e16ab0d66954af0e60a9caa94f0fd4ecf3aaf6d2d260eec1aa36ad6"
+
+SRC_URI += "file://0001-test_main.py-skip-two-test-when-running-as-root.patch"
+
+inherit pypi python_setuptools_build_meta ptest-python-pytest
+
+# Uncomment this line to enable all the optional features.
+#PACKAGECONFIG ?= "cli"
+PACKAGECONFIG[cli] = ",,,python3-click"
+
+PYPI_PACKAGE = "python_dotenv"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
+
+RDEPENDS:${PN}-ptest = "\
+    python3-sh \
+"
-- 
2.47.3


