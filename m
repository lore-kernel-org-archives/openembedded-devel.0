Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3C7CD737F4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 10:07:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99953293"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Aug 2015 18:10:13 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t7OA6ug1007297
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 18:06:56 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 24 Aug 2015 18:07:01 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Aug 2015 18:07:16 +0800
Message-ID: <1440410841-15017-2-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1440410841-15017-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1440410841-15017-1-git-send-email-leimaohui@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [meta-oe][PATCH v6 1/6] cmpi-bindings: add new recipe
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
X-List-Received-Date: Mon, 24 Aug 2015 10:07:04 -0000
Content-Type: text/plain

Cmpi-bindings is the dependence of openlmi.

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../cmpi-bindings/0001-Fix-error.patch             | 26 ++++++++++++
 .../cmpi-bindings/0001-Modify-cmakelist.patch      | 41 +++++++++++++++++++
 .../0001-fix-the-build-error-when-python-3.0.patch | 31 ++++++++++++++
 .../cmpi-bindings-0.4.17-no-ruby-perl.patch        | 47 ++++++++++++++++++++++
 .../cmpi-bindings-0.4.17-sblim-sigsegv.patch       | 22 ++++++++++
 .../cmpi-bindings-0.9.5-python-lib-dir.patch       | 17 ++++++++
 .../cmpi-bindings/cmpi-bindings_git.bb             | 37 +++++++++++++++++
 7 files changed, 221 insertions(+)
 create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Fix-error.patch
 create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Modify-cmakelist.patch
 create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-fix-the-build-error-when-python-3.0.patch
 create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/cmpi-bindings-0.4.17-no-ruby-perl.patch
 create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/cmpi-bindings-0.4.17-sblim-sigsegv.patch
 create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/cmpi-bindings-0.9.5-python-lib-dir.patch
 create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_git.bb

diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Fix-error.patch b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Fix-error.patch
new file mode 100644
index 0000000..d1a303c
--- /dev/null
+++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Fix-error.patch
@@ -0,0 +1,26 @@
+From b8e791ce93a467081fb1594b91841e2f57c634a0 Mon Sep 17 00:00:00 2001
+From: Qian Lei <qianl.fnst@cn.fujitsu.com>
+Date: Fri, 16 Jan 2015 18:37:26 +0800
+Subject: [PATCH] Fix error
+
+Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
+---
+ swig/python/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/swig/python/CMakeLists.txt b/swig/python/CMakeLists.txt
+index 3976296..8073fc8 100644
+--- a/swig/python/CMakeLists.txt
++++ b/swig/python/CMakeLists.txt
+@@ -27,7 +27,7 @@ SET( SWIG_INPUT "${CMAKE_CURRENT_SOURCE_DIR}/../cmpi.i" )
+ ADD_CUSTOM_COMMAND (
+    OUTPUT  ${SWIG_OUTPUT}
+    COMMAND ${CMAKE_COMMAND} -E echo_append "Creating wrapper code for Python ..."
+-   COMMAND ${SWIG_EXECUTABLE} -python -Wall -threads -features autodoc -o ${SWIG_OUTPUT} -outdir ${CMAKE_CURRENT_BINARY_DIR} -I/usr/include ${SWIG_INPUT}
++   COMMAND ${SWIG_EXECUTABLE} -python -Wall -threads -features autodoc -o ${SWIG_OUTPUT} -outdir ${CMAKE_CURRENT_BINARY_DIR} -I$ENV{STAGING_INCDIR} ${SWIG_INPUT}
+    COMMAND ${CMAKE_COMMAND} -E echo "Done."
+    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
+    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/../*.i
+-- 
+1.8.3.1
+
diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Modify-cmakelist.patch b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Modify-cmakelist.patch
new file mode 100644
index 0000000..92e5e56
--- /dev/null
+++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Modify-cmakelist.patch
@@ -0,0 +1,41 @@
+From 070822507befe7c1b8bb1be2d36cb12141d03b8f Mon Sep 17 00:00:00 2001
+From: Qian Lei <qianl.fnst@cn.fujitsu.com>
+Date: Tue, 6 Jan 2015 18:38:32 +0800
+Subject: [PATCH] Change the install path in cmakelist
+
+Upstream-Status: Pending
+Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
+---
+ swig/python/CMakeLists.txt | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/swig/python/CMakeLists.txt b/swig/python/CMakeLists.txt
+index 3976296..93c87c1 100644
+--- a/swig/python/CMakeLists.txt
++++ b/swig/python/CMakeLists.txt
+@@ -56,18 +56,18 @@ TARGET_LINK_LIBRARIES( ${NAME} util )
+ 
+ INSTALL(TARGETS ${NAME} LIBRARY DESTINATION ${CMPI_LIBRARY_DIR})
+ # .py: swig generated
+-INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/cmpi.py DESTINATION ${PYTHON_SITE_DIR} )
++INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/cmpi.py DESTINATION $ENV{ENV_INSTALL_PATH} )
+ 
+ 
+ #
+ # cmpi_pywbem_bindings.py: provider implementation
+ #
+-INSTALL(FILES cmpi_pywbem_bindings.py DESTINATION ${PYTHON_SITE_DIR} )
++INSTALL(FILES cmpi_pywbem_bindings.py DESTINATION $ENV{ENV_INSTALL_PATH} )
+ #INSTALL(FILES Py_UnixProcessProvider.py DESTINATION /usr/lib/pycim )
+ 
+-INSTALL(CODE "EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c \"from py_compile import compile; compile('\$ENV{DESTDIR}${PYTHON_SITE_DIR}/cmpi.py', dfile='${PYTHON_SITE_DIR}/cmpi.py')\")")
++INSTALL(CODE "EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c \"from py_compile import compile; compile('\$ENV{DESTDIR}$ENV{ENV_INSTALL_PATH}/cmpi.py', dfile='\$ENV{ENV_INSTALL_PATH}/cmpi.py')\")")
+ 
+-INSTALL(CODE "EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c \"from py_compile import compile; compile('\$ENV{DESTDIR}${PYTHON_SITE_DIR}/cmpi_pywbem_bindings.py', dfile='${PYTHON_SITE_DIR}/cmpi_pywbem_bindings.py')\")")
++INSTALL(CODE "EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c \"from py_compile import compile; compile('\$ENV{DESTDIR}$ENV{ENV_INSTALL_PATH}/cmpi_pywbem_bindings.py', dfile='$ENV{ENV_INSTALL_PATH}/cmpi_pywbem_bindings.py')\")")
+ 
+ 
+ 
+-- 
+1.8.3.1
+
diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-fix-the-build-error-when-python-3.0.patch b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-fix-the-build-error-when-python-3.0.patch
new file mode 100644
index 0000000..0d6f029
--- /dev/null
+++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-fix-the-build-error-when-python-3.0.patch
@@ -0,0 +1,31 @@
+From 323ced03a66e6cd963d8277b66cfcc7dce740be7 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Fri, 17 Jul 2015 01:33:43 -0700
+Subject: [PATCH] fix Xthe build error when python>3.0
+
+Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
+---
+ src/target_python.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/target_python.c b/src/target_python.c
+index 90b43a1..2b76c9e 100644
+--- a/src/target_python.c
++++ b/src/target_python.c
+@@ -167,7 +167,12 @@ PyGlobalInitialize(const CMPIBroker* broker, CMPIStatus* st)
+   
+   Py_SetProgramName("cmpi_swig");
+   Py_Initialize();
+-  SWIGEXPORT void SWIG_init(void);
++#if PY_VERSION_HEX >= 0x03000000
++SWIGEXPORT PyObject*
++#else
++  SWIGEXPORT void 
++#endif
++  SWIG_init(void);
+   SWIG_init();
+   cmpiMainPyThreadState = PyGILState_GetThisThreadState();
+   PyEval_ReleaseThread(cmpiMainPyThreadState); 
+-- 
+2.1.0
+
diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/cmpi-bindings-0.4.17-no-ruby-perl.patch b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/cmpi-bindings-0.4.17-no-ruby-perl.patch
new file mode 100644
index 0000000..2072da7
--- /dev/null
+++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/cmpi-bindings-0.4.17-no-ruby-perl.patch
@@ -0,0 +1,47 @@
+From 7dd01e33f9dac75f177113de9a8ff458d4263a11 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Mon, 24 Aug 2015 11:00:13 +0900
+Subject: [PATCH] cmpi-bindings-0.4.17 no ruby perl
+
+Port from Fedora20
+
+Upstream-Status: Pending
+Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
+---
+ swig/CMakeLists.txt | 22 +++++++++++-----------
+ 1 file changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/swig/CMakeLists.txt b/swig/CMakeLists.txt
+index 8b5555c..c2655b9 100644
+--- a/swig/CMakeLists.txt
++++ b/swig/CMakeLists.txt
+@@ -15,15 +15,15 @@ IF (PYTHON_LIBRARY)
+   ENDIF (PYTHON_LINK_LIBS)
+ ENDIF (PYTHON_LIBRARY)
+ 
+-FIND_PACKAGE(Perl)
+-IF (PERL_EXECUTABLE)
+-  MESSAGE(STATUS "Building Perl...")
+-  ADD_SUBDIRECTORY(perl)
+-ENDIF (PERL_EXECUTABLE)
++#FIND_PACKAGE(Perl)
++#IF (PERL_EXECUTABLE)
++#  MESSAGE(STATUS "Building Perl...")
++#  ADD_SUBDIRECTORY(perl)
++#ENDIF (PERL_EXECUTABLE)
+ 
+-FIND_PACKAGE(Ruby)
+-IF (RUBY_LIBRARY AND RUBY_INCLUDE_PATH)
+-  MESSAGE(STATUS "Building Ruby...")
+-  ADD_SUBDIRECTORY(ruby)
+-  OPTION( BUILD_RUBY_GEM "Build Ruby GEM" YES )
+-ENDIF (RUBY_LIBRARY AND RUBY_INCLUDE_PATH)
++#FIND_PACKAGE(Ruby)
++#IF (RUBY_LIBRARY AND RUBY_INCLUDE_PATH)
++#  MESSAGE(STATUS "Building Ruby...")
++#  ADD_SUBDIRECTORY(ruby)
++#  OPTION( BUILD_RUBY_GEM "Build Ruby GEM" YES )
++#ENDIF (RUBY_LIBRARY AND RUBY_INCLUDE_PATH)
+-- 
+1.8.4.2
+
diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/cmpi-bindings-0.4.17-sblim-sigsegv.patch b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/cmpi-bindings-0.4.17-sblim-sigsegv.patch
new file mode 100644
index 0000000..b993372
--- /dev/null
+++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/cmpi-bindings-0.4.17-sblim-sigsegv.patch
@@ -0,0 +1,22 @@
+Port from Fedora20
+
+Upstream-Status: Pending
+Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
+
+diff -up cmpi-bindings-0.4.17/swig/python/cmpi_pywbem_bindings.py.orig cmpi-bindings-0.4.17/swig/python/cmpi_pywbem_bindings.py
+--- cmpi-bindings-0.4.17/swig/python/cmpi_pywbem_bindings.py.orig	2012-03-01 17:05:31.878367281 +0100
++++ cmpi-bindings-0.4.17/swig/python/cmpi_pywbem_bindings.py	2012-03-01 17:06:34.718110137 +0100
+@@ -350,10 +350,10 @@ class BrokerCIMOMHandle(object):
+             allow_null_ns = False
+         else:
+             allow_null_ns = True
+-            if self.broker.name() == 'RequestHandler':
++#            if self.broker.name() == 'RequestHandler':
+                 # Check sblim bug #2185410.
+-                if instance.path is not None:
+-                    instance.path.namespace = None
++#                if instance.path is not None:
++#                    instance.path.namespace = None
+         inst = self.proxy.pywbem2cmpi_inst(instance, allow_null_ns)
+         rv = self.broker.deliverIndication(self.ctx, ns, inst)
+         return rv
diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/cmpi-bindings-0.9.5-python-lib-dir.patch b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/cmpi-bindings-0.9.5-python-lib-dir.patch
new file mode 100644
index 0000000..b6a51ec
--- /dev/null
+++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/cmpi-bindings-0.9.5-python-lib-dir.patch
@@ -0,0 +1,17 @@
+Port from Fedora20
+
+Upstream-Status: Pending
+Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
+
+diff -up cmpi-bindings-0.9.5/swig/python/CMakeLists.txt.old cmpi-bindings-0.9.5/swig/python/CMakeLists.txt
+--- cmpi-bindings-0.9.5/swig/python/CMakeLists.txt.old	2013-08-06 15:57:03.576285764 +0200
++++ cmpi-bindings-0.9.5/swig/python/CMakeLists.txt	2013-08-06 15:57:14.891345941 +0200
+@@ -9,7 +9,7 @@ SET (BUILD_SHARED_LIBS ON)
+ 
+ FIND_PACKAGE(PythonInterp REQUIRED)
+ 
+-EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib())" OUTPUT_VARIABLE PYTHON_LIB_DIR)
++EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib(1))" OUTPUT_VARIABLE PYTHON_LIB_DIR)
+ 
+ IF (NOT PYTHON_SITE_DIR)
+   SET (PYTHON_SITE_DIR ${PYTHON_LIB_DIR})
diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_git.bb b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_git.bb
new file mode 100644
index 0000000..a2747c3
--- /dev/null
+++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_git.bb
@@ -0,0 +1,37 @@
+SUMMARY = "Adapter to write and run CMPI-type CIM providers"
+DESCRIPTION = "CMPI-compliant provider interface for various languages via SWIG"
+HOMEPAGE = "http://github.com/kkaempf/cmpi-bindings"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b19ee058d2d5f69af45da98051d91064"
+SECTION = "Development/Libraries"
+DEPENDS = "swig-native python sblim-cmpi-devel"
+
+SRC_URI = "git://github.com/kkaempf/cmpi-bindings.git;protocol=http \
+           file://cmpi-bindings-0.4.17-no-ruby-perl.patch \
+           file://cmpi-bindings-0.4.17-sblim-sigsegv.patch \
+           file://cmpi-bindings-0.9.5-python-lib-dir.patch \
+           file://0001-Modify-cmakelist.patch \
+           file://0001-Fix-error.patch \
+           file://0001-fix-the-build-error-when-python-3.0.patch \
+          "
+
+SRCREV = "62f60e065aa1b901f826e4f530c0573ae32d065e"
+S = "${WORKDIR}/git"
+
+inherit cmake pythonnative
+
+EXTRA_OECMAKE = "-DLIB='${baselib}' \
+                 -DPYTHON_INCLUDE_PATH=${STAGING_INCDIR}/python${PYTHON_BASEVERSION}"
+
+do_configure_prepend() {
+    export HOST_SYS=${HOST_SYS}
+    export BUILD_SYS=${BUILD_SYS}
+    export STAGING_LIBDIR=${STAGING_LIBDIR}
+    export STAGING_INCDIR=${STAGING_INCDIR}
+    export ENV_INSTALL_PATH=${PYTHON_SITEPACKAGES_DIR}
+}
+
+FILES_${PN} =+"${libdir}/cmpi/libpyCmpiProvider.so ${PYTHON_SITEPACKAGES_DIR}/*"
+FILES_${PN}-dbg =+ "${libdir}/cmpi/.debug/libpyCmpiProvider.so"
+
+BBCLASSEXTEND = "native"
-- 
1.8.4.2


