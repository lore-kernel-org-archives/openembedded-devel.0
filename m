Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AFA1E65CF3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Apr 2018 02:58:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w3D2w9jW004900
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Apr 2018 19:58:09 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 12 Apr 2018 19:58:08 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <schnitzeltony@gmail.com>, <akuster808@gmail.com>
Date: Thu, 12 Apr 2018 22:57:50 -0400
Message-ID: <1523588270-121531-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <CALbNGRT5ZWGZ=YCaSgpmryCzQFPKxDFYLCbOgSP3T1L9gJ0L3g@mail.gmail.com>
References: <CALbNGRT5ZWGZ=YCaSgpmryCzQFPKxDFYLCbOgSP3T1L9gJ0L3g@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH V2][meta-gnome] metacity: add back and change upstream
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
X-List-Received-Date: Fri, 13 Apr 2018 02:58:09 -0000
Content-Type: text/plain

The metacity is still maintained on github, so change
the upstream.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../metacity/0001-ui-Define-_GNU_SOURCE.patch      | 32 ++++++++++++++++++++
 .../metacity/remove-yelp-help-rules-var.patch      | 28 ++++++++++++++++++
 .../recipes-gnome/metacity/metacity_2.34.13.bb     | 34 ++++++++++++++++++++++
 3 files changed, 94 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/metacity/metacity/0001-ui-Define-_GNU_SOURCE.patch
 create mode 100644 meta-gnome/recipes-gnome/metacity/metacity/remove-yelp-help-rules-var.patch
 create mode 100644 meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb

diff --git a/meta-gnome/recipes-gnome/metacity/metacity/0001-ui-Define-_GNU_SOURCE.patch b/meta-gnome/recipes-gnome/metacity/metacity/0001-ui-Define-_GNU_SOURCE.patch
new file mode 100644
index 0000000..5ad38cb
--- /dev/null
+++ b/meta-gnome/recipes-gnome/metacity/metacity/0001-ui-Define-_GNU_SOURCE.patch
@@ -0,0 +1,32 @@
+From 17a9f3c4b98511a8c524af327cbb4b4b850962c6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 14 Jul 2017 10:26:31 -0700
+Subject: [PATCH 2/2] ui: Define _GNU_SOURCE
+
+it becomes portable across musl and glibc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
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
+1.8.3.1
+
diff --git a/meta-gnome/recipes-gnome/metacity/metacity/remove-yelp-help-rules-var.patch b/meta-gnome/recipes-gnome/metacity/metacity/remove-yelp-help-rules-var.patch
new file mode 100644
index 0000000..d3f28c0
--- /dev/null
+++ b/meta-gnome/recipes-gnome/metacity/metacity/remove-yelp-help-rules-var.patch
@@ -0,0 +1,28 @@
+From 880374176c2741f7d0180b61fca35113b523afc1 Mon Sep 17 00:00:00 2001
+From: Constantin Musca <constantinx.musca@intel.com>
+Date: Fri, 13 Apr 2018 10:36:22 +0800
+Subject: [PATCH 1/2] Remove unused variable (YELP_HELP_RULES)
+
+Upstream-Status: Pending
+Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
+
+Rebase from gnome tarball to github
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ doc/creating_themes/Makefile.am | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/doc/creating_themes/Makefile.am b/doc/creating_themes/Makefile.am
+index 65d8fad..4935d87 100644
+--- a/doc/creating_themes/Makefile.am
++++ b/doc/creating_themes/Makefile.am
+@@ -1,6 +1,5 @@
+ ### This part of Makefile.am can be customized by you.
+ 
+-@YELP_HELP_RULES@
+ 
+ # The name of the directory in /usr/share/gnome/help/, 
+ # and the name of the main .xml file:
+-- 
+1.8.3.1
+
diff --git a/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb b/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
new file mode 100644
index 0000000..e7c84e0
--- /dev/null
+++ b/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
@@ -0,0 +1,34 @@
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
+SRC_URI = "git://github.com/GNOME/metacity.git;branch=master \
+           file://remove-yelp-help-rules-var.patch \
+           file://0001-ui-Define-_GNU_SOURCE.patch \
+"
+
+S = "${WORKDIR}/git"
+SRCREV = "a9e0144d21f954aff95772b889a79e72a81861be"
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
1.8.3.1


