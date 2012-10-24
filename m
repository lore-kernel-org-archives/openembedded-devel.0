Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei.adrianx.dinu@intel.com>) id 1TQyvU-0000uL-J1
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Oct 2012 13:15:08 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 24 Oct 2012 04:00:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,639,1344236400"; d="scan'208";a="231574984"
Received: from adinu-vostro-460 (HELO localhost.localdomain) ([10.237.105.39])
	by orsmga002.jf.intel.com with ESMTP; 24 Oct 2012 04:00:34 -0700
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Oct 2012 14:01:38 +0300
Message-Id: <1351076498-28950-1-git-send-email-andrei.adrianx.dinu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe] gypsy: added to meta-oe/recipes-navigation
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
X-List-Received-Date: Wed, 24 Oct 2012 11:15:09 -0000

Added gypsy to meta-oe/recipes-navigation

Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
---
 .../recipes-navigation/gypsy/files/fixups.patch    |   21 +++++++++++++++++
 meta-oe/recipes-navigation/gypsy/gypsy.inc         |   15 ++++++++++++
 meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb      |   24 ++++++++++++++++++++
 meta-oe/recipes-navigation/gypsy/gypsy_git.bb      |   18 +++++++++++++++
 4 files changed, 78 insertions(+)
 create mode 100644 meta-oe/recipes-navigation/gypsy/files/fixups.patch
 create mode 100644 meta-oe/recipes-navigation/gypsy/gypsy.inc
 create mode 100644 meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb
 create mode 100644 meta-oe/recipes-navigation/gypsy/gypsy_git.bb

diff --git a/meta-oe/recipes-navigation/gypsy/files/fixups.patch b/meta-oe/recipes-navigation/gypsy/files/fixups.patch
new file mode 100644
index 0000000..de4d92e
--- /dev/null
+++ b/meta-oe/recipes-navigation/gypsy/files/fixups.patch
@@ -0,0 +1,21 @@
+Upstream-Status: Inappropriate [configuration]
+
+---
+ docs/reference/Makefile.am |    2 ++
+ 1 file changed, 2 insertions(+)
+
+--- gypsy.orig/docs/reference/Makefile.am
++++ gypsy/docs/reference/Makefile.am
+@@ -81,10 +81,12 @@ expand_content_files=
+ # e.g. GTKDOC_LIBS=$(top_builddir)/gtk/$(gtktargetlib)
+ 
+ INCLUDES=-I$(top_srcdir) $(GYPSY_CFLAGS)
+ GTKDOC_LIBS=$(top_builddir)/gypsy/libgypsy.la $(GYPSY_LIBS)
+ 
++EXTRA_DIST =
++CLEANFILES =
+ # This includes the standard gtk-doc make rules, copied by gtkdocize.
+ include $(top_srcdir)/gtk-doc.make
+ 
+ # Other files to distribute
+ # e.g. EXTRA_DIST += version.xml.in
diff --git a/meta-oe/recipes-navigation/gypsy/gypsy.inc b/meta-oe/recipes-navigation/gypsy/gypsy.inc
new file mode 100644
index 0000000..0c1735e
--- /dev/null
+++ b/meta-oe/recipes-navigation/gypsy/gypsy.inc
@@ -0,0 +1,15 @@
+SUMMARY = "GPS Multiplexing Daemon"
+DESCRIPTION = "Gypsy is a GPS multiplexing daemon which allows \
+multiple clients to access GPS data from multiple GPS sources \
+concurrently.  Gypsy also hides the details of parsing NMEA from the \
+client applications, passing the data as simple values for the clients \
+to use."
+LICENSE = "GPLv2.0 & LGPLv2.1"
+SECTION = "x11"
+DEPENDS = "glib-2.0 dbus bluez4 dbus-glib"
+
+inherit autotools pkgconfig gtk-doc
+
+EXTRA_OECONF += "--with-distro=debian"
+
+FILES_${PN} += "/usr/share/dbus-1/services/"
diff --git a/meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb b/meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb
new file mode 100644
index 0000000..51207c9
--- /dev/null
+++ b/meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb
@@ -0,0 +1,24 @@
+SUMMARY = "GPS Multiplexing Daemon"
+DESCRIPTION = "Gypsy is a GPS multiplexing daemon which allows \
+multiple clients to access GPS data from multiple GPS sources \
+concurrently.  Gypsy also hides the details of parsing NMEA from the \
+client applications, passing the data as simple values for the clients \
+to use."
+LICENSE = "GPLv2+ & LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
+                    file://COPYING.lib;md5=7fbc338309ac38fefcd64b04bb903e34 \
+                    file://src/main.c;beginline=1;endline=25;md5=3fe64e27e61b289b77383a54a982cbdd \
+                    file://gypsy/gypsy-time.h;beginline=1;endline=24;md5=06432ea19a7b6607428d04d9dadc37fd"
+
+SECTION = "x11"
+DEPENDS = "glib-2.0 dbus bluez4 dbus-glib libxslt"
+
+SRC_URI = "http://gypsy.freedesktop.org/releases/gypsy-${PV}.tar.gz"
+PR = "r1"
+
+inherit autotools pkgconfig
+
+FILES_${PN} += "/usr/share/dbus-1/system-services/"
+
+SRC_URI[md5sum] = "e2d186df9c2cc3b70a027043e22acf1a"
+SRC_URI[sha256sum] = "14e1cbe17351f408538e033ca370b4bf51ccf9c88744e236ddfb271904f154d6"
diff --git a/meta-oe/recipes-navigation/gypsy/gypsy_git.bb b/meta-oe/recipes-navigation/gypsy/gypsy_git.bb
new file mode 100644
index 0000000..e5c564f
--- /dev/null
+++ b/meta-oe/recipes-navigation/gypsy/gypsy_git.bb
@@ -0,0 +1,18 @@
+require gypsy.inc
+
+DEFAULT_PREFERENCE = "-1"
+
+SRCREV = "be8c9c382d2d1d37b51d29b0843045121ec90213"
+PV = "0.9+git${SRCPV}"
+PR = "r1"
+
+S = "${WORKDIR}/git"
+
+LICENSE = "GPLv2+ & LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
+                    file://COPYING.lib;md5=7fbc338309ac38fefcd64b04bb903e34 \
+                    file://src/main.c;beginline=1;endline=25;md5=3fe64e27e61b289b77383a54a982cbdd \
+                    file://gypsy/gypsy-time.h;beginline=1;endline=24;md5=06432ea19a7b6607428d04d9dadc37fd"
+
+SRC_URI = "git://anongit.freedesktop.org/gypsy;protocol=git \
+           file://fixups.patch"
-- 
1.7.9.5



