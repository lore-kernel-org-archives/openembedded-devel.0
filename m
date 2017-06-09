Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f53.google.com (mail-pg0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id BB70278272
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Jun 2017 06:56:58 +0000 (UTC)
Received: by mail-pg0-f53.google.com with SMTP id v18so23694209pgb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Jun 2017 23:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GpTek+5LrVD2XOifLYLfTCelDEDEB6lh8PlQCq8RjGY=;
	b=lvo1GhuRJeD824CuPWl1bm849++XDG7A58sj9pxjnYsFqJ9SoTmpldZJ9M5p5+lOZ2
	i52/UC2R8zKgUPKVlnaNvBmgehcoIcRRgUpNWDVupMvoECEXR5SlrhU3wzOhH/hnbmfp
	1eZ7ftWgJUgDmGG6jdFa0/A67dW4IXK13S/z8DoyBb3OOIWRQ++yd99PtaJSW9n7Xwjr
	9TqR+1inMMYfEUl+NN0RXhhgqwCutL6HWNCao9cyWFSpxGQNFyBT+Qon7CGCj/e+QgoD
	p22rcp0cFhnKFNZWEqcEAqu8hg7EH5HBAD+hpcCbZf/HV5XzLmH62zXrNbUPDp4fJM6Z
	SYAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GpTek+5LrVD2XOifLYLfTCelDEDEB6lh8PlQCq8RjGY=;
	b=FA53c90kFiiMOh+3zx9Ho8p61Zvoc/MKVgLZIl6kOZe39ZtA39/DgmcBL09oK5/lcL
	CRg/AEvGacB4OjlOOnUdn2zvdM5XxUSP8Edix5U7yQVZaIDiGCxZ8NXN8jbeOuqFE19t
	WiX6ll9GUBhMXBRa17g3I/7qMkvvc0qoIt9ntvexho4lvVOSPwYPcYJrAecufWvAdpIN
	vXnga/D0M+qF4UyasGFf6lqK/jNiT4t3PmSuGQJ7xjoyiuVtqPlKpilWeDplPxjH1PMA
	9jiL2TBwKoMC9S6K+8DEfZqgf3iYZqYO1WQF0kh3uEDdxL7XVt09v3PdAWPef0ofy0wT
	Ff6g==
X-Gm-Message-State: AODbwcAkMO6BB8oJI0FyPHGBGx65Kps+BR/pcqEBODdF5g9tBFFtiPeh
	gnNf0OrkG51nxS4y
X-Received: by 10.98.215.12 with SMTP id b12mr41687679pfh.162.1496991414370;
	Thu, 08 Jun 2017 23:56:54 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::264a])
	by smtp.gmail.com with ESMTPSA id s18sm921436pfg.44.2017.06.08.23.56.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Jun 2017 23:56:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Jun 2017 23:56:43 -0700
Message-Id: <20170609065643.5642-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
MIME-Version: 1.0
Subject: [PATCH] esound: Upgrade to 0.2.41
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
X-List-Received-Date: Fri, 09 Jun 2017 06:57:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-audio_alsa09.c-alsa-drain-fix.patch       |  26 ++++++++++++++
 ...sing-AM_PATH_AUDIOFILE-by-PKG_CHECK_MODUL.patch |  31 -----------------
 .../esound/0002-Undefine-open64-and-fopen64.patch  |  35 +++++++++++++++++++
 .../esound/0003-Use-I-path-in-configure.patch      |  38 +++++++++++++++++++++
 .../esound/esound/configure-fix.patch              |  10 ------
 .../esound/esound/esound_0.2.36-1ubuntu5.diff.gz   | Bin 44925 -> 0 bytes
 meta-oe/recipes-multimedia/esound/esound_0.2.36.bb |  38 ---------------------
 meta-oe/recipes-multimedia/esound/esound_0.2.41.bb |  37 ++++++++++++++++++++
 8 files changed, 136 insertions(+), 79 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/esound/esound/0001-audio_alsa09.c-alsa-drain-fix.patch
 delete mode 100644 meta-oe/recipes-multimedia/esound/esound/0001-replace-missing-AM_PATH_AUDIOFILE-by-PKG_CHECK_MODUL.patch
 create mode 100644 meta-oe/recipes-multimedia/esound/esound/0002-Undefine-open64-and-fopen64.patch
 create mode 100644 meta-oe/recipes-multimedia/esound/esound/0003-Use-I-path-in-configure.patch
 delete mode 100644 meta-oe/recipes-multimedia/esound/esound/configure-fix.patch
 delete mode 100644 meta-oe/recipes-multimedia/esound/esound/esound_0.2.36-1ubuntu5.diff.gz
 delete mode 100644 meta-oe/recipes-multimedia/esound/esound_0.2.36.bb
 create mode 100644 meta-oe/recipes-multimedia/esound/esound_0.2.41.bb

