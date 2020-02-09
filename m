Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 4D04560ECF
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Feb 2020 15:11:07 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id m10so6610606wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Feb 2020 07:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=o4PhagcgrfVkk83MW8ajY1trb1h6kZp6QbkHGv419Sk=;
	b=ItNvepbOTgb213vxYn/xHRSuJo3oD2IQ/ApHcrtkeKJN6JP3HonvVEWsix2UME4zfW
	W876rBsckyC0pE4RgARnJ6dIBbu1uVDOa8O6h2oU3CWAI9nl+o+t8Eu3ssSBYQW5UbSZ
	GvuN1kkYyjLINmmkmW/dfKv71QVk8yH7coRngavFklqUVrfeVIbKR+964TDMuE7eFCiW
	SAbweEB4ViSESji2JPOHJNXTSkxX7YhGzLXot3BrPWOfs7DpSOwwhp7jzUYRDtw6M9vK
	sQud3NawgvmuIjg3Br3Zf8pvTQP4wP/I+I4M4trQWssj0JrfX7JqlYU3ySkkKMI9XVoE
	jzmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=o4PhagcgrfVkk83MW8ajY1trb1h6kZp6QbkHGv419Sk=;
	b=LoIRLAtVd6+Gkds3FEWfHbRP4pEk3mvozBxFfr/idJ4vIFmj3DqeDip3PkFzAkTH3V
	ihZRkN+VaWBZvdjMjjKlypMrrClHAmAF1iKcm4ILxJif2/nh+a60nodt5DwFglrQqE1+
	y1CtCw/lM+jcIMC7GO4unnZ/v9/Lq4Hjw+njYaPkKtHwvHjkpLZ0Vq5UODN74fodjwHH
	ScYCy1qHBHNTqNVwZoXzAHiHdWxVn/0Tzu6Rui2p4DG2gW+JYHqwiMt475OOLnsvRWKx
	IAx0NSxUUp9eDGtDrLWUtHw0EvzgBZe7izIcltdsA1pz03gUnjtzuaBpdYpWvKt45yPb
	e4oQ==
X-Gm-Message-State: APjAAAUtAgpoL1PmwfVr7WLdYG0wIxYYkVI0jF4WBdeh162cVMe9yg0t
	ZxeG69MssCsEzpfk4yv/oWCJrirJ
X-Google-Smtp-Source: APXvYqxd/Bfb+nRn4TWm1t5KYYO7H2eS/HMUZcmedrB/mqY4qnh6YGLrsx5PU8ZDc9dmssjXdiabOQ==
X-Received: by 2002:a7b:c4c5:: with SMTP id g5mr10265755wmk.85.1581261067332; 
	Sun, 09 Feb 2020 07:11:07 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F2C16629984A4CCEAA4B6A2.dip0.t-ipconnect.de.
	[2003:f0:7f2c:1662:9984:a4cc:eaa4:b6a2])
	by smtp.gmail.com with ESMTPSA id
	q10sm11429093wme.16.2020.02.09.07.11.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 07:11:06 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Feb 2020 16:10:52 +0100
Message-Id: <20200209151053.4277-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200209151053.4277-1-schnitzeltony@gmail.com>
References: <20200209151053.4277-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 5/6] gimp: upgrade 2.8.22 -> 2.10.14
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
X-List-Received-Date: Sun, 09 Feb 2020 15:11:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* patches don't apply any more
* get sources from location gimp's homepage suggests
* license checksum was changed by replacing http -> https [1]

[1] https://gitlab.gnome.org/GNOME/gimp/commit/bab75b7365cc87639cd5aaa9840ebe1f6228d556

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gimp/gimp/gimp_2.10.14.bb         | 32 ++++++-----
 ...-ac-do-not-check-for-freetype-config.patch | 38 -------------
 .../gimp/gimp/0003-Fix-use-of-gegl-API.patch  | 34 ------------
 .../gimp/gimp/bump_Babl-GEGL_versions.patch   | 53 -------------------
 4 files changed, 20 insertions(+), 137 deletions(-)
 rename meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb => meta-gnome/recipes-gimp/gimp/gimp_2.10.14.bb (49%)
 delete mode 100644 meta-oe/recipes-graphics/gimp/gimp/0001-configure-ac-do-not-check-for-freetype-config.patch
 delete mode 100644 meta-oe/recipes-graphics/gimp/gimp/0003-Fix-use-of-gegl-API.patch
 delete mode 100644 meta-oe/recipes-graphics/gimp/gimp/bump_Babl-GEGL_versions.patch

