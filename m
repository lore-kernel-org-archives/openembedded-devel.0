Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 5259C78B38
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jul 2018 07:01:37 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id y5-v6so12240814qti.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jul 2018 00:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CWsGvBvCMVQfrd/NdCmZal+Bdj+xlZjJfxJf+hMwK3Q=;
	b=nyzELmPhXMReMyEsc5XeYSzxQ7RJ+gAIQCLXAnV/ZzCmUvrlhljv6Xq8Ll3/S7Lv4g
	krngM9N2l2JyTz0qmHBiUh/EuzrJfdBPVh8gk/xuBhEN0z2TMFJmoW8qpR64A1EL/nUB
	IGKddkyC2eZamwR61VJTAR/qlXRfgUdLjg/RWpHN4Ct31ARpflq2xBTPTs/E1osRd3xt
	aleTKO+9n+i7IRENV/dZgVK+CN4xbDTdqRDgj+ZZ0pw9CR5PT+uT78WLOkfsrUmLYE1n
	imKPEGFSyzC337G5gXWOKzkzFu0aLXizcDczJOe6Bl/mdHkWtXhgRRGhCJb3sNhnaIla
	Jtcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CWsGvBvCMVQfrd/NdCmZal+Bdj+xlZjJfxJf+hMwK3Q=;
	b=DB3ewi+qpAaOGqz6SXrwU/k0+ZKl5ECe1rzeS+YdzRxRwjnC+0fVkSi8g6pEb50rIM
	k+HRRC1WrWNu1gnGLW6PV3ZbsxSpED8DwwcyMfTGnIyK+mwe3sITntqeAQ1NneW3KcY8
	B6UyBrU6MDSOAN21vLLmm9FfHPI85IhysE9GoIXI+F2n4KcNp7J0Eod+p2U42F76xhaL
	ejqQ3hFHR0K92QPZ2QHvPp5nvHHOBBCOl/3H/VojRjMWmWOM9b2f+JCk0VHY7Hm0ITmU
	0qR6+y7vV9BCd891KYmS35EP897hfxJC45UvjsN8iI7Ld7pDKgNbhIFqCgoIig7Yae8H
	Ug6Q==
X-Gm-Message-State: AOUpUlGJfaw086dvRZmaSTxGSNTu3/8G7HW7CNO0bNFRJwPjYFinXTbm
	tMnyfKcd8Boo0IV6tL0YQqCmoRjH0osdVfULbMQ=
X-Google-Smtp-Source: AAOMgpcoQXgNAnkM+TBEB7l7rWX67BzsQzgddvVzM+TX/lrr7uHcWNffMqIcx2KzzrAwxX5gqFJ0ZYf2sgxP7o6wM48=
X-Received: by 2002:a0c:983d:: with SMTP id
	c58-v6mr4435238qvd.221.1532156496902; 
	Sat, 21 Jul 2018 00:01:36 -0700 (PDT)
MIME-Version: 1.0
References: <20180622003753.23468-1-Martin.Jansa@gmail.com>
	<CAMKF1so1+suDLnoNo7std6_PqY_OU0T6fS6KpZNth_ygE4MV6w@mail.gmail.com>
	<CAMKF1sq6RtwaffAo9heKUYCtUf55WX=R4FToAYbp_q=4KP_fJw@mail.gmail.com>
In-Reply-To: <CAMKF1sq6RtwaffAo9heKUYCtUf55WX=R4FToAYbp_q=4KP_fJw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 21 Jul 2018 00:01:10 -0700
Message-ID: <CAMKF1srQFHWAwoB7mdwBNQMVzCDPnhPZZXmPrY3daOePuhDjTA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][WIP][meta-qt5] qt5: upgrade to 5.11.1
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
X-List-Received-Date: Sat, 21 Jul 2018 07:01:37 -0000
Content-Type: text/plain; charset="UTF-8"

Another one seen with qtwebkit-examples_git.bb

| /home/jenkins/oe/world/oe-build/build/tmpfs/work/aarch64-bec-linux/qtwebkit-examples/5.11.1+gitAUTOINC+2d68492004-r0/recipe-sysroot/usr/include/c++/8.1.0/memory:116:58:
error: cast from 'void*' to 'uintptr_t' {aka 'unsigned int'} loses
precision [-fpermissive]
|    const auto __intptr = reinterpret_cast<uintptr_t>(__ptr);
|                                                           ^