diff --git a/meta-oe/recipes-multimedia/esound/esound/0001-audio_alsa09.c-alsa-drain-fix.patch b/meta-oe/recipes-multimedia/esound/esound/0001-audio_alsa09.c-alsa-drain-fix.patch
new file mode 100644
index 000000000..6c7f3bd30
--- /dev/null
+++ b/meta-oe/recipes-multimedia/esound/esound/0001-audio_alsa09.c-alsa-drain-fix.patch
@@ -0,0 +1,26 @@
+From a860fe0796c43e35eac9783140fcb563cab9f55a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 8 Jun 2017 23:09:51 -0700
+Subject: [PATCH 1/3] audio_alsa09.c: alsa drain fix
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ audio_alsa09.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/audio_alsa09.c b/audio_alsa09.c
+index 534e3db..d9450e6 100644
+--- a/audio_alsa09.c
++++ b/audio_alsa09.c
+@@ -506,7 +506,7 @@ void esd_audio_flush(void)
+ 	}
+ 
+ 	if (alsa_playback_handle != NULL)
+-		snd_pcm_drain( alsa_playback_handle );
++		snd_pcm_drop( alsa_playback_handle );
+   
+ 	if (alsadbg) 
+ 		print_state();
+-- 
+2.13.1
+
diff --git a/meta-oe/recipes-multimedia/esound/esound/0001-replace-missing-AM_PATH_AUDIOFILE-by-PKG_CHECK_MODUL.patch b/meta-oe/recipes-multimedia/esound/esound/0001-replace-missing-AM_PATH_AUDIOFILE-by-PKG_CHECK_MODUL.patch
deleted file mode 100644
index 89c97a4fc..000000000
--- a/meta-oe/recipes-multimedia/esound/esound/0001-replace-missing-AM_PATH_AUDIOFILE-by-PKG_CHECK_MODUL.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 218e0702d6ce4d2cb20d5d108daa16afca2b7c41 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Fri, 16 Dec 2016 13:22:51 +0100
-Subject: [PATCH] replace missing AM_PATH_AUDIOFILE by PKG_CHECK_MODULES(
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstrem-Status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 486c492..dccfd1b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -353,7 +353,7 @@ echo "---------------------------------------------------------------------"
- echo "--- Checking for the audiofile library.  NOTE: This library is now"
- echo "--- REQUIRED from proper compilation of the esound package."
- 
--AM_PATH_AUDIOFILE(0.1.5, [
-+PKG_CHECK_MODULES(AUDIOFILE, audiofile, [
- 
- build_esdplay=true
- echo "--- libaudiofile found. Building esound with audiofile support"
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-multimedia/esound/esound/0002-Undefine-open64-and-fopen64.patch b/meta-oe/recipes-multimedia/esound/esound/0002-Undefine-open64-and-fopen64.patch
new file mode 100644
index 000000000..337546abe
--- /dev/null
+++ b/meta-oe/recipes-multimedia/esound/esound/0002-Undefine-open64-and-fopen64.patch
@@ -0,0 +1,35 @@
+From 1fbee6e96384f340b816e221fe1c2f3ff0b487bf Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 8 Jun 2017 23:11:31 -0700
+Subject: [PATCH 2/3] Undefine open64 and fopen64
+
+Since the signatures do not match with libc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ esddsp.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/esddsp.c b/esddsp.c
+index d3c6ea9..17b5949 100644
+--- a/esddsp.c
++++ b/esddsp.c
+@@ -290,6 +290,7 @@ open (const char *pathname, int flags, ...)
+   return open_wrapper(func, pathname, flags, mode);
+ }
+ 
++#undef open64
+ int
+ open64 (const char *pathname, int flags, ...)
+ {
+@@ -374,6 +375,7 @@ fopen (const char *path, const char *mode)
+   return fopen_wrapper(func, path, mode);
+ }
+ 
++#undef fopen64
+ FILE *
+ fopen64 (const char *path, const char *mode)
+ {
+-- 
+2.13.1
+
diff --git a/meta-oe/recipes-multimedia/esound/esound/0003-Use-I-path-in-configure.patch b/meta-oe/recipes-multimedia/esound/esound/0003-Use-I-path-in-configure.patch
new file mode 100644
index 000000000..62c880d9d
--- /dev/null
+++ b/meta-oe/recipes-multimedia/esound/esound/0003-Use-I-path-in-configure.patch
@@ -0,0 +1,38 @@
+From 979a02d9ec9c28686021cd2b49ca55d2195c9dce Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 8 Jun 2017 23:12:36 -0700
+Subject: [PATCH 3/3] Use -I=<path> in configure
+
+This helps to use proper sysroot in
+cross build environment
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 5645dce..d374cda 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -208,7 +208,7 @@ if test "x$enable_local_sound" = "xyes"; then
+    AC_CHECK_HEADERS(CoreAudio/CoreAudio.h)
+    # mme_api.h directly includes other files from the mme subdir
+    xCPPFLAGS="$CPPFLAGS"
+-   CPPFLAGS="$CPPFLAGS -I/usr/include/mme"
++   CPPFLAGS="$CPPFLAGS -I=/usr/include/mme"
+    AC_CHECK_HEADERS(mme/mme_api.h)
+    CPPFLAGS="$xCPPFLAGS"
+    AM_PATH_ARTS(, HAVE_ARTS=yes, HAVE_ARTS=no)
+@@ -269,7 +269,7 @@ if test "x$enable_local_sound" = "xyes"; then
+       osf*)
+ 	found_sound=yes
+ 	AC_DEFINE(DRIVER_OSF, 1, [Defined if OSF backend is enabled])
+-	CPPFLAGS="$CPPFLAGS -I/usr/include/mme"
++	CPPFLAGS="$CPPFLAGS -I=/usr/include/mme"
+ 	SOUND_LIBS=-lmme
+       esac
+    fi
+-- 
+2.13.1
+
diff --git a/meta-oe/recipes-multimedia/esound/esound/configure-fix.patch b/meta-oe/recipes-multimedia/esound/esound/configure-fix.patch
deleted file mode 100644
index 8fdc35ad5..000000000
--- a/meta-oe/recipes-multimedia/esound/esound/configure-fix.patch
+++ /dev/null
@@ -1,10 +0,0 @@
---- /tmp/configure.ac	2008-06-02 16:46:55.640793306 +0200
-+++ esound-0.2.36/configure.ac	2008-06-02 16:47:26.030793494 +0200
-@@ -29,6 +29,7 @@
- AC_SUBST(pkgdocdir)
- 
- AC_PROG_CC
-+AC_PROG_CXX
- AC_PROG_CPP
- AC_LIBTOOL_WIN32_DLL
- AM_PROG_LIBTOOL
diff --git a/meta-oe/recipes-multimedia/esound/esound/esound_0.2.36-1ubuntu5.diff.gz b/meta-oe/recipes-multimedia/esound/esound/esound_0.2.36-1ubuntu5.diff.gz
deleted file mode 100644
index 719f5d09de02829e1a0d89f86fa4cc46b72a015d..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 44925
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
Ri($r+{~y)jWM~r*0{~0^tsMXW

diff --git a/meta-oe/recipes-multimedia/esound/esound_0.2.36.bb b/meta-oe/recipes-multimedia/esound/esound_0.2.36.bb
deleted file mode 100644
index d19ba8223..000000000
--- a/meta-oe/recipes-multimedia/esound/esound_0.2.36.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-SUMMARY = "Enlightened Sound Daemon"
-SECTION = "gpe/base"
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605"
-DEPENDS = "audiofile"
-
-inherit gnome binconfig
-
-PR = "r1"
-
-SRC_URI = " \
-    ftp://ftp.gnome.org/pub/GNOME/sources/esound/0.2/esound-0.2.36.tar.bz2;name=archive \
-    file://esound_0.2.36-1ubuntu5.diff.gz \
-    file://no-docs.patch \
-    file://configure-fix.patch \
-    file://0001-replace-missing-AM_PATH_AUDIOFILE-by-PKG_CHECK_MODUL.patch \
-"
-
-SRC_URI[archive.md5sum] = "3facb5aa0115cc1c31771b9ad454ae76"
-SRC_URI[archive.sha256sum] = "68bf399fcbd45c5e9ba99cd13a3a479e4ef2bc5dc52e540ffa00aef1e1b19a76"
-
-EXTRA_OECONF = " \
-    --disable-alsa \
-    --disable-arts \
-    --disable-artstest \
-"
-
-CFLAGS += "-lm"
-
-do_configure_prepend() {
-    sed -i -e 's:/usr/include/mme:${STAGING_INCDIR}/mme:g' ${S}/configure.ac
-}
-
-PACKAGES =+ "esddsp esd esd-utils"
-
-FILES_esddsp = "${bindir}/esddsp ${libdir}/libesddsp.so.*"
-FILES_esd = "${bindir}/esd"
-FILES_esd-utils = "${bindir}/*"
diff --git a/meta-oe/recipes-multimedia/esound/esound_0.2.41.bb b/meta-oe/recipes-multimedia/esound/esound_0.2.41.bb
new file mode 100644
index 000000000..0ddf94f2d
--- /dev/null
+++ b/meta-oe/recipes-multimedia/esound/esound_0.2.41.bb
@@ -0,0 +1,37 @@
+SUMMARY = "Enlightened Sound Daemon"
+SECTION = "gpe/base"
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605"
+DEPENDS = "audiofile"
+
+inherit gnome
+
+SRC_URI = "ftp://ftp.gnome.org/pub/GNOME/sources/esound/0.2/${P}.tar.bz2;name=archive \
+           file://no-docs.patch \
+           file://0001-audio_alsa09.c-alsa-drain-fix.patch \
+           file://0002-Undefine-open64-and-fopen64.patch \
+           file://0003-Use-I-path-in-configure.patch \
+           "
+SRC_URI[archive.md5sum] = "8d9aad3d94d15e0d59ba9dc0ea990c6c"
+SRC_URI[archive.sha256sum] = "5eb5dd29a64b3462a29a5b20652aba7aa926742cef43577bf0796b787ca34911"
+
+EXTRA_OECONF += " \
+    --disable-arts \
+    --disable-artstest \
+"
+EXTRA_OECONF_remove = "--disable-schemas-install"
+
+CFLAGS += "-lm"
+
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
+PACKAGECONFIG[libwrap] = "--with-libwrap,--without-libwrap,tcp-wrappers,"
+PACKAGECONFIG[alsa] = "--enable-alsa --disable-oss,--disable-alsa,alsa-lib,"
+
+PACKAGECONFIG ??= "libwrap alsa \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
+"
+PACKAGES =+ "esddsp esd esd-utils"
+
+FILES_esddsp = "${bindir}/esddsp ${libdir}/libesddsp.so.*"
+FILES_esd = "${bindir}/esd"
+FILES_esd-utils = "${bindir}/*"
-- 
2.13.1


