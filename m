Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23391C3DA4A
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 09:04:50 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.7022.1739437481862123177
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Feb 2025 01:04:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Ygqwjjx3;
 spf=pass (domain: konsulko.com, ip: 209.85.128.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4395561ab71so6410435e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 01:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1739437480; x=1740042280; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QIgJTACPfAtjVfDD0893RkedbyoGoYPsscDGadHbEJM=;
        b=Ygqwjjx3osXv0CvZ3dNYIeE6YVQZiTxgLqJvILZ9bc9MU1nfk2I7RyAvFalgNZgf27
         POi3QK9Jkd8xP4CJcWK1dqnwO3PacSlLUY9PXQ5lXUOu8PF6Z45boqbkobk19Vxl4+wn
         HY3fDrodK6g3/UzkVTG3v4iX+sSjvdv1nVyvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739437480; x=1740042280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QIgJTACPfAtjVfDD0893RkedbyoGoYPsscDGadHbEJM=;
        b=LKnrTb53lW4v8BFikCp+ZhhA64mvzshi/QSHP/KstaNYhOpZgEtODsSzNNzmbo0wCp
         Tgua4oZFNFT9iCsEyMIzyPnx8MBjkudNHyOXBEtEWMpXxUneOek6+P4b4s1cv8eQUPiz
         eCLHQzcKoWTjz5yXkUrRNJc+6e7KtOLeqvfn9c5VgY0dtJouYhqnraIYTJVHJyiuwWuQ
         W1YjOnIo9P+lJWkP7qOBP6mP9bohSdkgL5cFmBk/tewqKiOxOlWIuLTyb7ssCeelMHty
         FyM1U9NTLwQGAPc0ihTss74MrmsY2iA44QUpOJps4XyN+9/aroJ9TuHhNW6Ugu2RNb8h
         VOug==
X-Gm-Message-State: AOJu0Yy06IQtPJUTjlqMzCcEYlrOoJOC9KbnDFD6qngWAI3ky1bSciCb
	DfWhE21YrDYgmzFs8rjrs2fY3YdiG1wcp/oMwNLpLapgWRJYPCqMcnzqpGGPcCIiRB/JcUlb7St
	b
X-Gm-Gg: ASbGncuJyyiUlrP0/816t6PkvC2FHPIfWvZcueuOnVTVs4ego2gyisa45rzpdYxbcOE
	vRLkfMaGM1OHRkoJ7+bSPAYwLIwBtQjnPP25haCTmFOCZzodrD0yuPAwboBY36diAPO1t/lkc7x
	8jQSLlahPRX6wqQvv/YMu3ufZFGvDRbwJJb58nuuQQwpct3Q29o82fwSSn7qpB5h76bhbzH2p4j
	hZlc+J3ad7vdceuCqiY2IvGlqC2+lCBSak/l7t6UnaExU5V66AGcPhCj2CU/rUuVkQjGOfUOaUH
	VadENfyzmw7CPpIx1CHGEn6dVfHtfA==
X-Google-Smtp-Source: AGHT+IEUbDommA8C6//PMWQiNCpIfkakseB/Gq4H9DAB+jIc7wxF3aeIHuMO7edIMOAQqYkdZMgyAw==
X-Received: by 2002:a05:600c:3590:b0:439:4871:afea with SMTP id 5b1f17b1804b1-439601cfab2mr30982155e9.30.1739437479400;
        Thu, 13 Feb 2025 01:04:39 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a06e309sm42507005e9.24.2025.02.13.01.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 01:04:38 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-daemon: Upgrade 3.0.1 -> 3.1.2
Date: Thu, 13 Feb 2025 11:04:29 +0200
Message-Id: <20250213090430.3750793-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250213090430.3750793-1-leon.anavi@konsulko.com>
References: <20250213090430.3750793-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 09:04:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115458

Upgrade to release 3.1.2:

- In wheel, distribute only the Python packages that should be
  installed.
- Migrate project code base from "flat layout" to "src layout"

License-Update: Use COPYING file

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-packaging-module-instead-of-setupto.patch | 44 -------------------
 ...aemon_3.0.1.bb => python3-daemon_3.1.2.bb} |  9 ++--
 2 files changed, 4 insertions(+), 49 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-daemon/0001-Use-version-from-packaging-module-instead-of-setupto.patch
 rename meta-python/recipes-devtools/python/{python3-daemon_3.0.1.bb => python3-daemon_3.1.2.bb} (52%)

