Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4B57560557
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Dec 2017 14:16:16 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id p13so18871395qke.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Dec 2017 06:16:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=r42X9GqSt65pNZ6VJAIZDA/oEI6Q2d6AUWzZc806hwg=;
	b=Tfl6kSwaOtmevlCGPf/sbs+DlhOlC6abI5wWMYe8uAdeHes5vbeKXADtQZTCBCmTFJ
	EAaYXUJNSwQH0Zf/D7aC8K+Zf+btNNfL5gA1OoYf3ppyWhn9Z7UkPYVgs8GemTYUeaG9
	CMdI7VXkIlquNNDLqOVZUQ8aMYtxzSaUHSYYF+vAHZJB4B9aI2vjnJK+tg4onjY6Gseb
	FcAu2qIq4g+jvEwwe1NlFlvSNNgKRPkZWpuAdik80FTulu9uxUwhjCx+JrBXb2x4TEBV
	MCt7/BEt/zKox7M0EMi1/3W986czMtQqojWSrzbmptWkJsvrcrmhG2MLInRrqhgoHpGx
	tcdQ==
X-Gm-Message-State: AKGB3mL/wAfpA2o9DZdXzN+ZvfhSk66BI3BbACyowic3lwPW3Un+NHdX
	PU4VIsxR9Y2F/jwPfrMYzCJlJlLh
X-Google-Smtp-Source: ACJfBovgQ3MrLkDc5/OqoD8aW7F/09TxbGzOgi71DU6bRQGAT1XqkYw9tNTD2tpB50D7tsRWKTVktg==
X-Received: by 10.55.128.196 with SMTP id b187mr10161121qkd.87.1513952178046; 
	Fri, 22 Dec 2017 06:16:18 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	46sm14566229qtx.65.2017.12.22.06.16.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Dec 2017 06:16:17 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Dec 2017 09:16:06 -0500
Message-Id: <1513952166-4501-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-automat: fix build dependencies to avoid download during do_compile
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Dec 2017 14:16:17 -0000

Add the correct version of python{3}-setuptools-scm-native
Remove the dependency on m2r

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-automat.inc     |  8 ++++
 ...001-setup.py-remove-the-dependency-on-m2r.patch | 52 ++++++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-automat/0001-setup.py-remove-the-dependency-on-m2r.patch

diff --git a/meta-python/recipes-devtools/python/python-automat.inc b/meta-python/recipes-devtools/python/python-automat.inc
index 1ac5d3b..43b9ce9 100644
--- a/meta-python/recipes-devtools/python/python-automat.inc
+++ b/meta-python/recipes-devtools/python/python-automat.inc
@@ -3,6 +3,8 @@ HOMEPAGE = "https://github.com/glyph/Automat"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4ad213bcca81688e94593e5f60c87477"
 
+FILESEXTRAPATHS_prepend := "${THISDIR}/python-automat:"
+
 SRC_URI[md5sum] = "ad7bba58d262d8956d732330cb5ef53d"
 SRC_URI[sha256sum] = "3c1fd04ecf08ac87b4dd3feae409542e9bf7827257097b2b6ed5692f69d6f6a8"
 
@@ -10,6 +12,12 @@ PYPI_PACKAGE = "Automat"
 
 inherit pypi
 
+SRC_URI_append = " \
+    file://0001-setup.py-remove-the-dependency-on-m2r.patch \
+"
+
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+
 RDEPENDS_${PN} += "\
    ${PYTHON_PN}-attrs \
    ${PYTHON_PN}-six \
diff --git a/meta-python/recipes-devtools/python/python-automat/0001-setup.py-remove-the-dependency-on-m2r.patch b/meta-python/recipes-devtools/python/python-automat/0001-setup.py-remove-the-dependency-on-m2r.patch
new file mode 100644
index 0000000..0ebb220
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-automat/0001-setup.py-remove-the-dependency-on-m2r.patch
@@ -0,0 +1,52 @@
+From d5ebe479fc8fe11c5c75e7f35484849320349222 Mon Sep 17 00:00:00 2001
+From: Derek Straka <derek@asterius.io>
+Date: Fri, 22 Dec 2017 09:07:00 -0500
+Subject: [PATCH] setup.py: remove the dependency on m2r
+
+The dependency on m2r is removed here as it only provides the
+long_description value that is optional.  This item is just the
+text that would be present on PyPi, so it doesn't provide much
+value in this case
+
+Upstream-Status: Inappropriate (OE specific)
+
+Signed-off-by: Derek Straka <derek@asterius.io>
+---
+ setup.py | 10 ----------
+ 1 file changed, 10 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index d360c64..7b4180a 100644
+--- a/setup.py
++++ b/setup.py
+@@ -4,14 +4,6 @@ Setup file for automat
+ 
+ from setuptools import setup, find_packages
+ 
+-try:
+-    from m2r import parse_from_file
+-    long_description = parse_from_file('README.md')
+-except(IOError, ImportError):
+-    print("\n\n!!! m2r not found, long_description is bad, don't upload this to PyPI !!!\n\n")
+-    import io
+-    long_description = io.open('README.md', encoding="utf-8").read()
+-
+ setup(
+     name='Automat',
+     use_scm_version=True,
+@@ -19,12 +11,10 @@ setup(
+     description="""
+     Self-service finite-state machines for the programmer on the go.
+     """.strip(),
+-    long_description=long_description,
+     packages=find_packages(exclude=[]),
+     package_dir={'automat': 'automat'},
+     setup_requires=[
+         'setuptools-scm',
+-        'm2r',
+     ],
+     install_requires=[
+         "attrs>=16.1.0",
+-- 
+2.7.4
+
-- 
2.7.4


