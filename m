Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sw1wC-0007x5-Uy
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jul 2012 04:11:57 +0200
Received: by wgbdr1 with SMTP id dr1so4765699wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2012 19:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=hVZUkky3f/NMnT+9n2ZwHpPWG7jZLeBUBim5pKuTXY8=;
	b=kNt8PnG128+O1i3wpJ8VdwC5gn0RBurIQdxtrTa6vUW/lx8VsiWX81AtbjAUTEtP/V
	Te7tshvyQ1LEv5eBs21veRuAizkdavLTzlzw9fRX/yLYydN1sy3UVq+isKm6wECXExnB
	Yvb/MtbkgFZ3MjJQi7CI4aOgOsrWFj3TStfZ6D0keTTGIA/GN8+k6fF0cAfWrPHqBW5u
	iDuhe4QyfhFfmL8tbtuf1y9GT5d3TB+qw77oocYfsnMDGz2wph3a3klrfme+33JDSz93
	NfaAGB8Hm/kZDD8Bpd23NZmkIIb7fZfH5Qez+j8CcJ93hmJP1Mb2mUJa3d69IjkKC2Ft
	jPwg==
Received: by 10.180.98.138 with SMTP id ei10mr2758185wib.1.1343700020677;
	Mon, 30 Jul 2012 19:00:20 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bc2sm28800678wib.0.2012.07.30.19.00.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jul 2012 19:00:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Jul 2012 03:58:42 +0200
Message-Id: <2fba7222716ba4e9782ebc6e5077f99669bf69b3.1343699377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1343699377.git.Martin.Jansa@gmail.com>
References: <cover.1343478744.git.Martin.Jansa@gmail.com>
	<cover.1343699377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1343699377.git.Martin.Jansa@gmail.com>
References: <cover.1343699377.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 17/24] mcnavi, monav, omgps, orrery: import from meta-smartphone
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
X-List-Received-Date: Tue, 31 Jul 2012 02:11:57 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/mcnavi/mcnavi_0.3.3.bb  |   18 +++++
 .../recipes-navigation/monav/monav/monav.desktop   |   10 +++
 meta-oe/recipes-navigation/monav/monav/monav.png   |  Bin 0 -> 21543 bytes
 meta-oe/recipes-navigation/monav/monav_0.3.bb      |   37 +++++++++++
 .../omgps/omgps/fix.capability.patch               |   59 +++++++++++++++++
 .../recipes-navigation/omgps/omgps/gcc-4.4.patch   |   68 ++++++++++++++++++++
 .../omgps/omgps/sysfs.node.2.6.32.patch            |   11 +++
 .../omgps/omgps/use.unused.variable.patch          |   12 ++++
 meta-oe/recipes-navigation/omgps/omgps_svn.bb      |   23 +++++++
 .../recipes-navigation/orrery/orrery/orrery.png    |  Bin 0 -> 19475 bytes
 .../orrery/orrery/use.GdkPixbuf.patch              |   59 +++++++++++++++++
 meta-oe/recipes-navigation/orrery/orrery_2.7.bb    |   30 +++++++++
 12 files changed, 327 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-navigation/mcnavi/mcnavi_0.3.3.bb
 create mode 100644 meta-oe/recipes-navigation/monav/monav/monav.desktop
 create mode 100644 meta-oe/recipes-navigation/monav/monav/monav.png
 create mode 100644 meta-oe/recipes-navigation/monav/monav_0.3.bb
 create mode 100644 meta-oe/recipes-navigation/omgps/omgps/fix.capability.patch
 create mode 100644 meta-oe/recipes-navigation/omgps/omgps/gcc-4.4.patch
 create mode 100644 meta-oe/recipes-navigation/omgps/omgps/sysfs.node.2.6.32.patch
 create mode 100644 meta-oe/recipes-navigation/omgps/omgps/use.unused.variable.patch
 create mode 100644 meta-oe/recipes-navigation/omgps/omgps_svn.bb
 create mode 100644 meta-oe/recipes-navigation/orrery/orrery/orrery.png
 create mode 100644 meta-oe/recipes-navigation/orrery/orrery/use.GdkPixbuf.patch
 create mode 100644 meta-oe/recipes-navigation/orrery/orrery_2.7.bb

