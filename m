Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 721557E7DE
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jul 2019 20:56:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45fD151gNtz23
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jul 2019 22:56:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1562187385;
	bh=xTE7tKqiXr3I8VJx6NoZKIfzJ57rtwL7gng2vrhjXAg=;
	h=From:To:Subject:Date:From;
	b=p1KdF4FqR9WrfcfPnI7k43Cd1QGp+OfPWKIUcvnt2qZwQ3B0Z91wfq0GyZmDBNCsV
	/ol6fHfJ+yqXZrTlwcmqpb77fqrrgKH/tNqytZthjrXDlP6EPIwN/sVBM8Y7650SVC
	BAmuErwlSzlLWW0h/yRDcYANTmeMwCf3yEs7scwM3WuUG2gAkIWhT87uO1mI6/1lIB
	o0pTDVcsqJbAcdL0vsVdO/KPFJt4pR4hAyK5eRKeFT0ZuHl4f37dSGbQ0vLZyuuHT/
	zfOVeK5v194TevWUntosm2+IGo9SyCMwV8JdkBPLgUkRN+1ybpa/0l5CwIZTD6ZVqI
	1w6CD/P17DQgddo39hph0vRy1Eyo4t5S1I7589uryDIrtpj/cY404GjWrtBp/7Vl1c
	FeBVFiSwOkf/fZGzSAQeisDmDt3Qpf89WB7zfn9so4xnF4uFFZVkkUst8h5GLhBmK+
	2f2IFLG3vPwFwacfKTP1itu/oRgmke6mI/5rZvqrnrWgS7bHkjJln4gvrj7nzz6wv0
	6lbOeCgnqKyjtb2DDZwBOdZZjWwuaHsO6aypDLA95rE/5JT2bOBPxcv/xa6O8lM3RJ
	xdZY1O2LcZ05lHM/y6KzVm0JTwnC01S0myK1Nnv93Pgp6otDv7DAk+v5h3AQ8XDoU4
	tyN+xNT12WUZtlw9ZmoWAUE8=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jul 2019 23:56:24 +0300
Message-Id: <20190703205624.592-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] esound: Remove this obsolete package
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
X-List-Received-Date: Wed, 03 Jul 2019 20:56:25 -0000