diff --git a/meta-python/recipes-devtools/python/python3-daemon/0001-Use-version-from-packaging-module-instead-of-setupto.patch b/meta-python/recipes-devtools/python/python3-daemon/0001-Use-version-from-packaging-module-instead-of-setupto.patch
deleted file mode 100644
index 316f7d9618..0000000000
--- a/meta-python/recipes-devtools/python/python3-daemon/0001-Use-version-from-packaging-module-instead-of-setupto.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From b7418ab4a3232431373bf0680c6b74fef06910de Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 10 Aug 2024 22:44:08 -0700
-Subject: [PATCH] Use version from packaging module instead of setuptools extern
-
-Fixes build problems when using PEP-575 build backend
-
-
-Drop the patch on upgrading to >= 3.0.2
-
-Upstream-Status: Backport [https://pagure.io/fork/khemraj/python-daemon/c/3bbc46967d35cd7e05677018bdc9d552efaeea3e?branch=main]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- test_version.py | 2 +-
- version.py      | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/test_version.py b/test_version.py
-index c43cd36..d0a124d 100644
---- a/test_version.py
-+++ b/test_version.py
-@@ -23,7 +23,7 @@ import docutils.writers
- import setuptools
- import setuptools.command
- import setuptools.dist
--from setuptools.extern.packaging.version import InvalidVersion
-+from packaging.version import InvalidVersion
- import testscenarios
- import testtools
- 
-diff --git a/version.py b/version.py
-index 20d3ef3..fbdc462 100644
---- a/version.py
-+++ b/version.py
-@@ -36,7 +36,7 @@ import setuptools.command.build
- import setuptools.command.build_py
- import setuptools.command.egg_info
- import setuptools.dist
--import setuptools.extern.packaging.version
-+import packaging.version
- 
- 
- def ensure_class_bases_begin_with(namespace, class_name, base_class):
diff --git a/meta-python/recipes-devtools/python/python3-daemon_3.0.1.bb b/meta-python/recipes-devtools/python/python3-daemon_3.1.2.bb
similarity index 52%
rename from meta-python/recipes-devtools/python/python3-daemon_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-daemon_3.1.2.bb
index cb85262b41..8cf5697d10 100644
--- a/meta-python/recipes-devtools/python/python3-daemon_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-daemon_3.1.2.bb
@@ -2,18 +2,17 @@ DESCRIPTION = "Library to implement a well-behaved Unix daemon process"
 HOMEPAGE = "https://pagure.io/python-daemon/"
 SECTION = "devel/python"
 
-DEPENDS += "python3-docutils-native"
+DEPENDS += "python3-docutils-native python3-changelog-chug-native"
 RDEPENDS:${PN} = "python3-docutils \
                   python3-lockfile (>= 0.10) \
                   python3-resource \
 "
 
 LICENSE = "Apache-2.0 & GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://README;md5=a3a94c615dc969a70525f1eebbacf235"
+LIC_FILES_CHKSUM = "file://COPYING;md5=55f76b1b31719284caf4bc3ecbb70d6f"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI += "file://0001-Use-version-from-packaging-module-instead-of-setupto.patch"
-SRC_URI[sha256sum] = "6c57452372f7eaff40934a1c03ad1826bf5e793558e87fef49131e6464b4dae5"
+SRC_URI[sha256sum] = "f7b04335adc473de877f5117e26d5f1142f4c9f7cd765408f0877757be5afbf4"
 
-PYPI_PACKAGE = "python-daemon"
+PYPI_PACKAGE = "python_daemon"
-- 
2.39.5


