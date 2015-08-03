Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1F231757A4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Aug 2015 03:06:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99180671"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Aug 2015 11:10:13 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t7334nqB030360
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 3 Aug 2015 11:04:49 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 3 Aug 2015 11:06:42 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 3 Aug 2015 11:06:31 +0800
Message-ID: <1438571196-44094-2-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438571196-44094-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1438571196-44094-1-git-send-email-leimaohui@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [meta-oe][PATCH v4 1/6] cmpi-bindings: add new recipe
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
X-List-Received-Date: Mon, 03 Aug 2015 03:06:49 -0000
Content-Type: text/plain

Cmpi-bindings is the dependence of openlmi.

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../cmpi-bindings/0001-Fix-error.patch             |  26 ++
 .../cmpi-bindings/0001-Modify-cmakelist.patch      |  41 ++++
 .../0001-fix-build-error-when-the-swig-3.0.6.patch | 268 +++++++++++++++++++++
 .../0001-fix-the-build-error-when-python-3.0.patch |  31 +++
 .../cmpi-bindings-0.4.17-no-ruby-perl.patch        |  44 ++++
 .../cmpi-bindings-0.4.17-sblim-sigsegv.patch       |  22 ++
 .../cmpi-bindings-0.9.5-python-lib-dir.patch       |  17 ++
 .../cmpi-bindings/cmpi-bindings_git.bb             |  37 +++
 8 files changed, 486 insertions(+)
 create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Fix-error.patch
 create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Modify-cmakelist.patch
 create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-fix-build-error-when-the-swig-3.0.6.patch
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
diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-fix-build-error-when-the-swig-3.0.6.patch b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-fix-build-error-when-the-swig-3.0.6.patch
new file mode 100644
index 0000000..18d27a1
--- /dev/null
+++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-fix-build-error-when-the-swig-3.0.6.patch
@@ -0,0 +1,268 @@
+From 7479e3e13871a20d87f45ba4373a3a919071557a Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Sun, 26 Jul 2015 21:39:50 +0900
+Subject: [PATCH] fix build error when the swig = 3.0.6
+
+Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
+---
+ swig/cmpi.i           |  6 +++---
+ swig/cmpi_callbacks.i |  6 +++---
+ swig/cmpi_defs.i      | 10 +++++-----
+ swig/cmpi_types.i     | 44 ++++++++++++++++++++++----------------------
+ 4 files changed, 33 insertions(+), 33 deletions(-)
+
+diff --git a/swig/cmpi.i b/swig/cmpi.i
+index d8f9ac4..59d285b 100644
+--- a/swig/cmpi.i
++++ b/swig/cmpi.i
+@@ -980,11 +980,11 @@ release_select_filter_exp(select_filter_exp *sfe)
+ %apply SWIGTYPE *DISOWN { CMPIInstance *instance_disown };
+ %apply SWIGTYPE *DISOWN { CMPIObjectPath *path_disown };
+ 
+-# Definitions
++%# Definitions
+ %include "cmpi_defs.i"
+ 
+-# Data types
++%# Data types
+ %include "cmpi_types.i"
+ 
+-# Broker callbacks
++%# Broker callbacks
+ %include "cmpi_callbacks.i"
+diff --git a/swig/cmpi_callbacks.i b/swig/cmpi_callbacks.i
+index 4e93a9e..4bba76d 100644
+--- a/swig/cmpi_callbacks.i
++++ b/swig/cmpi_callbacks.i
+@@ -1,6 +1,6 @@
+-# cmpi_callbacks.i
++%# cmpi_callbacks.i
+ #
+-# swig bindings for CMPI broker callbacks
++%# swig bindings for CMPI broker callbacks
+ #
+ 
+ %nodefault _CMPIBroker;
+@@ -445,7 +445,7 @@ typedef struct _CMPIBroker {} CMPIBroker;
+ 
+ #-----------------------------------------------------
+ #
+-# TODO: CMPIMsgFileHandle stuff
++%# TODO: CMPIMsgFileHandle stuff
+ #
+   /*
+    * query: The select expression.
+diff --git a/swig/cmpi_defs.i b/swig/cmpi_defs.i
+index ec3e455..7dfb608 100644
+--- a/swig/cmpi_defs.i
++++ b/swig/cmpi_defs.i
+@@ -1,6 +1,6 @@
+-# cmpi_defs.i
++%# cmpi_defs.i
+ #
+-# swig bindings for CMPI constant definitions
++%# swig bindings for CMPI constant definitions
+ #
+ 
+ %nodefault CMPIData;
+@@ -78,7 +78,7 @@
+ 
+ #if defined(SWIGPYTHON)
+ #
+-# Conversion from list of python strings to null terminated char** array.
++%# Conversion from list of python strings to null terminated char** array.
+ #
+ 
+ %typemap(in) char ** 
+@@ -129,7 +129,7 @@
+ 
+ #-----------------------------------------------------
+ #
+-# CMPIData
++%# CMPIData
+ #
+ 
+ %extend _CMPIData {
+@@ -199,7 +199,7 @@
+ 
+ #-----------------------------------------------------
+ #
+-# CMPIStatus
++%# CMPIStatus
+ #
+ 
+ %extend _CMPIStatus {
+diff --git a/swig/cmpi_types.i b/swig/cmpi_types.i
+index f69ec16..062b948 100644
+--- a/swig/cmpi_types.i
++++ b/swig/cmpi_types.i
+@@ -29,15 +29,15 @@
+ * ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ *****************************************************************************/
+ 
+-# cmpift.i
++%# cmpift.i
+ #
+-# swig bindings for CMPI function tables
++%# swig bindings for CMPI function tables
+ #
+ 
+ #
+-# Prevent default con-/destructors for all types
+-# CMPI types are handled through function tables
+-# and the broker.
++%# Prevent default con-/destructors for all types
++%# CMPI types are handled through function tables
++%# and the broker.
+ #
+ 
+ %nodefault _CMPIError;
+@@ -102,7 +102,7 @@ typedef struct _CMPIDateTime {} CMPIDateTime;
+ 
+ #-----------------------------------------------------
+ #
+-# CMPIException
++%# CMPIException
+ #
+ #-----------------------------------------------------
+ 
+@@ -177,7 +177,7 @@ typedef struct _CMPIException {} CMPIException;
+ 
+ #-----------------------------------------------------
+ #
+-# CMPIError
++%# CMPIError
+ #
+ 
+ /*
+@@ -372,7 +372,7 @@ typedef struct _CMPIException {} CMPIException;
+ 
+ #-----------------------------------------------------
+ #
+-# CMPIResult
++%# CMPIResult
+ #
+ 
+ /*
+@@ -409,7 +409,7 @@ typedef struct _CMPIException {} CMPIException;
+ 
+ #-----------------------------------------------------
+ #
+-# CMPIObjectPath
++%# CMPIObjectPath
+ #
+ 
+ /*
+@@ -860,7 +860,7 @@ FIXME: if clone() is exposed, release() must also
+ 
+ #-----------------------------------------------------
+ #
+-# CMPIInstance
++%# CMPIInstance
+ #
+ 
+ /*
+@@ -1166,7 +1166,7 @@ FIXME: if clone() is exposed, release() must also
+ 
+ #-----------------------------------------------------
+ #
+-# CMPIArgs
++%# CMPIArgs
+ 
+ /*
+  * CMPI Arguments
+@@ -1282,7 +1282,7 @@ FIXME: if clone() is exposed, release() must also
+ 
+ #-----------------------------------------------------
+ #
+-# CMPISelectExp
++%# CMPISelectExp
+ 
+ /*
+  * This structure encompasses queries
+@@ -1343,7 +1343,7 @@ FIXME: if clone() is exposed, release() must also
+ 
+ #-----------------------------------------------------
+ #
+-# CMPISelectCond
++%# CMPISelectCond
+ 
+ /*
+  * Select conditions
+@@ -1372,7 +1372,7 @@ FIXME: if clone() is exposed, release() must also
+ 
+ #-----------------------------------------------------
+ #
+-# CMPISubCond
++%# CMPISubCond
+ 
+ /*
+  * Sub Conditions
+@@ -1384,7 +1384,7 @@ FIXME: if clone() is exposed, release() must also
+ 
+ #-----------------------------------------------------
+ #
+-# CMPIPredicate
++%# CMPIPredicate
+ 
+ /*
+  * Predicate
+@@ -1413,7 +1413,7 @@ FIXME: if clone() is exposed, release() must also
+ 
+ #-----------------------------------------------------
+ #
+-# CMPIEnumeration
++%# CMPIEnumeration
+ 
+ /*
+  * Enumeration provide a linked-list type access to multiple elements
+@@ -1474,7 +1474,7 @@ Python for compatibility */
+ 
+ #-----------------------------------------------------
+ #
+-# CMPIArray
++%# CMPIArray
+ 
+ /*
+  * Array of equally-typed elements
+@@ -1546,11 +1546,11 @@ Python for compatibility */
+   }
+ }
+ 
+-#BOOKMARK
++%#BOOKMARK
+ 
+ #-----------------------------------------------------
+ #
+-# CMPIString
++%# CMPIString
+ 
+ /*
+  * A string
+@@ -1573,7 +1573,7 @@ Python for compatibility */
+ 
+ #-----------------------------------------------------
+ #
+-# CMPIContext
++%# CMPIContext
+ 
+ /*
+  * Context of the provider invocation
+@@ -1687,7 +1687,7 @@ Python for compatibility */
+ 
+ #-----------------------------------------------------
+ #
+-# CMPIDateTime
++%# CMPIDateTime
+ 
+ /*
+  * Date and Time
+@@ -1729,4 +1729,4 @@ Python for compatibility */
+   }
+ }
+ 
+-# EOF
++%# EOF
+-- 
+1.8.4.2
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
index 0000000..a586dbd
--- /dev/null
+++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/cmpi-bindings-0.4.17-no-ruby-perl.patch
@@ -0,0 +1,44 @@
+Port from Fedora20
+
+Upstream-Status: Pending
+Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
+
+diff -up cmpi-bindings-0.5.2/swig/CMakeLists.txt.orig cmpi-bindings-0.5.2/swig/CMakeLists.txt
+--- cmpi-bindings-0.5.2/swig/CMakeLists.txt.orig	2012-05-04 15:47:18.000000000 +0200
++++ cmpi-bindings-0.5.2/swig/CMakeLists.txt	2012-05-07 09:59:33.639648918 +0200
+@@ -4,12 +4,12 @@
+ 
+ enable_testing()
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
+ 
+ FIND_PACKAGE(PythonLibs)
+ IF (PYTHON_LIBRARY)
+@@ -22,9 +22,9 @@ IF (PYTHON_LIBRARY)
+   ENDIF (PYTHON_LINK_LIBS)
+ ENDIF (PYTHON_LIBRARY)
+ 
+-FIND_PACKAGE(Perl)
+-IF (PERL_EXECUTABLE)
+-  MESSAGE(STATUS "Building Perl...")
+-  ADD_SUBDIRECTORY(perl)
+-ENDIF (PERL_EXECUTABLE)
+-    
+\ No newline at end of file
++#FIND_PACKAGE(Perl)
++#IF (PERL_EXECUTABLE)
++#  MESSAGE(STATUS "Building Perl...")
++#  ADD_SUBDIRECTORY(perl)
++#ENDIF (PERL_EXECUTABLE)
++    
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
index 0000000..370f35e
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
+           file://0001-fix-build-error-when-the-swig-3.0.6.patch \
+          "
+
+SRCREV = "93b6044f53bcfa79253d7af51a9c23ddd73f8486"
+S = "${WORKDIR}/git"
+
+inherit cmake pythonnative
+
+EXTRA_OECMAKE = "-DLIB='${baselib}'"
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


