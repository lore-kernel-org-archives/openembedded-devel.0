Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37944.1795594108259398814
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=VuuX+K+O;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3282db206d3so5126809eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594108; x=1796198908; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UHVKVswZFyJkoScoT3lFX01VU/YJtqPY1/gHv29/tm8=;
        b=VuuX+K+Ojhq6PQUqp8L7gzpomxF+caYLYTUjJZoAAy0G49Ha4Zo9QdWP5xMmTE6E+k
         ElOJ10ttD9LDjEA8NQuM2+l1uxKayrVle8IcIl7aPujOBIuI6TQ6xXfwkdegCZhEHfs3
         kdx/r/Dgh8G+MPgr/qaql7n8KnnvBobj/O2R3VC+0k5gtB0787QNOW0xbWAlFo3O0YKs
         Sp48oV9eXdayRcrKnOK5pvOPxAI5ysauCGvuXxdr85nF3rUy9miyt5/7RSUa0BSYK9Vi
         GBvtNlTLzvnCSVaNcRJV3Nvl3BdKOmo3vW4GX3RwTXvn8HPAxyLCsJNY0krX1sJwJspY
         M18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594108; x=1796198908;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UHVKVswZFyJkoScoT3lFX01VU/YJtqPY1/gHv29/tm8=;
        b=dBjkrhaWuChPw3zZdEGlP+gTULKqShWx3XEg95lbFrisvb23oUTQDL2jy7zKflMQao
         DktWsqrRhxMhD+6J2XtKDzwbwhQxQzQGTJrfrlOkw/06bjinvGRKP06s2P4DTRBSatj0
         /pt8tMbzjPG6Ws27BWO43SbSZZTzgkRs2Hpqfz0RknSOrB6eHwZ/v+bAo8BC77Kuh4fv
         HvbwziSAYA944eJMJHTVpBHkTftSvazMEAGoEighwWuG+zNDFv3Y5MQcE6yGsndLp5a7
         d5ntREgsN8JLfhqFS+ss90w1E/CW3HKJoeQCxCENx3DgJM7kJExq+LRRiHVToBSPwhrd
         i5eQ==
X-Gm-Message-State: APuU4Z+z3tg2poqd9yuvFeJPdujjJsu+VjcZ2Rltg8BlL2+a+KOugkSd
	mH91dmta4cS6l4sgr2YdO7K5+HJS/uL9gns+PeSt5Lz3g92VHfKFSiW1w9batjcl
X-Gm-Gg: AZFdTZfW1st/XvjsU+EFXytqNSv4h27J/xpEewS9H6pPG5rJXKd7WEqwBitHEurDJCP
	YCJqrtpwvSCAFPCi4zWglnES/0zmy++FiSF6LxXUWpdmtGl2/ziI9PmS1zK7wyYTKZU2h+YkuWZ
	fr5C//TMuBEOObA38xN7Shj5l7UsL9ehjd4HprMaZq3yiyJHYzTmCmVNYjw+wi7dpyK16GCbwRE
	yxN922Z9ieXfSk2LDRxocGkn6wH+uFvc4wnWhLv6xJCx2yT5YwtjTeDKBrb5zPPwWB+OrsQFhrM
	rF5qN2rjsYn5M10C1U5vEPJodQujfIij5xrFzmnMRtVzJZply1l1bZL/hZdIoIEQMlKZ92InnER
	WUkX8uIybMFOZBNO8qzFclE5wdtOV3dEQft0OhWlBntW1eqssbbf1LWQd8GZw/I9HupfwXx/OlZ
	qAoButArPMhxz1pVSMMS/lDlo0IcmJaVL8bagT9+lDLr7eSrcw0j/qH8pKEQHB+tCE87EZ67m5+
	D2W/Ke5oCuIB7Uq0yVkUbLHqujRR/wwLHpPp+5ZmGn8bQ+nwl0vezLWj1ml+Ocq1/eMIg+XOPfU
	OINteUEjUzJUTxaLItPQ4NsZJZ4I0GUAVITi0YK8M5Fx3+7n3zeZyL81Kwz9v7smhAVbBKxQZQ5
	J9mDOZOtUyr0eo5hHXhOlLZXX3NLWah6sHIqq8zGdC9fqJW/2dSR5nW0GWDOnD3f8LiQCXEuwrK
	KTa/UqImZvTnjxUVKokRIB1RcIA2Xv4Y+wSmTTLPz7VP/NdRMZzAzuEf4i/e5RnO91E7jWzW8jF
	9NLOlxmZLDUueiE27LM1scPRBWfHl9zCtJ6N9uHS1xE/D06fCcLIKPw612Wsef34gGNz4t1dC1p
	FVJL
X-Received: by 2002:a05:7300:d10e:b0:36f:a72d:29f with SMTP id 5a478bee46e88-38570152da4mr19026959eec.34.1795594107611;
        Wed, 25 Nov 2026 00:08:27 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 36/55] fltk1.3: Add recipe
