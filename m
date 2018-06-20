Return-Path: <daniel@zonque.org>
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
	by mail.openembedded.org (Postfix) with ESMTP id 8613B745AF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2018 10:50:52 +0000 (UTC)
Received: from [IPv6:2001:16b8:461e:9000:fb3d:eda3:a041:c60f]
	(200116b8461e9000fb3deda3a041c60f.dip.versatel-1u1.de
	[IPv6:2001:16b8:461e:9000:fb3d:eda3:a041:c60f])
	by mail.bugwerft.de (Postfix) with ESMTPSA id 470A128A53C;
	Wed, 20 Jun 2018 10:47:48 +0000 (UTC)
To: Martin Jansa <martin.jansa@gmail.com>
References: <20180529092556.25053-1-samuli.piippo@qt.io>
	<69a631ae-09ec-a7c0-5965-f5372ef463c7@zonque.org>
	<CA+chaQfXaWZvyUqWSE-Zq=nSW13Jwt=GVPhXTj0dVbzVGpebww@mail.gmail.com>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <d2df5115-8f79-fb79-e761-919fed4cd50f@zonque.org>
Date: Wed, 20 Jun 2018 12:50:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQfXaWZvyUqWSE-Zq=nSW13Jwt=GVPhXTj0dVbzVGpebww@mail.gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qt5: Update to Qt 5.11.0
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
X-List-Received-Date: Wed, 20 Jun 2018 10:50:53 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On Wednesday, June 20, 2018 12:36 PM, Martin Jansa wrote:
> It's already in meta-qt5/master with couple fixes on top of that.

Ah, sorry. For some reason, I only looked into the -next branches. 
Stupid. FWIW, I have a patch for 5.11.1 ready. Will send once the build 
succeeded.


Thanks,
Daniel


