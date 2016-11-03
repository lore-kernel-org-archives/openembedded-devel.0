Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3006071AC0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Nov 2016 08:20:45 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id i88so4145883pfk.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2016 01:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uMx1qo7Jot+YRiImLEvEFJ5nBgVOTY5GgIdLCZNPHMY=;
	b=F1GJAioNlJf/ialeFjHOtefWlGcBmYI0IUbQsmw9gVuVqu1qKT0IcHbvwOPFWcOoRF
	EdOq8MgtmWrrJtsLsv9f8dEuSpk4ezQDHYyWtYJok77k3LRPJWyOULLLAKb3MS5EVZqN
	rN+lr7HJx3+1hWWFog3Sn0trIIgS7VUxQONmzYrLH6L65s859JiQTTtSHniGQOAIR9Kx
	mZYzu1iafmioqF2F19Bp4msTwRfNs2krUUfoFCSWOgxngGXvkCqR8C11ZNKt9EMbBqzp
	MWBlwUEKh+FHBofT+TriKYXpZl5N6D0gx1tmKjovPzbENsdIXBAeA3sRGpcHyruXOzrC
	uSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uMx1qo7Jot+YRiImLEvEFJ5nBgVOTY5GgIdLCZNPHMY=;
	b=JvDjMMgGUdM8K9U7lnh3hNgm2mEp2PA6tAwGnQGzV3V9/NEN0MstLTz5GOMxAzWQ6R
	uKtNNbR3LN0YRTCMfifu7JTJ5duDGYNCF9iTKHaSOaIz4XFf+g0lUQ4Yr617qEubpw/E
	kr8UlNdiD7h+KTi6Gd9SIwZaoYDw/o9gbMe9/szuRNNrsTKufQLU1Qs3G9KxNbT5klwc
	EXmtRNbtezOAvPROOs18+tofqxOyU8K7WXI7RVqfEMBpa9fDdJiNHHjYNhNsLWFjHnYA
	qNV7NLUbewgi/56OhY74MmRaeoK2QzypEaiiASTUFPehfaSS+a+y+cVb6jB/Dg3nee7S
	Qf0A==
X-Gm-Message-State: ABUngvfE6KzVy0wBd8XQ8ycP+mQjG+5qpQbRPwVI4q7PPXooNyvvAp4HKsGA5WhwR26voA==
X-Received: by 10.98.17.196 with SMTP id 65mr14576046pfr.55.1478161246383;
	Thu, 03 Nov 2016 01:20:46 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	y2sm10386225pfk.54.2016.11.03.01.20.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Nov 2016 01:20:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Nov 2016 01:20:33 -0700
Message-Id: <20161103082038.6331-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161103082038.6331-1-raj.khem@gmail.com>
References: <20161103082038.6331-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/7 V2] boinc: Add recipe for boinc-client
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
X-List-Received-Date: Thu, 03 Nov 2016 08:20:45 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
- Document patches
- Fix build without X
- Add proper build time dependencies with/without X

 .../boinc/boinc-client/boinc-AM_CONDITIONAL.patch  | 24 ++++++
 .../boinc/boinc-client/cross-compile.patch         | 98 ++++++++++++++++++++++
 .../boinc/boinc-client/gtk-configure.patch         | 29 +++++++
 .../boinc/boinc-client/opengl_m4_check.patch       | 19 +++++
 .../recipes-extended/boinc/boinc-client_7.6.33.bb  | 77 +++++++++++++++++
 5 files changed, 247 insertions(+)
 create mode 100644 meta-oe/recipes-extended/boinc/boinc-client/boinc-AM_CONDITIONAL.patch
 create mode 100644 meta-oe/recipes-extended/boinc/boinc-client/cross-compile.patch
 create mode 100644 meta-oe/recipes-extended/boinc/boinc-client/gtk-configure.patch
 create mode 100644 meta-oe/recipes-extended/boinc/boinc-client/opengl_m4_check.patch
 create mode 100644 meta-oe/recipes-extended/boinc/boinc-client_7.6.33.bb

