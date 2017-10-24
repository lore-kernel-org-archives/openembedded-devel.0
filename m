Return-Path: <daniel@zonque.org>
X-Greylist: delayed 365 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 24 Oct 2017 09:44:06 UTC
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
	by mail.openembedded.org (Postfix) with ESMTP id A913B60721
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Oct 2017 09:44:06 +0000 (UTC)
Received: from [192.168.24.183] (p54AC5F3C.dip0.t-ipconnect.de [84.172.95.60])
	by mail.bugwerft.de (Postfix) with ESMTPSA id B311328090C;
	Tue, 24 Oct 2017 09:34:57 +0000 (UTC)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <1508092056-897-1-git-send-email-Martin.Jansa@gmail.com>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <8aa710c1-1e21-eda2-3b79-fe3f7a95b3c2@zonque.org>
Date: Tue, 24 Oct 2017 11:38:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1508092056-897-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Herman van Hazendonk <github.com@herrie.org>
Subject: Re: [meta-qt5][PATCH] meta-qt5: Update to 5.9.2 release
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
X-List-Received-Date: Tue, 24 Oct 2017 09:44:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On Sunday, October 15, 2017 08:27 PM, Martin Jansa wrote:
> From: Herman van Hazendonk <github.com@herrie.org>
> 
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---
>  .../libconnman-qt/libconnman-qt5_git.bb            |  4 +--
>  recipes-connectivity/libqofono/libqofono_git.bb    |  4 +--
>  recipes-qt/examples/qt5everywheredemo_1.0.bb       |  2 +-
>  recipes-qt/qt5/qt3d_git.bb                         |  2 +-
>  recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bb |  4 +--
>  recipes-qt/qt5/qtbase-native_git.bb                |  2 +-
>  recipes-qt/qt5/qtbase_git.bb                       |  2 +-
>  recipes-qt/qt5/qtcanvas3d_git.bb                   |  2 +-
>  recipes-qt/qt5/qtcharts_git.bb                     |  2 +-
>  recipes-qt/qt5/qtconnectivity_git.bb               |  2 +-
>  recipes-qt/qt5/qtdatavis3d_git.bb                  |  2 +-
>  recipes-qt/qt5/qtdeclarative_git.bb                |  2 +-
>  recipes-qt/qt5/qtenginio_git.bb                    |  2 +-
>  recipes-qt/qt5/qtgamepad_git.bb                    |  2 +-
>  recipes-qt/qt5/qtgraphicaleffects_git.bb           |  2 +-
>  recipes-qt/qt5/qtimageformats_git.bb               |  2 +-
>  .../0001-Make-mapbox-gl-build-configurable.patch   | 27 -------------------
>  recipes-qt/qt5/qtlocation_git.bb                   |  8 ++----
>  recipes-qt/qt5/qtmultimedia_git.bb                 |  2 +-
>  recipes-qt/qt5/qtnetworkauth_git.bb                |  2 +-
>  recipes-qt/qt5/qtquick1_git.bb                     |  2 +-
>  recipes-qt/qt5/qtquickcontrols2_git.bb             |  2 +-
>  recipes-qt/qt5/qtquickcontrols_git.bb              |  2 +-
>  recipes-qt/qt5/qtscript_git.bb                     |  2 +-
>  recipes-qt/qt5/qtscxml_git.bb                      |  2 +-
>  recipes-qt/qt5/qtsensors_git.bb                    |  2 +-
>  recipes-qt/qt5/qtserialbus_git.bb                  |  2 +-
>  recipes-qt/qt5/qtserialport_git.bb                 |  2 +-
>  recipes-qt/qt5/qtsvg_git.bb                        |  2 +-
>  recipes-qt/qt5/qtsystems_git.bb                    |  2 +-
>  recipes-qt/qt5/qttools_git.bb                      |  2 +-
>  recipes-qt/qt5/qtvirtualkeyboard_git.bb            |  2 +-
>  recipes-qt/qt5/qtwayland_git.bb                    |  2 +-
>  recipes-qt/qt5/qtwebchannel_git.bb                 |  2 +-
>  ...qtbug-61521.cpp-use-free-instead-of-cfree.patch | 25 -----------------
>  recipes-qt/qt5/qtwebengine_git.bb                  |  5 ++--
>  recipes-qt/qt5/qtwebsockets_git.bb                 |  2 +-
>  recipes-qt/qt5/qtwebview_git.bb                    |  2 +-
>  recipes-qt/qt5/qtx11extras_git.bb                  |  2 +-
>  recipes-qt/qt5/qtxmlpatterns_git.bb                |  2 +-
>  recipes-qt/qtchooser/qtchooser_git.bb              |  4 +--
>  recipes-qt/tufao/tufao_1.2.1.bb                    | 31 ----------------------
>  recipes-qt/tufao/tufao_1.4.3.bb                    | 31 ++++++++++++++++++++++
>  43 files changed, 76 insertions(+), 133 deletions(-)
>  delete mode 100644 recipes-qt/qt5/qtlocation/0001-Make-mapbox-gl-build-configurable.patch
>  delete mode 100644 recipes-qt/qt5/qtwebengine/0005-qtbug-61521.cpp-use-free-instead-of-cfree.patch
>  delete mode 100644 recipes-qt/tufao/tufao_1.2.1.bb
>  create mode 100644 recipes-qt/tufao/tufao_1.4.3.bb

