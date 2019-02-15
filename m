Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 369146BE2A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2019 06:05:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x1F65XSm029116
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Feb 2019 22:05:33 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.435.0;
	Thu, 14 Feb 2019 22:05:33 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 15 Feb 2019 01:04:45 -0500
Message-ID: <1c1e5f7abb065068bd6ecf0905077b6dfbf3fd79.1550210289.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1550210289.git.hongxu.jia@windriver.com>
References: <cover.1550210289.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 01/12] python3-protobuf: add cpp implementation support
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
X-List-Received-Date: Fri, 15 Feb 2019 06:05:33 -0000
Content-Type: text/plain

- Compiling with option `--cpp_implementation', add cpp implementation
support which requires to build with protobuf.

- Workaround native compile failure while host gcc <= 4.8
Setting environment KOKORO_BUILD_NUMBER, the build will explicitly compile
with option `-std=c++11', it could  workaround native compile failure while
host gcc <= 4.8
...
/usr/include/c++/4.8/bits/c++0x_warning.h:32:2: error: #error This file
requires compiler and library support for the ISO C++ 2011 standard. This
support is currently experimental, and must be enabled with the -std=c++11
or -std=gnu++11 compiler options
...

- Add Python 3.7 compatibility

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-devtools/python/python-protobuf.inc    |  1 +
 .../0001-Add-Python-3.7-compatibility-4862.patch   | 98 ++++++++++++++++++++++
 .../python/python3-protobuf_3.6.1.bb               |  9 ++
 3 files changed, 108 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-protobuf/0001-Add-Python-3.7-compatibility-4862.patch

diff --git a/meta-python/recipes-devtools/python/python-protobuf.inc b/meta-python/recipes-devtools/python/python-protobuf.inc
index 5103791..54eacc0 100644
--- a/meta-python/recipes-devtools/python/python-protobuf.inc
+++ b/meta-python/recipes-devtools/python/python-protobuf.inc
@@ -29,3 +29,4 @@ RDEPENDS_${PN} += " \
 
 # For usage in other recipies when compiling protobuf files (e.g. by grpcio-tools)
 BBCLASSEXTEND = "native nativesdk"