diff --git a/meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.14.bb
similarity index 49%
rename from meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb
rename to meta-gnome/recipes-gimp/gimp/gimp_2.10.14.bb
index 718f8998c..045958d0a 100644
--- a/meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.14.bb
@@ -2,40 +2,43 @@ SUMMARY = "The GIMP is the GNU Image Manipulation Program"
 HOMEPAGE = "http://www.gimp.org"
 SECTION = "x11/graphics"
 LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e"
 
 DEPENDS = " \
     gdk-pixbuf-native \
     intltool-native \
     libxslt-native \
+    gegl-native \
     dbus-glib \
     gtk+ \
     babl \
     gegl \
+    libmypaint \
+    mypaint-brushes-1.0 \
+    gexiv2 \
     jpeg \
     libpng \
     libexif \
     tiff \
     lcms \
     poppler \
+    poppler-data \
     jasper \
     bzip2 \
     libgudev \
     libmng \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libxmu libxpm', '', d)} \
 "
-DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libxmu libxpm', '', d)}"
 
 inherit features_check gnomebase gtk-icon-cache gtk-doc mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "http://ftp.gimp.org/pub/gimp/v2.8/gimp-${PV}.tar.bz2 \
-           file://0001-configure-ac-do-not-check-for-freetype-config.patch \
-           file://bump_Babl-GEGL_versions.patch \
-           file://0003-Fix-use-of-gegl-API.patch \
-           "
-SRC_URI[md5sum] = "7e4fd7a53b1d3c32dff642ab1a94b44d"
-SRC_URI[sha256sum] = "9187a35cc52b110d78124d7b27b68a68ade14a794c2721314bac6134d2a5638a"
+SHPV = "${@gnome_verdir("${PV}")}"
+
+SRC_URI = "https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2"
+SRC_URI[md5sum] = "a64f2be299755a2da130306cad9b1d26"
+SRC_URI[sha256sum] = "df9b0f11c2078eea1de3ebc66529a5d3854c5e28636cd25a8dd077bd9d6ddc54"
 
 EXTRA_OECONF = "--disable-python \
                 --without-webkit \
@@ -46,7 +49,12 @@ do_configure_append() {
     find ${B} -name Makefile | xargs sed -i s:'-I/usr/include':'-I${STAGING_INCDIR}':g
 }
 
-CFLAGS += "-fPIC"
+do_compile_prepend() {
+    # Let native babl/gegl find their plugins
+    export BABL_PATH=`find ${STAGING_LIBDIR_NATIVE} -maxdepth 1 -name 'babl-*'`
+    export GEGL_PATH=`find ${STAGING_LIBDIR_NATIVE} -maxdepth 1 -name 'gegl-*'`
+}
+
+FILES_${PN}  += "${datadir}/metainfo"
 
