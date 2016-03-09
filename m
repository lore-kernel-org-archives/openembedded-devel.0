Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D27906FF97
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Mar 2016 15:10:07 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 09 Mar 2016 07:10:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,311,1455004800"; d="scan'208";a="62869109"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 09 Mar 2016 07:10:08 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:05:30 +0200
Message-Id: <41b4e4a82cb652470eebe853bd1b6076cee59301.1457535831.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 14/38] python-gst: remove the 0.10 recipe
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
X-List-Received-Date: Wed, 09 Mar 2016 15:10:08 -0000

It depends on pygobject 2.x which has been update to 3.x in oe-core

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../gstreamer-0.10/python-gst/python-path.patch    | 28 ---------------------
 .../gstreamer-0.10/python-gst_0.10.22.bb           | 29 ----------------------
 2 files changed, 57 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/python-gst/python-path.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/python-gst_0.10.22.bb

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/python-gst/python-path.patch b/meta-multimedia/recipes-multimedia/gstreamer-0.10/python-gst/python-path.patch
deleted file mode 100644
index 21b5bbf..0000000
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/python-gst/python-path.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Upstream-Status:Pending
-
-Index: gst-python-0.10.19/acinclude.m4
-===================================================================
---- gst-python-0.10.19.orig/acinclude.m4	2010-04-21 15:23:44.000000000 -0700
-+++ gst-python-0.10.19/acinclude.m4	2010-11-15 14:43:00.642994001 -0800
-@@ -43,6 +43,13 @@
- [AC_REQUIRE([AM_PATH_PYTHON])
- AC_MSG_CHECKING(for headers required to compile python extensions)
- dnl deduce PYTHON_INCLUDES
-+
-+AC_ARG_WITH(python-includes,
-+	[  --with-python-includes=DIR  path to Python includes], py_exec_prefix=$withval)
-+if test x$py_exec_prefix != x; then
-+PYTHON_INCLUDES="-I${py_exec_prefix}/include/python${PYTHON_VERSION}"
-+py_prefix="${py_exec_prefix}"
-+else
- py_prefix=`$PYTHON -c "import sys; print sys.prefix"`
- py_exec_prefix=`$PYTHON -c "import sys; print sys.exec_prefix"`
- if $PYTHON-config --help 2>/dev/null; then
-@@ -53,6 +60,7 @@
-     PYTHON_INCLUDES="$PYTHON_INCLUDES -I${py_exec_prefix}/include/python${PYTHON_VERSION}"
-   fi
- fi
-+fi
- AC_SUBST(PYTHON_INCLUDES)
- dnl check if the headers exist:
- save_CPPFLAGS="$CPPFLAGS"
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/python-gst_0.10.22.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/python-gst_0.10.22.bb
deleted file mode 100644
index 2a5f2b3..0000000
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/python-gst_0.10.22.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "Python bindings for the GStreamer multimedia framework"
-SECTION = "devel/python"
-LICENSE = "LGPLv2.1"
-DEPENDS = "gstreamer gst-plugins-base python-pygobject"
-RDEPENDS_${PN} += "python-pygtk"
-PR = "r2"
-
-SRC_URI = "http://gstreamer.freedesktop.org/src/gst-python/gst-python-${PV}.tar.bz2 \
-           file://python-path.patch"
-
-SRC_URI[md5sum] = "937152fe896241f827689f4b53e79b22"
-SRC_URI[sha256sum] = "8f26f519a5bccd770864317e098e5e307fc5ad1201eb96329634b6508b253178"
-S = "${WORKDIR}/gst-python-${PV}"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=39ff67e932b7bdfa9b78bad67151690b"
-
-inherit autotools distutils-base pkgconfig
-
-EXTRA_OECONF += "--with-python-includes=${STAGING_INCDIR}/../"
-
-FILES_${PN} += "${datadir}/gst-python"
-FILES_${PN}-dev += "${datadir}/gst-python/0.10/defs"
-FILES_${PN}-dbg += "${libdir}/${PYTHON_DIR}/site-packages/gst-0.10/gst/.debug/ ${libdir}/gstreamer-0.10/.debug/"
-
-do_configure_prepend() {
-	if [ `find ${STAGING_LIBDIR} -name libpython*.so` ]; then
-		ln -sf ${STAGING_LIBDIR}/libpython*.so `find ${STAGING_LIBDIR} -name libpython*.a -exec dirname {} \;`
-	fi
-}
-- 
2.7.0


