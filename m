Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 88A4C77E5B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 19:29:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v86JTwot027123
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Sep 2017 12:29:58 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 6 Sep 2017 12:29:57 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Sep 2017 14:23:28 -0500
Message-ID: <1504725809-12825-31-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
References: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 30/31] florence: update 0.6.3
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
X-List-Received-Date: Wed, 06 Sep 2017 19:29:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@googlemail.com>

* patches were either leftovers or do not match the code
* DESCRIPTION -> shortened SUMMARY

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>

Added gtk+3 dependency and resolved conflicts

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../florence/files/fix-no-atspi-compile.patch      | 30 ----------------------
 .../recipes-support/florence/florence_0.5.4.bb     | 20 ---------------
 .../recipes-support/florence/florence_0.6.3.bb     | 19 ++++++++++++++
 3 files changed, 19 insertions(+), 50 deletions(-)
 delete mode 100644 meta-gnome/recipes-support/florence/files/fix-no-atspi-compile.patch
 delete mode 100644 meta-gnome/recipes-support/florence/florence_0.5.4.bb
 create mode 100644 meta-gnome/recipes-support/florence/florence_0.6.3.bb

diff --git a/meta-gnome/recipes-support/florence/files/fix-no-atspi-compile.patch b/meta-gnome/recipes-support/florence/files/fix-no-atspi-compile.patch
deleted file mode 100644
index 0bb5dee..0000000
--- a/meta-gnome/recipes-support/florence/files/fix-no-atspi-compile.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-diff --git a/src/florence.c b/src/florence.c
-index b27c31b..feadefe 100644
---- a/src/florence.c
-+++ b/src/florence.c
-@@ -44,12 +44,6 @@
- /* exit signal */
- static int flo_exit=FALSE;
- 
--#ifdef ENABLE_AT_SPI2
--void flo_check_show (struct florence *florence, AtspiAccessible *obj);
--#else
--void flo_check_show (struct florence *florence, Accessible *obj);
--#endif
--
- /* Called on destroy event (systray quit or close window) */
- void flo_destroy (void)
- {
-@@ -61,6 +55,12 @@ void flo_destroy (void)
- }
- 
- #ifdef AT_SPI
-+#ifdef ENABLE_AT_SPI2
-+void flo_check_show (struct florence *florence, AtspiAccessible *obj);
-+#else
-+void flo_check_show (struct florence *florence, Accessible *obj);
-+#endif
-+
- /* Called to destroy the icon */
- void flo_icon_destroy (GtkWidget *widget, gpointer user_data)
- {
diff --git a/meta-gnome/recipes-support/florence/florence_0.5.4.bb b/meta-gnome/recipes-support/florence/florence_0.5.4.bb
deleted file mode 100644
index 8ce85c9..0000000
--- a/meta-gnome/recipes-support/florence/florence_0.5.4.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "Florence is a virtual keyboard (also called on-screen-keyboard), which allows the user to input text through a touchscreen."
-HOMEPAGE = "http://florence.sourceforge.net/english.html"
-
-#NOTICE: If florence can't find its gconf settings, you need to start florence with --config for one time and save the configuration once.
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-
-PR = "r1"
-
-DEPENDS = "gtk+ libxml2 libglade librsvg libxtst gconf gconf-native cairo intltool-native gnome-doc-utils libnotify gstreamer"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/florence/florence/${PV}-gtk2/florence-${PV}.tar.bz2 \
-           file://fix-no-atspi-compile.patch"
-SRC_URI[md5sum] = "8d5c2367a28485bfcf577650b0badab7"
-SRC_URI[sha256sum] = "26d33aa20d5fbf34ceeded4c41cb922d2988b6082e33d9acc46dd7bfe56d31a1"
-
-inherit gettext autotools gconf pkgconfig
-
-EXTRA_OECONF = "--disable-scrollkeeper --without-docs --without-at-spi --without-panelapplet --without-xrecord"
diff --git a/meta-gnome/recipes-support/florence/florence_0.6.3.bb b/meta-gnome/recipes-support/florence/florence_0.6.3.bb
new file mode 100644
index 0000000..b9b7d0c
--- /dev/null
+++ b/meta-gnome/recipes-support/florence/florence_0.6.3.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Florence is a virtual keyboard for touch screens"
+HOMEPAGE = "http://florence.sourceforge.net/english.html"
+
+#NOTICE: If florence can't find its gconf settings, you need to start florence with --config for one time and save the configuration once.
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+DEPENDS = "gtk+3 libxml2 libglade librsvg libxtst gconf gconf-native cairo intltool-native gnome-doc-utils libnotify gstreamer1.0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/${PN}/${PN}/${PV}/${PN}-${PV}.tar.bz2"
+SRC_URI[md5sum] = "8775051d7352f75dec5a86dc9964e8e0"
+SRC_URI[sha256sum] = "422992fd07d285be73cce721a203e22cee21320d69b0fda1579ce62944c5091e"
+
+inherit gettext autotools gconf pkgconfig
+
+EXTRA_OECONF = "--disable-scrollkeeper --without-docs --without-at-spi --without-panelapplet --without-xrecord"
+
+FILES_${PN} += "${datadir}/glib-2.0/schemas"
-- 
1.8.3.1