With this patch applied (based on poky#pyro and meta-qt5#master-next), I
get the following when trying to build qtbase-native:

ERROR: qtbase-native-5.9.2+gitAUTOINC+ec16ba393b-r0 do_compile:
oe_runmake failed
ERROR: qtbase-native-5.9.2+gitAUTOINC+ec16ba393b-r0 do_compile: Function
failed: do_compile (log file is located at
/build/poky/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.9.2+gitAUTOINC+ec16ba393b-r0/temp/log.do_compile.28587)
ERROR: Logfile of failure stored in:
/build/poky/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.9.2+gitAUTOINC+ec16ba393b-r0/temp/log.do_compile.28587
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 4 MAKEFLAGS=-j 4 OE_QMAKE_COMPILER=gcc  OE_QMAKE_CC=gcc
OE_QMAKE_CXX=g++
OE_QMAKE_CFLAGS=-isystem/build/poky/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.9.2+gitAUTOINC+ec16ba393b-r0/recipe-sysroot-native/usr/include
-O2 -pipe
OE_QMAKE_CXXFLAGS=-isystem/build/poky/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.9.2+gitAUTOINC+ec16ba393b-r0/recipe-sysroot-native/usr/include
-O2 -pipe -D_GLIBCXX_USE_CXX11_ABI=0 OE_QMAKE_LINK=g++
OE_QMAKE_LDFLAGS=-L/build/poky/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.9.2+gitAUTOINC+ec16ba393b-r0/recipe-sysroot-native/usr/lib
-L/build/poky/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.9.2+gitAUTOINC+ec16ba393b-r0/recipe-sysroot-native/lib
-Wl,-rpath-link,/build/poky/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.9.2+gitAUTOINC+ec16ba393b-r0/recipe-sysroot-native/usr/lib
-Wl,-rpath-link,/build/poky/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.9.2+gitAUTOINC+ec16ba393b-r0/recipe-sysroot-native/lib
-Wl,-rpath,/build/poky/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.9.2+gitAUTOINC+ec16ba393b-r0/recipe-sysroot-native/usr/lib
-Wl,-rpath,/build/poky/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.9.2+gitAUTOINC+ec16ba393b-r0/recipe-sysroot-native/lib
-Wl,-O1 OE_QMAKE_AR=ar OE_QMAKE_OBJCOPY=objcopy OE_QMAKE_STRIP=echo
OE_QMAKE_WAYLAND_SCANNER=/build/poky/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.9.2+gitAUTOINC+ec16ba393b-r0/recipe-sysroot-native/usr/bin/wayland-scanner
OE_QMAKE_INCDIR_QT=//build/poky/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.9.2+gitAUTOINC+ec16ba393b-r0/recipe-sysroot-native/usr/include/qt5
| ERROR: oe_runmake failed
| cd src/ && ( test -e Makefile ||
/build/poky/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.9.2+gitAUTOINC+ec16ba393b-r0/build/bin/qmake
-o Makefile
/build/poky/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.9.2+gitAUTOINC+ec16ba393b-r0/git/src/src.pro
) && make -f Makefile
| cd qmake/ && ( test -e Makefile.qmake-aux ||
/build/poky/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.9.2+gitAUTOINC+ec16ba393b-r0/build/bin/qmake
-o Makefile.qmake-aux
/build/poky/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.9.2+gitAUTOINC+ec16ba393b-r0/git/qmake/qmake-aux.pro
) && make -f Makefile.qmake-aux
| cd doc/ && ( test -e Makefile ||
/build/poky/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.9.2+gitAUTOINC+ec16ba393b-r0/build/bin/qmake
-o Makefile
/build/poky/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.9.2+gitAUTOINC+ec16ba393b-r0/git/doc/doc.pro
) && make -f Makefile
| Project ERROR: Could not find feature concurrent.


Does anyone else see this?


Thanks,
Daniel


