Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 37A337455A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Apr 2018 14:26:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w3EEQ9UL016727
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 14 Apr 2018 07:26:09 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Sat, 14 Apr 2018 07:25:54 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <akuster808@gmail.com>
Date: Sat, 14 Apr 2018 10:25:35 -0400
Message-ID: <1523715935-58545-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH][meta-gnome V3] metacity: add 3.38.0
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
X-List-Received-Date: Sat, 14 Apr 2018 14:26:09 -0000
Content-Type: text/plain

The metacity is still maintained on github which the latest version is
based on gtk+3

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../metacity/0001-drop-zenity-detection.patch      | 33 +++++++++++++++++++++
 .../recipes-gnome/metacity/metacity_3.38.0.bb      | 34 ++++++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/metacity/metacity/0001-drop-zenity-detection.patch
 create mode 100644 meta-gnome/recipes-gnome/metacity/metacity_3.38.0.bb

diff --git a/meta-gnome/recipes-gnome/metacity/metacity/0001-drop-zenity-detection.patch b/meta-gnome/recipes-gnome/metacity/metacity/0001-drop-zenity-detection.patch
new file mode 100644
index 0000000..3493e51
--- /dev/null
+++ b/meta-gnome/recipes-gnome/metacity/metacity/0001-drop-zenity-detection.patch
@@ -0,0 +1,33 @@
+From ec0e52b49c9b6869413c9544c2ed44710ab91141 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Sat, 14 Apr 2018 16:15:59 +0800
+Subject: [PATCH] drop zenity detection
+
+OE does not support zenity
+
+Upstream-Status: inappropriate [OE specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.ac | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 5f9e7e9..80b32c7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -359,11 +359,6 @@ fi
+ 
+ AM_CONDITIONAL(HAVE_SM, test "$found_sm" = "yes") 
+ 
+-AC_PATH_PROG(ZENITY, zenity, no)
+-if test x"$ZENITY" = xno; then
+-  AC_MSG_ERROR([zenity not found in your path - needed for dialogs])
+-fi
+-
+ dnl **************************************************************************
+ dnl Check for Vulkan support
+ dnl **************************************************************************
+-- 
+1.8.3.1
+
diff --git a/meta-gnome/recipes-gnome/metacity/metacity_3.38.0.bb b/meta-gnome/recipes-gnome/metacity/metacity_3.38.0.bb
new file mode 100644
index 0000000..48fc914
--- /dev/null
+++ b/meta-gnome/recipes-gnome/metacity/metacity_3.38.0.bb
@@ -0,0 +1,34 @@
+SECTION = "x11/wm"
+SUMMARY = "Metacity is the boring window manager for the adult in you"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b4cce53560b8e619ffa7c830fb8761aa \
+                    file://src/include/main.h;endline=24;md5=72148ede07a6dadd01de6a882d20a9ad"
+
+DEPENDS = "gsettings-desktop-schemas startup-notification \
+           gnome-doc-utils gdk-pixbuf-native \
+           gtk+3 glib-2.0 libcanberra libgtop intltool-native"
+
+inherit autotools gettext gnomebase distro_features_check
+# depends on startup-notification which depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
+SRC_URI = "git://github.com/GNOME/metacity.git;branch=master \
+           file://0001-drop-zenity-detection.patch \
+"
+
+S = "${WORKDIR}/git"
+SRCREV = "c0d4b2fc0fcd6f2d3c37da935923f9e9ed5eb99f"
+
+EXTRA_OECONF += "--disable-xinerama"
+
+do_configure_prepend() {
+    cd ${S}
+    aclocal --install || exit 1
+    autoreconf --verbose --force --install -Wno-portability || exit 1
+    cd -
+
+}
+
+FILES_${PN} += "${datadir}/themes ${datadir}/gnome-control-center ${datadir}/gnome"
+RDEPENDS_${PN} += "gsettings-desktop-schemas"
+
-- 
2.8.1


