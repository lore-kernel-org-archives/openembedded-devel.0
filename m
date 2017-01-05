Return-Path: <pascal.bach@siemens.com>
X-Greylist: delayed 354 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 05 Jan 2017 17:18:31 UTC
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id F304271984
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jan 2017 17:18:31 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v05HCnow007084
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Thu, 5 Jan 2017 18:12:49 +0100
Received: from dev.sbt.siemens.com ([139.16.29.3])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id v05HCaHE005092;
	Thu, 5 Jan 2017 18:12:49 +0100
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jan 2017 18:12:31 +0100
Message-Id: <1483636352-22096-3-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1483636352-22096-1-git-send-email-pascal.bach@siemens.com>
References: <1483636352-22096-1-git-send-email-pascal.bach@siemens.com>
Cc: Pascal Bach <pascal.bach@nextrem.ch>
Subject: [meta-python][PATCH 3/4] python-yaml: provide both python2 and python3 package
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
X-List-Received-Date: Thu, 05 Jan 2017 17:18:32 -0000

From: Pascal Bach <pascal.bach@nextrem.ch>

Further the recipe is simplified by using the pypi and setuptools class.
The custom setup.py is no onger necessary.

Signed-off-by: Pascal Bach <pascal.bach@nextrem.ch>
---
 .../recipes-devtools/python/python-pyyaml.inc      | 14 +++++
 .../recipes-devtools/python/python-pyyaml/setup.py | 64 ----------------------
 .../recipes-devtools/python/python-pyyaml_3.12.bb  | 26 +--------
 .../recipes-devtools/python/python3-pyyaml_3.12.bb |  2 +
 4 files changed, 18 insertions(+), 88 deletions(-)
 create mode 100755 meta-python/recipes-devtools/python/python-pyyaml.inc
 delete mode 100644 meta-python/recipes-devtools/python/python-pyyaml/setup.py
 mode change 100644 => 100755 meta-python/recipes-devtools/python/python-pyyaml_3.12.bb
 create mode 100755 meta-python/recipes-devtools/python/python3-pyyaml_3.12.bb

diff --git a/meta-python/recipes-devtools/python/python-pyyaml.inc b/meta-python/recipes-devtools/python/python-pyyaml.inc
new file mode 100755
index 0000000..41321ca
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyyaml.inc
@@ -0,0 +1,14 @@
+SUMMARY = "Python support for YAML"
+HOMEPAGE = "http://www.pyyaml.org"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6015f088759b10e0bc2bf64898d4ae17"
+DEPENDS = "libyaml ${PYTHON_PN}-cython-native"
+
+PYPI_PACKAGE = "PyYAML"
+inherit pypi
+
+SRC_URI[md5sum] = "4c129761b661d181ebf7ff4eb2d79950"
+SRC_URI[sha256sum] = "592766c6303207a20efc445587778322d7f73b161bd994f227adaa341ba212ab"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-pyyaml/setup.py b/meta-python/recipes-devtools/python/python-pyyaml/setup.py
deleted file mode 100644
index 2ed1c94..0000000
--- a/meta-python/recipes-devtools/python/python-pyyaml/setup.py
+++ /dev/null
@@ -1,64 +0,0 @@
-NAME = 'PyYAML'
-VERSION = '3.10'
-DESCRIPTION = "YAML parser and emitter for Python"
-LONG_DESCRIPTION = """\
-YAML is a data serialization format designed for human readability and
-interaction with scripting languages.  PyYAML is a YAML parser and
-emitter for Python.
-
-PyYAML features a complete YAML 1.1 parser, Unicode support, pickle
-support, capable extension API, and sensible error messages.  PyYAML
-supports standard YAML tags and provides Python-specific tags that allow
-to represent an arbitrary Python object.
-
-PyYAML is applicable for a broad range of tasks from complex
-configuration files to object serialization and persistance."""
-AUTHOR = "Kirill Simonov"
-AUTHOR_EMAIL = 'xi@resolvent.net'
-LICENSE = "MIT"
-PLATFORMS = "Any"
-URL = "http://pyyaml.org/wiki/PyYAML"
-DOWNLOAD_URL = "http://pyyaml.org/download/pyyaml/%s-%s.tar.gz" % (NAME, VERSION)
-CLASSIFIERS = [
-    "Development Status :: 5 - Production/Stable",
-    "Intended Audience :: Developers",
-    "License :: OSI Approved :: MIT License",
-    "Operating System :: OS Independent",
-    "Programming Language :: Python",
-    "Topic :: Software Development :: Libraries :: Python Modules",
-    "Topic :: Text Processing :: Markup",
-]
-
-from distutils.core import setup
-from distutils.extension import Extension
-from Cython.Distutils import build_ext
-
-import sys, os.path
-
-
-if __name__ == '__main__':
-
-    setup(
-        name=NAME,
-        version=VERSION,
-        description=DESCRIPTION,
-        long_description=LONG_DESCRIPTION,
-        author=AUTHOR,
-        author_email=AUTHOR_EMAIL,
-        license=LICENSE,
-        platforms=PLATFORMS,
-        url=URL,
-        download_url=DOWNLOAD_URL,
-        classifiers=CLASSIFIERS,
-
-        package_dir={'': 'lib'},
-        packages=['yaml'],
-
-        ext_modules = [
-        Extension( "_yaml", ["ext/_yaml.pyx"], libraries = ["yaml"] )
-        ],
-
-        cmdclass={
-            'build_ext': build_ext,
-        },
-    )
diff --git a/meta-python/recipes-devtools/python/python-pyyaml_3.12.bb b/meta-python/recipes-devtools/python/python-pyyaml_3.12.bb
old mode 100644
new mode 100755
index 0899a2e..6d9f3e9
--- a/meta-python/recipes-devtools/python/python-pyyaml_3.12.bb
+++ b/meta-python/recipes-devtools/python/python-pyyaml_3.12.bb
@@ -1,24 +1,2 @@
-SUMMARY = "Python support for YAML"
-HOMEPAGE = "http://www.pyyaml.org"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6015f088759b10e0bc2bf64898d4ae17"
-DEPENDS = "libyaml python-cython-native"
-
-SRC_URI = "http://pyyaml.org/download/pyyaml/PyYAML-${PV}.tar.gz \
-           file://setup.py \
-"
-
-SRC_URI[md5sum] = "4c129761b661d181ebf7ff4eb2d79950"
-SRC_URI[sha256sum] = "592766c6303207a20efc445587778322d7f73b161bd994f227adaa341ba212ab"
-
-S = "${WORKDIR}/PyYAML-${PV}"
-
-inherit distutils
-
-do_configure_prepend() {
-    # upstream setup.py overcomplicated, use ours
-    install -m 0644 ${WORKDIR}/setup.py ${S}
-}
-
-BBCLASSEXTEND = "native nativesdk"
+inherit setuptools
+require python-pyyaml.inc
diff --git a/meta-python/recipes-devtools/python/python3-pyyaml_3.12.bb b/meta-python/recipes-devtools/python/python3-pyyaml_3.12.bb
new file mode 100755
index 0000000..470aca6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyyaml_3.12.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-pyyaml.inc
-- 
2.1.4


