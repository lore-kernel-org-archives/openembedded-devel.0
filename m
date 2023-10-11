Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A2E7CDB47C
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 19:00:03 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web11.25176.1697050799216394564
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Oct 2023 11:59:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AhJPI7Y+;
 spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: danismostlikely@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-351367c8fcdso373095ab.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Oct 2023 11:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697050798; x=1697655598; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mz5G7Nss3J747OgHa9yDFD5iaWrgpXh5+ecfQTlFw44=;
        b=AhJPI7Y+YamPfjb5KbunuRDIx/fJeQTdd+rHT7TXZLShzweBvRMEIwesmF3N9lMDYQ
         amyl7X1GZplg2Jd0FF+OpG6/5+SeXtxH2uamdAnA/9fjYf4bpycXSzmX2Qm3Fp53pyss
         oygnbuwj6JVAcD1IYHLT3pmrnysQF7FCO0N9y7UfrU8GN0LsvRC2L4SV3UWlinKF3T1t
         jytonxdliIQ0H6/UtmclXaA11fXkpZF71Sf8srkfQzzpEb27oD6ACk8JmLUGfm7ZsarF
         GfqWJS62vqYEe4Vk17jtSxumchRbi9jtBSa7i+fZ/ES2Mp7z/0jh33ZhF2W7WYLxeiQH
         35RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697050798; x=1697655598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mz5G7Nss3J747OgHa9yDFD5iaWrgpXh5+ecfQTlFw44=;
        b=EAiYnMJflJcAQbBIrzxexa09XUM03RPh4YNuy8Lk+4LGL3ebdmu/Kk4AtpX9Ml4p3V
         bcduZROEBdihbjgLYt9lCgL9eO2dQg0xdePLEsH82wPb73J2X2tt0scq/kGP2gSwXTbM
         1b8gxXaxMh6eBWc/W8HNXLUVBj4vwi7JPGz5WhuTWtH/cuw6tgTN9krwsCsQxuXAFnXU
         KldHk98ZB6p+PchN0K1tvyxmLYocU5UZNNKNLtukAOnxBIRx0yZFPiwmsHzSOpIpwHRp
         EDO7g8F2E+VJhVQv1YDddNtimNKxdkHP0p6qKxmxvXBYDuBdcGGUjM484FZhr7zyPkhn
         dwkA==
X-Gm-Message-State: AOJu0Yz5/95DeVdg6JN9GdDwrR9vr4gp6GJlbGDtfkCMwtwwGbv4ukyD
	ehb2W/+MpQFvrCm/UXvPApfP5EpchE2SKw==
X-Google-Smtp-Source: AGHT+IFI3uw1RA+E9EDJI26BeJHP3ToBCpCdUcHG2rCxsyjoAylK5n4QlRZUwhXzZM03juW+G4kNiA==
X-Received: by 2002:a05:6e02:1c0c:b0:351:1d53:c770 with SMTP id l12-20020a056e021c0c00b003511d53c770mr27718792ilh.5.1697050798278;
        Wed, 11 Oct 2023 11:59:58 -0700 (PDT)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id c16-20020a92c8d0000000b003514edd0415sm130183ilq.67.2023.10.11.11.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 11:59:57 -0700 (PDT)
From: Daniel McGregor <danismostlikely@gmail.com>
X-Google-Original-From: Daniel McGregor <daniel.mcgregor@vecima.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][nanbield][PATCH] python3-pylint: Upgrade to 3.0.0
Date: Wed, 11 Oct 2023 12:59:22 -0600
Message-ID: <20231011185922.621822-1-daniel.mcgregor@vecima.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Oct 2023 19:00:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105435

From: Khem Raj <raj.khem@gmail.com>

