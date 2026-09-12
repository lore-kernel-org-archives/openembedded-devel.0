Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FCFBC88E66
	for <webhook@archiver.kernel.org>; Sat, 12 Sep 2026 23:51:52 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16571.1789257111047899735
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Sep 2026 16:51:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jks6c404;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc4902427c1so1727722a12.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Sep 2026 16:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789257110; x=1789861910; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3eQ64dybskEOOIGjNAus/5xvuGcoyewGRNeH5KgowXE=;
        b=jks6c404UI8+pu0shDjZDmeSNIJAzcWw0krfdWz8kSOSIN114jZs1uETwFuUe4zDWX
         0AWpDG3BSiJNVgq8m13McvTGTeMZGBTPp7kNZAzrgT3vE+4vqUkgorOcNiw/rqHnvhZf
         URsrGtQu+z0y+OqeXkBFZmn8pt4dFJ+bSw+gSDoBq1AmPqDUgw4qdQk4uIfIKXzQANKI
         P+6MldaAxCV0NNE+MmFFLv/Hpq0fry1T3cgCvvWyaHT+CL9fZNTkvwgO2cXlwBID8A8D
         LQ7vhopoHgwBkowgaAEZTauv8bYi7e+soA2LaT2xLeMRfuQIfNx0Fh3Q0VIF9QV73uNY
         8s2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789257110; x=1789861910;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3eQ64dybskEOOIGjNAus/5xvuGcoyewGRNeH5KgowXE=;
        b=Jvfb+Cyd4Tt6BMKupiYRhlqs+Ei4JYQ67e9tN6ecN8l4n/5ADQIii717uskVyOfKPz
         1yBEhK//SiQtqixvgkxhyt2p/3OB2IxDmiQ7P8Qm6FQweOnPAs74w6dBqtIc7UTTuF1d
         5yQF0Q/42dAUnPpCC0YbegN4vZcx15A6fD8Jw5gUnMT2lBAtFI8pQCbmfZpzj5nQGBSb
         9+dm/AUteQyORwVWN751T2c+cozmKMFVezri99ROnESoJfdJPQEFw6nN6tAQDv1XHkva
         pnVmKw1PQa/Bc3QX26O9rCLHi7032VE/pI3mi1mLeXMcv6R6nix/9egcB9qmuFotHLG4
         EpPg==
X-Gm-Message-State: AFuF++mXM7+g/WPWNKvnyLQgSByr/jskRoxm27zhfH6U2VLZCedh4LiN
	FeQ9GopqGJYRmCpuqHquol0Qv6F40Lbxxq0nzspGsbed3QwNMH03KUb1eTCJSg==
X-Gm-Gg: AYBFou3W1vMbkrpfVzsfewljUtUp5nPjyhDR8fK/HswgE57WPB6kmdD9wUn2hLdPRAJ
	kYIkUo3B0JDTs88ciQwspMqJr9SKW6wuwDW5q1ngWgJtY4phNzrTjiZmHg6LPeRmNyuYHDQJ65f
	EiDyc3yjJVm55YKWUe+i5D89Q6hP1ZfGP2NnEYpmtTlruNlNAf/ZisX3QpreXrnmw/a7J056Vvj
	B+cxbJaYbXzBMGxQmlWMaQsUaZVQ8zwB83tLetLQ11p4rHuD7V3jHgTqBQi5IM8wTW18GqyN7CO
	JMU6Gmn7Snyw8WZYfm0MqVoVni0M+PAp9tGE9/JveTvXVAmwUhKVTxqBEiY4ctl+hc4JaJYq+CP
	GJR/19ac0VE/7fheXwnU+NowimUSD8hJjR4iZ28d5iBmn9wcdPDO6Kq9EGR0xdMh9S9DudZHxtz
	I81QFE6QT842KNuGO03HaxdPSGh3WW9dA+atCNVjqawIUsaXe7NIhwIJotEEp8+ReHBhfxJ4qq/
	BVA1moFp2hl7ZYMnhgX19TaHdHjuWle5XlmqZThjgmE1IovImbvDzFqrYcsFSDLEtL5H18dgzi0
	iZaxj7MgJZzyyiz4YScXfv9cD2vWiARMfx7dlRBb4FYtEbIgcHsAgAOJ4jC7cwYhSbxCemuAsgL
	ZgK6J1Muchxja43v8ZRfE8Nj+OrOe9eFDMLcwnfuwIJDaYxPGQ5V1JvrOHpOnP72yd4Mw
