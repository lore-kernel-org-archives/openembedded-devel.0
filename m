Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id B8A04789AF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2018 07:26:04 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id w6J7Q4QD007131
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2018 09:26:05 +0200
Received: from dev.vm6.ccp.siemens.com ([139.22.44.55])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id w6J7Q4sc002236;
	Thu, 19 Jul 2018 09:26:04 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 1E28D10CD064;
	Thu, 19 Jul 2018 09:26:04 +0200 (CEST)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jul 2018 09:25:01 +0200
Message-Id: <20180719072501.14944-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH] python-pyzmq, python3-pyzmq: update to 17.1.0
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
X-List-Received-Date: Thu, 19 Jul 2018 07:26:05 -0000

Also the package is licensed under both BSD and LGPL-3.0.
This the license checksum was updated to reflect this.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 .../{python-pyzmq_14.7.0.bb => python-pyzmq.inc}   | 17 +++++++-----
 .../python/python-pyzmq/club-rpath-out.patch       | 31 +++++++---------------
 .../recipes-devtools/python/python-pyzmq_17.1.0.bb |  2 ++
 .../python/python3-pyzmq_17.1.0.bb                 |  2 ++
 4 files changed, 23 insertions(+), 29 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyzmq_14.7.0.bb => python-pyzmq.inc} (58%)
 create mode 100644 meta-python/recipes-devtools/python/python-pyzmq_17.1.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pyzmq_17.1.0.bb

diff --git a/meta-python/recipes-devtools/python/python-pyzmq_14.7.0.bb b/meta-python/recipes-devtools/python/python-pyzmq.inc
similarity index 58%
rename from meta-python/recipes-devtools/python/python-pyzmq_14.7.0.bb
rename to meta-python/recipes-devtools/python/python-pyzmq.inc
index b5baf82df..2447c2f34 100644
--- a/meta-python/recipes-devtools/python/python-pyzmq_14.7.0.bb
+++ b/meta-python/recipes-devtools/python/python-pyzmq.inc
@@ -1,16 +1,19 @@
 SUMMARY = "Pyzmq provides Zero message queue access for the Python language"
 HOMEPAGE = "http://zeromq.org/bindings:python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING.BSD;md5=11c65680f637c3df7f58bbc8d133e96e"
+LICENSE = "BSD & LGPL-3.0"
+LIC_FILES_CHKSUM = "file://COPYING.BSD;md5=11c65680f637c3df7f58bbc8d133e96e \
+                    file://COPYING.LESSER;md5=12c592fa0bcfff3fb0977b066e9cb69e"
 DEPENDS = "zeromq"
 
-SRC_URI = "file://club-rpath-out.patch"
-SRC_URI[md5sum] = "87e3abb33af5794db5ae85c667bbf324"
-SRC_URI[sha256sum] = "77994f80360488e7153e64e5959dc5471531d1648e3a4bff14a714d074a38cc2"
+FILESEXTRAPATHS_prepend := "${THISDIR}/python-pyzmq:"
 
-inherit pypi setuptools pkgconfig
+SRC_URI += "file://club-rpath-out.patch"
+SRC_URI[md5sum] = "aecdfc328193fbd81f6dc23228319943"
+SRC_URI[sha256sum] = "2199f753a230e26aec5238b0518b036780708a4c887d4944519681a920b9dee4"
 
-RDEPENDS_${PN} += "python-multiprocessing"
+inherit pypi pkgconfig
+
+RDEPENDS_${PN} += "${PYTHON_PN}-multiprocessing"
 
 FILES_${PN}-dbg =+ "${PYTHON_SITEPACKAGES_DIR}/zmq/backend/cython/.debug"
 
diff --git a/meta-python/recipes-devtools/python/python-pyzmq/club-rpath-out.patch b/meta-python/recipes-devtools/python/python-pyzmq/club-rpath-out.patch
index 2dc3b73f9..936f16585 100644
--- a/meta-python/recipes-devtools/python/python-pyzmq/club-rpath-out.patch
+++ b/meta-python/recipes-devtools/python/python-pyzmq/club-rpath-out.patch
@@ -1,26 +1,13 @@
 diff --git a/setup.py b/setup.py
-index 62df445..1fdbdeb 100755
+index d243eaa..98099bc 100755
 --- a/setup.py
 +++ b/setup.py
-@@ -213,12 +213,6 @@ def settings_from_prefix(prefix=None, bundle_libzmq_dylib=False):
-                 pass
-                 # unused rpath args for OS X:
-                 # settings['extra_link_args'] = ['-Wl,-rpath','-Wl,$ORIGIN/..']
--            else:
--                settings['runtime_library_dirs'] += ['$ORIGIN/..']
--        elif sys.platform != 'darwin':
--            settings['runtime_library_dirs'] += [
--                os.path.abspath(x) for x in settings['library_dirs']
--            ]
-     
-     return settings
+@@ -192,8 +192,6 @@ def _add_rpath(settings, path):
+     """
+     if sys.platform == 'darwin':
+         settings['extra_link_args'].extend(['-Wl,-rpath','-Wl,%s' % path])
+-    else:
+-        settings['runtime_library_dirs'].append(path)
  
-@@ -592,8 +586,6 @@ class Configure(build_ext):
-                 pass
-                 # unused rpath args for OS X:
-                 # settings['extra_link_args'] = ['-Wl,-rpath','-Wl,$ORIGIN/../zmq']
--            else:
--                settings['runtime_library_dirs'] = [ os.path.abspath(pjoin('.', 'zmq')) ]
-         
-         line()
-         info("Configure: Autodetecting ZMQ settings...")
+ def settings_from_prefix(prefix=None, bundle_libzmq_dylib=False):
+     """load appropriate library/include settings from ZMQ prefix"""
diff --git a/meta-python/recipes-devtools/python/python-pyzmq_17.1.0.bb b/meta-python/recipes-devtools/python/python-pyzmq_17.1.0.bb
new file mode 100644
index 000000000..b690106bb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyzmq_17.1.0.bb
@@ -0,0 +1,2 @@
+require python-pyzmq.inc
+inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_17.1.0.bb b/meta-python/recipes-devtools/python/python3-pyzmq_17.1.0.bb
new file mode 100644
index 000000000..050f53af1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_17.1.0.bb
@@ -0,0 +1,2 @@
+require python-pyzmq.inc
+inherit setuptools3
-- 
2.11.0