Package additional hidden files for ptests (test_primer.py)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-pylint-remove-plugin-pickle-test.patch | 53 -------------------
 ....toml-Remove-hard-coded-dependencies.patch | 26 ---------
 ...lint_2.17.4.bb => python3-pylint_3.0.0.bb} |  5 +-
 3 files changed, 2 insertions(+), 82 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pylint/0001-pylint-remove-plugin-pickle-test.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-pylint/0001-pyproject.toml-Remove-hard-coded-dependencies.patch
 rename meta-python/recipes-devtools/python/{python3-pylint_2.17.4.bb => python3-pylint_3.0.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-pylint/0001-pylint-remove-plugin-pickle-test.patch b/meta-python/recipes-devtools/python/python3-pylint/0001-pylint-remove-plugin-pickle-test.patch
deleted file mode 100644
index a7637a5ca6e..00000000000
--- a/meta-python/recipes-devtools/python/python3-pylint/0001-pylint-remove-plugin-pickle-test.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 341e19dd69d847f84859e85cabff5846e7da24c4 Mon Sep 17 00:00:00 2001
-From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Mon, 15 May 2023 09:26:04 -0400
-Subject: [PATCH] pylint: remove plugin pickle test
-
-Upstream-Status: Inappropriate (oe-specific)
-
-Upstream uses an assertion in the removed test to state that the test
-needs changing if the plugin loading succeeds. The same failure wasn't
-seen when running the tests on the host with pytest, so disable it by
-removing the test from the suite.
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
----
- tests/test_check_parallel.py | 22 ----------------------
- 1 file changed, 22 deletions(-)
-
-diff --git a/tests/test_check_parallel.py b/tests/test_check_parallel.py
-index d56502eaf..34fec140f 100644
---- a/tests/test_check_parallel.py
-+++ b/tests/test_check_parallel.py
-@@ -257,28 +257,6 @@ class TestCheckParallelFramework:
-         assert stats.statement == 18
-         assert stats.warning == 0
- 
--    def test_linter_with_unpickleable_plugins_is_pickleable(self) -> None:
--        """The linter needs to be pickle-able in order to be passed between workers"""
--        linter = PyLinter(reporter=Reporter())
--        # We load an extension that we know is not pickle-safe
--        linter.load_plugin_modules(["pylint.extensions.overlapping_exceptions"])
--        try:
--            dill.dumps(linter)
--            raise AssertionError(
--                "Plugins loaded were pickle-safe! This test needs altering"
--            )
--        except (KeyError, TypeError, PickleError, NotImplementedError):
--            pass
--
--        # And expect this call to make it pickle-able
--        linter.load_plugin_configuration()
--        try:
--            dill.dumps(linter)
--        except KeyError as exc:
--            raise AssertionError(
--                "Cannot pickle linter when using non-pickleable plugin"
--            ) from exc
--
-     def test_worker_check_sequential_checker(self) -> None:
-         """Same as test_worker_check_single_file_no_checkers with SequentialTestChecker."""
-         linter = PyLinter(reporter=Reporter())
--- 
-2.40.1
-
diff --git a/meta-python/recipes-devtools/python/python3-pylint/0001-pyproject.toml-Remove-hard-coded-dependencies.patch b/meta-python/recipes-devtools/python/python3-pylint/0001-pyproject.toml-Remove-hard-coded-dependencies.patch
deleted file mode 100644
index 7950e72077d..00000000000
--- a/meta-python/recipes-devtools/python/python3-pylint/0001-pyproject.toml-Remove-hard-coded-dependencies.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From c5c415a240189ac6730ba95de0bb5883dfb53609 Mon Sep 17 00:00:00 2001
-From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Mon, 1 May 2023 11:32:24 -0400
-Subject: [PATCH] pyproject.toml: Remove hard-coded dependencies
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
----
-Upstream-Status: Pending
-
- pyproject.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index bd542646b..2c0ed9485 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -1,5 +1,5 @@
- [build-system]
--requires = ["setuptools~=62.6", "wheel~=0.37.1"]
-+requires = ["setuptools", "wheel"]
- build-backend = "setuptools.build_meta"
- 
- [project]
--- 
-2.40.0
-
diff --git a/meta-python/recipes-devtools/python/python3-pylint_2.17.4.bb b/meta-python/recipes-devtools/python/python3-pylint_3.0.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-pylint_2.17.4.bb
rename to meta-python/recipes-devtools/python/python3-pylint_3.0.0.bb
index 96fce2e048b..413e6599db1 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_2.17.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_3.0.0.bb
@@ -6,10 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c107cf754550e65755c42985a5d4e9c9"
 SRC_URI += " \
         git://github.com/pylint-dev/pylint;branch=main;protocol=https \
         file://run-ptest \
-        file://0001-pyproject.toml-Remove-hard-coded-dependencies.patch \
-        file://0001-pylint-remove-plugin-pickle-test.patch \
         "
-SRCREV ?= "fc34a4b6abe56f3ac07ca15d846b1c1955545f85"
+SRCREV ?= "4a7ad5ea9f1c5a98ccf736578a00554be0da6dc7"
 
 inherit python_setuptools_build_meta ptest
 
@@ -47,5 +45,6 @@ S = "${WORKDIR}/git"
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests
     cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+    install -Dm 0644 ${S}/tests/.pylint_primer_tests/.gitkeep ${D}${PTEST_PATH}/tests/.pylint_primer_tests/.gitkeep
     sed -i 's#/usr/bin/python$#/usr/bin/python3#g' ${D}${PTEST_PATH}/tests/data/ascript
 }
-- 
2.41.0


