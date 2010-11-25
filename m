Received: from note.orchestra.cse.unsw.edu.au ([129.94.242.24])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jayen@cse.unsw.edu.au>) id 1PLUh1-0005e5-UK
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 06:48:38 +0100
Received: From localhost.localdomain ([129.94.175.7] ==
	runswift.cse.unsw.EDU.AU) By
	note With Smtp ; Thu, 25 Nov 2010 16:47:08 +1100 
From: Jayen Ashar <jayen@cse.unsw.edu.au>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Nov 2010 16:46:43 +1100
Message-Id: <1290664003-17257-1-git-send-email-jayen@cse.unsw.edu.au>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 129.94.242.24
X-SA-Exim-Mail-From: jayen@cse.unsw.edu.au
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS, SPF_NEUTRAL,
	UNPARSEABLE_RELAY autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Jayen Ashar <jayen@cse.unsw.edu.au>
Subject: [PATCH] IceE: New program
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
X-List-Received-Date: Thu, 25 Nov 2010 05:48:38 -0000

* Starting with 1.3.0
* ZeroC Ice is a CORBA-like middleware solution. IceE is a subset of Ice used in
*  embedded systems.

Signed-off-by: Jayen Ashar <jayen@cse.unsw.edu.au>
---
 recipes/zeroc-ice-e/zeroc-ice-e.inc             |   24 ++++++++
 recipes/zeroc-ice-e/zeroc-ice-e/configure.patch |   11 ++++
 recipes/zeroc-ice-e/zeroc-ice-e/cross.patch     |   68 +++++++++++++++++++++++
 recipes/zeroc-ice-e/zeroc-ice-e_1.3.0.bb        |    3 +
 4 files changed, 106 insertions(+), 0 deletions(-)
 create mode 100644 recipes/zeroc-ice-e/zeroc-ice-e.inc
 create mode 100644 recipes/zeroc-ice-e/zeroc-ice-e/configure.patch
 create mode 100644 recipes/zeroc-ice-e/zeroc-ice-e/cross.patch
 create mode 100644 recipes/zeroc-ice-e/zeroc-ice-e_1.3.0.bb

diff --git a/recipes/zeroc-ice-e/zeroc-ice-e.inc b/recipes/zeroc-ice-e/zeroc-ice-e.inc
new file mode 100644
index 0000000..654747a
--- /dev/null
+++ b/recipes/zeroc-ice-e/zeroc-ice-e.inc
@@ -0,0 +1,24 @@
+DESCRIPTION = "Embedded edition of the ZeroC Ice\
+ZeroC Ice is a CORBA-like middleware solution. IceE is a subset of Ice used in embedded systems. This is a dummy package that depends on the full set of IceE packages."
+HOMEPAGE = "http://www.zeroc.com/icee/index.html"
+SECTION = "devel"
+PRIORITY = "optional"
+LICENSE = "GPL"
+DEPENDS = ""
+
+INC_PR = "r0"
+
+SRC_URI = "http://www.zeroc.com/download/IceE/1.3/IceE-${PV}-linux.tar.gz \
+           file://cross.patch;patch=1"
+
+S = "${WORKDIR}/IceE-${PV}"
+
+do_configure() {
+  oe_runmake configure  
+}
+
+do_install() {
+  oe_runmake install prefix=${D}/${prefix} install_slicedir=${D}/${datadir}/IceE-${PV}/slice
+}
+
+FILES_${PN} += " ${datadir}/IceE-${PV}"
diff --git a/recipes/zeroc-ice-e/zeroc-ice-e/configure.patch b/recipes/zeroc-ice-e/zeroc-ice-e/configure.patch
new file mode 100644
index 0000000..cfb7e3a
--- /dev/null
+++ b/recipes/zeroc-ice-e/zeroc-ice-e/configure.patch
@@ -0,0 +1,11 @@
+--- cppe/config/Make.rules~	2010-11-14 17:54:54.000000000 +1100
++++ cppe/config/Make.rules	2010-11-14 17:55:39.861202351 +1100
+@@ -41,7 +41,7 @@
+ # Define LP64 as yes or no if you want force a 32 or 64 bit. The default
+ # is platform-dependent
+ #
+-#LP64			:= yes
++LP64			:= no
+ 
+ # ----------------------------------------------------------------------
+ # Ice-E supports a number of optional features that are enabled via
diff --git a/recipes/zeroc-ice-e/zeroc-ice-e/cross.patch b/recipes/zeroc-ice-e/zeroc-ice-e/cross.patch
new file mode 100644
index 0000000..3e15d93
--- /dev/null
+++ b/recipes/zeroc-ice-e/zeroc-ice-e/cross.patch
@@ -0,0 +1,68 @@
+--- a/cppe/config/Make.rules	2008-12-18 19:17:40.000000000 +1100
++++ b/cppe/config/Make.rules	2010-11-14 17:47:23.331363971 +1100
+@@ -12,7 +12,7 @@
+ # if it does not exist.
+ #
+ 
+-prefix			= /opt/IceE-$(VERSION)
++prefix			?= /opt/IceE-$(VERSION)
+ 
+ #
+ # Define OPTIMIZE_SIZE as yes if you want to build with minimal size.
+@@ -22,7 +22,7 @@
+ #
+ 
+ #OPTIMIZE_SIZE		= yes
+-#OPTIMIZE_SPEED		= yes
++OPTIMIZE_SPEED		= yes
+ 
+ #
+ # Define STATICLIBS as yes if you want to build with static libraries.
+@@ -35,13 +35,13 @@
+ # Define GUMSTIX as yes if building for gumstix target.
+ #
+ 
+-#GUMSTIX		= yes
++GUMSTIX		= yes
+ 
+ #
+ # Define LP64 as yes or no if you want force a 32 or 64 bit. The default
+ # is platform-dependent
+ #
+-#LP64			:= yes
++LP64			:= no
+ 
+ # ----------------------------------------------------------------------
+ # Ice-E supports a number of optional features that are enabled via
+--- a/cppe/include/IceE/Time.h	2008-12-18 19:17:40.000000000 +1100
++++ b/cppe/include/IceE/Time.h	2010-11-14 18:21:46.304480446 +1100
+@@ -12,6 +12,9 @@
+ 
+ #include <IceE/Config.h>
+ #include <ostream>
++#ifndef _WIN32
++#   include <sys/time.h>
++#endif
+ 
+ namespace IceUtil
+ {
+--- a/config/Make.common.rules.icee	2008-12-18 19:17:40.000000000 +1100
++++ b/config/Make.common.rules.icee	2010-11-14 19:35:26.270825893 +1100
+@@ -155,7 +155,7 @@
+     slicedir = $(ice_dir)/slice
+ endif
+ 
+-install_slicedir	= $(prefix)/slice
++install_slicedir	?= $(prefix)/slice
+ 
+ #
+ # Set environment variables for the Slice translator.
+@@ -232,7 +232,7 @@
+ endif
+ 
+ ifeq ($(mkdir),)
+-    mkdir		= mkdir $(1) ; \
++    mkdir		= mkdir -p $(1) ; \
+ 			  chmod a+rx $(1)
+ endif
+ 
diff --git a/recipes/zeroc-ice-e/zeroc-ice-e_1.3.0.bb b/recipes/zeroc-ice-e/zeroc-ice-e_1.3.0.bb
new file mode 100644
index 0000000..dcf5080
--- /dev/null
+++ b/recipes/zeroc-ice-e/zeroc-ice-e_1.3.0.bb
@@ -0,0 +1,3 @@
+require zeroc-ice-e.inc
+
+PR = "${INC_PR}.0"
-- 
1.7.0.4