+
diff --git a/meta-python/recipes-devtools/python/python3-protobuf/0001-Add-Python-3.7-compatibility-4862.patch b/meta-python/recipes-devtools/python/python3-protobuf/0001-Add-Python-3.7-compatibility-4862.patch
new file mode 100644
index 0000000..da5e73b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-protobuf/0001-Add-Python-3.7-compatibility-4862.patch
@@ -0,0 +1,98 @@
+From 539bc017a62f91bdf7c547b58948cb5a2f59d918 Mon Sep 17 00:00:00 2001
+From: Ben Webb <ben@salilab.org>
+Date: Thu, 12 Jul 2018 10:58:10 -0700
+Subject: [PATCH] Add Python 3.7 compatibility (#4862)
+
+Compilation of Python wrappers fails with Python 3.7 because
+the Python folks changed their C API such that
+PyUnicode_AsUTF8AndSize() now returns a const char* rather
+than a char*. Add a patch to work around. Relates #4086.
+
+Upstream-Status: Backport [https://github.com/protocolbuffers/protobuf.git]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+---
+ google/protobuf/pyext/descriptor.cc            | 2 +-
+ google/protobuf/pyext/descriptor_containers.cc | 2 +-
+ google/protobuf/pyext/descriptor_pool.cc       | 2 +-
+ google/protobuf/pyext/extension_dict.cc        | 2 +-
+ google/protobuf/pyext/message.cc               | 4 ++--
+ 5 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/google/protobuf/pyext/descriptor.cc b/google/protobuf/pyext/descriptor.cc
+index 8af0cb1..19a1c38 100644
+--- a/google/protobuf/pyext/descriptor.cc
++++ b/google/protobuf/pyext/descriptor.cc
+@@ -56,7 +56,7 @@
+   #endif
+   #define PyString_AsStringAndSize(ob, charpp, sizep) \
+     (PyUnicode_Check(ob)? \
+-       ((*(charpp) = PyUnicode_AsUTF8AndSize(ob, (sizep))) == NULL? -1: 0): \
++       ((*(charpp) = const_cast<char*>(PyUnicode_AsUTF8AndSize(ob, (sizep)))) == NULL? -1: 0): \
+        PyBytes_AsStringAndSize(ob, (charpp), (sizep)))
+ #endif
+ 
+diff --git a/google/protobuf/pyext/descriptor_containers.cc b/google/protobuf/pyext/descriptor_containers.cc
+index bc007f7..0153664 100644
+--- a/google/protobuf/pyext/descriptor_containers.cc
++++ b/google/protobuf/pyext/descriptor_containers.cc
+@@ -66,7 +66,7 @@
+   #endif
+   #define PyString_AsStringAndSize(ob, charpp, sizep) \
+     (PyUnicode_Check(ob)? \
+-       ((*(charpp) = PyUnicode_AsUTF8AndSize(ob, (sizep))) == NULL? -1: 0): \
++       ((*(charpp) = const_cast<char*>(PyUnicode_AsUTF8AndSize(ob, (sizep)))) == NULL? -1: 0): \
+        PyBytes_AsStringAndSize(ob, (charpp), (sizep)))
+ #endif
+ 
+diff --git a/google/protobuf/pyext/descriptor_pool.cc b/google/protobuf/pyext/descriptor_pool.cc
+index 95882ae..962accc 100644
+--- a/google/protobuf/pyext/descriptor_pool.cc
++++ b/google/protobuf/pyext/descriptor_pool.cc
+@@ -48,7 +48,7 @@
+   #endif
+   #define PyString_AsStringAndSize(ob, charpp, sizep) \
+     (PyUnicode_Check(ob)? \
+-       ((*(charpp) = PyUnicode_AsUTF8AndSize(ob, (sizep))) == NULL? -1: 0): \
++       ((*(charpp) = const_cast<char*>(PyUnicode_AsUTF8AndSize(ob, (sizep)))) == NULL? -1: 0): \
+        PyBytes_AsStringAndSize(ob, (charpp), (sizep)))
+ #endif
+ 
+diff --git a/google/protobuf/pyext/extension_dict.cc b/google/protobuf/pyext/extension_dict.cc
+index 018b5c2..174c547 100644
+--- a/google/protobuf/pyext/extension_dict.cc
++++ b/google/protobuf/pyext/extension_dict.cc
+@@ -53,7 +53,7 @@
+   #endif
+   #define PyString_AsStringAndSize(ob, charpp, sizep) \
+     (PyUnicode_Check(ob)? \
+-       ((*(charpp) = PyUnicode_AsUTF8AndSize(ob, (sizep))) == NULL? -1: 0): \
++       ((*(charpp) = const_cast<char*>(PyUnicode_AsUTF8AndSize(ob, (sizep)))) == NULL? -1: 0): \
+        PyBytes_AsStringAndSize(ob, (charpp), (sizep)))
+ #endif
+ 
+diff --git a/google/protobuf/pyext/message.cc b/google/protobuf/pyext/message.cc
+index 5893533..31094b7 100644
+--- a/google/protobuf/pyext/message.cc
++++ b/google/protobuf/pyext/message.cc
+@@ -79,7 +79,7 @@
+     (PyUnicode_Check(ob)? PyUnicode_AsUTF8(ob): PyBytes_AsString(ob))
+   #define PyString_AsStringAndSize(ob, charpp, sizep) \
+     (PyUnicode_Check(ob)? \
+-       ((*(charpp) = PyUnicode_AsUTF8AndSize(ob, (sizep))) == NULL? -1: 0): \
++       ((*(charpp) = const_cast<char*>(PyUnicode_AsUTF8AndSize(ob, (sizep)))) == NULL? -1: 0): \
+        PyBytes_AsStringAndSize(ob, (charpp), (sizep)))
+   #endif
+ #endif
+@@ -1529,7 +1529,7 @@ PyObject* HasField(CMessage* self, PyObject* arg) {
+     return NULL;
+   }
+ #else
+-  field_name = PyUnicode_AsUTF8AndSize(arg, &size);
++  field_name = const_cast<char*>(PyUnicode_AsUTF8AndSize(arg, &size));
+   if (!field_name) {
+     return NULL;
+   }
+-- 
+2.7.4
+
diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.6.1.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.6.1.bb
index 781d1dc..9b0668a 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_3.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_3.6.1.bb
@@ -1,2 +1,11 @@
 inherit setuptools3
 require python-protobuf.inc
+
+SRC_URI += "file://0001-Add-Python-3.7-compatibility-4862.patch"
+DEPENDS += "protobuf"
+DISTUTILS_BUILD_ARGS += "--cpp_implementation"
+DISTUTILS_INSTALL_ARGS += "--cpp_implementation"
+
+do_compile_prepend_class-native () {
+    export KOKORO_BUILD_NUMBER="1"
+}
-- 
2.8.1