Users migrated to PulseAudio 10 years ago.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  2 +-
 .../0001-audio_alsa09.c-alsa-drain-fix.patch  | 24 ------------
 .../0002-Undefine-open64-and-fopen64.patch    | 33 -----------------
 .../esound/0003-Use-I-path-in-configure.patch | 36 ------------------
 .../esound/esound/no-docs.patch               | 19 ----------
 .../esound/esound_0.2.41.bb                   | 37 -------------------
 6 files changed, 1 insertion(+), 150 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/esound/esound/0001-audio_alsa09.c-alsa-drain-fix.patch
 delete mode 100644 meta-oe/recipes-multimedia/esound/esound/0002-Undefine-open64-and-fopen64.patch
 delete mode 100644 meta-oe/recipes-multimedia/esound/esound/0003-Use-I-path-in-configure.patch
 delete mode 100644 meta-oe/recipes-multimedia/esound/esound/no-docs.patch
 delete mode 100644 meta-oe/recipes-multimedia/esound/esound_0.2.41.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index d7e1b6e87..7bc0f1943 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -190,7 +190,7 @@ RDEPENDS_packagegroup-meta-oe-kernel_remove_mips64 = "crash"
 RDEPENDS_packagegroup-meta-oe-kernel_remove_mips64el = "crash"
 
 RDEPENDS_packagegroup-meta-oe-multimedia ="\
-    alsa-oss audiofile cdrkit esound id3lib \
+    alsa-oss audiofile cdrkit id3lib \
     a2jmidid jack libass libburn libcdio libcdio-paranoia \
     libdvdread libmms libmodplug libopus live555 \
     mplayer-common opus-tools \
diff --git a/meta-oe/recipes-multimedia/esound/esound/0001-audio_alsa09.c-alsa-drain-fix.patch b/meta-oe/recipes-multimedia/esound/esound/0001-audio_alsa09.c-alsa-drain-fix.patch
deleted file mode 100644
index 130f3c229..000000000
--- a/meta-oe/recipes-multimedia/esound/esound/0001-audio_alsa09.c-alsa-drain-fix.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 945df2da87a412758ceab4ac5711abbb269a47c1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 8 Jun 2017 23:09:51 -0700
-Subject: [PATCH] audio_alsa09.c: alsa drain fix
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- audio_alsa09.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/audio_alsa09.c b/audio_alsa09.c
-index 534e3db..d9450e6 100644
---- a/audio_alsa09.c
-+++ b/audio_alsa09.c
-@@ -506,7 +506,7 @@ void esd_audio_flush(void)
- 	}
- 
- 	if (alsa_playback_handle != NULL)
--		snd_pcm_drain( alsa_playback_handle );
-+		snd_pcm_drop( alsa_playback_handle );
-   
- 	if (alsadbg) 
- 		print_state();
diff --git a/meta-oe/recipes-multimedia/esound/esound/0002-Undefine-open64-and-fopen64.patch b/meta-oe/recipes-multimedia/esound/esound/0002-Undefine-open64-and-fopen64.patch
deleted file mode 100644
index 10a6ba03a..000000000
--- a/meta-oe/recipes-multimedia/esound/esound/0002-Undefine-open64-and-fopen64.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From e218d5a0a545ebb9623d62da5cfca478f9c90fce Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 8 Jun 2017 23:11:31 -0700
-Subject: [PATCH] Undefine open64 and fopen64
-
-Since the signatures do not match with libc
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- esddsp.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/esddsp.c b/esddsp.c
-index d3c6ea9..17b5949 100644
---- a/esddsp.c
-+++ b/esddsp.c
-@@ -290,6 +290,7 @@ open (const char *pathname, int flags, ...)
-   return open_wrapper(func, pathname, flags, mode);
- }
- 
-+#undef open64
- int
- open64 (const char *pathname, int flags, ...)
- {
-@@ -374,6 +375,7 @@ fopen (const char *path, const char *mode)
-   return fopen_wrapper(func, path, mode);
- }
- 
-+#undef fopen64
- FILE *
- fopen64 (const char *path, const char *mode)
- {
diff --git a/meta-oe/recipes-multimedia/esound/esound/0003-Use-I-path-in-configure.patch b/meta-oe/recipes-multimedia/esound/esound/0003-Use-I-path-in-configure.patch
deleted file mode 100644
index 83365b4e6..000000000
--- a/meta-oe/recipes-multimedia/esound/esound/0003-Use-I-path-in-configure.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 89c62db54716d514e639f9e1bfd3c1f7d82641dd Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 8 Jun 2017 23:12:36 -0700
-Subject: [PATCH] Use -I=<path> in configure
-
-This helps to use proper sysroot in
-cross build environment
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 5645dce..d374cda 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -208,7 +208,7 @@ if test "x$enable_local_sound" = "xyes"; then
-    AC_CHECK_HEADERS(CoreAudio/CoreAudio.h)
-    # mme_api.h directly includes other files from the mme subdir
-    xCPPFLAGS="$CPPFLAGS"
--   CPPFLAGS="$CPPFLAGS -I/usr/include/mme"
-+   CPPFLAGS="$CPPFLAGS -I=/usr/include/mme"
-    AC_CHECK_HEADERS(mme/mme_api.h)
-    CPPFLAGS="$xCPPFLAGS"
-    AM_PATH_ARTS(, HAVE_ARTS=yes, HAVE_ARTS=no)
-@@ -269,7 +269,7 @@ if test "x$enable_local_sound" = "xyes"; then
-       osf*)
- 	found_sound=yes
- 	AC_DEFINE(DRIVER_OSF, 1, [Defined if OSF backend is enabled])
--	CPPFLAGS="$CPPFLAGS -I/usr/include/mme"
-+	CPPFLAGS="$CPPFLAGS -I=/usr/include/mme"
- 	SOUND_LIBS=-lmme
-       esac
-    fi
diff --git a/meta-oe/recipes-multimedia/esound/esound/no-docs.patch b/meta-oe/recipes-multimedia/esound/esound/no-docs.patch
deleted file mode 100644
index 8a546e6db..000000000
--- a/meta-oe/recipes-multimedia/esound/esound/no-docs.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-From bfcaa9bdc70440db96f10afc0c2a792870f75acb Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Fri, 3 Jun 2011 19:39:02 +0200
-
----
- Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 08c4c94..ede9d26 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,5 +1,5 @@
- 
--SUBDIRS = docs
-+SUBDIRS = 
- 
- ACLOCAL_AMFLAGS = -I m4
- 
diff --git a/meta-oe/recipes-multimedia/esound/esound_0.2.41.bb b/meta-oe/recipes-multimedia/esound/esound_0.2.41.bb
deleted file mode 100644
index d703f23d9..000000000
--- a/meta-oe/recipes-multimedia/esound/esound_0.2.41.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-SUMMARY = "Enlightened Sound Daemon"
-SECTION = "gpe/base"
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605"
-DEPENDS = "audiofile"
-
-inherit gnome
-
-SRC_URI = "ftp://ftp.gnome.org/pub/GNOME/sources/esound/0.2/${BP}.tar.bz2;name=archive \
-           file://no-docs.patch \
-           file://0001-audio_alsa09.c-alsa-drain-fix.patch \
-           file://0002-Undefine-open64-and-fopen64.patch \
-           file://0003-Use-I-path-in-configure.patch \
-           "
-SRC_URI[archive.md5sum] = "8d9aad3d94d15e0d59ba9dc0ea990c6c"
-SRC_URI[archive.sha256sum] = "5eb5dd29a64b3462a29a5b20652aba7aa926742cef43577bf0796b787ca34911"
-
-EXTRA_OECONF += " \
-    --disable-arts \
-    --disable-artstest \
-"
-EXTRA_OECONF_remove = "--disable-schemas-install"
-
-CFLAGS += "-lm"
-
-PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-PACKAGECONFIG[libwrap] = "--with-libwrap,--without-libwrap,tcp-wrappers,"
-PACKAGECONFIG[alsa] = "--enable-alsa --disable-oss,--disable-alsa,alsa-lib,"
-
-PACKAGECONFIG ??= "libwrap alsa \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
-"
-PACKAGES =+ "esddsp esd esd-utils"
-
-FILES_esddsp = "${bindir}/esddsp ${libdir}/libesddsp.so.*"
-FILES_esd = "${bindir}/esd"
-FILES_esd-utils = "${bindir}/*"
-- 
2.17.1


