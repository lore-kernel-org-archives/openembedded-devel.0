Received: from smtp1-g21.free.fr ([212.27.42.1])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <guillaume.beraudo@belledonne-communications.com>)
	id 1QWm3R-0003US-Sx for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jun 2011 11:06:37 +0200
Received: from localhost.localdomain (unknown [81.56.113.2])
	by smtp1-g21.free.fr (Postfix) with ESMTP id 04C299401AE;
	Wed, 15 Jun 2011 11:02:24 +0200 (CEST)
From: Guillaume Beraudo <guillaume.beraudo@belledonne-communications.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jun 2011 11:02:21 +0200
Message-Id: <1308128541-5714-1-git-send-email-guillaume.beraudo@belledonne-communications.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <guillaume.beraudo@belledonne-communications.com>
References: <guillaume.beraudo@belledonne-communications.com>
Subject: [PATCH v3] linphone: added recipe for v3.4.3
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
X-List-Received-Date: Wed, 15 Jun 2011 09:06:37 -0000

Recipe support linphone built with video support and without GTK.

* included IGEPv2 specific patch to get audio playback at 8KHz rate.
* included infrastructure to create flavoured recipes
        - with(out) video
        - with(out) gtk
* removed dependency on:
        - obsolete disable-gtk-doc.patch;
        - cryptic b64_assert.patch;
        - already upstream preferences-segv.patch;
        - already upstream fix.unused.variable.patch
---
 recipes/linphone/files/igep0020/alsa_8khz.patch |   13 +++++
 recipes/linphone/linphone-common.inc            |   61 +++++++++++++++++++++++
 recipes/linphone/linphone-common_3.4.3.inc      |   11 ++++
 recipes/linphone/linphone-nogtk_3.4.3.bb        |   15 ++++++
 4 files changed, 100 insertions(+), 0 deletions(-)
 create mode 100644 recipes/linphone/files/igep0020/alsa_8khz.patch
 create mode 100644 recipes/linphone/linphone-common.inc
 create mode 100644 recipes/linphone/linphone-common_3.4.3.inc
 create mode 100644 recipes/linphone/linphone-nogtk_3.4.3.bb

