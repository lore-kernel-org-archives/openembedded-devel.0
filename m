Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id A8B2F71A0F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Dec 2017 14:19:28 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id u184so43571729qkd.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Dec 2017 06:19:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sOCqRDGDzKyE379kEGiATFcdIdvUiLWjXZaGk3/4UMY=;
	b=GhUwN+UmY1JU83a4tp+jsa1M/a5E7MoefI993F+3MSqWcgI7APrdGJ9IIAyMwBrSD8
	rxTZ8jjH/2eW+4+Y4DMUxVFWVGT2rR/Y2whAGQFay7sxvcyEsFxJij2hcE41Njt9ELs9
	mL6bl+OZaLsRLBaZ1qOfNcP70VJKTkYuerHyTTwgGYl/97QAo2MLDiT5aIcUCvtKqyXg
	BYZnLstoZtybjH518VPJKHzWNxBRmkRTWJ5jtivB/T2gVATg2nRPj6OyEnBzNbSBuxof
	8bGeVnfYWFYjqd1hjOFAxS1HNan46hfvHh5NuaJ/jQHrY0zS7ByS2PidJxPpwKIOIgWS
	2zEQ==
X-Gm-Message-State: AKGB3mI2mDVFf5kMLytWuhoB12bWTH+6Ky/YbFVkHuwqxsMrbJJGQNji
	mHTAIMJRg/5BDlfW9qUqBi1rpLNv
X-Google-Smtp-Source: ACJfBotYamI8pkG021/h4EQwVJlqmdIle0B0V59Uvbe+WM3+CzFycvr3I+8hQ6+H8Zw4rrwUk/2xrw==
X-Received: by 10.55.168.151 with SMTP id r145mr11076121qke.199.1514297969204; 
	Tue, 26 Dec 2017 06:19:29 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	n24sm19832011qta.50.2017.12.26.06.19.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Dec 2017 06:19:28 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Dec 2017 09:19:11 -0500
Message-Id: <1514297951-7675-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][rocko][PATCH] python-automat: fix build dependencies to avoid download during do_compile
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
X-List-Received-Date: Tue, 26 Dec 2017 14:19:29 -0000

Add the correct version of python{3}-setuptools-scm-native
Remove the dependency on m2r

Signed-off-by: Derek Straka <derek@asterius.io>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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