X-Received: by 2002:a05:6a20:4327:b0:3db:b3b:5343 with SMTP id adf61e73a8af0-3db26cf8ce7mr374924637.12.1789257110221;
        Sat, 12 Sep 2026 16:51:50 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e52a60sm16093307eec.6.2026.09.12.16.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 16:51:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 5/5] python3-pylint: fix crash with astroid >= 4.2
Date: Sat, 12 Sep 2026 16:51:40 -0700
Message-ID: <20260912235141.2355852-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912235141.2355852-1-khem.raj@oss.qualcomm.com>
References: <20260912235141.2355852-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Sep 2026 23:51:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129985

pylint 4.0.8 passes asname=False to Import.infer(), a keyword argument
astroid 4.2 removed. With the astroid 4.3.1 in meta-python this makes
pylint crash on any import of a missing submodule:

  TypeError: NodeNG.infer() got an unexpected keyword argument 'asname'

which shows up in ptest as astroid-error in three functional tests:

  FAIL: tests/test_functional.py:test_functional[fallback_import_enabled]
  FAIL: tests/test_functional.py:test_functional[import_error]
  FAIL: tests/test_functional.py:test_functional[no_name_in_module]

Backport the pylint/ part of upstream commit 554b1d192434 ("Bump
astroid to 4.2.0b4"), which drops the argument.

meta-python-image-ptest-python3-pylint on qemux86-64 now passes
872 tests with none failing.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...s-do-not-pass-asname-to-Import.infer.patch | 39 +++++++++++++++++++
 .../python/python3-pylint_4.0.8.bb            |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pylint/0004-checkers-variables-do-not-pass-asname-to-Import.infer.patch

diff --git a/meta-python/recipes-devtools/python/python3-pylint/0004-checkers-variables-do-not-pass-asname-to-Import.infer.patch b/meta-python/recipes-devtools/python/python3-pylint/0004-checkers-variables-do-not-pass-asname-to-Import.infer.patch
new file mode 100644
index 0000000000..411ba313fc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pylint/0004-checkers-variables-do-not-pass-asname-to-Import.infer.patch
@@ -0,0 +1,39 @@
+From 554b1d1924342ce2e5b4d8f79dd62eab7cd67501 Mon Sep 17 00:00:00 2001
+From: Daniël van Noord <13665637+DanielNoord@users.noreply.github.com>
+Date: Sat, 4 Jul 2026 23:17:33 +0200
+Subject: [PATCH] checkers/variables: do not pass asname to Import.infer()
+
+astroid 4.2 removed the asname keyword argument from Import/ImportFrom
+inference (astroid commit fe29fb1f7e3e, "Remove `asname` kwarg from
+Import/ImportFrom `_infer`"). With astroid >= 4.2, pylint 4.0.8 then
+crashes on any module that imports a missing submodule of a package:
+
+  TypeError: NodeNG.infer() got an unexpected keyword argument 'asname'
+  ... (astroid-error)
+
+which breaks the fallback_import_enabled, import_error and
+no_name_in_module functional tests with the astroid 4.3.1 in meta-python.
+
+This is the pylint/ part of upstream commit 554b1d192434
+("Bump `astroid` to `4.2.0b4` (#11153)"); the astroid version pin
+changes in pyproject.toml and requirements_test_min.txt are left out.
+
+Upstream-Status: Backport [https://github.com/pylint-dev/pylint/commit/554b1d192434]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ pylint/checkers/variables.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pylint/checkers/variables.py b/pylint/checkers/variables.py
+index 3ce7dc63410..7e5f27b70ef 100644
+--- a/pylint/checkers/variables.py
++++ b/pylint/checkers/variables.py
+@@ -217,7 +217,7 @@ class C: ...
+ def _infer_name_module(node: nodes.Import, name: str) -> Generator[InferenceResult]:
+     context = astroid.context.InferenceContext()
+     context.lookupname = name
+-    return node.infer(context, asname=False)  # type: ignore[no-any-return]
++    return node.infer(context)  # type: ignore[no-any-return]
+ 
+ 
+ def _fix_dot_imports(
diff --git a/meta-python/recipes-devtools/python/python3-pylint_4.0.8.bb b/meta-python/recipes-devtools/python/python3-pylint_4.0.8.bb
index 90ee93e4f9..9ae03295e7 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_4.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_4.0.8.bb
@@ -8,6 +8,7 @@ SRC_URI += "git://github.com/pylint-dev/pylint;branch=main;protocol=https;tag=v$
            file://0001-Adjust-test-expectations-for-ptest.patch \
            file://0002-pyproject.toml-Keep-tool.setuptools.license-files.patch \
            file://0003-astroid-4.1.2-endlineno.patch \
+           file://0004-checkers-variables-do-not-pass-asname-to-Import.infer.patch \
            file://run-ptest \
            "
 

