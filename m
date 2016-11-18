Return-Path: <thilo.cestonaro@ts.fujitsu.com>
Received: from mail1.bemta3.messagelabs.com (mail1.bemta3.messagelabs.com
	[195.245.230.163])
	by mail.openembedded.org (Postfix) with ESMTP id B267F71A82
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2016 09:40:51 +0000 (UTC)
Received: from [85.158.138.179] by server-3.bemta-3.messagelabs.com id
	15/29-24885-3ACCE285; Fri, 18 Nov 2016 09:40:51 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNLMWRWlGSWpSXmKPExsViZ8MxVXfxGb0
	Ig9MzxS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1owzU+QK1qtUHPy0iq2B8YVCFyMXh5DAJUaJ
	lvdPWboYOYGcWomPX7YwdTFycLAJmEl8W18IEhYR0JX4+GEuI0iYWcBE4ulqP5CwsICdxKu/3
	5hBbBYBVYme59PBpvAKOElsWf+fFcSWEJCXWHj+CNMERs4FjAyrGDWKU4vKUot0jcz1kooy0z
	NKchMzc3QNDYz1clOLixPTU3MSk4r1kvNzNzECPVXPwMC4g7Flr98hRkkOJiVRXu9+vQghvqT
	8lMqMxOKM+KLSnNTiQ4wyHBxKEryZp4FygkWp6akVaZk5wJCBSUtw8CiJ8FqBpHmLCxJzizPT
	IVKnGBWlxHk3gyQEQBIZpXlwbbAwvcQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmJcXZApPZ
	l4J3PRXQIuZgBbvEdABWVySiJCSamAMm1baIDxv19S5j3/W+J+o0PZcqifhpXdm7qGjbm5GU1
	d425j6ZQddtlfqnGG0tX654JbPHef9gpfVnDK6PS3MUv+jbeK5z8uvfxNYPb16N9/BOJ/LXnp
	1MZkvJB3Wz/qxatsamRPvJKpa4hR+9kYUaOmaHpYTn330/rzW4rTCSQWvcpf/n/dJiaU4I9FQ
	i7moOBEA5oEV204CAAA=
X-Env-Sender: thilo.cestonaro@ts.fujitsu.com
X-Msg-Ref: server-6.tower-169.messagelabs.com!1479462051!77771565!1
X-Originating-IP: [62.60.8.149]
X-StarScan-Received: 
X-StarScan-Version: 9.0.16; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12326 invoked from network); 18 Nov 2016 09:40:51 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
	by server-6.tower-169.messagelabs.com with DHE-RSA-AES256-GCM-SHA384
	encrypted SMTP; 18 Nov 2016 09:40:51 -0000
Received: from abgdgate60u.abg.fsc.net ([172.25.138.90])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id
	uAI9f2Tf022588 for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2016 09:41:11 GMT
Received: from abg4858n-lnx.abg.fsc.net ([172.26.69.149])
	by abgdgate60u.abg.fsc.net with ESMTP; 18 Nov 2016 10:40:42 +0100
From: Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Nov 2016 10:36:59 +0100
Message-Id: <20161118093659.9117-1-thilo.cestonaro@ts.fujitsu.com>
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
X-List-Received-Date: Fri, 18 Nov 2016 09:40:54 -0000

Signed-off-by: Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>
---
 .../fix-missing-unistd.h-include.patch             | 39 ++++++++++++++++++++++
 .../remove-CXX_FOR_BUILD-stuff.patch               | 32 ++++++++++++++++++
 meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb     | 24 +++++++++++++
 3 files changed, 95 insertions(+)
 create mode 100644 meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/fix-missing-unistd.h-include.patch
 create mode 100644 meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/remove-CXX_FOR_BUILD-stuff.patch
 create mode 100644 meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb

diff --git a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/fix-missing-unistd.h-include.patch b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/fix-missing-unistd.h-include.patch
new file mode 100644
index 0000000..4673375
--- /dev/null
+++ b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/fix-missing-unistd.h-include.patch
@@ -0,0 +1,39 @@
+
+sniped from ChromiumOS
+
+https://bugs.gentoo.org/424707
+
+From 154f7861d19a2bd5c79c488f9989610971db451b Mon Sep 17 00:00:00 2001
+From: Han Shen <shenhan@google.com>
+Date: Thu, 31 May 2012 16:49:35 -0700
+Subject: [PATCH] Fixed dbus-c++ gcc 4.7 building problem.
+
+Just add "unistd.h" inclusion to eventloop-integration.h.
+
+BUG=None
+TEST=Manually built using gcc 4.7.
+
+Change-Id: I87bd1f90db6a4c974a5ed8134044e8be2034aff2
+Reviewed-on: https://gerrit.chromium.org/gerrit/24260
+Tested-by: Han Shen <shenhan@google.com>
+Reviewed-by: Yunlian Jiang <yunlian@chromium.org>
+Commit-Ready: Han Shen <shenhan@chromium.org>
+Signed-off-by: Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>
+---
+ include/dbus-c++/eventloop-integration.h |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/dbus-c++/eventloop-integration.h b/include/dbus-c++/eventloop-integration.h
+index 5108340..1b56ab5 100644
+--- a/include/dbus-c++/eventloop-integration.h
++++ b/include/dbus-c++/eventloop-integration.h
+@@ -27,6 +27,7 @@
+ 
+ #include <cstring>
+ #include <errno.h>
++#include <unistd.h>
+ #include "api.h"
+ #include "dispatcher.h"
+ #include "util.h"
+-- 
+1.7.9.7
diff --git a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/remove-CXX_FOR_BUILD-stuff.patch b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/remove-CXX_FOR_BUILD-stuff.patch
new file mode 100644
index 0000000..247dcf6
--- /dev/null
+++ b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/remove-CXX_FOR_BUILD-stuff.patch
@@ -0,0 +1,32 @@
+From: Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>
+Date: Fri, 18 Nov 2016 10:23:07 +0100
+Subject: Build libdbus-c++ tools for target platform rather than enforced for
+host platform.
+
+Signed-off-by: Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>
+---
+
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


