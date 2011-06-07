Received: from smtpfb2-g21.free.fr ([212.27.42.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <guillaume.beraudo@belledonne-communications.com>)
	id 1QTvLV-0006Pc-K4 for openembedded-devel@lists.openembedded.org;
	Tue, 07 Jun 2011 14:25:21 +0200
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 90AA0D1AAA3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jun 2011 14:13:40 +0200 (CEST)
Received: from localhost.localdomain (unknown [81.56.113.2])
	by smtp1-g21.free.fr (Postfix) with ESMTP id 0E8C294015E;
	Tue,  7 Jun 2011 14:13:35 +0200 (CEST)
From: Guillaume Beraudo <guillaume.beraudo@belledonne-communications.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Jun 2011 14:13:32 +0200
Message-Id: <1307448812-27299-1-git-send-email-guillaume.beraudo@belledonne-communications.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <guillaume.beraudo@belledonne-communications.com>
References: <guillaume.beraudo@belledonne-communications.com>
Subject: [PATCH] linphone: added recipe for v3.4.3
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
X-List-Received-Date: Tue, 07 Jun 2011 12:25:22 -0000

* included alsa_8khz patch to get audio out at 8KHz rate.
* removed dependency on patches without explaination (all others).

Signed-off-by: Guillaume Beraudo <guillaume.beraudo@belledonne-communications.com>
---
 recipes/linphone/files/igep0020/alsa_8khz.patch |   13 ++++
 recipes/linphone/linphone-common.inc            |   75 +++++++++++++++++++++++
 recipes/linphone/linphone-common_3.4.3.inc      |   11 +++
 recipes/linphone/linphone_3.4.3+nogtk.bb        |    9 +++
 4 files changed, 108 insertions(+), 0 deletions(-)
 create mode 100644 recipes/linphone/files/igep0020/alsa_8khz.patch
 create mode 100644 recipes/linphone/linphone-common.inc
 create mode 100644 recipes/linphone/linphone-common_3.4.3.inc
 create mode 100644 recipes/linphone/linphone_3.4.3+nogtk.bb

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
index 0000000..98e0288
--- /dev/null
+++ b/recipes/linphone/linphone-common.inc
@@ -0,0 +1,75 @@
+SECTION = "x11/network"
+SECTION_liblinphone = "libs/network"
+SECTION_libmediastreamer = "libs/network"
+SECTION_libortp = "libs/network"
+SECTION_linphonec =  "console/network"
+
+SRC_URI_append_igep0020 = " file://alsa_8khz.patch"
+
+DEPENDS = "intltool readline libosip2 libexosip2 speex alsa-lib"
+DEPENDS_append_video = " libxv ffmpeg libv4l"
+DEPENDS_append_gtk = " gtk+"
+DEPENDS_${PN} = "intltool liblinphone"
+DEPENDS_${PN}_append_gtk = " gtk+"
+DEPENDS_${PN}_append_video = " libxv"
+DEPENDS_${PN}c = "liblinphone readline"
+DEPENDS_liblinphone = "libmediastreamer libortp libosip2 libexosip2"
+DEPENDS_libmediastreamer = "speex alsa-lib libortp"
+DEPENDS_libmediastreamer_append_video = " ffmpeg libv4l"
+
+PROVIDES = "linphonec liblinphone libmediastreamer libortp"
+PROVIDES_gtk = "linphone linphonec liblinphone libmediastreamer libortp"
+
+inherit autotools pkgconfig gettext
+
+export PKG_CONFIG=${STAGING_BINDIR_NATIVE}/pkg-config
+
+
+LINPHONE_OE_ENABLE_VIDEO = "--disable-video"
+LINPHONE_OE_ENABLE_VIDEO_video = "--with-ffmpeg=${STAGING_DIR_HOST}${layout_exec_prefix} --enable-video"
+
+LINPHONE_OE_ENABLE_CONSOLE_UI = "no"
+LINPHONE_OE_ENABLE_CONSOLE_UI_console = "yes"
+
+LINPHONE_OE_ENABLE_GTK_UI = "no"
+LINPHONE_OE_ENABLE_GTK_UI_gtk = "yes"
+
+do_install_append(){
+	install -d ${D}${bindir}
+	install -m 0755 ${S}/coreapi/.libs/test_ecc ${D}${bindir}/test_ecc
+	install -m 0755 ${S}/coreapi/.libs/test_lsd ${D}${bindir}/test_lsd
+}
+
+EXTRA_OECONF = " \
+                ${LINPHONE_OE_ENABLE_VIDEO} \
+                --enable-alsa \
+                --with-osip=${STAGING_DIR_HOST}${layout_exec_prefix} \
+                --with-readline=${STAGING_DIR_HOST}${layout_exec_prefix} \
+                --with-speex=${STAGING_DIR_HOST}${layout_exec_prefix} \
+                --disable-manual \
+		--enable-console_ui=${LINPHONE_OE_ENABLE_CONSOLE_UI} \
+		--enable-gtk_ui=${LINPHONE_OE_ENABLE_GTK_UI} \
+		--with-realprefix=/usr \
+		"
+
+PACKAGES_gtk = "${PN}-dbg ${PN} ${PN}-doc ${PN}-dev ${PN}-locale ${PN}c linphone-rings liblinphone libmediastreamer-bin libmediastreamer libortp ${PN}-utils"
+PACKAGES = "${PN}c linphone-rings liblinphone libmediastreamer-bin libmediastreamer libortp ${PN}-utils"
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
+FILES_${PN}c = "${bindir}/linphonec ${bindir}/linphonecsh ${bindir}/sipomatic ${datadir}/sounds/linphone/ringback.wav"
+FILES_${PN}-rings = "${datadir}/sounds/linphone/rings"
+FILES_liblinphone = "${libdir}/liblinphone.so.*"
+FILES_libmediastreamer-bin = "/usr/libexec/mediastream"
+FILES_libmediastreamer = "${libdir}/libmediastreamer.so.*"
+FILES_libortp = "${libdir}/libortp.so.*"
+FILES_${PN}-dev += "${libdir}/*.a ${libdir}/*.la ${libdir}/pkgconfig ${includedir}"
+FILES_${PN}-utils = "${bindir}/test_ecc ${bindir}/test_lsd"
diff --git a/recipes/linphone/linphone-common_3.4.3.inc b/recipes/linphone/linphone-common_3.4.3.inc
new file mode 100644
index 0000000..5865ab0
--- /dev/null
+++ b/recipes/linphone/linphone-common_3.4.3.inc
@@ -0,0 +1,11 @@
+
+SRC_URI = "${SAVANNAH_MIRROR}/releases/linphone/3.4.x/sources/linphone-3.4.3.tar.gz \
+	file://cif10fps.patch"
+
+SRC_URI[md5sum] = "66e21f36d62c2094f7b4360262c46f20"
+SRC_URI[sha256sum] = "92e7a0a01f2bb53bfaa4d7de4972e63ad528731154c36e05a9b6ba097e296692"
+
+S = "${WORKDIR}/linphone-3.4.3"
+
+
+require linphone-common.inc
diff --git a/recipes/linphone/linphone_3.4.3+nogtk.bb b/recipes/linphone/linphone_3.4.3+nogtk.bb
new file mode 100644
index 0000000..9bec7b1
--- /dev/null
+++ b/recipes/linphone/linphone_3.4.3+nogtk.bb
@@ -0,0 +1,9 @@
+DESCRIPTION = "Audio/video SIP-based IP phone (console edition)"
+HOMEPAGE = "http://www.linphone.org/?lang=us"
+LICENSE = "GPLv2"
+PR="r6"
+
+DEFAULT_PREFERENCE = "2"
+OVERRIDES_append = ":video:console"
+
+require linphone-common_3.4.3.inc
-- 
1.7.2.5



