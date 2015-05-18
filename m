Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3D718724FC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 May 2015 14:12:24 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 18 May 2015 07:12:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,453,1427785200"; d="scan'208";a="696587158"
Received: from linux-8hqz.fi.intel.com (HELO linux-8hqz.site.fi.intel.com)
	([10.237.68.142])
	by orsmga001.jf.intel.com with ESMTP; 18 May 2015 07:12:26 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 May 2015 17:12:45 +0300
Message-Id: <1431958369-14668-2-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1431958369-14668-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1431958369-14668-1-git-send-email-alexander.kanavin@linux.intel.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 1/4] python-gst: move it from oe-core to meta-multimedia
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
X-List-Received-Date: Mon, 18 May 2015 14:12:28 -0000

From: Alexander Kanavin <alex.kanavin@gmail.com>

This will allow removal of unsupported gstreamer 0.10 from oe-core

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../gstreamer/python-gst/python-path.patch         | 28 +++++++++++++++++++++
 .../gstreamer/python-gst_0.10.22.bb                | 29 ++++++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer/python-gst/python-path.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer/python-gst_0.10.22.bb

diff --git a/meta-multimedia/recipes-multimedia/gstreamer/python-gst/python-path.patch b/meta-multimedia/recipes-multimedia/gstreamer/python-gst/python-path.patch
new file mode 100644
index 0000000..21b5bbf
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gstreamer/python-gst/python-path.patch
@@ -0,0 +1,28 @@
+Upstream-Status:Pending
+
+Index: gst-python-0.10.19/acinclude.m4
+===================================================================
+--- gst-python-0.10.19.orig/acinclude.m4	2010-04-21 15:23:44.000000000 -0700
++++ gst-python-0.10.19/acinclude.m4	2010-11-15 14:43:00.642994001 -0800
+@@ -43,6 +43,13 @@
+ [AC_REQUIRE([AM_PATH_PYTHON])
+ AC_MSG_CHECKING(for headers required to compile python extensions)
+ dnl deduce PYTHON_INCLUDES
++
++AC_ARG_WITH(python-includes,
++	[  --with-python-includes=DIR  path to Python includes], py_exec_prefix=$withval)
++if test x$py_exec_prefix != x; then
++PYTHON_INCLUDES="-I${py_exec_prefix}/include/python${PYTHON_VERSION}"
++py_prefix="${py_exec_prefix}"
++else
+ py_prefix=`$PYTHON -c "import sys; print sys.prefix"`
+ py_exec_prefix=`$PYTHON -c "import sys; print sys.exec_prefix"`
+ if $PYTHON-config --help 2>/dev/null; then
+@@ -53,6 +60,7 @@
+     PYTHON_INCLUDES="$PYTHON_INCLUDES -I${py_exec_prefix}/include/python${PYTHON_VERSION}"
+   fi
+ fi
++fi
+ AC_SUBST(PYTHON_INCLUDES)
+ dnl check if the headers exist:
+ save_CPPFLAGS="$CPPFLAGS"
diff --git a/meta-multimedia/recipes-multimedia/gstreamer/python-gst_0.10.22.bb b/meta-multimedia/recipes-multimedia/gstreamer/python-gst_0.10.22.bb
new file mode 100644
index 0000000..2a5f2b3
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gstreamer/python-gst_0.10.22.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Python bindings for the GStreamer multimedia framework"
+SECTION = "devel/python"
+LICENSE = "LGPLv2.1"
+DEPENDS = "gstreamer gst-plugins-base python-pygobject"
+RDEPENDS_${PN} += "python-pygtk"
+PR = "r2"
+
+SRC_URI = "http://gstreamer.freedesktop.org/src/gst-python/gst-python-${PV}.tar.bz2 \
+           file://python-path.patch"
+
+SRC_URI[md5sum] = "937152fe896241f827689f4b53e79b22"
+SRC_URI[sha256sum] = "8f26f519a5bccd770864317e098e5e307fc5ad1201eb96329634b6508b253178"
+S = "${WORKDIR}/gst-python-${PV}"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=39ff67e932b7bdfa9b78bad67151690b"
+
+inherit autotools distutils-base pkgconfig
+
+EXTRA_OECONF += "--with-python-includes=${STAGING_INCDIR}/../"
+
+FILES_${PN} += "${datadir}/gst-python"
+FILES_${PN}-dev += "${datadir}/gst-python/0.10/defs"
+FILES_${PN}-dbg += "${libdir}/${PYTHON_DIR}/site-packages/gst-0.10/gst/.debug/ ${libdir}/gstreamer-0.10/.debug/"
+
+do_configure_prepend() {
+	if [ `find ${STAGING_LIBDIR} -name libpython*.so` ]; then
+		ln -sf ${STAGING_LIBDIR}/libpython*.so `find ${STAGING_LIBDIR} -name libpython*.a -exec dirname {} \;`
+	fi
+}
-- 
2.1.4


