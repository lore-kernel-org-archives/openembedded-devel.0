Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3998ECD8CAF
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 18:35:13 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web10.1975.1696962904613630552
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Oct 2023 11:35:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bhsnc+9i;
 spf=pass (domain: gmail.com, ip: 209.85.219.172, mailfrom: danismostlikely@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-d9a6b21d1daso957577276.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 11:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696962904; x=1697567704; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TnrBna5AVk9ZdWcfIgWkgNpheQumKizzDLCRBRCRHE4=;
        b=Bhsnc+9iuzDYnhaQT+9AEjIh843bsJc5vFDtPVFfyXkI9/8vqcHVeA9EANT4rLfSKa
         1OvwTpuqsipif9Nd9hkDwqrsA6SrjiUHq3xrbRfyJDYSwU/HN0Q39mlSv0w/e6OyC1Gn
         a7tfaLcYrJgnKuOPDOW+XrFo6v7lie5mljZjvWPAeetkFSGln5HuOzb4geabsa5ReE9M
         TPlvFIeBQrfN9gwZQqAKBvaiDKqRGUxtB3W4iHVMcNzKKl8WUnJ8wEgNUpOlLtH5sEiy
         Iy2iwWTa1pvv+idL8ZWZbJJ+rKp3SXFKyMVsUr7ln3rqi6kVajotXbTBGo7aOl6Revbs
         B7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696962904; x=1697567704;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TnrBna5AVk9ZdWcfIgWkgNpheQumKizzDLCRBRCRHE4=;
        b=Mzq4Rw30IIv076AZwAsf4vRJUX6jDhUsgfwq7hYbAn0qzK1zQI1gRQl76J9NBf8LDj
         WtXLF265OffvlQp2Jka5yJskdl0sFEDA4VXDF1j5HRrvfFv7S/6hJ+5JopTDlrWmThkf
         I75/dVqHC5BqP5rHyyvU6i6DnGzPbKxnydyOr9U6VEeISqa+5Q+0ijMECYjtgIGKLft/
         eqcfsnRpyof6+LJ/PRIU8ugVQxD14kHaA2blDO9EkoGWpwgxFhWSmrAiZsYJj6WSw1l2
         qL9K71+TgQPDZD+6N8itVBabQLYSsIL5L3kS6tnnwMCcLAuDxejFZCuxj/xbfougM8Bt
         tbYg==
X-Gm-Message-State: AOJu0Yyhqc2NSBS+bmS44MEwQQTeFlvhRn7ZObyamGJnjKqkYUIFYiCB
	p4UrCsl1Pw63MkdR23J/yUxgMBSxENaMUk7bhEA=
X-Google-Smtp-Source: AGHT+IG9pjwg9yDErh9RD4HIILF7PjlSWPYRYYge2PFY5YfdhaF7TwbHB8B+C+J3L6SxI/Aki210mY+8RvdKgeBDJ0Q=
X-Received: by 2002:a25:21c2:0:b0:d00:cc5b:8a9f with SMTP id
 h185-20020a2521c2000000b00d00cc5b8a9fmr15180719ybh.16.1696962903558; Tue, 10
 Oct 2023 11:35:03 -0700 (PDT)
MIME-Version: 1.0
References: <20231003042313.1153843-1-raj.khem@gmail.com> <20231003042313.1153843-3-raj.khem@gmail.com>
In-Reply-To: <20231003042313.1153843-3-raj.khem@gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Tue, 10 Oct 2023 12:34:52 -0600
Message-ID: <CACS+7ZRLbXSGrz75AdYYm7+kJU+7TiFokXHkXWC6Q5xxLaDwqg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 3/3] python3-pylint: Upgrade to 3.0.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 18:35:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105413

I think these changes should be cherry-picked to nanbield. It's got
the update for astroid to v3.0.0, and that breaks pylint on that
branch.

