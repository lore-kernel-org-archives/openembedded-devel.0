Return-Path: <cazfi74@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 186426CA33
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2013 13:57:13 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id z5so1222412lbh.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2013 06:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=3JZADRUJVaS1E3yS0X/QpoLxel4pM4xfbypo4IENGNY=;
	b=C8mJTIkpPFNYzkGvUFvuypAMsbp/9jH6mrbzWg13wn5KtxOU6S/stTfHwFiH9lAvO4
	42D0GjktlESGbGawKFWoZ7ewHpM4CBNxgpbNiebl0Ii9GslJ77i2wKIghgyUMqRajw9H
	E4Lv8VIhGC6Kyp5TuIXjtYTY4TtwwvLtIHtnU9NB23OixbFXWSA0xUF6jDUz1hKt8PHp
	Ic18GVGNi+V76pE5/nzS80PT2plKkx+oB6xSyhzvNUp+BmSey7WhYALo9ohwLgxiJ2Vu
	a+fgbMKDpWqW8FGAgJ4vvap8atE/TdzXa+OdZQf5Ej7vyhqOdkVs223aSr39kL+EM4Se
	Wj3w==
X-Received: by 10.112.167.99 with SMTP id zn3mr1556553lbb.34.1383141434999;
	Wed, 30 Oct 2013 06:57:14 -0700 (PDT)
Received: from prime (a91-153-14-158.elisa-laajakaista.fi. [91.153.14.158])
	by mx.google.com with ESMTPSA id qj3sm16416280lbb.6.2013.10.30.06.57.13
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 30 Oct 2013 06:57:14 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1VbWGm-000817-Bm; Wed, 30 Oct 2013 15:57:12 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Oct 2013 15:57:10 +0200
Message-Id: <1383141430-30778-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
Subject: [meta-oe][PATCH] libsdl2-mixer: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Oct 2013 13:57:14 -0000

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../libsdl2-mixer/libsdl2-mixer/configure.patch    | 26 +++++++++++++++
 .../libsdl2-mixer/libsdl2-mixer_2.0.0.bb           | 39 ++++++++++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/libsdl2-mixer/libsdl2-mixer/configure.patch
 create mode 100644 meta-oe/recipes-multimedia/libsdl2-mixer/libsdl2-mixer_2.0.0.bb

diff --git a/meta-oe/recipes-multimedia/libsdl2-mixer/libsdl2-mixer/configure.patch b/meta-oe/recipes-multimedia/libsdl2-mixer/libsdl2-mixer/configure.patch
new file mode 100644
index 0000000..43477e0
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libsdl2-mixer/libsdl2-mixer/configure.patch
@@ -0,0 +1,26 @@
+Upstream-Status: Inappropriate [configure]
+
+Adopted from similar patch for libsdl-mixer.
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+diff -Nurd SDL2_mixer-2.0.0/configure.in SDL2_mixer-2.0.0/configure.in
+--- SDL2_mixer-2.0.0/configure.in	2013-08-10 20:39:55.000000000 +0300
++++ SDL2_mixer-2.0.0/configure.in	2013-10-30 15:40:40.508477024 +0200
+@@ -1,6 +1,5 @@
+ dnl Process this file with autoconf to produce a configure script.
+ AC_INIT(README.txt)
+-AC_CONFIG_AUX_DIR(build-scripts)
+ 
+ dnl Set various version strings - taken gratefully from the GTk sources
+ 
+@@ -40,10 +39,6 @@
+ AC_SUBST(LT_REVISION)
+ AC_SUBST(LT_AGE)
+ 
+-dnl Detect the canonical build and host environments
+-AC_CONFIG_AUX_DIRS($srcdir/build-scripts)
+-dnl AC_CANONICAL_HOST
+-
+ dnl Check for tools
+ AC_PROG_LIBTOOL
+ AC_PROG_CC
diff --git a/meta-oe/recipes-multimedia/libsdl2-mixer/libsdl2-mixer_2.0.0.bb b/meta-oe/recipes-multimedia/libsdl2-mixer/libsdl2-mixer_2.0.0.bb
new file mode 100644
index 0000000..f016e84
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libsdl2-mixer/libsdl2-mixer_2.0.0.bb
@@ -0,0 +1,39 @@
+DESCRIPTION = "Simple DirectMedia Layer mixer library."
+SECTION = "libs"
+DEPENDS = "virtual/libsdl2 flac libmikmod libvorbis"
+LICENSE = "Zlib"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=7d198f6396c6f21fa575129c5b2fe8fe"
+
+SRC_URI = "http://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer-${PV}.tar.gz \
+           file://configure.patch \
+"
+
+SRC_URI[md5sum] = "65f6d80df073a1fb3bb537fbda031b50"
+SRC_URI[sha256sum] = "a8ce0e161793791adeff258ca6214267fdd41b3c073d2581cd5265c8646f725b"
+
+S = "${WORKDIR}/SDL2_mixer-${PV}"
+
+inherit autotools
+
+EXTRA_AUTORECONF += "--include=acinclude"
+EXTRA_OECONF = "--disable-music-mp3 --enable-music-ogg --enable-music-ogg-tremor LIBS=-L${STAGING_LIBDIR}"
+
+PACKAGECONFIG[mad] = "--enable-music-mp3-mad-gpl,--disable-music-mp3-mad-gpl,libmad"
+
+do_configure () {
+    # Remove old libtool macros.
+    MACROS="libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4"
+    for i in ${MACROS}; do
+        rm -f acinclude/$i
+    done
+    cp build-scripts/* . || true
+    rm -rf build-scripts/
+    export SYSROOT=$PKG_CONFIG_SYSROOT_DIR
+
+    autotools_do_configure
+
+    rm config.log
+    for i in $(find -name "Makefile") ; do
+        sed -i -e 's:-L/usr/lib:-L${STAGING_LIBDIR}:g' $i
+    done
+}
-- 
1.8.4.rc3


