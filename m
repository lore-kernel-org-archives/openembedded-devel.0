Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0F50C70100
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2018 09:45:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w3C9jeTH011420
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Apr 2018 02:45:40 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 12 Apr 2018 02:45:39 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <schnitzeltony@gmail.com>, <akuster808@gmail.com>
Date: Thu, 12 Apr 2018 05:45:21 -0400
Message-ID: <1523526321-18343-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH][meta-gnome] add metacity back
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
X-List-Received-Date: Thu, 12 Apr 2018 09:45:41 -0000
Content-Type: text/plain

It is required by meta-anaconda which is a graphic target
installer program anaconda that based on gnome.

http://git.yoctoproject.org/cgit/cgit.cgi/meta-anaconda

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../metacity/0001-ui-Define-_GNU_SOURCE.patch      | 27 +++++++++++++++++
 .../metacity/remove-yelp-help-rules-var.patch      | 28 +++++++++++++++++
 .../recipes-gnome/metacity/metacity_2.34.13.bb     | 35 ++++++++++++++++++++++
 3 files changed, 90 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/metacity/metacity/0001-ui-Define-_GNU_SOURCE.patch
 create mode 100644 meta-gnome/recipes-gnome/metacity/metacity/remove-yelp-help-rules-var.patch
 create mode 100644 meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb

diff --git a/meta-gnome/recipes-gnome/metacity/metacity/0001-ui-Define-_GNU_SOURCE.patch b/meta-gnome/recipes-gnome/metacity/metacity/0001-ui-Define-_GNU_SOURCE.patch
new file mode 100644
index 0000000..539d756
--- /dev/null
+++ b/meta-gnome/recipes-gnome/metacity/metacity/0001-ui-Define-_GNU_SOURCE.patch
@@ -0,0 +1,27 @@
+From e7fd072f0df968f342878b77098e97ff07ed28d7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 14 Jul 2017 10:26:31 -0700
+Subject: [PATCH] ui: Define _GNU_SOURCE
+
+it becomes portable across musl and glibc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/ui/theme.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/ui/theme.c b/src/ui/theme.c
+index 84b57a0..c7eafc8 100644
+--- a/src/ui/theme.c
++++ b/src/ui/theme.c
+@@ -60,6 +60,7 @@
+ #include <gtk/gtk.h>
+ #include <string.h>
+ #include <stdlib.h>
++#define _GNU_SOURCE
+ #define __USE_XOPEN
+ #include <math.h>
+ 
+-- 
+2.13.3
+
diff --git a/meta-gnome/recipes-gnome/metacity/metacity/remove-yelp-help-rules-var.patch b/meta-gnome/recipes-gnome/metacity/metacity/remove-yelp-help-rules-var.patch
new file mode 100644
index 0000000..1970e9a
--- /dev/null
+++ b/meta-gnome/recipes-gnome/metacity/metacity/remove-yelp-help-rules-var.patch
@@ -0,0 +1,28 @@
+Remove unused variable (YELP_HELP_RULES)
+
+Upstream-Status: Pending
+Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
+
+Index: metacity-2.34.13/doc/creating_themes/Makefile.am
+===================================================================
+--- metacity-2.34.13.orig/doc/creating_themes/Makefile.am
++++ metacity-2.34.13/doc/creating_themes/Makefile.am
+@@ -1,6 +1,5 @@
+ ### This part of Makefile.am can be customized by you.
+ 
+-@YELP_HELP_RULES@
+ 
+ # The name of the directory in /usr/share/gnome/help/, 
+ # and the name of the main .xml file:
+Index: metacity-2.34.13/doc/creating_themes/Makefile.in
+===================================================================
+--- metacity-2.34.13.orig/doc/creating_themes/Makefile.in
++++ metacity-2.34.13/doc/creating_themes/Makefile.in
+@@ -455,7 +455,6 @@ uninstall-am:
+ 	mostlyclean-libtool pdf pdf-am ps ps-am uninstall uninstall-am
+ 
+ 
+-@YELP_HELP_RULES@
+ 
+ # Tell versions [3.59,3.63) of GNU make to not export all variables.
+ # Otherwise a system limit (for SysV at least) may be exceeded.
diff --git a/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb b/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
new file mode 100644
index 0000000..370de70
--- /dev/null
+++ b/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
@@ -0,0 +1,35 @@
+SECTION = "x11/wm"
+SUMMARY = "Metacity is the boring window manager for the adult in you"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+                    file://src/include/main.h;endline=24;md5=c2242df552c880280315989bab626b90"
+
+DEPENDS = "gsettings-desktop-schemas startup-notification gtk+ gconf gdk-pixbuf-native libcanberra gnome-doc-utils libgtop intltool-native"
+PR = "r1"
+
+inherit gnomebase update-alternatives distro_features_check
+# depends on startup-notification which depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
+GNOME_COMPRESS_TYPE = "xz"
+
+SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
+           file://remove-yelp-help-rules-var.patch \
+           file://0001-ui-Define-_GNU_SOURCE.patch \
+           "
+SRC_URI[archive.md5sum] = "6d89b71672d4fa49fc87f83d610d0ef6"
+SRC_URI[archive.sha256sum] = "8cf4dbf0da0a6f36357ce7db7f829ec685908a7792453c662fb8184572b91075"
+
+ALTERNATIVE_${PN} = "x-window-manager"
+ALTERNATIVE_TARGET[x-window-manager] = "${bindir}/metacity"
+ALTERNATIVE_PRIORITY = "10"
+
+EXTRA_OECONF += "--disable-xinerama"
+
+do_configure_prepend() {
+    sed -i -e 's:$ZENITY:$NOZENITY:g' -e 's:-Werror::g' ${S}/configure.in
+}
+
+FILES_${PN} += "${datadir}/themes ${datadir}/gnome-control-center ${datadir}/gnome"
+RDEPENDS_${PN} += "gsettings-desktop-schemas"
+
-- 
2.8.1