> 
> On Wed, Jun 20, 2018 at 12:12 PM Daniel Mack <daniel@zonque.org 
> <mailto:daniel@zonque.org>> wrote:
> 
>     Hi Samuli,
> 
>     I tried to give this patch a try but failed to find a base to apply it
>     against. Is there a public git tree that has these commits?
> 
> 
>     Thanks,
>     Daniel
> 
>     On Tuesday, May 29, 2018 11:25 AM, Samuli Piippo wrote:
>      > Add recipes for Qt OPC UA and Qt WebGL platform plugin.
>      > ---
>      >   recipes-qt/qt5/nativesdk-qtbase_git.bb
>     <http://nativesdk-qtbase_git.bb>        |  7 +-
>      >   recipes-qt/qt5/qt3d_git.bb <http://qt3d_git.bb>               
>          |  2 +-
>      >   recipes-qt/qt5/qt5-git.inc                    |  2 +-
>      >   recipes-qt/qt5/qtbase-native_git.bb
>     <http://qtbase-native_git.bb>           |  3 +-
>      >   recipes-qt/qt5/qtbase_git.bb <http://qtbase_git.bb>           
>            |  7 +-
>      >   recipes-qt/qt5/qtcanvas3d_git.bb <http://qtcanvas3d_git.bb>   
>                |  2 +-
>      >   recipes-qt/qt5/qtcharts_git.bb <http://qtcharts_git.bb>       
>              |  2 +-
>      >   recipes-qt/qt5/qtconnectivity_git.bb
>     <http://qtconnectivity_git.bb>          |  2 +-
>      >   recipes-qt/qt5/qtdeclarative_git.bb
>     <http://qtdeclarative_git.bb>           |  6 +-
>      >   recipes-qt/qt5/qtgamepad_git.bb <http://qtgamepad_git.bb>     
>               |  2 +-
>      >   recipes-qt/qt5/qtgraphicaleffects_git.bb
>     <http://qtgraphicaleffects_git.bb>      |  2 +-
>      >   recipes-qt/qt5/qtimageformats_git.bb
>     <http://qtimageformats_git.bb>          |  2 +-
>      >   recipes-qt/qt5/qtknx_git.bb <http://qtknx_git.bb>             
>           |  2 +-
>      >   recipes-qt/qt5/qtlocation_git.bb <http://qtlocation_git.bb>   
>                | 10 +--
>      >   recipes-qt/qt5/qtmultimedia_git.bb
>     <http://qtmultimedia_git.bb>            |  2 +-
>      >   recipes-qt/qt5/qtopcua_git.bb <http://qtopcua_git.bb>         
>             | 13 ++++
>      >   recipes-qt/qt5/qtpurchasing_git.bb
>     <http://qtpurchasing_git.bb>            |  2 +-
>      >   recipes-qt/qt5/qtquickcontrols2_git.bb
>     <http://qtquickcontrols2_git.bb>        |  2 +-
>      >   recipes-qt/qt5/qtquickcontrols_git.bb
>     <http://qtquickcontrols_git.bb>         |  2 +-
>      >   recipes-qt/qt5/qtremoteobjects_git.bb
>     <http://qtremoteobjects_git.bb>         |  2 +-
>      >   recipes-qt/qt5/qtscript_git.bb <http://qtscript_git.bb>       
>              |  2 +-
>      >   recipes-qt/qt5/qtscxml_git.bb <http://qtscxml_git.bb>         
>             |  2 +-
>      >   recipes-qt/qt5/qtsensors_git.bb <http://qtsensors_git.bb>     
>               |  2 +-
>      >   recipes-qt/qt5/qtserialbus_git.bb <http://qtserialbus_git.bb> 
>                 |  2 +-
>      >   recipes-qt/qt5/qtserialport_git.bb
>     <http://qtserialport_git.bb>            |  7 +-
>      >   recipes-qt/qt5/qtsvg_git.bb <http://qtsvg_git.bb>             
>           |  2 +-
>      >   recipes-qt/qt5/qttools_git.bb <http://qttools_git.bb>         
>             |  2 +-
>      >   recipes-qt/qt5/qtvirtualkeyboard_git.bb
>     <http://qtvirtualkeyboard_git.bb>       |  2 +-
>      >   ...01-fix-build-without-xkbcommon-evdev.patch | 68
>     -------------------
>      >   recipes-qt/qt5/qtwayland_git.bb <http://qtwayland_git.bb>     
>               |  9 +--
>      >   recipes-qt/qt5/qtwebchannel_git.bb
>     <http://qtwebchannel_git.bb>            |  2 +-
>      >   recipes-qt/qt5/qtwebengine_git.bb <http://qtwebengine_git.bb> 
>                 |  4 +-
>      >   recipes-qt/qt5/qtwebglplugin_git.bb
>     <http://qtwebglplugin_git.bb>           | 21 ++++++
>      >   recipes-qt/qt5/qtwebsockets_git.bb
>     <http://qtwebsockets_git.bb>            |  2 +-
>      >   recipes-qt/qt5/qtwebview_git.bb <http://qtwebview_git.bb>     
>               |  2 +-
>      >   recipes-qt/qt5/qtx11extras_git.bb <http://qtx11extras_git.bb> 
>                 |  2 +-
>      >   recipes-qt/qt5/qtxmlpatterns_git.bb
>     <http://qtxmlpatterns_git.bb>           |  2 +-
>      >   37 files changed, 84 insertions(+), 123 deletions(-)
>      >   create mode 100644 recipes-qt/qt5/qtopcua_git.bb
>     <http://qtopcua_git.bb>
>      >   delete mode 100644
>     recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch
>      >   create mode 100644 recipes-qt/qt5/qtwebglplugin_git.bb
>     <http://qtwebglplugin_git.bb>
>      >
>      > diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb
>     <http://nativesdk-qtbase_git.bb>
>     b/recipes-qt/qt5/nativesdk-qtbase_git.bb
>     <http://nativesdk-qtbase_git.bb>
>      > index 27bd563..5971eeb 100644
>      > --- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
>     <http://nativesdk-qtbase_git.bb>
>      > +++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
>     <http://nativesdk-qtbase_git.bb>
>      > @@ -6,7 +6,6 @@ HOMEPAGE = "http://qt-project.org"
>      >   LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 &
>     The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & (
>     GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
>      >   LIC_FILES_CHKSUM = " \
>      >       file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
>      > -    file://LICENSE.LGPLv3;md5=86d02ed8764e77c1c0b194fde895a51b \
>      >       file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>      >       file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
>      >     
>       file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
>      > @@ -174,8 +173,8 @@ do_install() {
>      >       install -m 644 ${WORKDIR}/OEQt5Toolchain.cmake
>     ${D}${datadir}/cmake/OEToolchainConfig.cmake.d/
>      >
>      >       # Fix up absolute paths in scripts
>      > -    grep -lr /usr/bin/python ${D}${OE_QMAKE_PATH_QT_ARCHDATA}/ | \
>      > -        xargs -r sed -i -e '1s,#!.*python,#! ${USRBINPATH}/env
>     python,'
>      > +    sed -i -e '1s,#!/usr/bin/python,#! ${USRBINPATH}/env python,' \
>      > +       
>     ${D}${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/features/uikit/devices.py
>      >   }
>      >
>      >   fakeroot do_generate_qt_environment_file() {
>      > @@ -210,4 +209,4 @@ fakeroot do_generate_qt_environment_file() {
>      >   do_generate_qt_environment_file[umask] = "022"
>      >   addtask generate_qt_environment_file after do_install before
>     do_package
>      >
>      > -SRCREV = "2b5587d901a0cc23749bf27a923d50bf0e5860d3"
>      > +SRCREV = "6eef81ee1c82f934e14d47047d8b6103b8755321"
>      > diff --git a/recipes-qt/qt5/qt3d_git.bb <http://qt3d_git.bb>
>     b/recipes-qt/qt5/qt3d_git.bb <http://qt3d_git.bb>
>      > index 6b5ddeb..07b28ac 100644
>      > --- a/recipes-qt/qt5/qt3d_git.bb <http://qt3d_git.bb>
>      > +++ b/recipes-qt/qt5/qt3d_git.bb <http://qt3d_git.bb>
>      > @@ -36,6 +36,6 @@ do_configure_prepend() {
>      >            ${S}/src/quick3d/imports/input/importsinput.pro
>     <http://importsinput.pro>
>      >   }
>      >
>      > -SRCREV = "6d73c51d44d10925a05804cd8e70978f155643df"
>      > +SRCREV = "15e863517ea37ca7ba6bcb75b078272eddbc5d37"
>      >
>      >   BBCLASSEXTEND += "native nativesdk"
>      > diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
>      > index ae7394c..41ad280 100644
>      > --- a/recipes-qt/qt5/qt5-git.inc
>      > +++ b/recipes-qt/qt5/qt5-git.inc
>      > @@ -14,4 +14,4 @@ CVE_PRODUCT = "qt"
>      >
>      >   S = "${WORKDIR}/git"
>      >
>      > -PV = "5.10.1+5.11-beta3+git${SRCPV}"
>      > +PV = "5.11.0+git${SRCPV}"
>      > diff --git a/recipes-qt/qt5/qtbase-native_git.bb
>     <http://qtbase-native_git.bb> b/recipes-qt/qt5/qtbase-native_git.bb
>     <http://qtbase-native_git.bb>
>      > index d6c53ad..0d7e598 100644
>      > --- a/recipes-qt/qt5/qtbase-native_git.bb
>     <http://qtbase-native_git.bb>
>      > +++ b/recipes-qt/qt5/qtbase-native_git.bb
>     <http://qtbase-native_git.bb>
>      > @@ -6,7 +6,6 @@ HOMEPAGE = "http://qt-project.org"
>      >   LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 &
>     The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & (
>     GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
>      >   LIC_FILES_CHKSUM = " \
>      >       file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
>      > -    file://LICENSE.LGPLv3;md5=86d02ed8764e77c1c0b194fde895a51b \
>      >       file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>      >       file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
>      >     
>       file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
>      > @@ -135,4 +134,4 @@ do_install() {
>      >       echo 'set(_qt5_corelib_extra_includes
>     "${_qt5Core_install_prefix}/lib${QT_DIR_NAME}/mkspecs/linux-oe-g++")' >
>     ${D}${libdir}/cmake/Qt5Core/Qt5CoreConfigExtrasMkspecDir.cmake
>      >   }
>      >
>      > -SRCREV = "2b5587d901a0cc23749bf27a923d50bf0e5860d3"
>      > +SRCREV = "6eef81ee1c82f934e14d47047d8b6103b8755321"
>      > diff --git a/recipes-qt/qt5/qtbase_git.bb <http://qtbase_git.bb>
>     b/recipes-qt/qt5/qtbase_git.bb <http://qtbase_git.bb>
>      > index a599fc9..cc002b3 100644
>      > --- a/recipes-qt/qt5/qtbase_git.bb <http://qtbase_git.bb>
>      > +++ b/recipes-qt/qt5/qtbase_git.bb <http://qtbase_git.bb>
>      > @@ -5,7 +5,6 @@ require qt5-ptest.inc
>      >   LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 &
>     The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & (
>     GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
>      >   LIC_FILES_CHKSUM = " \
>      >       file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
>      > -    file://LICENSE.LGPLv3;md5=86d02ed8764e77c1c0b194fde895a51b \
>      >       file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>      >       file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
>      >     
>       file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
>      > @@ -233,6 +232,10 @@ do_install_append() {
>      >       echo "isEmpty(QMAKE_STRIP): QMAKE_STRIP =
>     ${TARGET_PREFIX}strip" >> $conf
>      >
>      >       generate_target_qt_config_file
>     ${D}${OE_QMAKE_PATH_BINS}/qt.conf
>      > +
>      > +    # Fix up absolute paths in scripts
>      > +    sed -i -e '1s,#!/usr/bin/python,#! ${USRBINPATH}/env python,' \
>      > +       
>     ${D}${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/features/uikit/devices.py
>      >   }
>      >
>      >   # mkspecs have mac specific scripts that depend on perl and bash
>      > @@ -240,4 +243,4 @@ INSANE_SKIP_${PN}-mkspecs += "file-rdeps"
>      >
>      >   RRECOMMENDS_${PN}-plugins +=
>     "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11-locale', '',
>     d)}"
>      >
>      > -SRCREV = "2b5587d901a0cc23749bf27a923d50bf0e5860d3"
>      > +SRCREV = "6eef81ee1c82f934e14d47047d8b6103b8755321"
>      > diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb
>     <http://qtcanvas3d_git.bb> b/recipes-qt/qt5/qtcanvas3d_git.bb
>     <http://qtcanvas3d_git.bb>
>      > index 57e79be..8757967 100644
>      > --- a/recipes-qt/qt5/qtcanvas3d_git.bb <http://qtcanvas3d_git.bb>
>      > +++ b/recipes-qt/qt5/qtcanvas3d_git.bb <http://qtcanvas3d_git.bb>
>      > @@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
>      >
>      >   DEPENDS = "qtdeclarative"
>      >
>      > -SRCREV = "ff771b7d57eb3654f6321eb105129a594ec2841e"
>      > +SRCREV = "9d555f6d21d013c990793aaaa23a5085529631a5"
>      > diff --git a/recipes-qt/qt5/qtcharts_git.bb
>     <http://qtcharts_git.bb> b/recipes-qt/qt5/qtcharts_git.bb
>     <http://qtcharts_git.bb>
>      > index c360ecf..a6ec17f 100644
>      > --- a/recipes-qt/qt5/qtcharts_git.bb <http://qtcharts_git.bb>
>      > +++ b/recipes-qt/qt5/qtcharts_git.bb <http://qtcharts_git.bb>
>      > @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = " \
>      >
>      >   DEPENDS += "qtbase qtdeclarative qtmultimedia"
>      >
>      > -SRCREV = "d3f9275cbaa6a6059298ec248dd28dd6ef065e51"
>      > +SRCREV = "4f66d1ffeecd95b4bf6666b71536c42dea7450ed"
>      >
>      >   # The same issue as in qtbase:
>      >   # http://errors.yoctoproject.org/Errors/Details/152641/
>      > diff --git a/recipes-qt/qt5/qtconnectivity_git.bb
>     <http://qtconnectivity_git.bb>
>     b/recipes-qt/qt5/qtconnectivity_git.bb <http://qtconnectivity_git.bb>
>      > index 6f1f7d3..e23f632 100644
>      > --- a/recipes-qt/qt5/qtconnectivity_git.bb
>     <http://qtconnectivity_git.bb>
>      > +++ b/recipes-qt/qt5/qtconnectivity_git.bb
>     <http://qtconnectivity_git.bb>
>      > @@ -19,4 +19,4 @@ PACKAGECONFIG[bluez] =
>     "-feature-bluez,-no-feature-bluez,${BLUEZ}"
>      >
>      >   EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
>      >
>      > -SRCREV = "e68b5e17b071ca11974474546be04c7d564eae3a"
>      > +SRCREV = "43f063427a3ffc62bd85237801b28c9f9826d562"
>      > diff --git a/recipes-qt/qt5/qtdeclarative_git.bb
>     <http://qtdeclarative_git.bb> b/recipes-qt/qt5/qtdeclarative_git.bb
>     <http://qtdeclarative_git.bb>
>      > index 33f15dd..510fd45 100644
>      > --- a/recipes-qt/qt5/qtdeclarative_git.bb
>     <http://qtdeclarative_git.bb>
>      > +++ b/recipes-qt/qt5/qtdeclarative_git.bb
>     <http://qtdeclarative_git.bb>
>      > @@ -14,8 +14,10 @@ LIC_FILES_CHKSUM = " \
>      >
>      >   DEPENDS += "qtbase"
>      >
>      > -PACKAGECONFIG ??= "qtxmlpatterns"
>      > +PACKAGECONFIG ??= "qtxmlpatterns qml-debug qml-network"
>      >   PACKAGECONFIG[qtxmlpatterns] = ",,qtxmlpatterns"
>      > +PACKAGECONFIG[qml-debug] = "-qml-debug,-no-qml-debug"
>      > +PACKAGECONFIG[qml-network] = "-qml-network, -no-qml-network"
>      >
>      >   do_configure_prepend() {
>      >       # disable qtxmlpatterns test if it isn't enabled by
>     PACKAGECONFIG
>      > @@ -30,6 +32,6 @@ do_install_append_class-nativesdk() {
>      >
>      >   EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG',
>     'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
>      >
>      > -SRCREV = "6069cc1cd1a6309cdffeb8bdd9c4035f33742228"
>      > +SRCREV = "1e82f11629e5572783e5bfc36f24ad10c235ca53"
>      >
>      >   BBCLASSEXTEND =+ "native nativesdk"
>      > diff --git a/recipes-qt/qt5/qtgamepad_git.bb
>     <http://qtgamepad_git.bb> b/recipes-qt/qt5/qtgamepad_git.bb
>     <http://qtgamepad_git.bb>
>      > index 485a6d9..3981bd1 100644
>      > --- a/recipes-qt/qt5/qtgamepad_git.bb <http://qtgamepad_git.bb>
>      > +++ b/recipes-qt/qt5/qtgamepad_git.bb <http://qtgamepad_git.bb>
>      > @@ -14,4 +14,4 @@ PACKAGECONFIG[sdl2] =
>     "-feature-sdl2,-no-feature-sdl2,libsdl2"
>      >
>      >   EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
>      >
>      > -SRCREV = "313f221381507eee36c8e3bd0069b3e7962da140"
>      > +SRCREV = "e175347926b2aa8be045aed485e09b99ae72f51c"
>      > diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb
>     <http://qtgraphicaleffects_git.bb>
>     b/recipes-qt/qt5/qtgraphicaleffects_git.bb
>     <http://qtgraphicaleffects_git.bb>
>      > index 5f820a5..12f60b4 100644
>      > --- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
>     <http://qtgraphicaleffects_git.bb>
>      > +++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
>     <http://qtgraphicaleffects_git.bb>
>      > @@ -18,4 +18,4 @@ RDEPENDS_${PN}-dev = ""
>      >   # http://errors.yoctoproject.org/Errors/Build/44912/
>      >   LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES',
>     'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
>      >
>      > -SRCREV = "df80153bf07b08e5d2ae8ba18f85a9ec15dbaef8"
>      > +SRCREV = "80b9da7ac42468453b7d130bd0a322a1312ad0e3"
>      > diff --git a/recipes-qt/qt5/qtimageformats_git.bb
>     <http://qtimageformats_git.bb>
>     b/recipes-qt/qt5/qtimageformats_git.bb <http://qtimageformats_git.bb>
>      > index 05384b1..5afa44d 100644
>      > --- a/recipes-qt/qt5/qtimageformats_git.bb
>     <http://qtimageformats_git.bb>
>      > +++ b/recipes-qt/qt5/qtimageformats_git.bb
>     <http://qtimageformats_git.bb>
>      > @@ -26,4 +26,4 @@ PACKAGECONFIG[libwebp] =
>     ",CONFIG+=done_config_libwebp,libwebp"
>      >
>      >   EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
>      >
>      > -SRCREV = "b83a0a9460432abb82218da247710a1aaf321336"
>      > +SRCREV = "92e49329edfb98c8b3f9cdcbaf116f0c601c7739"
>      > diff --git a/recipes-qt/qt5/qtknx_git.bb <http://qtknx_git.bb>
>     b/recipes-qt/qt5/qtknx_git.bb <http://qtknx_git.bb>
>      > index 9f15a57..bbcabc1 100644
>      > --- a/recipes-qt/qt5/qtknx_git.bb <http://qtknx_git.bb>
>      > +++ b/recipes-qt/qt5/qtknx_git.bb <http://qtknx_git.bb>
>      > @@ -9,4 +9,4 @@ LIC_FILES_CHKSUM = " \
>      >
>      >   DEPENDS += "qtbase"
>      >
>      > -SRCREV = "8a8a343446146f51056b6f530ce341f34199c811"
>      > +SRCREV = "4640a41071ff153c01ef2c518675dded257f6de5"
>      > diff --git a/recipes-qt/qt5/qtlocation_git.bb
>     <http://qtlocation_git.bb> b/recipes-qt/qt5/qtlocation_git.bb
>     <http://qtlocation_git.bb>
>      > index e197dfb..1a79093 100644
>      > --- a/recipes-qt/qt5/qtlocation_git.bb <http://qtlocation_git.bb>
>      > +++ b/recipes-qt/qt5/qtlocation_git.bb <http://qtlocation_git.bb>
>      > @@ -4,10 +4,8 @@ require qt5-git.inc
>      >   LICENSE = "Apache-2.0 & MIT & openssl & BSL-1.0 & GFDL-1.3 &
>     BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 |
>     The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 |
>     The-Qt-Company-Commercial )"
>      >   LIC_FILES_CHKSUM = " \
>      >       file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
>      > -    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
>      >       file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>      >       file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
>      > -    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
>      >     
>       file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
>      >       file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
>      >     
>       file://src/3rdparty/mapbox-gl-native/LICENSE.md;md5=0ab9025299bcee16858021d557f09449 \
>      > @@ -27,11 +25,13 @@ EXTRA_QMAKEVARS_CONFIGURE +=
>     "${PACKAGECONFIG_CONFARGS}"
>      >   # http://errors.yoctoproject.org/Errors/Details/152640/
>      >   LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES',
>     'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
>      >
>      > +QT_MODULE_BRANCH_MAPBOXGL = "upstream/qt-staging-5.11.0"
>      > +
>      >   SRC_URI += " \
>      > -   
>     ${QT_GIT}/qtlocation-mapboxgl.git;name=qtlocation-mapboxgl;branch=upstream/qt-staging;protocol=${QT_GIT_PROTOCOL};destsuffix=git/src/3rdparty/mapbox-gl-native
>     \
>      > +   
>     ${QT_GIT}/qtlocation-mapboxgl.git;name=qtlocation-mapboxgl;branch=${QT_MODULE_BRANCH_MAPBOXGL};protocol=${QT_GIT_PROTOCOL};destsuffix=git/src/3rdparty/mapbox-gl-native
>     \
>      >   "
>      >
>      > -SRCREV_qtlocation = "3d2281ccf7400a782f69b7b74cb45d0889708bcc"
>      > -SRCREV_qtlocation-mapboxgl =
>     "8c1be4ec01ef46bf453856531ebf53b48ce3dbe7"
>      > +SRCREV_qtlocation = "139414573ab27bd1df1b491aeb6003a6fc0d3d5d"
>      > +SRCREV_qtlocation-mapboxgl =
>     "74df5203628b47931b4edcb5e8fe352f40fe7df4"
>      >
>      >   SRCREV_FORMAT = "qtlocation_qtlocation-mapboxgl"
>      > diff --git a/recipes-qt/qt5/qtmultimedia_git.bb
>     <http://qtmultimedia_git.bb> b/recipes-qt/qt5/qtmultimedia_git.bb
>     <http://qtmultimedia_git.bb>
>      > index 7ae9a24..0f272e5 100644
>      > --- a/recipes-qt/qt5/qtmultimedia_git.bb <http://qtmultimedia_git.bb>
>      > +++ b/recipes-qt/qt5/qtmultimedia_git.bb <http://qtmultimedia_git.bb>
>      > @@ -37,4 +37,4 @@ SRC_URI += "\
>      >   # http://errors.yoctoproject.org/Errors/Build/44914/
>      >   LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES',
>     'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
>      >
>      > -SRCREV = "bb7ffc4d847bb2b558693a4ca5d7f3a45c9b9231"
>      > +SRCREV = "b39c391853245f8293d19431541eab20d78b8678"
>      > diff --git a/recipes-qt/qt5/qtopcua_git.bb
>     <http://qtopcua_git.bb> b/recipes-qt/qt5/qtopcua_git.bb
>     <http://qtopcua_git.bb>
>      > new file mode 100644
>      > index 0000000..7abe028
>      > --- /dev/null
>      > +++ b/recipes-qt/qt5/qtopcua_git.bb <http://qtopcua_git.bb>
>      > @@ -0,0 +1,13 @@
>      > +require qt5.inc
>      > +require qt5-git.inc
>      > +
>      > +LICENSE = "GFDL-1.3 & ( GPL-2.0+ | LGPL-3.0 ) |
>     The-Qt-Company-Commercial"
>      > +LIC_FILES_CHKSUM = " \
>      > +    file://LICENSE.FDL;md5=f70ee9a6c44ae8917586fea34dff0ab5 \
>      > +    file://LICENSE.GPLv2;md5=05832301944453ec79e40ba3c3cfceec \
>      > +    file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962 \
>      > +"
>      > +
>      > +DEPENDS += "qtbase"
>      > +
>      > +SRCREV = "78d016e79ed8bc3d2d3f1c2dac90a4c75392d35b"
>      > diff --git a/recipes-qt/qt5/qtpurchasing_git.bb
>     <http://qtpurchasing_git.bb> b/recipes-qt/qt5/qtpurchasing_git.bb
>     <http://qtpurchasing_git.bb>
>      > index df4a6e0..cb6b9eb 100644
>      > --- a/recipes-qt/qt5/qtpurchasing_git.bb <http://qtpurchasing_git.bb>
>      > +++ b/recipes-qt/qt5/qtpurchasing_git.bb <http://qtpurchasing_git.bb>
>      > @@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
>      >
>      >   DEPENDS += "qtbase qtdeclarative"
>      >
>      > -SRCREV = "02246cd68ca14345d95cbd8893fd24ff60faa73f"
>      > +SRCREV = "607617cacc1c6ced9fa3bbfb0cd24e115b623daa"
>      > diff --git a/recipes-qt/qt5/qtquickcontrols2_git.bb
>     <http://qtquickcontrols2_git.bb>
>     b/recipes-qt/qt5/qtquickcontrols2_git.bb
>     <http://qtquickcontrols2_git.bb>
>      > index a8fc2c2..ee5e926 100644
>      > --- a/recipes-qt/qt5/qtquickcontrols2_git.bb
>     <http://qtquickcontrols2_git.bb>
>      > +++ b/recipes-qt/qt5/qtquickcontrols2_git.bb
>     <http://qtquickcontrols2_git.bb>
>      > @@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
>      >
>      >   DEPENDS += "qtdeclarative qtdeclarative-native"
>      >
>      > -SRCREV = "c0232099a9fac03ef0f5287b6a26dbbd46669c06"
>      > +SRCREV = "60f3106b3fe537f1f26230bf0b59525cf98d6789"
>      > diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb
>     <http://qtquickcontrols_git.bb>
>     b/recipes-qt/qt5/qtquickcontrols_git.bb <http://qtquickcontrols_git.bb>
>      > index 372ed0c..f23e96d 100644
>      > --- a/recipes-qt/qt5/qtquickcontrols_git.bb
>     <http://qtquickcontrols_git.bb>
>      > +++ b/recipes-qt/qt5/qtquickcontrols_git.bb
>     <http://qtquickcontrols_git.bb>
>      > @@ -17,4 +17,4 @@ FILES_${PN}-qmlplugins += " \
>      >     ${OE_QMAKE_PATH_QML}/QtQuick/Dialogs/qml/icons.ttf \
>      >   "
>      >
>      > -SRCREV = "0689a8256c0a21087c01fff3998fd3b606a5ac4c"
>      > +SRCREV = "88ff352d5145b5761179ee42164a0bfcd4f1d54a"
>      > diff --git a/recipes-qt/qt5/qtremoteobjects_git.bb
>     <http://qtremoteobjects_git.bb>
>     b/recipes-qt/qt5/qtremoteobjects_git.bb <http://qtremoteobjects_git.bb>
>      > index 1efac5c..ff61321 100644
>      > --- a/recipes-qt/qt5/qtremoteobjects_git.bb
>     <http://qtremoteobjects_git.bb>
>      > +++ b/recipes-qt/qt5/qtremoteobjects_git.bb
>     <http://qtremoteobjects_git.bb>
>      > @@ -24,6 +24,6 @@ PACKAGECONFIG[tools-only] = "CONFIG+=tools-only"
>      >
>      >   EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
>      >
>      > -SRCREV = "556539365ab1eeaab339fc527c4c2130c2f804ff"
>      > +SRCREV = "24fade01e0e38acbf5ffdb9ffab712e8b7e86e30"
>      >
>      >   BBCLASSEXTEND += "native nativesdk"
>      > diff --git a/recipes-qt/qt5/qtscript_git.bb
>     <http://qtscript_git.bb> b/recipes-qt/qt5/qtscript_git.bb
>     <http://qtscript_git.bb>
>      > index 9982877..fe4612d 100644
>      > --- a/recipes-qt/qt5/qtscript_git.bb <http://qtscript_git.bb>
>      > +++ b/recipes-qt/qt5/qtscript_git.bb <http://qtscript_git.bb>
>      > @@ -30,4 +30,4 @@ DEPENDS += "qtbase"
>      >   # http://errors.yoctoproject.org/Errors/Build/44915/
>      >   LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES',
>     'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
>      >
>      > -SRCREV = "c2657d346455a5a7821fbfbe3b1107d7cf9b0949"
>      > +SRCREV = "693f0320e92cb1ab93f6261c72702432abdcb11d"
>      > diff --git a/recipes-qt/qt5/qtscxml_git.bb
>     <http://qtscxml_git.bb> b/recipes-qt/qt5/qtscxml_git.bb
>     <http://qtscxml_git.bb>
>      > index 1a81beb..dae2cde 100644
>      > --- a/recipes-qt/qt5/qtscxml_git.bb <http://qtscxml_git.bb>
>      > +++ b/recipes-qt/qt5/qtscxml_git.bb <http://qtscxml_git.bb>
>      > @@ -10,7 +10,7 @@ require qt5-git.inc
>      >
>      >   DEPENDS += "qtbase qtdeclarative qtxmlpatterns qtscxml-native"
>      >
>      > -SRCREV = "67d48807b44735a2385b88db7ada01f7cd7eacfd"
>      > +SRCREV = "71a101b5cbdbe9e32053ce61a5b6417a6990d780"
>      >
>      >   # Patches from https://github.com/meta-qt5/qtscxml/commits/b5.11
>      >   # 5.11.meta-qt5.2
>      > diff --git a/recipes-qt/qt5/qtsensors_git.bb
>     <http://qtsensors_git.bb> b/recipes-qt/qt5/qtsensors_git.bb
>     <http://qtsensors_git.bb>
>      > index 5c6a83d..a9885f7 100644
>      > --- a/recipes-qt/qt5/qtsensors_git.bb <http://qtsensors_git.bb>
>      > +++ b/recipes-qt/qt5/qtsensors_git.bb <http://qtsensors_git.bb>
>      > @@ -12,4 +12,4 @@ LIC_FILES_CHKSUM = " \
>      >
>      >   DEPENDS += "qtbase qtdeclarative"
>      >
>      > -SRCREV = "29f2041f4da53815491affbf19ec008820c76e29"
>      > +SRCREV = "b4e80891f3d51b3d6a7ead74c8650b84e0f070ea"
>      > diff --git a/recipes-qt/qt5/qtserialbus_git.bb
>     <http://qtserialbus_git.bb> b/recipes-qt/qt5/qtserialbus_git.bb
>     <http://qtserialbus_git.bb>
>      > index 5c196ec..effe91b 100644
>      > --- a/recipes-qt/qt5/qtserialbus_git.bb <http://qtserialbus_git.bb>
>      > +++ b/recipes-qt/qt5/qtserialbus_git.bb <http://qtserialbus_git.bb>
>      > @@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
>      >
>      >   DEPENDS += "qtbase qtserialport"
>      >
>      > -SRCREV = "fb561e9aa52d24b0156dc2c3987216954ad52107"
>      > +SRCREV = "c66a364cf34b4945208f07362deabe0020e5b596"
>      > diff --git a/recipes-qt/qt5/qtserialport_git.bb
>     <http://qtserialport_git.bb> b/recipes-qt/qt5/qtserialport_git.bb
>     <http://qtserialport_git.bb>
>      > index 9bac24e..79d9394 100644
>      > --- a/recipes-qt/qt5/qtserialport_git.bb <http://qtserialport_git.bb>
>      > +++ b/recipes-qt/qt5/qtserialport_git.bb <http://qtserialport_git.bb>
>      > @@ -5,14 +5,13 @@ require qt5-git.inc
>      >   # other qt* components use :/
>      >   LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 &
>     The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & (
>     GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
>      >   LIC_FILES_CHKSUM = " \
>      > -    file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
>      > +    file://LICENSE.FDL;md5=3801d7932fdc07fd9efe89f9854a6caa \
>      >       file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>      >       file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
>      >     
>       file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
>      > -    file://LGPL_EXCEPTION.txt;md5=bb426f3367c4805d1e12fad05bd0b750 \
>      > -    file://LICENSE.FDL;md5=3801d7932fdc07fd9efe89f9854a6caa \
>      > +    file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
>      >   "
>      >
>      >   DEPENDS += "qtbase"
>      >
>      > -SRCREV = "b5f0519e8e6f8f125f711d61832072649d841dfe"
>      > +SRCREV = "a9ada995489b899cb938602308ffa1a8814acd2a"
>      > diff --git a/recipes-qt/qt5/qtsvg_git.bb <http://qtsvg_git.bb>
>     b/recipes-qt/qt5/qtsvg_git.bb <http://qtsvg_git.bb>
>      > index c15a9e3..dae0e7d 100644
>      > --- a/recipes-qt/qt5/qtsvg_git.bb <http://qtsvg_git.bb>
>      > +++ b/recipes-qt/qt5/qtsvg_git.bb <http://qtsvg_git.bb>
>      > @@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
>      >
>      >   DEPENDS += "qtbase"
>      >
>      > -SRCREV = "1fd6226d52b8d3d201b117902ff1ecd84cc1a1e5"
>      > +SRCREV = "b1ca1bb725fd8768782d8105b782932f95b70908"
>      > diff --git a/recipes-qt/qt5/qttools_git.bb
>     <http://qttools_git.bb> b/recipes-qt/qt5/qttools_git.bb
>     <http://qttools_git.bb>
>      > index 7fbf4ee..447164c 100644
>      > --- a/recipes-qt/qt5/qttools_git.bb <http://qttools_git.bb>
>      > +++ b/recipes-qt/qt5/qttools_git.bb <http://qttools_git.bb>
>      > @@ -29,7 +29,7 @@ PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
>      >
>      >   EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG',
>     'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
>      >
>      > -SRCREV = "38b62511970b048b4a0edc5c8bcdea8c37fa76c7"
>      > +SRCREV = "a42d3f2ac4b910ecc910ff144191cb729a745c9a"
>      >
>      >   BBCLASSEXTEND = "native nativesdk"
>      >
>      > diff --git a/recipes-qt/qt5/qtvirtualkeyboard_git.bb
>     <http://qtvirtualkeyboard_git.bb>
>     b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
>     <http://qtvirtualkeyboard_git.bb>
>      > index fbacf93..4154b2a 100644
>      > --- a/recipes-qt/qt5/qtvirtualkeyboard_git.bb
>     <http://qtvirtualkeyboard_git.bb>
>      > +++ b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
>     <http://qtvirtualkeyboard_git.bb>
>      > @@ -49,4 +49,4 @@ FILES_${PN} +=
>     "${OE_QMAKE_PATH_DATA}/qtvirtualkeyboard/lipi_toolkit"
>      >
>      >   DEPENDS += "qtbase qtdeclarative qtmultimedia qtquickcontrols
>     qtsvg qtxmlpatterns qtdeclarative-native"
>      >
>      > -SRCREV = "14f4ea59491e40e7f95df9d7307433ef2c249ab5"
>      > +SRCREV = "b92f0da2f8725ab529ec81c4e1b4b538e66258d2"
>      > diff --git
>     a/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch
>     b/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch
>      > deleted file mode 100644
>      > index 2842807..0000000
>      > ---
>     a/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch
>      > +++ /dev/null
>      > @@ -1,68 +0,0 @@
>      > -From ca13ad2d1a5c119fb3f45c805d2f3caaede95a7d Mon Sep 17
>     00:00:00 2001
>      > -From: Raphael Freudiger <laser_b@gmx.ch <mailto:laser_b@gmx.ch>>
>      > -Date: Tue, 10 Jan 2017 15:49:55 +0100
>      > -Subject: [PATCH] fix build without xkbcommon-evdev
>      > -MIME-Version: 1.0
>      > -Content-Type: text/plain; charset=UTF-8
>      > -Content-Transfer-Encoding: 8bit
>      > -
>      > -Change-Id: I4f52c4ad741fdd7063a18b67f5777b52f03726fe
>      > -Signed-off-by: Raphael Freudiger <laser_b@gmx.ch
>     <mailto:laser_b@gmx.ch>>
>      > -Signed-off-by: Gordan Markuš <gordan.markus@pelagicore.com
>     <mailto:gordan.markus@pelagicore.com>>
>      > ----
>      > - src/client/client.pro <http://client.pro>                     
>              |  2 ++
>      > - src/compositor/compositor.pro <http://compositor.pro>         
>                  |  2 ++
>      > - src/compositor/compositor_api/qwaylandkeyboard.cpp | 13
>     +++++++------
>      > - 3 files changed, 11 insertions(+), 6 deletions(-)
>      > -
>      > -diff --git a/src/client/client.pro <http://client.pro>
>     b/src/client/client.pro <http://client.pro>
>      > -index eae7ad5..0bb7b18 100644
>      > ---- a/src/client/client.pro <http://client.pro>
>      > -+++ b/src/client/client.pro <http://client.pro>
>      > -@@ -147,3 +147,5 @@ MODULE_PLUGIN_TYPES = \
>      > -             wayland-decoration-client \
>      > -             wayland-shell-integration
>      > - load(qt_module)
>      > -+
>      > -+LIBS += -lxkbcommon
>      > -diff --git a/src/compositor/compositor.pro
>     <http://compositor.pro> b/src/compositor/compositor.pro
>     <http://compositor.pro>
>      > -index 47be591..805c81e 100644
>      > ---- a/src/compositor/compositor.pro <http://compositor.pro>
>      > -+++ b/src/compositor/compositor.pro <http://compositor.pro>
>      > -@@ -34,3 +34,5 @@ MODULE_PLUGIN_TYPES = \
>      > -     wayland-hardware-layer-integration \
>      > -
>      > - load(qt_module)
>      > -+
>      > -+LIBS += -lxkbcommon
>      > -diff --git a/src/compositor/compositor_api/qwaylandkeyboard.cpp
>     b/src/compositor/compositor_api/qwaylandkeyboard.cpp
>      > -index 7ab8bff..8c36774 100644
>      > ---- a/src/compositor/compositor_api/qwaylandkeyboard.cpp
>      > -+++ b/src/compositor/compositor_api/qwaylandkeyboard.cpp
>      > -@@ -334,12 +334,6 @@ void
>     QWaylandKeyboardPrivate::createXKBState(xkb_keymap *keymap)
>      > -     xkb_state = xkb_state_new(keymap);
>      > - }
>      > -
>      > --uint QWaylandKeyboardPrivate::toWaylandXkbV1Key(const uint
>     nativeScanCode)
>      > --{
>      > --    const uint offset = 8;
>      > --    Q_ASSERT(nativeScanCode >= offset);
>      > --    return nativeScanCode - offset;
>      > --}
>      > -
>      > - void QWaylandKeyboardPrivate::createXKBKeymap()
>      > - {
>      > -@@ -369,6 +363,13 @@ void QWaylandKeyboardPrivate::createXKBKeymap()
>      > - }
>      > - #endif
>      > -
>      > -+uint QWaylandKeyboardPrivate::toWaylandXkbV1Key(const uint
>     nativeScanCode)
>      > -+{
>      > -+    const uint offset = 8;
>      > -+    Q_ASSERT(nativeScanCode >= offset);
>      > -+    return nativeScanCode - offset;
>      > -+}
>      > -+
>      > - void QWaylandKeyboardPrivate::sendRepeatInfo()
>      > - {
>      > -     Q_FOREACH (Resource *resource, resourceMap()) {
>      > diff --git a/recipes-qt/qt5/qtwayland_git.bb
>     <http://qtwayland_git.bb> b/recipes-qt/qt5/qtwayland_git.bb
>     <http://qtwayland_git.bb>
>      > index 762e612..d6cb114 100644
>      > --- a/recipes-qt/qt5/qtwayland_git.bb <http://qtwayland_git.bb>
>      > +++ b/recipes-qt/qt5/qtwayland_git.bb <http://qtwayland_git.bb>
>      > @@ -37,14 +37,7 @@ PACKAGECONFIG[libhybris-egl-server] =
>     "-feature-libhybris-egl-server,-no-feature
>      >
>      >   EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
>      >
>      > -SRCREV = "434f3e9a952b5858abc1f0ed1179ea5d2fca6a19"
>      > -
>      > -# Patches from https://github.com/meta-qt5/qtwayland/commits/b5.11
>      > -# 5.11.meta-qt5.2
>      > -# From https://bugreports.qt.io/browse/QTBUG-57767
>      > -#SRC_URI += " \
>      > -#    file://0001-fix-build-without-xkbcommon-evdev.patch \
>      > -#"
>      > +SRCREV = "87621266ec66df5fc98cce165e5c80b7721983aa"
>      >
>      >   BBCLASSEXTEND =+ "native nativesdk"
>      >
>      > diff --git a/recipes-qt/qt5/qtwebchannel_git.bb
>     <http://qtwebchannel_git.bb> b/recipes-qt/qt5/qtwebchannel_git.bb
>     <http://qtwebchannel_git.bb>
>      > index 0bcbf56..efad58c 100644
>      > --- a/recipes-qt/qt5/qtwebchannel_git.bb <http://qtwebchannel_git.bb>
>      > +++ b/recipes-qt/qt5/qtwebchannel_git.bb <http://qtwebchannel_git.bb>
>      > @@ -12,4 +12,4 @@ LIC_FILES_CHKSUM = " \
>      >
>      >   DEPENDS += "qtdeclarative qtwebsockets"
>      >
>      > -SRCREV = "01241eb3704af785e8d98fb2f6e223ca62a64175"
>      > +SRCREV = "9800f7d13e770e6409113e83f663ac4a419908a0"
>      > diff --git a/recipes-qt/qt5/qtwebengine_git.bb
>     <http://qtwebengine_git.bb> b/recipes-qt/qt5/qtwebengine_git.bb
>     <http://qtwebengine_git.bb>
>      > index 80928a4..1b8f933 100644
>      > --- a/recipes-qt/qt5/qtwebengine_git.bb <http://qtwebengine_git.bb>
>      > +++ b/recipes-qt/qt5/qtwebengine_git.bb <http://qtwebengine_git.bb>
>      > @@ -158,8 +158,8 @@ SRC_URI_append_libc-musl = "\
>      >     
>       file://0014-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch;patchdir=src/3rdparty \
>      >   "
>      >
>      > -SRCREV_qtwebengine = "b7e5722cce95730004ef6cb9f4aabde5bbd5685d"
>      > -SRCREV_chromium = "e173cb17d97aa3c2065189275c85db79eb7d1748"
>      > +SRCREV_qtwebengine = "28e0320235d33f00c6c141a549dc0553ee0043a5"
>      > +SRCREV_chromium = "1785e2c1eb5a3b9a9a97ef3125c8f444d9b62afb"
>      >   SRCREV = "${SRCREV_qtwebengine}"
>      >
>      >   SRCREV_FORMAT = "qtwebengine_chromium"
>      > diff --git a/recipes-qt/qt5/qtwebglplugin_git.bb
>     <http://qtwebglplugin_git.bb> b/recipes-qt/qt5/qtwebglplugin_git.bb
>     <http://qtwebglplugin_git.bb>
>      > new file mode 100644
>      > index 0000000..62601bb
>      > --- /dev/null
>      > +++ b/recipes-qt/qt5/qtwebglplugin_git.bb
>     <http://qtwebglplugin_git.bb>
>      > @@ -0,0 +1,21 @@
>      > +require qt5.inc
>      > +require qt5-git.inc
>      > +
>      > +LICENSE = "GPL-3.0 | The-Qt-Company-Commercial"
>      > +LIC_FILES_CHKSUM = " \
>      > +    file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
>      > +"
>      > +
>      > +DEPENDS += "qtbase qtwebsockets"
>      > +
>      > +PACKAGECONFIG ?= "qtdeclarative"
>      > +PACKAGECONFIG[qtdeclarative] = ",,qtdeclarative"
>      > +
>      > +do_configure_prepend() {
>      > +    # disable qtdeclarative test if it isn't enabled by
>     PACKAGECONFIG
>      > +    sed -e
>     's/^\(qtHaveModule(quick)\)/OE_QTDECLARATIVE_ENABLED:\1/' -i
>     ${S}/src/plugins/platforms/webgl/webgl.pro <http://webgl.pro>
>      > +}
>      > +
>      > +EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG',
>     'qtdeclarative', 'CONFIG+=OE_QTDECLARATIVE_ENABLED', '', d)}"
>      > +
>      > +SRCREV = "62a5226c6147ee45f488a2e2c65870c1f836a5be"
>      > diff --git a/recipes-qt/qt5/qtwebsockets_git.bb
>     <http://qtwebsockets_git.bb> b/recipes-qt/qt5/qtwebsockets_git.bb
>     <http://qtwebsockets_git.bb>
>      > index cd55bdd..a95b162 100644
>      > --- a/recipes-qt/qt5/qtwebsockets_git.bb <http://qtwebsockets_git.bb>
>      > +++ b/recipes-qt/qt5/qtwebsockets_git.bb <http://qtwebsockets_git.bb>
>      > @@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
>      >
>      >   DEPENDS += "qtbase qtdeclarative"
>      >
>      > -SRCREV = "34ce4b65ba35a487bdb8afa5e59b57cfa3f9b0e0"
>      > +SRCREV = "91bb60bba33a8c7df49835bfacfe9a8dc7381a1e"
>      > diff --git a/recipes-qt/qt5/qtwebview_git.bb
>     <http://qtwebview_git.bb> b/recipes-qt/qt5/qtwebview_git.bb
>     <http://qtwebview_git.bb>
>      > index f8c2425..61b7409 100644
>      > --- a/recipes-qt/qt5/qtwebview_git.bb <http://qtwebview_git.bb>
>      > +++ b/recipes-qt/qt5/qtwebview_git.bb <http://qtwebview_git.bb>
>      > @@ -19,4 +19,4 @@ COMPATIBLE_MACHINE_armv7a = "(.*)"
>      >   COMPATIBLE_MACHINE_armv7ve = "(.*)"
>      >   COMPATIBLE_MACHINE_aarch64 = "(.*)"
>      >
>      > -SRCREV = "bb7dda99936b97cc262f07b25fcb500f8a552c8a"
>      > +SRCREV = "87c9572897daf98f3c4177f6d6acd00bafcc70fd"
>      > diff --git a/recipes-qt/qt5/qtx11extras_git.bb
>     <http://qtx11extras_git.bb> b/recipes-qt/qt5/qtx11extras_git.bb
>     <http://qtx11extras_git.bb>
>      > index b3ce945..d56d185 100644
>      > --- a/recipes-qt/qt5/qtx11extras_git.bb <http://qtx11extras_git.bb>
>      > +++ b/recipes-qt/qt5/qtx11extras_git.bb <http://qtx11extras_git.bb>
>      > @@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
>      >
>      >   DEPENDS += "qtbase"
>      >
>      > -SRCREV = "d80236f50559f4fe785fba598a03aaa7f05d37ac"
>      > +SRCREV = "e239c7919f31798ef567498104bfeeae108b872d"
>      > diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb
>     <http://qtxmlpatterns_git.bb> b/recipes-qt/qt5/qtxmlpatterns_git.bb
>     <http://qtxmlpatterns_git.bb>
>      > index 399adc3..72478df 100644
>      > --- a/recipes-qt/qt5/qtxmlpatterns_git.bb
>     <http://qtxmlpatterns_git.bb>
>      > +++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
>     <http://qtxmlpatterns_git.bb>
>      > @@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = " \
>      >
>      >   DEPENDS += "qtbase"
>      >
>      > -SRCREV = "e4abf2c6e3de158d3a6eb3c46b5158f741136c9d"
>      > +SRCREV = "17c45f3235f0bcb224379b0d1059c7669eb91487"
>      >
>      >   BBCLASSEXTEND =+ "native nativesdk"
>      >
>      >
> 
>     -- 
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 


