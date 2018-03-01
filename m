Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0D61478916
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2018 10:35:22 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id s206so30281368wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2018 02:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0O3DZuqPBv5S/yvwaMCUgr5mXohNW57RGuM962aojsY=;
	b=O1krXq+A4R7IpdykoDFK4zvgbQZOEDcxK/2nUXlREqaY4bGjW98EidHKqqRRpI0VyQ
	OKstpjhfBe98h8rU2DrP1XIFLVtkNmYBvr3v0Ovg/TmI4gfdSkq0u5atMABpAyERDOzp
	al4gY3k6fe9qaE8JZ8XPyQbn08C0y70Qc6wTpCriloWjM+jmg7GF/3WC0AL8URo0TDkb
	Z856neysYxQVYnJjqJrXugkZAFdlaiTj6mJhM1sM58MU6epFviKJPxeL57+CVZ00uY6M
	QLqHqbm5V3zTS6TYdX19/Q9mHY/3JwfOHIrkBlUPOxbw/9OAFObFGZJxzhxE8is11djd
	0ZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0O3DZuqPBv5S/yvwaMCUgr5mXohNW57RGuM962aojsY=;
	b=bP77Qzbt/qNsz87k7HjwHdoKALzhoDmx3LvxP7lgSag3o6zaKFWXeDVeu3Ab0v7xgC
	oydy2q2nnui3HQOlVey/X14hsCZDANhC5u+SmrXNiJD+PTYq+y32BB4dytDJI8RYVSwo
	6o5/mJw/Hv3KaN+SAtIKu3uKKx2eCmxRC83hXf8EH2u9YXQSoIS8st2dJoQ8NVUQ5QmJ
	OCnI/rGcCfkY6uqBIkHuXkTKfQHctfRb1aDHqvsZgqd7PGOGFYMvvkHkyVlIOBpI1SAR
	zR8K/UZ1LG0rxknHKFEXv6MKXTHE4DU32KHvmVVabAhfWW53S1uERjNiTT/taNzX3A5w
	+iRg==
X-Gm-Message-State: AElRT7EEOQoPRuimAQ66uTl/5FYysDLQ/OrjP3o3Ow5IKC8SB01roQi3
	RG1dpuW4G/zx4HfIc9oIyzJVcQ==
X-Google-Smtp-Source: AG47ELtxWPD8V9ghORXbP6avPanClDzE1dQJcBV1lz1cQazfbMn0ODziPWWphWKXk6Wgan+wF0W+hA==
X-Received: by 10.28.137.14 with SMTP id l14mr1262175wmd.137.1519900523785;
	Thu, 01 Mar 2018 02:35:23 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	x189sm4045852wmg.23.2018.03.01.02.35.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Mar 2018 02:35:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Mar 2018 10:35:16 +0000
Message-Id: <20180301103517.7653-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180301103517.7653-1-Martin.Jansa@gmail.com>
References: <20180301103517.7653-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/3] kodi: fix indentation
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
X-List-Received-Date: Thu, 01 Mar 2018 10:35:23 -0000

* don't use mix of tabs and spaces for multiline indentation

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-mediacenter/kodi/kodi_17.bb            | 182 +++++++++++----------
 1 file changed, 92 insertions(+), 90 deletions(-)

diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
index 656aefeff8..295618914b 100644
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
@@ -6,59 +6,59 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=930e2a5f63425d8dd72dbd7391c43c46"
 FILESPATH =. "${FILE_DIRNAME}/kodi-17:"
 
 DEPENDS = " \
-            cmake-native \
-            curl-native \
-            gperf-native \
-            jsonschemabuilder-native \
-            nasm-native \
-            swig-native \
-            unzip-native \
-            yasm-native \
-            zip-native \
-            avahi \
-            boost \
-            bzip2 \
-            crossguid \
-            curl \
-            dcadec \
-            enca \
-            expat \
-            faad2 \
-            ffmpeg \
-            fontconfig \
-            fribidi \
-            giflib \
-            jasper \
-            libass \
-            libcdio \
-            libcec \
-            libmad \
-            libmicrohttpd \
-            libmms \
-            libmms \
-            libmodplug \
-            libpcre \
-            libplist \
-            libsamplerate0 \
-            libsdl-image \
-            libsdl-mixer \
-            libsquish \
-            libssh \
-            libtinyxml \
-            libusb1 \
-            libxslt \
-            lzo \
-            mpeg2dec \
-            python \
-            sqlite3 \
-            taglib \
-            virtual/egl \
-            virtual/libsdl \
-            wavpack \
-            yajl \
-            zlib \
-            ${@enable_glew(bb, d)} \
-          "
+    cmake-native \
+    curl-native \
+    gperf-native \
+    jsonschemabuilder-native \
+    nasm-native \
+    swig-native \
+    unzip-native \
+    yasm-native \
+    zip-native \
+    avahi \
+    boost \
+    bzip2 \
+    crossguid \
+    curl \
+    dcadec \
+    enca \
+    expat \
+    faad2 \
+    ffmpeg \
+    fontconfig \
+    fribidi \
+    giflib \
+    jasper \
+    libass \
+    libcdio \
+    libcec \
+    libmad \
+    libmicrohttpd \
+    libmms \
+    libmms \
+    libmodplug \
+    libpcre \
+    libplist \
+    libsamplerate0 \
+    libsdl-image \
+    libsdl-mixer \
+    libsquish \
+    libssh \
+    libtinyxml \
+    libusb1 \
+    libxslt \
+    lzo \
+    mpeg2dec \
+    python \
+    sqlite3 \
+    taglib \
+    virtual/egl \
+    virtual/libsdl \
+    wavpack \
+    yajl \
+    zlib \
+    ${@enable_glew(bb, d)} \
+"
 
 PROVIDES = "xbmc"
 