diff --git a/recipes/linphone/files/igep0020/alsa_8khz.patch b/recipes/linphone/files/igep0020/alsa_8khz.patch
new file mode 100644
index 0000000..17774d4
--- /dev/null
+++ b/recipes/linphone/files/igep0020/alsa_8khz.patch
@@ -0,0 +1,13 @@
+--- linphone/mediastreamer2/src/alsa.c_orig	2011-05-24 12:39:33.824600109 +0200
++++ linphone/mediastreamer2/src/alsa.c	2011-05-24 12:40:04.760407404 +0200
+@@ -32,8 +32,8 @@
+ /*in case of troubles with a particular driver, try incrementing ALSA_PERIOD_SIZE
+ to 512, 1024, 2048, 4096...
+ then try incrementing the number of periods*/
+-#define ALSA_PERIODS 8
+-#define ALSA_PERIOD_SIZE 256
++#define ALSA_PERIODS 4
++#define ALSA_PERIOD_SIZE 512
+ 
+ /*uncomment the following line if you have problems with an alsa driver
+ having sound quality trouble:*/
diff --git a/recipes/linphone/linphone-common.inc b/recipes/linphone/linphone-common.inc
new file mode 100644
index 0000000..a9d0f5b
--- /dev/null
+++ b/recipes/linphone/linphone-common.inc
@@ -0,0 +1,61 @@
+inherit autotools pkgconfig gettext
+#export PKG_CONFIG=${STAGING_BINDIR_NATIVE}/pkg-config
+
+SECTION = "x11/network"
+SECTION_liblinphone = "libs/network"
+SECTION_libmediastreamer = "libs/network"
+SECTION_libortp = "libs/network"
+SECTION_linphonec =  "console/network"
+
+DEPENDS = "intltool readline libosip2 libexosip2 speex alsa-lib \
+	${@base_conditional('LINPHONE_FLAVOUR_WITH_VIDEO', '1', ' libxv ffmpeg libv4l', '', d)} \
+	${@base_conditional('LINPHONE_FLAVOUR_WITH_GTK', '1', ' gtk+', '', d)} \
+	"
+
+PROVIDES = "linphonec liblinphone libmediastreamer libortp \
+	${@base_conditional('LINPHONE_FLAVOUR_WITH_GTK', '1', ' linphone', '', d)}"
+
+SRC_URI_append_igep0020 = " file://alsa_8khz.patch"
+
+
+do_install_append(){
+	install -d ${D}${bindir}
+	install -m 0755 ${S}/coreapi/.libs/test_ecc ${D}${bindir}/test_ecc
+	install -m 0755 ${S}/coreapi/.libs/test_lsd ${D}${bindir}/test_lsd
+}
+
+EXTRA_OECONF = " \
+	${@base_conditional('LINPHONE_FLAVOUR_WITH_VIDEO', '1', '--with-ffmpeg=${STAGING_DIR_HOST}${layout_exec_prefix} --enable-video', '--disable-video', d)} \
+        --enable-alsa \
+        --with-osip=${STAGING_DIR_HOST}${layout_exec_prefix} \
+        --with-readline=${STAGING_DIR_HOST}${layout_exec_prefix} \
+        --with-speex=${STAGING_DIR_HOST}${layout_exec_prefix} \
+        --disable-manual \
+	--enable-console_ui=yes \
+	--enable-gtk_ui=${@base_conditional('LINPHONE_FLAVOUR_WITH_GTK', '1', 'yes', 'no', d)} \
+	--with-realprefix=/usr \
+	"
+
+PACKAGES = " \
+	${@base_conditional('LINPHONE_FLAVOUR_WITH_GTK', '1', '${PN}-dbg ${PN} ${PN}-doc ${PN}-dev ${PN}-locale', '', d)} \
+	${PN}-console linphone-rings liblinphone libmediastreamer-bin libmediastreamer libortp ${PN}-utils"
+
+FILES_${PN} = " \ 
+	    ${bindir}/linphone \
+            ${datadir}/linphone \
+ 	    ${datadir}/pixmaps \
+	    ${datadir}/applications \
+	    ${datadir}/gnome/apps \
+	    ${datadir}/sounds/linphone/hello8000.wav \
+	    ${datadir}/sounds/linphone/hello16000.wav \
+	    ${datadir}/images/nowebcamCIF.jpg \
+	    "
+
+FILES_${PN}-console = "${bindir}/linphonec ${bindir}/linphonecsh ${bindir}/sipomatic ${datadir}/sounds/linphone/ringback.wav"
+FILES_${PN}-rings = "${datadir}/sounds/linphone/rings"
+FILES_liblinphone = "${libdir}/liblinphone.so.*"
+FILES_libmediastreamer-bin = "/usr/libexec/mediastream"
+FILES_libmediastreamer = "${libdir}/libmediastreamer.so.*"
+FILES_libortp = "${libdir}/libortp.so.*"
+FILES_${PN}-dev += "${libdir}/*.a ${libdir}/*.la ${libdir}/pkgconfig ${includedir}"
+FILES_${PN}-utils = "${bindir}/test_ecc ${bindir}/test_lsd"
diff --git a/recipes/linphone/linphone-common_3.4.3.inc b/recipes/linphone/linphone-common_3.4.3.inc
new file mode 100644
index 0000000..bbf6e8d
--- /dev/null
+++ b/recipes/linphone/linphone-common_3.4.3.inc
@@ -0,0 +1,11 @@
+
+SRC_URI = "${SAVANNAH_MIRROR}/releases/linphone/3.4.x/sources/linphone-3.4.3.tar.gz \
+	"
+
+SRC_URI[md5sum] = "66e21f36d62c2094f7b4360262c46f20"
+SRC_URI[sha256sum] = "92e7a0a01f2bb53bfaa4d7de4972e63ad528731154c36e05a9b6ba097e296692"
+
+S = "${WORKDIR}/linphone-3.4.3"
+
+
+require linphone-common.inc
diff --git a/recipes/linphone/linphone-nogtk_3.4.3.bb b/recipes/linphone/linphone-nogtk_3.4.3.bb
new file mode 100644
index 0000000..83ad0c3
--- /dev/null
+++ b/recipes/linphone/linphone-nogtk_3.4.3.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Audio/video SIP-based IP phone (console edition)"
+HOMEPAGE = "http://www.linphone.org/?lang=us"
+LICENSE = "GPLv2"
+PR="r1"
+
+DEFAULT_PREFERENCE = "1"
+
+# Build without GTK
+LINPHONE_FLAVOUR_WITH_GTK = '0'
+
+# Build with video
+LINPHONE_FLAVOUR_WITH_VIDEO = '1'
+
+
+require linphone-common_3.4.3.inc
-- 
1.7.2.5



