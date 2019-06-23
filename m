Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 2F34F605BA
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Jun 2019 19:34:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45X2gS5W8hz4c
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Jun 2019 21:34:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1561318484;
	bh=xfSIb48FDvouCeV5JhRZvYMqilqUQGvD5dlp/mN2DIg=;
	h=From:To:Subject:Date:From;
	b=Q/0ZgIl22KkjK9Fp4RPJ+D99EihDkPOEljqO+xf6wGQ68WLSvEUft7OvcvJ5A5dpr
	rRBLdHHLR8fxfqIOGM/fQkZ3TxZ1KxQsz9R9zl7TDjyksrNw4cBFEr+t+S+6EAofAL
	FFVT3z1XJUjykm9YgdfnIpPtaDzHFzb4tlREcfOmBL+BWJQlfDx9KbsyitPTRLN22y
	bG8SgPUiMtRlAMQRCt5RoBmoUwJT1OghAUH2gWg5i5v2nc6UhH9o0gFIIJkfp79NkP
	sa7Ds3qtZyNc/Ms0L4tvayyVGlcU+1yWRH38DkOPqrW40Kqhn8+GPOxlbZ2rdy8ZrX
	1Rcek5YS6ZbDMcKCdWvysqgL445A9L0Bt6uDPIE6yaSCp1Fcn8yJGDRwTuF9HdsB08
	89Ui5Z5PWjRbdPnik9kK76wSf44bGdtAdyyoANvRiOq8m3HdsI9EsihcMvtc8NGUIa
	PrhcSfbSU6MaKeAd/5wWP8qn+8r8JDVjnZ38EFdok1vqdir82YXbhUeKOFA6PvlPqQ
	YbNirZWxvLivGmgzmaCIKHSqL3zkzT1e0vIzEgmX3V4eLP00+rzbL18IF/E28kRwTs
	fCNojMxEFTVTQPXc9tcyNWn894GXnwRGmqKuG7tV/YdT4xp9mqjJnmSIk/XR9M5f61
	HqSNaFSxY5XGsZQRD8qeSb+Y=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Jun 2019 22:34:43 +0300
Message-Id: <20190623193443.16840-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] eggdbus: Remove this obsolete package
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
X-List-Received-Date: Sun, 23 Jun 2019 19:34:44 -0000

Users migrated to GDBus years ago.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../eggdbus/eggdbus/gtk-doc.patch             | 34 -------------------
 .../eggdbus/eggdbus/marshal.patch             | 28 ---------------
 meta-oe/recipes-core/eggdbus/eggdbus_0.6.bb   | 33 ------------------
 .../packagegroups/packagegroup-meta-oe.bb     |  2 +-
 4 files changed, 1 insertion(+), 96 deletions(-)
 delete mode 100644 meta-oe/recipes-core/eggdbus/eggdbus/gtk-doc.patch
 delete mode 100644 meta-oe/recipes-core/eggdbus/eggdbus/marshal.patch
 delete mode 100644 meta-oe/recipes-core/eggdbus/eggdbus_0.6.bb

