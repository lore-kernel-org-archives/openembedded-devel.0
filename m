Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4232E78398
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Aug 2017 15:51:52 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id r134so7865234wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Aug 2017 08:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=oAbPuw0NqSa4ah5Sx2qOXTKDvKd0QM7K7eznOL+HUlM=;
	b=N/v/xfrAwMQvGWKDghDc8cW06/O+Eb2zFFoZbLrArq6RmxKq4yW7MBX0zfj5HPCjNd
	APWvOMZS+E7Bf19l8mB1eaT+ynyO9yPW8z/U67So1Fx2IoMP0YALv7gtzdF249iyJjPh
	zN3f7+ulY1O898QsTX7hLCXPGCbmtG+BB90hSWRetmwFSxrYnDnMvvASzRqq1KgiI7R5
	D8RQadnbxcnHrnYRX2KhFfRNZnJjxA5eZLIJDauFi9XEa6toolR9WkKixXP15be/4skx
	qSK87NPH1yo1UuKLPuKv6Xq2yZbWxWQwUo14xZEuQ1OxuKN6QZkNL9mWIY64BcNBQacF
	PMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=oAbPuw0NqSa4ah5Sx2qOXTKDvKd0QM7K7eznOL+HUlM=;
	b=Mkv1yQ7ilpEdIqPDkqsFs0YxJlrTRbdujYADvKrRTQMLLVVoBCijX1lHJomBOmikYR
	R5GSH0/IniOQpE3NPZhB8dDLm0/yt7Yxu50Qbbsp19cGpd/tlox4WhaVnCOxF7L82D9o
	0LhvcCXacVKjPBDKrB7yklcQ+lxSXsldbfgy8vUrQf5G61JY4jBkR+lkVqFgoUo7VtgV
	M4iyNKSe8PkVPHvRT4J+0oak445Zfu371sc98JPmUqVPKom9x4yYoaSQ2/OfT0UbuWVH
	Yi5EIX65zl2YWlJoVRdNTWcRV9rdb2GqimbecXyCB3Tcsqj3FSBOYcyL0mhG2AxpKXdc
	qP5Q==
X-Gm-Message-State: AHYfb5h+GpUHY1BtLgqODgCJrsKrce5f96r1MrGm5GpTaAVkZWrNhhAX
	7ynjNGAmjCoUzQSx
X-Received: by 10.28.196.67 with SMTP id u64mr3777698wmf.168.1503589912608;
	Thu, 24 Aug 2017 08:51:52 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id o7sm5138895wra.39.2017.08.24.08.51.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Aug 2017 08:51:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Aug 2017 17:53:30 +0200
Message-Id: <20170824155332.18313-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170824155332.18313-1-Martin.Jansa@gmail.com>
References: <20170824155332.18313-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [PATCHv2 3/5] meta-efl: remove this now pretty empty layer
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
X-List-Received-Date: Thu, 24 Aug 2017 15:51:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/COPYING.MIT                               |  17 ----
 meta-efl/README                                    |  18 ----
 meta-efl/classes/e-base.bbclass                    |  14 ---
 meta-efl/classes/e.bbclass                         |  22 -----
 meta-efl/classes/efl.bbclass                       |  66 --------------
 meta-efl/conf/layer.conf                           |  35 --------
 meta-efl/recipes-core/meta/meta-toolchain-efl.bb   |   6 --
 .../recipes-efl/e17/illume-keyboards-shr_git.bb    | 100 ---------------------
 .../recipes-efl/efl/e-wm-illume-dict-pl_git.bb     |  18 ----
 meta-efl/recipes-efl/efl/edb_svn.bb                |  16 ----
 meta-efl/recipes-efl/efl/imlib2_git.bb             |  45 ----------
 ...ine-comparison_fn_t-for-non-glibc-systems.patch |  33 -------
 .../id3-plugin-support-out-of-tree-build.patch     |  11 ---
 .../lightmediascanner/lightmediascanner_0.5.1.bb   |  63 -------------
 14 files changed, 464 deletions(-)
 delete mode 100644 meta-efl/COPYING.MIT
 delete mode 100644 meta-efl/README
 delete mode 100644 meta-efl/classes/e-base.bbclass
 delete mode 100644 meta-efl/classes/e.bbclass
 delete mode 100644 meta-efl/classes/efl.bbclass
 delete mode 100644 meta-efl/conf/layer.conf
 delete mode 100644 meta-efl/recipes-core/meta/meta-toolchain-efl.bb
 delete mode 100644 meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb
 delete mode 100644 meta-efl/recipes-efl/efl/e-wm-illume-dict-pl_git.bb
 delete mode 100644 meta-efl/recipes-efl/efl/edb_svn.bb
 delete mode 100644 meta-efl/recipes-efl/efl/imlib2_git.bb
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
2.14.1