On Mon, 2 Oct 2023 at 22:23, Khem Raj <raj.khem@gmail.com> wrote:
>
> Package additional hidden files for ptests (test_primer.py)
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...001-pylint-remove-plugin-pickle-test.patch | 53 -------------------
>  ....toml-Remove-hard-coded-dependencies.patch | 26 ---------
>  ...lint_2.17.4.bb => python3-pylint_3.0.0.bb} |  5 +-
>  3 files changed, 2 insertions(+), 82 deletions(-)
>  delete mode 100644 meta-python/recipes-devtools/python/python3-pylint/0001-pylint-remove-plugin-pickle-test.patch
>  delete mode 100644 meta-python/recipes-devtools/python/python3-pylint/0001-pyproject.toml-Remove-hard-coded-dependencies.patch
>  rename meta-python/recipes-devtools/python/{python3-pylint_2.17.4.bb => python3-pylint_3.0.0.bb} (89%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pylint/0001-pylint-remove-plugin-pickle-test.patch b/meta-python/recipes-devtools/python/python3-pylint/0001-pylint-remove-plugin-pickle-test.patch
> deleted file mode 100644
> index a7637a5ca6..0000000000
> --- a/meta-python/recipes-devtools/python/python3-pylint/0001-pylint-remove-plugin-pickle-test.patch
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -From 341e19dd69d847f84859e85cabff5846e7da24c4 Mon Sep 17 00:00:00 2001
> -From: Trevor Gamblin <tgamblin@baylibre.com>
> -Date: Mon, 15 May 2023 09:26:04 -0400
> -Subject: [PATCH] pylint: remove plugin pickle test
> -
> -Upstream-Status: Inappropriate (oe-specific)
> -
> -Upstream uses an assertion in the removed test to state that the test
> -needs changing if the plugin loading succeeds. The same failure wasn't
> -seen when running the tests on the host with pytest, so disable it by
> -removing the test from the suite.
> -
> -Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ----
> - tests/test_check_parallel.py | 22 ----------------------
> - 1 file changed, 22 deletions(-)
> -
> -diff --git a/tests/test_check_parallel.py b/tests/test_check_parallel.py
> -index d56502eaf..34fec140f 100644
> ---- a/tests/test_check_parallel.py
> -+++ b/tests/test_check_parallel.py
> -@@ -257,28 +257,6 @@ class TestCheckParallelFramework:
> -         assert stats.statement == 18
> -         assert stats.warning == 0
> -
> --    def test_linter_with_unpickleable_plugins_is_pickleable(self) -> None:
> --        """The linter needs to be pickle-able in order to be passed between workers"""
> --        linter = PyLinter(reporter=Reporter())
> --        # We load an extension that we know is not pickle-safe
> --        linter.load_plugin_modules(["pylint.extensions.overlapping_exceptions"])
> --        try:
> --            dill.dumps(linter)
> --            raise AssertionError(
> --                "Plugins loaded were pickle-safe! This test needs altering"
> --            )
> --        except (KeyError, TypeError, PickleError, NotImplementedError):
> --            pass
> --
> --        # And expect this call to make it pickle-able
> --        linter.load_plugin_configuration()
> --        try:
> --            dill.dumps(linter)
> --        except KeyError as exc:
> --            raise AssertionError(
> --                "Cannot pickle linter when using non-pickleable plugin"
> --            ) from exc
> --
> -     def test_worker_check_sequential_checker(self) -> None:
> -         """Same as test_worker_check_single_file_no_checkers with SequentialTestChecker."""
> -         linter = PyLinter(reporter=Reporter())
> ---
> -2.40.1
> -
> diff --git a/meta-python/recipes-devtools/python/python3-pylint/0001-pyproject.toml-Remove-hard-coded-dependencies.patch b/meta-python/recipes-devtools/python/python3-pylint/0001-pyproject.toml-Remove-hard-coded-dependencies.patch
> deleted file mode 100644
> index 7950e72077..0000000000
> --- a/meta-python/recipes-devtools/python/python3-pylint/0001-pyproject.toml-Remove-hard-coded-dependencies.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From c5c415a240189ac6730ba95de0bb5883dfb53609 Mon Sep 17 00:00:00 2001
> -From: Trevor Gamblin <tgamblin@baylibre.com>
> -Date: Mon, 1 May 2023 11:32:24 -0400
> -Subject: [PATCH] pyproject.toml: Remove hard-coded dependencies
> -
> -Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ----
> -Upstream-Status: Pending
> -
> - pyproject.toml | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/pyproject.toml b/pyproject.toml
> -index bd542646b..2c0ed9485 100644
> ---- a/pyproject.toml
> -+++ b/pyproject.toml
> -@@ -1,5 +1,5 @@
> - [build-system]
> --requires = ["setuptools~=62.6", "wheel~=0.37.1"]
> -+requires = ["setuptools", "wheel"]
> - build-backend = "setuptools.build_meta"
> -
> - [project]
> ---
> -2.40.0
> -
> diff --git a/meta-python/recipes-devtools/python/python3-pylint_2.17.4.bb b/meta-python/recipes-devtools/python/python3-pylint_3.0.0.bb
> similarity index 89%
> rename from meta-python/recipes-devtools/python/python3-pylint_2.17.4.bb
> rename to meta-python/recipes-devtools/python/python3-pylint_3.0.0.bb
> index 96fce2e048..413e6599db 100644
> --- a/meta-python/recipes-devtools/python/python3-pylint_2.17.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-pylint_3.0.0.bb
> @@ -6,10 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c107cf754550e65755c42985a5d4e9c9"
>  SRC_URI += " \
>          git://github.com/pylint-dev/pylint;branch=main;protocol=https \
>          file://run-ptest \
> -        file://0001-pyproject.toml-Remove-hard-coded-dependencies.patch \
> -        file://0001-pylint-remove-plugin-pickle-test.patch \
>          "
> -SRCREV ?= "fc34a4b6abe56f3ac07ca15d846b1c1955545f85"
> +SRCREV ?= "4a7ad5ea9f1c5a98ccf736578a00554be0da6dc7"
>
>  inherit python_setuptools_build_meta ptest
>
> @@ -47,5 +45,6 @@ S = "${WORKDIR}/git"
>  do_install_ptest() {
>      install -d ${D}${PTEST_PATH}/tests
>      cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +    install -Dm 0644 ${S}/tests/.pylint_primer_tests/.gitkeep ${D}${PTEST_PATH}/tests/.pylint_primer_tests/.gitkeep
>      sed -i 's#/usr/bin/python$#/usr/bin/python3#g' ${D}${PTEST_PATH}/tests/data/ascript
>  }
> --
> 2.42.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105316): https://lists.openembedded.org/g/openembedded-devel/message/105316
> Mute This Topic: https://lists.openembedded.org/mt/101728502/3617261
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [danismostlikely@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