-FILES_${PN}-dbg += "${libdir}/gimp/2.0/*/.debug"
-FILES_${PN}  += "${datadir}/appdata"
+RDEPENDS_${PN} += "mypaint-brushes-1.0"
diff --git a/meta-oe/recipes-graphics/gimp/gimp/0001-configure-ac-do-not-check-for-freetype-config.patch b/meta-oe/recipes-graphics/gimp/gimp/0001-configure-ac-do-not-check-for-freetype-config.patch
deleted file mode 100644
index fecd0121c..000000000
--- a/meta-oe/recipes-graphics/gimp/gimp/0001-configure-ac-do-not-check-for-freetype-config.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 72ad76841d87e857428693d812a961935284ac62 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Thu, 12 Feb 2015 15:57:47 +0100
-Subject: [PATCH] configure-ac: do not check for freetype-config
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-freetype-config is not allowed in our environment - see also binconfig-disabled
-
-Upstream-Status: inappropriate [OE specific]
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- configure.ac | 7 -------
- 1 file changed, 7 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 26812b6..abec714 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -647,13 +647,6 @@ if test "x$fontconfig_ok" = xno; then
- fi
- 
- 
--AC_PATH_PROG(FREETYPE_CONFIG, freetype-config, no)
--if test "x$FREETYPE_CONFIG" != "xno" ; then
--  AC_MSG_CHECKING([for freetype libraries])
--  FREETYPE_LIBS=`$FREETYPE_CONFIG --libs`
--  AC_MSG_RESULT($FREETYPE_LIBS)
--fi
--AC_SUBST(FREETYPE_LIBS)
- 
- 
- ##########################################
--- 
-1.9.3
-
diff --git a/meta-oe/recipes-graphics/gimp/gimp/0003-Fix-use-of-gegl-API.patch b/meta-oe/recipes-graphics/gimp/gimp/0003-Fix-use-of-gegl-API.patch
deleted file mode 100644
index 7da78e205..000000000
--- a/meta-oe/recipes-graphics/gimp/gimp/0003-Fix-use-of-gegl-API.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From e1c8f4b8323e3965271a93529eab5774c1a7083c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 29 Jun 2017 10:32:14 -0700
-Subject: [PATCH 3/3] Fix use of gegl API
-
-newer version of gegl does not define GEGL_IS_PARAM_SPEC_MULTILINE
-
-| core/libappcore.a(gimpparamspecs-duplicate.o): In function `gimp_param_spec_duplicate':
-| /usr/src/debug/gimp/2.8.22-r0/gimp-2.8.22/app/core/../../../../../../../../../workspace/sources/gimp/app/core/gimpparamspecs-duplicate.c:70: undefined reference to `GEGL_IS_PARAM_SPEC_MULTILINE'
-| collect2: error: ld returned 1 exit status
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- app/core/gimpparamspecs-duplicate.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/app/core/gimpparamspecs-duplicate.c b/app/core/gimpparamspecs-duplicate.c
-index c0b7426..2efaf23 100644
---- a/app/core/gimpparamspecs-duplicate.c
-+++ b/app/core/gimpparamspecs-duplicate.c
-@@ -67,7 +67,7 @@ gimp_param_spec_duplicate (GParamSpec *pspec)
-                                      spec->default_value,
-                                      pspec->flags);
- 
--          if (GEGL_IS_PARAM_SPEC_MULTILINE (pspec))
-+          if (gegl_param_spec_get_property_key(pspec, "multiline"))
-             {
-               g_param_spec_set_qdata (new, multiline_quark,
-                                       GINT_TO_POINTER (TRUE));
--- 
-2.13.2
-
diff --git a/meta-oe/recipes-graphics/gimp/gimp/bump_Babl-GEGL_versions.patch b/meta-oe/recipes-graphics/gimp/gimp/bump_Babl-GEGL_versions.patch
deleted file mode 100644
index b71bf329e..000000000
--- a/meta-oe/recipes-graphics/gimp/gimp/bump_Babl-GEGL_versions.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-Bump acceptable versions of babl and gegl.
-
-Patch is taken from debian:
-https://packages.debian.org/stretch/gimp
-
-Upstream-Status: Inappropriate [OE specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-diff --git a/app/sanity.c b/app/sanity.c
-index febddfb..85fea55 100644
---- a/app/sanity.c
-+++ b/app/sanity.c
-@@ -351,7 +351,7 @@ sanity_check_babl (void)
- 
- #define BABL_REQUIRED_MAJOR 0
- #define BABL_REQUIRED_MINOR 1
--#define BABL_REQUIRED_MICRO 10
-+#define BABL_REQUIRED_MICRO 12
- 
-   babl_get_version (&babl_major_version,
-                     &babl_minor_version,
-@@ -388,7 +388,7 @@ sanity_check_gegl (void)
-   gint gegl_micro_version;
- 
- #define GEGL_REQUIRED_MAJOR 0
--#define GEGL_REQUIRED_MINOR 2
-+#define GEGL_REQUIRED_MINOR 3
- #define GEGL_REQUIRED_MICRO 0
- 
-   gegl_get_version (&gegl_major_version,
-diff --git a/configure.ac b/configure.ac
-index 26812b6..4252fe9 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -40,8 +40,8 @@ m4_define([gimp_stable],
- m4_define([gimp_full_name], [GNU Image Manipulation Program])
- 
- # required versions of other packages
--m4_define([babl_required_version], [0.1.10])
--m4_define([gegl_required_version], [0.2.0])
-+m4_define([babl_required_version], [0.1.12])
-+m4_define([gegl_required_version], [0.3.0])
- m4_define([glib_required_version], [2.30.2])
- m4_define([atk_required_version], [2.2.0])
- m4_define([gtk_required_version], [2.24.10])
-@@ -519,7 +519,7 @@ AC_SUBST(ISO_CODES_LOCALEDIR)
- ###############################
- 
- PKG_CHECK_MODULES(BABL, babl >= babl_required_version)
--PKG_CHECK_MODULES(GEGL, gegl-0.2 >= gegl_required_version)
-+PKG_CHECK_MODULES(GEGL, gegl-0.3 >= gegl_required_version)
- PKG_CHECK_MODULES(ATK, atk >= atk_required_version)
- 
- AM_PATH_GLIB_2_0(glib_required_version, :,
-- 
2.21.0