diff --git a/meta-oe/recipes-navigation/mcnavi/mcnavi_0.3.3.bb b/meta-oe/recipes-navigation/mcnavi/mcnavi_0.3.3.bb
new file mode 100644
index 0000000..9c7f3f2
--- /dev/null
+++ b/meta-oe/recipes-navigation/mcnavi/mcnavi_0.3.3.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Free GPS navigation for car and outdoor with OpenStreetMap maps"
+HOMEPAGE = "http://www.gps-routes.info/index.php?name=Content&pa=showpage&pid=1"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a"
+DEPENDS = "ecore evas imlib2 gpsd edje-native mysql5"
+
+SRC_URI = "http://www.gps-routes.info/debian/pool/main/m/mcnavi/mcnavi_${PV}.tar.gz"
+SRC_URI[md5sum] = "acc07debcdb3ef448b95e6a6cfcf53d8"
+SRC_URI[sha256sum] = "d3ce1f5901f13985d877b2b6ad06b64094ba43a4e13cbfe06c7cb2f1abdda309"
+
+S = "${WORKDIR}/${PN}"
+
+do_configure_prepend() {
+  # for some reason our mysql_config returns just sysroot/include_dir while mysql.h is in include_dir/mysql
+  sed -i 's#`mysql_config --include`#`mysql_config --include`/mysql#g' ${S}/configure.ac
+}
+
+inherit autotools
diff --git a/meta-oe/recipes-navigation/monav/monav/monav.desktop b/meta-oe/recipes-navigation/monav/monav/monav.desktop
new file mode 100644
index 0000000..5e86113
--- /dev/null
+++ b/meta-oe/recipes-navigation/monav/monav/monav.desktop
@@ -0,0 +1,10 @@
+[Desktop Entry]
+Name=MoNav
+Exec=monav
+Icon=monav
+Terminal=false
+Type=Application
+Categories=Utility;Geography;
+X-MB-SingleInstance=true
+StartupNotify=true
+Comment=Fast navigation system featuring exact routing.
diff --git a/meta-oe/recipes-navigation/monav/monav/monav.png b/meta-oe/recipes-navigation/monav/monav/monav.png
new file mode 100644
index 0000000000000000000000000000000000000000..75b5a79623bf040f1ddfcde3d005dc7fd6de1ed9
GIT binary patch
literal 21543
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
aGa<9dQ(UQfcR;8oaKrGHL9w1)=zjo{-+O}q

literal 0
HcmV?d00001

