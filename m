Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id B36A960777
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Aug 2017 00:46:29 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id x64so5083442wmg.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Aug 2017 17:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=K1erH9cwMsO0AUgp+a8Tst4bxrHT4oWDHjynkxpijlo=;
	b=hOuEcfGrqvhimNbAFDWX75hngqC3L7S3rTMTTGB+fpsJ6WLNSsuJPeCcF3UxUtQzrI
	RlKH7OWsEwL037zoLTekH4aVR2zmac/wU+dsVn5PfxHj+Rj4fA0l8h5zH1L+LKgTyW7L
	5dnRLiWCXBbMo+lQsZlsGE+UPMQg8junxxKd13d5/rkX4Vsrxd9DVMvThxlIsO113qzq
	fXtv+m5io32CZOHCx95Ru/sJmXmNJElGIhZW/AKEtpRhSkyVPS+6mNHD+RPRxMfjoqk1
	tG8jYdrZvGd2AE7o/1XOQqd2+jAvKp1ID8JgXIELZUC2yiawVCVCFcsQH+t4txLQQHg8
	97CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=K1erH9cwMsO0AUgp+a8Tst4bxrHT4oWDHjynkxpijlo=;
	b=ipqrU4gysfMv5HldYiXPsr7ziWF1xUnLuysKW0ok0Dmp/dhCgvrQm2KsgBvHt5pO5s
	aO5VG14cm5keTm6vtzlS/rtYk1U31S5iTtdZMs3W0eA9XluWSDO4Jj+iItulY8ZrLJ0Q
	3rNzO2aF/4AdzQknoN1/AN32UZy/UfeKBwQiw0h7dKHp5IkyxxsqI9SqpAI9lfPW7ar1
	wEAJvnibPDQ6FjRo309EfDj8GK0UCcmGgsPId1IBlT7/nLU3JNGCLHQVgnBGmqi3tQ3F
	7xYLlu4XhAuFGA9N8ekwSdswOA98Y7FVOmiGdq3dyj/4scONLsbOj3grRUlE/5wJOo1c
	MN1Q==
X-Gm-Message-State: AHYfb5gl70paixGRtUAXaD71PBtrwYnuNBE0ZlP8R1tVKm6Tb6qgU51b
	+VTF0dGyh0mbw07iSV+SUyIS4guRvyhD
X-Received: by 10.80.147.197 with SMTP id o63mr6484624eda.194.1502239590537;
	Tue, 08 Aug 2017 17:46:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.181 with HTTP; Tue, 8 Aug 2017 17:46:00 -0700 (PDT)
In-Reply-To: <1f43da43b734691a93b8824a4d8daf526a6d8251.1501142861.git.hongxu.jia@windriver.com>
References: <cover.1501142861.git.hongxu.jia@windriver.com>
	<1f43da43b734691a93b8824a4d8daf526a6d8251.1501142861.git.hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Aug 2017 17:46:00 -0700
Message-ID: <CAMKF1srYLfZh3=xaxns44EZrso0my=Su19+doQXC_7Cg_8P-cA@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/6] tigervnc: add recipe 1.8.0
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
X-List-Received-Date: Wed, 09 Aug 2017 00:46:30 -0000
Content-Type: text/plain; charset="UTF-8"

This fails to build with clang, can you backport fixes from

https://github.com/TigerVNC/tigervnc/issues/352


