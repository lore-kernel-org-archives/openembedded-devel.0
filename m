Return-Path: <thilo.cestonaro@ts.fujitsu.com>
X-Greylist: delayed 415 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 16 Nov 2016 08:45:27 UTC
Received: from mail1.bemta5.messagelabs.com (mail1.bemta5.messagelabs.com
	[195.245.231.139])
	by mail.openembedded.org (Postfix) with ESMTP id D32397199F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Nov 2016 08:45:27 +0000 (UTC)
Received: from [85.158.136.83] by server-3.bemta-5.messagelabs.com id
	B7/39-01948-70B1C285; Wed, 16 Nov 2016 08:38:31 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNLMWRWlGSWpSXmKPExsViZ8MRqssurRN
	hcHirmMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnFoqknBd7mKY2c7WRoYX0h3MXJxCAlcYpTY
	u76TFcLpZpRYvfQKUxcjBwebgJnEt/WFXYycHCICuhIfP8xlBAkzC5hIPF3tBxIWFjCUWH/1I
	iOIzSKgKrF/+QE2EJtXwFni/5H1zCC2hIC8xMLzR5gmMHIuYGRYxahenFpUllqka6qXVJSZnl
	GSm5iZo2toYKqXm1pcnJiempOYVKyXnJ+7iRHoKQYg2MH4pd/5EKMkB5OSKC8Pq06EEF9Sfkp
	lRmJxRnxRaU5q8SFGGQ4OJQleXymgnGBRanpqRVpmDjBkYNISHDxKIryZkkBp3uKCxNzizHSI
	1ClGRSlx3mcgCQGQREZpHlwbLEwvMcpKCfMyAh0ixFOQWpSbWYIq/4pRnINRSZhXHWQ7T2ZeC
	dz0V0CLmYAW7xEAW1ySiJCSamBMLqo1eVFrPL3y1s01prWyKSJpHv06267ks2dH1mmdWslpsK
	1fTnLBuuyvDbvz181f/Dm4fjPH9RMtS+b9uuorVHA4edMH80meac1TN9y42a6wxmzjqpJYj6a
	1Bw1fvK1foWYYUWs//+2HqU8r1C+m1Dr+3Jd29am2Kfe9Q1+7xDR+T712pjFAiaU4I9FQi7mo
	OBEAY0fd0E4CAAA=
X-Env-Sender: thilo.cestonaro@ts.fujitsu.com
X-Msg-Ref: server-3.tower-36.messagelabs.com!1479285511!70467112!1
X-Originating-IP: [62.60.8.85]
X-StarScan-Received: 
X-StarScan-Version: 9.0.16; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17204 invoked from network); 16 Nov 2016 08:38:31 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
	by server-3.tower-36.messagelabs.com with DHE-RSA-AES256-GCM-SHA384
	encrypted SMTP; 16 Nov 2016 08:38:31 -0000
Received: from abgdgate60u.abg.fsc.net ([172.25.138.90])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id
	uAG8cK6H004587 for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Nov 2016 08:38:27 GMT
Received: from unknown (HELO abg4858n-lnx.CSOD.local) ([10.172.228.10])
	by abgdgate60u.abg.fsc.net with ESMTP; 16 Nov 2016 09:38:25 +0100
From: Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Nov 2016 09:34:41 +0100
Message-Id: <20161116083441.28311-1-thilo.cestonaro@ts.fujitsu.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH] libdbus-c++: added recipe for it
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
X-List-Received-Date: Wed, 16 Nov 2016 08:45:28 -0000

to fix the build, two patches where needed.

One which just adds an include of unistd.h, as the functions pipe, write and
close defined by this include, weren't defined.

The other patch enables the build to build the tools of libdbus-c++ for the
target, which, without the patch, will always be build for the host, even when
cross compiling.

Signed-off-by: Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>
---
 .../fix-missing-unistd.h-include.patch             | 12 +++++++++++
 .../remove-CXX_FOR_BUILD-stuff.patch               | 24 ++++++++++++++++++++++
 meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb     | 24 ++++++++++++++++++++++
 3 files changed, 60 insertions(+)
 create mode 100644 meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/fix-missing-unistd.h-include.patch
 create mode 100644 meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/remove-CXX_FOR_BUILD-stuff.patch
 create mode 100644 meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb

diff --git a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/fix-missing-unistd.h-include.patch b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/fix-missing-unistd.h-include.patch
new file mode 100644
index 0000000..5cb8096
--- /dev/null
+++ b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/fix-missing-unistd.h-include.patch
@@ -0,0 +1,12 @@
+diff --git a/include/dbus-c++/eventloop-integration.h b/include/dbus-c++/eventloop-integration.h
+index 1b0302e..3e44304 100644
+--- a/include/dbus-c++/eventloop-integration.h
++++ b/include/dbus-c++/eventloop-integration.h
+@@ -26,6 +26,7 @@
+ #define __DBUSXX_EVENTLOOP_INTEGRATION_H
+ 
+ #include <errno.h>
++#include <unistd.h>
+ #include "api.h"
+ #include "dispatcher.h"
+ #include "util.h"
diff --git a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/remove-CXX_FOR_BUILD-stuff.patch b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/remove-CXX_FOR_BUILD-stuff.patch
new file mode 100644
index 0000000..906470a
--- /dev/null
+++ b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/remove-CXX_FOR_BUILD-stuff.patch
@@ -0,0 +1,24 @@
+diff -Naur libdbus-c++-0.9.0.ori/configure.ac libdbus-c++-0.9.0/configure.ac
+--- libdbus-c++-0.9.0.ori/configure.ac	2016-11-15 14:25:36.085882774 +0100
++++ libdbus-c++-0.9.0/configure.ac	2016-11-15 14:27:08.814568717 +0100
+@@ -64,9 +64,6 @@
+ AC_PROG_CC
+ AC_PROG_CXX
+ 
+-CXX_FOR_BUILD=${CXX_FOR_BUILD-${CXX}}
+-AC_SUBST(CXX_FOR_BUILD)
+-
+ AM_PROG_LIBTOOL
+ 
+ PKG_PROG_PKG_CONFIG
+diff -Naur libdbus-c++-0.9.0.ori/tools/Makefile.am libdbus-c++-0.9.0/tools/Makefile.am
+--- libdbus-c++-0.9.0.ori/tools/Makefile.am	2016-11-15 14:25:36.089882803 +0100
++++ libdbus-c++-0.9.0/tools/Makefile.am	2016-11-15 14:26:19.454203583 +0100
+@@ -1,7 +1,5 @@
+ # hacky, but ...
+ 
+-CXX = $(CXX_FOR_BUILD)
+-
+ AM_CPPFLAGS = \
+ 	$(dbus_CFLAGS) \
+ 	$(xml_CFLAGS) \
diff --git a/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb b/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb
new file mode 100644
index 0000000..7edaffc
--- /dev/null
+++ b/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb
@@ -0,0 +1,24 @@
+SUMMARY = "DBus-C++ Library"
+DESCRIPTION = "DBus-c++ attempts to provide a C++ API for D-BUS. The library has a glib and an Ecore mainloop integration. It also offers an optional own main loop."
+HOMEPAGE = "http://dbus-cplusplus.sourceforge.net"
+SECTION = "base"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+DEPENDS = "dbus glib-2.0 libpcre"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/dbus-cplusplus/dbus-c++/${PV}/${BPN}-${PV}.tar.gz \
+		   file://fix-missing-unistd.h-include.patch \
+		   file://remove-CXX_FOR_BUILD-stuff.patch"
+SRC_URI[md5sum] = "e752116f523fa88ef041e63d3dee4de2"
+SRC_URI[sha256sum] = "bc11ac297b3cb010be904c72789695543ee3fdf3d75cdc8225fd371385af4e61"
+
+EXTRA_OECONF = "--disable-ecore --disable-examples --disable-tests"
+
+inherit autotools pkgconfig
+
+PACKAGES += "${PN}-tools"
+
+FILES_${PN} = "${libdir}"
+FILES_${PN}-tools = "${bindir}"
+
+BBCLASSEXTEND = "native"
-- 
2.10.2