diff --git a/meta-oe/recipes-extended/boinc/boinc-client/boinc-AM_CONDITIONAL.patch b/meta-oe/recipes-extended/boinc/boinc-client/boinc-AM_CONDITIONAL.patch
new file mode 100644
index 0000000..7becb94
--- /dev/null
+++ b/meta-oe/recipes-extended/boinc/boinc-client/boinc-AM_CONDITIONAL.patch
@@ -0,0 +1,24 @@
+Add configure check for gtk2+ and objc++
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+--- A/configure.ac
++++ B/configure.ac
+@@ -39,6 +39,7 @@ AC_PROG_CC
+ AC_PROG_CXX
+ AC_PROG_F77
+ AC_PROG_CPP
++AC_PROG_OBJCXX
+ AC_PROG_MAKE_SET
+ SAH_LINKS
+ AC_LANG_PUSH(C)
+@@ -744,6 +745,8 @@ AM_CONDITIONAL(ENABLE_LIBRARIES, [test "
+ AM_CONDITIONAL(INSTALL_HEADERS, [test "${enable_install_headers}" = yes])
+ AM_CONDITIONAL(HAVE_CUDA_LIB, [test "${enable_client}" = yes -a -f ./coprocs/CUDA/posix/${boinc_platform}/libcudart.so])
+ 
++PKG_CHECK_MODULES([GTK2], [gtk+-2.0])
++
+ dnl ======================================================================
+ dnl some more vodoo required for building portable client-binary (client, clientgui)
+ dnl ======================================================================
diff --git a/meta-oe/recipes-extended/boinc/boinc-client/cross-compile.patch b/meta-oe/recipes-extended/boinc/boinc-client/cross-compile.patch
new file mode 100644
index 0000000..287391a
--- /dev/null
+++ b/meta-oe/recipes-extended/boinc/boinc-client/cross-compile.patch
@@ -0,0 +1,98 @@
+Remove rpath, its bad for cross compiling to encode
+build time rpaths
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: boinc-client_release-7.6-7.6.33/api/Makefile.am
+===================================================================
+--- boinc-client_release-7.6-7.6.33.orig/api/Makefile.am
++++ boinc-client_release-7.6-7.6.33/api/Makefile.am
+@@ -43,18 +43,18 @@ endif
+ 
+ lib_LTLIBRARIES = libboinc_api.la
+ libboinc_api_la_SOURCES = $(api_files)
+-libboinc_api_la_LDFLAGS = -L$(libdir) -rpath $(libdir) -version-number $(LIBBOINC_VERSION)
++libboinc_api_la_LDFLAGS = -version-number $(LIBBOINC_VERSION)
+ 
+ if BUILD_GRAPHICS_API
+ lib_LTLIBRARIES += libboinc_graphics2.la
+ libboinc_graphics2_la_SOURCES = $(graphics2_files)
+ libboinc_graphics2_la_CPPFLAGS = -I$(top_srcdir) -I$(top_srcdir)/lib -I$(top_srcdir)/samples/image_libs
+-libboinc_graphics2_la_LDFLAGS = -L$(libdir) -rpath $(libdir) -version-number $(LIBBOINC_VERSION) -ljpeg
++libboinc_graphics2_la_LDFLAGS = -version-number $(LIBBOINC_VERSION) -ljpeg
+ endif #BUILD_GRAPHICS_API
+ 
+ lib_LTLIBRARIES += libboinc_opencl.la
+ libboinc_opencl_la_SOURCES = $(opencl_files)
+-libboinc_opencl_la_LDFLAGS = -L$(libdir) -rpath $(libdir) -version-number $(LIBBOINC_VERSION)
++libboinc_opencl_la_LDFLAGS = -version-number $(LIBBOINC_VERSION)
+ 
+ if INSTALL_HEADERS
+ ## install only headers that are meant for exporting the API !!
+Index: boinc-client_release-7.6-7.6.33/lib/Makefile.am
+===================================================================
+--- boinc-client_release-7.6-7.6.33.orig/lib/Makefile.am
++++ boinc-client_release-7.6-7.6.33/lib/Makefile.am
+@@ -173,7 +173,7 @@ lib_LTLIBRARIES = libboinc.la
+ libboinc_la_SOURCES = $(generic_sources) $(mac_sources) $(win_sources)
+ libboinc_la_CFLAGS = $(AM_CFLAGS) $(PICFLAGS) $(PTHREAD_CFLAGS)
+ libboinc_la_CXXFLAGS = $(AM_CXXFLAGS) $(PICFLAGS) $(PTHREAD_CFLAGS)
+-libboinc_la_LDFLAGS = -L$(libdir) -rpath $(libdir) -static -version-number $(LIBBOINC_VERSION)
++libboinc_la_LDFLAGS = -static -version-number $(LIBBOINC_VERSION)
+ libboinc_la_LIBADD =
+ 
+ if ENABLE_BOINCCRYPT
+@@ -181,7 +181,7 @@ lib_LTLIBRARIES += libboinc_crypt.la
+ libboinc_crypt_la_SOURCES = crypt.cpp
+ libboinc_crypt_la_CFLAGS = $(AM_CFLAGS) $(PICFLAGS) $(PTHREAD_CFLAGS) $(SSL_CFLAGS)
+ libboinc_crypt_la_CXXFLAGS = $(AM_CXXFLAGS) $(PICFLAGS) $(PTHREAD_CFLAGS) $(SSL_CXXFLAGS)
+-libboinc_crypt_la_LDFLAGS = -L$(libdir) -rpath $(libdir) -static -version-number $(LIBBOINC_VERSION)
++libboinc_crypt_la_LDFLAGS = -static -version-number $(LIBBOINC_VERSION)
+ libboinc_crypt_la_LIBADD =
+ endif
+ 
+@@ -190,7 +190,7 @@ lib_LTLIBRARIES += libboinc_fcgi.la
+ libboinc_fcgi_la_SOURCES = $(libfcgi_sources) $(mac_sources) $(win_sources)
+ libboinc_fcgi_la_CFLAGS = -D_USING_FCGI_ $(AM_CFLAGS) $(PICFLAGS) $(PTHREAD_CFLAGS)
+ libboinc_fcgi_la_CXXFLAGS = -D_USING_FCGI_ $(AM_CXXFLAGS) $(PICFLAGS) $(PTHREAD_CFLAGS)
+-libboinc_fcgi_la_LDFLAGS = -L$(libdir) -rpath $(libdir) -version-number $(LIBBOINC_VERSION)
++libboinc_fcgi_la_LDFLAGS = -version-number $(LIBBOINC_VERSION)
+ libboinc_fcgi_la_LIBADD =
+ endif 
+ # end of "if ENABLE_FCGI"
+Index: boinc-client_release-7.6-7.6.33/sched/Makefile.am
+===================================================================
+--- boinc-client_release-7.6-7.6.33.orig/sched/Makefile.am
++++ boinc-client_release-7.6-7.6.33/sched/Makefile.am
+@@ -26,7 +26,7 @@ lib_LTLIBRARIES = libsched.la
+ libsched_la_SOURCES = $(libsched_sources)
+ libsched_la_CFLAGS = $(AM_CPPFLAGS)
+ libsched_la_CXXFLAGS = $(AM_CPPFLAGS)
+-libsched_la_LDFLAGS= -L$(libdir) -rpath $(libdir) -version-number $(LIBBOINC_VERSION)
++libsched_la_LDFLAGS= -version-number $(LIBBOINC_VERSION)
+ libsched_la_LIBADD= $(SSL_LIBS)
+ 
+ ## install only headers that are meant for exporting the API !!
+@@ -48,7 +48,7 @@ lib_LTLIBRARIES += libsched_fcgi.la
+ libsched_fcgi_la_SOURCES = $(libsched_sources)
+ libsched_fcgi_la_CFLAGS = -D_USING_FCGI_ $(AM_CPPFLAGS)
+ libsched_fcgi_la_CXXFLAGS = -D_USING_FCGI_ $(AM_CPPFLAGS)
+-libsched_fcgi_la_LDFLAGS= -L$(libdir) -rpath $(libdir) -version-number $(LIBBOINC_VERSION)
++libsched_fcgi_la_LDFLAGS= -version-number $(LIBBOINC_VERSION)
+ libsched_fcgi_la_LIBADD=
+ 
+ endif
+Index: boinc-client_release-7.6-7.6.33/zip/Makefile.am
+===================================================================
+--- boinc-client_release-7.6-7.6.33.orig/zip/Makefile.am
++++ boinc-client_release-7.6-7.6.33/zip/Makefile.am
+@@ -61,7 +61,7 @@ endif
+ 
+ lib_LTLIBRARIES = libboinc_zip.la
+ libboinc_zip_la_SOURCES = $(libboinc_zip_sources)
+-libboinc_zip_la_LDFLAGS = -L$(libdir) -rpath $(libdir) -version-number $(LIBBOINC_VERSION)
++libboinc_zip_la_LDFLAGS = -version-number $(LIBBOINC_VERSION)
+ libboinc_zip_la_LIBADD =
+ 
+ # Some OSs may not prefix libraries with lib.
diff --git a/meta-oe/recipes-extended/boinc/boinc-client/gtk-configure.patch b/meta-oe/recipes-extended/boinc/boinc-client/gtk-configure.patch
new file mode 100644
index 0000000..4ae8d58
--- /dev/null
+++ b/meta-oe/recipes-extended/boinc/boinc-client/gtk-configure.patch
@@ -0,0 +1,29 @@
+Check for gtk2+ only when manager is enabled
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: boinc-client_release-7.6-7.6.33/configure.ac
+===================================================================
+--- boinc-client_release-7.6-7.6.33.orig/configure.ac
++++ boinc-client_release-7.6-7.6.33/configure.ac
+@@ -1033,6 +1033,11 @@ else
+   AM_CONDITIONAL([GUI_GTK], false)
+ fi
+ 
++dnl ---------- GTK+2.0-----------------------------------------------------
++if test "X${no_x}" != "Xyes"; then
++  PKG_CHECK_MODULES([GTK2], [gtk+-2.0])
++fi
++
+ dnl ---------- libNotify --------------------------------------------------
+ if test "${enable_manager}" = yes ; then
+   PKG_CHECK_MODULES(LIBNOTIFY, [libnotify])
+@@ -1082,7 +1087,6 @@ AM_CONDITIONAL(ENABLE_BOINCCRYPT, [test
+ AM_CONDITIONAL(INSTALL_HEADERS, [test "${enable_install_headers}" = yes])
+ AM_CONDITIONAL(HAVE_CUDA_LIB, [test "${enable_client}" = yes -a -f ./coprocs/CUDA/posix/${boinc_platform}/libcudart.so])
+ 
+-PKG_CHECK_MODULES([GTK2], [gtk+-2.0])
+ 
+ dnl ======================================================================
+ dnl some more vodoo required for building portable client-binary (client, clientgui)
diff --git a/meta-oe/recipes-extended/boinc/boinc-client/opengl_m4_check.patch b/meta-oe/recipes-extended/boinc/boinc-client/opengl_m4_check.patch
new file mode 100644
index 0000000..0b057ea
--- /dev/null
+++ b/meta-oe/recipes-extended/boinc/boinc-client/opengl_m4_check.patch
@@ -0,0 +1,19 @@
+Do not add prefix/lib to library search path
+let sysroot take care of that
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Inappropriate[Cross-compile specific]
+
+Index: boinc-client_release-7.6-7.6.33/m4/ax_check_gl.m4
+===================================================================
+--- boinc-client_release-7.6-7.6.33.orig/m4/ax_check_gl.m4
++++ boinc-client_release-7.6-7.6.33/m4/ax_check_gl.m4
+@@ -58,7 +58,7 @@ else
+     else
+       ax_try_lib="${ax_lib}"
+     fi
+-    LIBS="-L${prefix}/lib ${ax_try_lib} ${GL_LIBS} ${ax_save_LIBS}"
++    LIBS="${ax_try_lib} ${GL_LIBS} ${ax_save_LIBS}"
+     AC_LINK_IFELSE(
+     [AC_LANG_PROGRAM([[
+ # if HAVE_WINDOWS_H && defined(_WIN32)
diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.6.33.bb b/meta-oe/recipes-extended/boinc/boinc-client_7.6.33.bb
new file mode 100644
index 0000000..ac5f755
--- /dev/null
+++ b/meta-oe/recipes-extended/boinc/boinc-client_7.6.33.bb
@@ -0,0 +1,77 @@
+# Copyright (C) 2016 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "Open-source software for volunteer computing"
+DESCRIPTION = "The Berkeley Open Infrastructure for Network Computing (BOINC) is an open- \
+source software platform which supports distributed computing, primarily in \
+the form of volunteer computing and desktop Grid computing.  It is well \
+suited for problems which are often described as trivially parallel.  BOINC \
+is the underlying software used by projects such as SETI@home, Einstein@Home, \
+ClimatePrediciton.net, the World Community Grid, and many other distributed \
+computing projects. \
+This package installs the BOINC client software, which will allow your \
+computer to participate in one or more BOINC projects, using your spare \
+computer time to search for cures for diseases, model protein folding, study \
+global warming, discover sources of gravitational waves, and many other types \
+of scientific and mathematical research."
+
+HOMEPAGE = "http://boinc.berkeley.edu/"
+LICENSE = "LGPLv2+ & GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6"
+SECTION = "applications"
+DEPENDS = "curl \
+           jpeg \
+           openssl \
+           sqlite3 \
+           virtual/libgl \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'libnotify', '', d)} \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk+ libnotify xcb-util libxscrnsaver', '', d)} \
+           nettle \
+"
+
+SRC_URI = "https://github.com/BOINC/boinc/archive/client_release/7.6/${PV}.tar.gz \
+           file://boinc-AM_CONDITIONAL.patch \
+           file://opengl_m4_check.patch \
+           file://cross-compile.patch \
+           file://gtk-configure.patch \
+"
+SRC_URI[md5sum] = "437b4b98e384b4bda4ef7056e68166ac"
+SRC_URI[sha256sum] = "c4b1c29b9655013e0ac61dddf47ad7f30f38c46159f02a9d9dc8ab854e99aa6d"
+
+inherit gettext autotools-brokensep pkgconfig
+
+S = "${WORKDIR}/${BPN}_release-7.6-${PV}"
+
+EXTRA_OECONF += "\
+    --enable-libraries \
+    --enable-unicode \
+    --enable-shared \
+    --enable-dynamic-client-linkage \
+    --enable-client \
+    --disable-server \
+    --disable-static \
+    --disable-manager \
+    --with-ssl=${STAGING_EXECPREFIXDIR} \
+    --without-wxdir \
+    --without-x \
+    --with-boinc-platform=${TARGET_SYS} \
+"
+export PKG_CONFIG = "${STAGING_BINDIR_NATIVE}/pkg-config"
+
+do_configure_prepend () {
+	if "${@bb.utils.contains('DEPENDS', 'gtk+', '1', '0', d)}" = "0"
+	then
+		export GTK2_CFLAGS=""
+		export GTK2_LIBS=""
+	fi
+}
+
+do_compile_prepend () {
+	# Disable rpaths
+	sed -i -e 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' ${B}/${TARGET_SYS}-libtool
+	sed -i -e 's|^sys_lib_dlsearch_path_spec=.*|sys_lib_dlsearch_path_spec=""|g' ${B}/${TARGET_SYS}-libtool
+	sed -i -e 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' ${B}/${TARGET_SYS}-libtool
+}
+
+SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
-- 
2.10.2


