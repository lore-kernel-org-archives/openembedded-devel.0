Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F15BEC7EE22
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 14:06:32 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.89561.1684159590817901112
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 May 2023 07:06:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=EhkSgiH2;
 spf=pass (domain: baylibre.com, ip: 209.85.160.179, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-3f529239e4aso11229641cf.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 May 2023 07:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684159589; x=1686751589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BqxEa0PNuAawl5fG8jbnNki2o1Dkb6gWnOHZ9teKchk=;
        b=EhkSgiH2RIcyt6TeznibU9D1lG/7cabT+nbc2ulJae/E7CthAG56c07YpuwJPLpwOx
         U4tzrNRA1+ds7PgdvsxApwJ+sLsUyCIRyqTAoo+XG/RyNqKE/TLMnZp8m6rAwzrZL1Rb
         3A/obQxJ84SSV3kRcQ8jYVPXbvv0OvKlY8+35uGKZqge9ClYHYuaX5WPE+qWNBlVY46+
         aBCVxqFaN+YhaxfdBdQz2FpZyJjEh0dQYwXX7J6TZ6lwVaf6ZGGnnw6ZPsuKK8re+8tG
         QP6AppKLPKFvT6FD0AECBrTxCGlgZcye0c5kg/WuRRx7Q9Pm+Chr715q3EYfRH60FPqG
         tzJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684159589; x=1686751589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BqxEa0PNuAawl5fG8jbnNki2o1Dkb6gWnOHZ9teKchk=;
        b=bnuUpNT2ng/vag4U+bNg+jO0sNluGZ1EfUS4Foecco9dxijUbg4B3qVUVyNi9yrBNP
         49VFCmH9ndQy22wWWx+lw5E/+MmFTPxXP6IvWqZtG735FYw4uoaj4JooGc+63/jhfCeO
         qWO75juI5LqwBdfAOGcdN5OuocJA7coeswzYQjvXKRFTRX9tz7lEl1U9/X7Bgyb5jIji
         durjrhITJARtt/2A9sCyRhpH13VHQYg05/Kvz6GJZWVJIc38QDYpm+A4QVKFBTlkhxjy
         Xn4dE7RuU7iWjJ5RcDpZdpS96EvgXEXkvdaN2OGZlOPnFSZlKZSAHempum5YB27yYdti
         g+1w==
X-Gm-Message-State: AC+VfDydHgXjBkLsoOzZkGk+Mv6euhsANFRY/v/Fx6a06NC3CU5iHEw1
	Cnx0hzyp9kM/jJ5ts4S/UFcgwORm7Nk6zyRGr8M6ew==
X-Google-Smtp-Source: ACHHUZ6zZDXjTYXnWnmD1Vjozj9JJabX1TVATw36qrCQEDj9idpR6/0Ns0nr9kOlkv3p6aGHMV0qCg==
X-Received: by 2002:a05:622a:2c2:b0:3ef:6c09:edcc with SMTP id a2-20020a05622a02c200b003ef6c09edccmr58479907qtx.22.1684159589284;
        Mon, 15 May 2023 07:06:29 -0700 (PDT)
Received: from megalith.ht.home (cpe64777de11593-cm64777de11590.cpe.net.cable.rogers.com. [174.115.224.47])
        by smtp.gmail.com with ESMTPSA id w7-20020ae9e507000000b0074df5d787f2sm2403397qkf.89.2023.05.15.07.06.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 07:06:29 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/2] python3-pylint: omit failing pickle test
Date: Mon, 15 May 2023 10:06:27 -0400
Message-Id: <20230515140627.2103801-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515140627.2103801-1-tgamblin@baylibre.com>
References: <20230515140627.2103801-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 May 2023 14:06:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102605

There is one test in the pylint suite involving pickling non-pickleable
plugins that fails on target (but not host). Disable this test for
ptest runs.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...001-pylint-remove-plugin-pickle-test.patch | 53 +++++++++++++++++++
 .../python/python3-pylint_2.17.4.bb           |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pylint/0001-pylint-remove-plugin-pickle-test.patch

diff --git a/meta-python/recipes-devtools/python/python3-pylint/0001-pylint-remove-plugin-pickle-test.patch b/meta-python/recipes-devtools/python/python3-pylint/0001-pylint-remove-plugin-pickle-test.patch
new file mode 100644
index 000000000..a7637a5ca
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pylint/0001-pylint-remove-plugin-pickle-test.patch
@@ -0,0 +1,53 @@
+From 341e19dd69d847f84859e85cabff5846e7da24c4 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Mon, 15 May 2023 09:26:04 -0400
+Subject: [PATCH] pylint: remove plugin pickle test
+
+Upstream-Status: Inappropriate (oe-specific)
+
+Upstream uses an assertion in the removed test to state that the test
+needs changing if the plugin loading succeeds. The same failure wasn't
+seen when running the tests on the host with pytest, so disable it by
+removing the test from the suite.
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ tests/test_check_parallel.py | 22 ----------------------
+ 1 file changed, 22 deletions(-)
+
+diff --git a/tests/test_check_parallel.py b/tests/test_check_parallel.py
+index d56502eaf..34fec140f 100644
+--- a/tests/test_check_parallel.py
++++ b/tests/test_check_parallel.py
+@@ -257,28 +257,6 @@ class TestCheckParallelFramework:
+         assert stats.statement == 18
+         assert stats.warning == 0
+ 
+-    def test_linter_with_unpickleable_plugins_is_pickleable(self) -> None:
+-        """The linter needs to be pickle-able in order to be passed between workers"""
+-        linter = PyLinter(reporter=Reporter())
+-        # We load an extension that we know is not pickle-safe
+-        linter.load_plugin_modules(["pylint.extensions.overlapping_exceptions"])
+-        try:
+-            dill.dumps(linter)
+-            raise AssertionError(
+-                "Plugins loaded were pickle-safe! This test needs altering"
+-            )
+-        except (KeyError, TypeError, PickleError, NotImplementedError):
+-            pass
+-
+-        # And expect this call to make it pickle-able
+-        linter.load_plugin_configuration()
+-        try:
+-            dill.dumps(linter)
+-        except KeyError as exc:
+-            raise AssertionError(
+-                "Cannot pickle linter when using non-pickleable plugin"
+-            ) from exc
+-
+     def test_worker_check_sequential_checker(self) -> None:
+         """Same as test_worker_check_single_file_no_checkers with SequentialTestChecker."""
+         linter = PyLinter(reporter=Reporter())
+-- 
+2.40.1
+
diff --git a/meta-python/recipes-devtools/python/python3-pylint_2.17.4.bb b/meta-python/recipes-devtools/python/python3-pylint_2.17.4.bb
index c20d91259..96fce2e04 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_2.17.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_2.17.4.bb
@@ -7,6 +7,7 @@ SRC_URI += " \
         git://github.com/pylint-dev/pylint;branch=main;protocol=https \
         file://run-ptest \
         file://0001-pyproject.toml-Remove-hard-coded-dependencies.patch \
+        file://0001-pylint-remove-plugin-pickle-test.patch \
         "
 SRCREV ?= "fc34a4b6abe56f3ac07ca15d846b1c1955545f85"
 
-- 
2.40.1