diff --git a/meta-oe/recipes-navigation/monav/monav_0.3.bb b/meta-oe/recipes-navigation/monav/monav_0.3.bb
new file mode 100644
index 0000000..982d682
--- /dev/null
+++ b/meta-oe/recipes-navigation/monav/monav_0.3.bb
@@ -0,0 +1,37 @@
+DESCRIPTION = "MoNav is a fast navigation system featuring exact routing with OpenStreetMap data."
+HOMEPAGE = "http://code.google.com/p/monav"
+SECTION = "x11/applications"
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://misc/license_template_christian;md5=d99c9b3bafdde80adee296762376348d"
+
+DEPENDS = "qt-mobility-x11"
+PR = "r1"
+
+SRC_URI = "http://monav.googlecode.com/files/${BPN}-${PV}.tar.gz \
+           file://monav.png \
+           file://monav.desktop"
+
+SRC_URI[md5sum] = "d048ccef8c6a21e8656aa4af3fcb8329"
+SRC_URI[sha256sum] = "5a3bf9e9f7368b81ba8e2f755960082fc42a2e2c78f9de645f99ba293c77ee7f"
+
+inherit qmake2 qt4x11
+
+EXTRA_QMAKEVARS_PRE="CONFIG+="release""
+QMAKE_PROFILES="monavclient.pro"
+
+do_install_append() {
+    install -d ${D}${datadir}/monav
+    install -d ${D}${datadir}/monav/images
+    cp -a ${S}/images/* ${D}${datadir}/monav/images
+
+    install -d ${D}${datadir}/icons
+    install -m 0644 ${WORKDIR}/monav.png ${D}${datadir}/icons
+
+    install -d ${D}${bindir}
+    install -m 0755 ${S}/bin/monav ${D}${bindir}/monav
+
+    install -d ${D}/${datadir}/applications
+    install -m 0644 ${WORKDIR}/monav.desktop ${D}/${datadir}/applications
+}
+
+FILES_${PN} += "${bindir}/monav ${datadir}/icons/monav.png"
diff --git a/meta-oe/recipes-navigation/omgps/omgps/fix.capability.patch b/meta-oe/recipes-navigation/omgps/omgps/fix.capability.patch
new file mode 100644
index 0000000..56ec3a4
--- /dev/null
+++ b/meta-oe/recipes-navigation/omgps/omgps/fix.capability.patch
@@ -0,0 +1,59 @@
+we need to include config.h first to know if HAVE_SYS_CAPABILITY_H is enabled or no, otherwise
+sys/capability.h is not included and later used
+| src/network.c: In function 'can_ping':
+| src/network.c:198:2: error: 'cap_flag_value_t' undeclared (first use in this function)
+| src/network.c:198:2: note: each undeclared identifier is reported only once for each function it appears in
+| src/network.c:198:19: error: expected ';' before 'cap'
+| src/network.c:199:2: error: 'cap_t' undeclared (first use in this function)
+| src/network.c:199:8: error: expected ';' before 'caps'
+| src/network.c:200:6: error: 'caps' undeclared (first use in this function)
+| cc1: warnings being treated as errors
+| src/network.c:203:2: error: implicit declaration of function 'cap_get_flag'
+| src/network.c:203:21: error: 'CAP_SYS_NICE' undeclared (first use in this function)
+| src/network.c:203:35: error: 'CAP_EFFECTIVE' undeclared (first use in this function)
+| src/network.c:203:51: error: 'cap' undeclared (first use in this function)
+| src/network.c:204:17: error: 'CAP_CLEAR' undeclared (first use in this function)
+| src/network.c:210:1: error: control reaches end of non-void function
+| make[1]: *** [omgps-network.o] Error 1
+
+and -lcap is needed for 2 functions later (should be added only for HAVE_SYS_CAPABILITY_H enabled, but I don't care enough)
+| omgps-network.o: In function `can_ping':
+| /OE/tmpdir-shr/work/armv4t-oe-linux-gnueabi/omgps-0.1+svnr109-r1/omgps/src/network.c:199: undefined reference to `cap_get_proc'
+| /OE/tmpdir-shr/work/armv4t-oe-linux-gnueabi/omgps-0.1+svnr109-r1/omgps/src/network.c:203: undefined reference to `cap_get_flag'
+| collect2: ld returned 1 exit status
+
+--- omgps.orig/src/network.c	2009-10-28 18:51:16.000000000 +0100
++++ omgps/src/network.c	2011-05-09 09:59:11.637676772 +0200
+@@ -19,16 +19,16 @@
+ #include <assert.h>
+ #include <glib.h>
+ 
+-#if (HAVE_SYS_CAPABILITY_H)
+-#undef _POSIX_SOURCE
+-#include <sys/capability.h>
+-#endif
+-
+ #include "config.h"
+ #include "util.h"
+ #include "network.h"
+ #include "customized.h"
+ 
++#if (HAVE_SYS_CAPABILITY_H)
++#undef _POSIX_SOURCE
++#include <sys/capability.h>
++#endif
++
+ /**
+  * Ping: reference <Unix network programming>, volume 1, third edition.
+  */
+--- omgps.orig/Makefile.am	2009-10-28 18:51:17.000000000 +0100
++++ omgps/Makefile.am	2011-05-09 10:04:58.578676679 +0200
+@@ -33,7 +33,7 @@
+ 
+ omgps_CFLAGS = $(common_CFLAGS) -O2
+ omgps_LDFLAGS = 
+-omgps_LDADD = @DEPENDENCIES_LIBS@ -lpython$(PY_VERSION)
++omgps_LDADD = @DEPENDENCIES_LIBS@ -lcap -lpython$(PY_VERSION)
+ 
+ omgps_SOURCES =          \
+   src/ctx_agps_online.c  \
diff --git a/meta-oe/recipes-navigation/omgps/omgps/gcc-4.4.patch b/meta-oe/recipes-navigation/omgps/omgps/gcc-4.4.patch
new file mode 100644
index 0000000..3eae960
--- /dev/null
+++ b/meta-oe/recipes-navigation/omgps/omgps/gcc-4.4.patch
@@ -0,0 +1,68 @@
+diff -uNr omgps.orig/src/include/map_repo.h omgps/src/include/map_repo.h
+--- omgps.orig/src/include/map_repo.h	2009-07-20 19:54:08.000000000 +0200
++++ omgps/src/include/map_repo.h	2010-01-17 14:55:24.000000000 +0100
+@@ -3,6 +3,9 @@
+ 
+ #include <glib.h>
+ #include <gdk/gdk.h>
++// workaround Python.h unconditionally (re)defines _XOPEN_SOURCE and _POSIX_C_SOURCE
++#undef _XOPEN_SOURCE
++#undef _POSIX_C_SOURCE
+ #include <Python.h>
+ 
+ #define MAP_MAX_BG_COLORS	5
+diff -uNr omgps.orig/src/include/py_ext.h omgps/src/include/py_ext.h
+--- omgps.orig/src/include/py_ext.h	2009-07-20 19:54:08.000000000 +0200
++++ omgps/src/include/py_ext.h	2010-01-17 14:55:57.000000000 +0100
+@@ -4,8 +4,8 @@
+ void py_ext_init();
+ void py_ext_cleanup();
+ 
+-void inline py_ext_trylock();
+-void inline py_ext_lock();
+-void inline py_ext_unlock();
++void py_ext_trylock();
++void py_ext_lock();
++void py_ext_unlock();
+ 
+ #endif /* PY_EXT_H_ */
+diff -uNr omgps.orig/src/include/uart.h omgps/src/include/uart.h
+--- omgps.orig/src/include/uart.h	2009-07-20 19:54:08.000000000 +0200
++++ omgps/src/include/uart.h	2010-01-17 14:33:00.000000000 +0100
+@@ -12,9 +12,9 @@
+ extern void uart_cleanup();
+ extern void uart_close();
+ 
+-extern inline int read_with_timeout(U1 *buf, int len);
+-extern inline int write_with_timeout(U1 *buf, int len);
+-extern inline gboolean read_fixed_len(U1 *buf, int expected_len);
++extern int read_with_timeout(U1 *buf, int len);
++extern int write_with_timeout(U1 *buf, int len);
++extern gboolean read_fixed_len(U1 *buf, int expected_len);
+ 
+ extern int sysfs_get_gps_device_power();
+ extern gboolean gps_device_power_on();
+diff -uNr omgps.orig/src/py_ext.c omgps/src/py_ext.c
+--- omgps.orig/src/py_ext.c	2009-07-20 19:54:08.000000000 +0200
++++ omgps/src/py_ext.c	2010-01-17 14:56:46.000000000 +0100
+@@ -26,17 +26,17 @@
+ 		Py_Finalize();
+ }
+ 
+-void inline py_ext_trylock()
++void py_ext_trylock()
+ {
+ 	TRYLOCK_MUTEX(&lock);
+ }
+ 
+-void inline py_ext_lock()
++void py_ext_lock()
+ {
+ 	LOCK_MUTEX(&lock);
+ }
+ 
+-void inline py_ext_unlock()
++void py_ext_unlock()
+ {
+ 	UNLOCK_MUTEX(&lock);
+ }
diff --git a/meta-oe/recipes-navigation/omgps/omgps/sysfs.node.2.6.32.patch b/meta-oe/recipes-navigation/omgps/omgps/sysfs.node.2.6.32.patch
new file mode 100644
index 0000000..d18a2fd
--- /dev/null
+++ b/meta-oe/recipes-navigation/omgps/omgps/sysfs.node.2.6.32.patch
@@ -0,0 +1,11 @@
+diff -uNr omgps.orig//src/uart.c omgps/src/uart.c
+--- omgps.orig//src/uart.c	2010-08-22 23:34:09.000000000 +0200
++++ omgps/src/uart.c	2010-08-22 23:33:54.000000000 +0200
+@@ -30,6 +30,7 @@
+  * NOTE: these file paths are subject to change according to kernel and distribution.
+  */
+ static const char *sysfs_gps_power[] = {
++	"/sys/bus/platform/devices/gta02-pm-gps.0/power_on",
+ 	"/sys/bus/platform/devices/neo1973-pm-gps.0/power_on",
+ 	"/sys/bus/platform/devices/neo1973-pm-gps.0/pwron"
+ };
diff --git a/meta-oe/recipes-navigation/omgps/omgps/use.unused.variable.patch b/meta-oe/recipes-navigation/omgps/omgps/use.unused.variable.patch
new file mode 100644
index 0000000..73d6dba
--- /dev/null
+++ b/meta-oe/recipes-navigation/omgps/omgps/use.unused.variable.patch
@@ -0,0 +1,12 @@
+--- a/src/settings.c	2011-12-12 13:21:30.573400795 +0100
++++ b/src/settings.c	2011-12-12 14:11:05.269606119 +0100
+@@ -278,6 +278,9 @@
+ 	}
+ 
+ 	ret = check_settings(errbuf, ERRBUF_LEN);
++	if (ret == FALSE) {
++		snprintf(errbuf, ERRBUF_LEN, "Something wrong while loading settings file");
++	}
+ 
+ 	if (fd > 0)
+ 		close(fd);
diff --git a/meta-oe/recipes-navigation/omgps/omgps_svn.bb b/meta-oe/recipes-navigation/omgps/omgps_svn.bb
new file mode 100644
index 0000000..59fd9b0
--- /dev/null
+++ b/meta-oe/recipes-navigation/omgps/omgps_svn.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "GPS application for openmoko freerunner"
+HOMEPAGE = "http://omgps.googlecode.com"
+SECTION = "openmoko/applications"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+DEPENDS = "gtk+ python-pygobject dbus-glib"
+SRCREV = "109"
+PV = "0.1+svnr${SRCPV}"
+S = "${WORKDIR}/${PN}"
+
+do_configure_prepend() {
+   sed -i "s#PY_VERSION = 2.6#PY_VERSION = ${PYTHON_BASEVERSION}#g" ${S}/Makefile.am
+   sed -i "s#PY_INC_DIR = \$(OPIEDIR)#PY_INC_DIR = ${STAGING_DIR_HOST}#g" ${S}/Makefile.am
+}
+
+SRC_URI = "svn://omgps.googlecode.com/svn/trunk;module=omgps;protocol=http \
+           file://gcc-4.4.patch \
+           file://sysfs.node.2.6.32.patch \
+           file://fix.capability.patch \
+           file://use.unused.variable.patch \
+"
+
+inherit autotools
diff --git a/meta-oe/recipes-navigation/orrery/orrery/orrery.png b/meta-oe/recipes-navigation/orrery/orrery/orrery.png
new file mode 100644
index 0000000000000000000000000000000000000000..d9865b70ce777d6e4b4c437f73095d2329e222ce
GIT binary patch
literal 19475
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
ScFe&`q`Fg0$0Ox~7W_XxaP++Z

