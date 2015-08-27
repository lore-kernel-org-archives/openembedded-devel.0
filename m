Return-Path: <ticotimo@gmail.com>
Received: from mail-yk0-f182.google.com (mail-yk0-f182.google.com
	[209.85.160.182])
	by mail.openembedded.org (Postfix) with ESMTP id 52EF860043
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 15:05:49 +0000 (UTC)
Received: by ykdt205 with SMTP id t205so22848607ykd.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 08:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=bf+QZGo6Joiuxj+Eb2DfqwRUcZuoS3AF8Ol7MWdiZ6o=;
	b=uMZidyXWjVVn6KY9KT1gNnLKh1SDb5lmV+OHwRiTMVmt7T6881/Zfw3pUXOUmnSBbu
	KQkdUxA/j01Zp/CpJ0mmPxEZ5KHSdfZIw0cT8/FqUo+hiPW+0UhoacjLTMci1cYskfSB
	qkGAVprWcRFfOfthbAUKt1AinALqFs+gYZOGHmRMOfGCALF/2XDbwsaGm7bqwYZGfyue
	pXbgJjJ/zWhnOz4RQQxsjMV/WjJ6ojKghFjKmA2QYDAvtloEDki91KwIkLn+rY+Br78s
	A+ERlxx4LHXZX0Mq9LEK4ZHflIhn6F9meea1Q3Rn9Z+aCxhbkucGgrilR3xSqnTFRHcz
	0afQ==
X-Received: by 10.129.115.3 with SMTP id o3mr3705811ywc.43.1440687949905;
	Thu, 27 Aug 2015 08:05:49 -0700 (PDT)
Received: from localhost.localdomain.localdomain
	(75-128-22-150.dhcp.snlo.ca.charter.com. [75.128.22.150])
	by smtp.gmail.com with ESMTPSA id
	q130sm1988344ywb.36.2015.08.27.08.05.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Aug 2015 08:05:47 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Aug 2015 08:05:31 -0700
Message-Id: <1440687931-19369-1-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [meta-python][PATCH v2] python-pyparted: update to 3.10.5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Aug 2015 15:05:52 -0000

Changes since v1:
  * use git tag rather than discouraged github archives
  * add patch to fix float cast error when version is x.y.z form
  * add minimal parted version (>= 2.3) to RDEPENDS

NOTE:
  If your tree defaults to an earlier parted version (e.g. 1.8.6),
  you will need to add PREFERRED_VERSION_parted = "3.%" to local.conf
  or you will see a do_compile error (complaining about required
  libparted version).
---
 .../0001-fix-version-float-check.patch             | 26 +++++++++++++++++++++
 .../python-pyparted/python-pyparted_3.10.5.bb      | 27 ++++++++++++++++++++++
 .../python-pyparted/python-pyparted_3.9.bb         | 23 ------------------
 3 files changed, 53 insertions(+), 23 deletions(-)
 create mode 100644 meta-python/recipes-extended/python-pyparted/python-pyparted/0001-fix-version-float-check.patch
 create mode 100644 meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.5.bb
 delete mode 100644 meta-python/recipes-extended/python-pyparted/python-pyparted_3.9.bb

diff --git a/meta-python/recipes-extended/python-pyparted/python-pyparted/0001-fix-version-float-check.patch b/meta-python/recipes-extended/python-pyparted/python-pyparted/0001-fix-version-float-check.patch
new file mode 100644
index 0000000..db3ab9f
--- /dev/null
+++ b/meta-python/recipes-extended/python-pyparted/python-pyparted/0001-fix-version-float-check.patch
@@ -0,0 +1,26 @@
+check_mod_version breaks if module version is of x.y.z form
+use a regex to help cast x.y.z version to a float
+
+Upstream-Status: Pending
+
+Index: git/setup.py
+===================================================================
+--- git.orig/setup.py
++++ git/setup.py
+@@ -25,6 +25,7 @@ import glob
+ import os
+ import platform
+ import sys
++import re
+ from distutils.ccompiler import new_compiler
+ from distutils.errors import CompileError
+ from distutils.errors import LinkError
+@@ -51,6 +52,8 @@ def pkgconfig(*packages, **kwargs):
+ 
+ def check_mod_version(module, version):
+     modversion = subprocess.check_output(["pkg-config", "--modversion", module])
++    match = re.search('([0-9]+\.[0-9]+)', modversion)
++    modversion = match.group(0)
+     if not float(modversion) >= float(version):
+         sys.stderr.write("*** Minimum required %s version: %s, found: %s\n" % (module, version, modversion,))
+         sys.exit(1)
diff --git a/meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.5.bb b/meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.5.bb
new file mode 100644
index 0000000..d5b8f9a
--- /dev/null
+++ b/meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.5.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "pyparted is a set of Python modules that provide Python programmers \
+an interface to libparted, the GNU parted library for disk partitioning and \
+filesystem manipulation."
+SUMMARY = "Python bindings for libparted"
+HOMEPAGE = "https://github.com/rhinstaller/pyparted"
+LICENSE = "GPL-2.0+"
+LIC_FILES_CHKSUM = "\
+    file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
+    file://src/_pedmodule.c;startline=10;endline=22;md5=ebcb25dde1ac9c46e986dec79b404e7e \
+"
+DEPENDS += "parted python-re"
+
+PV = "3.10.5+git${SRCPV}"
+
+# upstream only publishes releases in github archives which are discouraged
+SRCREV = "75bba5a5c8b65b21979d69421f661f7708304191"
+SRC_URI = "git://github.com/rhinstaller/pyparted.git;protocol=https \
+           file://0001-fix-version-float-check.patch \
+"
+S = "${WORKDIR}/git"
+
+inherit distutils
+
+RDEPENDS_${PN} += "python-stringold python-codecs python-math parted (>= 2.3)"
+RDEPENDS_${PN}_class-native = ""
+
+BBCLASSEXTEND += "native"
diff --git a/meta-python/recipes-extended/python-pyparted/python-pyparted_3.9.bb b/meta-python/recipes-extended/python-pyparted/python-pyparted_3.9.bb
deleted file mode 100644
index bfb4f6f..0000000
--- a/meta-python/recipes-extended/python-pyparted/python-pyparted_3.9.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "pyparted is a set of Python modules that provide Python programmers \
-an interface to libparted, the GNU parted library for disk partitioning and \
-filesystem manipulation."
-SUMMARY = "Python bindings for libparted"
-HOMEPAGE = "https://fedorahosted.org/pyparted/"
-LICENSE = "GPL-2.0+"
-LIC_FILES_CHKSUM = "\
-    file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
-    file://src/_pedmodule.c;startline=10;endline=22;md5=70c62bd73782a03f56a0571a9f08ea46 \
-"
-DEPENDS += "parted"
-
-SRC_URI = "https://fedorahosted.org/releases/p/y/pyparted/pyparted-${PV}.tar.gz"
-SRC_URI[md5sum] = "f16c7ef7f5fa4a43fcb2a4654b487e39"
-SRC_URI[sha256sum] = "a56712e3d058ce3d859c158236dbbf45224018919efd3d880ea80f9e0d0bebbb"
-S = "${WORKDIR}/pyparted-${PV}"
-
-inherit distutils
-
-RDEPENDS_${PN} += "python-stringold python-codecs python-math"
-RDEPENDS_${PN}_class-native = ""
-
-BBCLASSEXTEND += "native"
-- 
2.1.0


