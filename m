Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OgUjn-0004Y6-50
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 05:33:57 +0200
Received: by iwn34 with SMTP id 34so5740808iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Aug 2010 20:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=mScn/6T+DfucCmWZXByP2Ze2JxTfBeqfwz/Ju49LJDs=;
	b=PaxnvTDF29n3jMKckNM15rcWMWNiPKN30f7SOQj1ALXQCqKfgHCU94NlOrYAyS3MWs
	N1YGut9oSy9khFQ1rTwG8XkdJJvDouwXFeAtSKtBczPhPUyrb/1cK5vPrD38qOSjy6dX
	a1b3gNd4iNzXq1Xn7PjWZxEWNKKClKuMfp5m8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=gUdVg/drBkeaYKe6AAYOVRtlyytDRlLiVoQgjaiV/waW5GH5roFZceO++3G2/UddU7
	lj09SBRNzlZuvZZbUgYWBuo/BeUvzO3eaSJDrostDaKnHjy8PtFfu+BQPs/pqs+pn2Cy
	fH/xHT74jqg0e1wftOxFhyiGdqJft6e5JTEMA=
Received: by 10.231.172.70 with SMTP id k6mr9513557ibz.125.1280892826377;
	Tue, 03 Aug 2010 20:33:46 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id r3sm7338657ibk.13.2010.08.03.20.33.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 03 Aug 2010 20:33:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Aug 2010 20:33:36 -0700
Message-Id: <1280892816-18835-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	URI_NOVOWEL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2] recipes: Dont inherit autotools_stage.
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
X-List-Received-Date: Wed, 04 Aug 2010 03:33:57 -0000

Some recipes had do_stage_append|prepend stuff. Fixed that too in this verison


Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/alsa/alsa-oss_1.0.17.bb                    |    2 +-
 recipes/android/android-image-utils-native_git.bb  |    2 +-
 recipes/apr/apr-util_1.3.4.bb                      |    2 +-
 recipes/asciidoc/asciidoc_8.5.1.bb                 |    2 +-
 recipes/audiofile/audiofile_0.2.6.bb               |    2 +-
 recipes/bluez/bluez4-libs.inc                      |    1 -
 recipes/bluez/bluez4.inc                           |    2 +-
 recipes/bluez/bluez4_4.35.bb                       |    2 +-
 recipes/bluez/bluez4_4.37.bb                       |    2 +-
 recipes/bluez/obexd_0.10.bb                        |    2 +-
 recipes/bluez/obexd_0.13.bb                        |    2 +-
 recipes/bluez/obexd_0.15.bb                        |    2 +-
 recipes/bluez/obexd_0.19.bb                        |    2 +-
 recipes/bluez/obexd_0.21.bb                        |    2 +-
 recipes/bluez/obexd_0.22.bb                        |    2 +-
 recipes/bzip2/bzip2-full-native_1.0.5.bb           |    2 +-
 recipes/ccrtp/ccrtp_1.7.0.bb                       |    2 +-
 recipes/check/check_0.9.5.bb                       |    2 +-
 recipes/clutter/clutter-gtk.inc                    |    2 +-
 recipes/commoncpp/commoncpp2_1.7.1.bb              |    2 +-
 recipes/corosync/corosync_1.2.6.bb                 |    2 +-
 recipes/cppunit/cppunit_1.12.1.bb                  |    2 +-
 recipes/device-mapper/device-mapper_1.02.28.bb     |   11 +----------
 recipes/devicekit/devicekit-disks_004.bb           |    2 +-
 recipes/efl1/libeflvala_svn.bb                     |    2 +-
 recipes/fann/fann_2.0.0.bb                         |    2 +-
 recipes/farsight/farsight2_0.0.9.bb                |    2 +-
 recipes/farsight/libnice_0.0.6.bb                  |    2 +-
 recipes/fltk/fltk2_svn.bb                          |    2 +-
 recipes/fltk/fltk_1.1.10.bb                        |    2 +-
 recipes/fltk/fltk_1.1.9.bb                         |    2 +-
 recipes/freerdp/freerdp.inc                        |    2 +-
 recipes/gabriel/gabriel_svn.bb                     |    2 +-
 recipes/geoclue/geoclue_git.bb                     |    2 +-
 recipes/gnet/gnet_svn.bb                           |    2 +-
 recipes/gnome/libchamplain-gtk_0.2.8.bb            |    2 +-
 recipes/gnome/libchamplain_0.2.8.bb                |    2 +-
 recipes/gnome/libgdata_0.4.0.bb                    |    2 +-
 recipes/gnome/libgdata_0.5.1.bb                    |    2 +-
 recipes/gnome/libproxy_0.2.3.bb                    |    2 +-
 recipes/gnome/libxml++_2.26.0.bb                   |    2 +-
 recipes/gnuradio/gnuradio-libusb-compat.inc        |    4 ++--
 recipes/gnuradio/gnuradio.inc                      |    4 ++--
 recipes/gpsd/gpsd.inc                              |    2 +-
 recipes/gsoap/gsoap_2.7.13.inc                     |    2 --
 recipes/gsoap/gsoap_2.7.7.bb                       |    2 +-
 recipes/iksemel/iksemel_1.4.bb                     |    2 +-
 recipes/imagemagick/imagemagick_6.3.5-10.bb        |    2 +-
 recipes/imagemagick/imagemagick_6.4.4-1.bb         |    2 +-
 recipes/iphone/apple-csu_0.30.bb                   |    2 +-
 recipes/iso-codes/iso-codes_1.4.bb                 |    2 +-
 recipes/lame/lame_3.98.2.bb                        |    2 +-
 recipes/libdaemon/libdaemon_0.13.bb                |    2 +-
 recipes/libdlo/libdlo_git.bb                       |    2 +-
 recipes/libfribidi/fribidi_0.19.2.bb               |    2 +-
 recipes/libgc/libgc_7.1.bb                         |    2 +-
 recipes/libgmime/gmime_2.4.10.bb                   |    2 +-
 recipes/libgmime/libgmime_2.2.23.bb                |    2 +-
 recipes/liblinebreak/liblinebreak_1.2.bb           |    2 +-
 .../libnetfilter/libnetfilter-conntrack_0.0.101.bb |    2 +-
 recipes/libnfnetlink/libnfnetlink.inc              |    2 +-
 recipes/libpar2/libpar2_0.2.bb                     |    2 +-
 recipes/librsvg/librsvg-native_2.26.0.bb           |    2 +-
 recipes/libsdl/libsdl-mixer_1.2.10.bb              |    2 +-
 recipes/libsdl/libsdl-mixer_1.2.11.bb              |    2 +-
 recipes/libsdl/libsdl-mixer_1.2.8.bb               |    2 +-
 recipes/libsidplay/libsidplay_1.36.59.bb           |    2 +-
 recipes/libsndfile/libsndfile1_1.0.21.bb           |    2 +-
 recipes/libsynthesis/libsynthesis_git.bb           |    2 +-
 recipes/libusb/libusb-compat_0.1.2.bb              |    2 +-
 recipes/libusb/libusb-compat_0.1.3.bb              |    2 +-
 recipes/libusb/libusb1_1.0.2.bb                    |    2 +-
 recipes/libwmf/libwmf_0.2.8.4.bb                   |    2 +-
 recipes/libzrtpcpp/libzrtpcpp_1.4.6.bb             |    2 +-
 recipes/linux-ha/cluster-glue_1.0.5.bb             |    2 +-
 recipes/linux-ha/cluster-resource-agents_1.0.3.bb  |    2 +-
 recipes/lowpan-tools/lowpan-tools.inc              |    2 +-
 recipes/mamona/mamona-input-methods_git.bb         |    2 +-
 recipes/matchbox2/matchbox-desktop-2_svn.bb        |    2 +-
 recipes/matchbox2/matchbox-panel-2_svn.bb          |    2 +-
 .../mobile-broadband-provider-info_git.bb          |    2 +-
 recipes/moblin/bickley_git.bb                      |    2 +-
 recipes/moblin/bognor-regis_git.bb                 |    2 +-
 recipes/moblin/hornsey_git.bb                      |    2 +-
 recipes/moblin/json-glib_0.6.2.bb                  |    2 +-
 recipes/moblin/json-glib_git.bb                    |    2 +-
 recipes/moblin/libccss_git.bb                      |    2 +-
 recipes/moblin/librest_git.bb                      |    2 +-
 recipes/moblin/moblin-menus_git.bb                 |    2 +-
 recipes/moblin/mojito_git.bb                       |    2 +-
 recipes/moblin/nbtk_git.bb                         |    2 +-
 recipes/moblin/twitter-glib_git.bb                 |    2 +-
 recipes/musicpd/libmpd_0.17.96.bb                  |    2 +-
 recipes/mux/mux_git.bb                             |    2 +-
 recipes/nzbget/nzbget.inc                          |    2 +-
 recipes/obexftp/obexftp_0.23.bb                    |    2 +-
 recipes/obsolete/pixman/pixman_0.17.6.bb           |    2 +-
 .../shr/libframeworkd-phonegui-efl2_git.bb         |    2 +-
 .../obsolete/shr/libframeworkd-phonegui-efl_git.bb |    2 +-
 recipes/obsolete/shr/libframeworkd-phonegui_git.bb |    2 +-
 recipes/ogre/ogre-egl_svn.bb                       |    2 +-
 recipes/openais/openais_1.1.3.bb                   |    2 +-
 recipes/openmax/libomxil-bellagio_0.9.1.bb         |    2 +-
 recipes/openmax/libomxil-bellagio_0.9.2.bb         |    2 +-
 recipes/openmoko2/libjana_svn.bb                   |    2 +-
 recipes/openobex/openobex_1.5.bb                   |    8 ++++----
 recipes/openscada/openscada_svn.bb                 |    2 +-
 recipes/pacemaker/pacemaker_1.0.9.1.bb             |    2 +-
 recipes/packagekit/packagekit_0.4.6.bb             |    2 +-
 recipes/packagekit/packagekit_0.4.8.bb             |    2 +-
 recipes/packagekit/packagekit_0.5.2.bb             |    2 +-
 recipes/packagekit/packagekit_git.bb               |    2 +-
 recipes/pcsc-lite/pcsc-lite_1.5.2.bb               |    2 +-
 recipes/popt/popt_1.14.bb                          |    2 +-
 recipes/popt/popt_1.7.bb                           |    2 +-
 recipes/pulseaudio/libcanberra_0.14.bb             |    2 +-
 recipes/pulseaudio/libcanberra_0.17.bb             |    2 +-
 recipes/python/python-dbus_0.83.0.bb               |    2 +-
 recipes/python/python-pygtk-1.2_0.6.12.bb          |    2 +-
 recipes/qhull/qhull_2003.1.bb                      |    2 +-
 recipes/redland/redland_1.0.8.bb                   |    2 +-
 recipes/schroedinger/schroedinger_1.0.9.bb         |    2 +-
 recipes/sdr/dttsp_svn.bb                           |    2 +-
 recipes/sdr/fldigi_3.11.4.bb                       |    2 +-
 recipes/sdr/hamlib_1.2.9.bb                        |    2 +-
 recipes/sgalib/sgalib_0.1.0.bb                     |    2 +-
 recipes/shr/libmodulo_git.bb                       |    2 +-
 recipes/shr/libphone-ui-shr_git.bb                 |    2 +-
 recipes/shr/libphone-ui_git.bb                     |    2 +-
 recipes/socketcan/libsocketcan.inc                 |    2 +-
 recipes/sqlite/sqlite3.inc                         |    2 +-
 recipes/sysfsutils/sysfsutils.inc                  |    2 +-
 recipes/telepathy/telepathy-farsight_0.0.7.bb      |    2 +-
 recipes/telepathy/telepathy-gabble_0.7.27.bb       |    1 -
 recipes/telepathy/telepathy-glib_0.7.29.bb         |    2 +-
 .../telepathy/telepathy-mission-control_4.67.bb    |    2 --
 recipes/upnp/gssdp_0.6.3.bb                        |    2 +-
 recipes/upnp/gssdp_0.7.1.bb                        |    2 +-
 recipes/upnp/gupnp-av_0.3.bb                       |    2 +-
 recipes/upnp/gupnp-av_0.5.2.bb                     |    2 +-
 recipes/upnp/gupnp_0.12.5.bb                       |    6 +++---
 recipes/upnp/gupnp_0.13.1.bb                       |    6 +++---
 .../vala-dbus-binding-tool.inc                     |    2 --
 recipes/xdg-user-dirs/xdg-user-dirs_0.10.bb        |    2 +-
 144 files changed, 148 insertions(+), 165 deletions(-)

diff --git a/recipes/alsa/alsa-oss_1.0.17.bb b/recipes/alsa/alsa-oss_1.0.17.bb
index c5dd934..e9efccd 100644
--- a/recipes/alsa/alsa-oss_1.0.17.bb
+++ b/recipes/alsa/alsa-oss_1.0.17.bb
@@ -8,7 +8,7 @@ SRC_URI = "ftp://ftp.alsa-project.org/pub/oss-lib/alsa-oss-${PV}.tar.bz2 \
 	   file://libio.patch \
 	  "
 
-inherit autotools_stage
+
 
 LEAD_SONAME = "libaoss.so.0"
 
