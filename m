Return-Path: <ismo.puustinen@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id D046971CAF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Apr 2017 12:30:03 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP; 03 Apr 2017 05:30:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,270,1486454400"; d="scan'208";a="951124456"
Received: from ipuustin-desk.fi.intel.com ([10.237.72.72])
	by orsmga003.jf.intel.com with ESMTP; 03 Apr 2017 05:30:03 -0700
From: Ismo Puustinen <ismo.puustinen@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Apr 2017 15:27:36 +0300
Message-Id: <20170403122736.29727-1-ismo.puustinen@intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] v4l-utils: update to 1.12.3.
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
X-List-Received-Date: Mon, 03 Apr 2017 12:30:04 -0000

Also add a patch which fixes building outside the source tree.

Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
---
 ...a-ctl-Don-t-install-libmediactl-and-libv4.patch |  18 ++--
 ...tem-do-not-assume-building-in-source-tree.patch | 110 +++++++++++++++++++++
 .../{v4l-utils_1.10.1.bb => v4l-utils_1.12.3.bb}   |   5 +-
 3 files changed, 124 insertions(+), 9 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-buildsystem-do-not-assume-building-in-source-tree.patch
 rename meta-oe/recipes-multimedia/v4l2apps/{v4l-utils_1.10.1.bb => v4l-utils_1.12.3.bb} (89%)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch
index 4b3de3c..7413094 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch
@@ -1,4 +1,4 @@
-From 4ee15a8a69b84526ece1180a288a37db077bcd9b Mon Sep 17 00:00:00 2001
+From 2d6bfa75b2e16b4d764f1bf00bb902fb4b5e507b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 27 Feb 2015 21:55:36 +0000
 Subject: [PATCH] Revert "media-ctl: Don't install libmediactl and
@@ -11,23 +11,27 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Conflicts:
 	utils/media-ctl/Makefile.am
 ---
- utils/media-ctl/Makefile.am | 11 +++--------
- 1 file changed, 3 insertions(+), 8 deletions(-)
+ utils/media-ctl/Makefile.am | 10 +++-------
+ 1 file changed, 3 insertions(+), 7 deletions(-)
 
 diff --git a/utils/media-ctl/Makefile.am b/utils/media-ctl/Makefile.am
-index a3931fb..fe1fea5 100644
+index ee7dcc9..d11fa2e 100644
 --- a/utils/media-ctl/Makefile.am
 +++ b/utils/media-ctl/Makefile.am
-@@ -1,14 +1,9 @@
+@@ -1,8 +1,7 @@
 -noinst_LTLIBRARIES = libmediactl.la libv4l2subdev.la
 -
 +lib_LTLIBRARIES = libmediactl.la libv4l2subdev.la
  libmediactl_la_SOURCES = libmediactl.c mediactl-priv.h
 -libmediactl_la_CFLAGS = -static $(LIBUDEV_CFLAGS)
 -libmediactl_la_LDFLAGS = -static $(LIBUDEV_LIBS)
--
 +libmediactl_la_CFLAGS = $(LIBUDEV_CFLAGS)
 +libmediactl_la_LDFLAGS = $(LIBUDEV_LIBS)
+ 
+ media-bus-format-names.h: ../../include/linux/media-bus-format.h
+ 	sed -e '/#define MEDIA_BUS_FMT/ ! d; s/.*FMT_//; /FIXED/ d; s/\t.*//; s/.*/{ \"&\", MEDIA_BUS_FMT_& },/;' \
+@@ -18,9 +17,6 @@ CLEANFILES = $(BUILT_SOURCES)
+ nodist_libv4l2subdev_la_SOURCES = $(BUILT_SOURCES)
  libv4l2subdev_la_SOURCES = libv4l2subdev.c
  libv4l2subdev_la_LIBADD = libmediactl.la
 -libv4l2subdev_la_CFLAGS = -static
@@ -37,5 +41,5 @@ index a3931fb..fe1fea5 100644
  noinst_HEADERS = mediactl.h v4l2subdev.h
  
 -- 
