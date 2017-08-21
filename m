Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id AFF5477DCA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Aug 2017 07:22:54 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id 30so18194427wrk.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Aug 2017 00:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hEeFPvo4PjJS5LheWb4hQRSLUTjizj3lR78E/d85yb0=;
	b=GSW2JV2fBK4KAnKkvgeCnqAdovj/f8jcWLfoKYtnNhjfSxJk5W7lYdDLvfdkCVZkGi
	XqT4/544zoz8Gq8b5kWkj3/vTpV5maH9Hxji2BIUNrsScz1kIG9SKVuaKy+7kpIkifch
	+f54wlJDOrGeKGoLQfP3tEkqPK42eDanll/BmeFMw7YdpPyYZ/u9Vezn3H1qwodz+GnP
	PFFULiXYjPV5oXpMc1lLjxEMSA4i0a5EM8S0Uu9R5mDZ0u2kGF3827DMUwZ/iiKOqfXa
	b/pR1Edc6O0bUb9B5P6zCkIWzoewUbrzOTf6axX9sOdMTtvruPy4kLK1sBtLWD3ZDxNj
	I1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hEeFPvo4PjJS5LheWb4hQRSLUTjizj3lR78E/d85yb0=;
	b=Ej4Vo8Tip2huCipBrfPgCd749giXntH6R3LpAc90xeuQR8wOIwNDoexfjcLdiNIQ+e
	tGCSFvlfcBnqO+06k/ISTIP08N2smK1ZDtjWXeZCb086oeuWqsolQMGhBZFYsHrO/gCe
	WHTD/3Uc8qkCzVoAo1UYj+Rcx18Yju6jqDJl1Tb2JXo0UyEWxfiR8qk+vUbW3mjFlgA2
	NOVkMETjvfrpXHiVf6N6o9UqJ4XVmKlZD8tIUC35k59MzpEQVtIkNh38SDX+dBVfONlL
	3t8GtAB6OmDj1DklyhstNlgJXGX1E9BJ7MDcWE7arvQSmFRVcbVix4RfIGFvJ67XI+U3
	hL3w==
X-Gm-Message-State: AHYfb5j6pjbVyZjdTRpOa1vtUqQMHCJxRMKtc2jkgedL2Y7aFxJGXg04
	SO3h/FWR+Lzzzxc8
X-Received: by 10.28.232.8 with SMTP id f8mr6503730wmh.24.1503300173200;
	Mon, 21 Aug 2017 00:22:53 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	r79sm10844789wmd.42.2017.08.21.00.22.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Aug 2017 00:22:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Aug 2017 09:24:32 +0200
Message-Id: <20170821072432.11823-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.0
MIME-Version: 1.0
Subject: [meta-efl][PATCH] meta-efl: remove this now pretty empty layer
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
X-List-Received-Date: Mon, 21 Aug 2017 07:22:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/COPYING.MIT                               |  17 --
 meta-efl/README                                    |  18 --
 meta-efl/classes/e-base.bbclass                    |  14 --
 meta-efl/classes/e.bbclass                         |  22 ---
 meta-efl/classes/efl.bbclass                       |  66 -------
 .../conf/distro/include/efl-from-svn-recipes.inc   |  43 -----
 meta-efl/conf/layer.conf                           |  35 ----
 meta-efl/recipes-core/meta/meta-toolchain-efl.bb   |   6 -
 meta-efl/recipes-devtools/python/python-edbus.inc  |  46 -----
 meta-efl/recipes-devtools/python/python-efl.inc    |  71 -------
 meta-efl/recipes-efl/e17/cpu/configure.patch       |  13 --
 meta-efl/recipes-efl/e17/e-module.inc              |  19 --
 .../0001-dbus-stuff-Convert-to-eldbus.patch        | 204 ---------------------
 .../e17/e-wm-theme-illume-efenniht/LICENSE         |  25 ---
 meta-efl/recipes-efl/e17/e-wm.inc                  | 200 --------------------
 .../e17/e-wm/0001-Fix-incorrect-message-type.patch |  28 ---
 .../e17/e-wm/0001-configure.ac-add-foreign.patch   |  29 ---
 meta-efl/recipes-efl/e17/e-wm/applications.menu    | 105 -----------
 .../recipes-efl/e17/e-wm/enlightenment_start.oe    |   9 -
 .../recipes-efl/e17/elmdentica/configure.patch     |  13 --
 ...position-as-percent-and-define-a-1-second.patch | 133 --------------
 meta-efl/recipes-efl/e17/enjoy/configure.patch     |  13 --
 meta-efl/recipes-efl/e17/ephoto/configure.patch    |  13 --
 .../recipes-efl/e17/exalt-client/configure.patch   |  28 ---
 .../recipes-efl/e17/exquisite-theme-illume/LICENSE |  25 ---
 meta-efl/recipes-efl/e17/exquisite/exquisite-init  |  40 ----
 meta-efl/recipes-efl/e17/exquisite/splashfuncs     |  29 ---
 meta-efl/recipes-efl/e17/flame/configure.patch     |  13 --
 meta-efl/recipes-efl/e17/forecasts/configure.patch |  13 --
 ...file-update-KEYBOARDS_DIR-for-new-illume2.patch |  23 ---
 .../recipes-efl/e17/illume-keyboards-shr/LICENSE   |  25 ---
 .../recipes-efl/e17/illume-keyboards-shr_git.bb    | 100 ----------
 meta-efl/recipes-efl/e17/places/configure.patch    |  13 --
 meta-efl/recipes-efl/e17/rain/configure.patch      |  13 --
 .../screenshot/screenshot-fix-mkinstalldirs.patch  |  23 ---
 meta-efl/recipes-efl/e17/terminology.inc           |  22 ---
 meta-efl/recipes-efl/e17/uptime/configure.patch    |  13 --
 .../recipes-efl/efl/e-wm-illume-dict-pl_git.bb     |  18 --
 .../efl/ecore/fix-ecore-fb-initialization.patch    |  41 -----
 meta-efl/recipes-efl/efl/edb_svn.bb                |  16 --
 meta-efl/recipes-efl/efl/edbus.inc                 |  29 ---
 meta-efl/recipes-efl/efl/edje-fpu.inc              |   6 -
 .../efl/elementary-theme-efenniht/LICENSE          |  25 ---
 meta-efl/recipes-efl/efl/elementary.inc            |  89 ---------
 ...e-elementary_codegen-defined-in-configure.patch |  29 ---
 .../recipes-efl/efl/emotion-generic-players.inc    |  14 --
 ...am-use-common-auth-instead-of-system-auth.patch |  26 ---
 meta-efl/recipes-efl/efl/entrance/entrance.service |   8 -
 ...alias-functions-poppler-has-dropped-them-.patch | 132 -------------
 ...r_postscript.cpp-fix-build-for-poppler-AP.patch |  45 -----
 meta-efl/recipes-efl/efl/evas-generic-loaders.inc  |  73 --------
 meta-efl/recipes-efl/efl/expedite.inc              |  25 ---
 meta-efl/recipes-efl/efl/imlib2_git.bb             |  45 -----
 .../efl/libeflvala/disable.eina.test.patch         |  44 -----
 .../packagegroups/packagegroup-efl-sdk.inc         |  12 --
 ...ine-comparison_fn_t-for-non-glibc-systems.patch |  33 ----
 .../id3-plugin-support-out-of-tree-build.patch     |  11 --
 .../lightmediascanner/lightmediascanner_0.5.1.bb   |  63 -------
 58 files changed, 2306 deletions(-)
 delete mode 100644 meta-efl/COPYING.MIT
 delete mode 100644 meta-efl/README
 delete mode 100644 meta-efl/classes/e-base.bbclass
 delete mode 100644 meta-efl/classes/e.bbclass
 delete mode 100644 meta-efl/classes/efl.bbclass
 delete mode 100644 meta-efl/conf/distro/include/efl-from-svn-recipes.inc
 delete mode 100644 meta-efl/conf/layer.conf
 delete mode 100644 meta-efl/recipes-core/meta/meta-toolchain-efl.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-edbus.inc
 delete mode 100644 meta-efl/recipes-devtools/python/python-efl.inc
 delete mode 100644 meta-efl/recipes-efl/e17/cpu/configure.patch
 delete mode 100644 meta-efl/recipes-efl/e17/e-module.inc
 delete mode 100644 meta-efl/recipes-efl/e17/e-tasks/0001-dbus-stuff-Convert-to-eldbus.patch
 delete mode 100644 meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht/LICENSE
 delete mode 100644 meta-efl/recipes-efl/e17/e-wm.inc
 delete mode 100644 meta-efl/recipes-efl/e17/e-wm/0001-Fix-incorrect-message-type.patch
 delete mode 100644 meta-efl/recipes-efl/e17/e-wm/0001-configure.ac-add-foreign.patch
 delete mode 100644 meta-efl/recipes-efl/e17/e-wm/applications.menu
 delete mode 100644 meta-efl/recipes-efl/e17/e-wm/enlightenment_start.oe
 delete mode 100644 meta-efl/recipes-efl/e17/elmdentica/configure.patch
 delete mode 100644 meta-efl/recipes-efl/e17/enjoy/0001-always-use-position-as-percent-and-define-a-1-second.patch
 delete mode 100644 meta-efl/recipes-efl/e17/enjoy/configure.patch
 delete mode 100644 meta-efl/recipes-efl/e17/ephoto/configure.patch
 delete mode 100644 meta-efl/recipes-efl/e17/exalt-client/configure.patch
 delete mode 100644 meta-efl/recipes-efl/e17/exquisite-theme-illume/LICENSE
 delete mode 100644 meta-efl/recipes-efl/e17/exquisite/exquisite-init
 delete mode 100644 meta-efl/recipes-efl/e17/exquisite/splashfuncs
 delete mode 100644 meta-efl/recipes-efl/e17/flame/configure.patch
 delete mode 100644 meta-efl/recipes-efl/e17/forecasts/configure.patch
 delete mode 100644 meta-efl/recipes-efl/e17/illume-keyboards-shr/0001-Makefile-update-KEYBOARDS_DIR-for-new-illume2.patch
 delete mode 100644 meta-efl/recipes-efl/e17/illume-keyboards-shr/LICENSE
 delete mode 100644 meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb
 delete mode 100644 meta-efl/recipes-efl/e17/places/configure.patch
 delete mode 100644 meta-efl/recipes-efl/e17/rain/configure.patch
 delete mode 100644 meta-efl/recipes-efl/e17/screenshot/screenshot-fix-mkinstalldirs.patch
 delete mode 100644 meta-efl/recipes-efl/e17/terminology.inc
 delete mode 100644 meta-efl/recipes-efl/e17/uptime/configure.patch
 delete mode 100644 meta-efl/recipes-efl/efl/e-wm-illume-dict-pl_git.bb
 delete mode 100644 meta-efl/recipes-efl/efl/ecore/fix-ecore-fb-initialization.patch
 delete mode 100644 meta-efl/recipes-efl/efl/edb_svn.bb
 delete mode 100644 meta-efl/recipes-efl/efl/edbus.inc
 delete mode 100644 meta-efl/recipes-efl/efl/edje-fpu.inc
 delete mode 100644 meta-efl/recipes-efl/efl/elementary-theme-efenniht/LICENSE
 delete mode 100644 meta-efl/recipes-efl/efl/elementary.inc
 delete mode 100644 meta-efl/recipes-efl/efl/elementary/0001-Makefile-Use-elementary_codegen-defined-in-configure.patch
 delete mode 100644 meta-efl/recipes-efl/efl/emotion-generic-players.inc
 delete mode 100644 meta-efl/recipes-efl/efl/entrance/0001-pam-use-common-auth-instead-of-system-auth.patch
 delete mode 100644 meta-efl/recipes-efl/efl/entrance/entrance.service
 delete mode 100644 meta-efl/recipes-efl/efl/epdf/0001-remove-antialias-functions-poppler-has-dropped-them-.patch
 delete mode 100644 meta-efl/recipes-efl/efl/epdf/0002-epdf_poppler_postscript.cpp-fix-build-for-poppler-AP.patch
 delete mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders.inc
 delete mode 100644 meta-efl/recipes-efl/efl/expedite.inc
 delete mode 100644 meta-efl/recipes-efl/efl/imlib2_git.bb
 delete mode 100644 meta-efl/recipes-efl/efl/libeflvala/disable.eina.test.patch
 delete mode 100644 meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.inc
 delete mode 100644 meta-efl/recipes-multimedia/lightmediascanner/files/0001-Define-comparison_fn_t-for-non-glibc-systems.patch
 delete mode 100644 meta-efl/recipes-multimedia/lightmediascanner/files/id3-plugin-support-out-of-tree-build.patch
 delete mode 100644 meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.5.1.bb

