Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9681360807
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Dec 2017 15:34:01 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id g10so45190292qtj.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Dec 2017 07:34:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8XzRUGSQKKgUYN4yg9bXX2Fgw5RrNrAgavYkvLCPOcs=;
	b=Qf2UYBpXQgeYmmkT/AsQA5ySX5TfXGYLJ3asbI9caT430MyNKVIF/6DyfQwiEoFvXL
	OUhh6l5GUCDAo5FDYB5UfoxkWKwVreJPw0cnOVHZEVHhz/Eq5IwuATFmCwbH/IqruBV6
	t+NOsMTGbh4Wdc1grJSlUXOyfw9J1PLq6dDQZBF4Xv5ooXGLBI4Hzt5I/583Ty0QFl44
	4Quuf5xVQzRGhVKGE20x1Y2Fs/LOWzjt85quc0lGozI3lDOhiVC8OTBZtbTxo52egQPK
	wYIZEu7pitpIaKKr9OlSG/V+CUspwLmlav5K6dI8dAKsGIyb8SNGvhwj97Fvp2Gyffka
	4wjQ==
X-Gm-Message-State: AKGB3mJjOghCrBnJAwpPuqafj4nNJkfj8jUncsOta/2vOEXRjK8NI1D8
	0bqi86mAF+9JXUocXFQx/MQ/3oXM
X-Google-Smtp-Source: ACJfBos7B1ADda1rzAkg7QZGpeMUwZrNYFIgsGbUqR8rpEsBwITZvWkpOiubRXBeYk88Bw3T+o1Gcw==
X-Received: by 10.200.45.89 with SMTP id o25mr31907804qta.227.1514302442310;
	Tue, 26 Dec 2017 07:34:02 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	z126sm19876780qka.70.2017.12.26.07.34.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Dec 2017 07:34:01 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Dec 2017 10:33:55 -0500
Message-Id: <1514302435-23373-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-parted: update to version 3.11.1
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
X-List-Received-Date: Tue, 26 Dec 2017 15:34:01 -0000

Update github hash for the release
Add correct RDEPENDS for the minimal python installs
Remove a patch no longer required

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python-pyparted/python-pyparted.inc            | 12 +++++-----
 .../0001-fix-version-float-check.patch             | 26 ----------------------
 ...yparted_3.10.7.bb => python-pyparted_3.11.1.bb} |  0
 .../0001-fix-version-float-check.patch             | 26 ----------------------
 ...parted_3.10.7.bb => python3-pyparted_3.11.1.bb} |  0
 5 files changed, 7 insertions(+), 57 deletions(-)
 delete mode 100644 meta-python/recipes-extended/python-pyparted/python-pyparted/0001-fix-version-float-check.patch
 rename meta-python/recipes-extended/python-pyparted/{python-pyparted_3.10.7.bb => python-pyparted_3.11.1.bb} (100%)
 delete mode 100644 meta-python/recipes-extended/python-pyparted/python3-pyparted/0001-fix-version-float-check.patch
 rename meta-python/recipes-extended/python-pyparted/{python3-pyparted_3.10.7.bb => python3-pyparted_3.11.1.bb} (100%)

diff --git a/meta-python/recipes-extended/python-pyparted/python-pyparted.inc b/meta-python/recipes-extended/python-pyparted/python-pyparted.inc
index 65f8ca1..2192179 100644
--- a/meta-python/recipes-extended/python-pyparted/python-pyparted.inc
+++ b/meta-python/recipes-extended/python-pyparted/python-pyparted.inc
@@ -11,11 +11,13 @@ LIC_FILES_CHKSUM = "\
 DEPENDS += "parted"
 
 # upstream only publishes releases in github archives which are discouraged
-SRCREV = "69c4a478e43d3eff6ae3a0116fa38da06776d5f5"
-SRC_URI = "git://github.com/rhinstaller/pyparted.git;protocol=https \
-           file://0001-fix-version-float-check.patch \
-"
+SRCREV = "1fdb15120f35f5da1dc7ec116522f0c796a8376a"
+SRC_URI = "git://github.com/rhinstaller/pyparted.git;protocol=https"
+
 S = "${WORKDIR}/git"
 
-RDEPENDS_${PN} += "parted (>= 2.3)"
+RDEPENDS_${PN}_class-target += " \
+    parted (>= 2.3) \
+    ${PYTHON_PN}-subprocess \
+"
 RDEPENDS_${PN}_class-native = ""
diff --git a/meta-python/recipes-extended/python-pyparted/python-pyparted/0001-fix-version-float-check.patch b/meta-python/recipes-extended/python-pyparted/python-pyparted/0001-fix-version-float-check.patch
deleted file mode 100644
index db3ab9f..0000000
--- a/meta-python/recipes-extended/python-pyparted/python-pyparted/0001-fix-version-float-check.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-check_mod_version breaks if module version is of x.y.z form
-use a regex to help cast x.y.z version to a float
-
-Upstream-Status: Pending
-
-Index: git/setup.py
-===================================================================
---- git.orig/setup.py
-+++ git/setup.py
-@@ -25,6 +25,7 @@ import glob
- import os
- import platform
- import sys
-+import re
- from distutils.ccompiler import new_compiler
- from distutils.errors import CompileError
- from distutils.errors import LinkError
-@@ -51,6 +52,8 @@ def pkgconfig(*packages, **kwargs):
- 
- def check_mod_version(module, version):
-     modversion = subprocess.check_output(["pkg-config", "--modversion", module])
-+    match = re.search('([0-9]+\.[0-9]+)', modversion)
-+    modversion = match.group(0)
-     if not float(modversion) >= float(version):
-         sys.stderr.write("*** Minimum required %s version: %s, found: %s\n" % (module, version, modversion,))
-         sys.exit(1)
diff --git a/meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.7.bb b/meta-python/recipes-extended/python-pyparted/python-pyparted_3.11.1.bb
similarity index 100%
rename from meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.7.bb
rename to meta-python/recipes-extended/python-pyparted/python-pyparted_3.11.1.bb
diff --git a/meta-python/recipes-extended/python-pyparted/python3-pyparted/0001-fix-version-float-check.patch b/meta-python/recipes-extended/python-pyparted/python3-pyparted/0001-fix-version-float-check.patch
deleted file mode 100644
index 14fb0bb..0000000
--- a/meta-python/recipes-extended/python-pyparted/python3-pyparted/0001-fix-version-float-check.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-check_mod_version breaks if module version is of x.y.z form
-use a regex to help cast x.y.z version to a float
-
-Upstream-Status: Pending
-
-Index: git/setup.py
-===================================================================
---- git.orig/setup.py
-+++ git/setup.py
-@@ -25,6 +25,7 @@ import glob
- import os
- import platform
- import sys
-+import re
- from distutils.ccompiler import new_compiler
- from distutils.errors import CompileError
- from distutils.errors import LinkError
-@@ -51,6 +52,8 @@ def pkgconfig(*packages, **kwargs):
- 
- def check_mod_version(module, version):
-     modversion = subprocess.check_output(["pkg-config", "--modversion", module])
-+    match = re.search(b'([0-9]+\.[0-9]+)', modversion)
-+    modversion = match.group(0)
-     if not float(modversion) >= float(version):
-         sys.stderr.write("*** Minimum required %s version: %s, found: %s\n" % (module, version, modversion,))
-         sys.exit(1)
diff --git a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.10.7.bb b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.1.bb
similarity index 100%
rename from meta-python/recipes-extended/python-pyparted/python3-pyparted_3.10.7.bb
rename to meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.1.bb
-- 
2.7.4


