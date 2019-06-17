Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 71D417E6BD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2019 10:23:20 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x5HANKMP027812
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2019 12:23:20 +0200
Received: from dev.vm6.ccp.siemens.com (MD1FZU9C.ad001.siemens.net
	[139.16.117.28])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id x5HANICU001916;
	Mon, 17 Jun 2019 12:23:18 +0200
Received: from dev.localdomain (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 5934F10D1262;
	Mon, 17 Jun 2019 12:23:18 +0200 (CEST)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jun 2019 12:23:05 +0200
Message-Id: <20190617102305.20150-3-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190617102305.20150-1-pascal.bach@siemens.com>
References: <20190617102305.20150-1-pascal.bach@siemens.com>
Subject: [meta-oe][PATCHv4 3/3] python3-protobuf, python-protobuf: 3.6.1 -> 3.8.0
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
X-List-Received-Date: Mon, 17 Jun 2019 10:23:20 -0000

The patch for Python 3.7 compatibility is already in 3.8.0.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 .../recipes-devtools/python/python-protobuf.inc    |  4 +-
 ...-protobuf_3.6.1.bb => python-protobuf_3.8.0.bb} |  0
 .../0001-Add-Python-3.7-compatibility-4862.patch   | 98 ----------------------
 ...protobuf_3.6.1.bb => python3-protobuf_3.8.0.bb} |  1 -
 4 files changed, 2 insertions(+), 101 deletions(-)
 rename meta-python/recipes-devtools/python/{python-protobuf_3.6.1.bb => python-protobuf_3.8.0.bb} (100%)
 delete mode 100644 meta-python/recipes-devtools/python/python3-protobuf/0001-Add-Python-3.7-compatibility-4862.patch
 rename meta-python/recipes-devtools/python/{python3-protobuf_3.6.1.bb => python3-protobuf_3.8.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python-protobuf.inc b/meta-python/recipes-devtools/python/python-protobuf.inc
index 54eacc0b7..2929700a0 100644
--- a/meta-python/recipes-devtools/python/python-protobuf.inc
+++ b/meta-python/recipes-devtools/python/python-protobuf.inc
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec
 
 inherit pypi
 
-SRC_URI[md5sum] = "e2daef80e70249aa1f05363670c6b3f8"
-SRC_URI[sha256sum] = "1489b376b0f364bcc6f89519718c057eb191d7ad6f1b395ffd93d1aa45587811"
+SRC_URI[md5sum] = "b7095f3eb736459716d606677b5a29ee"
+SRC_URI[sha256sum] = "8c61cc8a76e9d381c665aecc5105fa0f1878cf7db8b5cd17202603bcb386d0fc"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
diff --git a/meta-python/recipes-devtools/python/python-protobuf_3.6.1.bb b/meta-python/recipes-devtools/python/python-protobuf_3.8.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-protobuf_3.6.1.bb
rename to meta-python/recipes-devtools/python/python-protobuf_3.8.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-protobuf/0001-Add-Python-3.7-compatibility-4862.patch b/meta-python/recipes-devtools/python/python3-protobuf/0001-Add-Python-3.7-compatibility-4862.patch
deleted file mode 100644
index da5e73b15..000000000
--- a/meta-python/recipes-devtools/python/python3-protobuf/0001-Add-Python-3.7-compatibility-4862.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-From 539bc017a62f91bdf7c547b58948cb5a2f59d918 Mon Sep 17 00:00:00 2001
-From: Ben Webb <ben@salilab.org>
-Date: Thu, 12 Jul 2018 10:58:10 -0700
-Subject: [PATCH] Add Python 3.7 compatibility (#4862)
-
-Compilation of Python wrappers fails with Python 3.7 because
-the Python folks changed their C API such that
-PyUnicode_AsUTF8AndSize() now returns a const char* rather
-than a char*. Add a patch to work around. Relates #4086.
-
-Upstream-Status: Backport [https://github.com/protocolbuffers/protobuf.git]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
----
- google/protobuf/pyext/descriptor.cc            | 2 +-
- google/protobuf/pyext/descriptor_containers.cc | 2 +-
- google/protobuf/pyext/descriptor_pool.cc       | 2 +-
- google/protobuf/pyext/extension_dict.cc        | 2 +-
- google/protobuf/pyext/message.cc               | 4 ++--
- 5 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/google/protobuf/pyext/descriptor.cc b/google/protobuf/pyext/descriptor.cc
-index 8af0cb1..19a1c38 100644
---- a/google/protobuf/pyext/descriptor.cc
-+++ b/google/protobuf/pyext/descriptor.cc
-@@ -56,7 +56,7 @@
-   #endif
-   #define PyString_AsStringAndSize(ob, charpp, sizep) \
-     (PyUnicode_Check(ob)? \
--       ((*(charpp) = PyUnicode_AsUTF8AndSize(ob, (sizep))) == NULL? -1: 0): \
-+       ((*(charpp) = const_cast<char*>(PyUnicode_AsUTF8AndSize(ob, (sizep)))) == NULL? -1: 0): \
-        PyBytes_AsStringAndSize(ob, (charpp), (sizep)))
- #endif
- 
-diff --git a/google/protobuf/pyext/descriptor_containers.cc b/google/protobuf/pyext/descriptor_containers.cc
-index bc007f7..0153664 100644
---- a/google/protobuf/pyext/descriptor_containers.cc
-+++ b/google/protobuf/pyext/descriptor_containers.cc
-@@ -66,7 +66,7 @@
-   #endif
-   #define PyString_AsStringAndSize(ob, charpp, sizep) \
-     (PyUnicode_Check(ob)? \
--       ((*(charpp) = PyUnicode_AsUTF8AndSize(ob, (sizep))) == NULL? -1: 0): \
-+       ((*(charpp) = const_cast<char*>(PyUnicode_AsUTF8AndSize(ob, (sizep)))) == NULL? -1: 0): \
-        PyBytes_AsStringAndSize(ob, (charpp), (sizep)))
- #endif
- 
-diff --git a/google/protobuf/pyext/descriptor_pool.cc b/google/protobuf/pyext/descriptor_pool.cc
-index 95882ae..962accc 100644
---- a/google/protobuf/pyext/descriptor_pool.cc
-+++ b/google/protobuf/pyext/descriptor_pool.cc
-@@ -48,7 +48,7 @@
-   #endif
-   #define PyString_AsStringAndSize(ob, charpp, sizep) \
-     (PyUnicode_Check(ob)? \
--       ((*(charpp) = PyUnicode_AsUTF8AndSize(ob, (sizep))) == NULL? -1: 0): \
-+       ((*(charpp) = const_cast<char*>(PyUnicode_AsUTF8AndSize(ob, (sizep)))) == NULL? -1: 0): \
-        PyBytes_AsStringAndSize(ob, (charpp), (sizep)))
- #endif
- 
-diff --git a/google/protobuf/pyext/extension_dict.cc b/google/protobuf/pyext/extension_dict.cc
-index 018b5c2..174c547 100644
---- a/google/protobuf/pyext/extension_dict.cc
-+++ b/google/protobuf/pyext/extension_dict.cc
-@@ -53,7 +53,7 @@
-   #endif
-   #define PyString_AsStringAndSize(ob, charpp, sizep) \
-     (PyUnicode_Check(ob)? \
--       ((*(charpp) = PyUnicode_AsUTF8AndSize(ob, (sizep))) == NULL? -1: 0): \
-+       ((*(charpp) = const_cast<char*>(PyUnicode_AsUTF8AndSize(ob, (sizep)))) == NULL? -1: 0): \
-        PyBytes_AsStringAndSize(ob, (charpp), (sizep)))
- #endif
- 
-diff --git a/google/protobuf/pyext/message.cc b/google/protobuf/pyext/message.cc
-index 5893533..31094b7 100644
---- a/google/protobuf/pyext/message.cc
-+++ b/google/protobuf/pyext/message.cc
-@@ -79,7 +79,7 @@
-     (PyUnicode_Check(ob)? PyUnicode_AsUTF8(ob): PyBytes_AsString(ob))
-   #define PyString_AsStringAndSize(ob, charpp, sizep) \
-     (PyUnicode_Check(ob)? \
--       ((*(charpp) = PyUnicode_AsUTF8AndSize(ob, (sizep))) == NULL? -1: 0): \
-+       ((*(charpp) = const_cast<char*>(PyUnicode_AsUTF8AndSize(ob, (sizep)))) == NULL? -1: 0): \
-        PyBytes_AsStringAndSize(ob, (charpp), (sizep)))
-   #endif
- #endif
-@@ -1529,7 +1529,7 @@ PyObject* HasField(CMessage* self, PyObject* arg) {
-     return NULL;
-   }
- #else
--  field_name = PyUnicode_AsUTF8AndSize(arg, &size);
-+  field_name = const_cast<char*>(PyUnicode_AsUTF8AndSize(arg, &size));
-   if (!field_name) {
-     return NULL;
-   }
--- 
-2.7.4
-
diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.6.1.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.8.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-protobuf_3.6.1.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_3.8.0.bb
index 9b0668a02..30ea34e90 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_3.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_3.8.0.bb
@@ -1,7 +1,6 @@
 inherit setuptools3
 require python-protobuf.inc
 
-SRC_URI += "file://0001-Add-Python-3.7-compatibility-4862.patch"
 DEPENDS += "protobuf"
 DISTUTILS_BUILD_ARGS += "--cpp_implementation"
 DISTUTILS_INSTALL_ARGS += "--cpp_implementation"
-- 
2.11.0