diff --git a/meta-oe/recipes-core/eggdbus/eggdbus/gtk-doc.patch b/meta-oe/recipes-core/eggdbus/eggdbus/gtk-doc.patch
deleted file mode 100644
index abd7ff416..000000000
--- a/meta-oe/recipes-core/eggdbus/eggdbus/gtk-doc.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Upstream-Status: Inappropriate [configuration] 
-
-Index: eggdbus-0.6/docs/eggdbus/Makefile.am
-===================================================================
---- eggdbus-0.6.orig/docs/eggdbus/Makefile.am
-+++ eggdbus-0.6/docs/eggdbus/Makefile.am
-@@ -87,11 +87,7 @@ HTML_IMAGES = 				\
- # Extra options to supply to gtkdoc-fixref
- FIXXREF_OPTIONS=
- 
--if ENABLE_GTK_DOC
--include $(top_srcdir)/gtk-doc.make
--else
- CLEANFILES =
--endif
- 
- CLEANFILES +=   *~				\
- 		eggdbus-scan.*			\
-Index: eggdbus-0.6/docs/tests/Makefile.am
-===================================================================
---- eggdbus-0.6.orig/docs/tests/Makefile.am
-+++ eggdbus-0.6/docs/tests/Makefile.am
-@@ -65,11 +65,7 @@ HTML_IMAGES = 				\
- # Extra options to supply to gtkdoc-fixref
- FIXXREF_OPTIONS=
- 
--if ENABLE_GTK_DOC
--include $(top_srcdir)/gtk-doc.make
--else
- CLEANFILES =
--endif
- 
- CLEANFILES +=   *~				\
- 		tests-scan.*			\
diff --git a/meta-oe/recipes-core/eggdbus/eggdbus/marshal.patch b/meta-oe/recipes-core/eggdbus/eggdbus/marshal.patch
deleted file mode 100644
index a605a34c8..000000000
--- a/meta-oe/recipes-core/eggdbus/eggdbus/marshal.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: eggdbus-0.6/src/eggdbus/Makefile.am
-===================================================================
---- eggdbus-0.6.orig/src/eggdbus/Makefile.am
-+++ eggdbus-0.6/src/eggdbus/Makefile.am
-@@ -130,7 +130,7 @@ BUILT_SOURCES =								\
- 	$(NULL)
- 
- eggdbus-built-sources.stamp : eggdbus-binding-tool Makefile.am org.freedesktop.DBus.xml org.freedesktop.DBus.Peer.xml org.freedesktop.DBus.Properties.xml org.freedesktop.DBus.Introspectable.xml eggdbus-glib-genmarshal
--	EGG_DBUS_GENMARSHAL=$(top_builddir)/src/eggdbus/eggdbus-glib-genmarshal $(top_builddir)/src/eggdbus/eggdbus-binding-tool							\
-+	EGG_DBUS_GENMARSHAL=eggdbus-glib-genmarshal eggdbus-binding-tool							\
- 		--namespace EggDBus									\
- 		--dbus-namespace org.freedesktop.DBus							\
- 		--interfaces-only									\
-Index: eggdbus-0.6/src/tests/Makefile.am
-===================================================================
---- eggdbus-0.6.orig/src/tests/Makefile.am
-+++ eggdbus-0.6/src/tests/Makefile.am
-@@ -25,7 +25,7 @@ BUILT_SOURCES = 							\
- 	$(NULL)
- 
- test-built-sources.stamp : Makefile.am $(top_builddir)/src/eggdbus/eggdbus-binding-tool com.example.Frob.xml com.example.Tweak.xml com.example.Twiddle.xml
--	EGG_DBUS_GENMARSHAL=$(top_builddir)/src/eggdbus/eggdbus-glib-genmarshal $(top_builddir)/src/eggdbus/eggdbus-binding-tool									\
-+	EGG_DBUS_GENMARSHAL=eggdbus-glib-genmarshal eggdbus-binding-tool									\
- 	  --namespace       "Test"										\
- 	  --dbus-namespace  "com.example"									\
- 	  --include-header  testtypes.h										\
diff --git a/meta-oe/recipes-core/eggdbus/eggdbus_0.6.bb b/meta-oe/recipes-core/eggdbus/eggdbus_0.6.bb
deleted file mode 100644
index cc28ec77c..000000000
--- a/meta-oe/recipes-core/eggdbus/eggdbus_0.6.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-SUMMARY = "An alternative to dbug-glib."
-DESCRIPTION = "An alternative to dbus-glib. It is designed specifically to \
-make it comfortable to work with very large and potentially \
-complex D-Bus services like e.g. DeviceKit-disks"
-
-HOMEPAGE = "http://cgit.freedesktop.org/~david/eggdbus"
-LICENSE = "LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=155db86cdbafa7532b41f390409283eb \
-                    file://src/eggdbus/eggdbus.h;md5=6b312aef57ed8d738b3f131ad037d6c2"
-
-DEPENDS = "dbus glib-2.0 dbus-glib eggdbus-native"
-DEPENDS_class-native = "dbus-native glib-2.0-native dbus-glib-native"
-
-SRC_URI = "http://cgit.freedesktop.org/~david/${BPN}/snapshot/${BPN}-${PV}.tar.bz2 \
-    file://gtk-doc.patch \
-"
-SRC_URI_append_class-target = "file://marshal.patch"
-SRC_URI[md5sum] = "0a111faa54dfba2cf432c2c8e8a76e06"
-SRC_URI[sha256sum] = "3ad26e271c1a879bafcd181e065fe0ed53b542299a773c3188c9edb25b895ed1"
-
-inherit autotools gtk-doc
-
-EXTRA_OECONF = " --disable-man-pages "
-
-BBCLASSEXTEND = "native"
-
-PARALLEL_MAKE = ""
-
-do_configure_prepend() {
-    # Create ChangeLog to walk around automake error.
-    # " Makefile.am: error: required file './ChangeLog' not found "
-    touch ${S}/ChangeLog
-}
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index e34cce4eb..e7246b2c5 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -74,7 +74,7 @@ RDEPENDS_packagegroup-meta-oe-connectivity ="\
 
 # dracut needs dracut
 RDEPENDS_packagegroup-meta-oe-core ="\
-    dbus-daemon-proxy libdbus-c++ eggdbus \
+    dbus-daemon-proxy libdbus-c++ \
     ell glibmm libsigc++-2.0 libxml++ distro-feed-configs \
     mm-common opencl-headers opencl-icd-loader \
     proxy-libintl usleep \
-- 
2.17.1


