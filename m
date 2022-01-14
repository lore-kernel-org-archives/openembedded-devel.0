Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6BF4C433FE
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 03:20:25 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 by mx.groups.io with SMTP id smtpd.web12.2631.1642130425150248381
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 19:20:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KfDDAUf4;
 spf=pass (domain: gmail.com, ip: 209.85.166.170,
 mailfrom: ticotimo@gmail.com)
Received: by mail-il1-f170.google.com with SMTP id a18so981496ilq.6
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 19:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1zzcZ5ld+FC2sB5UeHDv6ccMtchOIfTvrWDCHJlVwT8=;
        b=KfDDAUf4jQXHsE1x2K4Kf70lRmxaxyPcJZG/IkJYpK+0Nr19pNmIuR/EDEyDpCXSI8
         +UldF8EQhN1ViG8jnwYQPnBj9bRaw+TCzu6J++s9wYwXFhynap+l6pLMzCcq7z91LXqz
         vJ64Ec9T2H5RIshr6V+wkHyNBkNVQ9r+cInqRkeMG9Cs8AGjKJt2nCO6OxaS4fPoWr5p
         5ZewJhuPad8SGHUn1710wur8Vl9EOO3d9quOzw7QaVefKlyqChywgkecTAcNd8JIQOSj
         KMvdz0UY4aCVJFKjJOjSyxZKx9nMw3TreoqGTJtLh59Q6mKtPQY7oKShXHHNKJAHI2k0
         u/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1zzcZ5ld+FC2sB5UeHDv6ccMtchOIfTvrWDCHJlVwT8=;
        b=MoeKQlzYCx/hWbu2vy1IqY1ol+fevbSAQJyFZrEuqoGLBqgXKlrqEWJgpJLMhygGDJ
         07dz1PQoMYWV6WN1Dwn64WhgnFNma6sGTCi8LJ1JCsIjQt1QAKN+1u5CKrPApewD7LzJ
         to7GlJVyu3u1zRTR77m0SOQtsA3RKH9Rr/qDuBrRe2HlqCyxkosV1Y8z3af1GCQ/8lfb
         kxt02xg63WSOq49QL/cVmscIXMYmMSis4KkUxWRISSv5sml+SPZP/+e3hl7Lg9XZmuYZ
         ZGosRw6rh0XC6Z3zR+Lz98saS6wmdQz7P+294bTigXuOAkeChZymy6attpZLqrP4v/rv
         m+DQ==
X-Gm-Message-State: AOAM531GygpqC2gQLaDAszOd2J9TyomQrdJUBDICOp+M69y8AT0iWxn+
	P6IoIuCTr63eXRxRhKNbkbYrqBiJhLJYNA==
X-Google-Smtp-Source: 
 ABdhPJxF4Rr5bF40Wgtsk+eykHHNgZ622Crd/5hMcMm3LtR0VI8TAsqvgYsrQS0h1T/hjbDHZJCDnQ==
X-Received: by 2002:a05:6e02:1c2f:: with SMTP id
 m15mr3694778ilh.206.1642130424078;
        Thu, 13 Jan 2022 19:20:24 -0800 (PST)
Received: from lons-builder.int.hatle.net ([76.164.132.203])
        by smtp.gmail.com with ESMTPSA id
 o15sm904500ilh.17.2022.01.13.19.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 19:20:23 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-oe][PATCH 2/2] python3-gammu: add recipe for v3.2.4
Date: Thu, 13 Jan 2022 21:20:06 -0600
Message-Id: <20220114032006.2521012-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220114032006.2521012-1-tim.orling@konsulko.com>
References: <20220114032006.2521012-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jan 2022 03:20:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94822

The Python bindings for gammu have been moved into a separate package
python-gammu.

Send patch upstream to replace distutils.version.StrictVersion with
packaging.version.parse and .Version

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...p.py-StrictVersion-packaging.version.patch | 49 +++++++++++++++++++
 .../gammu/python3-gammu_3.2.4.bb              | 21 ++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/gammu/python3-gammu/0001-setup.py-StrictVersion-packaging.version.patch
 create mode 100644 meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb

diff --git a/meta-oe/recipes-connectivity/gammu/python3-gammu/0001-setup.py-StrictVersion-packaging.version.patch b/meta-oe/recipes-connectivity/gammu/python3-gammu/0001-setup.py-StrictVersion-packaging.version.patch
new file mode 100644
index 000000000..23fe4441d
--- /dev/null
+++ b/meta-oe/recipes-connectivity/gammu/python3-gammu/0001-setup.py-StrictVersion-packaging.version.patch
@@ -0,0 +1,49 @@
+From 96e8f0b2d13e890d9ffff8673f18dcc94290efb2 Mon Sep 17 00:00:00 2001
+From: Tim Orling <tim.orling@konsulko.com>
+Date: Thu, 13 Jan 2022 20:06:33 -0600
+Subject: [PATCH] setup.py: StrictVersion -> packaging.version.*
+
+distutils is deprecated in Python 3.10 and will be removed in Python
+3.12 [1]
+
+The recommended replacement for distutils.version is to use
+packaging.version
+
+StrictVersion can be replaced by packaging.version.Version and helpers
+like packaging.version.parse()
+
+[1] https://www.python.org/dev/peps/pep-0632/
+[2] https://packaging.pypa.io/en/latest/version.html
+
+Upstream-Status: Submitted [https://github.com/gammu/python-gammu/pull/67]
+
+Signed-off-by: Tim Orling <tim.orling@konsulko.com>
+---
+ setup.py | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index a458181..bffb09d 100755
+--- a/setup.py
++++ b/setup.py
+@@ -30,7 +30,7 @@ import os
+ import platform
+ import subprocess
+ import sys
+-from distutils.version import StrictVersion
++from packaging.version import parse, Version
+ 
+ from setuptools import Extension, setup
+ 
+@@ -112,9 +112,9 @@ class GammuConfig:
+         with open(self.config_path(self.path)) as handle:
+             for line in handle:
+                 if line.startswith("#define GAMMU_VERSION "):
+-                    version = line.split('"')[1]
++                    version = parse(line.split('"')[1])
+ 
+-        if version is None or StrictVersion(version) < StrictVersion(GAMMU_REQUIRED):
++        if version is None or version < parse(GAMMU_REQUIRED):
+             print("Too old Gammu version, please upgrade!")
+             sys.exit(100)
+ 
diff --git a/meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb b/meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb
new file mode 100644
index 000000000..1fdb76eeb
--- /dev/null
+++ b/meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Gammu bindings for Python"
+DESCRIPTION ="Python bindings for the Gammu library."
+HOMEPAGE = "https://wammu.eu/python-gammu/"
+BUGRACKER = "https://github.com/gammu/python-gammu/issues"
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+PYPI_PACKAGE = "python-gammu"
+
+inherit pypi setuptools3 pkgconfig
+
+SRC_URI += "file://0001-setup.py-StrictVersion-packaging.version.patch"
+SRC_URI[sha256sum] = "49fc70f01bc192c43ff3ec815e082df5261ea4c8d36a695e977734c4eb4df868"
+
+S = "${WORKDIR}/python-gammu-${PV}"
+
+DEPENDS += "gammu python3-packaging-native"
+
+RDEPENDS:${PN} += "python3-asyncio python3-core python3-threading"
+
+RRECOMMENDS:${PN} += "gammu"
-- 
2.25.1


