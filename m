Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0F6F4731CF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 19:49:07 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id v188so32764037wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 12:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=3EMqGzTTlZC/qg85v3MJsH1Ohhs+ReUMisVdEtFM7Jw=;
	b=0ECtkRjHJVsiHIF97J/TRg590gQmnk9jfrpWCpS2yPiOx7OwF9g8gDcFbEcsFVfaZc
	a0TqFYYNlehaC3F8ctSAwdYmJHCOqQXSkIBbWvXRxVTznArE+pHkQn4uFsBE1HtSt+Sc
	of26dIXN3hlxTEtrfPVARGofBNXreFaXs8OyuyaXYBRazfA2YANz91wxQRA+rYgwkHfs
	gRhHUAuZqKc7ahq68BQgRq834yd6QBf57LiA0oZu/LzI7tuHYsftnf8KuLQVZRxMrpIi
	/BYvx7aA9zTHZd++Qj76Z+o9L23comDdElm0kDvvuuhLKtZNHAqYptwqqPKKpVb1bwKM
	+z2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=3EMqGzTTlZC/qg85v3MJsH1Ohhs+ReUMisVdEtFM7Jw=;
	b=YP2RyGfiMIvlTiFLgWHbOxoHsLUEAfaIJney6gZvZLEwYl5cI4Tv4tca1kLKzy5HjU
	zfJ6XlsUXIgSQA3+8JiHtWpgY+QJlDj4NoO7iQQazST9TAXWX1SKJZTuvHJLNtydr5ot
	VshuzCKuruoBKCSKOZzGQDRfFoXx50hsbewm68oSCQN5JZHE1AyzC3GD9h/XwHsWrcpj
	DRwQH9IkZcWr33bJdT75ZmGhlqrCsOk11n08pOCZM/e5dIQGboXiAXv0g7+VSmP/bBbA
	Q6VLsZEbOWYKtpKbOPXeZjNNCxAjdaYU5x6bnBVA7iPbKzFczuelZN0EqNksEXHECYXo
	LYLw==
X-Gm-Message-State: AOPr4FWVFfHND4qS0UOSWywWAj2u/8biN/W2vhfN/51eREJsq4dD4vQvqUQm1mW69Kudrwjw
X-Received: by 10.28.125.8 with SMTP id y8mr5599272wmc.87.1461354548315;
	Fri, 22 Apr 2016 12:49:08 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id t4sm4875842wmf.8.2016.04.22.12.49.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Apr 2016 12:49:07 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Apr 2016 20:48:53 +0100
Message-Id: <1461354536-23240-5-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
In-Reply-To: <1461354536-23240-1-git-send-email-ross.burton@intel.com>
References: <1461354536-23240-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 5/8] meta-multimedia: use bb.utils.contains() instead of base_contains()
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
X-List-Received-Date: Fri, 22 Apr 2016 19:49:08 -0000

base_contains() is a compatibility wrapper and may warn in the future, so
replace all instances with bb.utils.contains().

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-multimedia/recipes-connectivity/gupnp/gssdp.inc   |  2 +-
 meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb   |  6 +++---
 .../recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb  |  2 +-
 .../recipes-multimedia/libao/libao_1.2.0.bb            |  2 +-
 .../recipes-multimedia/mpg123/mpg123_1.22.4.bb         | 18 +++++++++---------
 .../recipes-multimedia/musicpd/mpd_0.19.10.bb          |  2 +-
 .../recipes-multimedia/openal/openal-soft_1.15.1.bb    |  4 ++--
 meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb   |  4 ++--
 8 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp.inc b/meta-multimedia/recipes-connectivity/gupnp/gssdp.inc
index 5a4939c..23f17ed 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gssdp.inc
+++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp.inc
@@ -12,7 +12,7 @@ do_configure_prepend() {
         cp -f ${S}/m4/vapigen.m4 ${S}/m4/vapigen-custom.m4 || true
 }
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)}"
 PACKAGECONFIG[gtk] = "--with-gtk,--without-gtk,gtk+"
 
 PACKAGES =+ "gssdp-tools"
diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
index 17db7b5..f14d4e1 100644
--- a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
+++ b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
@@ -33,7 +33,7 @@ CACHED_CONFIGUREVARS += " \
     ac_cv_path_PYTHON="${STAGING_BINDIR_NATIVE}/python-native/python" \
 "
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'opengl', 'opengl', 'openglesv2', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl', 'openglesv2', d)}"
 PACKAGECONFIG[opengl] = "--enable-gl,--enable-gles,glew"
 PACKAGECONFIG[openglesv2] = "--enable-gles,--enable-gl,"
 
@@ -43,7 +43,7 @@ EXTRA_OECONF = " \
     --enable-airplay \
     --disable-optical-drive \
     --enable-external-libraries \
-    ${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-gl', '--enable-gles', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '--enable-gl', '--enable-gles', d)} \
 "
 
 FULL_OPTIMIZATION_armv7a = "-fexpensive-optimizations -fomit-frame-pointer -O4 -ffast-math"
@@ -94,6 +94,6 @@ RRECOMMENDS_${PN}_append = " libcec \
                              python-netclient \
                              libcurl \
                              xdpyinfo \
-                             ${@base_contains('DISTRO_FEATURES', 'opengl', 'mesa-demos', '', d)} \
+                             ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-demos', '', d)} \
 "
 RRECOMMENDS_${PN}_append_libc-glibc = " glibc-charmap-ibm850 glibc-gconv-ibm850"
diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb
index b0bc824..66f0201 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb
@@ -12,7 +12,7 @@ SRC_URI[sha256sum] = "50853391d9ebeda9b4db787efb23f98b1e26b7296dd2bb5d0d96b5bcce
 
 inherit autotools-brokensep pkgconfig lib_package
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
 PACKAGECONFIG[sndfile] = "--enable-libsndfile-support,--disable-libsndfile-support,libsndfile1"
 PACKAGECONFIG[jack] = "--enable-jack-support,--disable-jack-support,jack"
 PACKAGECONFIG[pulseaudio] = "--enable-pulse-support,--disable-pulse-support,pulseaudio"
diff --git a/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb b/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb
index 3991f02..1339df6 100644
--- a/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb
+++ b/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb
@@ -27,7 +27,7 @@ python populate_packages_prepend () {
     do_split_packages(d, rootdir_dbg, '^(.*)\.so$', output_pattern='${BPN}-plugin-%s-dbg', description='AO %s plugin debug data')
 }
 
-PACKAGECONFIG ?= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} ${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
+PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
 PACKAGECONFIG[esound] = "--enable-esd,--disable-esd,esound"
 PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
 PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
diff --git a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.22.4.bb b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.22.4.bb
index d11a312..e6a912b 100644
--- a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.22.4.bb
+++ b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.22.4.bb
@@ -22,8 +22,8 @@ inherit autotools pkgconfig
 # The options should be mutually exclusive for configuration script.
 # If both alsa and pulseaudio are specified (as in the default distro features)
 # pulseaudio takes precedence.
-PACKAGECONFIG_ALSA = "${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '${PACKAGECONFIG_ALSA}', d)}"
+PACKAGECONFIG_ALSA = "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '${PACKAGECONFIG_ALSA}', d)}"
 
 PACKAGECONFIG[alsa] = "--with-default-audio=alsa,,alsa-lib"
 PACKAGECONFIG[esd] = ",,esound"
@@ -35,13 +35,13 @@ PACKAGECONFIG[sdl] = ",,libsdl"
 
 # Following are possible sound output modules:
 # alsa arts coreaudio dummy esd jack nas openal os2 oss portaudio pulse sdl sndio sun tinyalsa win32 win32_wasapi
-AUDIOMODS += "${@base_contains('PACKAGECONFIG', 'alsa', 'alsa', '', d)}"
-AUDIOMODS += "${@base_contains('PACKAGECONFIG', 'esd', 'esd', '', d)}"
-AUDIOMODS += "${@base_contains('PACKAGECONFIG', 'jack', 'jack', '', d)}"
-AUDIOMODS += "${@base_contains('PACKAGECONFIG', 'openal', 'openal', '', d)}"
-AUDIOMODS += "${@base_contains('PACKAGECONFIG', 'portaudio', 'portaudio', '', d)}"
-AUDIOMODS += "${@base_contains('PACKAGECONFIG', 'pulseaudio', 'pulse', '', d)}"
-AUDIOMODS += "${@base_contains('PACKAGECONFIG', 'sdl', 'sdl', '', d)}"
+AUDIOMODS += "${@bb.utils.contains('PACKAGECONFIG', 'alsa', 'alsa', '', d)}"
+AUDIOMODS += "${@bb.utils.contains('PACKAGECONFIG', 'esd', 'esd', '', d)}"
+AUDIOMODS += "${@bb.utils.contains('PACKAGECONFIG', 'jack', 'jack', '', d)}"
+AUDIOMODS += "${@bb.utils.contains('PACKAGECONFIG', 'openal', 'openal', '', d)}"
+AUDIOMODS += "${@bb.utils.contains('PACKAGECONFIG', 'portaudio', 'portaudio', '', d)}"
+AUDIOMODS += "${@bb.utils.contains('PACKAGECONFIG', 'pulseaudio', 'pulse', '', d)}"
+AUDIOMODS += "${@bb.utils.contains('PACKAGECONFIG', 'sdl', 'sdl', '', d)}"
 
 EXTRA_OECONF = " \
     --enable-shared \
diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.10.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.10.bb
index 09caf47..7b124ca 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.10.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.10.bb
@@ -15,7 +15,7 @@ SRC_URI[sha256sum] = "c386eb3d22f98dc993b5ae3c272f969aa7763713483c6800040ebf1791
 inherit autotools useradd systemd
 
 EXTRA_OECONF = "enable_bzip2=yes"
-EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
+EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
 
 PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
 PACKAGECONFIG[id3tag] = "--enable-id3,--disable-id3,libid3tag"
diff --git a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.15.1.bb b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.15.1.bb
index ab038a7..5895234 100644
--- a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.15.1.bb
+++ b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.15.1.bb
@@ -10,8 +10,8 @@ SRC_URI[md5sum] = "ea83dec3b9655a27d28e7bc7cae9cd71"
 SRC_URI[sha256sum] = "0e29a162f0841ccb4135ce76e92e8a704589b680a85eddf76f898de5236eb056"
 
 PACKAGECONFIG ?= "\
-    ${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
-    ${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
 "
 PACKAGECONFIG[alsa] = "-DALSA=TRUE, -DALSA=FALSE, alsa-lib"
 PACKAGECONFIG[pulseaudio] = "-DPULSEAUDIO=TRUE, -DPULSEAUDIO=FALSE, pulseaudio"
diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
index eb40a3e..3c688bd 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
@@ -8,8 +8,8 @@ DEPENDS = "libpng libav libsndfile1 libvorbis"
 
 PR = "r2"
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
-                   ${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
                    magic \
 "
 PACKAGECONFIG[pulseaudio] = "--with-pulseaudio=dyn,--with-pulseaudio=no,pulseaudio,"
-- 
2.8.0.rc3


