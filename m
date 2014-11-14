Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4A68D65C7B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 09:32:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43394105"
Received: from localhost (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Nov 2014 17:19:26 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAE9MPEs027193
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 17:22:25 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 14 Nov 2014 17:22:38 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 14 Nov 2014 17:20:04 +0800
Message-ID: <1415956804-56497-4-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1415956804-56497-1-git-send-email-biannm@cn.fujitsu.com>
References: <1415956804-56497-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [PATCH 3/3] Porting eggdbus from openembedded.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Nov 2014 09:32:19 -0000
Content-Type: text/plain

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 meta-oe/recipes-core/eggdbus/eggdbus/gtk-doc.patch | 34 ++++++++++++++++++
 meta-oe/recipes-core/eggdbus/eggdbus/marshal.patch | 28 +++++++++++++++
 meta-oe/recipes-core/eggdbus/eggdbus_0.6.bb        | 41 ++++++++++++++++++++++
 3 files changed, 103 insertions(+)
 create mode 100644 meta-oe/recipes-core/eggdbus/eggdbus/gtk-doc.patch
 create mode 100644 meta-oe/recipes-core/eggdbus/eggdbus/marshal.patch
 create mode 100644 meta-oe/recipes-core/eggdbus/eggdbus_0.6.bb

diff --git a/meta-oe/recipes-core/eggdbus/eggdbus/gtk-doc.patch b/meta-oe/recipes-core/eggdbus/eggdbus/gtk-doc.patch
new file mode 100644
index 0000000..abd7ff4
--- /dev/null
+++ b/meta-oe/recipes-core/eggdbus/eggdbus/gtk-doc.patch
@@ -0,0 +1,34 @@
+Upstream-Status: Inappropriate [configuration] 
+
+Index: eggdbus-0.6/docs/eggdbus/Makefile.am
+===================================================================
+--- eggdbus-0.6.orig/docs/eggdbus/Makefile.am
++++ eggdbus-0.6/docs/eggdbus/Makefile.am
+@@ -87,11 +87,7 @@ HTML_IMAGES = 				\
+ # Extra options to supply to gtkdoc-fixref
+ FIXXREF_OPTIONS=
+ 
+-if ENABLE_GTK_DOC
+-include $(top_srcdir)/gtk-doc.make
+-else
+ CLEANFILES =
+-endif
+ 
+ CLEANFILES +=   *~				\
+ 		eggdbus-scan.*			\
+Index: eggdbus-0.6/docs/tests/Makefile.am
+===================================================================
+--- eggdbus-0.6.orig/docs/tests/Makefile.am
++++ eggdbus-0.6/docs/tests/Makefile.am
+@@ -65,11 +65,7 @@ HTML_IMAGES = 				\
+ # Extra options to supply to gtkdoc-fixref
+ FIXXREF_OPTIONS=
+ 
+-if ENABLE_GTK_DOC
+-include $(top_srcdir)/gtk-doc.make
+-else
+ CLEANFILES =
+-endif
+ 
+ CLEANFILES +=   *~				\
+ 		tests-scan.*			\
diff --git a/meta-oe/recipes-core/eggdbus/eggdbus/marshal.patch b/meta-oe/recipes-core/eggdbus/eggdbus/marshal.patch
new file mode 100644
index 0000000..a605a34
--- /dev/null
+++ b/meta-oe/recipes-core/eggdbus/eggdbus/marshal.patch
@@ -0,0 +1,28 @@
+Upstream-Status: Inappropriate [configuration]
+
+Index: eggdbus-0.6/src/eggdbus/Makefile.am
+===================================================================
+--- eggdbus-0.6.orig/src/eggdbus/Makefile.am
++++ eggdbus-0.6/src/eggdbus/Makefile.am
+@@ -130,7 +130,7 @@ BUILT_SOURCES =								\
+ 	$(NULL)
+ 
+ eggdbus-built-sources.stamp : eggdbus-binding-tool Makefile.am org.freedesktop.DBus.xml org.freedesktop.DBus.Peer.xml org.freedesktop.DBus.Properties.xml org.freedesktop.DBus.Introspectable.xml eggdbus-glib-genmarshal
+-	EGG_DBUS_GENMARSHAL=$(top_builddir)/src/eggdbus/eggdbus-glib-genmarshal $(top_builddir)/src/eggdbus/eggdbus-binding-tool							\
++	EGG_DBUS_GENMARSHAL=eggdbus-glib-genmarshal eggdbus-binding-tool							\
+ 		--namespace EggDBus									\
+ 		--dbus-namespace org.freedesktop.DBus							\
+ 		--interfaces-only									\
+Index: eggdbus-0.6/src/tests/Makefile.am
+===================================================================
+--- eggdbus-0.6.orig/src/tests/Makefile.am
++++ eggdbus-0.6/src/tests/Makefile.am
+@@ -25,7 +25,7 @@ BUILT_SOURCES = 							\
+ 	$(NULL)
+ 
+ test-built-sources.stamp : Makefile.am $(top_builddir)/src/eggdbus/eggdbus-binding-tool com.example.Frob.xml com.example.Tweak.xml com.example.Twiddle.xml
+-	EGG_DBUS_GENMARSHAL=$(top_builddir)/src/eggdbus/eggdbus-glib-genmarshal $(top_builddir)/src/eggdbus/eggdbus-binding-tool									\
++	EGG_DBUS_GENMARSHAL=eggdbus-glib-genmarshal eggdbus-binding-tool									\
+ 	  --namespace       "Test"										\
+ 	  --dbus-namespace  "com.example"									\
+ 	  --include-header  testtypes.h										\
diff --git a/meta-oe/recipes-core/eggdbus/eggdbus_0.6.bb b/meta-oe/recipes-core/eggdbus/eggdbus_0.6.bb
new file mode 100644
index 0000000..cfc9f8a
--- /dev/null
+++ b/meta-oe/recipes-core/eggdbus/eggdbus_0.6.bb
@@ -0,0 +1,41 @@
+SUMMARY = "An alternative to dbug-glib."
+DESCRIPTION = "An alternative to dbus-glib. It is designed specifically to \
+make it comfortable to work with very large and potentially \
+complex D-Bus services like e.g. DeviceKit-disks"
+
+HOMEPAGE = "http://cgit.freedesktop.org/~david/eggdbus"
+LICENSE = "LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=155db86cdbafa7532b41f390409283eb \
+                    file://src/eggdbus/eggdbus.h;md5=6b312aef57ed8d738b3f131ad037d6c2"
+PR = "r0"
+
+DEPENDS = "dbus glib-2.0 dbus-glib eggdbus-native"
+DEPENDS_virtclass-native = "dbus-native glib-2.0-native dbus-glib-native"
+
+BASE_SRC_URI = "http://cgit.freedesktop.org/~david/${BPN}/snapshot/${BPN}-${PV}.tar.bz2 \
+		file://gtk-doc.patch \
+		"
+
+SRC_URI = "${BASE_SRC_URI} \
+	   file://marshal.patch;apply=yes \
+	  "
+
+SRC_URI_virtclass-native = "${BASE_SRC_URI}"
+
+SRC_URI[md5sum] = "0a111faa54dfba2cf432c2c8e8a76e06"
+SRC_URI[sha256sum] = "3ad26e271c1a879bafcd181e065fe0ed53b542299a773c3188c9edb25b895ed1"
+
+inherit autotools gtk-doc
+
+EXTRA_OECONF = " --disable-man-pages "
+
+BBCLASSEXTEND = "native"
+
+PARALLEL_MAKE = ""
+
+do_configure_prepend() {
+	# Create ChangeLog to walk around automake error.
+        # " Makefile.am: error: required file './ChangeLog' not found "
+	touch ${S}/ChangeLog
+}
+
-- 
1.9.1