On Thu, Jul 27, 2017 at 1:44 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../files/0001-tigervnc-remove-includedir.patch    |  50 ++++++++
>  .../0002-do-not-build-tests-sub-directory.patch    |  29 +++++
>  ...missing-dynamic-library-to-FLTK_LIBRARIES.patch |  28 +++++
>  ...tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch |  62 ++++++++++
>  .../recipes-graphics/tigervnc/tigervnc_1.8.0.bb    | 131 +++++++++++++++++++++
>  5 files changed, 300 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/tigervnc/files/0001-tigervnc-remove-includedir.patch
>  create mode 100644 meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch
>  create mode 100644 meta-oe/recipes-graphics/tigervnc/files/0003-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch
>  create mode 100644 meta-oe/recipes-graphics/tigervnc/files/0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch
>  create mode 100644 meta-oe/recipes-graphics/tigervnc/tigervnc_1.8.0.bb
>
> diff --git a/meta-oe/recipes-graphics/tigervnc/files/0001-tigervnc-remove-includedir.patch b/meta-oe/recipes-graphics/tigervnc/files/0001-tigervnc-remove-includedir.patch
> new file mode 100644
> index 0000000..12c4376
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/tigervnc/files/0001-tigervnc-remove-includedir.patch
> @@ -0,0 +1,50 @@
> +From 4b423cd2e5e4296abca3be553bf64d8cc287180a Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Thu, 20 Jul 2017 17:09:05 +0800
> +Subject: [PATCH 1/4] tigervnc: remove includedir
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> +
> +It fixes host contamination
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + unix/xserver/hw/vnc/Makefile.am | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/unix/xserver/hw/vnc/Makefile.am b/unix/xserver/hw/vnc/Makefile.am
> +index 0d6a4ac..854f078 100644
> +--- a/unix/xserver/hw/vnc/Makefile.am
> ++++ b/unix/xserver/hw/vnc/Makefile.am
> +@@ -22,7 +22,7 @@ libvnccommon_la_SOURCES = $(HDRS) \
> +
> + libvnccommon_la_CPPFLAGS = -DVENDOR_RELEASE="$(VENDOR_RELEASE)" \
> +       -DVENDOR_STRING="\"$(VENDOR_STRING)\"" -I$(TIGERVNC_SRCDIR)/common -UHAVE_CONFIG_H \
> +-      -I$(TIGERVNC_SRCDIR)/unix/vncconfig $(XVNC_CPPFLAGS) ${XSERVERLIBS_CFLAGS} -I$(includedir) \
> ++      -I$(TIGERVNC_SRCDIR)/unix/vncconfig $(XVNC_CPPFLAGS) ${XSERVERLIBS_CFLAGS} \
> +       -I$(top_srcdir)/include
> +
> + bin_PROGRAMS = Xvnc
> +@@ -42,7 +42,7 @@ Xvnc_CPPFLAGS = $(XVNC_CPPFLAGS) -DTIGERVNC -DNO_MODULE_EXTS \
> +       -UHAVE_CONFIG_H \
> +       -DXFree86Server -DVENDOR_RELEASE="$(VENDOR_RELEASE)" \
> +       -DVENDOR_STRING="\"$(VENDOR_STRING)\"" -I$(TIGERVNC_SRCDIR)/common \
> +-      -I$(top_srcdir)/include ${XSERVERLIBS_CFLAGS} -I$(includedir)
> ++      -I$(top_srcdir)/include ${XSERVERLIBS_CFLAGS}
> +
> + Xvnc_LDADD = $(XVNC_LIBS) libvnccommon.la $(COMMON_LIBS) \
> +       $(XSERVER_LIBS) $(XSERVER_SYS_LIBS) $(XVNC_SYS_LIBS) -lX11
> +@@ -62,7 +62,7 @@ libvnc_la_CPPFLAGS = $(XVNC_CPPFLAGS) -I$(TIGERVNC_SRCDIR)/common -UHAVE_CONFIG_
> +       -I$(top_srcdir)/hw/xfree86/os-support \
> +       -I$(top_srcdir)/hw/xfree86/os-support/bus \
> +       -I$(top_srcdir)/include \
> +-      ${XSERVERLIBS_CFLAGS} -I$(includedir)
> ++      ${XSERVERLIBS_CFLAGS}
> +
> + libvnc_la_LDFLAGS = -module -avoid-version -Wl,-z,now
> +
> +--
> +2.7.4
> +
> diff --git a/meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch b/meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch
> new file mode 100644
> index 0000000..4e875ba
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch
> @@ -0,0 +1,29 @@
> +From c3460d63f0b6cd50b9a64265f420f0439e12a1d5 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Tue, 25 Apr 2017 01:36:44 -0400
> +Subject: [PATCH 2/4] do not build tests sub directory
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + CMakeLists.txt | 3 ---
> + 1 file changed, 3 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 94ec2ef..fb72a00 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -300,9 +300,6 @@ if(BUILD_VIEWER)
> +   add_subdirectory(media)
> + endif()
> +
> +-add_subdirectory(tests)
> +-
> +-
> + include(cmake/BuildPackages.cmake)
> +
> + # uninstall
> +--
> +2.7.4
> +
> diff --git a/meta-oe/recipes-graphics/tigervnc/files/0003-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch b/meta-oe/recipes-graphics/tigervnc/files/0003-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch
> new file mode 100644
> index 0000000..cfb84ac
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/tigervnc/files/0003-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch
> @@ -0,0 +1,28 @@
> +From 6369a5be2af2ed1fa443f40f48deaf318d22713e Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Thu, 20 Jul 2017 05:06:00 -0400
> +Subject: [PATCH 3/4] add missing dynamic library to FLTK_LIBRARIES
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + CMakeLists.txt | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index fb72a00..5732dc8 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -246,6 +246,8 @@ if(UNIX AND NOT APPLE)
> +   endif()
> + endif()
> +
> ++set(FLTK_LIBRARIES ${FLTK_LIBRARIES} -lm -ldl -lpng -ljpeg)
> ++
> + # Check for GNUTLS library
> + option(ENABLE_GNUTLS "Enable protocol encryption and advanced authentication" ON)
> + if(ENABLE_GNUTLS)
> +--
> +2.7.4
> +
> diff --git a/meta-oe/recipes-graphics/tigervnc/files/0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch b/meta-oe/recipes-graphics/tigervnc/files/0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch
> new file mode 100644
> index 0000000..97b0a38
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/tigervnc/files/0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch
> @@ -0,0 +1,62 @@
> +From 9563b69640227da2220ee0c39077afb736cc96d1 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Thu, 20 Jul 2017 17:12:17 +0800
> +Subject: [PATCH 4/4] tigervnc: add fPIC option to COMPILE_FLAGS
> +
> +The static libraries in Xregion/network/rdr/rfb were linked by shared
> +library libvnc.so, so we should add fPIC option to COMPILE_FLAGS to fix
> +relocation issue.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + common/Xregion/CMakeLists.txt | 1 +
> + common/network/CMakeLists.txt | 1 +
> + common/rdr/CMakeLists.txt     | 1 +
> + common/rfb/CMakeLists.txt     | 1 +
> + 4 files changed, 4 insertions(+)
> +
> +diff --git a/common/Xregion/CMakeLists.txt b/common/Xregion/CMakeLists.txt
> +index 40ca97e..9411328 100644
> +--- a/common/Xregion/CMakeLists.txt
> ++++ b/common/Xregion/CMakeLists.txt
> +@@ -3,4 +3,5 @@ add_library(Xregion STATIC
> +
> + if(UNIX)
> +   libtool_create_control_file(Xregion)
> ++  set_target_properties(Xregion PROPERTIES COMPILE_FLAGS -fPIC)
> + endif()
> +diff --git a/common/network/CMakeLists.txt b/common/network/CMakeLists.txt
> +index b624c8e..6c06ec9 100644
> +--- a/common/network/CMakeLists.txt
> ++++ b/common/network/CMakeLists.txt
> +@@ -9,4 +9,5 @@ endif()
> +
> + if(UNIX)
> +   libtool_create_control_file(network)
> ++  set_target_properties(network PROPERTIES COMPILE_FLAGS -fPIC)
> + endif()
> +diff --git a/common/rdr/CMakeLists.txt b/common/rdr/CMakeLists.txt
> +index 989ba2f..20f6489 100644
> +--- a/common/rdr/CMakeLists.txt
> ++++ b/common/rdr/CMakeLists.txt
> +@@ -27,4 +27,5 @@ target_link_libraries(rdr ${RDR_LIBRARIES})
> +
> + if(UNIX)
> +   libtool_create_control_file(rdr)
> ++  set_target_properties(rdr PROPERTIES COMPILE_FLAGS -fPIC)
> + endif()
> +diff --git a/common/rfb/CMakeLists.txt b/common/rfb/CMakeLists.txt
> +index 5047e5e..88838ab 100644
> +--- a/common/rfb/CMakeLists.txt
> ++++ b/common/rfb/CMakeLists.txt
> +@@ -98,4 +98,5 @@ target_link_libraries(rfb ${RFB_LIBRARIES})
> +
> + if(UNIX)
> +   libtool_create_control_file(rfb)
> ++  set_target_properties(rfb PROPERTIES COMPILE_FLAGS -fPIC)
> + endif()
> +--
> +2.7.4
> +
> diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.8.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.8.0.bb
> new file mode 100644
> index 0000000..d15bc9e
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.8.0.bb
> @@ -0,0 +1,131 @@
> +DESCRIPTION = "TigerVNC remote display system"
> +HOMEPAGE = "http://www.tigervnc.com/"
> +LICENSE = "GPLv2+"
> +SECTION = "x11/utils"
> +DEPENDS = "xserver-xorg gnutls jpeg libxtst gettext-native fltk"
> +RDEPENDS_${PN} = "chkconfig coreutils hicolor-icon-theme"
> +
> +LIC_FILES_CHKSUM = "file://LICENCE.TXT;md5=75b02c2872421380bbd47781d2bd75d3"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit distro_features_check
> +REQUIRED_DISTRO_FEATURES = "x11"
> +
> +inherit autotools cmake
> +B = "${S}"
> +
> +SRCREV = "4d6e1b8306a8cca8ad5e15ff8201f6ea24459cfd"
> +
> +SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.8-branch \
> +           file://0001-tigervnc-remove-includedir.patch \
> +           file://0002-do-not-build-tests-sub-directory.patch \
> +           file://0003-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch \
> +           file://0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch \
> +"
> +
> +# Keep sync with xorg-server in oe-core
> +XORG_PN ?= "xorg-server"
> +XORG_PV ?= "1.19.3"
> +SRC_URI += "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${XORG_PV}.tar.bz2;name=xorg"
> +XORG_S = "${WORKDIR}/${XORG_PN}-${XORG_PV}"
> +SRC_URI[xorg.md5sum] = "015d2fc4b9f2bfe7a626edb63a62c65e"
> +SRC_URI[xorg.sha256sum] = "677a8166e03474719238dfe396ce673c4234735464d6dadf2959b600d20e5a98"
> +
> +# It is the directory containing the Xorg source for the
> +# machine on which you are building TigerVNC.
> +XSERVER_SOURCE_DIR="${S}/unix/xserver"
> +
> +do_patch[postfuncs] += "do_patch_xserver"
> +do_patch_xserver () {
> +    for subdir in Xext xkb GL hw/xquartz/bundle hw/xfree86/common; do
> +        install -d ${XSERVER_SOURCE_DIR}/$subdir
> +    done
> +
> +    for subdir in hw/dmx/doc man doc hw/dmx/doxygen; do
> +        install -d ${XSERVER_SOURCE_DIR}/$subdir
> +    done
> +
> +    sources="hw/xquartz/bundle/cpprules.in man/Xserver.man doc/smartsched \
> +             hw/dmx/doxygen/doxygen.conf.in xserver.ent.in xkb/README.compiled \
> +             hw/xfree86/xorgconf.cpp hw/xfree86/Xorg.sh.in"
> +    for i in ${sources}; do
> +        install -m 0644 ${XORG_S}/$i ${XSERVER_SOURCE_DIR}/$i;
> +    done
> +
> +    cd ${XORG_S}
> +    find . -type f | egrep '.*\.(c|h|am|ac|inc|m4|h.in|pc.in|man.pre|pl|txt)$' | \
> +    xargs tar cf - | (cd ${XSERVER_SOURCE_DIR} && tar xf -)
> +
> +    cd ${XSERVER_SOURCE_DIR}
> +    xserverpatch="${S}/unix/xserver119.patch"
> +    echo "Apply $xserverpatch"
> +    patch -p1 -b --suffix .vnc < $xserverpatch
> +}
> +
> +EXTRA_OECONF = "--disable-xorg --disable-xnest --disable-xvfb --disable-dmx \
> +        --disable-xwin --disable-xephyr --disable-kdrive --with-pic \
> +        --disable-static --disable-xinerama \
> +        --with-xkb-output=${localstatedir}/lib/xkb \
> +        --disable-glx --disable-dri --disable-dri2 \
> +        --disable-config-hal \
> +        --disable-config-udev \
> +        --without-dtrace \
> +        --disable-unit-tests \
> +        --disable-devel-docs \
> +        --disable-selective-werror \
> +        --disable-xshmfence \
> +        --disable-config-udev \
> +        --disable-dri3 \
> +        --disable-libunwind \
> +        --without-xmlto \
> +        --enable-systemd-logind=no \
> +        --disable-xinerama \
> +        --disable-xwayland \
> +"
> +
> +do_configure_append () {
> +    olddir=`pwd`
> +    cd ${XSERVER_SOURCE_DIR}
> +
> +    rm -rf aclocal-copy/
> +    rm -f aclocal.m4
> +
> +    export ACLOCALDIR="${XSERVER_SOURCE_DIR}/aclocal-copy"
> +    mkdir -p ${ACLOCALDIR}/
> +    if [ -d ${STAGING_DATADIR_NATIVE}/aclocal ]; then
> +        cp-noerror ${STAGING_DATADIR_NATIVE}/aclocal/ ${ACLOCALDIR}/
> +    fi
> +    if [ -d ${STAGING_DATADIR}/aclocal -a "${STAGING_DATADIR_NATIVE}/aclocal" != "${STAGING_DATADIR}/aclocal" ]; then
> +        cp-noerror ${STAGING_DATADIR}/aclocal/ ${ACLOCALDIR}/
> +    fi
> +    ACLOCAL="aclocal --system-acdir=${ACLOCALDIR}/" autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths || bbfatal "autoreconf execution failed."
> +    chmod +x ./configure
> +    ${CACHED_CONFIGUREVARS} ./configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
> +    cd $olddir
> +}
> +
> +do_compile_append () {
> +    olddir=`pwd`
> +    cd ${XSERVER_SOURCE_DIR}
> +
> +    oe_runmake
> +
> +    cd $olddir
> +}
> +
> +do_install_append() {
> +    olddir=`pwd`
> +    cd ${XSERVER_SOURCE_DIR}/hw/vnc
> +
> +    oe_runmake 'DESTDIR=${D}' install
> +
> +    cd $olddir
> +}
> +
> +FILES_${PN} += " \
> +    ${libdir}/xorg/modules/extensions \
> +    ${datadir}/icons \
> +"
> +
> +FILES_${PN}-dbg += "${libdir}/xorg/modules/extensions/.debug"
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