diff --git a/recipes/android/android-image-utils-native_git.bb b/recipes/android/android-image-utils-native_git.bb
index 3c6334e..11ed4d8 100644
--- a/recipes/android/android-image-utils-native_git.bb
+++ b/recipes/android/android-image-utils-native_git.bb
@@ -10,7 +10,7 @@ SRC_URI = "\
 "
 S = "${WORKDIR}/git/android/image-utils"
 
-inherit autotools_stage native
+inherit  native
 
 do_deploy () {
 	install -d ${DEPLOY_DIR_TOOLS}
diff --git a/recipes/apr/apr-util_1.3.4.bb b/recipes/apr/apr-util_1.3.4.bb
index 914f9ce..948ad2f 100644
--- a/recipes/apr/apr-util_1.3.4.bb
+++ b/recipes/apr/apr-util_1.3.4.bb
@@ -17,7 +17,7 @@ EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
 		--with-expat=${STAGING_DIR_HOST}${layout_prefix}"
 
 
-inherit autotools_stage lib_package binconfig
+inherit  lib_package binconfig
 
 OE_BINCONFIG_EXTRA_MANGLE = " -e 's:location=source:location=installed:'"
 
diff --git a/recipes/asciidoc/asciidoc_8.5.1.bb b/recipes/asciidoc/asciidoc_8.5.1.bb
index 16c53ef..2fe7b35 100644
--- a/recipes/asciidoc/asciidoc_8.5.1.bb
+++ b/recipes/asciidoc/asciidoc_8.5.1.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 
 SRC_URI = "http://mesh.dl.sourceforge.net/project/asciidoc/asciidoc/${PV}/asciidoc-${PV}.tar.gz"
 
-inherit distutils-base autotools_stage pkgconfig
+inherit distutils-base pkgconfig
 
 export vimdir = "${D}${sysconfdir}/vim"
 export DESTDIR = "${D}"
diff --git a/recipes/audiofile/audiofile_0.2.6.bb b/recipes/audiofile/audiofile_0.2.6.bb
index b142aaf..e67050a 100644
--- a/recipes/audiofile/audiofile_0.2.6.bb
+++ b/recipes/audiofile/audiofile_0.2.6.bb
@@ -14,7 +14,7 @@ SRC_URI = "http://www.68k.org/~michael/audiofile/audiofile-${PV}.tar.gz \
 	   file://CVE-2008-5824.patch \
 "
 
-inherit autotools_stage lib_package binconfig
+inherit  lib_package binconfig
 
 SRC_URI[md5sum] = "9c1049876cd51c0f1b12c2886cce4d42"
 SRC_URI[sha256sum] = "4b6167b56e21556fb07c9ef06962fe32817064c62181ba47afd3322e0d0f22a9"
diff --git a/recipes/bluez/bluez4-libs.inc b/recipes/bluez/bluez4-libs.inc
index 0083f15..fb26ca8 100644
--- a/recipes/bluez/bluez4-libs.inc
+++ b/recipes/bluez/bluez4-libs.inc
@@ -10,7 +10,6 @@ SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/bluez-${PV}.tar.gz \
 
 S = "${WORKDIR}/bluez-${PV}"
 
-inherit autotools_stage
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
 EXTRA_OECONF = "\
diff --git a/recipes/bluez/bluez4.inc b/recipes/bluez/bluez4.inc
index 1807c95..fdc4039 100644
--- a/recipes/bluez/bluez4.inc
+++ b/recipes/bluez/bluez4.inc
@@ -19,7 +19,7 @@ SRC_URI = "\
 "
 S = "${WORKDIR}/bluez-${PV}"
 
-inherit autotools_stage update-rc.d
+inherit  update-rc.d
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
 EXTRA_OECONF = "\
diff --git a/recipes/bluez/bluez4_4.35.bb b/recipes/bluez/bluez4_4.35.bb
index 1b22602..e9d55f9 100644
--- a/recipes/bluez/bluez4_4.35.bb
+++ b/recipes/bluez/bluez4_4.35.bb
@@ -21,7 +21,7 @@ SRC_URI = "\
 "
 S = "${WORKDIR}/bluez-${PV}"
 
-inherit autotools_stage
+
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
 EXTRA_OECONF = "\
diff --git a/recipes/bluez/bluez4_4.37.bb b/recipes/bluez/bluez4_4.37.bb
index b1dabd1..8fefe44 100644
--- a/recipes/bluez/bluez4_4.37.bb
+++ b/recipes/bluez/bluez4_4.37.bb
@@ -21,7 +21,7 @@ SRC_URI = "\
 "
 S = "${WORKDIR}/bluez-${PV}"
 
-inherit autotools_stage
+
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
 EXTRA_OECONF = "\
diff --git a/recipes/bluez/obexd_0.10.bb b/recipes/bluez/obexd_0.10.bb
index 9cb14f7..b0979a3 100644
--- a/recipes/bluez/obexd_0.10.bb
+++ b/recipes/bluez/obexd_0.10.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 
 SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/obexd-${PV}.tar.gz"
 
-inherit autotools_stage
+
 
 FILES_${PN} += "${datadir}/dbus-1/"
 
diff --git a/recipes/bluez/obexd_0.13.bb b/recipes/bluez/obexd_0.13.bb
index 08b8148..70cf92f 100644
--- a/recipes/bluez/obexd_0.13.bb
+++ b/recipes/bluez/obexd_0.13.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 
 SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/obexd-${PV}.tar.gz"
 
-inherit autotools_stage
+
 
 FILES_${PN} += "${datadir}/dbus-1/"
 
diff --git a/recipes/bluez/obexd_0.15.bb b/recipes/bluez/obexd_0.15.bb
index 57dd387..00a1f2e 100644
--- a/recipes/bluez/obexd_0.15.bb
+++ b/recipes/bluez/obexd_0.15.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 
 SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/obexd-${PV}.tar.gz"
 
-inherit autotools_stage
+
 
 FILES_${PN} += "${datadir}/dbus-1/"
 
diff --git a/recipes/bluez/obexd_0.19.bb b/recipes/bluez/obexd_0.19.bb
index a3bc6af..9c4ec22 100644
--- a/recipes/bluez/obexd_0.19.bb
+++ b/recipes/bluez/obexd_0.19.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 
 SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/obexd-${PV}.tar.gz"
 
-inherit autotools_stage
+
 
 FILES_${PN} += "${datadir}/dbus-1/"
 
diff --git a/recipes/bluez/obexd_0.21.bb b/recipes/bluez/obexd_0.21.bb
index ffa6459..c90a26b 100644
--- a/recipes/bluez/obexd_0.21.bb
+++ b/recipes/bluez/obexd_0.21.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 
 SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/obexd-${PV}.tar.gz"
 
-inherit autotools_stage
+
 
 FILES_${PN} += "${datadir}/dbus-1/"
 
diff --git a/recipes/bluez/obexd_0.22.bb b/recipes/bluez/obexd_0.22.bb
index c305b10..f8c70a2 100644
--- a/recipes/bluez/obexd_0.22.bb
+++ b/recipes/bluez/obexd_0.22.bb
@@ -9,7 +9,7 @@ SRC_URI_append_shr = " file://obexd-add-fso-support.patch "
 SRC_URI[archive.md5sum] = "ed59a0e357b56d2a2ba0d1de6a0cc109"
 SRC_URI[archive.sha256sum] = "b6a0217abafd2fd78c33ef8b9d64bb83da014c67c1ed594c475129a1b326e137"
 
-inherit autotools_stage
+
 
 EXTRA_OECONF_append_shr = " --with-telephony=fso --with-phonebook=fso "
 
diff --git a/recipes/bzip2/bzip2-full-native_1.0.5.bb b/recipes/bzip2/bzip2-full-native_1.0.5.bb
index 9e6da4a..7872698 100644
--- a/recipes/bzip2/bzip2-full-native_1.0.5.bb
+++ b/recipes/bzip2/bzip2-full-native_1.0.5.bb
@@ -9,7 +9,7 @@ SRC_URI = "http://www.bzip.org/${PV}/bzip2-${PV}.tar.gz \
 
 S = "${WORKDIR}/bzip2-${PV}"
 
-inherit autotools_stage pkgconfig native
+inherit  pkgconfig native
 
 do_configure_prepend () {
 	if test -f LICENSE ; then sh ./autogen.sh ; fi
diff --git a/recipes/ccrtp/ccrtp_1.7.0.bb b/recipes/ccrtp/ccrtp_1.7.0.bb
index c61dd73..b8a798b 100644
--- a/recipes/ccrtp/ccrtp_1.7.0.bb
+++ b/recipes/ccrtp/ccrtp_1.7.0.bb
@@ -9,7 +9,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/ccrtp/ccrtp-${PV}.tar.gz;name=archive \
 SRC_URI[archive.md5sum] = "eb86cd2ac06af27ea60b1a349122605c"
 SRC_URI[archive.sha256sum] = "923cd26ffc43903ef33704e46fd57f659c3ad01554927fe323635a73082d56ae"
 
-inherit pkgconfig autotools_stage
+inherit pkgconfig
 
 do_configure_prepend () {
         sed -i -e 's#COMMON_LIBPATH=`pkg-config --variable=libdir libccgnu2`#COMMON_LIBPATH=${STAGING_LIBDIR}#' configure.ac
diff --git a/recipes/check/check_0.9.5.bb b/recipes/check/check_0.9.5.bb
index 5328dbd..b6d6f65 100644
--- a/recipes/check/check_0.9.5.bb
+++ b/recipes/check/check_0.9.5.bb
@@ -9,7 +9,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/check/check-${PV}.tar.gz \
            file://configure_fix.patch"
 S = "${WORKDIR}/check-${PV}"
 
-inherit autotools_stage pkgconfig
+inherit  pkgconfig
 
 EXTRA_OECONF += "--enable-plain-docdir"
 
diff --git a/recipes/clutter/clutter-gtk.inc b/recipes/clutter/clutter-gtk.inc
index c2fa28f..6e59cf2 100644
--- a/recipes/clutter/clutter-gtk.inc
+++ b/recipes/clutter/clutter-gtk.inc
@@ -7,5 +7,5 @@ DEPENDS = "gtk+"
 PACKAGES =+ "${PN}-examples"
 FILES_${PN}-examples = "${bindir}/gtk-clutter-test ${bindir}/gtk-clutter-events ${bindir}/gtk-clutter-multistage"
 
-inherit autotools_stage pkgconfig gtk-doc
+inherit  pkgconfig gtk-doc
 
diff --git a/recipes/commoncpp/commoncpp2_1.7.1.bb b/recipes/commoncpp/commoncpp2_1.7.1.bb
index cd0c282..b54ebf3 100644
--- a/recipes/commoncpp/commoncpp2_1.7.1.bb
+++ b/recipes/commoncpp/commoncpp2_1.7.1.bb
@@ -7,7 +7,7 @@ PARALLEL_MAKE = ""
 SRC_URI = "ftp://ftp.gnu.org/gnu/commoncpp/commoncpp2-${PV}.tar.gz \
 	file://configure.ac.patch"
 
-inherit autotools pkgconfig autotools_stage binconfig
+inherit autotools pkgconfig  binconfig
 
 SRC_URI[md5sum] = "e1041356c3129e4d3d3d6a44f281d905"
 SRC_URI[sha256sum] = "cc0a7b96fd103154de70e8abfa5c5e3a6c8b9f5ca88f78aada4885c92ae089ba"
diff --git a/recipes/corosync/corosync_1.2.6.bb b/recipes/corosync/corosync_1.2.6.bb
index 41287a0..f306662 100644
--- a/recipes/corosync/corosync_1.2.6.bb
+++ b/recipes/corosync/corosync_1.2.6.bb
@@ -14,7 +14,7 @@ SRC_URI[md5sum] = "82d91373585f0d48cb98a8599a237e48"
 SRC_URI[sha256sum] = "ad41e3133659a5fb32e878aa85199aba6cc84aa5e0e913b4f6e31c4a4805f9d9"
 
 
-inherit autotools_stage update-rc.d
+inherit  update-rc.d
 
 INITSCRIPT_NAME = "corosync-daemon"
 
diff --git a/recipes/cppunit/cppunit_1.12.1.bb b/recipes/cppunit/cppunit_1.12.1.bb
index e25f5c3..49273b8 100644
--- a/recipes/cppunit/cppunit_1.12.1.bb
+++ b/recipes/cppunit/cppunit_1.12.1.bb
@@ -10,7 +10,7 @@ PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/cppunit/cppunit-${PV}.tar.gz"
 
-inherit autotools_stage binconfig
+inherit  binconfig
 
 CXXFLAGS_powerpc += "-lstdc++"
 
diff --git a/recipes/device-mapper/device-mapper_1.02.28.bb b/recipes/device-mapper/device-mapper_1.02.28.bb
index bd0cbb9..1bfca43 100644
--- a/recipes/device-mapper/device-mapper_1.02.28.bb
+++ b/recipes/device-mapper/device-mapper_1.02.28.bb
@@ -10,7 +10,7 @@ SRC_URI = "ftp://sources.redhat.com/pub/dm/device-mapper.${PV}.tgz \
        file://devmap-mknod-busybox.patch \
 	   file://remove_insanity.patch "
 
-inherit autotools_stage update-rc.d
+inherit  update-rc.d
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
 # The install-script will fail without this.
@@ -27,14 +27,5 @@ do_install_append() {
 
 FILES_${PN}-dev += "${libdir}/ioctl/*.a"
 
-do_stage_append() {
-	install -d ${STAGING_LIBDIR}/pkgconfig/
-	for pc in ${S}/*/*.pc ; do
-		cp $pc ${STAGING_LIBDIR}/pkgconfig/
-		cp $pc ${STAGING_LIBDIR}/pkgconfig/$(echo $(basename $pc) | sed s:lib::g)
-	done
-}
-
-
 SRC_URI[md5sum] = "c9ae0776994a419f9e1ba842164bb626"
 SRC_URI[sha256sum] = "24c7887fe896325a6cdc86b8beeb0d9c2de8b1c4cb20f53c2dc8f90963fc39bf"
diff --git a/recipes/devicekit/devicekit-disks_004.bb b/recipes/devicekit/devicekit-disks_004.bb
index 28ad2a1..92bfcba 100644
--- a/recipes/devicekit/devicekit-disks_004.bb
+++ b/recipes/devicekit/devicekit-disks_004.bb
@@ -5,7 +5,7 @@ DEPENDS = "devicekit zlib sqlite3 policykit parted device-mapper libatasmart ude
 SRC_URI = "http://hal.freedesktop.org/releases/DeviceKit-disks-${PV}.tar.gz"
 S = "${WORKDIR}/DeviceKit-disks-${PV}"
 
-inherit autotools_stage
+
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
 FILES_${PN} += "${datadir}/dbus-1/ \
diff --git a/recipes/efl1/libeflvala_svn.bb b/recipes/efl1/libeflvala_svn.bb
index 9a88054..f7f5090 100644
--- a/recipes/efl1/libeflvala_svn.bb
+++ b/recipes/efl1/libeflvala_svn.bb
@@ -11,7 +11,7 @@ SRCREV = "${EFL_SRCREV}"
 SRC_URI = "svn://svn.enlightenment.org/svn/e/trunk/BINDINGS;module=vala;proto=http"
 S = "${WORKDIR}/vala"
 
-inherit autotools_stage pkgconfig vala
+inherit  pkgconfig vala
 
 PACKAGES =+ "${PN}-examples"
 FILES_${PN}-examples = "${datadir}/libeflvala ${bindir}/*"
diff --git a/recipes/fann/fann_2.0.0.bb b/recipes/fann/fann_2.0.0.bb
index 1fad7a6..913e04e 100644
--- a/recipes/fann/fann_2.0.0.bb
+++ b/recipes/fann/fann_2.0.0.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/fann/fann-${PV}.tar.bz2"
 
-inherit autotools_stage
+
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
diff --git a/recipes/farsight/farsight2_0.0.9.bb b/recipes/farsight/farsight2_0.0.9.bb
index 85ea6c4..7b84f8d 100644
--- a/recipes/farsight/farsight2_0.0.9.bb
+++ b/recipes/farsight/farsight2_0.0.9.bb
@@ -4,7 +4,7 @@ SRC_URI = "http://farsight.freedesktop.org/releases/farsight2/${P}.tar.gz"
 
 DEPENDS = "libnice glib-2.0 libxml2 zlib dbus gstreamer gst-plugins-base"
 
-inherit autotools_stage
+
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
 EXTRA_OECONF = " \
diff --git a/recipes/farsight/libnice_0.0.6.bb b/recipes/farsight/libnice_0.0.6.bb
index 3ec7207..c94aeb2 100644
--- a/recipes/farsight/libnice_0.0.6.bb
+++ b/recipes/farsight/libnice_0.0.6.bb
@@ -5,7 +5,7 @@ SRC_URI = "http://nice.freedesktop.org/releases/libnice-${PV}.tar.gz"
 LICENSE = "LGPL/MPL"
 DEPENDS = "glib-2.0 gstreamer"
 
-inherit autotools_stage
+
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
 FILES_${PN} += "${libdir}/gstreamer-0.10/*.so"
diff --git a/recipes/fltk/fltk2_svn.bb b/recipes/fltk/fltk2_svn.bb
index 97599d7..3007ef5 100644
--- a/recipes/fltk/fltk2_svn.bb
+++ b/recipes/fltk/fltk2_svn.bb
@@ -15,7 +15,7 @@ SRC_URI = "\
 "
 S = "${WORKDIR}/trunk"
 
-inherit autotools_stage binconfig
+inherit  binconfig
 
 EXTRA_OECONF = "\
   --enable-shared \
diff --git a/recipes/fltk/fltk_1.1.10.bb b/recipes/fltk/fltk_1.1.10.bb
index 085d8e6..f462f06 100644
--- a/recipes/fltk/fltk_1.1.10.bb
+++ b/recipes/fltk/fltk_1.1.10.bb
@@ -14,7 +14,7 @@ SRC_URI = "ftp://ftp.rz.tu-bs.de/pub/mirror/ftp.easysw.com/ftp/pub/fltk/${PV}/fl
 
 S = "${WORKDIR}/fltk-${PV}"
 
-inherit lib_package autotools_stage binconfig
+inherit lib_package  binconfig
 
 TARGET_CC_ARCH += "${LDFLAGS} -DXFT_MAJOR=2"
 
diff --git a/recipes/fltk/fltk_1.1.9.bb b/recipes/fltk/fltk_1.1.9.bb
index c52fb5c..1969a36 100644
--- a/recipes/fltk/fltk_1.1.9.bb
+++ b/recipes/fltk/fltk_1.1.9.bb
@@ -12,7 +12,7 @@ SRC_URI = "ftp://ftp.rz.tu-bs.de/pub/mirror/ftp.easysw.com/ftp/pub/fltk/${PV}/fl
 
 S = "${WORKDIR}/fltk-${PV}"
 
-inherit lib_package autotools_stage binconfig
+inherit lib_package  binconfig
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
diff --git a/recipes/freerdp/freerdp.inc b/recipes/freerdp/freerdp.inc
index 97835a8..eef7e98 100644
--- a/recipes/freerdp/freerdp.inc
+++ b/recipes/freerdp/freerdp.inc
@@ -9,6 +9,6 @@ LICENSE = "GPL"
 
 INC_PR = "r1"
 
-inherit pkgconfig autotools_stage
+inherit pkgconfig 
 
 FILES_${PN}-dev += "${libdir}/freerdp/*.a ${libdir}/freerdp/*.la"
diff --git a/recipes/gabriel/gabriel_svn.bb b/recipes/gabriel/gabriel_svn.bb
index 9069915..8766f02 100644
--- a/recipes/gabriel/gabriel_svn.bb
+++ b/recipes/gabriel/gabriel_svn.bb
@@ -11,6 +11,6 @@ PR = "r1"
 SRC_URI = "svn://gabriel.svn.sourceforge.net/svnroot/gabriel;module=gabriel;proto=https"
 S = "${WORKDIR}/gabriel"
 
-inherit autotools_stage
+
 
 RDEPENDS_${PN} = "socat"
diff --git a/recipes/geoclue/geoclue_git.bb b/recipes/geoclue/geoclue_git.bb
index b7950a9..ec0f42f 100644
--- a/recipes/geoclue/geoclue_git.bb
+++ b/recipes/geoclue/geoclue_git.bb
@@ -9,7 +9,7 @@ PR = "r1"
 PR_append = "+gitr${SRCREV}"
 PE = "1"
 
-inherit gnome autotools_stage
+inherit gnome 
 
 SRC_URI = "git://anongit.freedesktop.org/git/geoclue;protocol=git \
            file://gtk-doc.make"
diff --git a/recipes/gnet/gnet_svn.bb b/recipes/gnet/gnet_svn.bb
index 102cb97..dd88d51 100644
--- a/recipes/gnet/gnet_svn.bb
+++ b/recipes/gnet/gnet_svn.bb
@@ -18,4 +18,4 @@ EXTRA_OECONF =	"--disable-pthreads"
 
 FILES_${PN}-dev += "${libdir}/gnet-2.0"
 
-inherit autotools_stage pkgconfig
+inherit  pkgconfig
diff --git a/recipes/gnome/libchamplain-gtk_0.2.8.bb b/recipes/gnome/libchamplain-gtk_0.2.8.bb
index fdad79c..7f1bddc 100644
--- a/recipes/gnome/libchamplain-gtk_0.2.8.bb
+++ b/recipes/gnome/libchamplain-gtk_0.2.8.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Libchamplain is a C library aimed to provide a Gtk+ widget to dis
 LICENSE = "LGPL"
 DEPENDS = "libchamplain clutter-gtk-0.8"
 
-inherit gnome autotools_stage
+inherit gnome 
 
 SRC_URI = "http://libchamplain.pierlux.com/release/${PV}/libchamplain-gtk-${PV}.tar.gz"
 
diff --git a/recipes/gnome/libchamplain_0.2.8.bb b/recipes/gnome/libchamplain_0.2.8.bb
index 098bad4..e2ffcaf 100644
--- a/recipes/gnome/libchamplain_0.2.8.bb
+++ b/recipes/gnome/libchamplain_0.2.8.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Libchamplain is a C library aimed to provide a Gtk+ widget to dis
 LICENSE = "LGPL"
 DEPENDS = "clutter-cairo libsoup-2.4 clutter gtk+"
 
-inherit gnome autotools_stage
+inherit gnome 
 
 SRC_URI = "http://libchamplain.pierlux.com/release/${PV}/libchamplain-${PV}.tar.gz"
 
diff --git a/recipes/gnome/libgdata_0.4.0.bb b/recipes/gnome/libgdata_0.4.0.bb
index a0d5f54..d24317f 100644
--- a/recipes/gnome/libgdata_0.4.0.bb
+++ b/recipes/gnome/libgdata_0.4.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "libgdata is a GLib-based library for accessing online service API
 LICENSE = "LGPL"
 DEPENDS = "libxml2 glib-2.0 libsoup-2.4"
 
-inherit gnome lib_package autotools_stage
+inherit gnome lib_package 
 
 SRC_URI += " \
            file://gtk-doc.make \
diff --git a/recipes/gnome/libgdata_0.5.1.bb b/recipes/gnome/libgdata_0.5.1.bb
index 4c819e9..0eb6b18 100644
--- a/recipes/gnome/libgdata_0.5.1.bb
+++ b/recipes/gnome/libgdata_0.5.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "libgdata is a GLib-based library for accessing online service API
 LICENSE = "LGPL"
 DEPENDS = "libxml2 glib-2.0 libsoup-2.4"
 
-inherit gnome lib_package autotools_stage
+inherit gnome lib_package 
 
 SRC_URI += " \
            file://gtk-doc.make \
diff --git a/recipes/gnome/libproxy_0.2.3.bb b/recipes/gnome/libproxy_0.2.3.bb
index eb8a909..20bf4b0 100644
--- a/recipes/gnome/libproxy_0.2.3.bb
+++ b/recipes/gnome/libproxy_0.2.3.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://libproxy.googlecode.com/files/libproxy-${PV}.tar.gz \
 	   file://libproxy-move-define-__USE_BSD.patch \
 	   "
 
-inherit autotools_stage
+
 
 # Disable plugins that are *up* in the depchain, they need libproxy to build
 # Don't we just love circular deps?
diff --git a/recipes/gnome/libxml++_2.26.0.bb b/recipes/gnome/libxml++_2.26.0.bb
index fd46bfc..ba35b77 100644
--- a/recipes/gnome/libxml++_2.26.0.bb
+++ b/recipes/gnome/libxml++_2.26.0.bb
@@ -2,7 +2,7 @@ LICENSE = "LGPL"
 DESCRIPTION = "C++ bindings for libxml2"
 DEPENDS = "glibmm libxml2"
 
-inherit gnome autotools_stage
+inherit gnome 
 
 FILES_${PN}-dev += "${libdir}/libxml++-2.6/include/libxml++config.h"
 
diff --git a/recipes/gnuradio/gnuradio-libusb-compat.inc b/recipes/gnuradio/gnuradio-libusb-compat.inc
index efe2b88..a68cc4c 100644
--- a/recipes/gnuradio/gnuradio-libusb-compat.inc
+++ b/recipes/gnuradio/gnuradio-libusb-compat.inc
@@ -5,7 +5,7 @@ LICENSE = "GPLv3"
 DEPENDS = "virtual/libusb0 guile-native fftwf python virtual/libsdl alsa-lib jack boost cppunit sdcc-native swig-native python-numpy"
 INC_PR = "r7"
 
-inherit distutils-base autotools autotools_stage pkgconfig
+inherit distutils-base autotools  pkgconfig
 
 export BUILD_SYS
 export HOST_SYS=${MULTIMACH_TARGET_SYS}
@@ -60,7 +60,7 @@ do_configure_append() {
 }
 
 do_stage() {
-	autotools_stage_all
+	_all
 	sed -i s,-l:libusb-gnur.a,,g ${STAGING_LIBDIR}/libusrp.la
 }
 
diff --git a/recipes/gnuradio/gnuradio.inc b/recipes/gnuradio/gnuradio.inc
index 6eaf119..f3c1bd4 100644
--- a/recipes/gnuradio/gnuradio.inc
+++ b/recipes/gnuradio/gnuradio.inc
@@ -5,7 +5,7 @@ LICENSE = "GPLv3"
 DEPENDS = "virtual/libusb0 guile-native fftwf python virtual/libsdl alsa-lib jack boost cppunit sdcc-native swig-native python-numpy"
 INC_PR = "r7"
 
-inherit distutils-base autotools autotools_stage pkgconfig
+inherit distutils-base autotools  pkgconfig
 
 export BUILD_SYS
 export HOST_SYS=${MULTIMACH_TARGET_SYS}
@@ -40,7 +40,7 @@ do_configure_append() {
 }
 
 do_stage() {
-	autotools_stage_all
+	_all
 	sed -i s,-l:libusb-gnur.a,,g ${STAGING_LIBDIR}/libusrp.la
 }
 
diff --git a/recipes/gpsd/gpsd.inc b/recipes/gpsd/gpsd.inc
index fbb867c..4799aba 100644
--- a/recipes/gpsd/gpsd.inc
+++ b/recipes/gpsd/gpsd.inc
@@ -16,7 +16,7 @@ SRC_URI = "http://download.berlios.de/gpsd/gpsd-${PV}.tar.gz;name=gpsd \
            file://gpsd \
            file://60-gpsd.rules"
 			   
-inherit autotools_stage update-rc.d python-dir
+inherit  update-rc.d python-dir
 
 INITSCRIPT_NAME = "gpsd"
 INITSCRIPT_PARAMS = "defaults 35"
diff --git a/recipes/gsoap/gsoap_2.7.13.inc b/recipes/gsoap/gsoap_2.7.13.inc
index a6fbbb5..323a311 100644
--- a/recipes/gsoap/gsoap_2.7.13.inc
+++ b/recipes/gsoap/gsoap_2.7.13.inc
@@ -5,8 +5,6 @@ LICENSE = "GPL"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/gsoap2/gsoap_${PV}.tar.gz"
 
-inherit autotools_stage
-
 S = "${WORKDIR}/gsoap-2.7"
 
 PARALLEL_MAKE = ""
diff --git a/recipes/gsoap/gsoap_2.7.7.bb b/recipes/gsoap/gsoap_2.7.7.bb
index c713211..99227e2 100644
--- a/recipes/gsoap/gsoap_2.7.7.bb
+++ b/recipes/gsoap/gsoap_2.7.7.bb
@@ -9,7 +9,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gsoap2/gsoap_${PV}.tar.gz \
            file://rename_bogus_ldflags.patch"
 S = "${WORKDIR}/gsoap-2.7"
 
-inherit autotools_stage
+
 
 PARALLEL_MAKE = ""
 
diff --git a/recipes/iksemel/iksemel_1.4.bb b/recipes/iksemel/iksemel_1.4.bb
index 6987920..8a7220e 100644
--- a/recipes/iksemel/iksemel_1.4.bb
+++ b/recipes/iksemel/iksemel_1.4.bb
@@ -12,4 +12,4 @@ SRC_URI = "http://iksemel.googlecode.com/files/${P}.tar.gz;name=archive \
 SRC_URI[archive.md5sum] = "532e77181694f87ad5eb59435d11c1ca"
 SRC_URI[archive.sha256sum] = "458c1b8fb3349076a6cecf26c29db1d561315d84e16bfcfba419f327f502e244"
 
-inherit autotools_stage pkgconfig
+inherit  pkgconfig
diff --git a/recipes/imagemagick/imagemagick_6.3.5-10.bb b/recipes/imagemagick/imagemagick_6.3.5-10.bb
index dcbdebe..1ca6170 100644
--- a/recipes/imagemagick/imagemagick_6.3.5-10.bb
+++ b/recipes/imagemagick/imagemagick_6.3.5-10.bb
@@ -15,7 +15,7 @@ IMVER = "6.3.5"
 
 S = "${WORKDIR}/ImageMagick-${IMVER}"
 
-inherit autotools_stage binconfig pkgconfig
+inherit  binconfig pkgconfig
 
 EXTRA_AUTORECONF += "--exclude=libtoolize"
 EXTRA_OECONF = "--without-x --without-freetype --without-perl"
diff --git a/recipes/imagemagick/imagemagick_6.4.4-1.bb b/recipes/imagemagick/imagemagick_6.4.4-1.bb
index 2edf484..a70174c 100644
--- a/recipes/imagemagick/imagemagick_6.4.4-1.bb
+++ b/recipes/imagemagick/imagemagick_6.4.4-1.bb
@@ -14,7 +14,7 @@ IMVER = "6.4.4"
 
 S = "${WORKDIR}/ImageMagick-${IMVER}"
 
-inherit autotools_stage binconfig pkgconfig
+inherit  binconfig pkgconfig
 
 EXTRA_AUTORECONF += "--exclude=libtoolize"
 EXTRA_OECONF = "--program-prefix= --without-x --without-freetype --without-perl --disable-openmp"
diff --git a/recipes/iphone/apple-csu_0.30.bb b/recipes/iphone/apple-csu_0.30.bb
index 86be6fc..25dd94f 100644
--- a/recipes/iphone/apple-csu_0.30.bb
+++ b/recipes/iphone/apple-csu_0.30.bb
@@ -8,4 +8,4 @@ SRC_URI = "svn://iphone-dev.googlecode.com/svn/trunk;proto=http;module=csu"
 
 S = "${WORKDIR}/csu"
 
-inherit autotools_stage
+
diff --git a/recipes/iso-codes/iso-codes_1.4.bb b/recipes/iso-codes/iso-codes_1.4.bb
index 0c8a969..0cf0f09 100644
--- a/recipes/iso-codes/iso-codes_1.4.bb
+++ b/recipes/iso-codes/iso-codes_1.4.bb
@@ -3,7 +3,7 @@ PACKAGE_ARCH = "all"
 SRC_URI = "ftp://pkg-isocodes.alioth.debian.org/pub/pkg-isocodes/iso-codes-${PV}.tar.bz2"
 PR = "r2"
 
-inherit autotools_stage
+
 
 FILES_${PN} += "${datadir}/xml/"
 
diff --git a/recipes/lame/lame_3.98.2.bb b/recipes/lame/lame_3.98.2.bb
index e9aabaa..4e7700b 100644
--- a/recipes/lame/lame_3.98.2.bb
+++ b/recipes/lame/lame_3.98.2.bb
@@ -8,7 +8,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${PN}/${PN}-398-2.tar.gz \
 	file://no-gtk1.patch \
 	file://ldflags-qa.patch"
 
-inherit autotools_stage
+
 
 PACKAGES += "libmp3lame libmp3lame-dev"
 FILES_${PN} = "${bindir}/lame"
diff --git a/recipes/libdaemon/libdaemon_0.13.bb b/recipes/libdaemon/libdaemon_0.13.bb
index 59e65ac..78bbcd1 100644
--- a/recipes/libdaemon/libdaemon_0.13.bb
+++ b/recipes/libdaemon/libdaemon_0.13.bb
@@ -7,7 +7,7 @@ PR = "r0"
 
 SRC_URI = "http://0pointer.de/lennart/projects/libdaemon/libdaemon-${PV}.tar.gz"
 
-inherit autotools_stage pkgconfig
+inherit  pkgconfig
 
 EXTRA_OECONF = "--disable-lynx --disable-doxygen"
 
diff --git a/recipes/libdlo/libdlo_git.bb b/recipes/libdlo/libdlo_git.bb
index 290dcf1..41bd06c 100644
--- a/recipes/libdlo/libdlo_git.bb
+++ b/recipes/libdlo/libdlo_git.bb
@@ -8,7 +8,7 @@ PR_append = "+gitr${SRCREV}"
 SRC_URI = "git://anongit.freedesktop.org/libdlo;protocol=git"
 S = "${WORKDIR}/git"
 
-inherit lib_package autotools_stage
+inherit lib_package 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
 do_configure_prepend() {
diff --git a/recipes/libfribidi/fribidi_0.19.2.bb b/recipes/libfribidi/fribidi_0.19.2.bb
index 652910c..01acb21 100644
--- a/recipes/libfribidi/fribidi_0.19.2.bb
+++ b/recipes/libfribidi/fribidi_0.19.2.bb
@@ -8,7 +8,7 @@ PROVIDES = "libfribidi"
 DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_angstrom = "1"
 
-inherit autotools_stage lib_package pkgconfig
+inherit  lib_package pkgconfig
 
 CFLAGS_append = "  -DPAGE_SIZE=4096 "
 
diff --git a/recipes/libgc/libgc_7.1.bb b/recipes/libgc/libgc_7.1.bb
index 9ab47e4..118478d 100644
--- a/recipes/libgc/libgc_7.1.bb
+++ b/recipes/libgc/libgc_7.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE	= "http://www.hpl.hp.com/personal/Hans_Boehm/gc/"
 
 SRC_URI 	= "http://www.hpl.hp.com/personal/Hans_Boehm/gc/gc_source/gc-${PV}.tar.gz"
 
-inherit autotools_stage
+
 
 S = "${WORKDIR}/gc-${PV}"
 
diff --git a/recipes/libgmime/gmime_2.4.10.bb b/recipes/libgmime/gmime_2.4.10.bb
index a70609d..463774a 100644
--- a/recipes/libgmime/gmime_2.4.10.bb
+++ b/recipes/libgmime/gmime_2.4.10.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 PRIORITY = "optional"
 DEPENDS = "glib-2.0 zlib"
 
-inherit gnome autotools_stage lib_package binconfig
+inherit gnome  lib_package binconfig
 
 SRC_URI += " \
            file://iconv-detect.h \
diff --git a/recipes/libgmime/libgmime_2.2.23.bb b/recipes/libgmime/libgmime_2.2.23.bb
index 2e2db3d..fb06ea1 100644
--- a/recipes/libgmime/libgmime_2.2.23.bb
+++ b/recipes/libgmime/libgmime_2.2.23.bb
@@ -9,7 +9,7 @@ SRC_URI = "http://ftp.acc.umu.se/pub/GNOME/sources/gmime/2.2/gmime-${PV}.tar.bz2
 EXTRA_OECONF += "--disable-mono"
 S = "${WORKDIR}/gmime-${PV}"
 
-inherit autotools_stage lib_package binconfig
+inherit  lib_package binconfig
 
 export ac_cv_have_iconv_detect_h=yes
 do_configure_append = "cp ${WORKDIR}/iconv-detect.h ${S}"
diff --git a/recipes/liblinebreak/liblinebreak_1.2.bb b/recipes/liblinebreak/liblinebreak_1.2.bb
index 48d5140..15cf6de 100644
--- a/recipes/liblinebreak/liblinebreak_1.2.bb
+++ b/recipes/liblinebreak/liblinebreak_1.2.bb
@@ -6,7 +6,7 @@ LICENSE = "zlib"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/vimgadgets/liblinebreak/${PV}/liblinebreak-${PV}.tar.gz"
 
-inherit autotools_stage
+
 
 SRC_URI[md5sum] = "d18039259001ccb24b5dd4648c49c5ad"
 SRC_URI[sha256sum] = "9efcb0cb1afc75ad1e92d2b2dbf4d9c77b072d6656c5f1a150af8b718d0c7b76"
diff --git a/recipes/libnetfilter/libnetfilter-conntrack_0.0.101.bb b/recipes/libnetfilter/libnetfilter-conntrack_0.0.101.bb
index 61cee92..bd84244 100644
--- a/recipes/libnetfilter/libnetfilter-conntrack_0.0.101.bb
+++ b/recipes/libnetfilter/libnetfilter-conntrack_0.0.101.bb
@@ -8,4 +8,4 @@ SRC_URI[tar.sha256sum] = "9d2919df3794e1e8f2311ad31949698103061206379b75094cb2bf
 
 S = "${WORKDIR}/libnetfilter_conntrack-${PV}"
 
-inherit autotools_stage pkgconfig
+inherit  pkgconfig
diff --git a/recipes/libnfnetlink/libnfnetlink.inc b/recipes/libnfnetlink/libnfnetlink.inc
index 035f1fe..7a765ea 100644
--- a/recipes/libnfnetlink/libnfnetlink.inc
+++ b/recipes/libnfnetlink/libnfnetlink.inc
@@ -11,5 +11,5 @@ INC_PR = "r0"
 
 SRC_URI = "http://www.netfilter.org/projects/libnfnetlink/files/libnfnetlink-${PV}.tar.bz2;name=libnfnetlink-${PV}"
 
-inherit autotools_stage pkgconfig
+inherit  pkgconfig
 
diff --git a/recipes/libpar2/libpar2_0.2.bb b/recipes/libpar2/libpar2_0.2.bb
index 9efde2a..6fe92bb 100644
--- a/recipes/libpar2/libpar2_0.2.bb
+++ b/recipes/libpar2/libpar2_0.2.bb
@@ -7,7 +7,7 @@ DEPENDS = "libsigc++-2.0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/parchive/libpar2/libpar2-${PV}.tar.gz"
 
-inherit autotools_stage pkgconfig
+inherit  pkgconfig
 
 SRC_URI[md5sum] = "94c6df4e38efe08056ecde2a04e0be91"
 SRC_URI[sha256sum] = "074fbf840f73b1e13e0405fce261078c81c8c0a4859e30a7bba10510f9199908"
diff --git a/recipes/librsvg/librsvg-native_2.26.0.bb b/recipes/librsvg/librsvg-native_2.26.0.bb
index 879980f..d8f7d63 100644
--- a/recipes/librsvg/librsvg-native_2.26.0.bb
+++ b/recipes/librsvg/librsvg-native_2.26.0.bb
@@ -4,7 +4,7 @@ DEPENDS = "cairo-native pango-native gdk-pixbuf-csource-native"
 LICENSE = "LGPL"
 PR = "r1"
 
-inherit native autotools_stage
+inherit native 
 
 SRC_URI = "${GNOME_MIRROR}/librsvg/2.26/librsvg-${PV}.tar.bz2"
 
diff --git a/recipes/libsdl/libsdl-mixer_1.2.10.bb b/recipes/libsdl/libsdl-mixer_1.2.10.bb
index 44b5a09..aa41da3 100644
--- a/recipes/libsdl/libsdl-mixer_1.2.10.bb
+++ b/recipes/libsdl/libsdl-mixer_1.2.10.bb
@@ -9,7 +9,7 @@ S = "${WORKDIR}/SDL_mixer-${PV}"
 
 export SDL_CONFIG = "${STAGING_BINDIR_CROSS}/sdl-config"
 
-inherit autotools_stage
+
 
 EXTRA_OECONF = "--disable-music-mp3"
 # although we build smpeg... need to find out how
diff --git a/recipes/libsdl/libsdl-mixer_1.2.11.bb b/recipes/libsdl/libsdl-mixer_1.2.11.bb
index 2217ef2..70b537e 100644
--- a/recipes/libsdl/libsdl-mixer_1.2.11.bb
+++ b/recipes/libsdl/libsdl-mixer_1.2.11.bb
@@ -13,7 +13,7 @@ S = "${WORKDIR}/SDL_mixer-${PV}"
 
 export SDL_CONFIG = "${STAGING_BINDIR_CROSS}/sdl-config"
 
-inherit autotools_stage
+
 
 # Although we build SMPEG lets not use it as it is pointless in the embedded space.
 
diff --git a/recipes/libsdl/libsdl-mixer_1.2.8.bb b/recipes/libsdl/libsdl-mixer_1.2.8.bb
index 9d5a8df..18d0eb7 100644
--- a/recipes/libsdl/libsdl-mixer_1.2.8.bb
+++ b/recipes/libsdl/libsdl-mixer_1.2.8.bb
@@ -11,7 +11,7 @@ S = "${WORKDIR}/SDL_mixer-${PV}"
 
 export SDL_CONFIG = "${STAGING_BINDIR_CROSS}/sdl-config"
 
-inherit autotools_stage
+
 
 EXTRA_OECONF = "--disable-music-mp3"
 # although we build smpeg... need to find out how
diff --git a/recipes/libsidplay/libsidplay_1.36.59.bb b/recipes/libsidplay/libsidplay_1.36.59.bb
index b7007f9..4e99210 100644
--- a/recipes/libsidplay/libsidplay_1.36.59.bb
+++ b/recipes/libsidplay/libsidplay_1.36.59.bb
@@ -9,7 +9,7 @@ SRC_URI = "\
   http://ftp.debian.org/debian/pool/main/libs/libsidplay/libsidplay_1.36.59-5.diff.gz;name=patch \
 "
 
-inherit autotools_stage
+
 
 SRC_URI[archive.md5sum] = "37c51ba4bd57164b1b0bb7b43b9adece"
 SRC_URI[archive.sha256sum] = "3da9b38d4eb5bf9e936b9604ba92da0594ef38047d50cf806a8e11c400008024"
diff --git a/recipes/libsndfile/libsndfile1_1.0.21.bb b/recipes/libsndfile/libsndfile1_1.0.21.bb
index 05fcea8..e14dea2 100644
--- a/recipes/libsndfile/libsndfile1_1.0.21.bb
+++ b/recipes/libsndfile/libsndfile1_1.0.21.bb
@@ -12,7 +12,7 @@ SRC_URI[libsndfile1021targz.sha256sum] = "7e9083a2551ff347276d82cdb61f2b4f9cd137
 
 S = "${WORKDIR}/libsndfile-${PV}"
 
-inherit autotools_stage  lib_package pkgconfig
+inherit   lib_package pkgconfig
 
 do_configure_prepend_arm() {
 	ac_cv_sizeof_off_t=8
diff --git a/recipes/libsynthesis/libsynthesis_git.bb b/recipes/libsynthesis/libsynthesis_git.bb
index a72219c..d5d57f6 100644
--- a/recipes/libsynthesis/libsynthesis_git.bb
+++ b/recipes/libsynthesis/libsynthesis_git.bb
@@ -9,7 +9,7 @@ DEPENDS = "libpcre"
 
 S = "${WORKDIR}/git"
 
-inherit autotools_stage
+
 
 do_configure_prepend () {
 	cd ${S}/src
diff --git a/recipes/libusb/libusb-compat_0.1.2.bb b/recipes/libusb/libusb-compat_0.1.2.bb
index 236af3c..c6cc33d 100644
--- a/recipes/libusb/libusb-compat_0.1.2.bb
+++ b/recipes/libusb/libusb-compat_0.1.2.bb
@@ -11,7 +11,7 @@ DEPENDS = "libusb1"
 SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/${P}.tar.bz2"
 SRC_URI_append_nylon = " file://gcc-3-compatibility.patch"
 
-inherit autotools_stage binconfig lib_package
+inherit  binconfig lib_package
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 EXTRA_OECONF = "--disable-build-docs"
diff --git a/recipes/libusb/libusb-compat_0.1.3.bb b/recipes/libusb/libusb-compat_0.1.3.bb
index 25893c4..a8af245 100644
--- a/recipes/libusb/libusb-compat_0.1.3.bb
+++ b/recipes/libusb/libusb-compat_0.1.3.bb
@@ -14,7 +14,7 @@ SRC_URI[libusbcompat013tarbz2.sha256sum] = "a590a03b6188030ee1ca1a0af55685fcde00
 
 SRC_URI_append_nylon = " file://gcc-3-compatibility.patch"
 
-inherit autotools_stage binconfig lib_package
+inherit  binconfig lib_package
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 EXTRA_OECONF = "--disable-build-docs"
diff --git a/recipes/libusb/libusb1_1.0.2.bb b/recipes/libusb/libusb1_1.0.2.bb
index 0001e42..549ca8b 100644
--- a/recipes/libusb/libusb1_1.0.2.bb
+++ b/recipes/libusb/libusb1_1.0.2.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPLv2.1"
 SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2"
 S = "${WORKDIR}/libusb-${PV}"
 
-inherit autotools_stage
+
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 EXTRA_OECONF = "--disable-build-docs"
diff --git a/recipes/libwmf/libwmf_0.2.8.4.bb b/recipes/libwmf/libwmf_0.2.8.4.bb
index 889fcd4..246c5c3 100644
--- a/recipes/libwmf/libwmf_0.2.8.4.bb
+++ b/recipes/libwmf/libwmf_0.2.8.4.bb
@@ -1,4 +1,4 @@
-inherit autotools_stage
+
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/wvware/${PN}/${PV}/${P}.tar.gz;name=tarball \
            file://libwmf-0.2.8.4-intoverflow.patch                   \
diff --git a/recipes/libzrtpcpp/libzrtpcpp_1.4.6.bb b/recipes/libzrtpcpp/libzrtpcpp_1.4.6.bb
index 2d3d8d8..ada5023 100644
--- a/recipes/libzrtpcpp/libzrtpcpp_1.4.6.bb
+++ b/recipes/libzrtpcpp/libzrtpcpp_1.4.6.bb
@@ -7,4 +7,4 @@ SRC_URI = "http://www.gnutelephony.org/dist/tarballs/libzrtpcpp-${PV}.tar.gz"
 SRC_URI[md5sum] = "83157d4eba394d27b06b7ec753fe31de"
 SRC_URI[sha256sum] = "1ea5ce5a283095a7bf2fe491a8a7571ef21b3dbe6cf815d3df76e6de1e811dba"
 
-inherit pkgconfig autotools_stage
+inherit pkgconfig 
diff --git a/recipes/linux-ha/cluster-glue_1.0.5.bb b/recipes/linux-ha/cluster-glue_1.0.5.bb
index 23fb5bb..a6e98be 100644
--- a/recipes/linux-ha/cluster-glue_1.0.5.bb
+++ b/recipes/linux-ha/cluster-glue_1.0.5.bb
@@ -17,7 +17,7 @@ SRC_URI_append_libc-uclibc = " file://kill-stack-protector.patch"
 SRC_URI[tar.md5sum] = "09721e2d2ab3c3fa6696b4347e31721a"
 SRC_URI[tar.sha256sum] = "c437a04494850b79c094f7e84d396e917ec09d9a2fdfb7c11f3b420741ea91a2"
 
-inherit autotools_stage
+
 
 S = "${WORKDIR}/Reusable-Cluster-Components-glue-${PV}"
 
diff --git a/recipes/linux-ha/cluster-resource-agents_1.0.3.bb b/recipes/linux-ha/cluster-resource-agents_1.0.3.bb
index d1736ff..17c0a9a 100644
--- a/recipes/linux-ha/cluster-resource-agents_1.0.3.bb
+++ b/recipes/linux-ha/cluster-resource-agents_1.0.3.bb
@@ -13,7 +13,7 @@ SRC_URI_append_libc-uclibc = " file://kill-stack-protector.patch"
 SRC_URI[tar.md5sum] = "fcaa2cfd83a28d1965200e11db2ddd41"
 SRC_URI[tar.sha256sum] = "09b58332e34cf128c8d53d5bb4b3f61e402c2e0c0c809f5abae53ca144ad101e"
 
-inherit autotools_stage
+
 
 S = "${WORKDIR}/Cluster-Resource-Agents-agents-${PV}"
 
diff --git a/recipes/lowpan-tools/lowpan-tools.inc b/recipes/lowpan-tools/lowpan-tools.inc
index 6afcc9c..089caa8 100644
--- a/recipes/lowpan-tools/lowpan-tools.inc
+++ b/recipes/lowpan-tools/lowpan-tools.inc
@@ -17,4 +17,4 @@ RDEPENDS_${PN}-tests += "${PN} python-core"
 
 EXTRA_OECONF = "--disable-manpages"
 
-inherit autotools_stage python-dir
+inherit  python-dir
diff --git a/recipes/mamona/mamona-input-methods_git.bb b/recipes/mamona/mamona-input-methods_git.bb
index a2054cc..0119b0b 100644
--- a/recipes/mamona/mamona-input-methods_git.bb
+++ b/recipes/mamona/mamona-input-methods_git.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://dev.openbossa.org/mamona/projects/mamona_input_methods.git;prot
 
 S = "${WORKDIR}/git"
 
-inherit autotools_stage pkgconfig lib_package
+inherit  pkgconfig lib_package
 
 EXTRA_OECONF = "\
         --enable-ecore-im \
diff --git a/recipes/matchbox2/matchbox-desktop-2_svn.bb b/recipes/matchbox2/matchbox-desktop-2_svn.bb
index 12ff8ac..f2200c4 100644
--- a/recipes/matchbox2/matchbox-desktop-2_svn.bb
+++ b/recipes/matchbox2/matchbox-desktop-2_svn.bb
@@ -7,7 +7,7 @@ SRCREV = "2096"
 PV = "2.0+svnr${SRCPV}"
 PR = "r2"
 
-inherit autotools_stage pkgconfig
+inherit  pkgconfig
 
 SRC_URI = "svn://svn.o-hand.com/repos/matchbox/trunk;module=${PN};proto=http \
 	   file://fallback-folder.patch;striplevel=0 \
diff --git a/recipes/matchbox2/matchbox-panel-2_svn.bb b/recipes/matchbox2/matchbox-panel-2_svn.bb
index 36a6c0f..6f70b0b 100644
--- a/recipes/matchbox2/matchbox-panel-2_svn.bb
+++ b/recipes/matchbox2/matchbox-panel-2_svn.bb
@@ -10,7 +10,7 @@ SRCREV = "2098"
 PV = "2.0+svnr${SRCPV}"
 PR = "r1"
 
-inherit autotools_stage pkgconfig
+inherit  pkgconfig
 
 SRC_URI = "svn://svn.o-hand.com/repos/matchbox/trunk;module=${PN};proto=http \
 	   file://scaling-image-double-free.patch;striplevel=0 \
diff --git a/recipes/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/recipes/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
index eb7d19c..4300f1f 100644
--- a/recipes/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
+++ b/recipes/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
@@ -9,4 +9,4 @@ PR = "r0"
 SRC_URI = "git://git.gnome.org/mobile-broadband-provider-info;protocol=git"
 S = "${WORKDIR}/git"
 
-inherit autotools_stage
+
diff --git a/recipes/moblin/bickley_git.bb b/recipes/moblin/bickley_git.bb
index 731339a..394c0b8 100644
--- a/recipes/moblin/bickley_git.bb
+++ b/recipes/moblin/bickley_git.bb
@@ -11,7 +11,7 @@ S = "${WORKDIR}/git"
 
 FILES_${PN} =+ "${datadir}/dbus-1/services/"
 
-inherit autotools_stage
+
 
 do_compile_prepend() {
 	sed -i -e '/#  warn /d' src/bkl-investigator.c
diff --git a/recipes/moblin/bognor-regis_git.bb b/recipes/moblin/bognor-regis_git.bb
index eae1b86..42ebc79 100644
--- a/recipes/moblin/bognor-regis_git.bb
+++ b/recipes/moblin/bognor-regis_git.bb
@@ -9,7 +9,7 @@ DEPENDS = "dbus-glib gstreamer glib-2.0"
 SRC_URI = "git://git.moblin.org/${PN}.git;protocol=git"
 S = "${WORKDIR}/git"
 
-inherit autotools_stage
+
 
 FILES_${PN} =+ "${datadir}/dbus-1/services/"
 
diff --git a/recipes/moblin/hornsey_git.bb b/recipes/moblin/hornsey_git.bb
index 6b1eb03..0c66278 100644
--- a/recipes/moblin/hornsey_git.bb
+++ b/recipes/moblin/hornsey_git.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://git.moblin.org/${PN}.git;protocol=git \
 "
 S = "${WORKDIR}/git"
 
-inherit autotools_stage
+
 
 FILES_${PN} += "${datadir}/icons"
 
diff --git a/recipes/moblin/json-glib_0.6.2.bb b/recipes/moblin/json-glib_0.6.2.bb
index a1355c9..f1cdf64 100644
--- a/recipes/moblin/json-glib_0.6.2.bb
+++ b/recipes/moblin/json-glib_0.6.2.bb
@@ -4,7 +4,7 @@ PR = "r0"
 
 DEPENDS = "glib-2.0"
 
-inherit autotools_stage
+
 
 SRC_URI[md5sum] = "d98f5580035ad0b37fa11896053a57af"
 SRC_URI[sha256sum] = "7befca7f7d7d65cbb260eacd86eff2c1dcae8d859ae2c3e3002e2536d02b2c49"
diff --git a/recipes/moblin/json-glib_git.bb b/recipes/moblin/json-glib_git.bb
index 8566458..1071e49 100644
--- a/recipes/moblin/json-glib_git.bb
+++ b/recipes/moblin/json-glib_git.bb
@@ -7,7 +7,7 @@ S = "${WORKDIR}/git"
 
 DEPENDS = "glib-2.0"
 
-inherit autotools_stage
+
 
 acpaths = "-I ${S}/build/autotools "
 
diff --git a/recipes/moblin/libccss_git.bb b/recipes/moblin/libccss_git.bb
index e622d9f..13111f4 100644
--- a/recipes/moblin/libccss_git.bb
+++ b/recipes/moblin/libccss_git.bb
@@ -6,7 +6,7 @@ DEPENDS = "glib-2.0 cairo librsvg libsoup-2.4"
 
 S = "${WORKDIR}/git"
 
-inherit autotools_stage
+
 
 do_configure_prepend () {
 	echo "EXTRA_DIST=" > ${S}/gtk-doc.make
diff --git a/recipes/moblin/librest_git.bb b/recipes/moblin/librest_git.bb
index 0576c0d..bca70c7 100644
--- a/recipes/moblin/librest_git.bb
+++ b/recipes/moblin/librest_git.bb
@@ -8,7 +8,7 @@ DEPENDS = "libsoup-2.4"
 
 S = "${WORKDIR}/git"
 
-inherit autotools_stage
+
 
 do_configure_prepend () {
 	echo "EXTRA_DIST=" > ${S}/gtk-doc.make
diff --git a/recipes/moblin/moblin-menus_git.bb b/recipes/moblin/moblin-menus_git.bb
index b61ef2d..ccaae1c 100644
--- a/recipes/moblin/moblin-menus_git.bb
+++ b/recipes/moblin/moblin-menus_git.bb
@@ -8,4 +8,4 @@ S = "${WORKDIR}/git"
 
 FILES_${PN} += "${datadir}/desktop-directories/*"
 
-inherit autotools_stage
+
diff --git a/recipes/moblin/mojito_git.bb b/recipes/moblin/mojito_git.bb
index f9104a9..db72d17 100644
--- a/recipes/moblin/mojito_git.bb
+++ b/recipes/moblin/mojito_git.bb
@@ -7,7 +7,7 @@ DEPENDS = "libsoup-2.4 gconf librest glib-2.0 twitter-glib sqlite3 gnome-keyring
 
 S = "${WORKDIR}/git"
 
-inherit autotools_stage
+
 
 FILES_${PN} += "${datadir}/dbus-1/services"
 FILES_${PN}-dbg += "${libdir}/mojito/sources/.debug/* ${libdir}/mojito/services/.debug/"
diff --git a/recipes/moblin/nbtk_git.bb b/recipes/moblin/nbtk_git.bb
index 0c0281d..91fabd9 100644
--- a/recipes/moblin/nbtk_git.bb
+++ b/recipes/moblin/nbtk_git.bb
@@ -10,7 +10,7 @@ DEPENDS = "glib-2.0 gtk+ libccss clutter-0.9"
 SRC_URI = "git://git.moblin.org/${PN}.git;protocol=git"
 S = "${WORKDIR}/git"
 
-inherit autotools_stage
+
 
 do_configure_prepend () {
     echo "EXTRA_DIST=" > ${S}/gtk-doc.make
diff --git a/recipes/moblin/twitter-glib_git.bb b/recipes/moblin/twitter-glib_git.bb
index 9458f16..9fd16f8 100644
--- a/recipes/moblin/twitter-glib_git.bb
+++ b/recipes/moblin/twitter-glib_git.bb
@@ -9,7 +9,7 @@ S = "${WORKDIR}/git"
 
 EXTRA_OECONF = "--disable-shave --disable-introspection"
 
-inherit autotools_stage
+
 
 do_configure_prepend () {
 	 echo "EXTRA_DIST=" > ${S}/gtk-doc.make
diff --git a/recipes/musicpd/libmpd_0.17.96.bb b/recipes/musicpd/libmpd_0.17.96.bb
index c300449..25f9339 100644
--- a/recipes/musicpd/libmpd_0.17.96.bb
+++ b/recipes/musicpd/libmpd_0.17.96.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/musicpd/libmpd-${PV}.tar.gz"
 
-inherit autotools_stage
+
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
diff --git a/recipes/mux/mux_git.bb b/recipes/mux/mux_git.bb
index 068fb4b..0f65246 100644
--- a/recipes/mux/mux_git.bb
+++ b/recipes/mux/mux_git.bb
@@ -11,4 +11,4 @@ S = "${WORKDIR}/git"
 
 DEPENDS = "gtk+"
 
-inherit autotools_stage
+
diff --git a/recipes/nzbget/nzbget.inc b/recipes/nzbget/nzbget.inc
index 93dcfea..c71322c 100644
--- a/recipes/nzbget/nzbget.inc
+++ b/recipes/nzbget/nzbget.inc
@@ -8,7 +8,7 @@ INC_PR = "r0"
 SRC_URI = "${SOURCEFORGE_MIRROR}/nzbget/nzbget-stable/nzbget-${PV}.tar.gz"
 S = "${WORKDIR}/nzbget-${PV}"
 
-inherit autotools_stage pkgconfig
+inherit  pkgconfig
 
 EXTRA_OECONF = "\
 	--disable-tls \
diff --git a/recipes/obexftp/obexftp_0.23.bb b/recipes/obexftp/obexftp_0.23.bb
index 63ec0e2..037f3c9 100644
--- a/recipes/obexftp/obexftp_0.23.bb
+++ b/recipes/obexftp/obexftp_0.23.bb
@@ -8,7 +8,7 @@ PR = "r1"
 SRC_URI = "${SOURCEFORGE_MIRROR}/openobex/obexftp-${PV}.tar.bz2 \
 	  "
 
-inherit autotools_stage
+
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
 EXTRA_OECONF += "--enable-bluetooth \
diff --git a/recipes/obsolete/pixman/pixman_0.17.6.bb b/recipes/obsolete/pixman/pixman_0.17.6.bb
index 771b779..07734f6 100644
--- a/recipes/obsolete/pixman/pixman_0.17.6.bb
+++ b/recipes/obsolete/pixman/pixman_0.17.6.bb
@@ -21,7 +21,7 @@ SRC_URI = "http://cairographics.org/releases/pixman-${PV}.tar.gz;name=archive \
 SRC_URI[archive.md5sum] = "32cbdf7a1ac1c275ee56230e26701456"
 SRC_URI[archive.sha256sum] = "14ea5a185d8ea6ce3203ff008279e3f3433b6a5bad5853b42a82978527e618cb"
 
-inherit autotools_stage
+
 
 NEON = " --disable-arm-neon "
 NEON_armv7a = ""
diff --git a/recipes/obsolete/shr/libframeworkd-phonegui-efl2_git.bb b/recipes/obsolete/shr/libframeworkd-phonegui-efl2_git.bb
index 302c58f..d7ac0a1 100644
--- a/recipes/obsolete/shr/libframeworkd-phonegui-efl2_git.bb
+++ b/recipes/obsolete/shr/libframeworkd-phonegui-efl2_git.bb
@@ -8,7 +8,7 @@ SRCREV = "917226025c67b75def91e98ea923c2e550474a5b"
 SRC_URI = "git://shr.bearstech.com/repo/libframeworkd-phonegui-efl2.git;protocol=http;branch=master"
 S = "${WORKDIR}/git"
 
-inherit pkgconfig autotools autotools_stage
+inherit pkgconfig autotools 
 
 EXTRA_OECONF = "--with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc"
 
diff --git a/recipes/obsolete/shr/libframeworkd-phonegui-efl_git.bb b/recipes/obsolete/shr/libframeworkd-phonegui-efl_git.bb
index c75eaab..1eccc38 100644
--- a/recipes/obsolete/shr/libframeworkd-phonegui-efl_git.bb
+++ b/recipes/obsolete/shr/libframeworkd-phonegui-efl_git.bb
@@ -8,7 +8,7 @@ PR = "r36"
 
 require libframeworkd-phonegui-efl-theme.inc
 
-inherit pkgconfig autotools autotools_stage
+inherit pkgconfig autotools 
 
 SRCREV = "9d7ca1cecb93022e5b890cd87756ac6f072710ca"
 SRC_URI = "git://git.shr-project.org/repo/shr.git;protocol=http;branch=master"
diff --git a/recipes/obsolete/shr/libframeworkd-phonegui_git.bb b/recipes/obsolete/shr/libframeworkd-phonegui_git.bb
index 29d22a9..4cb2348 100644
--- a/recipes/obsolete/shr/libframeworkd-phonegui_git.bb
+++ b/recipes/obsolete/shr/libframeworkd-phonegui_git.bb
@@ -7,7 +7,7 @@ PR = "r10"
 
 DEPENDS="glib-2.0 dbus-glib libframeworkd-glib libphone-utils"
 
-inherit pkgconfig autotools autotools_stage
+inherit pkgconfig autotools 
 
 SRCREV = "9d7ca1cecb93022e5b890cd87756ac6f072710ca"
 SRC_URI = "git://git.shr-project.org/repo/shr.git;protocol=http;branch=master"
diff --git a/recipes/ogre/ogre-egl_svn.bb b/recipes/ogre/ogre-egl_svn.bb
index d002687..57c26e8 100644
--- a/recipes/ogre/ogre-egl_svn.bb
+++ b/recipes/ogre/ogre-egl_svn.bb
@@ -11,7 +11,7 @@ SRC_URI = "svn://ogre.svn.sourceforge.net/svnroot/ogre;module=trunk;proto=https
            file://ogre-egl-update.diff;striplevel=0 \
           "
 
-inherit autotools_stage siteinfo
+inherit  siteinfo
 
 # This is the EGL version
 EXTRA_OECONF = " --with-gui=gtk --disable-freetypetest --enable-ogre-demos --with-allocator=std --enable-threading=no --disable-cg --enable-gles "
diff --git a/recipes/openais/openais_1.1.3.bb b/recipes/openais/openais_1.1.3.bb
index 84d2203..dccc525 100644
--- a/recipes/openais/openais_1.1.3.bb
+++ b/recipes/openais/openais_1.1.3.bb
@@ -9,6 +9,6 @@ SRC_URI = " \
 SRC_URI[md5sum] = "13d8d590f806fb396d750b086c6c0b78"
 SRC_URI[sha256sum] = "eeef58dd2df3eb16ba68b3fbdc6f0d4dfb537443f1c091ec6f0431594f2f00b6"
 
-inherit autotools_stage
+
 
 FILES_${PN}-dbg += "${libexecdir}/lcrso/.debug"
diff --git a/recipes/openmax/libomxil-bellagio_0.9.1.bb b/recipes/openmax/libomxil-bellagio_0.9.1.bb
index 3e8dc86..2bf8195 100644
--- a/recipes/openmax/libomxil-bellagio_0.9.1.bb
+++ b/recipes/openmax/libomxil-bellagio_0.9.1.bb
@@ -7,7 +7,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/omxil/${PN}-${PV}.tar.gz"
 
 PR = "r1"
 
-inherit autotools_stage
+
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
diff --git a/recipes/openmax/libomxil-bellagio_0.9.2.bb b/recipes/openmax/libomxil-bellagio_0.9.2.bb
index a38bd99..82b16b0 100644
--- a/recipes/openmax/libomxil-bellagio_0.9.2.bb
+++ b/recipes/openmax/libomxil-bellagio_0.9.2.bb
@@ -7,7 +7,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/omxil/${PN}-${PV}.tar.gz"
 
 PR = "r1"
 
-inherit autotools_stage
+
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
diff --git a/recipes/openmoko2/libjana_svn.bb b/recipes/openmoko2/libjana_svn.bb
index 6ba1760..d837cc7 100644
--- a/recipes/openmoko2/libjana_svn.bb
+++ b/recipes/openmoko2/libjana_svn.bb
@@ -5,7 +5,7 @@ SRCREV = "749"
 PV = "0.1.0+svnr${SRCPV}"
 PR = "r5"
 
-inherit autotools_stage pkgconfig lib_package
+inherit  pkgconfig lib_package
 
 SRC_URI = "svn://svn.gnome.org/svn/jana/;module=trunk;proto=http"
 S = "${WORKDIR}/trunk/"
diff --git a/recipes/openobex/openobex_1.5.bb b/recipes/openobex/openobex_1.5.bb
index fa08df7..8950f09 100644
--- a/recipes/openobex/openobex_1.5.bb
+++ b/recipes/openobex/openobex_1.5.bb
@@ -11,14 +11,14 @@ SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/openobex-${PV}.tar.gz \
            file://disable-cable-test.patch \
            file://libusb_crosscompile_check.patch"
 
-inherit autotools_stage binconfig pkgconfig
+inherit  binconfig pkgconfig
 
 EXTRA_OECONF = "--enable-apps --enable-syslog --enable-dump \
                 --with-usb=${STAGING_LIBDIR}/.. --with-bluez=${STAGING_LIBDIR}/.."
 
-do_stage_append() {
-	install -d ${STAGING_DATADIR}/aclocal
-	install -m 0644 ${S}/openobex.m4 ${STAGING_DATADIR}/aclocal
+do_install_append() {
+	install -d ${D}${datadir}/aclocal
+	install -m 0644 ${S}/openobex.m4 ${D}${datadir}/aclocal
 }
 
 PACKAGES += "openobex-apps"
diff --git a/recipes/openscada/openscada_svn.bb b/recipes/openscada/openscada_svn.bb
index deb0c76..bed388d 100644
--- a/recipes/openscada/openscada_svn.bb
+++ b/recipes/openscada/openscada_svn.bb
@@ -15,7 +15,7 @@ PV = "0.6.4+svnr${SRCPV}"
 
 S = "${WORKDIR}/OpenSCADA"
 
-inherit autotools_stage
+
 
 EXTRA_OECONF = " \
       --includedir=${STAGING_INCDIR} \
diff --git a/recipes/pacemaker/pacemaker_1.0.9.1.bb b/recipes/pacemaker/pacemaker_1.0.9.1.bb
index 652b0c6..5d2114b 100644
--- a/recipes/pacemaker/pacemaker_1.0.9.1.bb
+++ b/recipes/pacemaker/pacemaker_1.0.9.1.bb
@@ -28,7 +28,7 @@ SRC_URI = " \
 SRC_URI_append_libc-uclibc = " file://kill-stack-protector.patch"
 SRC_URI[md5sum] = "c844d98a5e6163192dd9f073ba9856ff"
 SRC_URI[sha256sum] = "55b30bf018720f28d92c22519cbb26ebedb5c511dbeedb7e2c2a2712034ebd92"
-inherit autotools_stage python-dir
+inherit  python-dir
 
 S = "${WORKDIR}/Pacemaker-1-0-Pacemaker-${PV}"
 
diff --git a/recipes/packagekit/packagekit_0.4.6.bb b/recipes/packagekit/packagekit_0.4.6.bb
index 306ff4b..ca5a231 100644
--- a/recipes/packagekit/packagekit_0.4.6.bb
+++ b/recipes/packagekit/packagekit_0.4.6.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL"
 DEPENDS = "gtk+ python cppunit policykit dbus (>= 1.1.1) dbus-glib glib-2.0 sqlite3 ${IPKG_VARIANT} intltool intltool-native (>= 0.37.1)"
 RDEPENDS_${PN} = "${IPKG_VARIANT}"
 
-inherit gnome autotools_stage
+inherit gnome 
 
 SRC_URI = "http://www.packagekit.org/releases/PackageKit-${PV}.tar.gz \
            file://no_validate.patch \
diff --git a/recipes/packagekit/packagekit_0.4.8.bb b/recipes/packagekit/packagekit_0.4.8.bb
index 6fc50c2..b521422 100644
--- a/recipes/packagekit/packagekit_0.4.8.bb
+++ b/recipes/packagekit/packagekit_0.4.8.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL"
 DEPENDS = "gtk+ python cppunit policykit dbus (>= 1.1.1) dbus-glib glib-2.0 sqlite3 ${IPKG_VARIANT} intltool intltool-native (>= 0.37.1)"
 RDEPENDS_${PN} = "${IPKG_VARIANT}"
 
-inherit gnome autotools_stage
+inherit gnome 
 
 SRC_URI = "http://www.packagekit.org/releases/PackageKit-${PV}.tar.gz \
            file://no_validate.patch \
diff --git a/recipes/packagekit/packagekit_0.5.2.bb b/recipes/packagekit/packagekit_0.5.2.bb
index 4a19559..555823c 100644
--- a/recipes/packagekit/packagekit_0.5.2.bb
+++ b/recipes/packagekit/packagekit_0.5.2.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL"
 DEPENDS = "gtk+ python cppunit dbus (>= 1.1.1) dbus-glib glib-2.0 sqlite3 ${IPKG_VARIANT} intltool intltool-native (>= 0.37.1)"
 RDEPENDS_${PN} = "${IPKG_VARIANT}"
 
-inherit gnome autotools_stage
+inherit gnome 
 
 SRC_URI = "http://www.packagekit.org/releases/PackageKit-${PV}.tar.gz \
            "
diff --git a/recipes/packagekit/packagekit_git.bb b/recipes/packagekit/packagekit_git.bb
index f89779a..48f8712 100644
--- a/recipes/packagekit/packagekit_git.bb
+++ b/recipes/packagekit/packagekit_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL"
 DEPENDS = "gtk+ python cppunit policykit dbus (>= 1.1.1) dbus-glib glib-2.0 sqlite3 ${IPKG_VARIANT} intltool intltool-native (>= 0.37.1)"
 RDEPENDS_${PN} = "${IPKG_VARIANT}"
 
-inherit gnome autotools_stage
+inherit gnome 
 
 SRC_URI = "git://anongit.freedesktop.org/git/packagekit;protocol=git \
 "
diff --git a/recipes/pcsc-lite/pcsc-lite_1.5.2.bb b/recipes/pcsc-lite/pcsc-lite_1.5.2.bb
index 154dbea..ae06378 100644
--- a/recipes/pcsc-lite/pcsc-lite_1.5.2.bb
+++ b/recipes/pcsc-lite/pcsc-lite_1.5.2.bb
@@ -8,7 +8,7 @@ RDEPENDS_${PN} = "hal"
 SRC_URI = "https://alioth.debian.org/frs/download.php/2795/pcsc-lite-${PV}.tar.bz2 \
            file://pcscd.init "
 
-inherit autotools_stage update-rc.d
+inherit  update-rc.d
 
 INITSCRIPT_NAME = "pcscd"
 INITSCRIPT_PARAMS = "defaults"
diff --git a/recipes/popt/popt_1.14.bb b/recipes/popt/popt_1.14.bb
index 1f6a220..76c5747 100644
--- a/recipes/popt/popt_1.14.bb
+++ b/recipes/popt/popt_1.14.bb
@@ -1,7 +1,7 @@
 require popt.inc
 PR = "r2"
 
-inherit autotools_stage gettext
+inherit  gettext
 
 SRC_URI = "\
   http://rpm5.org/files/popt/popt-${PV}.tar.gz \
diff --git a/recipes/popt/popt_1.7.bb b/recipes/popt/popt_1.7.bb
index aab8094..492f74a 100644
--- a/recipes/popt/popt_1.7.bb
+++ b/recipes/popt/popt_1.7.bb
@@ -4,7 +4,7 @@ PR = "r1"
 
 DEPENDS = "gettext virtual/libintl"
 
-inherit autotools autotools_stage
+inherit autotools 
 
 SRC_URI = "\
   http://rpm.org/releases/historical/rpm-4.1.x/popt-${PV}.tar.gz \
diff --git a/recipes/pulseaudio/libcanberra_0.14.bb b/recipes/pulseaudio/libcanberra_0.14.bb
index 58f2b1c..9bde345 100644
--- a/recipes/pulseaudio/libcanberra_0.14.bb
+++ b/recipes/pulseaudio/libcanberra_0.14.bb
@@ -7,7 +7,7 @@ AUTHOR = "Lennart Poettering"
 HOMEPAGE = "http://0pointer.de/lennart/projects/libcanberra"
 PR = "r2"
 
-inherit autotools_stage
+
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
 SRC_URI = "http://0pointer.de/lennart/projects/libcanberra/libcanberra-${PV}.tar.gz \
diff --git a/recipes/pulseaudio/libcanberra_0.17.bb b/recipes/pulseaudio/libcanberra_0.17.bb
index 0e6f06a..2f708ed 100644
--- a/recipes/pulseaudio/libcanberra_0.17.bb
+++ b/recipes/pulseaudio/libcanberra_0.17.bb
@@ -7,7 +7,7 @@ AUTHOR = "Lennart Poettering"
 HOMEPAGE = "http://0pointer.de/lennart/projects/libcanberra"
 PR = "r4"
 
-inherit autotools_stage vala
+inherit  vala
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
 SRC_URI = "http://0pointer.de/lennart/projects/libcanberra/libcanberra-${PV}.tar.gz \
diff --git a/recipes/python/python-dbus_0.83.0.bb b/recipes/python/python-dbus_0.83.0.bb
index 1d1648f..ecc5d0e 100644
--- a/recipes/python/python-dbus_0.83.0.bb
+++ b/recipes/python/python-dbus_0.83.0.bb
@@ -8,7 +8,7 @@ PR = "ml2"
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.tar.gz"
 S = "${WORKDIR}/dbus-python-${PV}"
 
-inherit distutils-base autotools_stage pkgconfig
+inherit distutils-base  pkgconfig
 
 export BUILD_SYS
 export HOST_SYS
diff --git a/recipes/python/python-pygtk-1.2_0.6.12.bb b/recipes/python/python-pygtk-1.2_0.6.12.bb
index cd8b0b3..80a94c2 100644
--- a/recipes/python/python-pygtk-1.2_0.6.12.bb
+++ b/recipes/python/python-pygtk-1.2_0.6.12.bb
@@ -12,7 +12,7 @@ SRC_URI = "ftp://ftp.gtk.org/pub/gtk/python/v1.2/${SRCNAME}-${PV}.tar.gz \
            file://acinclude.m4"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-inherit autotools_stage pkgconfig distutils-base
+inherit  pkgconfig distutils-base
 
 EXTRA_OECONF += "--with-python-includes=${STAGING_INCDIR}/../"
 
diff --git a/recipes/qhull/qhull_2003.1.bb b/recipes/qhull/qhull_2003.1.bb
index 499bb96..b946e47 100644
--- a/recipes/qhull/qhull_2003.1.bb
+++ b/recipes/qhull/qhull_2003.1.bb
@@ -3,7 +3,7 @@ LICENSE = "unknown"
 
 SRC_URI = "http://www.qhull.org/download/qhull-${PV}.tar.gz"
 
-inherit autotools_stage lib_package
+inherit  lib_package
 
 
 
diff --git a/recipes/redland/redland_1.0.8.bb b/recipes/redland/redland_1.0.8.bb
index c58b546..323a9ef 100644
--- a/recipes/redland/redland_1.0.8.bb
+++ b/recipes/redland/redland_1.0.8.bb
@@ -7,7 +7,7 @@ PR = "r3"
 
 DEPENDS = "db mysql"
 
-inherit autotools_stage
+
 
 EXTRA_OECONF = "--with-bdb-lib=${STAGING_LIBDIR} --with-bdb-include=${STAGING_INCDIR} --with-sqlite=no"
 
diff --git a/recipes/schroedinger/schroedinger_1.0.9.bb b/recipes/schroedinger/schroedinger_1.0.9.bb
index d9b9191..0df926b 100644
--- a/recipes/schroedinger/schroedinger_1.0.9.bb
+++ b/recipes/schroedinger/schroedinger_1.0.9.bb
@@ -2,7 +2,7 @@ require schroedinger.inc
 
 PR = "r0"
 
-inherit autotools_stage
+
 
 SRC_URI[schroedingertargz.md5sum] = "d67ec48b7c506db8c8b49156bf409e60"
 SRC_URI[schroedingertargz.sha256sum] = "345abcaa72ff0f2e9c1075e22f7141475ee4e6eea23a7f568b69ffc13cc1c723"
diff --git a/recipes/sdr/dttsp_svn.bb b/recipes/sdr/dttsp_svn.bb
index ac49779..1908140 100644
--- a/recipes/sdr/dttsp_svn.bb
+++ b/recipes/sdr/dttsp_svn.bb
@@ -8,6 +8,6 @@ SRCREV = "241"
 SRC_URI = "svn://206.216.146.154/svn/repos_sdr_linux/branches/ab2kt;module=dttsp-ng"
 S = "${WORKDIR}/dttsp-ng/src"
 
-inherit autotools_stage
+
 
 
diff --git a/recipes/sdr/fldigi_3.11.4.bb b/recipes/sdr/fldigi_3.11.4.bb
index 2441731..3925eab 100644
--- a/recipes/sdr/fldigi_3.11.4.bb
+++ b/recipes/sdr/fldigi_3.11.4.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2"
 
 DEPENDS = "libsndfile1 portaudio-v19 hamlib jpeg fltk libsamplerate0 pulseaudio"
 
-inherit autotools_stage
+
 
 SRC_URI = "http://www.w1hkj.com/fldigi-distro/fldigi-${PV}.tar.gz"
 
diff --git a/recipes/sdr/hamlib_1.2.9.bb b/recipes/sdr/hamlib_1.2.9.bb
index 42e1cd0..74c2ce6 100644
--- a/recipes/sdr/hamlib_1.2.9.bb
+++ b/recipes/sdr/hamlib_1.2.9.bb
@@ -7,7 +7,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/hamlib/hamlib-${PV}.tar.gz"
 
 PR = "r1"
 
-inherit autotools_stage
+
 
 EXTRA_OECONF = "--with-perl-inc=${STAGING_LIBDIR}/perl/5.8.8/CORE"
 # This is a hack, someone with some more time should fix the autofoo
diff --git a/recipes/sgalib/sgalib_0.1.0.bb b/recipes/sgalib/sgalib_0.1.0.bb
index 24fbeb6..b4e7a89 100644
--- a/recipes/sgalib/sgalib_0.1.0.bb
+++ b/recipes/sgalib/sgalib_0.1.0.bb
@@ -10,6 +10,6 @@ S = "${WORKDIR}/sgalib-${PV}"
 COMPATIBLE_MACHINE = "nhk15"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-inherit autotools_stage
+
 
 EXTRA_OECONF = "--with-kernelsrcdir=${STAGING_KERNEL_DIR}"
diff --git a/recipes/shr/libmodulo_git.bb b/recipes/shr/libmodulo_git.bb
index 49146da..e366148 100644
--- a/recipes/shr/libmodulo_git.bb
+++ b/recipes/shr/libmodulo_git.bb
@@ -4,7 +4,7 @@ SRCREV = "7d2f657d248bd86377e66c329aa6826459d406da"
 PV = "0.0.1+gitr${SRCPV}"
 PR = "r1"
 
-inherit autotools autotools_stage pkgconfig vala
+inherit autotools  pkgconfig vala
 
 DEPENDS = "glib-2.0 dbus-glib libxml2 libgee"
 
diff --git a/recipes/shr/libphone-ui-shr_git.bb b/recipes/shr/libphone-ui-shr_git.bb
index aaa7348..bf5c7b6 100644
--- a/recipes/shr/libphone-ui-shr_git.bb
+++ b/recipes/shr/libphone-ui-shr_git.bb
@@ -8,7 +8,7 @@ PR = "r8"
 SRC_URI = "git://shr.bearstech.com/repo/libphone-ui-shr.git;protocol=http;branch=master"
 S = "${WORKDIR}/git"
 
-inherit pkgconfig autotools autotools_stage
+inherit pkgconfig autotools 
 
 EXTRA_OECONF = "--with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc"
 
diff --git a/recipes/shr/libphone-ui_git.bb b/recipes/shr/libphone-ui_git.bb
index 327524a..3b3f661 100644
--- a/recipes/shr/libphone-ui_git.bb
+++ b/recipes/shr/libphone-ui_git.bb
@@ -8,7 +8,7 @@ PR = "r0"
 
 DEPENDS="glib-2.0 dbus-glib libframeworkd-glib libfso-glib libfsoframework libphone-utils alsa-lib"
 
-inherit pkgconfig autotools autotools_stage
+inherit pkgconfig autotools 
 
 SRC_URI = "git://git.shr-project.org/repo/libphone-ui.git;protocol=http;branch=master"
 
diff --git a/recipes/socketcan/libsocketcan.inc b/recipes/socketcan/libsocketcan.inc
index 367766c..d0cb674 100644
--- a/recipes/socketcan/libsocketcan.inc
+++ b/recipes/socketcan/libsocketcan.inc
@@ -13,4 +13,4 @@ SRC_URI = "git://git.pengutronix.de/git/tools/libsocketcan.git;protocol=git;tag=
 
 S = "${WORKDIR}/git"
 
-inherit autotools_stage pkgconfig
+inherit  pkgconfig
diff --git a/recipes/sqlite/sqlite3.inc b/recipes/sqlite/sqlite3.inc
index b13fb1c..7300c5e 100644
--- a/recipes/sqlite/sqlite3.inc
+++ b/recipes/sqlite/sqlite3.inc
@@ -9,7 +9,7 @@ SRC_URI = "http://www.sqlite.org/sqlite-${PV}.tar.gz \
 
 S = "${WORKDIR}/sqlite-${PV}"
 
-inherit autotools_stage pkgconfig
+inherit  pkgconfig
 
 EXTRA_OECONF = "--disable-tcl --enable-shared \
 		--enable-threadsafe"
diff --git a/recipes/sysfsutils/sysfsutils.inc b/recipes/sysfsutils/sysfsutils.inc
index 1dbd022..8b2f539 100644
--- a/recipes/sysfsutils/sysfsutils.inc
+++ b/recipes/sysfsutils/sysfsutils.inc
@@ -5,7 +5,7 @@ INC_PR = "r3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/linux-diag/sysfsutils-${PV}.tar.gz"
 
-inherit autotools autotools_stage
+inherit autotools 
 
 acpaths = "-I ${S}/m4"
 
diff --git a/recipes/telepathy/telepathy-farsight_0.0.7.bb b/recipes/telepathy/telepathy-farsight_0.0.7.bb
index 91765af..68ad59d 100644
--- a/recipes/telepathy/telepathy-farsight_0.0.7.bb
+++ b/recipes/telepathy/telepathy-farsight_0.0.7.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPLv2"
 SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-farsight/${P}.tar.gz \
 "
 
-inherit autotools_stage
+
 
 EXTRA_OECONF = "--disable-python"
 
diff --git a/recipes/telepathy/telepathy-gabble_0.7.27.bb b/recipes/telepathy/telepathy-gabble_0.7.27.bb
index 0fd6bd6..7ea9c7b 100644
--- a/recipes/telepathy/telepathy-gabble_0.7.27.bb
+++ b/recipes/telepathy/telepathy-gabble_0.7.27.bb
@@ -7,7 +7,6 @@ LICENSE = "LGPL"
 SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-gabble/${P}.tar.gz \
            file://gabble.manager"
 
-inherit autotools_stage 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
 do_compile_prepend() {
diff --git a/recipes/telepathy/telepathy-glib_0.7.29.bb b/recipes/telepathy/telepathy-glib_0.7.29.bb
index 86bf8c7..0bb4be9 100644
--- a/recipes/telepathy/telepathy-glib_0.7.29.bb
+++ b/recipes/telepathy/telepathy-glib_0.7.29.bb
@@ -5,7 +5,7 @@ LICENSE = "LGPL"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${P}.tar.gz "
 
-inherit autotools_stage
+
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
diff --git a/recipes/telepathy/telepathy-mission-control_4.67.bb b/recipes/telepathy/telepathy-mission-control_4.67.bb
index cdef3a2..1b861cd 100644
--- a/recipes/telepathy/telepathy-mission-control_4.67.bb
+++ b/recipes/telepathy/telepathy-mission-control_4.67.bb
@@ -7,8 +7,6 @@ PR = "r0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/mission-control/telepathy-mission-control-${PV}.tar.gz"
 
-inherit autotools_stage 
-
 PACKAGES =+ " \
 	libmissioncontrol \
 	libmissioncontrol-config \
diff --git a/recipes/upnp/gssdp_0.6.3.bb b/recipes/upnp/gssdp_0.6.3.bb
index 9040bd1..205a78d 100644
--- a/recipes/upnp/gssdp_0.6.3.bb
+++ b/recipes/upnp/gssdp_0.6.3.bb
@@ -3,7 +3,7 @@ DEPENDS = "glib-2.0 libsoup-2.4 libglade"
 
 SRC_URI = "http://gupnp.org/sources/${PN}/${PN}-${PV}.tar.gz"
 
-inherit autotools_stage pkgconfig
+inherit  pkgconfig
 
 PACKAGES =+ "gssdp-tools"
 
diff --git a/recipes/upnp/gssdp_0.7.1.bb b/recipes/upnp/gssdp_0.7.1.bb
index ab7e078..a8d0a9d 100644
--- a/recipes/upnp/gssdp_0.7.1.bb
+++ b/recipes/upnp/gssdp_0.7.1.bb
@@ -3,7 +3,7 @@ DEPENDS = "glib-2.0 libsoup-2.4 libglade"
 
 SRC_URI = "http://gupnp.org/sources/${PN}/${PN}-${PV}.tar.gz"
 
-inherit autotools_stage pkgconfig
+inherit  pkgconfig
 
 PACKAGES =+ "gssdp-tools"
 
diff --git a/recipes/upnp/gupnp-av_0.3.bb b/recipes/upnp/gupnp-av_0.3.bb
index fd261d8..e0bf652 100644
--- a/recipes/upnp/gupnp-av_0.3.bb
+++ b/recipes/upnp/gupnp-av_0.3.bb
@@ -3,7 +3,7 @@ DEPENDS = "gupnp"
 
 SRC_URI = "http://gupnp.org/sources/${PN}/${PN}-${PV}.tar.gz"
 
-inherit autotools_stage pkgconfig
+inherit  pkgconfig
 
 SRC_URI[md5sum] = "f6e813591ff89e8e61a46f416046450f"
 SRC_URI[sha256sum] = "34b6e104b480e501e430daa68fca63906a939a6cb02bc43814ed06d2856a72ac"
diff --git a/recipes/upnp/gupnp-av_0.5.2.bb b/recipes/upnp/gupnp-av_0.5.2.bb
index 053d71e..dd8dbc9 100644
--- a/recipes/upnp/gupnp-av_0.5.2.bb
+++ b/recipes/upnp/gupnp-av_0.5.2.bb
@@ -4,7 +4,7 @@ DEPENDS = "gupnp"
 SRC_URI = "http://gupnp.org/sources/${PN}/${PN}-${PV}.tar.gz \
            file://nodoc.patch"
 
-inherit autotools_stage pkgconfig
+inherit  pkgconfig
 
 SRC_URI[md5sum] = "15ccfbb17553bf1cb00bf8e1d801005e"
 SRC_URI[sha256sum] = "dfd438f40e31047d6f06db30db05d5f876c6294a8509f170482d712f552e9892"
diff --git a/recipes/upnp/gupnp_0.12.5.bb b/recipes/upnp/gupnp_0.12.5.bb
index 8304875..5c73480 100644
--- a/recipes/upnp/gupnp_0.12.5.bb
+++ b/recipes/upnp/gupnp_0.12.5.bb
@@ -4,13 +4,13 @@ DEPENDS = "e2fsprogs gssdp libsoup-2.4 libxml2"
 SRC_URI = "http://gupnp.org/sources/${PN}/${PN}-${PV}.tar.gz"
 PR = "r1"
 
-inherit autotools_stage pkgconfig
+inherit  pkgconfig
 
 FILES_${PN} = "${libdir}/*.so.*"
 FILES_${PN}-dev += "${bindir}/gupnp-binding-tool"
 
-do_stage_append () {
-	install ${S}/tools/gupnp-binding-tool ${STAGING_BINDIR_NATIVE}
+do_install_append () {
+	install ${S}/tools/gupnp-binding-tool ${D}${STAGING_BINDIR_NATIVE}
 }
 SRC_URI[md5sum] = "bfb12195c76bb6632bd917f2c2bc12d6"
 SRC_URI[sha256sum] = "241e416cbe2c02f413fde82a8587bfe2fe9915fbed3a6fb20c86520b8d7543ef"
diff --git a/recipes/upnp/gupnp_0.13.1.bb b/recipes/upnp/gupnp_0.13.1.bb
index cd49b66..a4e7311 100644
--- a/recipes/upnp/gupnp_0.13.1.bb
+++ b/recipes/upnp/gupnp_0.13.1.bb
@@ -4,15 +4,15 @@ DEPENDS = "e2fsprogs gssdp libsoup-2.4 libxml2 gtk-doc-native libgee"
 SRC_URI = "http://gupnp.org/sources/${PN}/${PN}-${PV}.tar.gz \
            file://nodoc.patch"
 
-inherit autotools_stage pkgconfig
+inherit  pkgconfig
 
 EXTRA_OECONF = "--disable-gtk-doc"
 
 FILES_${PN} = "${libdir}/*.so.*"
 FILES_${PN}-dev += "${bindir}/gupnp-binding-tool"
 
-do_stage_append () {
-	install ${S}/tools/gupnp-binding-tool ${STAGING_BINDIR_NATIVE}
+do_install_append () {
+	install ${S}/tools/gupnp-binding-tool ${D}${STAGING_BINDIR_NATIVE}
 }
 
 SRC_URI[md5sum] = "9b5fcf8146ba9a2bd84382f61717aa0e"
diff --git a/recipes/vala-dbus-binding-tool/vala-dbus-binding-tool.inc b/recipes/vala-dbus-binding-tool/vala-dbus-binding-tool.inc
index 93e60b5..957315e 100644
--- a/recipes/vala-dbus-binding-tool/vala-dbus-binding-tool.inc
+++ b/recipes/vala-dbus-binding-tool/vala-dbus-binding-tool.inc
@@ -8,6 +8,4 @@ INC_PR = "r3"
 
 SRC_URI = "http://downloads.freesmartphone.org/sources/vala-dbus-binding-tool-${PV}.tar.bz2;name=archive"
 
-inherit autotools_stage
-
 BBCLASSEXTEND = "native"
diff --git a/recipes/xdg-user-dirs/xdg-user-dirs_0.10.bb b/recipes/xdg-user-dirs/xdg-user-dirs_0.10.bb
index 5a1edf8..a22dd0f 100644
--- a/recipes/xdg-user-dirs/xdg-user-dirs_0.10.bb
+++ b/recipes/xdg-user-dirs/xdg-user-dirs_0.10.bb
@@ -3,7 +3,7 @@ SRC_URI = "http://user-dirs.freedesktop.org/releases/xdg-user-dirs-0.10.tar.gz \
            file://configurefix.patch "
 PR = "r1"
 
-inherit autotools_stage
+
 
 do_install_append () {
 	install -d ${D}${sysconfdir}/skel/.config/
-- 
1.7.1



