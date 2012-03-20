Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S9vz0-00014z-Jz
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Mar 2012 11:08:02 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Mar 2012 02:59:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="119471956"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.195])
	by orsmga001.jf.intel.com with ESMTP; 20 Mar 2012 02:59:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Mar 2012 09:59:04 +0000
Message-Id: <01fb5ee5c8fa853f78e84a9c2477f9a15e929d0a.1332237450.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1332237450.git.paul.eggleton@linux.intel.com>
References: <cover.1332237450.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1332237450.git.paul.eggleton@linux.intel.com>
References: <cover.1332237450.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe] [PATCH 1/2] python-imaging: remove
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
X-List-Received-Date: Tue, 20 Mar 2012 10:08:02 -0000

Fixes from this version have now been merged into OE-Core, so remove
it here.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 ...ing-setup.py-force-paths-for-zlib-freetyp.patch |   55 --------------------
 .../python/python-imaging_1.1.7.bb                 |   41 ---------------
 2 files changed, 0 insertions(+), 96 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/python/python-imaging/0001-python-imaging-setup.py-force-paths-for-zlib-freetyp.patch
 delete mode 100644 meta-oe/recipes-devtools/python/python-imaging_1.1.7.bb

diff --git a/meta-oe/recipes-devtools/python/python-imaging/0001-python-imaging-setup.py-force-paths-for-zlib-freetyp.patch b/meta-oe/recipes-devtools/python/python-imaging/0001-python-imaging-setup.py-force-paths-for-zlib-freetyp.patch
deleted file mode 100644
index c6e2ee4..0000000
--- a/meta-oe/recipes-devtools/python/python-imaging/0001-python-imaging-setup.py-force-paths-for-zlib-freetyp.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 07d4f095a9e22ae676a8d68073101131e65012dc Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Tue, 15 Nov 2011 13:16:54 +0100
-Subject: [PATCH] python imaging setup.py: force paths for zlib, freetype and jpeg and don't add host paths
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
-
-Upstream-Status: Unknown
----
- setup.py |   14 +++-----------
- 1 files changed, 3 insertions(+), 11 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index 5d4d53a..b1a22ec 100644
---- a/setup.py
-+++ b/setup.py
-@@ -34,10 +34,10 @@ def libinclude(root):
- # TIFF_ROOT = libinclude("/opt/tiff")
- 
- TCL_ROOT = None
--JPEG_ROOT = None
--ZLIB_ROOT = None
-+JPEG_ROOT = os.environ['STAGING_LIBDIR']
-+ZLIB_ROOT = os.environ['STAGING_LIBDIR']
- TIFF_ROOT = None
--FREETYPE_ROOT = None
-+FREETYPE_ROOT =  os.environ['STAGING_LIBDIR'], os.environ['STAGING_INCDIR']
- LCMS_ROOT = None
- 
- # FIXME: add mechanism to explicitly *disable* the use of a library
-@@ -147,7 +147,6 @@ class pil_build_ext(build_ext):
-             add_directory(library_dirs, "/opt/local/lib")
-             add_directory(include_dirs, "/opt/local/include")
- 
--        add_directory(library_dirs, "/usr/local/lib")
-         # FIXME: check /opt/stuff directories here?
- 
-         prefix = sysconfig.get_config_var("prefix")
-@@ -207,13 +206,6 @@ class pil_build_ext(build_ext):
-             if os.path.isfile(os.path.join(tcl_dir, "tk.h")):
-                 add_directory(include_dirs, tcl_dir)
- 
--        # standard locations
--        add_directory(library_dirs, "/usr/local/lib")
--        add_directory(include_dirs, "/usr/local/include")
--
--        add_directory(library_dirs, "/usr/lib")
--        add_directory(include_dirs, "/usr/include")
--
-         #
-         # insert new dirs *before* default libs, to avoid conflicts
-         # between Python PYD stub libs and real libraries
--- 
-1.7.2.5
-
diff --git a/meta-oe/recipes-devtools/python/python-imaging_1.1.7.bb b/meta-oe/recipes-devtools/python/python-imaging_1.1.7.bb
deleted file mode 100644
index c8dd814..0000000
--- a/meta-oe/recipes-devtools/python/python-imaging_1.1.7.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-DESCRIPTION = "Python Imaging Library"
-SECTION = "devel/python"
-
-PR = "r1"
-
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://README;beginline=92;endline=117;md5=003338c482e1d2eb2e4d862897f3abbf"
-
-DEPENDS = "freetype jpeg tiff"
-SRCNAME = "Imaging"
-
-SRC_URI = "http://effbot.org/downloads/Imaging-${PV}.tar.gz \
-           file://0001-python-imaging-setup.py-force-paths-for-zlib-freetyp.patch \
-"
-SRC_URI[md5sum] = "fc14a54e1ce02a0225be8854bfba478e"
-SRC_URI[sha256sum] = "895bc7c2498c8e1f9b99938f1a40dc86b3f149741f105cf7c7bd2e0725405211"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit distutils
-
-do_compile() {
-    export STAGING_LIBDIR=${STAGING_LIBDIR}
-    export STAGING_INCDIR=${STAGING_INCDIR}
-    distutils_do_compile
-}
-
-do_install() {
-    export STAGING_LIBDIR=${STAGING_LIBDIR}
-    export STAGING_INCDIR=${STAGING_INCDIR}
-    distutils_do_install
-    install -d ${D}${datadir}/doc/${PN}/html/
-    install -m 0644 ${S}/README ${D}${datadir}/doc/${PN}/
-    install -m 0644 ${S}/Docs/* ${D}${datadir}/doc/${PN}/html/
-
-    # get rid of #!/usr/local/bin/python
-    sed -i -e 's:/usr/local/bin/:${bindir}/env :g' ${D}${bindir}/*
-
-}
-RDEPENDS_${PN} = "python-lang python-stringold"
-
-- 
1.7.5.4