Date: Wed, 25 Nov 2026 00:06:52 -0800
Message-ID: <20261125080732.2419614-42-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133039
Content-Type: text/plain; charset="utf-8"

TigerVNC does not support FLTK 1.4 yet and refuses to configure
against it, so provide FLTK 1.3.11 as a compatibility library next to
fltk 1.4, as Fedora and Arch do with their fltk1.3 packages.

The recipe reuses the former fltk 1.3.11 recipe and its Fl_Preferences
dlopen patch. To install side by side with fltk, headers go to
${includedir}/fltk1.3, the link symlinks and static libraries to
${libdir}/fltk1.3, the CMake files to ${datadir}/fltk1.3 and the config
script is fltk-config1.3. Only the runtime libraries (soname
libfltk*.so.1.3, which differs from 1.4's) are in ${libdir}. fluid is
not built when cross-compiling, man pages are dropped as they duplicate
fltk's, and Debian library renaming is disabled so that fltk1.3-dev
does not become libfltk-dev like fltk-dev.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...xx-do-not-use-dlopen-in-case-glibc-s.patch | 41 ++++++++++
 .../recipes-support/fltk/fltk1.3_1.3.11.bb    | 82 +++++++++++++++++++
 2 files changed, 123 insertions(+)
 create mode 100644 meta-oe/recipes-support/fltk/fltk1.3/0001-Fl_Preferences.cxx-do-not-use-dlopen-in-case-glibc-s.patch
 create mode 100644 meta-oe/recipes-support/fltk/fltk1.3_1.3.11.bb

diff --git a/meta-oe/recipes-support/fltk/fltk1.3/0001-Fl_Preferences.cxx-do-not-use-dlopen-in-case-glibc-s.patch b/meta-oe/recipes-support/fltk/fltk1.3/0001-Fl_Preferences.cxx-do-not-use-dlopen-in-case-glibc-s.patch
new file mode 100644
index 0000000000..0d47dac2dd
--- /dev/null
+++ b/meta-oe/recipes-support/fltk/fltk1.3/0001-Fl_Preferences.cxx-do-not-use-dlopen-in-case-glibc-s.patch
@@ -0,0 +1,41 @@
+From e76a062338063615c069fedc5a143cc38c34d9b2 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Tue, 28 Feb 2017 01:00:21 +0100
+Subject: [PATCH] Fl_Preferences.cxx: do not use dlopen in case glibc's headers
+ are missing
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+| /home/work/x86_64-linux/fltk-native/1.3.4-1-r0/fltk-1.3.4-1/src/Fl_Preferences.cxx: In static member function ‘static int Fl_Plugin_Manager::load(const char*)’:
+| /home/work/x86_64-linux/fltk-native/1.3.4-1-r0/fltk-1.3.4-1/src/Fl_Preferences.cxx:1741:27: error: ‘RTLD_LAZY’ was not declared in this scope
+|      dl = dlopen(filename, RTLD_LAZY);
+|                            ^~~~~~~~~
+| /home/work/x86_64-linux/fltk-native/1.3.4-1-r0/fltk-1.3.4-1/src/Fl_Preferences.cxx:1741:36: error: ‘dlopen’ was not declared in this scope
+|      dl = dlopen(filename, RTLD_LAZY);
+|                                     ^
+| src/CMakeFiles/fltk.dir/build.make:1217: recipe for target 'src/CMakeFiles/fltk.dir/Fl_Preferences.cxx.o' failed
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ src/Fl_Preferences.cxx | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Fl_Preferences.cxx b/src/Fl_Preferences.cxx
+index 1233bb1..7857b9b 100644
+--- a/src/Fl_Preferences.cxx
++++ b/src/Fl_Preferences.cxx
+@@ -1737,7 +1737,7 @@ int Fl_Plugin_Manager::load(const char *filename) {
+   HMODULE dl = LoadLibrary(filename);
+ #else
+   void * dl = NULL;
+-# if HAVE_DLSYM
++# if HAVE_DLSYM && HAVE_DLFCN_H
+     dl = dlopen(filename, RTLD_LAZY);
+ # endif
+ #endif
+-- 
+2.9.3
+
diff --git a/meta-oe/recipes-support/fltk/fltk1.3_1.3.11.bb b/meta-oe/recipes-support/fltk/fltk1.3_1.3.11.bb
new file mode 100644
index 0000000000..6129954ef2
--- /dev/null
+++ b/meta-oe/recipes-support/fltk/fltk1.3_1.3.11.bb
@@ -0,0 +1,82 @@
+SUMMARY = "FLTK 1.3 compatibility library"
+DESCRIPTION = "FLTK 1.3 libraries for applications that do not support FLTK 1.4 yet. \
+They install side by side with fltk: headers in ${includedir}/fltk1.3, link \
+libraries in ${libdir}/fltk1.3, CMake files in ${datadir}/fltk1.3 and \
+fltk-config1.3."
+HOMEPAGE = "https://www.fltk.org"
+SECTION = "libs"
+LICENSE = "LGPL-2.0-only AND LicenseRef-FLTK"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f6b26344a24a941a01a5b0826e80b5ca"
+
+DEPENDS = "alsa-lib zlib jpeg libpng libxext libxft"
+
+SRC_URI = " \
+    https://github.com/fltk/fltk/releases/download/release-${PV}/fltk-${PV}-source.tar.bz2 \
+    file://0001-Fl_Preferences.cxx-do-not-use-dlopen-in-case-glibc-s.patch \
+"
+SRC_URI[sha256sum] = "ca2e144e5f89173cd094cc273940d56230b1bf613083a0792e6406dc191cd99f"
+
+S = "${UNPACKDIR}/fltk-${PV}"
+
+UPSTREAM_CHECK_URI = "https://www.fltk.org/software.php"
+UPSTREAM_CHECK_REGEX = "fltk-(?P<pver>1\.3(\.\d+)+)-source\.tar"
+
+inherit cmake pkgconfig features_check binconfig
+REQUIRED_DISTRO_FEATURES = "x11"
+
+BINCONFIG_GLOB = "fltk-config1.3"
+
+TARGET_CC_ARCH += "${LDFLAGS} -DXFT_MAJOR=2"
+
+FLTK13_RELLIBDIR = "${@os.path.relpath(d.getVar('libdir'), d.getVar('prefix') + '/')}/fltk1.3"
+FLTK13_RELINCDIR = "${@os.path.relpath(d.getVar('includedir'), d.getVar('prefix') + '/')}/fltk1.3"
+
+# fluid is not built when cross-compiling, so nothing clashes in ${bindir} or ${datadir}
+EXTRA_OECMAKE = " \
+    -DOPTION_BUILD_SHARED_LIBS=ON \
+    -DOPTION_USE_THREADS=ON \
+    -DFLTK_BUILD_TEST=OFF \
+    -DOPTION_USE_XDBE=ON \
+    -DOPTION_USE_XFT=ON \
+    -DOPTION_BUILD_HTML_DOCUMENTATION=OFF \
+    -DOPTION_BUILD_PDF_DOCUMENTATION=OFF \
+    -DCMAKE_INSTALL_LIBDIR=${FLTK13_RELLIBDIR} \
+    -DCMAKE_INSTALL_INCLUDEDIR=${FLTK13_RELINCDIR} \
+"
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}"
+
+PACKAGECONFIG[cairo] = "-DOPTION_CAIRO=ON,-DOPTION_CAIRO=OFF,cairo"
+PACKAGECONFIG[opengl] = "-DOPTION_USE_GL=ON,-DOPTION_USE_GL=OFF,virtual/libgl"
+PACKAGECONFIG[xinerama] = "-DOPTION_USE_XINERAMA=ON,-DOPTION_USE_XINERAMA=OFF,libxinerama"
+PACKAGECONFIG[xfixes] = "-DOPTION_USE_XFIXES=ON,-DOPTION_USE_XFIXES=OFF,libxfixes"
+PACKAGECONFIG[xcursor] = "-DOPTION_USE_XCURSOR=ON,-DOPTION_USE_XCURSOR=OFF,libxcursor"
+
+do_install:append() {
+    # Runtime libraries go to ${libdir} for the loader; the link symlinks and static libraries stay in fltk1.3/
+    mv ${D}${libdir}/fltk1.3/lib*.so.1.3* ${D}${libdir}/
+    for lib in ${D}${libdir}/fltk1.3/lib*.so; do
+        name=$(basename $lib)
+        ln -sf ../$name.1.3 $lib
+        ln -sf ../$name.1.3 $lib.1.3
+        ln -sf ../$name.${PV} $lib.${PV}
+    done
+
+    mv ${D}${bindir}/fltk-config ${D}${bindir}/fltk-config1.3
+    mv ${D}${datadir}/fltk ${D}${datadir}/fltk1.3
+    sed -i -e 's,"${prefix}/include","${includedir}/fltk1.3",' ${D}${datadir}/fltk1.3/FLTKConfig.cmake
+    sed -i -e 's,${TMPDIR},,g' ${D}${bindir}/fltk-config1.3 ${D}${datadir}/fltk1.3/*.cmake
+
+    # Manual pages are the same as those of fltk
+    rm -rf ${D}${mandir}
+}
+
+FILES:${PN}-staticdev += "${libdir}/fltk1.3/*.a"
+FILES:${PN}-dev += " \
+    ${bindir}/fltk-config1.3 \
+    ${libdir}/fltk1.3 \
+    ${datadir}/fltk1.3 \
+"
+
+# Keep the package names apart from those of fltk
+AUTO_LIBNAME_PKGS = ""
