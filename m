Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C6FCC3DA4A
	for <webhook@archiver.kernel.org>; Sun, 11 Aug 2024 06:05:34 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.19672.1723356333944495900
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Aug 2024 23:05:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e530NPSO;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-264988283a3so2213164fac.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Aug 2024 23:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723356333; x=1723961133; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UmKsxbUChc9E1Zqyz94EP4RMNyncNA7lqEGwiLXlc7Q=;
        b=e530NPSOoWI0Snf19VAJqUxGKMIDNAbCzfDFtXyLuVCNmJhH9NwDr+uMZ5wpoNn1Ei
         FnHbbsP0lQXc3qNd3TJqtkhBffRwh1p3IEZYFJaR0WpVPs4HSox6qMBkpgo5zW0/eNSi
         73XKXmJjQQ9ZkyK1IRlmo8z3pldKEXcsrChWZy2HAfDhp1d7wP8KvSepWa52D0HXnZQx
         jeNZtk/1Un427Lz5aYaIbQem+N3zo1Eu4bzNt9yKh6lWZea/I9e/TjwkOWqO7D2mBxUz
         dJpe9TX7Gtt33wtbTG9z3rkxDmHxUZNU6KqITsGgpP6bCTs7zbs4gXSDgnnJNZm/Hg2g
         My6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723356333; x=1723961133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UmKsxbUChc9E1Zqyz94EP4RMNyncNA7lqEGwiLXlc7Q=;
        b=ouaEIyKI3S2jgcHUCmsFkfdU9dqjB8GPNlkDNi48Mi9ll1cdQ9pePwjsE0cesW+opS
         WuxrCwMAFKHBw1PFSTUn3IEUwcK7DbHnjYRKdo1M3drPQ2Oun1NgHR7Qq3cHxeSd7dZQ
         I9q4jFMR5koIvh/+fD5pBHIG0SCJ/bcox4AbXFGx5bdfWTXLCGtgVdjpgAe0GwC/n5i2
         +Z//juNarM+1+E+OH7xjeZROBfHe41mYSvOrc6tCG6vK8jy01/A8eBmlohjF1jI/anku
         IMFjmQPtywiozaHt0vMTB2xikpFMffIT3a39FSnAP1BquwUmGFamJyske0lWePxXY7Sb
         KQTg==
X-Gm-Message-State: AOJu0YznzFAS8rdkPY6gThd0v61QmolTMo0bBif1ibiZRsXGPiGngKv8
	zqWlYgnOybn1xHOhObqR4gpBHMkr+V+4Kv9cUdfl8H8LHynBu5LsXZQ/Bg==
X-Google-Smtp-Source: AGHT+IHXjwCUvA0C8dcGqT3L8xjolQYy2jswScfkDndDL270RLDDqcHg0xJajBsUVTfw5zIEEG17vQ==
X-Received: by 2002:a05:6871:797:b0:255:2e14:3d9d with SMTP id 586e51a60fabf-26c62c0a77emr7506117fac.5.1723356332865;
        Sat, 10 Aug 2024 23:05:32 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::4c22])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710e5875200sm1961412b3a.37.2024.08.10.23.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Aug 2024 23:05:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-daemon: Fix build with PEP-575 build backend
Date: Sat, 10 Aug 2024 23:05:30 -0700
Message-ID: <20240811060530.34509-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 11 Aug 2024 06:05:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111753

Apply required backports

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-packaging-module-instead-of-setupto.patch | 44 +++++++++++++++++++
 .../python/python3-daemon_3.0.1.bb            |  3 +-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-daemon/0001-Use-version-from-packaging-module-instead-of-setupto.patch

diff --git a/meta-python/recipes-devtools/python/python3-daemon/0001-Use-version-from-packaging-module-instead-of-setupto.patch b/meta-python/recipes-devtools/python/python3-daemon/0001-Use-version-from-packaging-module-instead-of-setupto.patch
new file mode 100644
index 0000000000..316f7d9618
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-daemon/0001-Use-version-from-packaging-module-instead-of-setupto.patch
@@ -0,0 +1,44 @@
+From b7418ab4a3232431373bf0680c6b74fef06910de Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 10 Aug 2024 22:44:08 -0700
+Subject: [PATCH] Use version from packaging module instead of setuptools extern
+
+Fixes build problems when using PEP-575 build backend
+
+
+Drop the patch on upgrading to >= 3.0.2
+
+Upstream-Status: Backport [https://pagure.io/fork/khemraj/python-daemon/c/3bbc46967d35cd7e05677018bdc9d552efaeea3e?branch=main]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ test_version.py | 2 +-
+ version.py      | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/test_version.py b/test_version.py
+index c43cd36..d0a124d 100644
+--- a/test_version.py
++++ b/test_version.py
+@@ -23,7 +23,7 @@ import docutils.writers
+ import setuptools
+ import setuptools.command
+ import setuptools.dist
+-from setuptools.extern.packaging.version import InvalidVersion
++from packaging.version import InvalidVersion
+ import testscenarios
+ import testtools
+ 
+diff --git a/version.py b/version.py
+index 20d3ef3..fbdc462 100644
+--- a/version.py
++++ b/version.py
+@@ -36,7 +36,7 @@ import setuptools.command.build
+ import setuptools.command.build_py
+ import setuptools.command.egg_info
+ import setuptools.dist
+-import setuptools.extern.packaging.version
++import packaging.version
+ 
+ 
+ def ensure_class_bases_begin_with(namespace, class_name, base_class):
diff --git a/meta-python/recipes-devtools/python/python3-daemon_3.0.1.bb b/meta-python/recipes-devtools/python/python3-daemon_3.0.1.bb
index 715d3bf120..cb85262b41 100644
--- a/meta-python/recipes-devtools/python/python3-daemon_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-daemon_3.0.1.bb
@@ -11,8 +11,9 @@ RDEPENDS:${PN} = "python3-docutils \
 LICENSE = "Apache-2.0 & GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://README;md5=a3a94c615dc969a70525f1eebbacf235"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
+SRC_URI += "file://0001-Use-version-from-packaging-module-instead-of-setupto.patch"
 SRC_URI[sha256sum] = "6c57452372f7eaff40934a1c03ad1826bf5e793558e87fef49131e6464b4dae5"
 
 PYPI_PACKAGE = "python-daemon"