@@ -66,24 +66,24 @@ SRCREV = "6abeebd5ba371547c8f04272296433f5e4e28e86"
 PV = "17.3+gitr${SRCPV}"
 ADDONSPV = "17.1"
 SRC_URI = "git://github.com/xbmc/xbmc.git;branch=Krypton \
-           https://repo.voidlinux.eu/distfiles/${BPN}-${ADDONSPV}-generated-addons.tar.xz;name=addons;unpack=0 \
-           file://0003-configure-don-t-try-to-run-stuff-to-find-tinyxml.patch \
-           file://0004-handle-SIGTERM.patch \
-           file://0005-add-support-to-read-frequency-output-if-using-intel-.patch \
-           file://0006-Disable-DVD-support.patch \
-           file://0007-Always-compile-libcpluff-as-PIC.patch \
-           file://0008-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch \
-           file://0009-build-Add-support-for-musl-triplets.patch \
-           file://0010-RssReader-Fix-compiler-warning-comparing-pointer-to-.patch \
-           file://0011-Let-configure-pass-on-unknown-architectures-setting-.patch \
-           file://0012-Revert-droid-fix-builds-with-AML-disabled.patch \
-           file://0001-change-order-of-detecting-libegl-and-libgles2.patch \
-           file://0013-FTPParse.cpp-use-std-string.patch \
+    https://repo.voidlinux.eu/distfiles/${BPN}-${ADDONSPV}-generated-addons.tar.xz;name=addons;unpack=0 \
+    file://0003-configure-don-t-try-to-run-stuff-to-find-tinyxml.patch \
+    file://0004-handle-SIGTERM.patch \
+    file://0005-add-support-to-read-frequency-output-if-using-intel-.patch \
+    file://0006-Disable-DVD-support.patch \
+    file://0007-Always-compile-libcpluff-as-PIC.patch \
+    file://0008-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch \
+    file://0009-build-Add-support-for-musl-triplets.patch \
+    file://0010-RssReader-Fix-compiler-warning-comparing-pointer-to-.patch \
+    file://0011-Let-configure-pass-on-unknown-architectures-setting-.patch \
+    file://0012-Revert-droid-fix-builds-with-AML-disabled.patch \
+    file://0001-change-order-of-detecting-libegl-and-libgles2.patch \
+    file://0013-FTPParse.cpp-use-std-string.patch \
 "
 
 SRC_URI_append_libc-musl = " \
-           file://0001-Fix-file_Emu-on-musl.patch \
-           file://0002-Remove-FILEWRAP.patch \
+    file://0001-Fix-file_Emu-on-musl.patch \
+    file://0002-Remove-FILEWRAP.patch \
 "
 SRC_URI[addons.md5sum] = "719614fa764011a18665d08af5c8c92f"
 SRC_URI[addons.sha256sum] = "350da57408c27473eaf40e7f544bc94841bf101dc4346085260c5c4af0adac97"
@@ -185,29 +185,31 @@ FILES_${PN}-dbg += "${libdir}/kodi/.debug ${libdir}/kodi/*/.debug ${libdir}/kodi
 
 # kodi uses some kind of dlopen() method for libcec so we need to add it manually
 # OpenGL builds need glxinfo, that's in mesa-demos
-RRECOMMENDS_${PN}_append = " libcec \
-                             python \
-                             python-ctypes \
-                             python-lang \
-                             python-re \
-                             python-netclient \
-                             python-html \
-                             python-difflib \
-                             python-json \
-                             python-zlib \
-                             python-shell \
-                             python-sqlite3 \
-                             python-compression \
-                             libcurl \
-                             ${@bb.utils.contains('PACKAGECONFIG', 'x11', 'xrandr xdpyinfo', '', d)} \
+RRECOMMENDS_${PN}_append = " \
+    libcec \
+    python \
+    python-ctypes \
+    python-lang \
+    python-re \
+    python-netclient \
+    python-html \
+    python-difflib \
+    python-json \
+    python-zlib \
+    python-shell \
+    python-sqlite3 \
+    python-compression \
+    libcurl \
+    ${@bb.utils.contains('PACKAGECONFIG', 'x11', 'xrandr xdpyinfo', '', d)} \
+"
+RRECOMMENDS_${PN}_append_libc-glibc = " \
+    glibc-charmap-ibm850 \
+    glibc-gconv-ibm850 \
+    glibc-gconv-unicode \
+    glibc-gconv-utf-32 \
+    glibc-charmap-utf-8 \
+    glibc-localedata-en-us \
 "
-RRECOMMENDS_${PN}_append_libc-glibc = " glibc-charmap-ibm850 \
-                                        glibc-gconv-ibm850 \
-					glibc-gconv-unicode \
-                                        glibc-gconv-utf-32 \
-					glibc-charmap-utf-8 \
-					glibc-localedata-en-us \
-                                      "
 
 RPROVIDES_${PN} += "xbmc"
 
-- 
2.15.1