On Fri, Jul 20, 2018 at 11:58 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> another issue on aarch64 (probably when you have ptest in DISTRO_FEATURES)
>
> | linking tst_signature
> | make[5]: Leaving directory
> '/home/jenkins/oe/world/oe-build/build/tmpfs/work/aarch64-bec-linux/qtremoteobjects/5.11.1+gitAUTOINC+cc454911ac-r0/build/tests/auto/repc/signature/signatureTests'
> | make[4]: Leaving directory
> '/home/jenkins/oe/world/oe-build/build/tmpfs/work/aarch64-bec-linux/qtremoteobjects/5.11.1+gitAUTOINC+cc454911ac-r0/build/tests/auto/repc/signature'
> | make[3]: Leaving directory
> '/home/jenkins/oe/world/oe-build/build/tmpfs/work/aarch64-bec-linux/qtremoteobjects/5.11.1+gitAUTOINC+cc454911ac-r0/build/tests/auto/repc'
> | make[2]: Leaving directory
> '/home/jenkins/oe/world/oe-build/build/tmpfs/work/aarch64-bec-linux/qtremoteobjects/5.11.1+gitAUTOINC+cc454911ac-r0/build/tests/auto'
> | Makefile:44: recipe for target 'sub-auto-make_first' failed
> | make[1]: *** [sub-auto-make_first] Error 2
> | make[1]: Leaving directory
> '/home/jenkins/oe/world/oe-build/build/tmpfs/work/aarch64-bec-linux/qtremoteobjects/5.11.1+gitAUTOINC+cc454911ac-r0/build/tests'
> On Fri, Jul 20, 2018 at 11:49 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > I think its a bit late but qtbase 5.11.1 fails to build with thumb1/armv5te
> >
> > | {standard input}: Assembler messages:
> > | {standard input}: Error: unaligned opcodes detected in executable segment
> > | Makefile:46266: recipe for target '.obj/qdrawhelper.o' failed
> > | make[2]: *** [.obj/qdrawhelper.o] Error 1
> > | make[2]: *** Waiting for unfinished jobs....
> >
> >
> > On Thu, Jun 21, 2018 at 5:38 PM Martin Jansa <martin.jansa@gmail.com> wrote:
> > >
> > > * WIP: qtwebengine wasn't downmerged to 5.11 branch yet
> > >
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >  recipes-qt/qt5/nativesdk-qtbase_git.bb        |  6 +-
> > >  .../qt3d/0001-Allow-a-tools-only-build.patch  |  2 +-
> > >  recipes-qt/qt5/qt3d_git.bb                    |  4 +-
> > >  recipes-qt/qt5/qt5-git.inc                    |  2 +-
> > >  recipes-qt/qt5/qtbase-native_git.bb           |  6 +-
> > >  .../qtbase/0001-Add-linux-oe-g-platform.patch |  2 +-
> > >  ...Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch |  2 +-
> > >  ...ow-to-set-qt.conf-from-the-outside-u.patch |  5 +-
> > >  ...ath-length-from-256-to-512-character.patch |  2 +-
> > >  ...own-features-instead-of-erroring-out.patch |  4 +-
> > >  ...-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch |  2 +-
> > >  ...0007-Delete-qlonglong-and-qulonglong.patch |  2 +-
> > >  ...place-pthread_yield-with-sched_yield.patch |  6 +-
> > >  ...OE-specific-specs-for-clang-compiler.patch |  2 +-
> > >  ...rt-conditional-for-defining-QT_SOCKL.patch |  4 +-
> > >  ...ale-Enable-QT_USE_FENV-only-on-glibc.patch |  4 +-
> > >  ...cc-base.conf-Use-I-instead-of-isyste.patch |  4 +-
> > >  .../0013-Always-build-uic-and-qvkgen.patch    |  4 +-
> > >  ...014-Bootstrap-without-linkat-feature.patch |  4 +-
> > >  recipes-qt/qt5/qtbase_git.bb                  |  4 +-
> > >  recipes-qt/qt5/qtcanvas3d_git.bb              |  2 +-
> > >  recipes-qt/qt5/qtcharts_git.bb                |  2 +-
> > >  recipes-qt/qt5/qtconnectivity_git.bb          |  2 +-
> > >  recipes-qt/qt5/qtdatavis3d_git.bb             |  2 +-
> > >  recipes-qt/qt5/qtdeclarative_git.bb           |  2 +-
> > >  recipes-qt/qt5/qtgamepad_git.bb               |  2 +-
> > >  recipes-qt/qt5/qtgraphicaleffects_git.bb      |  2 +-
> > >  recipes-qt/qt5/qtimageformats_git.bb          |  2 +-
> > >  recipes-qt/qt5/qtknx_git.bb                   |  2 +-
> > >  recipes-qt/qt5/qtlocation_git.bb              |  6 +-
> > >  recipes-qt/qt5/qtmqtt_git.bb                  |  2 +-
> > >  ...imedia-fix-a-conflicting-declaration.patch |  2 +-
> > >  recipes-qt/qt5/qtmultimedia_git.bb            |  4 +-
> > >  recipes-qt/qt5/qtnetworkauth_git.bb           |  2 +-
> > >  recipes-qt/qt5/qtopcua_git.bb                 |  2 +-
> > >  recipes-qt/qt5/qtpurchasing_git.bb            |  2 +-
> > >  recipes-qt/qt5/qtquickcontrols2_git.bb        |  2 +-
> > >  recipes-qt/qt5/qtquickcontrols_git.bb         |  2 +-
> > >  .../0001-Allow-a-tools-only-build.patch       |  2 +-
> > >  recipes-qt/qt5/qtremoteobjects_git.bb         |  4 +-
> > >  recipes-qt/qt5/qtscript_git.bb                |  2 +-
> > >  ...xternal-host-bin-path-for-cmake-file.patch |  2 +-
> > >  recipes-qt/qt5/qtscxml_git.bb                 |  4 +-
> > >  recipes-qt/qt5/qtsensors_git.bb               |  2 +-
> > >  recipes-qt/qt5/qtserialbus_git.bb             |  2 +-
> > >  recipes-qt/qt5/qtserialport_git.bb            |  2 +-
> > >  recipes-qt/qt5/qtsvg_git.bb                   |  2 +-
> > >  .../0001-add-noqtwebkit-configuration.patch   |  2 +-
> > >  ...make-allow-overriding-the-location-f.patch |  2 +-
> > >  recipes-qt/qt5/qttools_git.bb                 |  4 +-
> > >  recipes-qt/qt5/qttranslations_git.bb          |  2 +-
> > >  recipes-qt/qt5/qtvirtualkeyboard_git.bb       |  2 +-
> > >  recipes-qt/qt5/qtwayland_git.bb               |  2 +-
> > >  recipes-qt/qt5/qtwebchannel_git.bb            |  2 +-
> > >  ...webengineview_p_p.h-add-include-QCol.patch |  4 +-
> > >  ...ndency-to-QCoreApplication-translate.patch |  2 +-
> > >  ...3-Force-host-toolchain-configuration.patch |  4 +-
> > >  ...es.cpp-Fix-build-with-plugins-and-oz.patch |  2 +-
> > >  ...valloc-as-it-s-not-available-on-musl.patch |  2 +-
> > >  .../0006-musl-link-against-libexecinfo.patch  |  2 +-
> > >  ...m-Force-host-toolchain-configuration.patch |  2 +-
> > >  ...rkaround-for-too-long-.rps-file-name.patch |  2 +-
> > >  .../0003-chromium-Fix-build-with-gcc8.patch   |  2 +-
> > >  ...04-chromium-Fix-build-with-GCC-8.1.0.patch | 83 -------------------
> > >  ...dbox-Define-TEMP_FAILURE_RETRY-if-n.patch} |  2 +-
> > >  ...id-mallinfo-APIs-on-non-glibc-linux.patch} |  2 +-
> > >  ...ium-musl-include-fcntl.h-for-loff_t.patch} |  2 +-
> > >  ...-off64_t-instead-of-the-internal-__.patch} |  2 +-
> > >  ...sl-linux-glibc-make-the-distinction.patch} |  2 +-
> > >  ...ocator-Do-not-include-glibc_weak_sy.patch} |  2 +-
> > >  ...-correct-member-name-__si_fields-fr.patch} |  2 +-
> > >  ...ine-res_ninit-and-res_nclose-for-no.patch} |  2 +-
> > >  ...m-musl-Do-not-define-__sbrk-on-musl.patch} |  2 +-
> > >  ...l-Adjust-default-pthread-stack-size.patch} |  2 +-
> > >  ...lude-asm-generic-ioctl.h-for-TCGETS.patch} |  2 +-
> > >  ...alloc-Use-off64_t-insread-of-__off6.patch} |  2 +-
> > >  recipes-qt/qt5/qtwebengine_git.bb             | 36 ++++----
> > >  recipes-qt/qt5/qtwebglplugin_git.bb           |  2 +-
> > >  recipes-qt/qt5/qtwebsockets_git.bb            |  2 +-
> > >  recipes-qt/qt5/qtwebview_git.bb               |  2 +-
> > >  recipes-qt/qt5/qtx11extras_git.bb             |  2 +-
> > >  recipes-qt/qt5/qtxmlpatterns_git.bb           |  2 +-
> > >  82 files changed, 123 insertions(+), 203 deletions(-)
> > >  delete mode 100644 recipes-qt/qt5/qtwebengine/chromium/0004-chromium-Fix-build-with-GCC-8.1.0.patch
> > >  rename recipes-qt/qt5/qtwebengine/chromium/{0005-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch => 0004-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch} (93%)
> > >  rename recipes-qt/qt5/qtwebengine/chromium/{0006-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch => 0005-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch} (97%)
> > >  rename recipes-qt/qt5/qtwebengine/chromium/{0007-chromium-musl-include-fcntl.h-for-loff_t.patch => 0006-chromium-musl-include-fcntl.h-for-loff_t.patch} (92%)
> > >  rename recipes-qt/qt5/qtwebengine/chromium/{0008-chromium-musl-use-off64_t-instead-of-the-internal-__.patch => 0007-chromium-musl-use-off64_t-instead-of-the-internal-__.patch} (97%)
> > >  rename recipes-qt/qt5/qtwebengine/chromium/{0009-chromium-musl-linux-glibc-make-the-distinction.patch => 0008-chromium-musl-linux-glibc-make-the-distinction.patch} (94%)
> > >  rename recipes-qt/qt5/qtwebengine/chromium/{0010-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch => 0009-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch} (94%)
> > >  rename recipes-qt/qt5/qtwebengine/chromium/{0011-chromium-musl-Use-correct-member-name-__si_fields-fr.patch => 0010-chromium-musl-Use-correct-member-name-__si_fields-fr.patch} (94%)
> > >  rename recipes-qt/qt5/qtwebengine/chromium/{0012-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch => 0011-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch} (97%)
> > >  rename recipes-qt/qt5/qtwebengine/chromium/{0013-chromium-musl-Do-not-define-__sbrk-on-musl.patch => 0012-chromium-musl-Do-not-define-__sbrk-on-musl.patch} (94%)
> > >  rename recipes-qt/qt5/qtwebengine/chromium/{0014-chromium-musl-Adjust-default-pthread-stack-size.patch => 0013-chromium-musl-Adjust-default-pthread-stack-size.patch} (97%)
> > >  rename recipes-qt/qt5/qtwebengine/chromium/{0015-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch => 0014-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch} (91%)
> > >  rename recipes-qt/qt5/qtwebengine/chromium/{0016-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch => 0015-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch} (95%)
> > >
> > > diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
> > > index 5971eeb..dc01cef 100644
> > > --- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
> > > +++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
> > > @@ -24,7 +24,7 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/qtbase:"
> > >
> > >  # common for qtbase-native, qtbase-nativesdk and qtbase
> > >  # Patches from https://github.com/meta-qt5/qtbase/commits/b5.11-shared
> > > -# 5.11.meta-qt5-shared.2
> > > +# 5.11.meta-qt5-shared.5
> > >  SRC_URI += "\
> > >      file://0001-Add-linux-oe-g-platform.patch \
> > >      file://0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch \
> > > @@ -42,7 +42,7 @@ SRC_URI += "\
> > >
> > >  # common for qtbase-native and nativesdk-qtbase
> > >  # Patches from https://github.com/meta-qt5/qtbase/commits/b5.11-native
> > > -# 5.11.meta-qt5-native.2
> > > +# 5.11.meta-qt5-native.5
> > >  SRC_URI += " \
> > >      file://0013-Always-build-uic-and-qvkgen.patch \
> > >  "
> > > @@ -209,4 +209,4 @@ fakeroot do_generate_qt_environment_file() {
> > >  do_generate_qt_environment_file[umask] = "022"
> > >  addtask generate_qt_environment_file after do_install before do_package
> > >
> > > -SRCREV = "6eef81ee1c82f934e14d47047d8b6103b8755321"
> > > +SRCREV = "74305ba470f48da8b4c4e806fc714fe9f7649156"
> > > diff --git a/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch b/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
> > > index 3741b63..8836321 100644
> > > --- a/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
> > > +++ b/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
> > > @@ -1,4 +1,4 @@
> > > -From 991fd18a30002d964cf3a6ec9309750d0f7d4365 Mon Sep 17 00:00:00 2001
> > > +From 15ba3204df65645f604a23f71f819a392ff1e4b7 Mon Sep 17 00:00:00 2001
> > >  From: Samuli Piippo <samuli.piippo@theqtcompany.com>
> > >  Date: Wed, 10 Feb 2016 09:02:09 +0200
> > >  Subject: [PATCH] Allow a tools-only build
> > > diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
> > > index 0b6640b..bd87dcb 100644
> > > --- a/recipes-qt/qt5/qt3d_git.bb
> > > +++ b/recipes-qt/qt5/qt3d_git.bb
> > > @@ -12,7 +12,7 @@ DEPENDS += "qtbase"
> > >  DEPENDS_class-target += "qtdeclarative qt3d-native"
> > >
> > >  # Patches from https://github.com/meta-qt5/qt3d/commits/b5.11
> > > -# 5.11.meta-qt5.3
> > > +# 5.11.meta-qt5.4
> > >  SRC_URI += " \
> > >      file://0001-Allow-a-tools-only-build.patch \
> > >  "
> > > @@ -36,6 +36,6 @@ do_configure_prepend() {
> > >           ${S}/src/quick3d/imports/input/importsinput.pro
> > >  }
> > >
> > > -SRCREV = "15e863517ea37ca7ba6bcb75b078272eddbc5d37"
> > > +SRCREV = "3b4a9b50618210c08dc08ae0e2dcf3b8d495eccf"
> > >
> > >  BBCLASSEXTEND += "native nativesdk"
> > > diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
> > > index 41ad280..09b6cc5 100644
> > > --- a/recipes-qt/qt5/qt5-git.inc
> > > +++ b/recipes-qt/qt5/qt5-git.inc
> > > @@ -14,4 +14,4 @@ CVE_PRODUCT = "qt"
> > >
> > >  S = "${WORKDIR}/git"
> > >
> > > -PV = "5.11.0+git${SRCPV}"
> > > +PV = "5.11.1+git${SRCPV}"
> > > diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
> > > index 0d7e598..2ec3600 100644
> > > --- a/recipes-qt/qt5/qtbase-native_git.bb
> > > +++ b/recipes-qt/qt5/qtbase-native_git.bb
> > > @@ -19,7 +19,7 @@ require qt5-git.inc
> > >
> > >  # common for qtbase-native, qtbase-nativesdk and qtbase
> > >  # Patches from https://github.com/meta-qt5/qtbase/commits/b5.11-shared
> > > -# 5.11.meta-qt5-shared.2
> > > +# 5.11.meta-qt5-shared.5
> > >  SRC_URI += "\
> > >      file://0001-Add-linux-oe-g-platform.patch \
> > >      file://0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch \
> > > @@ -37,7 +37,7 @@ SRC_URI += "\
> > >
> > >  # common for qtbase-native and nativesdk-qtbase
> > >  # Patches from https://github.com/meta-qt5/qtbase/commits/b5.10-native
> > > -# 5.11.meta-qt5-native.2
> > > +# 5.11.meta-qt5-native.5
> > >  SRC_URI += " \
> > >      file://0013-Always-build-uic-and-qvkgen.patch \
> > >  "
> > > @@ -134,4 +134,4 @@ do_install() {
> > >      echo 'set(_qt5_corelib_extra_includes "${_qt5Core_install_prefix}/lib${QT_DIR_NAME}/mkspecs/linux-oe-g++")' > ${D}${libdir}/cmake/Qt5Core/Qt5CoreConfigExtrasMkspecDir.cmake
> > >  }
> > >
> > > -SRCREV = "6eef81ee1c82f934e14d47047d8b6103b8755321"
> > > +SRCREV = "74305ba470f48da8b4c4e806fc714fe9f7649156"
> > > diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
> > > index c2a0d04..8f7afb6 100644
> > > --- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
> > > +++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
> > > @@ -1,4 +1,4 @@
> > > -From 0152f09dc119c93cc92bc2bb9de38c64fb0a854e Mon Sep 17 00:00:00 2001
> > > +From bb416ea80d421c53012e13280d68bdcefc815b8f Mon Sep 17 00:00:00 2001
> > >  From: Martin Jansa <Martin.Jansa@gmail.com>
> > >  Date: Mon, 15 Apr 2013 04:29:32 +0200
> > >  Subject: [PATCH] Add linux-oe-g++ platform
> > > diff --git a/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch b/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch
> > > index 81600f8..3a219c1 100644
> > > --- a/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch
> > > +++ b/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch
> > > @@ -1,4 +1,4 @@
> > > -From eb39258656c27c72c34674201b946d27eeefe24a Mon Sep 17 00:00:00 2001
> > > +From 4941648d4b26d625e86273d992697129209d8256 Mon Sep 17 00:00:00 2001
> > >  From: Martin Jansa <Martin.Jansa@gmail.com>
> > >  Date: Sat, 6 Apr 2013 13:15:07 +0200
> > >  Subject: [PATCH] cmake: Use OE_QMAKE_PATH_EXTERNAL_HOST_BINS
> > > diff --git a/recipes-qt/qt5/qtbase/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
> > > index 2ea9e04..2450f7e 100644
> > > --- a/recipes-qt/qt5/qtbase/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
> > > +++ b/recipes-qt/qt5/qtbase/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
> > > @@ -1,4 +1,4 @@
> > > -From b5dac69f4309950b828566002d07662b77e34097 Mon Sep 17 00:00:00 2001
> > > +From 1fce658543816f654c6b4abcf02b6190189ba3b7 Mon Sep 17 00:00:00 2001
> > >  From: Holger Freyther <zecke@selfish.org>
> > >  Date: Wed, 26 Sep 2012 17:22:30 +0200
> > >  Subject: [PATCH] qlibraryinfo: allow to set qt.conf from the outside using the
> > > @@ -13,13 +13,14 @@ Upstream-Status: Inappropriate [embedded specific]
> > >    qmake from sstate and replacing all configured paths in it with qt.conf from
> > >    environment).
> > >
> > > +Change-Id: I41595c6ce7514e8f197d0a19a1308c9460037d1b
> > >  Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > >  ---
> > >   src/corelib/global/qlibraryinfo.cpp | 5 ++++-
> > >   1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> > >  diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
> > > -index 422d08f32c..a59df4f20e 100644
> > > +index 422d08f32c..cb092301fa 100644
> > >  --- a/src/corelib/global/qlibraryinfo.cpp
> > >  +++ b/src/corelib/global/qlibraryinfo.cpp
> > >  @@ -172,7 +172,10 @@ void QLibrarySettings::load()
> > > diff --git a/recipes-qt/qt5/qtbase/0004-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase/0004-configure-bump-path-length-from-256-to-512-character.patch
> > > index db4fd8d..141923d 100644
> > > --- a/recipes-qt/qt5/qtbase/0004-configure-bump-path-length-from-256-to-512-character.patch
> > > +++ b/recipes-qt/qt5/qtbase/0004-configure-bump-path-length-from-256-to-512-character.patch
> > > @@ -1,4 +1,4 @@
> > > -From a635233ec28ce588ffb5a46fb9fbbda318dafb35 Mon Sep 17 00:00:00 2001
> > > +From 0dbc0d39c274f35415122d0b4d001da50d8e5355 Mon Sep 17 00:00:00 2001
> > >  From: Denys Dmytriyenko <denys@ti.com>
> > >  Date: Tue, 25 Aug 2015 10:05:15 -0400
> > >  Subject: [PATCH] configure: bump path length from 256 to 512 characters
> > > diff --git a/recipes-qt/qt5/qtbase/0005-Disable-all-unknown-features-instead-of-erroring-out.patch b/recipes-qt/qt5/qtbase/0005-Disable-all-unknown-features-instead-of-erroring-out.patch
> > > index 4d6e3f9..24f966f 100644
> > > --- a/recipes-qt/qt5/qtbase/0005-Disable-all-unknown-features-instead-of-erroring-out.patch
> > > +++ b/recipes-qt/qt5/qtbase/0005-Disable-all-unknown-features-instead-of-erroring-out.patch
> > > @@ -1,4 +1,4 @@
> > > -From 245cca40e10db2f9528a03c4941308a52ab26844 Mon Sep 17 00:00:00 2001
> > > +From ffc59fc3f976db9008859857c2db1579b7784b57 Mon Sep 17 00:00:00 2001
> > >  From: Samuli Piippo <samuli.piippo@qt.io>
> > >  Date: Mon, 24 Oct 2016 09:45:18 +0300
> > >  Subject: [PATCH] Disable all unknown features instead of erroring out
> > > @@ -10,7 +10,7 @@ Change-Id: Ib884fe33cac74439f9592b145937f6b75ced8447
> > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > >  diff --git a/mkspecs/features/qt_configure.prf b/mkspecs/features/qt_configure.prf
> > > -index 6e29eaa2b7..de8c8d26e6 100644
> > > +index 1211129283..f2c5b3a5a4 100644
> > >  --- a/mkspecs/features/qt_configure.prf
> > >  +++ b/mkspecs/features/qt_configure.prf
> > >  @@ -1265,7 +1265,8 @@ defineReplace(qtConfEvaluateSingleExpression) {
> > > diff --git a/recipes-qt/qt5/qtbase/0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch b/recipes-qt/qt5/qtbase/0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
> > > index a24af4a..537ff3f 100644
> > > --- a/recipes-qt/qt5/qtbase/0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
> > > +++ b/recipes-qt/qt5/qtbase/0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
> > > @@ -1,4 +1,4 @@
> > > -From 8d321a556a0fe17a549c4c07fb8a5ddf8a29ada1 Mon Sep 17 00:00:00 2001
> > > +From 78d36c322ca9d8d90a419b15febef4c11bf9066b Mon Sep 17 00:00:00 2001
> > >  From: Pascal Bach <pascal.bach@siemens.com>
> > >  Date: Wed, 11 May 2016 15:20:41 +0200
> > >  Subject: [PATCH] Pretend Qt5 wasn't found if OE_QMAKE_PATH_EXTERNAL_HOST_BINS
> > > diff --git a/recipes-qt/qt5/qtbase/0007-Delete-qlonglong-and-qulonglong.patch b/recipes-qt/qt5/qtbase/0007-Delete-qlonglong-and-qulonglong.patch
> > > index 0a1b7c2..9b449d3 100644
> > > --- a/recipes-qt/qt5/qtbase/0007-Delete-qlonglong-and-qulonglong.patch
> > > +++ b/recipes-qt/qt5/qtbase/0007-Delete-qlonglong-and-qulonglong.patch
> > > @@ -1,4 +1,4 @@
> > > -From b13e2643502bd8269515b79f296d3959ad43b100 Mon Sep 17 00:00:00 2001
> > > +From ee84c3b9cc8add6ee0c1a49c167b51f8d37230ae Mon Sep 17 00:00:00 2001
> > >  From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> > >  Date: Wed, 7 Jun 2017 21:00:49 +0900
> > >  Subject: [PATCH] Delete qlonglong and qulonglong
> > > diff --git a/recipes-qt/qt5/qtbase/0008-Replace-pthread_yield-with-sched_yield.patch b/recipes-qt/qt5/qtbase/0008-Replace-pthread_yield-with-sched_yield.patch
> > > index e57c9e9..77b11a4 100644
> > > --- a/recipes-qt/qt5/qtbase/0008-Replace-pthread_yield-with-sched_yield.patch
> > > +++ b/recipes-qt/qt5/qtbase/0008-Replace-pthread_yield-with-sched_yield.patch
> > > @@ -1,4 +1,4 @@
> > > -From 7e6170bff92157204e2f08da0cb531c133654cc0 Mon Sep 17 00:00:00 2001
> > > +From ef85b182bc1f2f6a337c6946fdbf3b37ade936cb Mon Sep 17 00:00:00 2001
> > >  From: Khem Raj <raj.khem@gmail.com>
> > >  Date: Thu, 27 Jul 2017 08:02:51 -0700
> > >  Subject: [PATCH] Replace pthread_yield with sched_yield
> > > @@ -36,7 +36,7 @@ index c6fd5d17c2..7bf6bfd0e6 100644
> > >               QMetaType info(tp);
> > >               if (!info.isValid()) {
> > >  diff --git a/tests/auto/network/socket/qtcpsocket/tst_qtcpsocket.cpp b/tests/auto/network/socket/qtcpsocket/tst_qtcpsocket.cpp
> > > -index fc92ed6cbc..e59b858758 100644
> > > +index 263a475435..11994b3c4f 100644
> > >  --- a/tests/auto/network/socket/qtcpsocket/tst_qtcpsocket.cpp
> > >  +++ b/tests/auto/network/socket/qtcpsocket/tst_qtcpsocket.cpp
> > >  @@ -78,6 +78,7 @@
> > > @@ -47,7 +47,7 @@ index fc92ed6cbc..e59b858758 100644
> > >   #endif
> > >
> > >   #include "private/qhostinfo_p.h"
> > > -@@ -2136,8 +2137,8 @@ public slots:
> > > +@@ -2132,8 +2133,8 @@ public slots:
> > >
> > >   #if defined(Q_OS_MAC)
> > >           pthread_yield_np();
> > > diff --git a/recipes-qt/qt5/qtbase/0009-Add-OE-specific-specs-for-clang-compiler.patch b/recipes-qt/qt5/qtbase/0009-Add-OE-specific-specs-for-clang-compiler.patch
> > > index 480d492..3aa0d2d 100644
> > > --- a/recipes-qt/qt5/qtbase/0009-Add-OE-specific-specs-for-clang-compiler.patch
> > > +++ b/recipes-qt/qt5/qtbase/0009-Add-OE-specific-specs-for-clang-compiler.patch
> > > @@ -1,4 +1,4 @@
> > > -From fe973eb4d92470888e71996300dec146f31d9512 Mon Sep 17 00:00:00 2001
> > > +From 9a370262cce48a78b944a8d6e77257f915ab76e6 Mon Sep 17 00:00:00 2001
> > >  From: Khem Raj <raj.khem@gmail.com>
> > >  Date: Sun, 3 Sep 2017 09:11:44 -0700
> > >  Subject: [PATCH] Add OE specific specs for clang compiler
> > > diff --git a/recipes-qt/qt5/qtbase/0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch b/recipes-qt/qt5/qtbase/0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch
> > > index e98b9b2..5b8a10d 100644
> > > --- a/recipes-qt/qt5/qtbase/0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch
> > > +++ b/recipes-qt/qt5/qtbase/0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch
> > > @@ -1,4 +1,4 @@
> > > -From a3358cf43c523af046638337960686e942798d2c Mon Sep 17 00:00:00 2001
> > > +From c8840a63123e084cd5b2b3b8f10df72ed0ba2efb Mon Sep 17 00:00:00 2001
> > >  From: Khem Raj <raj.khem@gmail.com>
> > >  Date: Sun, 3 Sep 2017 09:44:48 -0700
> > >  Subject: [PATCH] linux-clang: Invert conditional for defining QT_SOCKLEN_T
> > > @@ -13,7 +13,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > >   1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > >  diff --git a/mkspecs/linux-clang/qplatformdefs.h b/mkspecs/linux-clang/qplatformdefs.h
> > > -index a818d97..959a508 100644
> > > +index a818d973f0..959a508d3a 100644
> > >  --- a/mkspecs/linux-clang/qplatformdefs.h
> > >  +++ b/mkspecs/linux-clang/qplatformdefs.h
> > >  @@ -81,10 +81,10 @@
> > > diff --git a/recipes-qt/qt5/qtbase/0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch b/recipes-qt/qt5/qtbase/0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch
> > > index 94d2ea1..cc82877 100644
> > > --- a/recipes-qt/qt5/qtbase/0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch
> > > +++ b/recipes-qt/qt5/qtbase/0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch
> > > @@ -1,4 +1,4 @@
> > > -From 8bf717e2ecda234f626f96ae08e0be3a6eca26d8 Mon Sep 17 00:00:00 2001
> > > +From 50c9fd7dc392ac4591c37bc3c97a6e48486e01b7 Mon Sep 17 00:00:00 2001
> > >  From: Khem Raj <raj.khem@gmail.com>
> > >  Date: Sun, 3 Sep 2017 10:11:50 -0700
> > >  Subject: [PATCH] tst_qlocale: Enable QT_USE_FENV only on glibc
> > > @@ -11,7 +11,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > >  diff --git a/tests/auto/corelib/tools/qlocale/tst_qlocale.cpp b/tests/auto/corelib/tools/qlocale/tst_qlocale.cpp
> > > -index 375cecd..46ca9b1 100644
> > > +index 375cecd521..46ca9b11cc 100644
> > >  --- a/tests/auto/corelib/tools/qlocale/tst_qlocale.cpp
> > >  +++ b/tests/auto/corelib/tools/qlocale/tst_qlocale.cpp
> > >  @@ -46,7 +46,7 @@
> > > diff --git a/recipes-qt/qt5/qtbase/0012-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch b/recipes-qt/qt5/qtbase/0012-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch
> > > index 89252de..1d6f363 100644
> > > --- a/recipes-qt/qt5/qtbase/0012-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch
> > > +++ b/recipes-qt/qt5/qtbase/0012-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch
> > > @@ -1,4 +1,4 @@
> > > -From f09d998036af014a42c464eea72368c8f2920f6a Mon Sep 17 00:00:00 2001
> > > +From b41e0477f9b7aad73c94833dc750971a606871dc Mon Sep 17 00:00:00 2001
> > >  From: Khem Raj <raj.khem@gmail.com>
> > >  Date: Wed, 14 Feb 2018 17:08:43 -0800
> > >  Subject: [PATCH] mkspecs/common/gcc-base.conf: Use -I instead of -isystem
> > > @@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > >  diff --git a/mkspecs/common/gcc-base.conf b/mkspecs/common/gcc-base.conf
> > > -index 234f71d..ee3da02 100644
> > > +index 234f71d495..ee3da023e6 100644
> > >  --- a/mkspecs/common/gcc-base.conf
> > >  +++ b/mkspecs/common/gcc-base.conf
> > >  @@ -46,7 +46,7 @@ QMAKE_CFLAGS_DEBUG         += -g
> > > diff --git a/recipes-qt/qt5/qtbase/0013-Always-build-uic-and-qvkgen.patch b/recipes-qt/qt5/qtbase/0013-Always-build-uic-and-qvkgen.patch
> > > index ea23cce..541e2df 100644
> > > --- a/recipes-qt/qt5/qtbase/0013-Always-build-uic-and-qvkgen.patch
> > > +++ b/recipes-qt/qt5/qtbase/0013-Always-build-uic-and-qvkgen.patch
> > > @@ -1,4 +1,4 @@
> > > -From 10f419678fe4f7087c973a8d8dd96bb0d781487b Mon Sep 17 00:00:00 2001
> > > +From 2457aafe89d811bb01bd3d185e5a5818671209a2 Mon Sep 17 00:00:00 2001
> > >  From: Martin Jansa <Martin.Jansa@gmail.com>
> > >  Date: Sat, 16 Nov 2013 00:32:30 +0100
> > >  Subject: [PATCH] Always build uic and qvkgen
> > > @@ -14,7 +14,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > >  diff --git a/src/src.pro b/src/src.pro
> > > -index 1f7c5d9..6b39379 100644
> > > +index 1f7c5d99c1..6b39379dd0 100644
> > >  --- a/src/src.pro
> > >  +++ b/src/src.pro
> > >  @@ -222,7 +222,7 @@ qtConfig(gui) {
> > > diff --git a/recipes-qt/qt5/qtbase/0014-Bootstrap-without-linkat-feature.patch b/recipes-qt/qt5/qtbase/0014-Bootstrap-without-linkat-feature.patch
> > > index 57cfe36..f58f70a 100644
> > > --- a/recipes-qt/qt5/qtbase/0014-Bootstrap-without-linkat-feature.patch
> > > +++ b/recipes-qt/qt5/qtbase/0014-Bootstrap-without-linkat-feature.patch
> > > @@ -1,4 +1,4 @@
> > > -From 7691598a164737591068f8670f02a904ffce5dd2 Mon Sep 17 00:00:00 2001
> > > +From 24be588f9998e3874047d9394a09becaf11ccddd Mon Sep 17 00:00:00 2001
> > >  From: Samuli Piippo <samuli.piippo@qt.io>
> > >  Date: Fri, 24 Nov 2017 15:16:31 +0200
> > >  Subject: [PATCH] Bootstrap without linkat feature
> > > @@ -13,7 +13,7 @@ Upstream-Status: Inappropriate [OE specific]
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > >  diff --git a/src/corelib/global/qconfig-bootstrapped.h b/src/corelib/global/qconfig-bootstrapped.h
> > > -index 3469ebe..cb889f2 100644
> > > +index 3469ebe5e6..cb889f27c2 100644
> > >  --- a/src/corelib/global/qconfig-bootstrapped.h
> > >  +++ b/src/corelib/global/qconfig-bootstrapped.h
> > >  @@ -90,7 +90,7 @@
> > > diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> > > index 7f296d4..12321a3 100644
> > > --- a/recipes-qt/qt5/qtbase_git.bb
> > > +++ b/recipes-qt/qt5/qtbase_git.bb
> > > @@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = " \
> > >
> > >  # common for qtbase-native, qtbase-nativesdk and qtbase
> > >  # Patches from https://github.com/meta-qt5/qtbase/commits/b5.11-shared
> > > -# 5.11.meta-qt5-shared.3
> > > +# 5.11.meta-qt5-shared.5
> > >  SRC_URI += "\
> > >      file://0001-Add-linux-oe-g-platform.patch \
> > >      file://0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch \
> > > @@ -247,4 +247,4 @@ INSANE_SKIP_${PN}-mkspecs += "file-rdeps"
> > >
> > >  RRECOMMENDS_${PN}-plugins += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11-locale', '', d)}"
> > >
> > > -SRCREV = "6eef81ee1c82f934e14d47047d8b6103b8755321"
> > > +SRCREV = "74305ba470f48da8b4c4e806fc714fe9f7649156"
> > > diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb b/recipes-qt/qt5/qtcanvas3d_git.bb
> > > index 8757967..1f551f4 100644
> > > --- a/recipes-qt/qt5/qtcanvas3d_git.bb
> > > +++ b/recipes-qt/qt5/qtcanvas3d_git.bb
> > > @@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
> > >
> > >  DEPENDS = "qtdeclarative"
> > >
> > > -SRCREV = "9d555f6d21d013c990793aaaa23a5085529631a5"
> > > +SRCREV = "cab02f1401ef10a06929c3681e45c57a02e15bec"
> > > diff --git a/recipes-qt/qt5/qtcharts_git.bb b/recipes-qt/qt5/qtcharts_git.bb
> > > index a6ec17f..d2061d2 100644
> > > --- a/recipes-qt/qt5/qtcharts_git.bb
> > > +++ b/recipes-qt/qt5/qtcharts_git.bb
> > > @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = " \
> > >
> > >  DEPENDS += "qtbase qtdeclarative qtmultimedia"
> > >
> > > -SRCREV = "4f66d1ffeecd95b4bf6666b71536c42dea7450ed"
> > > +SRCREV = "2ad3020dfee0af78bf4e3f90fd43b6d45679b468"
> > >
> > >  # The same issue as in qtbase:
> > >  # http://errors.yoctoproject.org/Errors/Details/152641/
> > > diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
> > > index e23f632..c7f9dd8 100644
> > > --- a/recipes-qt/qt5/qtconnectivity_git.bb
> > > +++ b/recipes-qt/qt5/qtconnectivity_git.bb
> > > @@ -19,4 +19,4 @@ PACKAGECONFIG[bluez] = "-feature-bluez,-no-feature-bluez,${BLUEZ}"
> > >
> > >  EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
> > >
> > > -SRCREV = "43f063427a3ffc62bd85237801b28c9f9826d562"
> > > +SRCREV = "c7f826f0c07c05948c3882242ce4d2ea0ced8a6f"
> > > diff --git a/recipes-qt/qt5/qtdatavis3d_git.bb b/recipes-qt/qt5/qtdatavis3d_git.bb
> > > index b170b96..e58a50c 100644
> > > --- a/recipes-qt/qt5/qtdatavis3d_git.bb
> > > +++ b/recipes-qt/qt5/qtdatavis3d_git.bb
> > > @@ -8,4 +8,4 @@ LIC_FILES_CHKSUM = " \
> > >
> > >  DEPENDS += "qtbase qtdeclarative qtmultimedia qtxmlpatterns"
> > >
> > > -SRCREV = "6c253768e2fb6c0892215f3d93f36be7cece637e"
> > > +SRCREV = "3b44cb4c0ae44deb6d5d941038fd9a2348aa8d01"
> > > diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
> > > index 510fd45..69e9057 100644
> > > --- a/recipes-qt/qt5/qtdeclarative_git.bb
> > > +++ b/recipes-qt/qt5/qtdeclarative_git.bb
> > > @@ -32,6 +32,6 @@ do_install_append_class-nativesdk() {
> > >
> > >  EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
> > >
> > > -SRCREV = "1e82f11629e5572783e5bfc36f24ad10c235ca53"
> > > +SRCREV = "68e282f510d5f5ee490ffdb0500f90e0932b8cef"
> > >
> > >  BBCLASSEXTEND =+ "native nativesdk"
> > > diff --git a/recipes-qt/qt5/qtgamepad_git.bb b/recipes-qt/qt5/qtgamepad_git.bb
> > > index 3981bd1..d8d2250 100644
> > > --- a/recipes-qt/qt5/qtgamepad_git.bb
> > > +++ b/recipes-qt/qt5/qtgamepad_git.bb
> > > @@ -14,4 +14,4 @@ PACKAGECONFIG[sdl2] = "-feature-sdl2,-no-feature-sdl2,libsdl2"
> > >
> > >  EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
> > >
> > > -SRCREV = "e175347926b2aa8be045aed485e09b99ae72f51c"
> > > +SRCREV = "4d393b920d984ec763c89e3fce7aab6d1af344fd"
> > > diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
> > > index 12f60b4..2a34a24 100644
> > > --- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
> > > +++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
> > > @@ -18,4 +18,4 @@ RDEPENDS_${PN}-dev = ""
> > >  # http://errors.yoctoproject.org/Errors/Build/44912/
> > >  LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
> > >
> > > -SRCREV = "80b9da7ac42468453b7d130bd0a322a1312ad0e3"
> > > +SRCREV = "e954783bd9cdf490a7ffb2a9dc02f1031890d4ea"
> > > diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
> > > index 5afa44d..2d9c078 100644
> > > --- a/recipes-qt/qt5/qtimageformats_git.bb
> > > +++ b/recipes-qt/qt5/qtimageformats_git.bb
> > > @@ -26,4 +26,4 @@ PACKAGECONFIG[libwebp] = ",CONFIG+=done_config_libwebp,libwebp"
> > >
> > >  EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
> > >
> > > -SRCREV = "92e49329edfb98c8b3f9cdcbaf116f0c601c7739"
> > > +SRCREV = "e945d172fef9ae8d3ce2d925c53316a3433ce034"
> > > diff --git a/recipes-qt/qt5/qtknx_git.bb b/recipes-qt/qt5/qtknx_git.bb
> > > index bbcabc1..7021829 100644
> > > --- a/recipes-qt/qt5/qtknx_git.bb
> > > +++ b/recipes-qt/qt5/qtknx_git.bb
> > > @@ -9,4 +9,4 @@ LIC_FILES_CHKSUM = " \
> > >
> > >  DEPENDS += "qtbase"
> > >
> > > -SRCREV = "4640a41071ff153c01ef2c518675dded257f6de5"
> > > +SRCREV = "e2faddd5d6b6ef468fed7ce129d849130c957da4"
> > > diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
> > > index 1a79093..ff7cc57 100644
> > > --- a/recipes-qt/qt5/qtlocation_git.bb
> > > +++ b/recipes-qt/qt5/qtlocation_git.bb
> > > @@ -25,13 +25,13 @@ EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
> > >  # http://errors.yoctoproject.org/Errors/Details/152640/
> > >  LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
> > >
> > > -QT_MODULE_BRANCH_MAPBOXGL = "upstream/qt-staging-5.11.0"
> > > +QT_MODULE_BRANCH_MAPBOXGL = "upstream/qt-staging"
> > >
> > >  SRC_URI += " \
> > >      ${QT_GIT}/qtlocation-mapboxgl.git;name=qtlocation-mapboxgl;branch=${QT_MODULE_BRANCH_MAPBOXGL};protocol=${QT_GIT_PROTOCOL};destsuffix=git/src/3rdparty/mapbox-gl-native \
> > >  "
> > >
> > > -SRCREV_qtlocation = "139414573ab27bd1df1b491aeb6003a6fc0d3d5d"
> > > -SRCREV_qtlocation-mapboxgl = "74df5203628b47931b4edcb5e8fe352f40fe7df4"
> > > +SRCREV_qtlocation = "f8a0ae9109c2ee56a0480cbe62f07239afb31392"
> > > +SRCREV_qtlocation-mapboxgl = "b59b0450c60b3df9e0852f62f6c8a6024889cd9e"
> > >
> > >  SRCREV_FORMAT = "qtlocation_qtlocation-mapboxgl"
> > > diff --git a/recipes-qt/qt5/qtmqtt_git.bb b/recipes-qt/qt5/qtmqtt_git.bb
> > > index ca7886c..8aa26be 100644
> > > --- a/recipes-qt/qt5/qtmqtt_git.bb
> > > +++ b/recipes-qt/qt5/qtmqtt_git.bb
> > > @@ -9,4 +9,4 @@ LIC_FILES_CHKSUM = " \
> > >
> > >  DEPENDS += "qtbase"
> > >
> > > -SRCREV = "21aefc65d56d97284bf8122fb1b91726c1ae9768"
> > > +SRCREV = "b8a9a5aff7e924826c85029a9f919b5247752d5c"
> > > diff --git a/recipes-qt/qt5/qtmultimedia/0001-qtmultimedia-fix-a-conflicting-declaration.patch b/recipes-qt/qt5/qtmultimedia/0001-qtmultimedia-fix-a-conflicting-declaration.patch
> > > index 6f7351d..9e1a7f7 100644
> > > --- a/recipes-qt/qt5/qtmultimedia/0001-qtmultimedia-fix-a-conflicting-declaration.patch
> > > +++ b/recipes-qt/qt5/qtmultimedia/0001-qtmultimedia-fix-a-conflicting-declaration.patch
> > > @@ -1,4 +1,4 @@
> > > -From 18faeda3b2c111ad0ceb31142ce2ab1e6075063e Mon Sep 17 00:00:00 2001
> > > +From 5c42b403e8ddb3c6a49baa7c370c7fdd6014fa7c Mon Sep 17 00:00:00 2001
> > >  From: Wenlin Kang <wenlin.kang@windriver.com>
> > >  Date: Thu, 8 Sep 2016 12:18:13 +0800
> > >  Subject: [PATCH] qtmultimedia: fix a conflicting declaration
> > > diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
> > > index deb193f..69ca00e 100644
> > > --- a/recipes-qt/qt5/qtmultimedia_git.bb
> > > +++ b/recipes-qt/qt5/qtmultimedia_git.bb
> > > @@ -28,7 +28,7 @@ EXTRA_QMAKEVARS_CONFIGURE += "${@bb.utils.contains_any('PACKAGECONFIG', 'gstream
> > >  CXXFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DMESA_EGL_NO_X11_HEADERS=1', d)}"
> > >
> > >  # Patches from https://github.com/meta-qt5/qtmultimedia/commits/b5.11
> > > -# 5.11.meta-qt5.3
> > > +# 5.11.meta-qt5.4
> > >  SRC_URI += "\
> > >      file://0001-qtmultimedia-fix-a-conflicting-declaration.patch \
> > >  "
> > > @@ -37,4 +37,4 @@ SRC_URI += "\
> > >  # http://errors.yoctoproject.org/Errors/Build/44914/
> > >  LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
> > >
> > > -SRCREV = "b39c391853245f8293d19431541eab20d78b8678"
> > > +SRCREV = "dfefe794b9d87fd04c9a529e1ca0aa1d18d44ddd"
> > > diff --git a/recipes-qt/qt5/qtnetworkauth_git.bb b/recipes-qt/qt5/qtnetworkauth_git.bb
> > > index 96c78ea..1704ff5 100644
> > > --- a/recipes-qt/qt5/qtnetworkauth_git.bb
> > > +++ b/recipes-qt/qt5/qtnetworkauth_git.bb
> > > @@ -9,4 +9,4 @@ require qt5-git.inc
> > >
> > >  DEPENDS += "qtbase"
> > >
> > > -SRCREV = "0d845e00a000f376101165ec9a5c9096030db25c"
> > > +SRCREV = "c4b57f78900fdb21a8dd99cf8045f5c678eb656c"
> > > diff --git a/recipes-qt/qt5/qtopcua_git.bb b/recipes-qt/qt5/qtopcua_git.bb
> > > index 7abe028..2a788be 100644
> > > --- a/recipes-qt/qt5/qtopcua_git.bb
> > > +++ b/recipes-qt/qt5/qtopcua_git.bb
> > > @@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
> > >
> > >  DEPENDS += "qtbase"
> > >
> > > -SRCREV = "78d016e79ed8bc3d2d3f1c2dac90a4c75392d35b"
> > > +SRCREV = "f08a50d9d7b8ddec27fdd9f070fb7e54108570e4"
> > > diff --git a/recipes-qt/qt5/qtpurchasing_git.bb b/recipes-qt/qt5/qtpurchasing_git.bb
> > > index cb6b9eb..1e2b220 100644
> > > --- a/recipes-qt/qt5/qtpurchasing_git.bb
> > > +++ b/recipes-qt/qt5/qtpurchasing_git.bb
> > > @@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
> > >
> > >  DEPENDS += "qtbase qtdeclarative"
> > >
> > > -SRCREV = "607617cacc1c6ced9fa3bbfb0cd24e115b623daa"
> > > +SRCREV = "1e9e0c388920af7e56fa9fb0fef81e23e9807062"
> > > diff --git a/recipes-qt/qt5/qtquickcontrols2_git.bb b/recipes-qt/qt5/qtquickcontrols2_git.bb
> > > index ee5e926..31e1862 100644
> > > --- a/recipes-qt/qt5/qtquickcontrols2_git.bb
> > > +++ b/recipes-qt/qt5/qtquickcontrols2_git.bb
> > > @@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
> > >
> > >  DEPENDS += "qtdeclarative qtdeclarative-native"
> > >
> > > -SRCREV = "60f3106b3fe537f1f26230bf0b59525cf98d6789"
> > > +SRCREV = "5d482466d1cfa3292e01edacc429addbbd9fec29"
> > > diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
> > > index f23e96d..5d02ecd 100644
> > > --- a/recipes-qt/qt5/qtquickcontrols_git.bb
> > > +++ b/recipes-qt/qt5/qtquickcontrols_git.bb
> > > @@ -17,4 +17,4 @@ FILES_${PN}-qmlplugins += " \
> > >    ${OE_QMAKE_PATH_QML}/QtQuick/Dialogs/qml/icons.ttf \
> > >  "
> > >
> > > -SRCREV = "88ff352d5145b5761179ee42164a0bfcd4f1d54a"
> > > +SRCREV = "191a2fe59cbaf7603d502fa764b4737f49422010"
> > > diff --git a/recipes-qt/qt5/qtremoteobjects/0001-Allow-a-tools-only-build.patch b/recipes-qt/qt5/qtremoteobjects/0001-Allow-a-tools-only-build.patch
> > > index 5a5f9fc..f52743e 100644
> > > --- a/recipes-qt/qt5/qtremoteobjects/0001-Allow-a-tools-only-build.patch
> > > +++ b/recipes-qt/qt5/qtremoteobjects/0001-Allow-a-tools-only-build.patch
> > > @@ -1,4 +1,4 @@
> > > -From fd662625b4954ee21897c40fe586eaa39fe0f44b Mon Sep 17 00:00:00 2001
> > > +From e1b89c21f212bf60ad7a91359991fc6a6551edbe Mon Sep 17 00:00:00 2001
> > >  From: Samuli Piippo <samuli.piippo@qt.io>
> > >  Date: Wed, 7 Jun 2017 15:17:12 +0300
> > >  Subject: [PATCH] Allow a tools-only build
> > > diff --git a/recipes-qt/qt5/qtremoteobjects_git.bb b/recipes-qt/qt5/qtremoteobjects_git.bb
> > > index 2ac9fa4..b998922 100644
> > > --- a/recipes-qt/qt5/qtremoteobjects_git.bb
> > > +++ b/recipes-qt/qt5/qtremoteobjects_git.bb
> > > @@ -12,7 +12,7 @@ require qt5-git.inc
> > >  DEPENDS += "qtbase qtdeclarative qtremoteobjects-native"
> > >
> > >  # Patches from https://github.com/meta-qt5/qtremoteobjects/commits/b5.11
> > > -# 5.11.meta-qt5.3
> > > +# 5.11.meta-qt5.4
> > >  SRC_URI += " \
> > >      file://0001-Allow-a-tools-only-build.patch \
> > >  "
> > > @@ -24,6 +24,6 @@ PACKAGECONFIG[tools-only] = "CONFIG+=tools-only"
> > >
> > >  EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
> > >
> > > -SRCREV = "24fade01e0e38acbf5ffdb9ffab712e8b7e86e30"
> > > +SRCREV = "cc454911ac5aec527379c2e51259583071d21ca9"
> > >
> > >  BBCLASSEXTEND += "native nativesdk"
> > > diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
> > > index fe4612d..913d8c6 100644
> > > --- a/recipes-qt/qt5/qtscript_git.bb
> > > +++ b/recipes-qt/qt5/qtscript_git.bb
> > > @@ -30,4 +30,4 @@ DEPENDS += "qtbase"
> > >  # http://errors.yoctoproject.org/Errors/Build/44915/
> > >  LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
> > >
> > > -SRCREV = "693f0320e92cb1ab93f6261c72702432abdcb11d"
> > > +SRCREV = "18c09cd0a3dd8143256fbe22b8e62aea346d17f1"
> > > diff --git a/recipes-qt/qt5/qtscxml/0001-Use-external-host-bin-path-for-cmake-file.patch b/recipes-qt/qt5/qtscxml/0001-Use-external-host-bin-path-for-cmake-file.patch
> > > index 1857614..16566b3 100644
> > > --- a/recipes-qt/qt5/qtscxml/0001-Use-external-host-bin-path-for-cmake-file.patch
> > > +++ b/recipes-qt/qt5/qtscxml/0001-Use-external-host-bin-path-for-cmake-file.patch
> > > @@ -1,4 +1,4 @@
> > > -From 576c6859c460d10d1345e6ebbdcdb80accd191be Mon Sep 17 00:00:00 2001
> > > +From eba275e193aacf43a2fb30cca545f0c13d968c65 Mon Sep 17 00:00:00 2001
> > >  From: Samuli Piippo <samuli.piippo@qt.io>
> > >  Date: Tue, 10 Jan 2017 15:28:26 +0200
> > >  Subject: [PATCH] Use external host bin path for cmake file
> > > diff --git a/recipes-qt/qt5/qtscxml_git.bb b/recipes-qt/qt5/qtscxml_git.bb
> > > index 655f060..503f9db 100644
> > > --- a/recipes-qt/qt5/qtscxml_git.bb
> > > +++ b/recipes-qt/qt5/qtscxml_git.bb
> > > @@ -10,10 +10,10 @@ require qt5-git.inc
> > >
> > >  DEPENDS += "qtbase qtdeclarative qtxmlpatterns qtscxml-native"
> > >
> > > -SRCREV = "71a101b5cbdbe9e32053ce61a5b6417a6990d780"
> > > +SRCREV = "de31ea0edc5ed6511bf635aa75f5d5c6f9aedc94"
> > >
> > >  # Patches from https://github.com/meta-qt5/qtscxml/commits/b5.11
> > > -# 5.11.meta-qt5.3
> > > +# 5.11.meta-qt5.4
> > >  SRC_URI += "file://0001-Use-external-host-bin-path-for-cmake-file.patch"
> > >
> > >  do_install_append_class-nativesdk() {
> > > diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
> > > index a9885f7..c8543ea 100644
> > > --- a/recipes-qt/qt5/qtsensors_git.bb
> > > +++ b/recipes-qt/qt5/qtsensors_git.bb
> > > @@ -12,4 +12,4 @@ LIC_FILES_CHKSUM = " \
> > >
> > >  DEPENDS += "qtbase qtdeclarative"
> > >
> > > -SRCREV = "b4e80891f3d51b3d6a7ead74c8650b84e0f070ea"
> > > +SRCREV = "b99d3da32b62e2a4c4d907928a5a73bc441db345"
> > > diff --git a/recipes-qt/qt5/qtserialbus_git.bb b/recipes-qt/qt5/qtserialbus_git.bb
> > > index effe91b..118de78 100644
> > > --- a/recipes-qt/qt5/qtserialbus_git.bb
> > > +++ b/recipes-qt/qt5/qtserialbus_git.bb
> > > @@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
> > >
> > >  DEPENDS += "qtbase qtserialport"
> > >
> > > -SRCREV = "c66a364cf34b4945208f07362deabe0020e5b596"
> > > +SRCREV = "a59be66ab8b74f074f171b8fe4b75368483a8d4e"
> > > diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
> > > index 79d9394..0ce23ca 100644
> > > --- a/recipes-qt/qt5/qtserialport_git.bb
> > > +++ b/recipes-qt/qt5/qtserialport_git.bb
> > > @@ -14,4 +14,4 @@ LIC_FILES_CHKSUM = " \
> > >
> > >  DEPENDS += "qtbase"
> > >
> > > -SRCREV = "a9ada995489b899cb938602308ffa1a8814acd2a"
> > > +SRCREV = "1926ea36a923088e8765fb37f0c3a76fcfbc4994"
> > > diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
> > > index dae0e7d..63ed6e1 100644
> > > --- a/recipes-qt/qt5/qtsvg_git.bb
> > > +++ b/recipes-qt/qt5/qtsvg_git.bb
> > > @@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
> > >
> > >  DEPENDS += "qtbase"
> > >
> > > -SRCREV = "b1ca1bb725fd8768782d8105b782932f95b70908"
> > > +SRCREV = "44ebf2803840555a60969fcca5f8f39eb3348939"
> > > diff --git a/recipes-qt/qt5/qttools/0001-add-noqtwebkit-configuration.patch b/recipes-qt/qt5/qttools/0001-add-noqtwebkit-configuration.patch
> > > index 2aa9083..3d37608 100644
> > > --- a/recipes-qt/qt5/qttools/0001-add-noqtwebkit-configuration.patch
> > > +++ b/recipes-qt/qt5/qttools/0001-add-noqtwebkit-configuration.patch
> > > @@ -1,4 +1,4 @@
> > > -From f54b0d7ee9af320971371c169b8d5c8d1432be71 Mon Sep 17 00:00:00 2001
> > > +From ca531038c01d28f98cd80ac063bb82dc9fe9ed86 Mon Sep 17 00:00:00 2001
> > >  From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
> > >  Date: Wed, 4 Jun 2014 11:28:16 +0200
> > >  Subject: [PATCH] add noqtwebkit configuration
> > > diff --git a/recipes-qt/qt5/qttools/0002-linguist-tools-cmake-allow-overriding-the-location-f.patch b/recipes-qt/qt5/qttools/0002-linguist-tools-cmake-allow-overriding-the-location-f.patch
> > > index 5e37500..4202440 100644
> > > --- a/recipes-qt/qt5/qttools/0002-linguist-tools-cmake-allow-overriding-the-location-f.patch
> > > +++ b/recipes-qt/qt5/qttools/0002-linguist-tools-cmake-allow-overriding-the-location-f.patch
> > > @@ -1,4 +1,4 @@
> > > -From a327c35e62bb1763652e7bcff71be088ba1d11fb Mon Sep 17 00:00:00 2001
> > > +From d754f1e1d4579d8005283dfdc3c9eb7995e61739 Mon Sep 17 00:00:00 2001
> > >  From: Cody P Schafer <dev@codyps.com>
> > >  Date: Thu, 9 Jul 2015 11:28:19 -0400
> > >  Subject: [PATCH] linguist-tools cmake: allow overriding the location for
> > > diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
> > > index ee68053..678624d 100644
> > > --- a/recipes-qt/qt5/qttools_git.bb
> > > +++ b/recipes-qt/qt5/qttools_git.bb
> > > @@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = " \
> > >  DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
> > >
> > >  # Patches from https://github.com/meta-qt5/qttools/commits/b5.11
> > > -# 5.11.meta-qt5.3
> > > +# 5.11.meta-qt5.4
> > >  SRC_URI += " \
> > >      file://0001-add-noqtwebkit-configuration.patch \
> > >      file://0002-linguist-tools-cmake-allow-overriding-the-location-f.patch \
> > > @@ -29,7 +29,7 @@ PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
> > >
> > >  EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
> > >
> > > -SRCREV = "a42d3f2ac4b910ecc910ff144191cb729a745c9a"
> > > +SRCREV = "a01f3629377f25506d523406d2b93ffbff711a51"
> > >
> > >  BBCLASSEXTEND = "native nativesdk"
> > >
> > > diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
> > > index f87351c..d402bf1 100644
> > > --- a/recipes-qt/qt5/qttranslations_git.bb
> > > +++ b/recipes-qt/qt5/qttranslations_git.bb
> > > @@ -108,4 +108,4 @@ FILES_${PN}-qt = " \
> > >      ${OE_QMAKE_PATH_TRANSLATIONS}/qt_*.qm \
> > >  "
> > >
> > > -SRCREV = "0bf644a075634ca49ee28c0f42566f1012506f31"
> > > +SRCREV = "3e0de1e1cd4fd194d1069b61f57a55b8d23ab60d"
> > > diff --git a/recipes-qt/qt5/qtvirtualkeyboard_git.bb b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
> > > index 4154b2a..d3e2c35 100644
> > > --- a/recipes-qt/qt5/qtvirtualkeyboard_git.bb
> > > +++ b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
> > > @@ -49,4 +49,4 @@ FILES_${PN} += "${OE_QMAKE_PATH_DATA}/qtvirtualkeyboard/lipi_toolkit"
> > >
> > >  DEPENDS += "qtbase qtdeclarative qtmultimedia qtquickcontrols qtsvg qtxmlpatterns qtdeclarative-native"
> > >
> > > -SRCREV = "b92f0da2f8725ab529ec81c4e1b4b538e66258d2"
> > > +SRCREV = "62dad13b1fb2fcf04c61700d3c477b998db2f63e"
> > > diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
> > > index d6cb114..1643fc2 100644
> > > --- a/recipes-qt/qt5/qtwayland_git.bb
> > > +++ b/recipes-qt/qt5/qtwayland_git.bb
> > > @@ -37,7 +37,7 @@ PACKAGECONFIG[libhybris-egl-server] = "-feature-libhybris-egl-server,-no-feature
> > >
> > >  EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
> > >
> > > -SRCREV = "87621266ec66df5fc98cce165e5c80b7721983aa"
> > > +SRCREV = "3ffa7d5d6ecb75c244c6b22565df5184c638643a"
> > >
> > >  BBCLASSEXTEND =+ "native nativesdk"
> > >
> > > diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/qtwebchannel_git.bb
> > > index efad58c..3fc1465 100644
> > > --- a/recipes-qt/qt5/qtwebchannel_git.bb
> > > +++ b/recipes-qt/qt5/qtwebchannel_git.bb
> > > @@ -12,4 +12,4 @@ LIC_FILES_CHKSUM = " \
> > >
> > >  DEPENDS += "qtdeclarative qtwebsockets"
> > >
> > > -SRCREV = "9800f7d13e770e6409113e83f663ac4a419908a0"
> > > +SRCREV = "2ff27bf60e3bda8335adc557abd6486c144cb948"
> > > diff --git a/recipes-qt/qt5/qtwebengine/0001-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch b/recipes-qt/qt5/qtwebengine/0001-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
> > > index 1047b49..b0b9a7d 100644
> > > --- a/recipes-qt/qt5/qtwebengine/0001-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
> > > +++ b/recipes-qt/qt5/qtwebengine/0001-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
> > > @@ -1,4 +1,4 @@
> > > -From 5df2dabfec0ea3d0cd7f666d25a8fcb4f415ca83 Mon Sep 17 00:00:00 2001
> > > +From 8638cd129e040e8958570c95a3d4e91d9366f5a8 Mon Sep 17 00:00:00 2001
> > >  From: Cleiton Bueno <cleitonrbueno@gmail.com>
> > >  Date: Fri, 25 Dec 2015 18:16:05 -0200
> > >  Subject: [PATCH] WebEngine qquickwebengineview_p_p.h add include QColor
> > > @@ -9,7 +9,7 @@ Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
> > >   1 file changed, 2 insertions(+)
> > >
> > >  diff --git a/src/webengine/api/qquickwebengineview_p_p.h b/src/webengine/api/qquickwebengineview_p_p.h
> > > -index 73607aa5..151d261d 100644
> > > +index 1723da7e..4d9e5981 100644
> > >  --- a/src/webengine/api/qquickwebengineview_p_p.h
> > >  +++ b/src/webengine/api/qquickwebengineview_p_p.h
> > >  @@ -61,6 +61,8 @@
> > > diff --git a/recipes-qt/qt5/qtwebengine/0002-Include-dependency-to-QCoreApplication-translate.patch b/recipes-qt/qt5/qtwebengine/0002-Include-dependency-to-QCoreApplication-translate.patch
> > > index 1670ef6..2184408 100644
> > > --- a/recipes-qt/qt5/qtwebengine/0002-Include-dependency-to-QCoreApplication-translate.patch
> > > +++ b/recipes-qt/qt5/qtwebengine/0002-Include-dependency-to-QCoreApplication-translate.patch
> > > @@ -1,4 +1,4 @@
> > > -From 5cbb27925e55a3bf14f36938e32366905aca6b9f Mon Sep 17 00:00:00 2001
> > > +From 0101ed343c6f6eb652c5992ed2279ddd5c6d5969 Mon Sep 17 00:00:00 2001
> > >  From: Cleiton Bueno <cleitonrbueno@gmail.com>
> > >  Date: Thu, 24 Dec 2015 15:59:51 -0200
> > >  Subject: [PATCH] Include dependency to QCoreApplication::translate()
> > > diff --git a/recipes-qt/qt5/qtwebengine/0003-Force-host-toolchain-configuration.patch b/recipes-qt/qt5/qtwebengine/0003-Force-host-toolchain-configuration.patch
> > > index c87537c..eaed7a6 100644
> > > --- a/recipes-qt/qt5/qtwebengine/0003-Force-host-toolchain-configuration.patch
> > > +++ b/recipes-qt/qt5/qtwebengine/0003-Force-host-toolchain-configuration.patch
> > > @@ -1,4 +1,4 @@
> > > -From 18a18b46eea62c7c58f78a7ee2c3c936d0d34c85 Mon Sep 17 00:00:00 2001
> > > +From a7eff4032f84490b33df27771d43e098ceea439e Mon Sep 17 00:00:00 2001
> > >  From: Samuli Piippo <samuli.piippo@qt.io>
> > >  Date: Wed, 15 Mar 2017 13:53:28 +0200
> > >  Subject: [PATCH] Force host toolchain configuration
> > > @@ -57,7 +57,7 @@ index dd0d3e32..70161c82 100644
> > >   "  nm = \"$$which(nm)\" " \
> > >   "  toolchain_args = { " \
> > >  diff --git a/src/core/config/linux.pri b/src/core/config/linux.pri
> > > -index 68d64fd4..9ab43df1 100644
> > > +index b56134ad..69f463e9 100644
> > >  --- a/src/core/config/linux.pri
> > >  +++ b/src/core/config/linux.pri
> > >  @@ -91,7 +91,7 @@ contains(QT_ARCH, "mips") {
> > > diff --git a/recipes-qt/qt5/qtwebengine/0004-chromium_overrides.cpp-Fix-build-with-plugins-and-oz.patch b/recipes-qt/qt5/qtwebengine/0004-chromium_overrides.cpp-Fix-build-with-plugins-and-oz.patch
> > > index 4c82e2f..0b79599 100644
> > > --- a/recipes-qt/qt5/qtwebengine/0004-chromium_overrides.cpp-Fix-build-with-plugins-and-oz.patch
> > > +++ b/recipes-qt/qt5/qtwebengine/0004-chromium_overrides.cpp-Fix-build-with-plugins-and-oz.patch
> > > @@ -1,4 +1,4 @@
> > > -From df55b0480c348e4b7b1875ec012dbb740a71f6dc Mon Sep 17 00:00:00 2001
> > > +From 9e8b0fda6b2338feed486d238a61c2a51e4fd2b3 Mon Sep 17 00:00:00 2001
> > >  From: Martin Jansa <Martin.Jansa@gmail.com>
> > >  Date: Sun, 10 Jun 2018 10:26:17 +0000
> > >  Subject: [PATCH] chromium_overrides.cpp: Fix build with plugins and ozone
> > > diff --git a/recipes-qt/qt5/qtwebengine/0005-musl-don-t-use-pvalloc-as-it-s-not-available-on-musl.patch b/recipes-qt/qt5/qtwebengine/0005-musl-don-t-use-pvalloc-as-it-s-not-available-on-musl.patch
> > > index fc86bc7..f36f090 100644
> > > --- a/recipes-qt/qt5/qtwebengine/0005-musl-don-t-use-pvalloc-as-it-s-not-available-on-musl.patch
> > > +++ b/recipes-qt/qt5/qtwebengine/0005-musl-don-t-use-pvalloc-as-it-s-not-available-on-musl.patch
> > > @@ -1,4 +1,4 @@
> > > -From 2b031d6f50467470175b2070e5aefb5fdbebb729 Mon Sep 17 00:00:00 2001
> > > +From 6dec716e02e46bc75230b01aafb115f35fd3a895 Mon Sep 17 00:00:00 2001
> > >  From: Samuli Piippo <samuli.piippo@qt.io>
> > >  Date: Tue, 12 Dec 2017 16:06:14 +0200
> > >  Subject: [PATCH] musl: don't use pvalloc as it's not available on musl
> > > diff --git a/recipes-qt/qt5/qtwebengine/0006-musl-link-against-libexecinfo.patch b/recipes-qt/qt5/qtwebengine/0006-musl-link-against-libexecinfo.patch
> > > index f52859f..8dd07d6 100644
> > > --- a/recipes-qt/qt5/qtwebengine/0006-musl-link-against-libexecinfo.patch
> > > +++ b/recipes-qt/qt5/qtwebengine/0006-musl-link-against-libexecinfo.patch
> > > @@ -1,4 +1,4 @@
> > > -From 447dea44ae95e7011ab3921b2b88a4295d406e87 Mon Sep 17 00:00:00 2001
> > > +From 418ff96920a520a4c9d082f56864ee8654f584f7 Mon Sep 17 00:00:00 2001
> > >  From: Samuli Piippo <samuli.piippo@qt.io>
> > >  Date: Thu, 14 Dec 2017 11:28:10 +0200
> > >  Subject: [PATCH] musl: link against libexecinfo
> > > diff --git a/recipes-qt/qt5/qtwebengine/chromium/0001-chromium-Force-host-toolchain-configuration.patch b/recipes-qt/qt5/qtwebengine/chromium/0001-chromium-Force-host-toolchain-configuration.patch
> > > index 6de64b0..32efcf9 100644
> > > --- a/recipes-qt/qt5/qtwebengine/chromium/0001-chromium-Force-host-toolchain-configuration.patch
> > > +++ b/recipes-qt/qt5/qtwebengine/chromium/0001-chromium-Force-host-toolchain-configuration.patch
> > > @@ -1,4 +1,4 @@
> > > -From e3b98ab1d2e08c0072bd83dd7f487f404cc3a44a Mon Sep 17 00:00:00 2001
> > > +From 761754d5edf129d526e87ed5ace71d24f30e9618 Mon Sep 17 00:00:00 2001
> > >  From: Samuli Piippo <samuli.piippo@qt.io>
> > >  Date: Wed, 15 Mar 2017 13:53:28 +0200
> > >  Subject: [PATCH] chromium: Force host toolchain configuration
> > > diff --git a/recipes-qt/qt5/qtwebengine/chromium/0002-chromium-workaround-for-too-long-.rps-file-name.patch b/recipes-qt/qt5/qtwebengine/chromium/0002-chromium-workaround-for-too-long-.rps-file-name.patch
> > > index 42eb193..b5c6c5d 100644
> > > --- a/recipes-qt/qt5/qtwebengine/chromium/0002-chromium-workaround-for-too-long-.rps-file-name.patch
> > > +++ b/recipes-qt/qt5/qtwebengine/chromium/0002-chromium-workaround-for-too-long-.rps-file-name.patch
> > > @@ -1,4 +1,4 @@
> > > -From d39590cf1ee3adcf6d93cc40263c377e2a5cf0e2 Mon Sep 17 00:00:00 2001
> > > +From 108bc7caf7544b47a392aac690f0d616f1c6c42e Mon Sep 17 00:00:00 2001
> > >  From: Samuli Piippo <samuli.piippo@qt.io>
> > >  Date: Thu, 30 Mar 2017 11:37:24 +0300
> > >  Subject: [PATCH] chromium: workaround for too long .rps file name
> > > diff --git a/recipes-qt/qt5/qtwebengine/chromium/0003-chromium-Fix-build-with-gcc8.patch b/recipes-qt/qt5/qtwebengine/chromium/0003-chromium-Fix-build-with-gcc8.patch
> > > index f79b0e8..f274733 100644
> > > --- a/recipes-qt/qt5/qtwebengine/chromium/0003-chromium-Fix-build-with-gcc8.patch
> > > +++ b/recipes-qt/qt5/qtwebengine/chromium/0003-chromium-Fix-build-with-gcc8.patch
> > > @@ -1,4 +1,4 @@
> > > -From c0047b885faafaab35d6dde4578c3c1a00b80cee Mon Sep 17 00:00:00 2001
> > > +From d16d04ea5c47974f038c4434011e69dbfc23c797 Mon Sep 17 00:00:00 2001
> > >  From: Martin Jansa <Martin.Jansa@gmail.com>
> > >  Date: Tue, 5 Jun 2018 13:58:16 +0000
> > >  Subject: [PATCH] chromium: Fix build with gcc8
> > > diff --git a/recipes-qt/qt5/qtwebengine/chromium/0004-chromium-Fix-build-with-GCC-8.1.0.patch b/recipes-qt/qt5/qtwebengine/chromium/0004-chromium-Fix-build-with-GCC-8.1.0.patch
> > > deleted file mode 100644
> > > index 297700b..0000000
> > > --- a/recipes-qt/qt5/qtwebengine/chromium/0004-chromium-Fix-build-with-GCC-8.1.0.patch
> > > +++ /dev/null
> > > @@ -1,83 +0,0 @@
> > > -From e8df2acf2ce52972b2ed2596f2ca6dac8656eded Mon Sep 17 00:00:00 2001
> > > -From: =?UTF-8?q?J=C3=BCri=20Valdmann?= <juri.valdmann@qt.io>
> > > -Date: Mon, 14 May 2018 10:15:50 +0200
> > > -Subject: [PATCH] chromium: Fix build with GCC 8.1.0
> > > -
> > > -Task-number: QTBUG-68203
> > > -Change-Id: I780d884d5e20ef04e902d7b449da4aa3f97d8d0b
> > > -Reviewed-by: Allan Sandfeld Jensen <allan.jensen@qt.io>
> > > -
> > > -Upstream-Status: Backport (from newer 65-based revision)
> > > ----
> > > - .../mojo/public/cpp/bindings/associated_interface_ptr_info.h    | 2 +-
> > > - .../mojo/public/cpp/bindings/associated_interface_request.h     | 2 +-
> > > - chromium/mojo/public/cpp/bindings/interface_request.h           | 2 +-
> > > - .../mojo/public/cpp/bindings/scoped_interface_endpoint_handle.h | 2 ++
> > > - chromium/mojo/public/cpp/system/handle.h                        | 2 +-
> > > - 5 files changed, 6 insertions(+), 4 deletions(-)
> > > -
> > > -diff --git a/chromium/mojo/public/cpp/bindings/associated_interface_ptr_info.h b/chromium/mojo/public/cpp/bindings/associated_interface_ptr_info.h
> > > -index 1f79662bd7..184ba6a9e8 100644
> > > ---- a/chromium/mojo/public/cpp/bindings/associated_interface_ptr_info.h
> > > -+++ b/chromium/mojo/public/cpp/bindings/associated_interface_ptr_info.h
> > > -@@ -45,7 +45,7 @@ class AssociatedInterfacePtrInfo {
> > > -
> > > -   bool is_valid() const { return handle_.is_valid(); }
> > > -
> > > --  explicit operator bool() const { return handle_; }
> > > -+  explicit operator bool() const { return !!handle_; }
> > > -
> > > -   ScopedInterfaceEndpointHandle PassHandle() {
> > > -     return std::move(handle_);
> > > -diff --git a/chromium/mojo/public/cpp/bindings/associated_interface_request.h b/chromium/mojo/public/cpp/bindings/associated_interface_request.h
> > > -index 12d2f3ce1d..fcdc2b9321 100644
> > > ---- a/chromium/mojo/public/cpp/bindings/associated_interface_request.h
> > > -+++ b/chromium/mojo/public/cpp/bindings/associated_interface_request.h
> > > -@@ -50,7 +50,7 @@ class AssociatedInterfaceRequest {
> > > -   // handle.
> > > -   bool is_pending() const { return handle_.is_valid(); }
> > > -
> > > --  explicit operator bool() const { return handle_; }
> > > -+  explicit operator bool() const { return !!handle_; }
> > > -
> > > -   ScopedInterfaceEndpointHandle PassHandle() { return std::move(handle_); }
> > > -
> > > -diff --git a/chromium/mojo/public/cpp/bindings/interface_request.h b/chromium/mojo/public/cpp/bindings/interface_request.h
> > > -index 1007cb0b8c..da1f3244a3 100644
> > > ---- a/chromium/mojo/public/cpp/bindings/interface_request.h
> > > -+++ b/chromium/mojo/public/cpp/bindings/interface_request.h
> > > -@@ -54,7 +54,7 @@ class InterfaceRequest {
> > > -   // Indicates whether the request currently contains a valid message pipe.
> > > -   bool is_pending() const { return handle_.is_valid(); }
> > > -
> > > --  explicit operator bool() const { return handle_; }
> > > -+  explicit operator bool() const { return !!handle_; }
> > > -
> > > -   // Removes the message pipe from the request and returns it.
> > > -   ScopedMessagePipeHandle PassMessagePipe() { return std::move(handle_); }
> > > -diff --git a/chromium/mojo/public/cpp/bindings/scoped_interface_endpoint_handle.h b/chromium/mojo/public/cpp/bindings/scoped_interface_endpoint_handle.h
> > > -index 5d00e5019e..ef8a927ba6 100644
> > > ---- a/chromium/mojo/public/cpp/bindings/scoped_interface_endpoint_handle.h
> > > -+++ b/chromium/mojo/public/cpp/bindings/scoped_interface_endpoint_handle.h
> > > -@@ -45,6 +45,8 @@ class MOJO_CPP_BINDINGS_EXPORT ScopedInterfaceEndpointHandle {
> > > -
> > > -   bool is_valid() const;
> > > -
> > > -+  explicit operator bool() const { return is_valid(); }
> > > -+
> > > -   // Returns true if the interface hasn't associated with a message pipe.
> > > -   bool pending_association() const;
> > > -
> > > -diff --git a/chromium/mojo/public/cpp/system/handle.h b/chromium/mojo/public/cpp/system/handle.h
> > > -index 7c886e8825..c9f9e961db 100644
> > > ---- a/chromium/mojo/public/cpp/system/handle.h
> > > -+++ b/chromium/mojo/public/cpp/system/handle.h
> > > -@@ -121,7 +121,7 @@ class ScopedHandleBase {
> > > -
> > > -   bool is_valid() const { return handle_.is_valid(); }
> > > -
> > > --  explicit operator bool() const { return handle_; }
> > > -+  explicit operator bool() const { return !!handle_; }
> > > -
> > > -   bool operator==(const ScopedHandleBase& other) const {
> > > -     return handle_.value() == other.get().value();
> > > diff --git a/recipes-qt/qt5/qtwebengine/chromium/0005-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch b/recipes-qt/qt5/qtwebengine/chromium/0004-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
> > > similarity index 93%
> > > rename from recipes-qt/qt5/qtwebengine/chromium/0005-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
> > > rename to recipes-qt/qt5/qtwebengine/chromium/0004-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
> > > index 15911d3..8aeba5f 100644
> > > --- a/recipes-qt/qt5/qtwebengine/chromium/0005-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
> > > +++ b/recipes-qt/qt5/qtwebengine/chromium/0004-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
> > > @@ -1,4 +1,4 @@
> > > -From c2c6c36c4a04816dd1c6815ed4df14b7f3a00d61 Mon Sep 17 00:00:00 2001
> > > +From 48bcb9e0efa3d67543cc755a2fc0f97b6514cbab Mon Sep 17 00:00:00 2001
> > >  From: Khem Raj <raj.khem@gmail.com>
> > >  Date: Fri, 7 Jul 2017 14:01:12 -0700
> > >  Subject: [PATCH] chromium: musl: sandbox: Define TEMP_FAILURE_RETRY if not
> > > diff --git a/recipes-qt/qt5/qtwebengine/chromium/0006-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch b/recipes-qt/qt5/qtwebengine/chromium/0005-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
> > > similarity index 97%
> > > rename from recipes-qt/qt5/qtwebengine/chromium/0006-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
> > > rename to recipes-qt/qt5/qtwebengine/chromium/0005-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linu

