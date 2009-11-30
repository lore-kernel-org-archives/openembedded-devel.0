Received: from gnv.quaddro.net
	([68.110.131.118] helo=dishwasher.gnv.quaddro.net ident=root)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stephen@quaddro.net>) id 1NEvvR-0002ER-7h
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Nov 2009 03:23:44 +0100
Received: from localhost.localdomain (cerebrum.gnv.quaddro.net [10.2.1.11])
	by dishwasher.gnv.quaddro.net (8.14.3/8.14.3) with ESMTP id
	nAU22P2f029917; Sun, 29 Nov 2009 21:02:25 -0500
From: Stephen Simpson <stephen@quaddro.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Nov 2009 21:02:22 -0500
Message-Id: <1259546542-24318-1-git-send-email-stephen@quaddro.net>
X-Mailer: git-send-email 1.6.5.2
X-SA-Exim-Connect-IP: 68.110.131.118
X-SA-Exim-Mail-From: stephen@quaddro.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] libdvb 0.5.5.1: Fix build on GCC 4.x
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
X-List-Received-Date: Mon, 30 Nov 2009 02:23:44 -0000

Patches:
* sample_progs/cam_menu.hh was missing #include <cstring>, does not error on gcc < 4.x
* dvb-mpegtools/Makefile did not pass LDFLAGS when necessary for linking, causing QA Issues
Recipe changes:
* Change recipe to remove CFLAGS from config.mk to allow the CFLAGS variable passed to be used instead
* Add patches to recipe
---
 recipes/libdvb/files/gcc4.patch    |   11 +++++++++++
 recipes/libdvb/files/ldflags.patch |   27 +++++++++++++++++++++++++++
 recipes/libdvb/libdvb_0.5.5.1.bb   |    6 ++++--
 3 files changed, 42 insertions(+), 2 deletions(-)
 create mode 100644 recipes/libdvb/files/gcc4.patch
 create mode 100644 recipes/libdvb/files/ldflags.patch

diff --git a/recipes/libdvb/files/gcc4.patch b/recipes/libdvb/files/gcc4.patch
new file mode 100644
index 0000000..280c2ea
--- /dev/null
+++ b/recipes/libdvb/files/gcc4.patch
@@ -0,0 +1,11 @@
+diff -urN libdvb-0.5.5.1/sample_progs/cam_menu.hh libdvb-0.5.5.1-superterrific/sample_progs/cam_menu.hh
+--- libdvb-0.5.5.1/sample_progs/cam_menu.hh	2005-03-22 08:23:25.000000000 -0500
++++ libdvb-0.5.5.1-superterrific/sample_progs/cam_menu.hh	2009-11-29 19:34:44.000000000 -0500
+@@ -4,6 +4,7 @@
+  */
+ #include <sys/types.h>
+ #include <sys/socket.h>
++#include <cstring>
+ 
+ #ifndef __CAM_MENU_HH
+ #define __CAM_MENU_HH
diff --git a/recipes/libdvb/files/ldflags.patch b/recipes/libdvb/files/ldflags.patch
new file mode 100644
index 0000000..70a7ea6
--- /dev/null
+++ b/recipes/libdvb/files/ldflags.patch
@@ -0,0 +1,27 @@
+diff -urN libdvb-0.5.5.1/dvb-mpegtools/Makefile libdvb-0.5.5.1-superterrific/dvb-mpegtools/Makefile
+--- libdvb-0.5.5.1/dvb-mpegtools/Makefile	2009-11-29 19:40:06.000000000 -0500
++++ libdvb-0.5.5.1-superterrific/dvb-mpegtools/Makefile	2009-11-29 19:40:21.000000000 -0500
+@@ -33,19 +33,19 @@
+ 	dvbaudio
+ 
+ dvb-mpegtools_main: main.o
+-	$(CXX) main.o $(LIBS) -o $@
++	$(CXX) main.o $(LDFLAGS) $(LIBS) -o $@
+ 
+ ctest: mainc.o 
+ 	$(CC) $(COBJ) -o $@
+ 
+ dvb-mplex: $(MPLEXOBS)
+-	$(CXX) $(MPLEXOBS) $(LIBS) -o $@
++	$(CXX) $(MPLEXOBS) $(LDFLAGS) $(LIBS) -o $@
+ 
+ dvbaudio: dvbaudio.o
+-	$(CXX) dvbaudio.o $(LIBS) -ldvb -o $@
++	$(CXX) dvbaudio.o $(LDFLAGS) $(LIBS) -ldvb -o $@
+ 
+ audiofilter: audiofilter.o
+-	$(CXX) audiofilter.o -o $@
++	$(CXX) audiofilter.o $(LDFLAGS) -o $@
+ 
+ %.o:    %.cc 
+ 	$(CXX) -c $(DCFLAGS) $(INCLUDES) $(DEFINES) $<
diff --git a/recipes/libdvb/libdvb_0.5.5.1.bb b/recipes/libdvb/libdvb_0.5.5.1.bb
index d2db2ce..e982c1f 100644
--- a/recipes/libdvb/libdvb_0.5.5.1.bb
+++ b/recipes/libdvb/libdvb_0.5.5.1.bb
@@ -7,7 +7,9 @@ LICENSE = "GPL"
 PR = "r3"
 
 SRC_URI = "http://www.metzlerbros.org/dvb/${P}.tar.gz \
-          file://topf2ps.patch;patch=1"
+          file://topf2ps.patch;patch=1 \
+          file://gcc4.patch;patch=1 \
+          file://ldflags.patch;patch=1"
 
 S = "${WORKDIR}/${PN}-${PV}"
 
@@ -16,7 +18,7 @@ PARALLEL_MAKE = ""
 inherit autotools pkgconfig
 
 do_configure() {
-        grep -v ^PREFIX ${S}/config.mk > ${S}/config.mk.new
+        grep -v ^PREFIX ${S}/config.mk | grep -v ^CFLAGS > ${S}/config.mk.new
         echo "PREFIX=${prefix}" >> ${S}/config.mk.new
         mv ${S}/config.mk.new ${S}/config.mk
 }
-- 
1.6.5.2



