Received: from smtp03.msg.oleane.net ([62.161.4.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <christian.charreyre@cioinfoindus.fr>)
	id 1QGx9R-0003nz-Py for openembedded-devel@lists.openembedded.org;
	Mon, 02 May 2011 19:43:17 +0200
Received: from localhost.localdomain
	(AMarseille-551-1-66-56.w80-9.abo.wanadoo.fr [80.9.121.56]) 
	by smtp03.msg.oleane.net (MTA) with ESMTP id p42Hega8001553;
	Mon, 2 May 2011 19:40:42 +0200
X-Oleane-Rep: REPA
From: Christian Charreyre <christian.charreyre@cioinfoindus.fr>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 May 2011 19:40:39 +0200
Message-Id: <1304358039-20934-1-git-send-email-christian.charreyre@cioinfoindus.fr>
X-Mailer: git-send-email 1.7.4.1
X-Spam-Flag: NO
X-PMX-Spam: Probability=8%
X-PFSI-Info: PMX 5.5.9.395186, Antispam-Engine: 2.7.2.376379,
	Antispam-Data: 2011.5.2.172718 (no antivirus check)
Subject: [PATCH v4] mypaint: new recipe for version 0.9.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 May 2011 17:43:17 -0000

Signed-off-by: Christian Charreyre <christian.charreyre@cioinfoindus.fr>
---
 recipes/mypaint/files/scons-adapt.patch |   20 +++++++++++++++++
 recipes/mypaint/mypaint_0.9.1.bb        |   36 +++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+), 0 deletions(-)
 create mode 100644 recipes/mypaint/files/scons-adapt.patch
 create mode 100644 recipes/mypaint/mypaint_0.9.1.bb

diff --git a/recipes/mypaint/files/scons-adapt.patch b/recipes/mypaint/files/scons-adapt.patch
new file mode 100644
index 0000000..dcad6db
--- /dev/null
+++ b/recipes/mypaint/files/scons-adapt.patch
@@ -0,0 +1,50 @@
+Author: Christian Charreyre <christian.charreyre@cioinfoindus.fr>
+
+Adapt scons to OE
+Index: mypaint-0.9.1/lib/SConscript
+===================================================================
+--- mypaint-0.9.1.orig/lib/SConscript	2011-04-21 11:31:29.000000000 +0200
++++ mypaint-0.9.1/lib/SConscript	2011-04-21 11:35:30.000000000 +0200
+@@ -1,5 +1,11 @@
+ Import('env')
+-import sys
++import sys, os
++env.Replace(SHCXX = os.environ['CXX'])
++env.Replace(SHLINK = os.environ['CXX'])
++env.Replace(LDMODULEFLAGS = os.environ['TARGET_LDFLAGS'])
++env.Append(LDMODULEFLAGS = ['-Wl,--hash-style=gnu'])
++env.Append(LDMODULEFLAGS = ['-shared'])
++env.Replace(PATH = os.environ['PATH'])
+ 
+ # For the record: I know that scons supports swig. But it doesn't scan for #include in the generated code.
+ # 
+Index: mypaint-0.9.1/SConstruct
+===================================================================
+--- mypaint-0.9.1.orig/SConstruct	2011-03-04 15:44:59.000000000 +0100
++++ mypaint-0.9.1/SConstruct	2011-05-02 17:21:17.000000000 +0200
+@@ -11,13 +11,6 @@
+ if sys.platform == "win32":
+     python = 'python' # usually no versioned binaries on Windows
+ 
+-try: 
+-    import numpy
+-except ImportError:
+-    print 'You need to have numpy installed.'
+-    print
+-    raise
+-
+ SConsignFile() # no .scsonsign into $PREFIX please
+ 
+ if sys.platform == "darwin":
+@@ -40,8 +33,9 @@
+ 
+ env.Append(CXXFLAGS=' -Wall -Wno-sign-compare -Wno-write-strings')
+ 
+-# Get the numpy include path (for numpy/arrayobject.h).
+-numpy_path = numpy.get_include()
++# Defines the numpy include path (for numpy/arrayobject.h).
++# This is specefic to OE, to avoid to build python-numpy-native
++numpy_path = os.environ['STAGING_DIR_TARGET']+os.environ['PYTHON_SITEPACKAGES_DIR']+'/numpy/core/include'
+ env.Append(CPPPATH=numpy_path)
+ 
+ 
diff --git a/recipes/mypaint/mypaint_0.9.1.bb b/recipes/mypaint/mypaint_0.9.1.bb
new file mode 100644
index 0000000..a7e5077
--- /dev/null
+++ b/recipes/mypaint/mypaint_0.9.1.bb
@@ -0,0 +1,37 @@
+DESCRIPTION="fast and easy open-source graphics application for digital painters"
+LICENSE="GPL"
+SECTION = "x11/applications"
+PRIORITY = "optional"
+HOMEPAGE = "http://mypaint.intilinux.com/"
+
+DEPENDS = "glib-2.0 libpng python-numpy"
+RDEPENDS_${PN} = "python-image python-json"
+
+SRC_URI = "http://download.gna.org/mypaint/${PN}-${PV}.tar.bz2 \
+	file://scons-adapt.patch \
+"
+
+SRC_URI[md5sum] = "6249a16359a438d6dc658f5765b35515"
+SRC_URI[sha256sum] = "407b599f62fb0d6e711fee57d22e64d3aec88825364fb5f7f73b9f0940aa7aed"
+
+inherit distutils scons
+
+do_compile() {
+       STAGING_INCDIR=${STAGING_INCDIR} \
+       STAGING_LIBDIR=${STAGING_LIBDIR} \
+       STAGING_DIR_TARGET=${STAGING_DIR_TARGET} \
+       PYTHON_SITEPACKAGES_DIR=${PYTHON_SITEPACKAGES_DIR} \
+       BUILD_SYS=${BUILD_SYS} \
+       HOST_SYS=${HOST_SYS} \
+       PATH=${PATH} scons_do_compile
+}
+
+do_install() {
+       STAGING_DIR_TARGET=${STAGING_DIR_TARGET} \
+       PYTHON_SITEPACKAGES_DIR=${PYTHON_SITEPACKAGES_DIR} \
+       BUILD_SYS=${BUILD_SYS} \
+       HOST_SYS=${HOST_SYS} \
+       scons_do_install
+}
+
+FILES_${PN} += "${datadir}"
-- 
1.7.0.4