-2.1.4
+2.9.3
 
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-buildsystem-do-not-assume-building-in-source-tree.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-buildsystem-do-not-assume-building-in-source-tree.patch
new file mode 100644
index 0000000..54161f9
--- /dev/null
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-buildsystem-do-not-assume-building-in-source-tree.patch
@@ -0,0 +1,110 @@
+From 806822f5acb756d5acda0f9063c84b28b38b3ffb Mon Sep 17 00:00:00 2001
+From: Ismo Puustinen <ismo.puustinen@intel.com>
+Date: Mon, 3 Apr 2017 13:23:38 +0300
+Subject: [PATCH v4l-utils] buildsystem: do not assume building in source tree.
+
+Use $(top_srcdir) as reference for include paths and buildtime scripts.
+Otherwise compilation outside of project root directory will fail
+because header and script paths are wrong.
+
+To reproduce: mkdir b; cd b; ../configure; make
+
+Upstream-status: Accepted [https://git.linuxtv.org//v4l-utils.git/commit/?id=bd98c9a99bffc8d44c54859345e4dfee0ada4275]
+
+Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
+---
+ utils/cec-compliance/Makefile.am  | 2 +-
+ utils/cec-ctl/Makefile.am         | 2 +-
+ utils/cec-follower/Makefile.am    | 4 ++--
+ utils/qv4l2/Makefile.am           | 2 +-
+ utils/v4l2-compliance/Makefile.am | 2 +-
+ utils/v4l2-ctl/Makefile.am        | 2 +-
+ 6 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/utils/cec-compliance/Makefile.am b/utils/cec-compliance/Makefile.am
+index ec5de51..8331aa0 100644
+--- a/utils/cec-compliance/Makefile.am
++++ b/utils/cec-compliance/Makefile.am
+@@ -7,7 +7,7 @@ cec_compliance_LDFLAGS = -lrt
+ cec-compliance.cpp: cec-table.h
+ 
+ cec-table.h: ../cec-ctl/msg2ctl.pl ../../include/linux/cec.h ../../include/linux/cec-funcs.h
+-	../cec-ctl/msg2ctl.pl 2 ../../include/linux/cec.h ../../include/linux/cec-funcs.h >$@
++	$(top_srcdir)/utils/cec-ctl/msg2ctl.pl 2 $(top_srcdir)/include/linux/cec.h $(top_srcdir)/include/linux/cec-funcs.h >$@
+ 
+ cec-compliance.cpp: version.h
+ 
+diff --git a/utils/cec-ctl/Makefile.am b/utils/cec-ctl/Makefile.am
+index 0a7ef22..6afb6c9 100644
+--- a/utils/cec-ctl/Makefile.am
++++ b/utils/cec-ctl/Makefile.am
+@@ -7,7 +7,7 @@ cec_ctl_LDFLAGS = -lrt
+ cec-ctl.cpp: cec-ctl-gen.h
+ 
+ cec-ctl-gen.h: msg2ctl.pl ../../include/linux/cec.h ../../include/linux/cec-funcs.h
+-	./msg2ctl.pl 0 ../../include/linux/cec.h ../../include/linux/cec-funcs.h >$@
++	$(top_srcdir)/utils/cec-ctl/msg2ctl.pl 0 $(top_srcdir)/include/linux/cec.h $(top_srcdir)/include/linux/cec-funcs.h >$@
+ 
+ clean-local:
+ 	-rm -vf cec-ctl-gen.h
+diff --git a/utils/cec-follower/Makefile.am b/utils/cec-follower/Makefile.am
+index 538edb2..fdbf3d9 100644
+--- a/utils/cec-follower/Makefile.am
++++ b/utils/cec-follower/Makefile.am
+@@ -7,12 +7,12 @@ cec_follower_LDFLAGS = -lrt
+ cec-log.cpp: cec-log.h
+ 
+ cec-log.h: ../cec-ctl/msg2ctl.pl ../../include/linux/cec.h ../../include/linux/cec-funcs.h
+-	../cec-ctl/msg2ctl.pl 1 ../../include/linux/cec.h ../../include/linux/cec-funcs.h >$@
++	$(top_srcdir)/utils/cec-ctl/msg2ctl.pl 1 $(top_srcdir)/include/linux/cec.h $(top_srcdir)/include/linux/cec-funcs.h >$@
+ 
+ cec-follower.cpp: cec-table.h version.h
+ 
+ cec-table.h: ../cec-ctl/msg2ctl.pl ../../include/linux/cec.h ../../include/linux/cec-funcs.h
+-	../cec-ctl/msg2ctl.pl 2 ../../include/linux/cec.h ../../include/linux/cec-funcs.h >$@
++	$(top_srcdir)/utils/cec-ctl/msg2ctl.pl 2 $(top_srcdir)/include/linux/cec.h $(top_srcdir)/include/linux/cec-funcs.h >$@
+ 
+ version.h:
+ 	@if git rev-parse HEAD >/dev/null 2>&1; then \
+diff --git a/utils/qv4l2/Makefile.am b/utils/qv4l2/Makefile.am
+index fd58486..ccd1a2a 100644
+--- a/utils/qv4l2/Makefile.am
++++ b/utils/qv4l2/Makefile.am
+@@ -8,7 +8,7 @@ qv4l2_SOURCES = qv4l2.cpp general-tab.cpp ctrl-tab.cpp vbi-tab.cpp capture-win.c
+ nodist_qv4l2_SOURCES = moc_qv4l2.cpp moc_general-tab.cpp moc_capture-win.cpp moc_vbi-tab.cpp qrc_qv4l2.cpp
+ qv4l2_LDADD = ../../lib/libv4l2/libv4l2.la ../../lib/libv4lconvert/libv4lconvert.la \
+   ../libv4l2util/libv4l2util.la ../libmedia_dev/libmedia_dev.la
+-qv4l2_CPPFLAGS = -I../common
++qv4l2_CPPFLAGS = -I$(top_srcdir)/utils/common
+ 
+ if WITH_QTGL
+ qv4l2_CPPFLAGS += $(QTGL_CFLAGS)
+diff --git a/utils/v4l2-compliance/Makefile.am b/utils/v4l2-compliance/Makefile.am
+index 03db8df..18b9892 100644
+--- a/utils/v4l2-compliance/Makefile.am
++++ b/utils/v4l2-compliance/Makefile.am
+@@ -5,7 +5,7 @@ DEFS :=
+ v4l2_compliance_SOURCES = v4l2-compliance.cpp v4l2-test-debug.cpp v4l2-test-input-output.cpp \
+ 	v4l2-test-controls.cpp v4l2-test-io-config.cpp v4l2-test-formats.cpp v4l2-test-buffers.cpp \
+ 	v4l2-test-codecs.cpp v4l2-test-colors.cpp v4l2-compliance.h
+-v4l2_compliance_CPPFLAGS = -I../common
++v4l2_compliance_CPPFLAGS = -I$(top_srcdir)/utils/common
+ 
+ if WITH_V4L2_COMPLIANCE_LIBV4L
+ v4l2_compliance_LDADD = ../../lib/libv4l2/libv4l2.la ../../lib/libv4lconvert/libv4lconvert.la -lrt -lpthread
+diff --git a/utils/v4l2-ctl/Makefile.am b/utils/v4l2-ctl/Makefile.am
+index 955647d..825e53f 100644
+--- a/utils/v4l2-ctl/Makefile.am
++++ b/utils/v4l2-ctl/Makefile.am
+@@ -7,7 +7,7 @@ v4l2_ctl_SOURCES = v4l2-ctl.cpp v4l2-ctl.h v4l2-ctl-common.cpp v4l2-ctl-tuner.cp
+ 	v4l2-ctl-overlay.cpp v4l2-ctl-vbi.cpp v4l2-ctl-selection.cpp v4l2-ctl-misc.cpp \
+ 	v4l2-ctl-streaming.cpp v4l2-ctl-sdr.cpp v4l2-ctl-edid.cpp v4l2-ctl-modes.cpp \
+ 	v4l2-tpg-colors.c v4l2-tpg-core.c v4l-stream.c
+-v4l2_ctl_CPPFLAGS = -I../common
++v4l2_ctl_CPPFLAGS = -I$(top_srcdir)/utils/common
+ 
+ if WITH_V4L2_CTL_LIBV4L
+ v4l2_ctl_LDADD = ../../lib/libv4l2/libv4l2.la ../../lib/libv4lconvert/libv4lconvert.la -lrt -lpthread
+-- 
+2.9.3
+
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.10.1.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.12.3.bb
similarity index 89%
rename from meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.10.1.bb
rename to meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.12.3.bb
index b9732fe..0a0c0c2 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.10.1.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.12.3.bb
@@ -14,11 +14,12 @@ PACKAGECONFIG[media-ctl] = "--enable-v4l-utils,--disable-v4l-utils,,"
 
 SRC_URI = "http://linuxtv.org/downloads/v4l-utils/v4l-utils-${PV}.tar.bz2 \
            file://0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch \
+           file://0001-buildsystem-do-not-assume-building-in-source-tree.patch \
            file://mediactl-pkgconfig.patch \
            file://export-mediactl-headers.patch \
           "
-SRC_URI[md5sum] = "936c9c58343840e91294e4dcec7dc05f"
-SRC_URI[sha256sum] = "6147ccc29fe7dd3c5c3994d613c4f2a099bac8b44694a96e5cf4d7caca8336c0"
+SRC_URI[md5sum] = "89e1ed6c69c94e0489dc0a638c7841aa"
+SRC_URI[sha256sum] = "5a47dd6f0e7dfe902d94605c01d385a4a4e87583ff5856d6f181900ea81cf46e"
 
 EXTRA_OECONF = "--disable-qv4l2 --enable-shared --with-udevdir=${base_libdir}/udev"
 
-- 
2.9.3