literal 0
HcmV?d00001

diff --git a/meta-oe/recipes-navigation/orrery/orrery/use.GdkPixbuf.patch b/meta-oe/recipes-navigation/orrery/orrery/use.GdkPixbuf.patch
new file mode 100644
index 0000000..92d194d
--- /dev/null
+++ b/meta-oe/recipes-navigation/orrery/orrery/use.GdkPixbuf.patch
@@ -0,0 +1,59 @@
+From: Benjamin Deering
+Subject: orrery crashing X
+Date: Thursday, September 2, 2010 - 5:25 pm
+Link: http://kerneltrap.org/mailarchive/openmoko-community/2010/9/3/13218
+
+diff -uNr orrery.orig//orrery.c orrery/orrery.c
+--- orrery.orig//orrery.c	2009-11-30 06:59:44.000000000 +0100
++++ orrery/orrery.c	2010-11-15 22:33:17.000000000 +0100
+@@ -1238,12 +1238,44 @@
+     }
+     currentEntry = currentEntry->forwardPointer;
+   }
+-  if (nDarkGreyPoints > 0)
+-    gdk_draw_points(pixmap, darkGreyGC, darkGreyPoints, nDarkGreyPoints);
+-  if (nGreyPoints > 0)
+-    gdk_draw_points(pixmap, greyGC, greyPoints, nGreyPoints);
+-  if (nWhitePoints > 0)
+-    gdk_draw_points(pixmap, whiteGC, whitePoints, nWhitePoints);
++  GdkPixbuf* starDrawingBuf = gdk_pixbuf_get_from_drawable( NULL,
++                                                            pixmap,
++                                                            gdk_colormap_get_system()
++                                                            , 0, 0, 0, 0, displayWidth, displayHeight);
++  g_assert (gdk_pixbuf_get_bits_per_sample (starDrawingBuf) == 8);
++  guchar* p;
++  int rowstride = gdk_pixbuf_get_rowstride (starDrawingBuf);
++  guchar* pixels = gdk_pixbuf_get_pixels (starDrawingBuf);
++  int n_channels = gdk_pixbuf_get_n_channels (starDrawingBuf);
++  GdkGCValues starGCval;
++  GdkColor starColor;
++  int pointNum;
++  gdk_gc_get_values(darkGreyGC, &starGCval);
++  gdk_colormap_query_color( gdk_gc_get_colormap(darkGreyGC),starGCval.foreground.pixel, &starColor );
++  for( pointNum = 0; pointNum < nDarkGreyPoints; pointNum++) {
++    p = pixels + darkGreyPoints[pointNum].y * rowstride + darkGreyPoints[pointNum].x * n_channels;
++    p[0] = starColor.red & 0xff;
++    p[1] = starColor.green & 0xff;
++    p[2] = starColor.blue & 0xff;
++  }
++  gdk_gc_get_values(greyGC, &starGCval);
++  gdk_colormap_query_color( gdk_gc_get_colormap(greyGC), starGCval.foreground.pixel, &starColor );
++  for( pointNum = 0; pointNum < nGreyPoints; pointNum++) {
++    p = pixels + greyPoints[pointNum].y * rowstride + greyPoints[pointNum].x * n_channels;
++    p[0] = starColor.red & 0xff;
++    p[1] = starColor.green & 0xff;
++    p[2] = starColor.blue & 0xff;
++  }
++  gdk_gc_get_values(whiteGC, &starGCval);
++  gdk_colormap_query_color( gdk_gc_get_colormap(whiteGC), starGCval.foreground.pixel, &starColor );
++  for( pointNum = 0; pointNum < nWhitePoints; pointNum++) {
++    p = pixels + whitePoints[pointNum].y * rowstride + whitePoints[pointNum].x * n_channels;
++    p[0] = starColor.red & 0xff;
++    p[1] = starColor.green & 0xff;
++    p[2] = starColor.blue & 0xff;
++  }
++  gdk_draw_pixbuf ( pixmap , NULL , starDrawingBuf,
++            0, 0, 0, 0, displayWidth, displayHeight, GDK_RGB_DITHER_NORMAL, 0, 0 ) ;
+ }
+ 
+ void makeTimeString(char *string)
diff --git a/meta-oe/recipes-navigation/orrery/orrery_2.7.bb b/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
new file mode 100644
index 0000000..1e41f5b
--- /dev/null
+++ b/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "Astronomical application which displays the night sky"
+HOMEPAGE    = "http://projects.openmoko.org/projects/orrery/"
+SECTION = "x11/scientific"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://orrery.c;endline=25;md5=d792bdf2b591972da175aecc38d88cfe"
+
+inherit autotools
+
+SRC_URI = "http://projects.openmoko.org/frs/download.php/923/orrery_2.7_clean.tar.gz \
+           file://orrery.png \
+           file://use.GdkPixbuf.patch \
+"
+
+SRC_URI[md5sum]    = "bd62a33e7554ee1030313dfcdefcda8b"
+SRC_URI[sha256sum] = "645166a5e05b2064ab630534a514697fc47b681951e7fe1d635c259cbdf7a5e6"
+
+S = "${WORKDIR}/${PN}"
+
+do_configure_prepend() {
+  # fix DSO issue with binutils-2.22
+  sed -i 's/ -lrt/ -lrt -lm/g' ${S}/Makefile.am
+}
+do_install_append() {
+    install -d ${D}${datadir}/orrery
+    cp -a ${S}/data/* ${D}${datadir}/orrery
+    install -d ${D}${datadir}/icons
+    install -m 0755 ${WORKDIR}/orrery.png ${D}${datadir}/icons
+}
+
+FILES_${PN} += "${datadir}/icons/orrery.png"
-- 
1.7.8.6



