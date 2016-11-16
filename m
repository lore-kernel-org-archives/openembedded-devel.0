Return-Path: <thilo.cestonaro@ts.fujitsu.com>
Received: from mail1.bemta3.messagelabs.com (mail1.bemta3.messagelabs.com
	[195.245.230.176])
	by mail.openembedded.org (Postfix) with ESMTP id 3F7E4719DF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Nov 2016 10:26:51 +0000 (UTC)
Received: from [85.158.138.179] by server-16.bemta-3.messagelabs.com id
	29/0A-12362-C643C285; Wed, 16 Nov 2016 10:26:52 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNLMWRWlGSWpSXmKPExsViZ8MRopttohN
	hsOeescXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnFoqknBd7mKY2c7WRoYX0h3MXJxCAlcYpTo
	/7yUtYuRE8jpZpR4uDCoi5GDg03ATOLb+kKQsIiArsTHD3MZQcLMAiYST1f7gYSFBewkXv39x
	gxiswioSsw9dZ8JxOYVcJJY1tTIAmJLCMhLLDx/hGkCI+cCRoZVjBrFqUVlqUW6RgZ6SUWZ6R
	kluYmZObqGBsZ6uanFxYnpqTmJScV6yfm5mxiBnqpnYGDcwdh8wu8QoyQHk5IoLw+rToQQX1J
	+SmVGYnFGfFFpTmrxIUYZDg4lCV5PY6CcYFFqempFWmYOMGRg0hIcPEoivL1GQGne4oLE3OLM
	dIjUKUZFKXFefpA+AZBERmkeXBssTC8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuZtBJnCk
	5lXAjf9FdBiJqDFewTAFpckIqSkGhh5ZOdMYXYt2bvMi/uKh9nzci9bE7UDKXKGp3evcI+aJi
	5YkKj5672809+KpQnM0VzhNq9O/tmSP3eGcs3s97GvY6vkGOS/nCw+23f/6k1Rp4gX0z+1fpo
	id0clZuO8OzLLBeYmPl1Q9+nXf4Wp5ktKt01Rq3n69vwK3sWr082/6VYcsKl67+6jxFKckWio
	xVxUnAgAO9mZQ04CAAA=
X-Env-Sender: thilo.cestonaro@ts.fujitsu.com
X-Msg-Ref: server-8.tower-169.messagelabs.com!1479292011!77576184!1
X-Originating-IP: [62.60.8.84]
X-StarScan-Received: 
X-StarScan-Version: 9.0.16; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12659 invoked from network); 16 Nov 2016 10:26:51 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
	by server-8.tower-169.messagelabs.com with DHE-RSA-AES256-GCM-SHA384
	encrypted SMTP; 16 Nov 2016 10:26:51 -0000
Received: from abgdgate50u.abg.fsc.net ([172.25.138.66])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id
	uAGAQhVq019860 for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Nov 2016 10:26:43 GMT
Received: from unknown (HELO abg4858n-lnx.CSOD.local) ([10.172.228.10])
	by abgdgate50u.abg.fsc.net with ESMTP; 16 Nov 2016 11:26:51 +0100
From: Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Nov 2016 11:23:07 +0100
Message-Id: <20161116102307.7678-1-thilo.cestonaro@ts.fujitsu.com>
X-Mailer: git-send-email 2.10.2
Subject: [meta-oe][PATCH] libdbus-c++: added recipe for it
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
X-List-Received-Date: Wed, 16 Nov 2016 10:26:54 -0000

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


