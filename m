Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C51777C6A0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2019 06:06:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x1F66348029182
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Feb 2019 22:06:03 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.435.0;
	Thu, 14 Feb 2019 22:06:02 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 15 Feb 2019 01:04:48 -0500
Message-ID: <39b64bd290e225637268ac68bd7d493454bd74d0.1550210289.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1550210289.git.hongxu.jia@windriver.com>
References: <cover.1550210289.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 04/12] python3-h5py: add version 2.9.0
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
X-List-Received-Date: Fri, 15 Feb 2019 06:06:02 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-cross-compiling-support.patch             | 46 ++++++++++++++++++++++
 .../recipes-devtools/python/python3-h5py_2.9.0.bb  | 30 ++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-h5py_2.9.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch b/meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch
new file mode 100644
index 0000000..ff50c85
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch
@@ -0,0 +1,46 @@
+From 7e3b1745c1fef34683a0610381dd3308ad4d1ba9 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 29 Jan 2019 17:08:32 +0800
+Subject: [PATCH] cross compiling support
+
+Remove useless dirs
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ setup_build.py     | 4 ----
+ setup_configure.py | 2 +-
+ 2 files changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/setup_build.py b/setup_build.py
+index 85b321a..2c78e92 100644
+--- a/setup_build.py
++++ b/setup_build.py
+@@ -53,10 +53,6 @@ if sys.platform.startswith('win'):
+         ('_HDF5USEDLL_', None),
+         ('H5_BUILT_AS_DYNAMIC_LIB', None)
+     ])
+-else:
+-    FALLBACK_PATHS['include_dirs'].extend(['/opt/local/include', '/usr/local/include'])
+-    FALLBACK_PATHS['library_dirs'].extend(['/opt/local/lib', '/usr/local/lib'])
+-
+ 
+ class h5py_build_ext(build_ext):
+ 
+diff --git a/setup_configure.py b/setup_configure.py
+index a2de76a..197f2da 100644
+--- a/setup_configure.py
++++ b/setup_configure.py
+@@ -208,7 +208,7 @@ def autodetect_version(hdf5_dir=None):
+     else:
+         regexp = re.compile(r'^libhdf5.so')
+ 
+-    libdirs = ['/usr/local/lib', '/opt/local/lib']
++    libdirs = []
+     try:
+         if pkgconfig.exists("hdf5"):
+             libdirs.extend(pkgconfig.parse("hdf5")['library_dirs'])
+-- 
+2.7.4
+
diff --git a/meta-python/recipes-devtools/python/python3-h5py_2.9.0.bb b/meta-python/recipes-devtools/python/python3-h5py_2.9.0.bb
new file mode 100644
index 0000000..bca7757
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-h5py_2.9.0.bb
@@ -0,0 +1,30 @@
+SUMMARY = "Provides both a high- and low-level interface to the HDF5 library from Python. "
+HOMEPAGE = "https://www.h5py.org/"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=107;endline=107;md5=795ecad0d261c998cc526c84a822dff6"
+
+SRC_URI = "git://github.com/h5py/h5py.git \
+           file://0001-cross-compiling-support.patch \
+          "
+SRCREV ?= "8d96a14c3508de1bde77aec5db302e478dc5dbc4"
+
+inherit setuptools3
+
+S = "${WORKDIR}/git"
+
+BBCLASSEXTEND = "native"
+
+DEPENDS = "python3-pkgconfig-native \
+           python3-cython-native \
+           python3-numpy-native \
+           python3-six-native \
+           python3 \
+           hdf5 \
+          "
+
+RDEPENDS_${PN} = "python3-numpy \
+                  python3-six \
+                 "
+
+export HDF5_VERSION="1.8.19"
-- 
2.8.1


