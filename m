Return-Path: <thilo.cestonaro@ts.fujitsu.com>
X-Greylist: delayed 425 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 18 Nov 2016 13:29:39 UTC
Received: from mail1.bemta6.messagelabs.com (mail1.bemta6.messagelabs.com
	[193.109.254.111])
	by mail.openembedded.org (Postfix) with ESMTP id C15D86B6F7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2016 13:29:39 +0000 (UTC)
Received: from [193.109.254.3] by server-7.bemta-6.messagelabs.com id
	A4/D9-29519-B900F285; Fri, 18 Nov 2016 13:22:35 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNLMWRWlGSWpSXmKPExsViZ8MxVXcWg36
	EwZ7LUhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b2PROYC66pVrw8N5WtgfGnYhcjF4eQwCVG
	iS3flrJ1MXIAObUS7b0aICabgJnEt/WFXYycHCICuhIfP8xlBAkzC5hIPF3tBxIWFnCU2Nf0k
	QXEZhFQlbjzYCcziM0r4Cwx4+AyRhBbQkBeYuH5I0wTGDkXMDKsYtQoTi0qSy3SNTTXSyrKTM
	8oyU3MzNE1NDDTy00tLk5MT81JTCrWS87P3cQI9BQDEOxgvL0x4BCjJAeTkiivd79ehBBfUn5
	KZUZicUZ8UWlOavEhRhkODiUJXuv/QDnBotT01Iq0zBxgyMCkJTh4lER4VUHSvMUFibnFmekQ
	qVOMilLivD//ASUEQBIZpXlwbbAwvcQoKyXMywh0iBBPQWpRbmYJqvwrRnEORiVhXl2Q8TyZe
	SVw018BLWYCWrxHQAdkcUkiQkqqgbG6zmDBt336fiU8Ceu6mycc2SbSwcZ3lC3Ni/PuL/2/N5
	2lLC50v5hpvWC1kGjvk/XzvP33riwT7Y5X6DHRLf2o/EWzutO39Fmimk5vZflGDw1JpWrl0/8
	lbE8Y/A15KvXG+XPrwzOZosJFJyZOfKORmeKn/6khQZ3j+DHuFfLmrku25at4KbEUZyQaajEX
	FScCAHql7o5OAgAA
X-Env-Sender: thilo.cestonaro@ts.fujitsu.com
X-Msg-Ref: server-4.tower-184.messagelabs.com!1479475354!79934505!1
X-Originating-IP: [62.60.8.149]
X-StarScan-Received: 
X-StarScan-Version: 9.0.16; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8636 invoked from network); 18 Nov 2016 13:22:34 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
	by server-4.tower-184.messagelabs.com with DHE-RSA-AES256-GCM-SHA384
	encrypted SMTP; 18 Nov 2016 13:22:34 -0000
Received: from abgdgate50u.abg.fsc.net ([172.25.138.66])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id
	uAIDMnVM030027 for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2016 13:22:54 GMT
Received: from abg4858n-lnx.abg.fsc.net ([172.26.69.149])
	by abgdgate50u.abg.fsc.net with ESMTP; 18 Nov 2016 14:22:29 +0100
From: Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Nov 2016 14:18:45 +0100
Message-Id: <20161118131845.18499-1-thilo.cestonaro@ts.fujitsu.com>
X-Mailer: git-send-email 2.10.2
Subject: [meta-oe][PATCH v2] libdbus-c++: added recipe for it
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
X-List-Received-Date: Fri, 18 Nov 2016 13:29:43 -0000

Signed-off-by: Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>
---
 .../fix-missing-unistd.h-include.patch             | 40 ++++++++++++++++++++++
 .../remove-CXX_FOR_BUILD-stuff.patch               | 33 ++++++++++++++++++
 meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb     | 24 +++++++++++++
 3 files changed, 97 insertions(+)
 create mode 100644 meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/fix-missing-unistd.h-include.patch
 create mode 100644 meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/remove-CXX_FOR_BUILD-stuff.patch
 create mode 100644 meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb

 changes v2:
 added Upstream-Status to libdbus-c++ patches.

diff --git a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/fix-missing-unistd.h-include.patch b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/fix-missing-unistd.h-include.patch
new file mode 100644
index 0000000..903a720
--- /dev/null
+++ b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/fix-missing-unistd.h-include.patch
@@ -0,0 +1,40 @@
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
+Upstream-Status: Inappropriate [ not author, no upstream ]
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
index 0000000..fa29d3c
--- /dev/null
+++ b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/remove-CXX_FOR_BUILD-stuff.patch
@@ -0,0 +1,33 @@
+From: Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>
+Date: Fri, 18 Nov 2016 10:23:07 +0100
+Subject: Build libdbus-c++ tools for target platform rather than enforced for
+host platform.
+
+Upstream-Status: Inappropriate [no upstream]
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


