Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D241E82CAC
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 04:23:24 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.101861.1696306999437633454
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Oct 2023 21:23:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V9P3Tw34;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1c61acd1285so3501085ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Oct 2023 21:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696306999; x=1696911799; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IBVttqMXZP+8hAUHxJj9w7GKBcXq89TLAcs1HRmVDb4=;
        b=V9P3Tw34/qHmd6pF9pYkeh0YOt8utP9oKk8sTp+TQTLRdTVoXGpi66qGRbvoeSjMrn
         DkvYlciG/Rl/s5/OzJ4RcqW8qRMyihp5uUe3qRzdQqhvMuFBg4ZU5Ms/JzZWiGV/FnYX
         RdQBP8NrNGXgZNR9uParfXHR42D9s9FTQn3vNOfd8EL+Tu2t1j5aX03wsHjHwCA8g0XH
         gSBeRGtl2+JMIrlnr1g01enD9nQ5DU3seoRbcisO0sUZczvbQec8zFyjqVu319H3/nSB
         5KkWv5RVvAUnCYkJPBMmVwpo+IaXIJt33dMg8gfMRshYJIiUlZJtr4gT0Gm2LuJJnkqR
         71/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696306999; x=1696911799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IBVttqMXZP+8hAUHxJj9w7GKBcXq89TLAcs1HRmVDb4=;
        b=E+Ph0yeUZjtjlqK6AUwO8wtcUiIrI7aVIGVd2PCFJw4VAX9F1ja9PUzH7y7qgh3Df6
         /GGT361WARDwIGxqhiSUDsMrJUZ3rRuBcZs+7gMJS+tAfGtvQN3iOBYp95LUfy+EgEvf
         c5q10FCloMA5jxB8gvPeLSJB5y+530dDCXZ492LwU999OpKUWo8XzUDEtV5MWTPk6b7I
         YcWFZNQlp610jXc1e0a9TukT70TwtKAUZhq60Tbar9JPFQ35Eh1oD6DKa5A7aGbonpQV
         F7aYdX0KvZmgb/p4kdF6Xz3SjndfXjJ9Q1TK175iFJnppNTzeN/2DN2KjSHTHU/H4a4F
         5epw==
X-Gm-Message-State: AOJu0Yz73HOGUUESfyQ6cMIMSxPZZcJ69GoeOH16S40ZSnsi7V66DpOW
	mwgQfCtJXYR3ps94EP2nd5k9l2OlGGqVWw==
X-Google-Smtp-Source: AGHT+IGsuoxFZv/fv8v3r6CKvUHGaQdvsn6jJt7/1WroxGFB6pVXS1kcmPXfWNe8QIfa/blFoxR7NQ==
X-Received: by 2002:a17:902:f80e:b0:1c5:cbfb:c16f with SMTP id ix14-20020a170902f80e00b001c5cbfbc16fmr10493860plb.25.1696306998624;
        Mon, 02 Oct 2023 21:23:18 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::7f07])
        by smtp.gmail.com with ESMTPSA id c1-20020a170903234100b001b8a00d4f7asm320041plh.9.2023.10.02.21.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 21:23:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 3/3] python3-pylint: Upgrade to 3.0.0
Date: Mon,  2 Oct 2023 21:23:13 -0700
Message-ID: <20231003042313.1153843-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231003042313.1153843-1-raj.khem@gmail.com>
References: <20231003042313.1153843-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Oct 2023 04:23:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105316

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
index a7637a5ca6..0000000000
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
index 7950e72077..0000000000
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
index 96fce2e048..413e6599db 100644
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
2.42.0


