Received: from stoexhub01.domain01.net ([83.145.59.142]
	helo=stoexhub02.domain01.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1Q8ySA-0000vb-59
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Apr 2011 19:29:38 +0200
Received: from localhost (85.231.30.150) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server id 8.3.137.0; Sun, 10 Apr 2011
	19:27:25 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 10 Apr 2011 19:27:21 +0200
Message-ID: <1302456441-3417-1-git-send-email-anders@chargestorm.se>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Subject: [PATCH v2] lowpan-tools_0.2.2;: fix build with static libnl1
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
X-List-Received-Date: Sun, 10 Apr 2011 17:29:38 -0000
Content-Type: text/plain

* add NL_CFLAGS to a few Makefiles.am
* git version not fixed
* build and runtime tested, although only in qemuarm

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 .../0001-Add-NL_CFLAGS-to-libcommon.patch          |   65 ++++++++++++++++++++
 recipes/lowpan-tools/lowpan-tools.inc              |    4 +-
 recipes/lowpan-tools/lowpan-tools_0.2.2.bb         |    6 ++-
 3 files changed, 72 insertions(+), 3 deletions(-)
 create mode 100644 recipes/lowpan-tools/lowpan-tools-0.2.2/0001-Add-NL_CFLAGS-to-libcommon.patch

diff --git a/recipes/lowpan-tools/lowpan-tools-0.2.2/0001-Add-NL_CFLAGS-to-libcommon.patch b/recipes/lowpan-tools/lowpan-tools-0.2.2/0001-Add-NL_CFLAGS-to-libcommon.patch
new file mode 100644
index 0000000..45cc4d0
--- /dev/null
+++ b/recipes/lowpan-tools/lowpan-tools-0.2.2/0001-Add-NL_CFLAGS-to-libcommon.patch
@@ -0,0 +1,65 @@
+From 7fa435ea775b1410d9ccb95d2e315847f5a0f09c Mon Sep 17 00:00:00 2001
+From: Anders Darander <anders@chargestorm.se>
+Date: Tue, 5 Apr 2011 20:24:54 +0200
+Subject: [PATCH] Add-NL_CFLAGS-to-libcommon
+
+Signed-off-by: Anders Darander <anders@chargestorm.se>
+---
+ iplink/Makefile.am |    1 +
+ lib/Makefile.am    |    1 +
+ src/Makefile.am    |    4 ++--
+ tests/Makefile.am  |    2 +-
+ 4 files changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/iplink/Makefile.am b/iplink/Makefile.am
+index bbed7ba..6e87ae0 100644
+--- a/iplink/Makefile.am
++++ b/iplink/Makefile.am
+@@ -4,3 +4,4 @@ noinst_HEADERS = iplink.h
+ iproute_LTLIBRARIES = link_wpan.la
+ link_wpan_la_LDFLAGS = -module -avoid-version -shared
+ 
++link_wpan_la_CFLAGS = $(NL_CFLAGS) -D_GNU_SOURCE
+\ No newline at end of file
+diff --git a/lib/Makefile.am b/lib/Makefile.am
+index 5e15018..6936ebb 100644
+--- a/lib/Makefile.am
++++ b/lib/Makefile.am
+@@ -3,3 +3,4 @@ include $(top_srcdir)/Makefile.common
+ noinst_LTLIBRARIES = libcommon.la
+ libcommon_la_SOURCES = printbuf.c genl.c parse.c shash.c logging.c nl_policy.c
+ 
++libcommon_la_CFLAGS = $(NL_CFLAGS) -D_GNU_SOURCE
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 555e214..46c4017 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -20,11 +20,11 @@ iz_SOURCES = iz.c iz-common.c iz-mac.c iz-phy.c
+ noinst_HEADERS = iz.h
+ 
+ izcoordinator_SOURCES = coordinator.c
+-izcoordinator_CFLAGS = $(AM_CFLAGS) $(NL_CFLAGS) -DLEASE_FILE=\"$(leasefile)\"
++izcoordinator_CFLAGS = $(AM_CFLAGS) $(NL_CFLAGS) -DLEASE_FILE=\"$(leasefile)\" -D_GNU_SOURCE
+ izcoordinator_CFLAGS += -DPID_FILE=\"$(pidfile)\"
+ izcoordinator_LDADD = ../addrdb/libaddrdb.la $(LDADD) $(NL_LIBS) $(LEXLIB)
+ 
+-iz_CFLAGS = $(AM_CFLAGS) $(NL_CFLAGS)
++iz_CFLAGS = $(AM_CFLAGS) $(NL_CFLAGS) -D_GNU_SOURCE
+ iz_LDADD = $(LDADD) $(NL_LIBS)
+ 
+ izattach.8: $(izattach_SOURCES) $(top_srcdir)/configure.ac
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index d491be5..00621ca 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -4,6 +4,6 @@ zbtest_PROGRAMS = listen-packet test test2 test3 test4 test5 test6 test7 gnl izl
+ 
+ izlisten_SOURCES = listen.c
+ 
+-gnl_CFLAGS = $(AM_CFLAGS) $(NL_CFLAGS)
++gnl_CFLAGS = $(AM_CFLAGS) $(NL_CFLAGS) -D_GNU_SOURCE
+ gnl_LDADD = $(LDADD) $(NL_LIBS)
+ 
+-- 
+1.7.4.1
+
diff --git a/recipes/lowpan-tools/lowpan-tools.inc b/recipes/lowpan-tools/lowpan-tools.inc
index f429f96..94faf9c 100644
--- a/recipes/lowpan-tools/lowpan-tools.inc
+++ b/recipes/lowpan-tools/lowpan-tools.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "LoWPAN utilities (IEEE802.15.4)"
 LICENSE = "GPLv2"
-DEPENDS = "libnl bison-native flex-native python-native"
-INC_PR = "r11"
+DEPENDS = "libnl1 bison-native flex-native python-native"
+INC_PR = "r12"
 
 SRC_URI = "http://prdownloads.sourceforge.net/linux-zigbee/linux-zigbee-sources/${PV}/lowpan-tools-${PV}.tar.gz"
 
diff --git a/recipes/lowpan-tools/lowpan-tools_0.2.2.bb b/recipes/lowpan-tools/lowpan-tools_0.2.2.bb
index 5686487..103109e 100644
--- a/recipes/lowpan-tools/lowpan-tools_0.2.2.bb
+++ b/recipes/lowpan-tools/lowpan-tools_0.2.2.bb
@@ -1,6 +1,10 @@
 require lowpan-tools.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
+
+SRC_URI_append = " \
+      file://0001-Add-NL_CFLAGS-to-libcommon.patch \
+      "
 
 EXTRA_OECONF = "--enable-ip-plugin"
 
-- 
1.7.4.1