diff --git a/meta-efl/COPYING.MIT b/meta-efl/COPYING.MIT
deleted file mode 100644
index fb950dc69..000000000
--- a/meta-efl/COPYING.MIT
+++ /dev/null
@@ -1,17 +0,0 @@
-Permission is hereby granted, free of charge, to any person obtaining a copy 
-of this software and associated documentation files (the "Software"), to deal 
-in the Software without restriction, including without limitation the rights 
-to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
-copies of the Software, and to permit persons to whom the Software is 
-furnished to do so, subject to the following conditions:
-
-The above copyright notice and this permission notice shall be included in 
-all copies or substantial portions of the Software.
-
-THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
-IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
-FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
-AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
-LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
-OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
-THE SOFTWARE.
diff --git a/meta-efl/README b/meta-efl/README
deleted file mode 100644
index cfffc4723..000000000
--- a/meta-efl/README
+++ /dev/null
@@ -1,18 +0,0 @@
-This layer depends on:
-
-URI: git://github.com/openembedded/oe-core.git
-branch: master
-revision: HEAD
-
-URI: git://github.com/openembedded/meta-oe.git
-layers: meta-oe, meta-python
-branch: master
-revision: HEAD
-
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-efl]' in the subject'
-
-When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-efl][PATCH'
-
-Interim layer maintainers: Koen Kooi <koen@dominion.thruhere.net>
-                           Martin Jansa <martin.jansa@gmail.com>
diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
deleted file mode 100644
index e0ae2285d..000000000
--- a/meta-efl/classes/e-base.bbclass
+++ /dev/null
@@ -1,14 +0,0 @@
-HOMEPAGE = "http://www.enlightenment.org"
-SRCNAME ?= "${BPN}"
-SRCVER ?= "${PV}"
-
-EFL_SRCREV ?= "82070"
-
-ARM_INSTRUCTION_SET = "arm"
-
-S = "${WORKDIR}/${SRCNAME}-${SRCVER}"
-
-# each efl or e17 module is installing module.so in different directory, disable shlibs providers for them
-# evas-engine-gl-x11-1.7.7 evas-engine-software-16-1.7.7 evas-engine-software-16-x11-1.7.7 evas-engine-software-x11-1.7.7 evas-engine-wayland-shm-1.7.7 evas-cserve2-bmp-1.7.7 evas-cserve2-eet-1.7.7 evas-cserve2-ico-1.7.7 evas-cserve2-jpeg-1.7.7 evas-cserve2-pmaps-1.7.7 evas-cserve2-png-1.7.7 evas-cserve2-psd-1.7.7 evas-cserve2-tga-1.7.7 evas-cserve2-tiff-1.7.7 evas-cserve2-wbmp-1.7.7 evas-cserve2-xpm-1.7.7 evas-loader-bmp-1.7.7 evas-loader-generic-1.7.7 evas-loader-gif-1.7.7 evas-loader-ico-1.7.7 evas-loader-jpeg-1.7.7 evas-loader-pmaps-1.7.7 evas-loader-png-1.7.7 evas-loader-psd-1.7.7 evas-loader-tga-1.7.7 evas-loader-tiff-1.7.7 evas-loader-wbmp-1.7.7 evas-loader-xpm-1.7.7 evas-saver-jpeg-1.7.7 evas-saver-png-1.7.7 evas-saver-tiff-1.7.7 evas-engine-fb-1.7.7
-# emotion-1.7.7 elementary-1.7.7 elementary-tests-1.7.7 elementary-accessibility-1.7.7 e-wm-0.17.3 elfe-0.0.1+svnr82070 shr-e-gadgets-0.0.0+gitr1+27b6c17d73 cpu-0.0.1+svnr82070 places-0.1.0+svnr82070 forecasts-0.2.0+svnr82070 uptime-0.0.2+svnr82070 screenshot-0.3.0+svnr82070 exalt-client-0.0.1+svnr82070 diskio-0.0.1+svnr82070 rain-0.0.3+svnr82070 news-0.1.0+svnr82070 flame-0.0.3+svnr82070
-PRIVATE_LIBS = "module.so"
diff --git a/meta-efl/classes/e.bbclass b/meta-efl/classes/e.bbclass
deleted file mode 100644
index 4ee80bf57..000000000
--- a/meta-efl/classes/e.bbclass
+++ /dev/null
@@ -1,22 +0,0 @@
-SECTION = "e/apps"
-
-inherit e-base autotools pkgconfig binconfig
-
-do_prepsources () {
-    make clean distclean || true
-}
-addtask prepsources after do_patch before do_configure
-
-do_configure_append() {
-    find ${B} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
-}
-
-export CURL_CONFIG = "${STAGING_BINDIR_CROSS}/curl-config"
-export FREETYPE_CONFIG = "${STAGING_BINDIR_CROSS}/freetype-config"
-
-PACKAGES =+ "${PN}-themes"
-PACKAGES += "${PN}-lib"
-
-FILES_${PN}-lib = "${libdir}/lib*.so.*"
-FILES_${PN}-themes = "${datadir}/${PN}/themes ${datadir}/${PN}/data ${datadir}/${PN}/fonts ${datadir}/${PN}/pointers ${datadir}/${PN}/images ${datadir}/${PN}/users ${datadir}/${PN}/images ${datadir}/${PN}/styles"
-FILES_${PN}-dev += "${includedir} ${libdir}/lib*.so"
diff --git a/meta-efl/classes/efl.bbclass b/meta-efl/classes/efl.bbclass
deleted file mode 100644
index eb40e4bc3..000000000
--- a/meta-efl/classes/efl.bbclass
+++ /dev/null
@@ -1,66 +0,0 @@
-SECTION = "e/libs"
-LICENSE = "MIT & BSD"
-DEPENDS += "pkgconfig-native"
-
-# revision 0d93ec84b30bc1bee2caaee72d667f87bc468a70 made SRCDATE and hence PV go backwards, so we need to up PE to unbreak builds and feeds :(
-PE = "2"
-
-inherit e-base autotools
-
-# evas-native looks at this var, so keep it
-
-do_configure_prepend() {
-    autopoint || touch config.rpath
-}
-
-do_install_prepend () {
-    for i in `find ${B}/ -name "*.pc" -type f` ; do \
-        sed -i -e 's:-L${STAGING_LIBDIR}:-L\$\{libdir\}:g' -e 's:-I${STAGING_LIBDIR}:-I\$\{libdir\}:g' -e 's:-I${STAGING_INCDIR}:-I\$\{includedir\}:g' $i
-    done
-}
-
-PACKAGES =+ "${PN}-themes"
-PACKAGES += "${PN}-tests"
-PACKAGES += "${PN}-eolian"
-
-FILES_${PN} = "${libdir}/*.so.* \
-               ${libdir}/edje/modules/${PN}/*/module.so \
-               ${libdir}/${PN}/plugins/*.so \
-               ${datadir}/dbus-1/services/* \
-"
-
-
-FILES_${PN}-themes = "${datadir}/${PN}/themes \
-                      ${datadir}/${PN}/data \
-                      ${libdir}/${PN}/plugins/data/*.edj \
-                      ${datadir}/${PN}/fonts \
-                      ${datadir}/${PN}/pointers \
-                      ${datadir}/${PN}/images \
-                      ${datadir}/${PN}/users \
-                      ${datadir}/${PN}/images \
-                      ${datadir}/${PN}/styles"
-
-FILES_${PN}-dev   += "${bindir}/${PN}-config \
-                      ${libdir}/pkgconfig/* \
-                      ${libdir}/lib*.la \
-                      ${libdir}/*.so \
-                      ${libdir}/${PN}/*.la \
-                      ${libdir}/${PN}/*/*.la \
-                      ${datadir}/${PN}/edje_externals \
-                      ${libdir}/edje/modules/${PN}/*/module.la \
-"
-
-FILES_${PN}-eolian = " \
-    ${datadir}/eolian/include \
-"
-
-FILES_${PN}-staticdev += "${libdir}/${BPN}/*/*.a"
-
-FILES_${PN}-dbg +=   "${libdir}/${PN}/.debug \
-                      ${libdir}/${PN}/*/.debug \
-                      ${libdir}/edje/modules/${PN}/*/.debug/module.so \
-"
-
-FILES_${PN}-tests  = "${bindir}/${PN} \
-                      ${bindir}/*_* \
-                      ${datadir}/${PN}"
diff --git a/meta-efl/conf/distro/include/efl-from-svn-recipes.inc b/meta-efl/conf/distro/include/efl-from-svn-recipes.inc
deleted file mode 100644
index 23a8eaeca..000000000
--- a/meta-efl/conf/distro/include/efl-from-svn-recipes.inc
+++ /dev/null
@@ -1,43 +0,0 @@
-EFL_PREFERRED_VERSION ?= "1.7.4+svn%"
-EFL_PREFERRED_PYTHON_VERSION ?= "1.7.0+svn%"
-
-PREFERRED_VERSION_e-wm ?= "0.17.0+svnr%"
-
-PREFERRED_VERSION_ecore ?= "${EFL_PREFERRED_VERSION}"
-PREFERRED_VERSION_ecore-native ?= "${EFL_PREFERRED_VERSION}"
-PREFERRED_VERSION_edbus ?= "${EFL_PREFERRED_VERSION}"
-PREFERRED_VERSION_edbus-native ?= "${EFL_PREFERRED_VERSION}"
-PREFERRED_VERSION_edje ?= "${EFL_PREFERRED_VERSION}"
-PREFERRED_VERSION_edje-native ?= "${EFL_PREFERRED_VERSION}"
-PREFERRED_VERSION_edje-nativesdk ?= "${EFL_PREFERRED_VERSION}"
-PREFERRED_VERSION_eeze ?= "${EFL_PREFERRED_VERSION}"
-PREFERRED_VERSION_eeze-native ?= "${EFL_PREFERRED_VERSION}"
-PREFERRED_VERSION_efreet ?= "${EFL_PREFERRED_VERSION}"
-PREFERRED_VERSION_efreet-native ?= "${EFL_PREFERRED_VERSION}"
-PREFERRED_VERSION_eina ?= "${EFL_PREFERRED_VERSION}"
-PREFERRED_VERSION_eina-native ?= "${EFL_PREFERRED_VERSION}"
-PREFERRED_VERSION_embryo ?= "${EFL_PREFERRED_VERSION}"
-PREFERRED_VERSION_embryo-native ?= "${EFL_PREFERRED_VERSION}"
-PREFERRED_VERSION_evas ?= "${EFL_PREFERRED_VERSION}"
-PREFERRED_VERSION_evas-generic-loaders ?= "${EFL_PREFERRED_VERSION}"
-PREFERRED_VERSION_evas-native ?= "${EFL_PREFERRED_VERSION}"
-PREFERRED_VERSION_expedite ?= "${EFL_PREFERRED_VERSION}"
-PREFERRED_VERSION_expedite-native ?= "${EFL_PREFERRED_VERSION}"
-
-PREFERRED_VERSION_eet ?= "${EFL_PREFERRED_VERSION}"
-PREFERRED_VERSION_eet-native ?= "${EFL_PREFERRED_VERSION}"
-
-PREFERRED_VERSION_eio ?= "${EFL_PREFERRED_VERSION}"
-PREFERRED_VERSION_eio-native ?= "${EFL_PREFERRED_VERSION}"
-PREFERRED_VERSION_emotion ?= "${EFL_PREFERRED_VERSION}"
-PREFERRED_VERSION_ethumb ?= "${EFL_PREFERRED_VERSION}"
-PREFERRED_VERSION_elementary ?= "${EFL_PREFERRED_VERSION}"
-
-PREFERRED_VERSION_python-elementary ?= "${EFL_PREFERRED_PYTHON_VERSION}"
-PREFERRED_VERSION_python-ecore ?= "${EFL_PREFERRED_PYTHON_VERSION}"
-PREFERRED_VERSION_python-edbus ?= "${EFL_PREFERRED_PYTHON_VERSION}"
-PREFERRED_VERSION_python-edje ?= "${EFL_PREFERRED_PYTHON_VERSION}"
-PREFERRED_VERSION_python-emotion ?= "${EFL_PREFERRED_PYTHON_VERSION}"
-PREFERRED_VERSION_python-evas ?= "${EFL_PREFERRED_PYTHON_VERSION}"
-
-PREFERRED_VERSION_terminology ?= "0.2.0+svn%"
diff --git a/meta-efl/conf/layer.conf b/meta-efl/conf/layer.conf
deleted file mode 100644
index ea90ce28d..000000000
--- a/meta-efl/conf/layer.conf
+++ /dev/null
@@ -1,35 +0,0 @@
-# We have a conf and classes directory, append to BBPATH 
-BBPATH .= ":${LAYERDIR}"
-
-# We have a recipes directory, add to BBFILES
-BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
-
-BBFILE_COLLECTIONS += "efl-layer"
-BBFILE_PATTERN_efl-layer := "^${LAYERDIR}/"
-BBFILE_PRIORITY_efl-layer = "7"
-
-# This should only be incremented on significant changes that will
-# cause compatibility issues with other layers
-LAYERVERSION_efl-layer = "1"
-
-LAYERDEPENDS_efl-layer = "core openembedded-layer"
-
-E_MIRROR = "http://download.enlightenment.org/releases"
-E_RELEASES = "http://download.enlightenment.org/rel"
-E_SVN = "svn://svn.enlightenment.org/svn/e"
-
-# RDEPENDS on update-alternatives provider opkg-utils
-SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
-  exquisite-theme-illume->opkg-utils \
-"
-
-# RDEPENDS on e-wm
-SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
-  e-wm-theme-illume-efenniht->e-wm \
-  e-wm-theme-illume-neo->e-wm \
-  e-wm-theme-b-and-w->e-wm \
-"
-
-SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
-  packagegroup-efl-sdk->packagegroup-core-sdk \
-"
diff --git a/meta-efl/recipes-core/meta/meta-toolchain-efl.bb b/meta-efl/recipes-core/meta/meta-toolchain-efl.bb
deleted file mode 100644
index b7b7fca89..000000000
--- a/meta-efl/recipes-core/meta/meta-toolchain-efl.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-TOOLCHAIN_TARGET_EFLTASK ?= "packagegroup-efl-standalone-sdk-target packagegroup-efl-standalone-sdk-target-dbg"
-TOOLCHAIN_TARGET_TASK = "${TOOLCHAIN_TARGET_EFLTASK}"
-TOOLCHAIN_OUTPUTNAME = "${SDK_NAME}-toolchain-efl-${DISTRO_VERSION}"
-require recipes-core/meta/meta-toolchain.bb
-
-TOOLCHAIN_NEED_CONFIGSITE_CACHE += "zlib"
diff --git a/meta-efl/recipes-devtools/python/python-edbus.inc b/meta-efl/recipes-devtools/python/python-edbus.inc
deleted file mode 100644
index cc6008387..000000000
--- a/meta-efl/recipes-devtools/python/python-edbus.inc
+++ /dev/null
@@ -1,46 +0,0 @@
-DESCRIPTION = "${PN} bindings"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-AUTHOR = "Gustavo Sverzut Barbieri <barbieri@gmail.com>"
-# NOTE: Due to a bug in distutils, even if we don't use pyrex but cython,
-# we need to build pyrex otherwise cython doesn't get called to build
-# the extension modules.
-DEPENDS = "python-cython-native python-pyrex-native python-numeric eina edbus python-dbus"
-RDEPENDS_${PN} += "python-lang python-dbus"
-
-inherit e-base autotools pkgconfig distutils-base
-
-SRCNAME = "python-e_dbus"
-SRCVER = "${PV}"
-
-SRC_URI = "\
-    ${E_MIRROR}/BINDINGS/python/${SRCNAME}-${SRCVER}.tar.bz2 \
-"
-S = "${WORKDIR}/${SRCNAME}-${SRCVER}"
-
-
-do_configure_prepend() {
-    # prefix CYTHON_.*_INCLUDEDIR with path to STAGING_DIR_HOST also use $PKG_CONFIG instead of pkg-config directly
-    sed -i "s#=\`\$PKG_CONFIG --variable=includedir \"python-evas#=${STAGING_DIR_HOST}\`\$PKG_CONFIG --variable=includedir \"python-evas#g" ${S}/configure.ac
-}
-
-do_install_append() {
-    if [ -e examples ]; then
-        for i in `find examples -name "*.edc"`; do
-            cd ${S}/`dirname $i`
-            echo "Generating .edj file for $i..."
-            edje_cc `basename $i`
-            echo "Removing sources in this directory..."
-            rm -f *.edc *.png *.ttf *.jpeg
-        done
-        cd ${S}
-        install -d ${D}${datadir}/${PN}/
-        cp -R --no-dereference --preserve=mode,links -v examples ${D}${datadir}/${PN}/
-        find ${D}${datadir}/${PN}/examples -name ".svn" | xargs rm -rf
-    fi
-}
-
-FILES_${PN}-dbg += "${libdir}/${PYTHON_DIR}/site-packages/*.egg/*/*/.debug"
-
-PACKAGES += "${PN}-examples"
-FILES_${PN}-examples = "${datadir}/${PN}/examples"
diff --git a/meta-efl/recipes-devtools/python/python-efl.inc b/meta-efl/recipes-devtools/python/python-efl.inc
deleted file mode 100644
index 6837dab9f..000000000
--- a/meta-efl/recipes-devtools/python/python-efl.inc
+++ /dev/null
@@ -1,71 +0,0 @@
-DESCRIPTION = "${PN} bindings"
-
-LICENSE = "LGPL-3.0"
-LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02"
-# there is also GPLv3.0 in COPYING;md5=d32239bcb673463ab874e80d47fae504 but no file seems to use that
-
-AUTHOR = "Gustavo Sverzut Barbieri <barbieri@gmail.com>"
-# NOTE: Due to a bug in distutils, even if we don't use pyrex but cython,
-# we need to build pyrex otherwise cython doesn't get called to build
-# the extension modules.
-DEPENDS = "python-cython-native python-pyrex-native python-numeric python-dbus lua efl elementary"
-RDEPENDS_${PN} += "python-lang"
-
-PROVIDES = "python-ecore python-eldbus python-edje python-elementary python-emotion python-evas"
-
-inherit e-base distutils pkgconfig
-
-SRCVER = "${PV}"
-
-SRC_URI = "\
-    ${E_RELEASES}/bindings/python/${SRCNAME}-${SRCVER}.tar.gz \
-"
-S = "${WORKDIR}/${SRCNAME}-${SRCVER}"
-
-do_install_append() {
-    # drop all .pyo, pyc files
-    find ${D}${libdir}/${PYTHON_DIR}/site-packages -name \*.pyo -o -name \*.pyc | xargs rm -f
-}
-
-PACKAGES += "python-ecore python-eldbus python-edje python-elementary python-emotion python-evas python-ethumb ${PN}-examples"
-
-FILES_${PN} = " \
-    ${libdir}/${PYTHON_DIR}/site-packages/python_efl*egg-info \
-    ${libdir}/${PYTHON_DIR}/site-packages/efl/eo.so \
-    ${libdir}/${PYTHON_DIR}/site-packages/efl/utils \
-    ${libdir}/${PYTHON_DIR}/site-packages/efl/__init__.py \
-"
-FILES_${PN}-dbg += "${libdir}/${PYTHON_DIR}/site-packages/*.egg/*/*/.debug"
-FILES_${PN}-dev += "${libdir}/${PYTHON_DIR}/site-packages/*/*.la"
-
-FILES_${PN}-examples = "${datadir}/${PN}/examples"
-
-FILES_python-ecore = " \
-    ${libdir}/${PYTHON_DIR}/site-packages/ecore/ \
-    ${libdir}/${PYTHON_DIR}/site-packages/efl/ecore*.so \
-    ${libdir}/${PYTHON_DIR}/site-packages/efl/ecore \
-"
-FILES_python-eldbus = " \
-    ${libdir}/${PYTHON_DIR}/site-packages/e_dbus/ \
-    ${libdir}/${PYTHON_DIR}/site-packages/efl/dbus_mainloop.so \
-"
-FILES_python-edje = " \
-    ${libdir}/${PYTHON_DIR}/site-packages/edje/ \
-    ${libdir}/${PYTHON_DIR}/site-packages/efl/edje*.so \
-"
-FILES_python-elementary = " \
-    ${libdir}/${PYTHON_DIR}/site-packages/elementary/ \
-    ${libdir}/${PYTHON_DIR}/site-packages/efl/elementary/ \
-"
-FILES_python-emotion = " \
-    ${libdir}/${PYTHON_DIR}/site-packages/emotion/ \
-    ${libdir}/${PYTHON_DIR}/site-packages/efl/emotion.so \
-"
-FILES_python-evas = " \
-    ${libdir}/${PYTHON_DIR}/site-packages/evas/ \
-    ${libdir}/${PYTHON_DIR}/site-packages/efl/evas.so \
-"
-FILES_python-ethumb = " \
-    ${libdir}/${PYTHON_DIR}/site-packages/ethumb/ \
-    ${libdir}/${PYTHON_DIR}/site-packages/efl/ethumb*so \
-"
diff --git a/meta-efl/recipes-efl/e17/cpu/configure.patch b/meta-efl/recipes-efl/e17/cpu/configure.patch
deleted file mode 100644
index 87c85de9f..000000000
--- a/meta-efl/recipes-efl/e17/cpu/configure.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: cpu/configure.ac
-===================================================================
---- cpu.orig/configure.ac	2014-07-17 20:39:48.000000000 +0000
-+++ cpu/configure.ac	2014-07-17 21:39:55.320555868 +0000
-@@ -10,7 +10,7 @@
- AC_CANONICAL_HOST
- AC_ISC_POSIX
- 
--AM_INIT_AUTOMAKE(1.6)
-+AM_INIT_AUTOMAKE([foreign])
- AM_CONFIG_HEADER(config.h)
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
- 
diff --git a/meta-efl/recipes-efl/e17/e-module.inc b/meta-efl/recipes-efl/e17/e-module.inc
deleted file mode 100644
index 770f794aa..000000000
--- a/meta-efl/recipes-efl/e17/e-module.inc
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "E17 ${PN} module"
-SECTION = "x11/multimedia"
-DEPENDS = "e-wm"
-
-SRCREV = "${EFL_SRCREV}"
-INC_PR = "r0"
-
-SRCNAME = "E-MODULES-EXTRA/${BPN}"
-
-inherit e gettext
-SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
-S = "${WORKDIR}/${SRCNAME}"
-
-EXTRA_OECONF = "--with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc"
-
-FILES_${PN} += "${libdir}/enlightenment/modules/${PN}"
-FILES_${PN}-dbg += "${libdir}/enlightenment/modules/${PN}/*/.debug"
-FILES_${PN}-staticdev += "${libdir}/enlightenment/modules/${PN}/*/*.a"
-
diff --git a/meta-efl/recipes-efl/e17/e-tasks/0001-dbus-stuff-Convert-to-eldbus.patch b/meta-efl/recipes-efl/e17/e-tasks/0001-dbus-stuff-Convert-to-eldbus.patch
deleted file mode 100644
index f92a772fe..000000000
--- a/meta-efl/recipes-efl/e17/e-tasks/0001-dbus-stuff-Convert-to-eldbus.patch
+++ /dev/null
@@ -1,204 +0,0 @@
-From 37223289b3d85ea8876e7ba7c9ff97ec428073ba Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sat, 22 Feb 2014 14:36:38 +0100
-Subject: [PATCH] dbus-stuff: Convert to eldbus
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- configure.ac     |  2 +-
- src/Makefile.am  |  2 +-
- src/dbus-stuff.c | 95 ++++++++++++++++++++++++++++++++------------------------
- src/dbus-stuff.h | 13 ++------
- src/main.c       |  2 +-
- 5 files changed, 61 insertions(+), 53 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index b3e4d12..4ace32a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -15,7 +15,7 @@ AC_HEADER_STDC
- 
- AM_PROG_LIBTOOL
- 
--PKG_CHECK_MODULES(TASKS, [elementary eina dbus-1 edbus sqlite3])
-+PKG_CHECK_MODULES(TASKS, [elementary eina dbus-1 eldbus sqlite3])
- 
- AC_OUTPUT([
- Makefile
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 2143dc9..31d5253 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -8,7 +8,7 @@ AM_CPPFLAGS = \
- 	$(TASKS_CFLAGS)
- 
- AM_CFLAGS =\
--         $(EDBUS_CFLAGS) \
-+         $(ELDBUS_CFLAGS) \
- 	 -Wall\
- 	 -g
- 
-diff --git a/src/dbus-stuff.c b/src/dbus-stuff.c
-index 50809bc..9f02ef3 100644
---- a/src/dbus-stuff.c
-+++ b/src/dbus-stuff.c
-@@ -1,8 +1,7 @@
- /***************************************************************************
-  *            dbus-stuff.c
-  *
-- *  Copyright  2009  cchandel
-- *  <cchandel@yahoo.com>
-+ *  Copyright  2009  cchandel <cchandel@yahoo.com>
-  ****************************************************************************/
- 
- /*
-@@ -21,51 +20,67 @@
-  * Foundation, Inc., 51 Franklin Street, Fifth Floor Boston, MA 02110-1301,  USA
-  */
- #include "dbus-stuff.h"
--#include <string.h>
--#include <E_DBus.h>
--#include <Elementary.h>
-+#include "Eldbus.h"
- 
--void occupy_cpu(void)
-+void on_usage_cb(void *data EINA_UNUSED, const Eldbus_Message *msg, Eldbus_Pending *pending EINA_UNUSED)
-+{
-+        const char *errname, *errmsg;
-+        if (eldbus_message_error_get(msg, &errname, &errmsg))
-+	        fprintf(stderr, "Error: %s %s\n", errname, errmsg);
-+}
-+
-+int ousaged_resource(const char *resource, int used)
- {	
--	e_dbus_init();
--	conn = e_dbus_bus_get(DBUS_BUS_SYSTEM);
--	
--	DBusMessage *msg;
--	msg = dbus_message_new_method_call(
--		"org.freesmartphone.ousaged",
--		"/org/freesmartphone/Usage",
--		"org.freesmartphone.Usage",
--		"RequestResource"
--	);
--	
--	const char *resource = "CPU";
--	dbus_message_append_args (msg, DBUS_TYPE_STRING, &resource, DBUS_TYPE_INVALID);
-+	eldbus_init();
-+	const char *REQUEST = "RequestResource";
-+	const char *RELEASE = "ReleaseResource";
-+	const int   PREQUEST = 1;
- 
--	e_dbus_message_send(conn, msg, dbus_reply_cb, -1, NULL);
--	dbus_message_unref(msg);
--}
-+        Eldbus_Connection *conn;
-+        Eldbus_Object *obj;
-+        Eldbus_Proxy *usage;
-+        Eldbus_Pending *pending;
-+	conn = eldbus_connection_get(ELDBUS_CONNECTION_TYPE_SYSTEM);
-+        if (!conn)
-+        {
-+                fprintf(stderr, "Error: could not get system bus\n");
-+                return EXIT_FAILURE;
-+        }
- 
--void release_cpu(void)
--{
--	DBusMessage *msg;
--	msg = dbus_message_new_method_call(
--		"org.freesmartphone.ousaged",
--		"/org/freesmartphone/Usage",
--		"org.freesmartphone.Usage",
--		"ReleaseResource"
--	);
--	
--	const char *resource = "CPU";
--	dbus_message_append_args (msg, DBUS_TYPE_STRING, &resource, DBUS_TYPE_INVALID);
-+        obj = eldbus_object_get(conn, "org.freesmartphone.ousaged", "/org/freesmartphone/Usage");
-+        if (!obj)
-+        {
-+                fprintf(stderr, "Error: could not get object\n");
-+                return EXIT_FAILURE;
-+        }
- 
--	e_dbus_message_send(conn, msg, dbus_reply_cb, -1, NULL);
--	dbus_message_unref(msg);
-+        usage = eldbus_proxy_get(obj, "org.freesmartphone.Usage");
-+        if (!usage)
-+        {
-+                fprintf(stderr, "Error: could not get proxy\n");
-+                return EXIT_FAILURE;
-+        }
-+
-+        pending = eldbus_proxy_call(usage, used == PREQUEST ? REQUEST : RELEASE, on_usage_cb, NULL, -1, "ss", resource);
-+        if (!pending)
-+        {
-+                fprintf(stderr, "Error: could not call\n");
-+                return EXIT_FAILURE;
-+        }
-+        eldbus_proxy_unref(usage);
-+        eldbus_object_unref(obj);
-+        eldbus_connection_unref(conn);
-+
-+        eldbus_shutdown();
-+	return EXIT_SUCCESS;
- }
- 
--void dbus_reply_cb(void *data, DBusMessage *replymsg, DBusError *error)
-+int request_cpu(void)
- {
--	if (dbus_error_is_set(error)) {
--		printf("Error: %s - %s\n", error->name, error->message);
--	}
-+        return ousaged_resource("CPU", 1);
- }
- 
-+int release_cpu(void)
-+{
-+        return ousaged_resource("CPU" , 0);
-+}
-diff --git a/src/dbus-stuff.h b/src/dbus-stuff.h
-index 83d4778..a3c72cb 100644
---- a/src/dbus-stuff.h
-+++ b/src/dbus-stuff.h
-@@ -2,8 +2,7 @@
-  *            dbus.h
-  *
-  *  Fri Mar  6 12:32:57 2009
-- *  Copyright  2009  nidhin
-- *  <nidhin@nids-laptop.home>
-+ *  Copyright  2009  nidhin <nidhin@nids-laptop.home>
-  ****************************************************************************/
- 
- /*
-@@ -22,11 +21,5 @@
-  * Foundation, Inc., 51 Franklin Street, Fifth Floor Boston, MA 02110-1301,  USA
-  */
- 
--#include <E_DBus.h>
--#include <Elementary.h>
--
--void occupy_cpu(void);
--void release_cpu(void);
--void dbus_reply_cb(void *data, DBusMessage *replymsg, DBusError *error);
--
--E_DBus_Connection *conn;
-+int request_cpu(void);
-+int release_cpu(void);
-diff --git a/src/main.c b/src/main.c
-index 92d21de..4e4bbe2 100644
---- a/src/main.c
-+++ b/src/main.c
-@@ -76,7 +76,7 @@ elm_main(int argc, char **argv)
- 	//restore state
- 	restore_state();
- 
--	occupy_cpu();
-+	request_cpu();
- 
- 	elm_run();
- 	//clean up stuff
--- 
-1.8.5.3
-
diff --git a/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht/LICENSE b/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht/LICENSE
deleted file mode 100644
index 61bb2f603..000000000
--- a/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht/LICENSE
+++ /dev/null
@@ -1,25 +0,0 @@
-Copyright notice for Enlightenment:
-
-Copyright (C) 2000-2010 Carsten Haitzler and various contributors (see AUTHORS)
-
-All rights reserved.
-
-Redistribution and use in source and binary forms, with or without
-modification, are permitted provided that the following conditions are met:
-
-   1. Redistributions of source code must retain the above copyright
-      notice, this list of conditions and the following disclaimer.
-   2. Redistributions in binary form must reproduce the above copyright 
-      notice, this list of conditions and the following disclaimer in the
-      documentation and/or other materials provided with the distribution.
-
-THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, 
-INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
-FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
-COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
-INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
-LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
-OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
-LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
-NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
-EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
diff --git a/meta-efl/recipes-efl/e17/e-wm.inc b/meta-efl/recipes-efl/e17/e-wm.inc
deleted file mode 100644
index a6e964b55..000000000
--- a/meta-efl/recipes-efl/e17/e-wm.inc
+++ /dev/null
@@ -1,200 +0,0 @@
-DESCRIPTION = "The Enlightenment Window Manager Version 17"
-DEPENDS = "eet evas eina ecore edje efreet edbus eeze eio elementary libxcb xcb-util-keysyms"
-LICENSE = "MIT & BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=76de290eb3fdda12121830191c152a7d"
-SRCNAME = "e"
-
-inherit e update-alternatives gettext pkgconfig
-S = "${WORKDIR}/${SRCNAME}"
-
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam systemd', d)}"
-PACKAGECONFIG[pam] = "--enable-pam,--disable-pam,libpam"
-PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
-
-EXTRA_OECONF = "\
-    --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \
-    --with-eet-eet=${STAGING_BINDIR_NATIVE}/eet \
-    --x-includes=${STAGING_INCDIR}/X11 \
-    --x-libraries=${STAGING_LIBDIR} \
-    --enable-simple-x11 \
-"
-
-do_configure_prepend() {
-    autopoint || true
-    sed '/^ *EFL_PKG_CHECK_VAR/ s/systemduserunitdir/systemdsystemunitdir/g' -i ${S}/configure.ac
-}
-
-do_install_append() {
-    # customising - should rather make this simple upstream
-    install -m 755 ${WORKDIR}/enlightenment_start.oe ${D}/${bindir}
-
-    # security reasons, e-wm checks that in runtime
-    # xinit[418]: ERROR: CONFIGURATION FILE HAS BAD PERMISSIONS
-    chmod 600 ${D}/${sysconfdir}/enlightenment/sysactions.conf
-
-    install -d ${D}/${sysconfdir}/xdg/menus
-    install -m 644 ${WORKDIR}/applications.menu ${D}/${sysconfdir}/xdg/menus/
-    for I in `find ${D}/${libdir}/enlightenment -name "*.a" -print`; do rm -f $I; done
-    for I in `find ${D}/${libdir}/enlightenment -name "*.la" -print`; do rm -f $I; done
-
-    # work around for issue caused in r78978, more infor in:
-    # http://sourceforge.net/mailarchive/forum.php?thread_name=20121118194904.GA3438%40jama.jama.net&forum_name=enlightenment-devel
-    mv ${D}/${libdir}/enlightenment/modules/policies ${D}/${libdir}/enlightenment/modules/illume2/ \
-      || echo "illume2 policies are in correct place now"
-    mv ${D}/${libdir}/enlightenment/modules/keyboards ${D}/${libdir}/enlightenment/modules/illume2/ \
-      || echo "illume2 keyboards are in correct place now"
-}
-
-RDEPENDS_${PN} += "\
-    shared-mime-info \
-    mime-support \
-    setxkbmap \
-    edje-utils \
-    ${PN}-utils \
-    dbus-x11 \
-"
-
-# Uclibc build don't have 'glibc-utils'
-RDEPENDS_${PN}_append_libc-glibc = " glibc-utils "
-
-# The systray module used to be external, but is part of e-wm now
-RREPLACES_${PN} = "systray"
-
-RREPLACES_${PN}-config-mobile = "${PN}-config-illume2"
-RCONFLICTS_${PN}-config-mobile = "${PN}-config-illume2"
-RPROVIDES_${PN}-config-mobile = "${PN}-config-illume2"
-
-PACKAGES =+ "\
-    ${PN}-config-default \
-    ${PN}-config-mobile \
-    ${PN}-config-minimalist \
-    ${PN}-config-netbook \
-    ${PN}-config-scaleable \
-    ${PN}-config-standard \
-    ${PN}-config-tiling \
-    ${PN}-theme-default \
-    ${PN}-background-dark-gradient \
-    ${PN}-background-light-gradient \
-    ${PN}-backgrounds \
-    ${PN}-images \
-    ${PN}-icons \
-    ${PN}-other \
-    ${PN}-input-methods \
-    ${PN}-sysactions \
-    ${PN}-utils \
-    ${PN}-menu \
-    efm-desktop-icon \
-    illume-keyboard-default-alpha \
-    illume-keyboard-default-numeric \
-    illume-keyboard-default-terminal \
-"
-
-ESYSACTIONS ?= "${PN}-sysactions"
-
-RRECOMMENDS_${PN} = "\
-    ${PN}-config-default \
-    ${PN}-images \
-    ${PN}-icons \
-    ${PN}-other \
-    ${PN}-input-methods \
-    ${ESYSACTIONS} \
-    efreet \
-    evas-generic-loader-svg \
-"
-
-FILES_${PN} = "\
-    ${bindir}/* \
-    ${libdir}/enlightenment/utils/* \
-    ${libdir}/enlightenment/modules/*/*.* \
-    ${libdir}/enlightenment/modules/*/*/* \
-    ${libdir}/enlightenment/modules/*/*/.order \
-    ${libdir}/enlightenment/modules/keyboards/ignore_built_in_keyboards \
-    ${libdir}/enlightenment/*plugins/*/*/* \
-    ${libdir}/enlightenment/preload/e_precache.so \
-    ${datadir}/enlightenment/data/icons \
-    ${datadir}/enlightenment/data/favorites \
-    ${datadir}/enlightenment/data/input_methods \
-    ${datadir}/enlightenment/data/config/profile.cfg \
-    ${datadir}/enlightenment/AUTHORS \
-    ${datadir}/enlightenment/COPYING \
-    ${datadir}/xsessions/enlightenment.desktop \
-    ${sysconfdir}/xdg \
-    ${systemd_unitdir} \
-"
-
-FILES_${PN}-config-default = "${datadir}/enlightenment/data/config/default"
-FILES_${PN}-config-mobile = "${datadir}/enlightenment/data/config/mobile"
-FILES_${PN}-config-minimalist = "${datadir}/enlightenment/data/config/minimalist"
-FILES_${PN}-config-netbook = "${datadir}/enlightenment/data/config/netbook"
-FILES_${PN}-config-scaleable = "${datadir}/enlightenment/data/config/scaleable"
-FILES_${PN}-config-standard = "${datadir}/enlightenment/data/config/standard"
-FILES_${PN}-config-tiling = "${datadir}/enlightenment/data/config/tiling"
-FILES_${PN}-theme-default = "${datadir}/enlightenment/data/themes/default.edj"
-FILES_${PN}-theme-default = "${datadir}/enlightenment/data/themes/default.edj"
-FILES_${PN}-background-dark-gradient = "${datadir}/enlightenment/data/backgrounds/Dark_Gradient.edj"
-FILES_${PN}-background-light-gradient = "${datadir}/enlightenment/data/backgrounds/Light_Gradient.edj"
-FILES_${PN}-backgrounds = "${datadir}/enlightenment/data/backgrounds/*.edj"
-FILES_${PN}-images = "${datadir}/enlightenment/data/images ${datadir}/enlightenment/data/flags"
-FILES_${PN}-icons = "${datadir}/enlightenment/data/icons"
-FILES_${PN}-other = "${datadir}/enlightenment/data/other"
-FILES_${PN}-input-methods = "${datadir}/enlightenment/data/input_methods"
-FILES_${PN}-sysactions = "${sysconfdir}/enlightenment/sysactions.conf"
-FILES_${PN}-utils = "${libdir}/enlightenment/utils/*"
-FILES_${PN}-menu = "${sysconfdir}/xdg/menus/applications.menu"
-
-FILES_efm-desktop-icon = "\
-    ${datadir}/applications/efm.desktop \
-    ${datadir}/applications/enlightenment_filemanager.desktop \
-    ${datadir}/icons/e-module-fileman.png \
-"
-
-KEYBOARDS_DIR="${libdir}/enlightenment/modules/illume-keyboard/keyboards"
-FILES_illume-keyboard-default-alpha = "\
-    ${KEYBOARDS_DIR}/Default.kbd \
-    ${KEYBOARDS_DIR}/alpha.png \
-"
-FILES_illume-keyboard-default-numeric = "\
-    ${KEYBOARDS_DIR}/Numbers.kbd \
-    ${KEYBOARDS_DIR}/numeric.png \
-"
-FILES_illume-keyboard-default-terminal = "\
-    ${KEYBOARDS_DIR}/Terminal.kbd \
-    ${KEYBOARDS_DIR}/qwerty.png \
-"
-
-RRECOMMENDS_${PN}-config-default = "${PN}-theme-default"
-RRECOMMENDS_${PN}-config-mobile = "\
-    illume-keyboard-default-alpha \
-    illume-keyboard-default-numeric \
-    illume-keyboard-default-terminal \
-"
-
-RRECOMMENDS_${PN}-config-minimalist = "\
-    ${PN}-background-light-gradient \
-    ${PN}-theme-default \
-"
-RRECOMMENDS_${PN}-config-netbook = "\
-    ${PN}-background-dark-gradient \
-    ${PN}-theme-default \
-"
-RRECOMMENDS_${PN}-config-scaleable = "${PN}-theme-default"
-RRECOMMENDS_${PN}-config-standard = "${PN}-theme-default"
-
-FILES_${PN}-dbg += "\
-    ${libdir}/enlightenment/modules/*/*/.debug/ \
-    ${libdir}/enlightenment/modules/policies/.debug/ \
-    ${libdir}/enlightenment/preload/.debug/ \
-    ${libdir}/enlightenment/utils/.debug/ \
-    ${libdir}/enlightenment/*plugins/*/*/.debug \
-"
-
-FILES_${PN}-doc += "\
-    ${datadir}/enlightenment/doc \
-"
-
-CONFFILES_${PN}-menu = "${sysconfdir}/xdg/menus/applications.menu"
-CONFFILES_${PN}-sysactions = "/etc/enlightenment/sysactions.conf"
-
-ALTERNATIVE_${PN} = "x-window-manager"
-ALTERNATIVE_TARGET[x-window-manager] = "${bindir}/enlightenment_start.oe"
-ALTERNATIVE_PRIORITY[x-window-manager] = "16"
diff --git a/meta-efl/recipes-efl/e17/e-wm/0001-Fix-incorrect-message-type.patch b/meta-efl/recipes-efl/e17/e-wm/0001-Fix-incorrect-message-type.patch
deleted file mode 100644
index e718ef3db..000000000
--- a/meta-efl/recipes-efl/e17/e-wm/0001-Fix-incorrect-message-type.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 0aef43c9cd1656413cf2eb3dc7c19b355ee7ed52 Mon Sep 17 00:00:00 2001
-From: Carlos Rafael Giani <dv@pseudoterminal.org>
-Date: Sun, 1 Jun 2014 14:45:49 +0200
-Subject: [PATCH] Fix incorrect message type
-
-Upstream-Status: Pending
-
-Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
----
- src/bin/e_desk.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/bin/e_desk.c b/src/bin/e_desk.c
-index b156e19..77d7520 100644
---- a/src/bin/e_desk.c
-+++ b/src/bin/e_desk.c
-@@ -221,7 +221,7 @@ e_desk_show(E_Desk *desk)
-    E_Event_Desk_Show *ev;
-    E_Event_Desk_Before_Show *eev;
-    E_Event_Desk_After_Show *eeev;
--   Edje_Message_Float_Set *msg;
-+   Edje_Message_Int_Set *msg;
-    Eina_List *l;
-    E_Shelf *es;
-    int was_zone = 0, x, y, dx = 0, dy = 0;
--- 
-1.8.3.2
-
diff --git a/meta-efl/recipes-efl/e17/e-wm/0001-configure.ac-add-foreign.patch b/meta-efl/recipes-efl/e17/e-wm/0001-configure.ac-add-foreign.patch
deleted file mode 100644
index c7a574c90..000000000
--- a/meta-efl/recipes-efl/e17/e-wm/0001-configure.ac-add-foreign.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 19e59b6e8148388e7a17f10d4390176a50e2917f Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Mon, 25 Aug 2014 16:06:03 +0200
-Subject: [PATCH] configure.ac: add foreign
-
-* fixes:
-  | configure.ac:312: error: required file './ABOUT-NLS' not found
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 51ad0ba..cd77739 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -34,7 +34,7 @@ AH_BOTTOM([
- #endif /* EFL_CONFIG_H__ */
- ])
- 
--AM_INIT_AUTOMAKE([1.11 dist-bzip2 dist-xz -Wno-portability])
-+AM_INIT_AUTOMAKE([1.11 dist-bzip2 dist-xz -Wno-portability foreign])
- AM_SILENT_RULES([yes])
- 
- AC_USE_SYSTEM_EXTENSIONS
--- 
-2.3.0
-
diff --git a/meta-efl/recipes-efl/e17/e-wm/applications.menu b/meta-efl/recipes-efl/e17/e-wm/applications.menu
deleted file mode 100644
index ed9b90662..000000000
--- a/meta-efl/recipes-efl/e17/e-wm/applications.menu
+++ /dev/null
@@ -1,105 +0,0 @@
-<?xml version="1.0"?>
-<!DOCTYPE Menu PUBLIC "-//freedesktop//DTD Menu 1.0//EN" "http://standards.freedesktop.org/menu-spec/menu-1.0.dtd">
-<Menu>
-  <Name>Applications</Name>
-  <!--   <Directory>Applications.directory</Directory> -->
-
-  <!-- Read standard .directory and .desktop file locations -->
-  <DefaultAppDirs>/usr/share/applications</DefaultAppDirs>
-  <DefaultDirectoryDirs/>
-
-  <Menu>
-    <Name>Office</Name>
-    <Directory>Office.directory</Directory>
-    <Include>
-      <And>
-        <Category>Office</Category>
-      </And>
-    </Include>
-  </Menu>
-  
-  <Menu>
-    <Name>Multimedia</Name>
-    <Directory>Multimedia.directory</Directory>
-    <Include>
-      <And>
-        <Category>AudioVideo</Category>
-      </And>
-    </Include>
-  </Menu>
-
-  <Menu>
-    <Name>Graphics</Name>
-    <Directory>Graphics.directory</Directory>
-    <Include>
-      <And>
-        <Category>Graphics</Category>
-      </And>
-    </Include>
-  </Menu>
-
-  <Menu>
-    <Name>Games</Name>
-    <Directory>Games.directory</Directory>
-    <Include>
-      <And>
-        <Or>
-         <Category>Game</Category>
-         <Category>Games</Category>
-        </Or>
-      </And>
-    </Include>
-  </Menu>
-
-  <Menu>
-    <Name>Internet</Name>
-    <Directory>Internet.directory</Directory>
-    <Include>
-      <And>
-        <Or>
-         <Category>Internet</Category>
-         <Category>Network</Category>
-        </Or>
-      </And>
-    </Include>
-  </Menu>
-
-  <Menu>
-    <Name>Settings</Name>
-    <Directory>Settings.directory</Directory>
-    <Include>
-      <And>
-        <Or>
-          <Category>SystemSettings</Category>
-          <Category>Settings</Category>
-        </Or>
-        <Not>
-          <Category>System</Category>
-        </Not>
-      </And>
-    </Include>
-  </Menu>
-
-  <Menu>
-    <Name>Accessories</Name>
-    <Directory>Accessories.directory</Directory>
-    <Include>
-      <And>
-        <Or>
-          <Category>Applications</Category>
-          <Category>Utility</Category>
-        </Or>
-        <Not>
-          <Category>System</Category>
-          <Category>Office</Category>
-          <Category>Internet</Category>
-          <Category>AudioVideo</Category>
-          <Category>Graphics</Category>
-          <Category>Games</Category>
-        </Not>
-      </And>
-    </Include>
-  </Menu>
-  
-</Menu>
-
diff --git a/meta-efl/recipes-efl/e17/e-wm/enlightenment_start.oe b/meta-efl/recipes-efl/e17/e-wm/enlightenment_start.oe
deleted file mode 100644
index ff8617275..000000000
--- a/meta-efl/recipes-efl/e17/e-wm/enlightenment_start.oe
+++ /dev/null
@@ -1,9 +0,0 @@
-#!/bin/sh
-
-E_PROFILE=""
-if [ -r /etc/enlightenment/default_profile ]; then
-  . /etc/enlightenment/default_profile
-fi
-
-renice -2 -p $$
-exec enlightenment_start $E_PROFILE
diff --git a/meta-efl/recipes-efl/e17/elmdentica/configure.patch b/meta-efl/recipes-efl/e17/elmdentica/configure.patch
deleted file mode 100644
index 79a981b47..000000000
--- a/meta-efl/recipes-efl/e17/elmdentica/configure.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: elmdentica/configure.ac
-===================================================================
---- elmdentica.orig/configure.ac	2014-07-17 21:46:14.712566207 +0000
-+++ elmdentica/configure.ac	2014-07-17 21:51:34.960574935 +0000
-@@ -3,7 +3,7 @@
- AM_CONFIG_HEADER(config.h)
- AC_CONFIG_MACRO_DIR([m4])
- 
--AM_INIT_AUTOMAKE
-+AM_INIT_AUTOMAKE([foreign])
- 
- AC_PROG_CC
- AC_GNU_SOURCE
diff --git a/meta-efl/recipes-efl/e17/enjoy/0001-always-use-position-as-percent-and-define-a-1-second.patch b/meta-efl/recipes-efl/e17/enjoy/0001-always-use-position-as-percent-and-define-a-1-second.patch
deleted file mode 100644
index 09624503b..000000000
--- a/meta-efl/recipes-efl/e17/enjoy/0001-always-use-position-as-percent-and-define-a-1-second.patch
+++ /dev/null
@@ -1,133 +0,0 @@
-From 751505501e0db31cf766ec0ae95a6968b4d1eb93 Mon Sep 17 00:00:00 2001
-From: Alban Browaeys <prahal@yahoo.com>
-Date: Wed, 5 Sep 2012 02:58:26 +0000
-Subject: [PATCH] always use position as percent and define a 1 seconds
- tolerance.
-
-Fix "reverb" effect: ie loop between setting the slider to match
-the position and handling slider to position (seek).
----
- data/themes/default.edc |  8 +++-----
- src/bin/win.c           | 28 ++++++++++++++++++++++------
- 2 files changed, 25 insertions(+), 11 deletions(-)
-
-diff --git a/data/themes/default.edc b/data/themes/default.edc
-index ebf8ba4..7a906b1 100644
---- a/data/themes/default.edc
-+++ b/data/themes/default.edc
-@@ -186,7 +186,6 @@ collections {
-    group {
-       name: "nowplaying";
-       script {
--         public cur_length;
-          public mute;
- 
-          public get_time_str(Float:time, time_str[6])
-@@ -201,16 +200,15 @@ collections {
-                new Float:position = getfarg(2);
-                new Float:length = getfarg(3);
-                if (length > 0)
--                  external_param_set_float(PART:"progress.slider", "value", position / length * 100);
-+                  external_param_set_float(PART:"progress.slider", "value", position * 100);
-                else
-                   external_param_set_float(PART:"progress.slider", "value", 0);
- 
-                new time_str[6];
--               get_time_str(position, time_str);
-+               get_time_str(position * length, time_str);
-                set_text(PART:"ejy.text.current_time", time_str);
-                get_time_str(length, time_str);
-                set_text(PART:"ejy.text.total_time", time_str);
--               set_float(cur_length, length);
-             } else if (type == MSG_INT && id == MSG_SHUFFLE) {
-                external_param_set_bool(PART:"buttons.shuffle", "state", getarg(2));
-             } else if (type == MSG_INT && id == MSG_LOOP) {
-@@ -689,7 +687,7 @@ collections {
-             source: "progress.slider";
-             signal: "changed";
-             script {
--               send_message(MSG_FLOAT, MSG_POSITION, (external_param_get_float(PART:"progress.slider", "value") * get_float(cur_length) / 100));
-+               send_message(MSG_FLOAT, MSG_POSITION, (external_param_get_float(PART:"progress.slider", "value") / 100));
-             }
-          }
-          program {
-diff --git a/src/bin/win.c b/src/bin/win.c
-index 2f65953..428e268 100644
---- a/src/bin/win.c
-+++ b/src/bin/win.c
-@@ -194,8 +194,8 @@ _win_play_eval(Win *w)
- {
-    Edje_Message_Float_Set *mf;
- 
--   w->play.position = emotion_object_position_get(w->emotion);
-    w->play.length = emotion_object_play_length_get(w->emotion);
-+   w->play.position = emotion_object_position_get(w->emotion) / w->play.length;
- 
-    if ((w->song) && (w->song->length != (int)w->play.length))
-       db_song_length_set(w->db, w->song, w->play.length);
-@@ -542,8 +542,14 @@ _win_edje_msg(void *data, Evas_Object *o __UNUSED__, Edje_Message_Type type, int
-          else
-            {
-               Edje_Message_Float *m = msg;
-+
-+              if ((((m->val - w->play.position) * w->play.length) < 1.0)
-+                  && (((w->play.position - m->val) * w->play.length) < 1.0))
-+                  return;
-+
-               w->play.position = m->val;
--              emotion_object_position_set(w->emotion, w->play.position);
-+              emotion_object_position_set(w->emotion, w->play.position
-+                                                            * w->play.length);
-               ecore_event_add(ENJOY_EVENT_POSITION_CHANGE, NULL, NULL, NULL);
-            }
-         break;
-@@ -617,16 +623,21 @@ enjoy_control_seek(uint64_t position)
- {
-    Win *w = &_win;
-    double seek_to;
-+   double new_pos = w->play.length / ((double)position / 1e6);
- 
-    if (!w->db) return;
--   seek_to = w->play.position + w->play.length / ((double)position / 1e6);
-+
-+   if ((((new_pos - w->play.position) * w->play.length) < 1.0)
-+       && (((w->play.position - new_pos) * w->play.length) < 1.0)) return;
-+
-+   seek_to = w->play.position + new_pos;
-    if (seek_to <= 0.0)
-      seek_to = 0.0;
-    else if (seek_to >= 1.0)
-      seek_to = 1.0;
- 
-    w->play.position = seek_to;
--   emotion_object_position_set(w->emotion, w->play.position);
-+   emotion_object_position_set(w->emotion, w->play.position * w->play.length);
-    ecore_event_add(ENJOY_EVENT_POSITION_CHANGE, NULL, NULL, NULL);
- }
- 
-@@ -692,15 +703,20 @@ EAPI void
- enjoy_position_set(int32_t position)
- {
-    Win *w = &_win;
-+   double new_pos = w->play.length / ((double)position / 1e6);
- 
-    if (!w->db) return;
--   w->play.position = w->play.length / ((double)position / 1e6);
-+
-+   if ((((new_pos - w->play.position) * w->play.length) < 1.0)
-+       && (((w->play.position - new_pos) * w->play.length) < 1.0)) return;
-+
-+   w->play.position = new_pos;
-    if (w->play.position < 0.0)
-      w->play.position = 0.0;
-    else if (w->play.position > 1.0)
-      w->play.position = 1.0;
- 
--   emotion_object_position_set(w->emotion, w->play.position);
-+   emotion_object_position_set(w->emotion, w->play.position * w->play.length);
-    ecore_event_add(ENJOY_EVENT_POSITION_CHANGE, NULL, NULL, NULL);
- }
- 
--- 
-1.8.5.2
-
diff --git a/meta-efl/recipes-efl/e17/enjoy/configure.patch b/meta-efl/recipes-efl/e17/enjoy/configure.patch
deleted file mode 100644
index 6e0ed7461..000000000
--- a/meta-efl/recipes-efl/e17/enjoy/configure.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac	2014-07-17 21:48:51.284570474 +0000
-+++ git/configure.ac	2014-07-17 21:53:39.104578318 +0000
-@@ -26,7 +26,7 @@
- AC_CANONICAL_HOST
- AC_ISC_POSIX
- 
--AM_INIT_AUTOMAKE(1.6 dist-bzip2)
-+AM_INIT_AUTOMAKE([dist-bzip2 foreign])
- AC_CONFIG_HEADERS(config.h)
- _XTERM_COLORS
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
diff --git a/meta-efl/recipes-efl/e17/ephoto/configure.patch b/meta-efl/recipes-efl/e17/ephoto/configure.patch
deleted file mode 100644
index 59466f8af..000000000
--- a/meta-efl/recipes-efl/e17/ephoto/configure.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: ephoto/configure.ac
-===================================================================
---- ephoto.orig/configure.ac	2014-07-17 21:48:51.028570467 +0000
-+++ ephoto/configure.ac	2014-07-17 21:52:56.120577146 +0000
-@@ -27,7 +27,7 @@
- AC_CANONICAL_HOST
- AC_ISC_POSIX
- 
--AM_INIT_AUTOMAKE(1.6 dist-bzip2)
-+AM_INIT_AUTOMAKE([dist-bzip2 foreign])
- AM_CONFIG_HEADER(src/bin/config.h)
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
- 
diff --git a/meta-efl/recipes-efl/e17/exalt-client/configure.patch b/meta-efl/recipes-efl/e17/exalt-client/configure.patch
deleted file mode 100644
index d4ff801ce..000000000
--- a/meta-efl/recipes-efl/e17/exalt-client/configure.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Index: exalt-client/configure.ac
-===================================================================
---- exalt-client.orig/configure.ac	2014-07-17 21:46:14.712566207 +0000
-+++ exalt-client/configure.ac	2014-07-17 21:47:56.880568991 +0000
-@@ -10,7 +10,7 @@
- AC_CANONICAL_HOST
- AC_ISC_POSIX
- 
--AM_INIT_AUTOMAKE(1.8)
-+AM_INIT_AUTOMAKE([foreign])
- AM_CONFIG_HEADER(config.h)
- 
- AC_PROG_CC
-@@ -29,7 +29,6 @@
- 
- m4_ifdef([AM_GNU_GETTEXT], [
- AM_GNU_GETTEXT([external])
--po_makefile_in=po/Makefile.in
- AM_CONDITIONAL([HAVE_PO], [true])
- ],[
- AM_CONDITIONAL([HAVE_PO], [false])
-@@ -101,6 +100,5 @@
- src/Makefile
- module.desktop
- e_modules-exalt-client.spec
--$po_makefile_in
- ], [
- ])
diff --git a/meta-efl/recipes-efl/e17/exquisite-theme-illume/LICENSE b/meta-efl/recipes-efl/e17/exquisite-theme-illume/LICENSE
deleted file mode 100644
index 61bb2f603..000000000
--- a/meta-efl/recipes-efl/e17/exquisite-theme-illume/LICENSE
+++ /dev/null
@@ -1,25 +0,0 @@
-Copyright notice for Enlightenment:
-
-Copyright (C) 2000-2010 Carsten Haitzler and various contributors (see AUTHORS)
-
-All rights reserved.
-
-Redistribution and use in source and binary forms, with or without
-modification, are permitted provided that the following conditions are met:
-
-   1. Redistributions of source code must retain the above copyright
-      notice, this list of conditions and the following disclaimer.
-   2. Redistributions in binary form must reproduce the above copyright 
-      notice, this list of conditions and the following disclaimer in the
-      documentation and/or other materials provided with the distribution.
-
-THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, 
-INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
-FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
-COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
-INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
-LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
-OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
-LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
-NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
-EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
diff --git a/meta-efl/recipes-efl/e17/exquisite/exquisite-init b/meta-efl/recipes-efl/e17/exquisite/exquisite-init
deleted file mode 100644
index 2de6774ff..000000000
--- a/meta-efl/recipes-efl/e17/exquisite/exquisite-init
+++ /dev/null
@@ -1,40 +0,0 @@
-#!/bin/sh
-
-for x in $(cat /proc/cmdline); do
-  case $x in
-    splash=false)
-      echo "Splash Disabled"
-      exit 0;
-      ;;
-  esac
-done
-
-. /etc/init.d/functions
-
-### Default config here - gets overriden later
-THEME="-t default"
-FPS="-fps 30"
-### Override config - if there is a config file - load it.
-if test -f /etc/exquisite/config; then
-  . /etc/exquisite/config
-fi
-
-args=''
-case `machine_id` in
-  "hp_ipaq_h3100"|"hp_ipaq_h3800")
-     args='-rot 90' ;;
-  "hp_ipaq_3600"|"hp_ipaq_3700"|"hp_ipaq_h3900"|"htc_universal"|*collie|*poodle|*akita|*spitz|*borzoi)
-     args='-rot 270' ;;
-esac
-args=$args" $FPS $THEME"
-
-export EXDIR=/mnt/.splash
-export EXQUISITE_IPC=$EXDIR/exquisite
-mount tmpfs -t tmpfs $EXDIR -o,size=40k
-exquisite -fb -fs $args &
-
-exquisite-write -wait 120
-exquisite-write "PULSATE"
-setterm -blank 0
-setterm -powersave off
-setterm -powerdown 0
diff --git a/meta-efl/recipes-efl/e17/exquisite/splashfuncs b/meta-efl/recipes-efl/e17/exquisite/splashfuncs
deleted file mode 100644
index ada2a96dd..000000000
--- a/meta-efl/recipes-efl/e17/exquisite/splashfuncs
+++ /dev/null
@@ -1,29 +0,0 @@
-status() {
-  if type splash-write >/dev/null 2>&1; then
-    (TMPDIR="/mnt/.splash" EXQUISITE_IPC="$TMPDIR/exquisite" splash-write "$1" || true) &
-  fi
-}
-
-status_position() {
-  status "PROGRESS $1"
-}
-
-status_title() {
-  status "TITLE $1"
-}
-
-status_text() {
-  if test -n "$1"; then
-    status "MSG $1"
-  else
-    status "CLEAR"
-  fi
-}
-
-status_pulse() {
-  status "PULSATE"
-}
-
-status_tick() {
-  status "TICK"
-}
diff --git a/meta-efl/recipes-efl/e17/flame/configure.patch b/meta-efl/recipes-efl/e17/flame/configure.patch
deleted file mode 100644
index 87c85de9f..000000000
--- a/meta-efl/recipes-efl/e17/flame/configure.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: cpu/configure.ac
-===================================================================
---- cpu.orig/configure.ac	2014-07-17 20:39:48.000000000 +0000
-+++ cpu/configure.ac	2014-07-17 21:39:55.320555868 +0000
-@@ -10,7 +10,7 @@
- AC_CANONICAL_HOST
- AC_ISC_POSIX
- 
--AM_INIT_AUTOMAKE(1.6)
-+AM_INIT_AUTOMAKE([foreign])
- AM_CONFIG_HEADER(config.h)
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
- 
diff --git a/meta-efl/recipes-efl/e17/forecasts/configure.patch b/meta-efl/recipes-efl/e17/forecasts/configure.patch
deleted file mode 100644
index 87c85de9f..000000000
--- a/meta-efl/recipes-efl/e17/forecasts/configure.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: cpu/configure.ac
-===================================================================
---- cpu.orig/configure.ac	2014-07-17 20:39:48.000000000 +0000
-+++ cpu/configure.ac	2014-07-17 21:39:55.320555868 +0000
-@@ -10,7 +10,7 @@
- AC_CANONICAL_HOST
- AC_ISC_POSIX
- 
--AM_INIT_AUTOMAKE(1.6)
-+AM_INIT_AUTOMAKE([foreign])
- AM_CONFIG_HEADER(config.h)
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
- 
diff --git a/meta-efl/recipes-efl/e17/illume-keyboards-shr/0001-Makefile-update-KEYBOARDS_DIR-for-new-illume2.patch b/meta-efl/recipes-efl/e17/illume-keyboards-shr/0001-Makefile-update-KEYBOARDS_DIR-for-new-illume2.patch
deleted file mode 100644
index b18a69b0b..000000000
--- a/meta-efl/recipes-efl/e17/illume-keyboards-shr/0001-Makefile-update-KEYBOARDS_DIR-for-new-illume2.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 9316e3973c44b981e73b953b2861060c6902de47 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Mon, 23 Aug 2010 12:54:05 +0200
-Subject: [PATCH] Makefile: update KEYBOARDS_DIR for new illume2
-
----
- Makefile |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 46e9420..3d8757c 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1,5 +1,5 @@
- 
--INSTBASE = /usr/lib/enlightenment/modules/illume/keyboards
-+INSTBASE = /usr/lib/enlightenment/modules/illume-keyboard/keyboards
- 
- FILES-arabic = Arabic.kbd Arabic.png
- FILES-persian = Persian.kbd Persian.png
--- 
-1.7.2
-
diff --git a/meta-efl/recipes-efl/e17/illume-keyboards-shr/LICENSE b/meta-efl/recipes-efl/e17/illume-keyboards-shr/LICENSE
deleted file mode 100644
index 61bb2f603..000000000
--- a/meta-efl/recipes-efl/e17/illume-keyboards-shr/LICENSE
+++ /dev/null
@@ -1,25 +0,0 @@
-Copyright notice for Enlightenment:
-
-Copyright (C) 2000-2010 Carsten Haitzler and various contributors (see AUTHORS)
-
-All rights reserved.
-
-Redistribution and use in source and binary forms, with or without
-modification, are permitted provided that the following conditions are met:
-
-   1. Redistributions of source code must retain the above copyright
-      notice, this list of conditions and the following disclaimer.
-   2. Redistributions in binary form must reproduce the above copyright 
-      notice, this list of conditions and the following disclaimer in the
-      documentation and/or other materials provided with the distribution.
-
-THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, 
-INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
-FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
-COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
-INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
-LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
-OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
-LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
-NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
-EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
diff --git a/meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb b/meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb
deleted file mode 100644
index 6925c872a..000000000
--- a/meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb
+++ /dev/null
@@ -1,100 +0,0 @@
-SECTION = "x11/data"
-
-SRC_URI = "git://git.shr-project.org/repo/illume-keyboards.git;protocol=http;branch=master \
-           file://0001-Makefile-update-KEYBOARDS_DIR-for-new-illume2.patch \
-           file://LICENSE"
-S = "${WORKDIR}/git"
-
-SRCREV = "4064489f359a1addf572089b582f317dff5f50e1"
-PV = "0.0+gitr${SRCPV}"
-PE = "1"
-PR = "r5"
-LICENSE = "MIT & BSD"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=f523ab5986cc79b52a90d2ac3d5454a2"
-
-CLEANBROKEN = "1"
-
-PACKAGES = "\
-illume-keyboard-alpha \
-illume-keyboard-arabic \
-illume-keyboard-browse \
-illume-keyboard-danish \
-illume-keyboard-default-alt \
-illume-keyboard-dutch \
-illume-keyboard-dvorak \
-illume-keyboard-finnish \
-illume-keyboard-french \
-illume-keyboard-german \
-illume-keyboard-hebrew \
-illume-keyboard-numeric-alt \
-illume-keyboard-russian \
-illume-keyboard-russian-terminal \
-illume-keyboard-persian \
-"
-
-inherit allarch
-KEYBOARDS_DIR="${libdir}/enlightenment/modules/illume-keyboard/keyboards"
-
-AUTHOR_illume-keyboard-alpha = "Jesus McCloud"
-DESCRIPTION_illume-keyboard-alpha = "Illume keyboard with phone-like layout"
-FILES_illume-keyboard-alpha = "${KEYBOARDS_DIR}/Alpha.kbd"
-
-AUTHOR_illume-keyboard-arabic = "Mohammad Fahmi / Tom Hacohen"
-DESCRIPTION_illume-keyboard-arabic = "Illume keyboard with arabic layout"
-FILES_illume-keyboard-arabic = "${KEYBOARDS_DIR}/Arabic.kbd ${KEYBOARDS_DIR}/Arabic.png"
-
-AUTHOR_illume-keyboard-browse = "Pander"
-DESCRIPTION_illume-keyboard-browse = "Illume keyboard with a layout optimized for browsing"
-FILES_illume-keyboard-browse = "${KEYBOARDS_DIR}/Browse.kbd ${KEYBOARDS_DIR}/end-browse.png ${KEYBOARDS_DIR}/pagedown-browse.png ${KEYBOARDS_DIR}/browse.png ${KEYBOARDS_DIR}/home-browse.png ${KEYBOARDS_DIR}/pageup-browse.png ${KEYBOARDS_DIR}/space-browse.png"
-
-AUTHOR_illume-keyboard-danish = "Esben Damgaard"
-DESCRIPTION_illume-keyboard-danish = "Illume keyboard with danish layout"
-FILES_illume-keyboard-danish = "${KEYBOARDS_DIR}/Danish.kbd ${KEYBOARDS_DIR}/danish.png"
-
-AUTHOR_illume-keyboard-default-alt = "Pander"
-DESCRIPTION_illume-keyboard-default-alt = "Illume keyboard with an alternative default layout"
-FILES_illume-keyboard-default-alt = "${KEYBOARDS_DIR}/Default-alt.kbd"
-
-AUTHOR_illume-keyboard-dutch = "Pander"
-DESCRIPTION_illume-keyboard-dutch = "Illume keyboard with dutch layout"
-FILES_illume-keyboard-dutch = "${KEYBOARDS_DIR}/capslock-negative.png ${KEYBOARDS_DIR}/end.png ${KEYBOARDS_DIR}/pagedown.png ${KEYBOARDS_DIR}/qwerty-dutch-nl.png ${KEYBOARDS_DIR}/Terminal-dutch-nl.kbd ${KEYBOARDS_DIR}/capslock.png ${KEYBOARDS_DIR}/home.png ${KEYBOARDS_DIR}/pageup.png ${KEYBOARDS_DIR}/space.png"
-
-AUTHOR_illume-keyboard-dvorak = "Gabor Adam TOTH"
-DESCRIPTION_illume-keyboard-dvorak = "Illume keyboard with dvorak layout"
-FILES_illume-keyboard-dvorak = "${KEYBOARDS_DIR}/Dvorak.kbd ${KEYBOARDS_DIR}/dvorak.png"
-
-AUTHOR_illume-keyboard-finnish = "Olof Sjöbergh / Jussi Timperi"
-DESCRIPTION_illume-keyboard-finnish = "Illume keyboard with finnish layout"
-FILES_illume-keyboard-finnish = "${KEYBOARDS_DIR}/Finnish.kbd ${KEYBOARDS_DIR}/Finnish.png"
-
-DESCRIPTION_illume-keyboard-french = "Illume keyboard with french layout"
-FILES_illume-keyboard-french = "${KEYBOARDS_DIR}/Azerty.kbd ${KEYBOARDS_DIR}/Azerty.png"
-
-AUTHOR_illume-keyboard-german = "Florian Hackenberger"
-DESCRIPTION_illume-keyboard-german = "Illume keyboard with german layout"
-FILES_illume-keyboard-german = "${KEYBOARDS_DIR}/German.kbd ${KEYBOARDS_DIR}/German.png"
-
-AUTHOR_illume-keyboard-hebrew = "Tom Hacohen"
-DESCRIPTION_illume-keyboard-hebrew = "Illume keyboard with hebrew layout"
-FILES_illume-keyboard-hebrew = "${KEYBOARDS_DIR}/Hebrew.kbd ${KEYBOARDS_DIR}/Alpha-hebrew-il.png"
-
-AUTHOR_illume-keyboard-numeric-alt = "Pander"
-DESCRIPTION_illume-keyboard-numeric-alt = "Illume keyboard with an alternative numeric layout"
-FILES_illume-keyboard-numeric-alt = "${KEYBOARDS_DIR}/Numbers-alt.kbd ${KEYBOARDS_DIR}/numeric-alt.png"
-
-AUTHOR_illume-keyboard-russian = "lucky"
-DESCRIPTION_illume-keyboard-russian = "Illume keyboard with russian layout"
-FILES_illume-keyboard-russian = "${KEYBOARDS_DIR}/X8_Russian.kbd ${KEYBOARDS_DIR}/X8-russian-ru.png"
-
-AUTHOR_illume-keyboard-russian-terminal = "lucky"
-DESCRIPTION_illume-keyboard-russian-terminal = "Illume keyboard with russian layout for the Terminal"
-FILES_illume-keyboard-russian-terminal = "${KEYBOARDS_DIR}/Terminal_Russian.kbd ${KEYBOARDS_DIR}/Terminal-russian-ru.png"
-
-AUTHOR_illume-keyboard-persian = "slave"
-DESCRIPTION_illume-keyboard-persian = "Illume keyboard with persian layout"
-FILES_illume-keyboard-persian = "${KEYBOARDS_DIR}/Persian.kbd ${KEYBOARDS_DIR}/Persian.png"
-
-do_install() {
-    make DESTDIR=${D} install
-}
-
diff --git a/meta-efl/recipes-efl/e17/places/configure.patch b/meta-efl/recipes-efl/e17/places/configure.patch
deleted file mode 100644
index f8f48345c..000000000
--- a/meta-efl/recipes-efl/e17/places/configure.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: places/configure.ac
-===================================================================
---- places.orig/configure.ac	2014-07-17 21:51:01.276574017 +0000
-+++ places/configure.ac	2014-07-17 21:52:07.096575810 +0000
-@@ -10,7 +10,7 @@
- AC_CANONICAL_HOST
- AC_ISC_POSIX
- 
--AM_INIT_AUTOMAKE(1.8)
-+AM_INIT_AUTOMAKE([foreign])
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
- AM_CONFIG_HEADER(config.h)
- 
diff --git a/meta-efl/recipes-efl/e17/rain/configure.patch b/meta-efl/recipes-efl/e17/rain/configure.patch
deleted file mode 100644
index 87c85de9f..000000000
--- a/meta-efl/recipes-efl/e17/rain/configure.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: cpu/configure.ac
-===================================================================
---- cpu.orig/configure.ac	2014-07-17 20:39:48.000000000 +0000
-+++ cpu/configure.ac	2014-07-17 21:39:55.320555868 +0000
-@@ -10,7 +10,7 @@
- AC_CANONICAL_HOST
- AC_ISC_POSIX
- 
--AM_INIT_AUTOMAKE(1.6)
-+AM_INIT_AUTOMAKE([foreign])
- AM_CONFIG_HEADER(config.h)
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
- 
diff --git a/meta-efl/recipes-efl/e17/screenshot/screenshot-fix-mkinstalldirs.patch b/meta-efl/recipes-efl/e17/screenshot/screenshot-fix-mkinstalldirs.patch
deleted file mode 100644
index 14f1141f1..000000000
--- a/meta-efl/recipes-efl/e17/screenshot/screenshot-fix-mkinstalldirs.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
-Subject: fix screenshot po/ building
-Upstream-Status: Pending
-
-Somehow configure doesn't substitute @MKINSTALLDIRS@ by default anymore,
-however this substitution is required for po/Makefile
-
-Fix that by calling AM_MKINSTALLDIRS from configure.ac
-
-Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
-
-Index: E-MODULES-EXTRA/screenshot/configure.ac
-===================================================================
---- E-MODULES-EXTRA.orig/screenshot/configure.ac	2011-08-17 15:49:22.000000000 +0400
-+++ E-MODULES-EXTRA/screenshot/configure.ac	2011-08-17 15:49:34.000000000 +0400
-@@ -24,6 +24,7 @@
- define([AC_LIBTOOL_LANG_F77_CONFIG], [:])dnl
- AC_PROG_LIBTOOL
- 
-+AM_MKINSTALLDIRS
- m4_ifdef([AM_GNU_GETTEXT_VERSION], [
- AM_GNU_GETTEXT_VERSION([0.14])
- ])
diff --git a/meta-efl/recipes-efl/e17/terminology.inc b/meta-efl/recipes-efl/e17/terminology.inc
deleted file mode 100644
index 24f789f59..000000000
--- a/meta-efl/recipes-efl/e17/terminology.inc
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "Enlightenment Terminal Emulator"
-LICENSE = "MIT & BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4efac6b05b3256ba7da66301ac1ee6c6"
-DEPENDS = "evas ecore edje elementary eina eet emotion"
-
-inherit e gettext
-
-# Because latest release we have is 0.1.0 which sorts lower then 0.1.0+svnr${SRCPV} already in feeds
-PE = "2"
-
-EXTRA_OECONF = "\
-    --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \
-"
-
-FILES_${PN} += "\
-    ${datadir}/icons/terminology.png \
-"
-
-# doesn't start without own theme
-# ERR<770>:terminology utils.c:26 theme_apply() Could not load any theme for group=terminology/background: No Error
-# CRI<770>:terminology main.c:448 elm_main() Couldn't find terminology theme! Forgot 'make install'?
-RDEPENDS_${PN} += "${PN}-themes"
diff --git a/meta-efl/recipes-efl/e17/uptime/configure.patch b/meta-efl/recipes-efl/e17/uptime/configure.patch
deleted file mode 100644
index 87c85de9f..000000000
--- a/meta-efl/recipes-efl/e17/uptime/configure.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: cpu/configure.ac
-===================================================================
---- cpu.orig/configure.ac	2014-07-17 20:39:48.000000000 +0000
-+++ cpu/configure.ac	2014-07-17 21:39:55.320555868 +0000
-@@ -10,7 +10,7 @@
- AC_CANONICAL_HOST
- AC_ISC_POSIX
- 
--AM_INIT_AUTOMAKE(1.6)
-+AM_INIT_AUTOMAKE([foreign])
- AM_CONFIG_HEADER(config.h)
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
- 
diff --git a/meta-efl/recipes-efl/efl/e-wm-illume-dict-pl_git.bb b/meta-efl/recipes-efl/efl/e-wm-illume-dict-pl_git.bb
deleted file mode 100644
index 657adcd92..000000000
--- a/meta-efl/recipes-efl/efl/e-wm-illume-dict-pl_git.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "Polish dictionary for Illume keyboard"
-SECTION = "x11/data"
-SRCREV = "38fdd9bb0d8296e984bb6443466801eea6f62f00"
-PV = "1.0+gitr${SRCPV}"
-PE = "1"
-LICENSE = "MIT & BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f523ab5986cc79b52a90d2ac3d5454a2"
-
-SRC_URI = "git://git.shr-project.org/repo/shr-themes.git;protocol=http;branch=master"
-
-S = "${WORKDIR}/git/e-wm/${PN}"
-
-FILES_${PN} = "${libdir}/enlightenment/modules/illume/dicts/Polish.dic"
-
-do_install() {
-    install -d ${D}${libdir}/enlightenment/modules/illume/dicts
-    install -m 0644 ${S}/Polish.dic        ${D}${libdir}/enlightenment/modules/illume/dicts/Polish.dic
-}
diff --git a/meta-efl/recipes-efl/efl/ecore/fix-ecore-fb-initialization.patch b/meta-efl/recipes-efl/efl/ecore/fix-ecore-fb-initialization.patch
deleted file mode 100644
index 55773a3b9..000000000
--- a/meta-efl/recipes-efl/efl/ecore/fix-ecore-fb-initialization.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 657571197c9d369e12ae31b6777a1929fe3680ef Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sat, 29 Oct 2011 00:16:55 +0200
-Subject: [PATCH] ecore-fb: fix ts init
-
-Upstream-Status: Pending
-
-The whole ecore-fb init logic is somewhat flawed; with this patch we
-get at least a working touchscreen w/ tslib again.
-
-Signed-off-by: Michael 'Mickey' Lauer <mlauer@vanille-media.de>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- ecore/src/lib/ecore_fb/ecore_fb.c |    4 ++++
- 1 files changed, 4 insertions(+), 0 deletions(-)
-
-diff --git a/src/lib/ecore_fb/ecore_fb.c b/src/lib/ecore_fb/ecore_fb.c
-index 5b2b84b..a1904b3 100644
---- a/src/lib/ecore_fb/ecore_fb.c
-+++ b/src/lib/ecore_fb/ecore_fb.c
-@@ -46,6 +46,9 @@ ecore_fb_init(const char *name __UNUSED__)
-    if (!ecore_fb_vt_init())
-       return --_ecore_fb_init_count;
- 
-+   if (!ecore_fb_ts_init())
-+      return --_ecore_fb_init_count;
-+
-    if (!oldhand)
-      {
-         oldhand = signal(SIGINT, nosigint);
-@@ -77,6 +80,7 @@ ecore_fb_shutdown(void)
-         oldhand = NULL;
-      }
-    
-+   ecore_fb_ts_shutdown();
-    ecore_fb_vt_shutdown();
- 
-    return _ecore_fb_init_count;
--- 
-1.7.8.6
-
diff --git a/meta-efl/recipes-efl/efl/edb_svn.bb b/meta-efl/recipes-efl/efl/edb_svn.bb
deleted file mode 100644
index 7c6abdaf0..000000000
--- a/meta-efl/recipes-efl/efl/edb_svn.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "Edb is the Enlightenment database library"
-LICENSE = "MIT & BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d8a7c08df3bc3280208b959be7215c25 \
-                    file://COPYING-PLAIN;md5=f59cacc08235a546b0c34a5422133035"
-
-DEPENDS = "zlib"
-PV = "1.0.5.050+svnr${SRCPV}"
-SRCREV = "${EFL_SRCREV}"
-
-inherit efl
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[ncurses] = "--enable-ncurses,--disable-ncurses,ncurses"
-
-SRC_URI = "${E_SVN}/OLD;module=${SRCNAME};protocol=http;scmdata=keep"
-S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/edbus.inc b/meta-efl/recipes-efl/efl/edbus.inc
deleted file mode 100644
index 03d0ee58d..000000000
--- a/meta-efl/recipes-efl/efl/edbus.inc
+++ /dev/null
@@ -1,29 +0,0 @@
-DESCRIPTION = "DBus and HAL convenience wrappers for EFL"
-DEPENDS = "dbus ecore eina"
-LICENSE = "MIT & BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=550b8cea13dacc4bf00508a8cce1074c"
-
-inherit efl
-
-# -dev and -dbg packages wants ${PN} which is empty here
-ALLOW_EMPTY_${PN} = "1"
-
-BBCLASSEXTEND = "native"
-INC_PR = "r0"
-
-SRCNAME = "e_dbus"
-
-# it needs to be disabled, because creates circular dependency on elementary
-EXTRA_OECONF += "--disable-edbus-performance-test"
-
-PACKAGES =+ "${PN}-enotify ${PN}-edbus ${PN}-enm ${PN}-ehal ${PN}-econnman ${PN}-eofono ${PN}-eukit ${PN}-ebluez"
-FILES_${PN}-enotify = "${libdir}/libenotify.so.* ${bindir}/e-notify-send"
-FILES_${PN}-edbus = "${libdir}/libedbus.so.*"
-FILES_${PN}-enm = "${libdir}/libenm.so.*"
-FILES_${PN}-ehal = "${libdir}/libehal.so.*"
-FILES_${PN}-econnman = "${libdir}/libeconnman.so.* ${libdir}/libeconnman0_7x.so.*"
-FILES_${PN}-eofono = "${libdir}/libeofono.so.*"
-FILES_${PN}-eukit = "${libdir}/libeukit.so.*"
-FILES_${PN}-ebluez = "${libdir}/libebluez.so.*"
-FILES_${PN} += "${datadir}/e_dbus/logo.png"
-
diff --git a/meta-efl/recipes-efl/efl/edje-fpu.inc b/meta-efl/recipes-efl/efl/edje-fpu.inc
deleted file mode 100644
index 32a6daf7d..000000000
--- a/meta-efl/recipes-efl/efl/edje-fpu.inc
+++ /dev/null
@@ -1,6 +0,0 @@
-
-def get_edje_fpu_setting(bb, d):
-    if d.getVar('TARGET_FPU') in [ 'soft' ]:
-        return "--enable-fixed-point"
-    return ""
-
diff --git a/meta-efl/recipes-efl/efl/elementary-theme-efenniht/LICENSE b/meta-efl/recipes-efl/efl/elementary-theme-efenniht/LICENSE
deleted file mode 100644
index 61bb2f603..000000000
--- a/meta-efl/recipes-efl/efl/elementary-theme-efenniht/LICENSE
+++ /dev/null
@@ -1,25 +0,0 @@
-Copyright notice for Enlightenment:
-
-Copyright (C) 2000-2010 Carsten Haitzler and various contributors (see AUTHORS)
-
-All rights reserved.
-
-Redistribution and use in source and binary forms, with or without
-modification, are permitted provided that the following conditions are met:
-
-   1. Redistributions of source code must retain the above copyright
-      notice, this list of conditions and the following disclaimer.
-   2. Redistributions in binary form must reproduce the above copyright 
-      notice, this list of conditions and the following disclaimer in the
-      documentation and/or other materials provided with the distribution.
-
-THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, 
-INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
-FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
-COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
-INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
-LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
-OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
-LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
-NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
-EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
diff --git a/meta-efl/recipes-efl/efl/elementary.inc b/meta-efl/recipes-efl/efl/elementary.inc
deleted file mode 100644
index cec67aa72..000000000
--- a/meta-efl/recipes-efl/efl/elementary.inc
+++ /dev/null
@@ -1,89 +0,0 @@
-DESCRIPTION = "EFL based widget set for mobile devices"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a173054a93896e933df53e3382d472c2"
-DEPENDS = "eet-native edje-native elementary-native efreet evas ecore edje eet eldbus ethumb eio"
-DEPENDS_class-native = "efl-native"
-
-inherit efl gettext
-
-EXTRA_OECONF_append_class-target = "\
-    --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \
-    --with-eet-eet=${STAGING_BINDIR_NATIVE}/eet \
-    --with-elementary-codegen=${STAGING_BINDIR_NATIVE}/elementary_codegen \
-    --with-elm-prefs-cc=${STAGING_BINDIR_NATIVE}/elm_prefs_cc \
-    --with-eolian-gen=${STAGING_BINDIR_NATIVE}/eolian_gen \
-    --with-eolian-cxx=${STAGING_BINDIR_NATIVE}/eolian_cxx \
-"
-
-BBCLASSEXTEND = "native"
-
-PACKAGECONFIG[eweather] = "--enable-eweather,--disable-eweather,libeweather"
-PACKAGECONFIG[ewebkit] = "--with-elementary-web-backend=ewebkit,--with-elementary-web-backend=none,webkit-efl"
-# be aware when enabling this for efl-native, we don't provide gcc-native so you need to make
-# sure that all your builders have g++ which supports -std=gnu++11
-PACKAGECONFIG[c++11] = "--enable-cxx-bindings,--disable-cxx-bindings"
-
-do_configure_prepend() {
-    # prefix returned eolian paths with STAGING_DIR_HOST
-    sed -i 's%^\(DEPS_EOLIAN_FLAGS=`.*\)`$%\1 | sed "s#-I\\${prefix}#-I\\${STAGING_DIR_HOST}\\${prefix}#g"`%g' ${S}/configure.ac
-}
-
-do_compile_append_class-target() {
-    sed -i -e s:${STAGING_DIR_TARGET}::g \
-           -e s:/${TARGET_SYS}::g \
-              elementary.pc
-}
-
-PACKAGES += "${PN}-configs ${PN}-accessibility"
-
-RDEPENDS_${PN}_class-native = ""
-
-RDEPENDS_${PN} = "\
-    ${PN}-themes \
-    ${PN}-configs \
-"
-RSUGGESTS_${PN} = "${PN}-tests ${PN}-accessibility"
-
-FILES_${PN} += "\
-    ${libdir}/edje/modules/elm \
-    ${libdir}/elementary/modules/datetime_input_ctxpopup/*/module.so \
-    ${libdir}/elementary/modules/prefs/*/module.so \
-    ${libdir}/elementary/modules/prefs/*/*.edj \
-"
-
-FILES_${PN}-dev += "\
-    ${bindir}/elm_prefs_cc \
-    ${libdir}/elementary/modules/*/*/module.la \
-    ${libdir}/cmake \
-"
-
-FILES_${PN}-themes = "\
-    ${datadir}/elementary/themes \
-"
-
-FILES_${PN}-configs = "\
-    ${datadir}/elementary/config \
-"
-
-FILES_${PN}-dbg += "\
-    ${libdir}/elementary/modules/*/*/.debug \
-    ${libdir}/edje/modules/elm/*/.debug \
-"
-
-FILES_${PN}-tests = "\
-    ${bindir}/elementary* \
-    ${datadir}/elementary/images \
-    ${datadir}/elementary/objects \
-    ${datadir}/elementary/examples \
-    ${datadir}/applications/* \
-    ${datadir}/icons/* \
-    ${libdir}/elementary/modules/test_entry/* \
-    ${libdir}/elementary/modules/test_map/* \
-"
-
-FILES_${PN}-accessibility = "\
-    ${libdir}/elementary/modules/access_output/* \
-"
-
-# Some upgrade path tweaking, as in evas
-AUTO_LIBNAME_PKGS = ""
diff --git a/meta-efl/recipes-efl/efl/elementary/0001-Makefile-Use-elementary_codegen-defined-in-configure.patch b/meta-efl/recipes-efl/efl/elementary/0001-Makefile-Use-elementary_codegen-defined-in-configure.patch
deleted file mode 100644
index 9524c70d7..000000000
--- a/meta-efl/recipes-efl/efl/elementary/0001-Makefile-Use-elementary_codegen-defined-in-configure.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 75d104d105aa03dd9d446fa7d84fa95e0f566cf9 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sat, 11 Jan 2014 12:55:59 +0100
-Subject: [PATCH] Makefile: Use elementary_codegen defined in configure
-
-* using binaries from top_buildir doesn't work when cross-compiling elementary
-  where we need to pass native binaries in configure params
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/examples/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/examples/Makefile.am b/src/examples/Makefile.am
-index fc35c75..1e10b0b 100644
---- a/src/examples/Makefile.am
-+++ b/src/examples/Makefile.am
-@@ -29,7 +29,7 @@ LDADD = \
- @ELEMENTARY_X_LIBS@ \
- $(top_builddir)/src/lib/libelementary.la
- 
--ELEMENTARY_CODEGEN = $(top_builddir)/src/bin/@ELEMENTARY_CODEGEN_PRG@
-+ELEMENTARY_CODEGEN = @elementary_codegen@
- ELEMENTARY_CODEGEN_FLAGS = --prefix=codegen_example
- 
- SRCS = \
--- 
-1.9.0
-
diff --git a/meta-efl/recipes-efl/efl/emotion-generic-players.inc b/meta-efl/recipes-efl/efl/emotion-generic-players.inc
deleted file mode 100644
index 4ab89ae32..000000000
--- a/meta-efl/recipes-efl/efl/emotion-generic-players.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = "Emotion generic players"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a0f11eedf8706bf6d4d6639fb67eb8ae"
-
-DEPENDS = "emotion"
-
-inherit efl
-
-SRCNAME = "emotion_generic_players"
-
-# creates empty packages until you get vlc-2 and enable it here
-PACKAGECONFIG ?= ""
-# needs eina and ecore from efl and vlc-2 (currently we have 1.11)
-PACKAGECONFIG[vlc] = "--with-vlc,--without-vlc,vlc efl"
diff --git a/meta-efl/recipes-efl/efl/entrance/0001-pam-use-common-auth-instead-of-system-auth.patch b/meta-efl/recipes-efl/efl/entrance/0001-pam-use-common-auth-instead-of-system-auth.patch
deleted file mode 100644
index a82d1ed3c..000000000
--- a/meta-efl/recipes-efl/efl/entrance/0001-pam-use-common-auth-instead-of-system-auth.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 14396c52a2556b1ab778a310a318ec19c2829735 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Thu, 24 Nov 2011 13:25:33 +0100
-Subject: [PATCH] pam: use common-auth instead of system-auth
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- PROTO/entrance/data/entrance |    8 ++++----
- 1 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/data/entrance b/data/entrance
-index 872c83d..2b98c3a 100644
---- a/data/entrance
-+++ b/data/entrance
-@@ -1,4 +1,4 @@
--auth	include		system-auth
--account	include		system-auth
--password	include		system-auth
--session	include		system-auth
-+auth	include		common-auth
-+account	include		common-account
-+password	include		common-password
-+session	include		common-session
--- 
-1.7.8.6
-
diff --git a/meta-efl/recipes-efl/efl/entrance/entrance.service b/meta-efl/recipes-efl/efl/entrance/entrance.service
deleted file mode 100644
index 482868695..000000000
--- a/meta-efl/recipes-efl/efl/entrance/entrance.service
+++ /dev/null
@@ -1,8 +0,0 @@
-[Unit]
-Description=Login manager for Enlightenment
-
-[Service]
-ExecStart=/usr/sbin/entrance
-
-[Install]
-Alias=display-manager.service
diff --git a/meta-efl/recipes-efl/efl/epdf/0001-remove-antialias-functions-poppler-has-dropped-them-.patch b/meta-efl/recipes-efl/efl/epdf/0001-remove-antialias-functions-poppler-has-dropped-them-.patch
deleted file mode 100644
index 728ffa6e3..000000000
--- a/meta-efl/recipes-efl/efl/epdf/0001-remove-antialias-functions-poppler-has-dropped-them-.patch
+++ /dev/null
@@ -1,132 +0,0 @@
-From 6691ac5fcbac0e766d4410ae649a13957ae85289 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Thu, 22 Oct 2015 16:27:52 +0200
-Subject: [PATCH 1/2] remove antialias functions - poppler has dropped them in
- the API
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The functions removed were not used.
-
-Upstream-Status: pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- src/lib/epdf_main.h                   | 45 -----------------------------------
- src/lib/mupdf/epdf_mupdf_main.c       | 18 --------------
- src/lib/poppler/epdf_poppler_main.cpp | 21 ----------------
- 3 files changed, 84 deletions(-)
-
-diff --git a/src/lib/epdf_main.h b/src/lib/epdf_main.h
-index 54a57ca..0a79bad 100644
---- a/src/lib/epdf_main.h
-+++ b/src/lib/epdf_main.h
-@@ -29,49 +29,4 @@ EAPI int epdf_shutdown();
-  */
- EAPI const char *epdf_backend_version_get (void);
- 
--/**
-- * @brief Return the state of fonts antialiasing in Poppler
-- *
-- * @return EINA_TRUE if fonts antialiasing enabled, EINA_FALSE otherwise.
-- *
-- * Return EINA_TRUE if the state of fonts antialiasing is enabled in
-- * Poppler, EINA_FALSE otherwise.
-- *
-- * @ingroup Epdf_Main
-- */
--EAPI Eina_Bool epdf_fonts_antialias_get (void);
--
--/**
-- * @brief Sets fonts antialiasing mode in Poppler
-- *
-- * @param on EINA_TRUE to enable fonts antialiasing, EINA_FALSE to disable
-- *
-- * Set @p on to EINA_TRUE to enable fonts antialiasing in Poppler,
-- * EINA_FALSE to disable it.
-- */
--EAPI void epdf_fonts_antialias_set (Eina_Bool on);
--
--/**
-- * @brief Return the state of lines antialiasing in Poppler
-- *
-- * @return EINA_TRUE if lines antialiasing enabled, EINA_FALSE otherwise.
-- *
-- * Return EINA_TRUE if the state of lines antialiasing is enabled in
-- * Poppler, EINA_FALSE otherwise.
-- *
-- * @ingroup Epdf_Main
-- */
--EAPI Eina_Bool epdf_lines_antialias_get (void);
--
--/**
-- * @brief Sets lines antialiasing mode in Poppler
-- *
-- * @param on EINA_TRUE to enable lines antialiasing, EINA_FALSE to disable
-- *
-- * Set @p on to EINA_TRUE to enable lines antialiasing in Poppler,
-- * EINA_FALSE to disable it.
-- */
--EAPI void epdf_lines_antialias_set (Eina_Bool on);
--
--
- #endif /* __EPDF_MAIN_H__ */
-diff --git a/src/lib/mupdf/epdf_mupdf_main.c b/src/lib/mupdf/epdf_mupdf_main.c
-index 17bb830..27c6de2 100644
---- a/src/lib/mupdf/epdf_mupdf_main.c
-+++ b/src/lib/mupdf/epdf_mupdf_main.c
-@@ -37,21 +37,3 @@ epdf_backend_version_get (void)
- {
-    return "0.5";
- }
--
--Eina_Bool epdf_fonts_antialias_get(void)
--{
--   return EINA_TRUE;
--}
--
--void epdf_fonts_antialias_set(Eina_Bool on)
--{
--}
--
--Eina_Bool epdf_lines_antialias_get(void)
--{
--   return EINA_TRUE;
--}
--
--void epdf_lines_antialias_set(Eina_Bool on)
--{
--}
-diff --git a/src/lib/poppler/epdf_poppler_main.cpp b/src/lib/poppler/epdf_poppler_main.cpp
-index 9841987..9efdbe8 100644
---- a/src/lib/poppler/epdf_poppler_main.cpp
-+++ b/src/lib/poppler/epdf_poppler_main.cpp
-@@ -46,24 +46,3 @@ epdf_backend_version_get (void)
- {
-   return POPPLER_VERSION;
- }
--
--Eina_Bool epdf_fonts_antialias_get (void)
--{
--  return globalParams->getAntialias();
--}
--
--void epdf_fonts_antialias_set (Eina_Bool on)
--{
--  /* Nice API */
--  globalParams->setAntialias((char*)(on ? "yes" : "no"));
--}
--
--Eina_Bool epdf_lines_antialias_get (void)
--{
--    return globalParams->getVectorAntialias();
--}
--
--void epdf_lines_antialias_set (Eina_Bool on)
--{
--    globalParams->setVectorAntialias((char*)(on ? "yes" : "no"));
--}
--- 
-2.1.0
-
diff --git a/meta-efl/recipes-efl/efl/epdf/0002-epdf_poppler_postscript.cpp-fix-build-for-poppler-AP.patch b/meta-efl/recipes-efl/efl/epdf/0002-epdf_poppler_postscript.cpp-fix-build-for-poppler-AP.patch
deleted file mode 100644
index c9adaa731..000000000
--- a/meta-efl/recipes-efl/efl/epdf/0002-epdf_poppler_postscript.cpp-fix-build-for-poppler-AP.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From a84c16fdc606f22b993f870b1cea56dd060a35e6 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Thu, 22 Oct 2015 16:55:30 +0200
-Subject: [PATCH 2/2] epdf_poppler_postscript.cpp: fix build for poppler API
- change
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Poppler API was changed in [1]. The patch not only shows the change but also
-inspires how to fix.
-
-[1] http://cgit.freedesktop.org/poppler/poppler/commit/?id=9caf7525409d699c16896653528486451123b485
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- src/lib/poppler/epdf_poppler_postscript.cpp | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/src/lib/poppler/epdf_poppler_postscript.cpp b/src/lib/poppler/epdf_poppler_postscript.cpp
-index 0c2836b..656193b 100644
---- a/src/lib/poppler/epdf_poppler_postscript.cpp
-+++ b/src/lib/poppler/epdf_poppler_postscript.cpp
-@@ -82,11 +82,14 @@ epdf_postscript_print (const Epdf_Postscript *postscript)
- 
-   // FIXME: fix postscript title
- #ifdef HAVE_POPPLER_0_20
-+  std::vector<int> pages;
-+  for (int i = postscript->first_page; i <= postscript->last_page; ++i) {
-+    pages.push_back(i);
-+  }
-   PSOutputDev ps_dev(postscript->filename,
-                      postscript->pdfdoc,
-                      (char *)"PS title",
--                     postscript->first_page,
--                     postscript->last_page,
-+                     pages,
-                      psModePS,
-                      (int)postscript->width,
-                      (int)postscript->height,
--- 
-2.1.0
-
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders.inc b/meta-efl/recipes-efl/efl/evas-generic-loaders.inc
deleted file mode 100644
index d277c1167..000000000
--- a/meta-efl/recipes-efl/efl/evas-generic-loaders.inc
+++ /dev/null
@@ -1,73 +0,0 @@
-DESCRIPTION = "Evas generic loaders"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a87563ed30add2b0e3460272d3138a00"
-DEPENDS = "eina librsvg cairo"
-
-inherit efl
-
-SRCNAME = "evas_generic_loaders"
-
-EXTRA_OECONF = " \
-    --enable-svg \
-    --disable-gstreamer \
-    --disable-libraw \
-    --disable-spectre \
-"
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[poppler] = "--enable-poppler,--disable-poppler,poppler"
-
-PACKAGESPLITFUNCS_prepend = "split_evas_loader_packages "
-
-python split_evas_loader_packages () {
-    bb.note( "splitting packages for evas generic loaders" )
-    basedir = d.expand( '${libdir}/evas/utils')
-
-    do_split_packages(d, basedir, 'evas_image_loader\.(.*)$',
-    output_pattern = "evas-generic-loader-%s",
-    description = 'Evas generic loaders - module %s',
-    allow_dirs=True, recursive=False, extra_depends="" )
-
-    do_split_packages(d, basedir, 'evas_generic_pdf_loader\.(.*)$',
-    output_pattern = "evas-generic-pdf-loader-%s",
-    description = 'Evas generic pdf loaders - module %s',
-    allow_dirs=True, recursive=False, extra_depends="" )
-}
-
-# add symlinks for different format (it doesn't make much sense to package them in separate packages)
-FILES_evas-generic-loader-xcf += " \
-    ${libdir}/evas/utils/evas_image_loader.xcf.gz \
-"
-FILES_evas-generic-loader-svg += " \
-    ${libdir}/evas/utils/evas_image_loader.svg.gz \
-    ${libdir}/evas/utils/evas_image_loader.svgz \
-"
-FILES_evas-generic-loader-pdf += " \
-    ${libdir}/evas/utils/evas_image_loader.doc \
-    ${libdir}/evas/utils/evas_image_loader.docx \
-    ${libdir}/evas/utils/evas_image_loader.odp \
-    ${libdir}/evas/utils/evas_image_loader.ods \
-    ${libdir}/evas/utils/evas_image_loader.odt \
-    ${libdir}/evas/utils/evas_image_loader.ppt \
-    ${libdir}/evas/utils/evas_image_loader.pptx \
-    ${libdir}/evas/utils/evas_image_loader.rtf \
-    ${libdir}/evas/utils/evas_image_loader.xls \
-    ${libdir}/evas/utils/evas_image_loader.xlsx \
-"
-FILES_evas-generic-pdf-loader-libreoffice += " \
-    ${libdir}/evas/utils/evas_generic_pdf_loader.doc \
-    ${libdir}/evas/utils/evas_generic_pdf_loader.docx \
-    ${libdir}/evas/utils/evas_generic_pdf_loader.odp \
-    ${libdir}/evas/utils/evas_generic_pdf_loader.ods \
-    ${libdir}/evas/utils/evas_generic_pdf_loader.odt \
-    ${libdir}/evas/utils/evas_generic_pdf_loader.ppt \
-    ${libdir}/evas/utils/evas_generic_pdf_loader.pptx \
-    ${libdir}/evas/utils/evas_generic_pdf_loader.rtf \
-    ${libdir}/evas/utils/evas_generic_pdf_loader.xls \
-    ${libdir}/evas/utils/evas_generic_pdf_loader.xlsx \
-"
-
-FILES_${PN}-dbg += "${libdir}/evas/utils/.debug"
-
-PACKAGES += "evas-generic-loader-svg"
-PACKAGES_DYNAMIC += "^evas-generic-loader-.* ^evas-generic-pdf-loader-.*"
diff --git a/meta-efl/recipes-efl/efl/expedite.inc b/meta-efl/recipes-efl/efl/expedite.inc
deleted file mode 100644
index 60e85974c..000000000
--- a/meta-efl/recipes-efl/efl/expedite.inc
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION = "Expedite is a comprehensive benchmarking suite for Evas"
-DEPENDS = "eet evas libsdl"
-LICENSE = "MIT & BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d70bc65d46237e4ef386beebe7d0fe5b"
-
-INC_PR = "r0"
-
-inherit e
-
-EXTRA_OECONF = "\
-    --x-includes=${STAGING_INCDIR}/X11 \
-    --x-libraries=${STAGING_LIBDIR} \
-    --enable-simple-x11 \
-\
-    --enable-software-x11 \
-    --enable-xrender-x11 \
-    --enable-software-16-x11 \
-    --enable-opengl-x11 \
-    --enable-fb \
-    --disable-software-ddraw \
-    --disable-direct3d \
-"
-
-FILES_${PN} += "${datadir}"
-RDEPENDS_${PN} = "expedite-themes evas-engine-fb evas-engine-software-generic evas-engine-software-x11 evas-engine-gl-x11 evas-loader-png"
diff --git a/meta-efl/recipes-efl/efl/imlib2_git.bb b/meta-efl/recipes-efl/efl/imlib2_git.bb
deleted file mode 100644
index 355b3341f..000000000
--- a/meta-efl/recipes-efl/efl/imlib2_git.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-SUMMARY = "A graphic library for file loading, saving, rendering, and manipulation"
-LICENSE = "MIT & BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
-
-DEPENDS = "freetype libpng jpeg virtual/libx11 libxext"
-PROVIDES = "virtual/imlib2"
-PV = "1.4.6+gitr${SRCPV}"
-SRCREV = "560a58e61778d84953944f744a025af6ce986334"
-
-inherit efl binconfig
-SRC_URI = "git://git.enlightenment.org/legacy/${BPN}.git"
-S = "${WORKDIR}/git"
-
-# autotools-brokensep
-B = "${S}"
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[gif] = "--with-gif,--without-gif,giflib"
-PACKAGECONFIG[tiff] = "--with-tiff,--without-tiff,tiff"
-PACKAGECONFIG[bzip2] = "--with-bzip2,--without-bzip2,bzip2"
-PACKAGECONFIG[id3] = "--with-id3,--without-id3,libid3tag"
-
-EXTRA_OECONF = "--with-x \
-                --x-includes=${STAGING_INCDIR} \
-                --x-libraries=${STAGING_LIBDIR} "
-
-# TODO: Use more fine granular version
-#OE_LT_RPATH_ALLOW=":${libdir}/imlib2/loaders:${libdir}/imlib2/filters:"
-OE_LT_RPATH_ALLOW = "any"
-OE_LT_RPATH_ALLOW[export]="1"
-
-PACKAGES =+ "imlib2-loaders-dbg imlib2-filters-dbg imlib2-loaders imlib2-filters"
-FILES_${PN} = "${libdir}/lib*.so.* ${libdir}/imlib2/*/*.so"
-FILES_${PN}-dbg = "${libdir}/.debug/ ${bindir}/.debug/ ${prefix}/src/debug/"
-FILES_${PN}-dev += "${bindir}/imlib2-config ${libdir}/*.so ${includedir}"
-FILES_${PN}-bin = "${bindir}"
-FILES_imlib2-loaders = "${libdir}/imlib2/loaders/*.so"
-FILES_imlib2-filters = "${libdir}/imlib2/filters/*.so"
-FILES_imlib2-loaders-dbg += "${libdir}/imlib2/loaders/.debug"
-FILES_imlib2-filters-dbg += "${libdir}/imlib2/filters/.debug"
-
-# png.so jpeg.so id3.so are also provided by lightmediascanner
-PRIVATE_LIBS_imlib2-loaders = "pnm.so lbm.so argb.so tiff.so zlib.so bmp.so tga.so gif.so xpm.so bz2.so"
-
-PRIVATE_LIBS_imlib2-filters = "bumpmap.so colormod.so testfilter.so"
diff --git a/meta-efl/recipes-efl/efl/libeflvala/disable.eina.test.patch b/meta-efl/recipes-efl/efl/libeflvala/disable.eina.test.patch
deleted file mode 100644
index 84be133f6..000000000
--- a/meta-efl/recipes-efl/efl/libeflvala/disable.eina.test.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-It causes testeina.c build to fail linking to internal eina_.*_{init,shutdown} symbols
-as reported in:
-http://lists.alioth.debian.org/pipermail/pkg-fso-maint/2010-May/003056.html
-
-Upstream-Status: Pending
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
-diff -uNr vala/tests/testeina.vala ../../../arm920tt-oe-linux-gnueabi/libeflvala/1_2011.01.13.1+svnr82070-r2/vala/tests/testeina.vala
---- vala/tests/testeina.vala	2014-01-13 16:16:53.984999035 +0100
-+++ ../../../arm920tt-oe-linux-gnueabi/libeflvala/1_2011.01.13.1+svnr82070-r2/vala/tests/testeina.vala	2010-02-26 09:02:06.000000000 +0100
-@@ -153,22 +153,22 @@
- 
- void test_eina_benchmark()
- {
--    assert( Eina.Module.init() );
--    assert( Eina.List.init() );
--    assert( Eina.Array.init() );
--    assert( Eina.Benchmark.init() );
--    assert( Eina.Mempool.init() );
-+//  assert( Eina.Module.init() );
-+//  assert( Eina.List.init() );
-+//  assert( Eina.Array.init() );
-+//  assert( Eina.Benchmark.init() );
-+//  assert( Eina.Mempool.init() );
-     var b = new Eina.Benchmark( "test", "test");
-     assert( b.register( "bogus", spec_one, 0, 100, 5 ) );
-     unowned Eina.Array<string> result = b.run();
-     assert( result.count_get() == 2 );
-     result = null;
-     b = null;
--    assert( Eina.Mempool.shutdown() );
--    assert( Eina.Benchmark.shutdown() );
--    assert( Eina.Array.shutdown() );
--    assert( Eina.List.shutdown() );
--    assert( Eina.Module.shutdown() );
-+//  assert( Eina.Mempool.shutdown() );
-+//  assert( Eina.Benchmark.shutdown() );
-+//  assert( Eina.Array.shutdown() );
-+//  assert( Eina.List.shutdown() );
-+//  assert( Eina.Module.shutdown() );
- }
- 
- //===========================================================================
diff --git a/meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.inc b/meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.inc
deleted file mode 100644
index f2b0456d4..000000000
--- a/meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.inc
+++ /dev/null
@@ -1,12 +0,0 @@
-SDK-EFL = " \
-     efl-dev \
-     elementary-dev \
-     edbus-dev \
-     luajit-dev \
-"
-
-SDK-EXTRAS ?= ""
-SDK-EXTRAS_qemux86 ?= " valgrind lttng-ust-dev"
-SDK-EXTRAS_qemux86-64 ?= " lttng-ust-dev"
-SDK-EXTRAS_qemuppc ?= " lttng-ust-dev"
-SDK-EXTRAS_qemuarm ?= " lttng-ust-dev"
diff --git a/meta-efl/recipes-multimedia/lightmediascanner/files/0001-Define-comparison_fn_t-for-non-glibc-systems.patch b/meta-efl/recipes-multimedia/lightmediascanner/files/0001-Define-comparison_fn_t-for-non-glibc-systems.patch
deleted file mode 100644
index 15d4b3f0e..000000000
--- a/meta-efl/recipes-multimedia/lightmediascanner/files/0001-Define-comparison_fn_t-for-non-glibc-systems.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 5bc5b8c5dad3edec6736fd7e7ce61250c4ce3725 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 12 Jul 2017 17:13:19 -0700
-Subject: [PATCH] Define comparison_fn_t for non-glibc systems
-
-lightmediascanner.c:324:12: error: 'comparison_fn_t' undeclared (first use in this function)
-           (comparison_fn_t)_plugin_sort);
-            ^~~~~~~~~~~~~~~
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/lib/lightmediascanner.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/src/lib/lightmediascanner.c b/src/lib/lightmediascanner.c
-index 344b247..b866883 100644
---- a/src/lib/lightmediascanner.c
-+++ b/src/lib/lightmediascanner.c
-@@ -37,6 +37,11 @@
- #define DEFAULT_SLAVE_TIMEOUT 1000
- #define DEFAULT_COMMIT_INTERVAL 100
- 
-+#if !defined(__GLIBC__)
-+typedef int (*__compar_fn_t) (const void*, const void*);
-+typedef __compar_fn_t comparison_fn_t;
-+#endif
-+
- #ifdef HAVE_MAGIC_H
- static magic_t _magic_handle;
- 
--- 
-2.13.2
-
diff --git a/meta-efl/recipes-multimedia/lightmediascanner/files/id3-plugin-support-out-of-tree-build.patch b/meta-efl/recipes-multimedia/lightmediascanner/files/id3-plugin-support-out-of-tree-build.patch
deleted file mode 100644
index 9528bec79..000000000
--- a/meta-efl/recipes-multimedia/lightmediascanner/files/id3-plugin-support-out-of-tree-build.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/src/plugins/Makefile.am	2015-10-25 16:12:29.331415823 +0000
-+++ b/src/plugins/Makefile.am	2015-10-25 16:14:37.593415808 +0000
-@@ -93,7 +93,7 @@
- id3_id3_la_SOURCES = id3/id3.c id3/id3v1_genres.c
- id3_id3_la_LIBADD = $(PLUGINS_LIBADD)
- 
--id3/id3v1_genres.c: $(srcdir)/id3/id3v1_genres.def $(srcdir)/id3/id3v1_genres_gen.awk
-+$(srcdir)/id3/id3v1_genres.c: $(srcdir)/id3/id3v1_genres.def $(srcdir)/id3/id3v1_genres_gen.awk
- 	$(AWK) -f $(srcdir)/id3/id3v1_genres_gen.awk $(srcdir)/id3/id3v1_genres.def > $@
- 
- EXTRA_DIST += id3/id3v1_genres.def id3/id3v1_genres_gen.awk
diff --git a/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.5.1.bb b/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.5.1.bb
deleted file mode 100644
index f2158760f..000000000
--- a/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.5.1.bb
+++ /dev/null
@@ -1,63 +0,0 @@
-SUMMARY = "Lightweight media scanner"
-DESCRIPTION = "Lightweight media scanner meant to be used in not-so-powerful devices, like embedded systems or old machines."
-SECTION = "libs/multimedia"
-
-LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
-                    file://src/lib/lightmediascanner.c;endline=21;md5=6d8889bccb4c6c27e8b786342a3eb267"
-
-DEPENDS = "file gawk glib-2.0 sqlite3"
-
-PV = "0.5.1+git${SRCPV}"
-SRCREV = "adfddb3486276a5ed2f5008c9e43a811e1271cc9"
-SRC_URI = "git://github.com/profusion/lightmediascanner.git \
-           file://id3-plugin-support-out-of-tree-build.patch \
-           file://0001-Define-comparison_fn_t-for-non-glibc-systems.patch \
-          "
-
-S = "${WORKDIR}/git"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF = "--enable-static --disable-mp4"
-
-PACKAGECONFIG ??= "ogg flac wave id3 m3u pls asf rm jpeg png"
-PACKAGECONFIG[generic] = "--enable-generic,--disable-generic,libav"
-PACKAGECONFIG[ogg] = "--enable-ogg,--disable-ogg,libogg libvorbis libtheora"
-PACKAGECONFIG[flac] = "--enable-flac,--disable-flac,flac"
-PACKAGECONFIG[wave] = "--enable-wave,--disable-wave"
-PACKAGECONFIG[id3] = "--enable-id3,--disable-id3"
-PACKAGECONFIG[m3u] = "--enable-m3u,--disable-m3u"
-PACKAGECONFIG[pls] = "--enable-pls,--disable-pls"
-PACKAGECONFIG[asf] = "--enable-asf,--disable-asf"
-PACKAGECONFIG[rm] = "--enable-rm,--disable-rm"
-PACKAGECONFIG[jpeg] = "--enable-jpeg,--disable-jpeg"
-PACKAGECONFIG[png] = "--enable-png,--disable-png"
-
-do_install_append() {
-       # Install "test" binary for corresponding package
-       install -d ${D}/${bindir}
-       install -m 755 ${B}/src/bin/.libs/test ${D}/${bindir}/test-lms
-       # Remove .la files for loadable modules
-       rm -f ${D}/${libdir}/${PN}/plugins/*.la
-}
-
-FILES_${PN} += "${datadir}/dbus-1"
-FILES_${PN}-dbg += "${libdir}/${PN}/plugins/.debug"
-
-PACKAGES_prepend = "${PN}-test "
-FILES_${PN}-test_prepend = "${bindir}/test-lms "
-
-PACKAGES += "${PN}-meta"
-ALLOW_EMPTY_${PN}-meta = "1"
-
-PACKAGES_DYNAMIC = "${PN}-plugin-*"
-
-python populate_packages_prepend () {
-    lms_libdir = d.expand('${libdir}/${PN}')
-    pkgs = []
-
-    pkgs += do_split_packages(d, oe.path.join(lms_libdir, "plugins"), '^(.*)\.so$', d.expand('${PN}-plugin-%s'), 'LightMediaScanner plugin for %s', prepend=True, extra_depends=d.expand('${PN}'))
-    metapkg = d.getVar('PN') + '-meta'
-    d.setVar('RDEPENDS_' + metapkg, ' '.join(pkgs))
-}
-- 
2.14.0


