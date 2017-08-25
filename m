Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2063F78476
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2017 17:28:42 +0000 (UTC)
Received: by mail-vk0-f48.google.com with SMTP id z187so1374362vkd.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2017 10:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4wH28YtByDrQ3hgOD3WmdfgHkVJld/fqNIBMBIdxeo8=;
	b=IaU4fnxDyKk8FWkH8MOb+opZzDmwnJawbyBMa9sSAPuEzpqh8aAfReg/vr5w8rSRl4
	EIIgtggjanhNURCERm1LmrVvaHrZKVdRwTzwEvtEJWSi2ZilVWXaUvIkHiFmrGu+FeB9
	Gwa1dZhdMRYThHdqv/Xu0zBU0bMQrgqfLyArVvTYyL0ae4LdjmoZK49exq72hjETcmgb
	Q7tC8lG6aRSURtobg9rPKBWlfPMx+OGHN8BA+TxzV37FGN5gHyNFET3auGjNXi41ZbIE
	Wd9WyZ4Vo69GExKs/bw9BqJIeHz7zc8zYvkx3ScZKbSHwcBRqH9t77R3VoYwn9UO5jeV
	uOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4wH28YtByDrQ3hgOD3WmdfgHkVJld/fqNIBMBIdxeo8=;
	b=rVC5uDp8jVg0LOuR8lBUlif4090WeLpBgPSxAUtxx9DeBlYCe+rAAh/4iFQvAA2U6/
	ySw19FaBX5VvohkZJbTuc8OpJ/9S2RAyHbIyZLJElcj5vXWDW6e/P2xoU9qJ8dGm/YMY
	FCEgaAvRrj6CUMuOCRQaV7VZ+TekdVUnhrquvXXQSV7X39Up1vJyH16tX5v+t+pjg1BH
	h6NOrvOYuSmvEBbFAtQNca9yd5owHG8PX9l8LnKR+RPqvWDzytKTSyzRVaZmqE9fL9V5
	rs+K8rVL84Nxc+JTvmiesC0eCHZhL/kaQeAKm55nyI5vx8kuehDIrK0nX+01b90zbivc
	fiPw==
X-Gm-Message-State: AHYfb5ioLZlzAWk/MxF2S0lEA/n8ksy+8kolkQMXJYiJPOsvK5I/dhY4
	mQtkhrNuQqLCxK3yvlZe1D/zZj+fHw==
X-Received: by 10.31.7.136 with SMTP id 130mr6281893vkh.23.1503682123180; Fri,
	25 Aug 2017 10:28:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.50.144 with HTTP; Fri, 25 Aug 2017 10:28:42 -0700 (PDT)
In-Reply-To: <CAMKF1sor29cpSkBMq4wm_OECGZvMLK5J1QWNu6Smqf9KqPBetA@mail.gmail.com>
References: <20170821210259.20276-1-Martin.Jansa@gmail.com>
	<20170821210259.20276-5-Martin.Jansa@gmail.com>
	<CAMKF1sor29cpSkBMq4wm_OECGZvMLK5J1QWNu6Smqf9KqPBetA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 25 Aug 2017 19:28:42 +0200
Message-ID: <CA+chaQdw5eRR40rkOsq8VMkLVyvG_mf=3jGgppeZ8SCQ0jxy=Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCHv2 5/7] qt: upgrade to latest revision in 5.9 branch
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
X-List-Received-Date: Fri, 25 Aug 2017 17:28:43 -0000
Content-Type: text/plain; charset="UTF-8"

It looks like you're building 5.9.0 not 5.9.2 from the patch where you're
replying, can you try if you can reproduce it with 5.9.2 as well? Maybe it
was already fixed upstream.

On Fri, Aug 25, 2017 at 7:24 PM, Khem Raj <raj.khem@gmail.com> wrote:

> I am having issues compiling qtbase 5.9 with clang it fails like
>
> | In file included from
> /mnt/a/oe/build/tmp/work/core2-64-bec-linux/qtbase/5.9.
> 0+gitAUTOINC+f6b36eaafe-r0/git/src/corelib/global/qlibraryinfo.cpp:41:
> | In file included from ../../include/QtCore/qdir.h:1:
> | In file included from
> ../../include/QtCore/../../../git/src/corelib/io/qdir.h:43:
> | In file included from ../../include/QtCore/qstring.h:1:
> | In file included from
> ../../include/QtCore/../../../git/src/corelib/tools/qstring.h:48:
> | In file included from ../../include/QtCore/qchar.h:1:
> | In file included from
> ../../include/QtCore/../../../git/src/corelib/tools/qchar.h:43:
> | In file included from ../../include/QtCore/qglobal.h:1:
> | In file included from
> ../../include/QtCore/../../../git/src/corelib/global/qglobal.h:109:
> | In file included from
> /mnt/a/oe/build/tmp/work/core2-64-bec-linux/qtbase/5.9.
> 0+gitAUTOINC+f6b36eaafe-r0/recipe-sysroot/usr/lib//x86_
> 64-bec-linux/7.2.0/../../../include/c++/7.2.0/algorithm:62:
> | In file included from
> /mnt/a/oe/build/tmp/work/core2-64-bec-linux/qtbase/5.9.
> 0+gitAUTOINC+f6b36eaafe-r0/recipe-sysroot/usr/lib//x86_
> 64-bec-linux/7.2.0/../../../include/c++/7.2.0/bits/stl_algo.h:59:
> | /mnt/a/oe/build/tmp/work/core2-64-bec-linux/qtbase/5.9.
> 0+gitAUTOINC+f6b36eaafe-r0/recipe-sysroot/usr/lib//x86_
> 64-bec-linux/7.2.0/../../../include/c++/7.2.0/cstdlib:75:15:
> fatal error: 'stdlib.h' file not found
> | #include_next <stdlib.h>
> |               ^~~~~~~~~~
>
>
> this error means that somewhere -isystem is used instead of -I, any
> quick ideas where this could have been added ? 5.8 does not have this
> issue.
>
> On Mon, Aug 21, 2017 at 2:02 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > * 3 patches were included upstream
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  recipes-qt/qt5/nativesdk-qtbase_git.bb             |   6 +-
> >  .../qt5/qt3d/0001-Allow-a-tools-only-build.patch   |   2 +-
> >  ...2-Fix-BlenderDNA-for-clang-cross-compiler.patch |   2 +-
> >  recipes-qt/qt5/qt3d_git.bb                         |   4 +-
> >  recipes-qt/qt5/qt5-git.inc                         |   4 +-
> >  recipes-qt/qt5/qtbase-native_git.bb                |   6 +-
> >  .../qt5/qtbase/0001-Add-linux-oe-g-platform.patch  |   6 +-
> >  ...make-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch |   2 +-
> >  ...o-allow-to-set-qt.conf-from-the-outside-u.patch |   2 +-
> >  ...ump-path-length-from-256-to-512-character.patch |   4 +-
> >  ...-unknown-features-instead-of-erroring-out.patch |   6 +-
> >  ...-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch |   4 +-
> >  .../0007-Delete-qlonglong-and-qulonglong.patch     |   2 +-
> >  ...08-Replace-pthread_yield-with-sched_yield.patch |   4 +-
> >  recipes-qt/qt5/qtbase/0009-Always-build-uic.patch  |   2 +-
> >  recipes-qt/qt5/qtbase_git.bb                       |   4 +-
> >  recipes-qt/qt5/qtcanvas3d_git.bb                   |   2 +-
> >  recipes-qt/qt5/qtcharts_git.bb                     |   2 +-
> >  recipes-qt/qt5/qtconnectivity_git.bb               |   2 +-
> >  recipes-qt/qt5/qtdatavis3d_git.bb                  |   2 +-
> >  recipes-qt/qt5/qtdeclarative_git.bb                |   2 +-
> >  recipes-qt/qt5/qtenginio_git.bb                    |   1 -
> >  recipes-qt/qt5/qtgamepad_git.bb                    |   2 +-
> >  recipes-qt/qt5/qtgraphicaleffects_git.bb           |   2 +-
> >  recipes-qt/qt5/qtimageformats_git.bb               |   2 +-
> >  .../0001-Make-mapbox-gl-build-configurable.patch   |   8 +-
> >  recipes-qt/qt5/qtlocation_git.bb                   |   6 +-
> >  recipes-qt/qt5/qtmultimedia_git.bb                 |   4 +-
> >  recipes-qt/qt5/qtnetworkauth_git.bb                |   2 +-
> >  recipes-qt/qt5/qtquick1_git.bb                     |   5 +-
> >  ...fix-invalid-use-of-incomplete-type-class-.patch |   4 +-
> >  recipes-qt/qt5/qtquickcontrols2_git.bb             |   2 +-
> >  recipes-qt/qt5/qtquickcontrols_git.bb              |   4 +-
> >  recipes-qt/qt5/qtremoteobjects_git.bb              |   4 +-
> >  recipes-qt/qt5/qtscript_git.bb                     |   2 +-
> >  ...Use-external-host-bin-path-for-cmake-file.patch |   4 +-
> >  recipes-qt/qt5/qtscxml_git.bb                      |   4 +-
> >  recipes-qt/qt5/qtsensors_git.bb                    |   2 +-
> >  recipes-qt/qt5/qtserialbus_git.bb                  |   2 +-
> >  recipes-qt/qt5/qtserialport_git.bb                 |   2 +-
> >  recipes-qt/qt5/qtsvg_git.bb                        |   2 +-
> >  recipes-qt/qt5/qtsystems_git.bb                    |   2 +-
> >  .../0001-add-noqtwebkit-configuration.patch        |  12 +-
> >  ...ols-cmake-allow-overriding-the-location-f.patch |   2 +-
> >  recipes-qt/qt5/qttools_git.bb                      |   4 +-
> >  recipes-qt/qt5/qttranslations_git.bb               |   9 +-
> >  .../0001-include-sys-time.h-for-timeval.patch      |   5 +-
> >  recipes-qt/qt5/qtvirtualkeyboard_git.bb            |   4 +-
> >  .../0001-fix-build-without-xkbcommon-evdev.patch   |   2 +-
> >  recipes-qt/qt5/qtwayland_git.bb                    |   4 +-
> >  recipes-qt/qt5/qtwebchannel_git.bb                 |  11 +-
> >  ...ange-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch |   2 +-
> >  ...s.prf-allow-build-for-linux-oe-g-platform.patch |   6 +-
> >  ...quickwebengineview_p_p.h-add-include-QCol.patch |   4 +-
> >  ...romium-Force-host-toolchain-configuration.patch |   2 +-
> >  ...-dependency-to-QCoreApplication-translate.patch |   2 +-
> >  ...sl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch |   2 +-
> >  .../0004-Force-host-toolchain-configuration.patch  |   8 +-
> >  ...sl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch |   2 +-
> >  .../0005-Always-compile-QWebEnginePage-print.patch | 241
> ---------------------
> >  ...-chromium-musl-include-fcntl.h-for-loff_t.patch |   2 +-
> >  ...sl-use-off64_t-instead-of-the-internal-__.patch |   2 +-
> >  ...ium-musl-linux-glibc-make-the-distinction.patch |   2 +-
> >  ...sl-allocator-Do-not-include-glibc_weak_sy.patch |   2 +-
> >  ...sl-Use-correct-member-name-__si_fields-fr.patch |   2 +-
> >  recipes-qt/qt5/qtwebengine_git.bb                  |  11 +-
> >  recipes-qt/qt5/qtwebkit-examples_git.bb            |   2 +-
> >  .../0001-qtwebkit-fix-QA-issue-bad-RPATH.patch     |   2 +-
> >  ...ude-backtrace-API-for-non-glibc-libraries.patch |   2 +-
> >  .../0003-Fix-compilation-with-ICU-59.patch         |  89 --------
> >  recipes-qt/qt5/qtwebkit_git.bb                     |   5 +-
> >  recipes-qt/qt5/qtwebsockets_git.bb                 |  12 +-
> >  .../0001-Add-missing-include-for-qWarning.patch    |  22 --
> >  recipes-qt/qt5/qtwebview_git.bb                    |   6 +-
> >  recipes-qt/qt5/qtx11extras_git.bb                  |   2 +-
> >  recipes-qt/qt5/qtxmlpatterns_git.bb                |   2 +-
> >  76 files changed, 128 insertions(+), 495 deletions(-)
> >  delete mode 100644 recipes-qt/qt5/qtwebengine/0005-Always-compile-
> QWebEnginePage-print.patch
> >  delete mode 100644 recipes-qt/qt5/qtwebkit/0003-
> Fix-compilation-with-ICU-59.patch
> >  delete mode 100644 recipes-qt/qt5/qtwebview/0001-
> Add-missing-include-for-qWarning.patch
> >
> > diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/
> nativesdk-qtbase_git.bb
> > index d229c21..87bd501 100644
> > --- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
> > +++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
> > @@ -26,7 +26,7 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/qtbase:"
> >
> >  # common for qtbase-native, qtbase-nativesdk and qtbase
> >  # Patches from https://github.com/meta-qt5/qtbase/commits/b5.9-shared
> > -# 5.9.meta-qt5-shared.1
> > +# 5.9.meta-qt5-shared.2
> >  SRC_URI += "\
> >      file://0001-Add-linux-oe-g-platform.patch \
> >      file://0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch \
> > @@ -40,7 +40,7 @@ SRC_URI += "\
> >
> >  # common for qtbase-native and nativesdk-qtbase
> >  # Patches from https://github.com/meta-qt5/qtbase/commits/b5.9-native
> > -# 5.9.meta-qt5-native.1
> > +# 5.9.meta-qt5-native.2
> >  SRC_URI += " \
> >      file://0009-Always-build-uic.patch \
> >  "
> > @@ -197,4 +197,4 @@ fakeroot do_generate_qt_environment_file() {
> >
> >  addtask generate_qt_environment_file after do_install before do_package
> >
> > -SRCREV = "f6b36eaafec24b4c67efff621d380a4ca4257d0b"
> > +SRCREV = "73573fce295caef35da706a8c8c796ec18e6baf1"
> > diff --git a/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
> b/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
> > index 8cf1f50..5aba2bf 100644
> > --- a/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
> > +++ b/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
> > @@ -1,4 +1,4 @@
> > -From dd0f3fefeeefb31ec8cf2417bd3f447f7b9c25c6 Mon Sep 17 00:00:00 2001
> > +From 7cb46d20ad89f37828ff9f96363a112eadf11dbd Mon Sep 17 00:00:00 2001
> >  From: Samuli Piippo <samuli.piippo@theqtcompany.com>
> >  Date: Wed, 10 Feb 2016 09:02:09 +0200
> >  Subject: [PATCH] Allow a tools-only build
> > diff --git a/recipes-qt/qt5/qt3d/0002-Fix-BlenderDNA-for-clang-cross-compiler.patch
> b/recipes-qt/qt5/qt3d/0002-Fix-BlenderDNA-for-clang-cross-compiler.patch
> > index eeb402f..1f2f682 100644
> > --- a/recipes-qt/qt5/qt3d/0002-Fix-BlenderDNA-for-clang-
> cross-compiler.patch
> > +++ b/recipes-qt/qt5/qt3d/0002-Fix-BlenderDNA-for-clang-
> cross-compiler.patch
> > @@ -1,4 +1,4 @@
> > -From ec40913bc563e3cb0abc1965ce457d3a2fe663b3 Mon Sep 17 00:00:00 2001
> > +From 99fb23c0258ed0dacb03dc2eb57792c42b33316f Mon Sep 17 00:00:00 2001
> >  From: Kim Kulling <kim.kulling@googlemail.com>
> >  Date: Mon, 7 Nov 2016 17:19:49 +0100
> >  Subject: [PATCH] Fix BlenderDNA for clang cross compiler.
> > diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
> > index 4226bac..c354db4 100644
> > --- a/recipes-qt/qt5/qt3d_git.bb
> > +++ b/recipes-qt/qt5/qt3d_git.bb
> > @@ -12,7 +12,7 @@ DEPENDS += "qtbase"
> >  DEPENDS_class-target += "qtdeclarative qt3d-native"
> >
> >  # Patches from https://github.com/meta-qt5/qt3d/commits/b5.9
> > -# 5.9.meta-qt5.1
> > +# 5.9.meta-qt5.2
> >  SRC_URI += " \
> >      file://0001-Allow-a-tools-only-build.patch \
> >      file://0002-Fix-BlenderDNA-for-clang-cross-compiler.patch \
> > @@ -37,6 +37,6 @@ do_configure_prepend() {
> >           ${S}/src/quick3d/imports/input/importsinput.pro
> >  }
> >
> > -SRCREV = "f39d0a0c32cc489849a0cd5c2880f6e824223485"
> > +SRCREV = "9d8c9ada161ad97634992c444196add0abb4f9d1"
> >
> >  BBCLASSEXTEND += "native nativesdk"
> > diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
> > index 927912f..ffa70e5 100644
> > --- a/recipes-qt/qt5/qt5-git.inc
> > +++ b/recipes-qt/qt5/qt5-git.inc
> > @@ -1,5 +1,5 @@
> >  # Copyright (C) 2012-2016 O.S. Systems Software LTDA.
> > -# Copyright (C) 2013-2016 Martin Jansa <martin.jansa@gmail.com>
> > +# Copyright (C) 2013-2017 Martin Jansa <martin.jansa@gmail.com>
> >
> >  QT_MODULE ?= "${BPN}"
> >  QT_MODULE_BRANCH ?= "5.9"
> > @@ -14,4 +14,4 @@ CVE_PRODUCT = "qt"
> >
> >  S = "${WORKDIR}/git"
> >
> > -PV = "5.9.0+git${SRCPV}"
> > +PV = "5.9.2+git${SRCPV}"
> > diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/
> qtbase-native_git.bb
> > index 336df95..54a0b78 100644
> > --- a/recipes-qt/qt5/qtbase-native_git.bb
> > +++ b/recipes-qt/qt5/qtbase-native_git.bb
> > @@ -21,7 +21,7 @@ require qt5-git.inc
> >
> >  # common for qtbase-native, qtbase-nativesdk and qtbase
> >  # Patches from https://github.com/meta-qt5/qtbase/commits/b5.9-shared
> > -# 5.9.meta-qt5-shared.1
> > +# 5.9.meta-qt5-shared.2
> >  SRC_URI += "\
> >      file://0001-Add-linux-oe-g-platform.patch \
> >      file://0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch \
> > @@ -35,7 +35,7 @@ SRC_URI += "\
> >
> >  # common for qtbase-native and nativesdk-qtbase
> >  # Patches from https://github.com/meta-qt5/qtbase/commits/b5.9-native
> > -# 5.9.meta-qt5-native.1
> > +# 5.9.meta-qt5-native.2
> >  SRC_URI += " \
> >      file://0009-Always-build-uic.patch \
> >  "
> > @@ -114,4 +114,4 @@ do_install() {
> >      install -m 755 ${B}/bin/qfloat16-tables ${D}${OE_QMAKE_PATH_BINS}
> >  }
> >
> > -SRCREV = "f6b36eaafec24b4c67efff621d380a4ca4257d0b"
> > +SRCREV = "73573fce295caef35da706a8c8c796ec18e6baf1"
> > diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
> b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
> > index 28c2660..a8fe433 100644
> > --- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
> > +++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
> > @@ -1,4 +1,4 @@
> > -From e13425e6f1e784b0b016cf68a54dfbae32995b86 Mon Sep 17 00:00:00 2001
> > +From 85da054ff867fbf1a4c10e3f1cad782123ffdfe4 Mon Sep 17 00:00:00 2001
> >  From: Martin Jansa <Martin.Jansa@gmail.com>
> >  Date: Mon, 15 Apr 2013 04:29:32 +0200
> >  Subject: [PATCH] Add linux-oe-g++ platform
> > @@ -30,10 +30,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >   create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
> >
> >  diff --git a/configure b/configure
> > -index 73679de621..5a0eebce50 100755
> > +index 08b49a8d12..5876721743 100755
> >  --- a/configure
> >  +++ b/configure
> > -@@ -709,7 +709,7 @@ fi
> > +@@ -712,7 +712,7 @@ fi
> >   # is where the resulting variable is written to
> >   setBootstrapVariable()
> >   {
> > diff --git a/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch
> b/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_
> EXTERNAL_HOST_BINS.patch
> > index 5ee6e04..b67a7ef 100644
> > --- a/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_
> EXTERNAL_HOST_BINS.patch
> > +++ b/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_
> EXTERNAL_HOST_BINS.patch
> > @@ -1,4 +1,4 @@
> > -From 5ed152f8caa7ef00fb20d19a06ab5f7887e9aba6 Mon Sep 17 00:00:00 2001
> > +From b6d5179ad7c907bc3343bcf3586cef6226d0c8ed Mon Sep 17 00:00:00 2001
> >  From: Martin Jansa <Martin.Jansa@gmail.com>
> >  Date: Sat, 6 Apr 2013 13:15:07 +0200
> >  Subject: [PATCH] cmake: Use OE_QMAKE_PATH_EXTERNAL_HOST_BINS
> > diff --git a/recipes-qt/qt5/qtbase/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
> b/recipes-qt/qt5/qtbase/0003-qlibraryinfo-allow-to-set-qt.
> conf-from-the-outside-u.patch
> > index 7ff1ff7..ae06ea6 100644
> > --- a/recipes-qt/qt5/qtbase/0003-qlibraryinfo-allow-to-set-qt.
> conf-from-the-outside-u.patch
> > +++ b/recipes-qt/qt5/qtbase/0003-qlibraryinfo-allow-to-set-qt.
> conf-from-the-outside-u.patch
> > @@ -1,4 +1,4 @@
> > -From 77fab782e8a199f9ede83bc97cbce21a544961c2 Mon Sep 17 00:00:00 2001
> > +From 8cf43041691140faf5f56b42bebfa00d8ebc8da6 Mon Sep 17 00:00:00 2001
> >  From: Holger Freyther <zecke@selfish.org>
> >  Date: Wed, 26 Sep 2012 17:22:30 +0200
> >  Subject: [PATCH] qlibraryinfo: allow to set qt.conf from the outside
> using the
> > diff --git a/recipes-qt/qt5/qtbase/0004-configure-bump-path-length-
> from-256-to-512-character.patch b/recipes-qt/qt5/qtbase/0004-
> configure-bump-path-length-from-256-to-512-character.patch
> > index 5ab6a7b..8ef4f61 100644
> > --- a/recipes-qt/qt5/qtbase/0004-configure-bump-path-length-
> from-256-to-512-character.patch
> > +++ b/recipes-qt/qt5/qtbase/0004-configure-bump-path-length-
> from-256-to-512-character.patch
> > @@ -1,4 +1,4 @@
> > -From 4848804312f0045b53c85db113ac9e42fe1b7360 Mon Sep 17 00:00:00 2001
> > +From f02c4f742e90023e87d148bda48401b11815d8ba Mon Sep 17 00:00:00 2001
> >  From: Denys Dmytriyenko <denys@ti.com>
> >  Date: Tue, 25 Aug 2015 10:05:15 -0400
> >  Subject: [PATCH] configure: bump path length from 256 to 512 characters
> > @@ -15,7 +15,7 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> >
> >  diff --git a/configure.pri b/configure.pri
> > -index be1b166080..52f03bf3f2 100644
> > +index 76bb27e4ae..9ac81027c9 100644
> >  --- a/configure.pri
> >  +++ b/configure.pri
> >  @@ -796,10 +796,10 @@ defineTest(qtConfOutput_preparePaths) {
> > diff --git a/recipes-qt/qt5/qtbase/0005-Disable-all-unknown-features-instead-of-erroring-out.patch
> b/recipes-qt/qt5/qtbase/0005-Disable-all-unknown-features-
> instead-of-erroring-out.patch
> > index 8538901..610299d 100644
> > --- a/recipes-qt/qt5/qtbase/0005-Disable-all-unknown-features-
> instead-of-erroring-out.patch
> > +++ b/recipes-qt/qt5/qtbase/0005-Disable-all-unknown-features-
> instead-of-erroring-out.patch
> > @@ -1,4 +1,4 @@
> > -From 6ecb404346525a92f4c8926aa285662f3f5010b3 Mon Sep 17 00:00:00 2001
> > +From 3114a9cd19b15f6b5ca99c4ce961ae5b80bfb3ab Mon Sep 17 00:00:00 2001
> >  From: Samuli Piippo <samuli.piippo@qt.io>
> >  Date: Mon, 24 Oct 2016 09:45:18 +0300
> >  Subject: [PATCH] Disable all unknown features instead of erroring out
> > @@ -10,10 +10,10 @@ Change-Id: Ib884fe33cac74439f9592b145937f6b75ced8447
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> >  diff --git a/mkspecs/features/qt_configure.prf b/mkspecs/features/qt_
> configure.prf
> > -index 966c43108c..32f0dd0041 100644
> > +index afeb4f3d1d..aec5253c25 100644
> >  --- a/mkspecs/features/qt_configure.prf
> >  +++ b/mkspecs/features/qt_configure.prf
> > -@@ -1180,7 +1180,8 @@ defineReplace(qtConfEvaluateSingleExpression) {
> > +@@ -1235,7 +1235,8 @@ defineReplace(qtConfEvaluateSingleExpression) {
> >                       error("Expression '$$1' is accessing field '$$var'
> of non-local feature $${feature}.")
> >                   return($$result)
> >               }
> > diff --git a/recipes-qt/qt5/qtbase/0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
> b/recipes-qt/qt5/qtbase/0006-Pretend-Qt5-wasn-t-found-if-
> OE_QMAKE_PATH_EXTERNAL_H.patch
> > index 253815b..eaa5da8 100644
> > --- a/recipes-qt/qt5/qtbase/0006-Pretend-Qt5-wasn-t-found-if-
> OE_QMAKE_PATH_EXTERNAL_H.patch
> > +++ b/recipes-qt/qt5/qtbase/0006-Pretend-Qt5-wasn-t-found-if-
> OE_QMAKE_PATH_EXTERNAL_H.patch
> > @@ -1,4 +1,4 @@
> > -From 3730ac03a1473a0e1fdfe1537b73818ab99961e9 Mon Sep 17 00:00:00 2001
> > +From 515acdcfe158982f31b31e410bbedb3db94bea1c Mon Sep 17 00:00:00 2001
> >  From: Pascal Bach <pascal.bach@siemens.com>
> >  Date: Wed, 11 May 2016 15:20:41 +0200
> >  Subject: [PATCH] Pretend Qt5 wasn't found if
> OE_QMAKE_PATH_EXTERNAL_HOST_BINS
> > @@ -30,7 +30,7 @@ Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> >   2 files changed, 10 insertions(+)
> >
> >  diff --git a/mkspecs/features/data/cmake/Qt5BasicConfig.cmake.in
> b/mkspecs/features/data/cmake/Qt5BasicConfig.cmake.in
> > -index 4f342d67d7..202b723882 100644
> > +index 55c74aad66..f9ec328c83 100644
> >  --- a/mkspecs/features/data/cmake/Qt5BasicConfig.cmake.in
> >  +++ b/mkspecs/features/data/cmake/Qt5BasicConfig.cmake.in
> >  @@ -9,6 +9,11 @@ if (CMAKE_VERSION VERSION_LESS 3.0.0)
> > diff --git a/recipes-qt/qt5/qtbase/0007-Delete-qlonglong-and-qulonglong.patch
> b/recipes-qt/qt5/qtbase/0007-Delete-qlonglong-and-qulonglong.patch
> > index 68e4b20..4d3e4b6 100644
> > --- a/recipes-qt/qt5/qtbase/0007-Delete-qlonglong-and-qulonglong.patch
> > +++ b/recipes-qt/qt5/qtbase/0007-Delete-qlonglong-and-qulonglong.patch
> > @@ -1,4 +1,4 @@
> > -From 2fa6b447302abbaf1fd710e94b92692a300baaaf Mon Sep 17 00:00:00 2001
> > +From 6875848e2250ef439115ff2063713ce7bfb9597d Mon Sep 17 00:00:00 2001
> >  From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> >  Date: Wed, 7 Jun 2017 21:00:49 +0900
> >  Subject: [PATCH] Delete qlonglong and qulonglong
> > diff --git a/recipes-qt/qt5/qtbase/0008-Replace-pthread_yield-with-sched_yield.patch
> b/recipes-qt/qt5/qtbase/0008-Replace-pthread_yield-with-sched_yield.patch
> > index 678de52..14074fb 100644
> > --- a/recipes-qt/qt5/qtbase/0008-Replace-pthread_yield-with-
> sched_yield.patch
> > +++ b/recipes-qt/qt5/qtbase/0008-Replace-pthread_yield-with-
> sched_yield.patch
> > @@ -1,4 +1,4 @@
> > -From 41d7028d2239a98a76cc91939edb2cb728019d08 Mon Sep 17 00:00:00 2001
> > +From 66da19d96d9a6ea9142df8fcbc0c3b7d960ee6b9 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Thu, 27 Jul 2017 08:02:51 -0700
> >  Subject: [PATCH] Replace pthread_yield with sched_yield
> > @@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   2 files changed, 5 insertions(+), 4 deletions(-)
> >
> >  diff --git a/tests/auto/corelib/kernel/qmetatype/tst_qmetatype.cpp
> b/tests/auto/corelib/kernel/qmetatype/tst_qmetatype.cpp
> > -index b6106e8c9e..6d6ea0b739 100644
> > +index f9ddd59aaa..2f92db983d 100644
> >  --- a/tests/auto/corelib/kernel/qmetatype/tst_qmetatype.cpp
> >  +++ b/tests/auto/corelib/kernel/qmetatype/tst_qmetatype.cpp
> >  @@ -34,7 +34,7 @@
> > diff --git a/recipes-qt/qt5/qtbase/0009-Always-build-uic.patch
> b/recipes-qt/qt5/qtbase/0009-Always-build-uic.patch
> > index 118a4f2..2a1d534 100644
> > --- a/recipes-qt/qt5/qtbase/0009-Always-build-uic.patch
> > +++ b/recipes-qt/qt5/qtbase/0009-Always-build-uic.patch
> > @@ -1,4 +1,4 @@
> > -From 294e4c718407e66631ce36c37258217c9adb3f83 Mon Sep 17 00:00:00 2001
> > +From bf173918731c626b6c8b84eb826c921e5c6d44f5 Mon Sep 17 00:00:00 2001
> >  From: Martin Jansa <Martin.Jansa@gmail.com>
> >  Date: Sat, 16 Nov 2013 00:32:30 +0100
> >  Subject: [PATCH] Always build uic
> > diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> > index 1c18d0d..aaa59f3 100644
> > --- a/recipes-qt/qt5/qtbase_git.bb
> > +++ b/recipes-qt/qt5/qtbase_git.bb
> > @@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = " \
> >
> >  # common for qtbase-native, qtbase-nativesdk and qtbase
> >  # Patches from https://github.com/meta-qt5/qtbase/commits/b5.9-shared
> > -# 5.9.meta-qt5-shared.1
> > +# 5.9.meta-qt5-shared.2
> >  SRC_URI += "\
> >      file://0001-Add-linux-oe-g-platform.patch \
> >      file://0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch \
> > @@ -222,4 +222,4 @@ INSANE_SKIP_${PN}-mkspecs += "file-rdeps"
> >
> >  RRECOMMENDS_${PN}-plugins += "${@bb.utils.contains('DISTRO_FEATURES',
> 'x11', 'libx11-locale', '', d)}"
> >
> > -SRCREV = "f6b36eaafec24b4c67efff621d380a4ca4257d0b"
> > +SRCREV = "73573fce295caef35da706a8c8c796ec18e6baf1"
> > diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb b/recipes-qt/qt5/
> qtcanvas3d_git.bb
> > index b2a0724..25cd72b 100644
> > --- a/recipes-qt/qt5/qtcanvas3d_git.bb
> > +++ b/recipes-qt/qt5/qtcanvas3d_git.bb
> > @@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
> >
> >  DEPENDS = "qtdeclarative"
> >
> > -SRCREV = "116737dc8fa244282dda95a8f13624b66fdb5521"
> > +SRCREV = "25447e889dc43c0831100bee1625a6f667d364cf"
> > diff --git a/recipes-qt/qt5/qtcharts_git.bb b/recipes-qt/qt5/
> qtcharts_git.bb
> > index 6b895aa..d3447ef 100644
> > --- a/recipes-qt/qt5/qtcharts_git.bb
> > +++ b/recipes-qt/qt5/qtcharts_git.bb
> > @@ -8,4 +8,4 @@ LIC_FILES_CHKSUM = " \
> >
> >  DEPENDS += "qtbase qtdeclarative qtmultimedia"
> >
> > -SRCREV = "de7f741c428febfe3c81a28f955996d2314953fc"
> > +SRCREV = "1f47b1a7ae58702dccc57a9ccbaa905441f4fecb"
> > diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/
> qtconnectivity_git.bb
> > index 0d13dc4..9e91a1d 100644
> > --- a/recipes-qt/qt5/qtconnectivity_git.bb
> > +++ b/recipes-qt/qt5/qtconnectivity_git.bb
> > @@ -19,4 +19,4 @@ PACKAGECONFIG[bluez] = "-feature-bluez,-no-feature-
> bluez,${BLUEZ}"
> >
> >  EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
> >
> > -SRCREV = "8dcbf68e4579e03ea6d2808ac0c670169b59d0df"
> > +SRCREV = "94cc2b914a027fbcb7a1eb6cb34af45d0c07d2a4"
> > diff --git a/recipes-qt/qt5/qtdatavis3d_git.bb b/recipes-qt/qt5/
> qtdatavis3d_git.bb
> > index 0cbd04e..471cfee 100644
> > --- a/recipes-qt/qt5/qtdatavis3d_git.bb
> > +++ b/recipes-qt/qt5/qtdatavis3d_git.bb
> > @@ -8,4 +8,4 @@ LIC_FILES_CHKSUM = " \
> >
> >  DEPENDS += "qtbase qtdeclarative qtmultimedia qtxmlpatterns"
> >
> > -SRCREV = "84490ff75be5acdaeb3fd93900e4ebf7ba8f539b"
> > +SRCREV = "3f8ae713dfdbaeb34bdc52d905fe5ca16765cf7f"
> > diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/
> qtdeclarative_git.bb
> > index ecd64ee..12e5f4e 100644
> > --- a/recipes-qt/qt5/qtdeclarative_git.bb
> > +++ b/recipes-qt/qt5/qtdeclarative_git.bb
> > @@ -29,6 +29,6 @@ do_install_append_class-nativesdk() {
> >
> >  EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG',
> 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
> >
> > -SRCREV = "96f6ba5f562073f508cd8569ac354592fdd48f4a"
> > +SRCREV = "7c45b035b97ce705d536932965673dca7cfa489e"
> >
> >  BBCLASSEXTEND =+ "native nativesdk"
> > diff --git a/recipes-qt/qt5/qtenginio_git.bb b/recipes-qt/qt5/qtenginio_
> git.bb
> > index 8b4fb71..1fa8e82 100644
> > --- a/recipes-qt/qt5/qtenginio_git.bb
> > +++ b/recipes-qt/qt5/qtenginio_git.bb
> > @@ -14,4 +14,3 @@ DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
> >
> >  QT_MODULE_BRANCH = "dev"
> >  SRCREV = "0555cf73c8b5abd41d8a4ff02457315c9e7c667d"
> > -
> > diff --git a/recipes-qt/qt5/qtgamepad_git.bb b/recipes-qt/qt5/qtgamepad_
> git.bb
> > index 94f04a4..a771d9d 100644
> > --- a/recipes-qt/qt5/qtgamepad_git.bb
> > +++ b/recipes-qt/qt5/qtgamepad_git.bb
> > @@ -14,4 +14,4 @@ PACKAGECONFIG[sdl2] = "-feature-sdl2,-no-feature-
> sdl2,libsdl2"
> >
> >  EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
> >
> > -SRCREV = "ef8850fee38e2552d535379a8477c9abebdf8bb4"
> > +SRCREV = "1fc40deed6993265c436783cc367285bf9a2266a"
> > diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/
> qtgraphicaleffects_git.bb
> > index edb150e..ee5b2a6 100644
> > --- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
> > +++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
> > @@ -23,4 +23,4 @@ RDEPENDS_${PN}-dev = ""
> >  # http://errors.yoctoproject.org/Errors/Build/44912/
> >  LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES',
> 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
> >
> > -SRCREV = "db93af5b2bb49af74fbad6c9cd80bd7010434e78"
> > +SRCREV = "b6ff12df5496f3d296bb438ae343d5f771e93fec"
> > diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/
> qtimageformats_git.bb
> > index 4dd64df..1e022f4 100644
> > --- a/recipes-qt/qt5/qtimageformats_git.bb
> > +++ b/recipes-qt/qt5/qtimageformats_git.bb
> > @@ -26,4 +26,4 @@ PACKAGECONFIG[libwebp] = ",CONFIG+=done_config_libwebp,
> libwebp"
> >
> >  EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
> >
> > -SRCREV = "71ccf0dff82835ce7b5aed74c37829afdef44cde"
> > +SRCREV = "144a3535db9f95e60972d3c3b6eaceb65a604577"
> > diff --git a/recipes-qt/qt5/qtlocation/0001-Make-mapbox-gl-build-configurable.patch
> b/recipes-qt/qt5/qtlocation/0001-Make-mapbox-gl-build-configurable.patch
> > index 49fcff6..7db1676 100644
> > --- a/recipes-qt/qt5/qtlocation/0001-Make-mapbox-gl-build-
> configurable.patch
> > +++ b/recipes-qt/qt5/qtlocation/0001-Make-mapbox-gl-build-
> configurable.patch
> > @@ -1,4 +1,4 @@
> > -From f7c76b91e726a0e63e5226eb6e89b13e0c3509b7 Mon Sep 17 00:00:00 2001
> > +From dbc899b088817cf6529d7e5cb8be7a6a95556127 Mon Sep 17 00:00:00 2001
> >  From: Samuli Piippo <samuli.piippo@qt.io>
> >  Date: Wed, 7 Jun 2017 13:29:29 +0300
> >  Subject: [PATCH] Make mapbox-gl build configurable
> > @@ -13,15 +13,15 @@ Change-Id: I5f26200f2735b363c3c322f9035b331b9159c47b
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >  diff --git a/src/plugins/geoservices/geoservices.pro
> b/src/plugins/geoservices/geoservices.pro
> > -index 0810d39..03fc119 100644
> > +index 459897a8..d97e05d0 100644
> >  --- a/src/plugins/geoservices/geoservices.pro
> >  +++ b/src/plugins/geoservices/geoservices.pro
> >  @@ -6,7 +6,7 @@ qtConfig(concurrent) {
> >       SUBDIRS += osm
> >   }
> >
> > --qtConfig(c++14):!win32|mingw:!qnx {
> > -+mapboxgl:qtConfig(c++14):!win32|mingw:!qnx {
> > +-qtConfig(opengl):qtConfig(c++14):!win32|mingw:!qnx {
> > ++mapboxgl:qtConfig(opengl):qtConfig(c++14):!win32|mingw:!qnx {
> >       !exists(../../3rdparty/mapbox-gl-native/CMakeLists.txt) {
> >           warning("Submodule mapbox-gl-native does not exist. Run 'git
> submodule update --init' on qtlocation.")
> >       } else {
> > diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/
> qtlocation_git.bb
> > index c50a917..19f895e 100644
> > --- a/recipes-qt/qt5/qtlocation_git.bb
> > +++ b/recipes-qt/qt5/qtlocation_git.bb
> > @@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = " \
> >  DEPENDS += "qtbase qtxmlpatterns qtdeclarative qtquickcontrols"
> >
> >  # Patches from https://github.com/meta-qt5/qtlocation/commits/b5.9
> > -# 5.9.meta-qt5.1
> > +# 5.9.meta-qt5.2
> >  SRC_URI += "file://0001-Make-mapbox-gl-build-configurable.patch"
> >
> >  PACKAGECONFIG ??= ""
> > @@ -34,7 +34,7 @@ SRC_URI += " \
> >      ${QT_GIT}/qtlocation-mapboxgl.git;name=qtlocation-mapboxgl;
> branch=upstream/qt-staging;protocol=${QT_GIT_PROTOCOL};
> destsuffix=git/src/3rdparty/mapbox-gl-native \
> >  "
> >
> > -SRCREV_qtlocation = "888d351cb0c7fe6d05ab1efe8d4dbb4b6f06cd5f"
> > -SRCREV_qtlocation-mapboxgl = "d45c177e8a23eefcc94930af9fa085e61136bb94"
> > +SRCREV_qtlocation = "c832af789766fcebd8cfb15e53ce14f36278ca6d"
> > +SRCREV_qtlocation-mapboxgl = "9ecbe3642fb4a53b558598239b59bf1d0224c25b"
> >
> >  SRCREV_FORMAT = "qtlocation_qtlocation-mapboxgl"
> > diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/
> qtmultimedia_git.bb
> > index 998f32f..729b3ff 100644
> > --- a/recipes-qt/qt5/qtmultimedia_git.bb
> > +++ b/recipes-qt/qt5/qtmultimedia_git.bb
> > @@ -26,7 +26,7 @@ EXTRA_QMAKEVARS_CONFIGURE +=
> "${PACKAGECONFIG_CONFARGS}"
> >  EXTRA_QMAKEVARS_CONFIGURE += "${@bb.utils.contains_any('PACKAGECONFIG',
> 'gstreamer gstreamer010', '', '-no-gstreamer', d)}"
> >
> >  # Patches from https://github.com/meta-qt5/qtmultimedia/commits/b5.9
> > -# 5.9.meta-qt5.1
> > +# 5.9.meta-qt5.2
> >  SRC_URI += "\
> >      file://0001-qtmultimedia-fix-a-conflicting-declaration.patch \
> >  "
> > @@ -35,4 +35,4 @@ SRC_URI += "\
> >  # http://errors.yoctoproject.org/Errors/Build/44914/
> >  LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES',
> 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
> >
> > -SRCREV = "559c305ded730e23505e8b29536a98dc59e2acfa"
> > +SRCREV = "343e281f0e7cc7fd9e1558e4d92f5019fa565181"
> > diff --git a/recipes-qt/qt5/qtnetworkauth_git.bb b/recipes-qt/qt5/
> qtnetworkauth_git.bb
> > index eb5e4f6..0655b42 100644
> > --- a/recipes-qt/qt5/qtnetworkauth_git.bb
> > +++ b/recipes-qt/qt5/qtnetworkauth_git.bb
> > @@ -9,4 +9,4 @@ require qt5-git.inc
> >
> >  DEPENDS += "qtbase"
> >
> > -SRCREV = "86c5036848ad004208803d9d497cfcd08c9623d6"
> > +SRCREV = "3d93f6436596e349e43c3798b675af66db71df8a"
> > diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/
> qtquick1_git.bb
> > index 1f680e6..eaa3661 100644
> > --- a/recipes-qt/qt5/qtquick1_git.bb
> > +++ b/recipes-qt/qt5/qtquick1_git.bb
> > @@ -24,4 +24,7 @@ do_configure_prepend() {
> >  }
> >
> >  QT_MODULE_BRANCH = "dev"
> > -SRCREV = "695460401d9a89d2f156016d51601b2e59b64105"
> > +# one commit behind:
> > +# 8a7b80eb Use QRandomGenerator instead of q?rand
> > +# because QRandomGenerator is only since Qt 5.10
> > +SRCREV = "9bf0edd9bd46ecb900bcdc3349d14869b87ab7de"
> > diff --git a/recipes-qt/qt5/qtquickcontrols/0001-
> texteditor-fix-invalid-use-of-incomplete-type-class-.patch
> b/recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-
> incomplete-type-class-.patch
> > index 85fcc15..2e64480 100644
> > --- a/recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-
> incomplete-type-class-.patch
> > +++ b/recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-
> incomplete-type-class-.patch
> > @@ -1,4 +1,4 @@
> > -From fca6212d5ebc5851f28e820e4ff0ebe04a9d44d7 Mon Sep 17 00:00:00 2001
> > +From 3248edbde8859f62f453215876fbcb89dd788513 Mon Sep 17 00:00:00 2001
> >  From: Denys Dmytriyenko <denys@ti.com>
> >  Date: Thu, 31 Mar 2016 19:57:01 -0400
> >  Subject: [PATCH] texteditor: fix invalid use of incomplete type 'class
> QDebug'
> > @@ -11,7 +11,7 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >   1 file changed, 1 insertion(+)
> >
> >  diff --git a/examples/quickcontrols/controls/texteditor/src/documenthandler.cpp
> b/examples/quickcontrols/controls/texteditor/src/documenthandler.cpp
> > -index bdecf5b..811a761 100644
> > +index 69da88f0..9039191e 100644
> >  --- a/examples/quickcontrols/controls/texteditor/src/
> documenthandler.cpp
> >  +++ b/examples/quickcontrols/controls/texteditor/src/
> documenthandler.cpp
> >  @@ -54,6 +54,7 @@
> > diff --git a/recipes-qt/qt5/qtquickcontrols2_git.bb b/recipes-qt/qt5/
> qtquickcontrols2_git.bb
> > index a84cfb3..e123f0d 100644
> > --- a/recipes-qt/qt5/qtquickcontrols2_git.bb
> > +++ b/recipes-qt/qt5/qtquickcontrols2_git.bb
> > @@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
> >
> >  DEPENDS += "qtdeclarative"
> >
> > -SRCREV = "ef6b8d3081f0bf93d6d59e67c8e3f82c63c511c3"
> > +SRCREV = "63f2f55462f2f040cfe175ada8aa1e01168597fc"
> > diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/
> qtquickcontrols_git.bb
> > index 0ea314b..50d6ba6 100644
> > --- a/recipes-qt/qt5/qtquickcontrols_git.bb
> > +++ b/recipes-qt/qt5/qtquickcontrols_git.bb
> > @@ -23,9 +23,9 @@ FILES_${PN}-qmlplugins += " \
> >  "
> >
> >  # Patches from https://github.com/meta-qt5/qtquickcontrols/commits/b5.9
> > -# 5.9.meta-qt5.1
> > +# 5.9.meta-qt5.2
> >  SRC_URI += " \
> >      file://0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch
> \
> >  "
> >
> > -SRCREV = "dacb91916b202208681471ba764504c7c7d086f0"
> > +SRCREV = "a77494140324c3ede1f7c16086593c070d81e2b3"
> > diff --git a/recipes-qt/qt5/qtremoteobjects_git.bb b/recipes-qt/qt5/
> qtremoteobjects_git.bb
> > index a7e3447..1e90323 100644
> > --- a/recipes-qt/qt5/qtremoteobjects_git.bb
> > +++ b/recipes-qt/qt5/qtremoteobjects_git.bb
> > @@ -12,7 +12,7 @@ require qt5-git.inc
> >  DEPENDS += "qtbase qtdeclarative qtremoteobjects-native"
> >
> >  # Patches from https://github.com/meta-qt5/qtremoteobjects/commits/b5.9
> > -# 5.9.meta-qt5.1
> > +# 5.9.meta-qt5.2
> >  SRC_URI += " \
> >      file://0001-Allow-a-tools-only-build.patch \
> >  "
> > @@ -24,6 +24,6 @@ PACKAGECONFIG[tools-only] = "CONFIG+=tools-only"
> >
> >  EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
> >
> > -SRCREV = "ae0b101884b05355e3a7bc06dbca722ad3d08d0f"
> > +SRCREV = "6e0341bc878ff82d3c1039dcce09f92269546189"
> >
> >  BBCLASSEXTEND += "native nativesdk"
> > diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/
> qtscript_git.bb
> > index e7acafe..9061c3c 100644
> > --- a/recipes-qt/qt5/qtscript_git.bb
> > +++ b/recipes-qt/qt5/qtscript_git.bb
> > @@ -29,4 +29,4 @@ DEPENDS += "qtbase"
> >  # http://errors.yoctoproject.org/Errors/Build/44915/
> >  LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES',
> 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
> >
> > -SRCREV = "e00ca9b6bec2adf78fd14e02376ecf1b55a93b0c"
> > +SRCREV = "86ee61734e0331459f9cfeb1ad56f773b7e994be"
> > diff --git a/recipes-qt/qt5/qtscxml/0001-Use-external-host-bin-path-for-cmake-file.patch
> b/recipes-qt/qt5/qtscxml/0001-Use-external-host-bin-path-
> for-cmake-file.patch
> > index 0b90a66..dc988fa 100644
> > --- a/recipes-qt/qt5/qtscxml/0001-Use-external-host-bin-path-
> for-cmake-file.patch
> > +++ b/recipes-qt/qt5/qtscxml/0001-Use-external-host-bin-path-
> for-cmake-file.patch
> > @@ -1,4 +1,4 @@
> > -From 210049f0e53f7fb8e5c44325b13947add9618f89 Mon Sep 17 00:00:00 2001
> > +From 89c9f60679b21629412503a17358426bf211a81b Mon Sep 17 00:00:00 2001
> >  From: Samuli Piippo <samuli.piippo@qt.io>
> >  Date: Tue, 10 Jan 2017 15:28:26 +0200
> >  Subject: [PATCH] Use external host bin path for cmake file
> > @@ -14,7 +14,7 @@ Change-Id: Idb814be705e9cbaad7f1e68b5d7cdb79c4b65008
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >  diff --git a/src/scxml/Qt5ScxmlConfigExtras.cmake.in b/src/scxml/
> Qt5ScxmlConfigExtras.cmake.in
> > -index edb320a..c2f8be8 100644
> > +index edb320a..ce7f2df 100644
> >  --- a/src/scxml/Qt5ScxmlConfigExtras.cmake.in
> >  +++ b/src/scxml/Qt5ScxmlConfigExtras.cmake.in
> >  @@ -40,7 +40,7 @@ if (NOT TARGET Qt5::qscxmlc)
> > diff --git a/recipes-qt/qt5/qtscxml_git.bb b/recipes-qt/qt5/qtscxml_git.
> bb
> > index e9ca8c1..36ca665 100644
> > --- a/recipes-qt/qt5/qtscxml_git.bb
> > +++ b/recipes-qt/qt5/qtscxml_git.bb
> > @@ -10,10 +10,10 @@ require qt5-git.inc
> >
> >  DEPENDS += "qtbase qtdeclarative qtxmlpatterns qtscxml-native"
> >
> > -SRCREV = "eff82ac957e051f16f64c287f2dfaec9049bdfc1"
> > +SRCREV = "a1dff1a11ad303a1f82f181e6386194de90ec08f"
> >
> >  # Patches from https://github.com/meta-qt5/qtscxml/commits/b5.9
> > -# 5.9.meta-qt5.1
> > +# 5.9.meta-qt5.2
> >  SRC_URI += "file://0001-Use-external-host-bin-path-for-cmake-file.
> patch"
> >
> >  do_install_append_class-nativesdk() {
> > diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_
> git.bb
> > index 17d0639..8c3d925 100644
> > --- a/recipes-qt/qt5/qtsensors_git.bb
> > +++ b/recipes-qt/qt5/qtsensors_git.bb
> > @@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
> >
> >  DEPENDS += "qtbase qtdeclarative"
> >
> > -SRCREV = "0c3c4d01ea34ed98a0d2928662f07b673f00535d"
> > +SRCREV = "1673dbed00ba68209b6de95981f1e3b4a2a24682"
> > diff --git a/recipes-qt/qt5/qtserialbus_git.bb b/recipes-qt/qt5/
> qtserialbus_git.bb
> > index 93a826b..d3a83a7 100644
> > --- a/recipes-qt/qt5/qtserialbus_git.bb
> > +++ b/recipes-qt/qt5/qtserialbus_git.bb
> > @@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
> >
> >  DEPENDS += "qtbase qtserialport"
> >
> > -SRCREV = "20811e3b004af817e3f02982c755e8b1560b8c3d"
> > +SRCREV = "1d37c357c843a2622d2af7e1684576e19a8c7c30"
> > diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/
> qtserialport_git.bb
> > index 957000c..056e237 100644
> > --- a/recipes-qt/qt5/qtserialport_git.bb
> > +++ b/recipes-qt/qt5/qtserialport_git.bb
> > @@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
> >
> >  DEPENDS += "qtbase"
> >
> > -SRCREV = "687f5a9bd44a45a29d24925f29470c43d6729dee"
> > +SRCREV = "93b539140c06da07d330c9ecad67ab5ed3f9b0c8"
> > diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
> > index fb8d44e..40854e0 100644
> > --- a/recipes-qt/qt5/qtsvg_git.bb
> > +++ b/recipes-qt/qt5/qtsvg_git.bb
> > @@ -12,4 +12,4 @@ LIC_FILES_CHKSUM = " \
> >
> >  DEPENDS += "qtbase"
> >
> > -SRCREV = "4fd787e90c70afbaa168abb3efdb8757ba77f3a4"
> > +SRCREV = "0fcd0160662941a9ba800b36671e88d82790bd95"
> > diff --git a/recipes-qt/qt5/qtsystems_git.bb b/recipes-qt/qt5/qtsystems_
> git.bb
> > index 7c155a2..911a709 100644
> > --- a/recipes-qt/qt5/qtsystems_git.bb
> > +++ b/recipes-qt/qt5/qtsystems_git.bb
> > @@ -30,4 +30,4 @@ do_install_append() {
> >
> >  QT_MODULE_BRANCH = "dev"
> >
> > -SRCREV = "434af789f0d56ca7a521ca2d9ec8cf3b1057fd37"
> > +SRCREV = "f364358a817ba57fa5aa9c67e731241249e704f8"
> > diff --git a/recipes-qt/qt5/qttools/0001-add-noqtwebkit-configuration.patch
> b/recipes-qt/qt5/qttools/0001-add-noqtwebkit-configuration.patch
> > index ed25390..7549ce9 100644
> > --- a/recipes-qt/qt5/qttools/0001-add-noqtwebkit-configuration.patch
> > +++ b/recipes-qt/qt5/qttools/0001-add-noqtwebkit-configuration.patch
> > @@ -1,4 +1,4 @@
> > -From e0387540876944a20461d60d2208191c734e00b1 Mon Sep 17 00:00:00 2001
> > +From 0098107f710e363d41b4913758302b43adccf2bd Mon Sep 17 00:00:00 2001
> >  From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
> >  Date: Wed, 4 Jun 2014 11:28:16 +0200
> >  Subject: [PATCH] add noqtwebkit configuration
> > @@ -16,16 +16,16 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >   2 files changed, 3 insertions(+), 3 deletions(-)
> >
> >  diff --git a/src/assistant/assistant/assistant.pro
> b/src/assistant/assistant/assistant.pro
> > -index 540c9689..2312b521 100644
> > +index 82f55092..ef07ee03 100644
> >  --- a/src/assistant/assistant/assistant.pro
> >  +++ b/src/assistant/assistant/assistant.pro
> >  @@ -1,4 +1,4 @@
> > --false:qtHaveModule(webkitwidgets):!contains(QT_CONFIG, static) {
> > -+false:qtHaveModule(webkitwidgets):!contains(QT_CONFIG,
> static):!contains(CONFIG, noqtwebkit) {
> > -     # FIXME: currently broken
> > +-qtHaveModule(webkitwidgets):!contains(QT_CONFIG, static) {
> > ++qtHaveModule(webkitwidgets):!contains(QT_CONFIG,
> static):!contains(CONFIG, noqtwebkit) {
> >       BROWSER = qtwebkit
> >   } else {
> > -@@ -76,7 +76,7 @@ SOURCES += aboutdialog.cpp \
> > +     BROWSER = qtextbrowser
> > +@@ -75,7 +75,7 @@ SOURCES += aboutdialog.cpp \
> >       openpagesmanager.cpp \
> >       openpagesswitcher.cpp
> >
> > diff --git a/recipes-qt/qt5/qttools/0002-linguist-tools-cmake-allow-
> overriding-the-location-f.patch b/recipes-qt/qt5/qttools/0002-
> linguist-tools-cmake-allow-overriding-the-location-f.patch
> > index b2e017e..80f2ae7 100644
> > --- a/recipes-qt/qt5/qttools/0002-linguist-tools-cmake-allow-
> overriding-the-location-f.patch
> > +++ b/recipes-qt/qt5/qttools/0002-linguist-tools-cmake-allow-
> overriding-the-location-f.patch
> > @@ -1,4 +1,4 @@
> > -From 779278a109450ae84d5deb2e1e1c0dd9b737f1a2 Mon Sep 17 00:00:00 2001
> > +From 105277d4878ee1627bfb3be3d10833020e6923fc Mon Sep 17 00:00:00 2001
> >  From: Cody P Schafer <dev@codyps.com>
> >  Date: Thu, 9 Jul 2015 11:28:19 -0400
> >  Subject: [PATCH] linguist-tools cmake: allow overriding the location for
> > diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.
> bb
> > index 871b061..32d65d6 100644
> > --- a/recipes-qt/qt5/qttools_git.bb
> > +++ b/recipes-qt/qt5/qttools_git.bb
> > @@ -15,7 +15,7 @@ inherit ptest
> >  DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
> >
> >  # Patches from https://github.com/meta-qt5/qttools/commits/b5.9
> > -# 5.9.meta-qt5.1
> > +# 5.9.meta-qt5.2
> >  SRC_URI += " \
> >      file://run-ptest \
> >      file://0001-add-noqtwebkit-configuration.patch \
> > @@ -30,7 +30,7 @@ PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
> >
> >  EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG',
> 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
> >
> > -SRCREV = "88e02bb0a9b97d68a4b270e4ddfb6d0847c702a9"
> > +SRCREV = "fdc5749b5603653c5d0c59db267f44fd1609457e"
> >
> >  BBCLASSEXTEND = "native nativesdk"
> >
> > diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/
> qttranslations_git.bb
> > index 822517f..0238ce9 100644
> > --- a/recipes-qt/qt5/qttranslations_git.bb
> > +++ b/recipes-qt/qt5/qttranslations_git.bb
> > @@ -1,12 +1,9 @@
> >  require qt5.inc
> >  require qt5-git.inc
> >
> > -LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0
> | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 |
> The-Qt-Company-Commercial )"
> > +LICENSE = "GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 |
> The-Qt-Company-Commercial"
> >  LIC_FILES_CHKSUM = " \
> > -    file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
> > -    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
> > -    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
> > -    file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
> > +    file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
> >  "
> >
> >  DEPENDS += "qtbase qttools-native"
> > @@ -114,4 +111,4 @@ FILES_${PN}-qt = " \
> >      ${OE_QMAKE_PATH_TRANSLATIONS}/qt_*.qm \
> >  "
> >
> > -SRCREV = "3e727a890f7856978469ee38ef0619b1b59a8ca7"
> > +SRCREV = "325a90e07e9dce4e5c915549e6c31a86423dfdd3"
> > diff --git a/recipes-qt/qt5/qtvirtualkeyboard/0001-
> include-sys-time.h-for-timeval.patch b/recipes-qt/qt5/
> qtvirtualkeyboard/0001-include-sys-time.h-for-timeval.patch
> > index 8518ae9..c74854f 100644
> > --- a/recipes-qt/qt5/qtvirtualkeyboard/0001-include-sys-time.h-for-
> timeval.patch
> > +++ b/recipes-qt/qt5/qtvirtualkeyboard/0001-include-sys-time.h-for-
> timeval.patch
> > @@ -1,4 +1,4 @@
> > -From 78106c5b939cc7d84710fe4c8e2a356ac1f110ef Mon Sep 17 00:00:00 2001
> > +From 2e76f24615766593ad6eb182627fa9d0bdba3c2d Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Wed, 12 Jul 2017 23:59:52 -0700
> >  Subject: [PATCH] include sys/time.h for timeval
> > @@ -23,6 +23,3 @@ index 1b9673f..924be7b 100644
> >   #ifdef _WIN32
> >   #include <winsock.h> // timeval
> >   #else
> > ---
> > -2.13.2
> > -
> > diff --git a/recipes-qt/qt5/qtvirtualkeyboard_git.bb b/recipes-qt/qt5/
> qtvirtualkeyboard_git.bb
> > index ec1dc42..122d068 100644
> > --- a/recipes-qt/qt5/qtvirtualkeyboard_git.bb
> > +++ b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
> > @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = " \
> >  "
> >
> >  # Patches from https://github.com/meta-qt5/
> qtvirtualkeyboard/commits/b5.9
> > -# 5.9.meta-qt5.1
> > +# 5.9.meta-qt5.2
> >  SRC_URI += "file://0001-include-sys-time.h-for-timeval.patch"
> >
> >  # To enabled Nuance T9 Write support, you need to provide the licensed
> components
> > @@ -53,4 +53,4 @@ FILES_${PN} += "${OE_QMAKE_PATH_DATA}/
> qtvirtualkeyboard/lipi_toolkit"
> >
> >  DEPENDS += "qtbase qtdeclarative qtmultimedia qtquickcontrols qtsvg
> qtxmlpatterns"
> >
> > -SRCREV = "bdf61afe76e94ef03da1332c4540646f18f5852f"
> > +SRCREV = "dd8c39ea9312ec1441b3fdd830f9d42fe3258b58"
> > diff --git a/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch
> b/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch
> > index a86868e..11acd5f 100644
> > --- a/recipes-qt/qt5/qtwayland/0001-fix-build-without-
> xkbcommon-evdev.patch
> > +++ b/recipes-qt/qt5/qtwayland/0001-fix-build-without-
> xkbcommon-evdev.patch
> > @@ -1,4 +1,4 @@
> > -From 434be8d326adb02b7b0960481f045dc1a443cfce Mon Sep 17 00:00:00 2001
> > +From c4fae91b3d2b2b0f64e3fafac456a6a917c69e88 Mon Sep 17 00:00:00 2001
> >  From: Raphael Freudiger <laser_b@gmx.ch>
> >  Date: Tue, 10 Jan 2017 15:49:55 +0100
> >  Subject: [PATCH] fix build without xkbcommon-evdev
> > diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_
> git.bb
> > index cece86e..9847f39 100644
> > --- a/recipes-qt/qt5/qtwayland_git.bb
> > +++ b/recipes-qt/qt5/qtwayland_git.bb
> > @@ -37,10 +37,10 @@ PACKAGECONFIG[libhybris-egl-server] =
> "-feature-libhybris-egl-server,-no-feature
> >
> >  EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
> >
> > -SRCREV = "f1cf62fa8e9ffa2548c9968906848596f50dbc0b"
> > +SRCREV = "7f70da6a644bc5b690066f0ab4814e1358f57e81"
> >
> >  # Patches from https://github.com/meta-qt5/qtwayland/commits/b5.9
> > -# 5.9.meta-qt5.1
> > +# 5.9.meta-qt5.2
> >  # From https://bugreports.qt.io/browse/QTBUG-57767
> >  SRC_URI += " \
> >      file://0001-fix-build-without-xkbcommon-evdev.patch \
> > diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/
> qtwebchannel_git.bb
> > index f1167a9..7e12a33 100644
> > --- a/recipes-qt/qt5/qtwebchannel_git.bb
> > +++ b/recipes-qt/qt5/qtwebchannel_git.bb
> > @@ -3,18 +3,13 @@ require qt5-git.inc
> >
> >  LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0
> | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 |
> The-Qt-Company-Commercial )"
> >  LIC_FILES_CHKSUM = " \
> > -    file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
> > -    file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
> > -    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
> > +    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
> >      file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> >      file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
> >      file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
> > -    file://LICENSE.GPLv2;md5=c96076271561b0e3785dad260634eaa8 \
> > -    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
> > -    file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
> > -    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
> > +    file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
> >  "
> >
> >  DEPENDS += "qtdeclarative qtwebsockets"
> >
> > -SRCREV = "6383f0fc5eec4935697a6d2d2f87b511bbeb678e"
> > +SRCREV = "b5229df6a08a902b11a2fc9529af6385f4d985d5"
> > diff --git a/recipes-qt/qt5/qtwebengine/0001-chromium-Change-false-to-
> FALSE-and-1-to-TRUE-FIX-qtw.patch b/recipes-qt/qt5/qtwebengine/
> 0001-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
> > index 44c3f0b..0e9ea72 100644
> > --- a/recipes-qt/qt5/qtwebengine/0001-chromium-Change-false-to-
> FALSE-and-1-to-TRUE-FIX-qtw.patch
> > +++ b/recipes-qt/qt5/qtwebengine/0001-chromium-Change-false-to-
> FALSE-and-1-to-TRUE-FIX-qtw.patch
> > @@ -1,4 +1,4 @@
> > -From 1634633d27cea7369111c9ea6d08be8515c15ccd Mon Sep 17 00:00:00 2001
> > +From d559da6ab0834aeb7307008015b6232e586fea00 Mon Sep 17 00:00:00 2001
> >  From: Cleiton Bueno <cleitonrbueno@gmail.com>
> >  Date: Thu, 24 Dec 2015 12:46:58 -0200
> >  Subject: [PATCH] chromium: Change false to FALSE and 1 to TRUE, FIX
> > diff --git a/recipes-qt/qt5/qtwebengine/0001-functions.prf-allow-
> build-for-linux-oe-g-platform.patch b/recipes-qt/qt5/qtwebengine/
> 0001-functions.prf-allow-build-for-linux-oe-g-platform.patch
> > index a91a298..275ef9e 100644
> > --- a/recipes-qt/qt5/qtwebengine/0001-functions.prf-allow-
> build-for-linux-oe-g-platform.patch
> > +++ b/recipes-qt/qt5/qtwebengine/0001-functions.prf-allow-
> build-for-linux-oe-g-platform.patch
> > @@ -1,4 +1,4 @@
> > -From 491576d7e67d00b93106592140e5d7f0f34ea641 Mon Sep 17 00:00:00 2001
> > +From 96746f09947cc36f6c9fc8631bc6a6e7f59efe24 Mon Sep 17 00:00:00 2001
> >  From: Frieder Schrempf <frieder.schrempf@online.de>
> >  Date: Mon, 1 Dec 2014 14:34:40 +0000
> >  Subject: [PATCH] functions.prf: allow build for linux-oe-g++ platform
> > @@ -12,10 +12,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >   1 file changed, 6 insertions(+)
> >
> >  diff --git a/mkspecs/features/functions.prf
> b/mkspecs/features/functions.prf
> > -index eb421f8b..4513742d 100644
> > +index 56894e58..ef418a4c 100644
> >  --- a/mkspecs/features/functions.prf
> >  +++ b/mkspecs/features/functions.prf
> > -@@ -33,6 +33,12 @@ defineTest(isPlatformSupported) {
> > +@@ -21,6 +21,12 @@ defineTest(isPlatformSupported) {
> >         return(false)
> >       }
> >       gcc:!clang:!isGCCVersionSupported(): return(false)
> > diff --git a/recipes-qt/qt5/qtwebengine/0002-WebEngine-
> qquickwebengineview_p_p.h-add-include-QCol.patch
> b/recipes-qt/qt5/qtwebengine/0002-WebEngine-qquickwebengineview_p_p.h-add-
> include-QCol.patch
> > index d5567c3..6ada3f9 100644
> > --- a/recipes-qt/qt5/qtwebengine/0002-WebEngine-
> qquickwebengineview_p_p.h-add-include-QCol.patch
> > +++ b/recipes-qt/qt5/qtwebengine/0002-WebEngine-
> qquickwebengineview_p_p.h-add-include-QCol.patch
> > @@ -1,4 +1,4 @@
> > -From 6b48d76b5af38a49f8e438e45c387f01b263e483 Mon Sep 17 00:00:00 2001
> > +From 06e9e7844ffa2b6985e5fa7a1c475c8a54ca252a Mon Sep 17 00:00:00 2001
> >  From: Cleiton Bueno <cleitonrbueno@gmail.com>
> >  Date: Fri, 25 Dec 2015 18:16:05 -0200
> >  Subject: [PATCH] WebEngine qquickwebengineview_p_p.h add include QColor
> > @@ -9,7 +9,7 @@ Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
> >   1 file changed, 2 insertions(+)
> >
> >  diff --git a/src/webengine/api/qquickwebengineview_p_p.h
> b/src/webengine/api/qquickwebengineview_p_p.h
> > -index 2ecd70d7..703d1a92 100644
> > +index 19ecf5e1..f6f638ee 100644
> >  --- a/src/webengine/api/qquickwebengineview_p_p.h
> >  +++ b/src/webengine/api/qquickwebengineview_p_p.h
> >  @@ -59,6 +59,8 @@
> > diff --git a/recipes-qt/qt5/qtwebengine/0002-chromium-Force-host-toolchain-configuration.patch
> b/recipes-qt/qt5/qtwebengine/0002-chromium-Force-host-
> toolchain-configuration.patch
> > index 5f9eb3a..4a1a975 100644
> > --- a/recipes-qt/qt5/qtwebengine/0002-chromium-Force-host-
> toolchain-configuration.patch
> > +++ b/recipes-qt/qt5/qtwebengine/0002-chromium-Force-host-
> toolchain-configuration.patch
> > @@ -1,4 +1,4 @@
> > -From b1a6f73d49a340e99145a4c4cf70dc796ed632ff Mon Sep 17 00:00:00 2001
> > +From a0b1a742813d0846472fab4aada2388bf2d42d80 Mon Sep 17 00:00:00 2001
> >  From: Samuli Piippo <samuli.piippo@qt.io>
> >  Date: Wed, 15 Mar 2017 13:53:28 +0200
> >  Subject: [PATCH] chromium: Force host toolchain configuration
> > diff --git a/recipes-qt/qt5/qtwebengine/0003-Include-dependency-to-
> QCoreApplication-translate.patch b/recipes-qt/qt5/qtwebengine/
> 0003-Include-dependency-to-QCoreApplication-translate.patch
> > index 2fa1764..8c0484b 100644
> > --- a/recipes-qt/qt5/qtwebengine/0003-Include-dependency-to-
> QCoreApplication-translate.patch
> > +++ b/recipes-qt/qt5/qtwebengine/0003-Include-dependency-to-
> QCoreApplication-translate.patch
> > @@ -1,4 +1,4 @@
> > -From 95a6e3fd9e8498cb1f59120d402ec8ecfcd3ec59 Mon Sep 17 00:00:00 2001
> > +From bfd5e19fea1315d10b3217acaf92dfc32018ad03 Mon Sep 17 00:00:00 2001
> >  From: Cleiton Bueno <cleitonrbueno@gmail.com>
> >  Date: Thu, 24 Dec 2015 15:59:51 -0200
> >  Subject: [PATCH] Include dependency to QCoreApplication::translate()
> > diff --git a/recipes-qt/qt5/qtwebengine/0003-chromium-musl-sandbox-
> Define-TEMP_FAILURE_RETRY-if-n.patch b/recipes-qt/qt5/qtwebengine/
> 0003-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
> > index 8785842..d3c7a31 100644
> > --- a/recipes-qt/qt5/qtwebengine/0003-chromium-musl-sandbox-
> Define-TEMP_FAILURE_RETRY-if-n.patch
> > +++ b/recipes-qt/qt5/qtwebengine/0003-chromium-musl-sandbox-
> Define-TEMP_FAILURE_RETRY-if-n.patch
> > @@ -1,4 +1,4 @@
> > -From 8910e65fd777120261f16c4a35ace2b0dc6181b3 Mon Sep 17 00:00:00 2001
> > +From 6d4d1b4cd380c51a6709c97524fbce0e0f09ce39 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Fri, 7 Jul 2017 14:01:12 -0700
> >  Subject: [PATCH] chromium: musl: sandbox: Define TEMP_FAILURE_RETRY if
> not
> > diff --git a/recipes-qt/qt5/qtwebengine/0004-Force-host-toolchain-configuration.patch
> b/recipes-qt/qt5/qtwebengine/0004-Force-host-toolchain-configuration.patch
> > index 142595a..258afd5 100644
> > --- a/recipes-qt/qt5/qtwebengine/0004-Force-host-toolchain-
> configuration.patch
> > +++ b/recipes-qt/qt5/qtwebengine/0004-Force-host-toolchain-
> configuration.patch
> > @@ -1,4 +1,4 @@
> > -From e81f0a5139f8f1ea131438def3fe1aabe997aeff Mon Sep 17 00:00:00 2001
> > +From 5106be504b7edb7bc75309d581dfd33a89ed04fc Mon Sep 17 00:00:00 2001
> >  From: Samuli Piippo <samuli.piippo@qt.io>
> >  Date: Wed, 15 Mar 2017 13:53:28 +0200
> >  Subject: [PATCH] Force host toolchain configuration
> > @@ -13,10 +13,10 @@ Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> >   1 file changed, 6 insertions(+), 6 deletions(-)
> >
> >  diff --git a/src/buildtools/configure_host.pro b/src/buildtools/
> configure_host.pro
> > -index fd27643e..f9acb6ff 100644
> > +index f1b3d47b..521c507b 100644
> >  --- a/src/buildtools/configure_host.pro
> >  +++ b/src/buildtools/configure_host.pro
> > -@@ -28,9 +28,9 @@ GN_CONTENTS = \
> > +@@ -29,9 +29,9 @@ GN_CONTENTS = \
> >   "import(\"//build/config/sysroot.gni\")" \
> >   "import(\"//build/toolchain/gcc_toolchain.gni\")" \
> >   "gcc_toolchain(\"host\") {" \
> > @@ -29,7 +29,7 @@ index fd27643e..f9acb6ff 100644
> >   "  ar = \"$$which(ar)\" " \
> >   "  nm = \"$$which(nm)\" " \
> >   "  toolchain_args = { " \
> > -@@ -41,9 +41,9 @@ GN_CONTENTS = \
> > +@@ -42,9 +42,9 @@ GN_CONTENTS = \
> >   "  } " \
> >   "}" \
> >   "gcc_toolchain(\"v8_snapshot\") {" \
> > diff --git a/recipes-qt/qt5/qtwebengine/0004-chromium-musl-Avoid-
> mallinfo-APIs-on-non-glibc-linux.patch b/recipes-qt/qt5/qtwebengine/
> 0004-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
> > index 05b813b..71e36bb 100644
> > --- a/recipes-qt/qt5/qtwebengine/0004-chromium-musl-Avoid-
> mallinfo-APIs-on-non-glibc-linux.patch
> > +++ b/recipes-qt/qt5/qtwebengine/0004-chromium-musl-Avoid-
> mallinfo-APIs-on-non-glibc-linux.patch
> > @@ -1,4 +1,4 @@
> > -From 86f467724070e854c8c6b13269951c97c0832dae Mon Sep 17 00:00:00 2001
> > +From 6d92d4b6f7adf913da77b4aae837a5880e64aa21 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Fri, 7 Jul 2017 14:09:06 -0700
> >  Subject: [PATCH] chromium: musl: Avoid mallinfo() APIs on
> non-glibc/linux
> > diff --git a/recipes-qt/qt5/qtwebengine/0005-Always-compile-QWebEnginePage-print.patch
> b/recipes-qt/qt5/qtwebengine/0005-Always-compile-
> QWebEnginePage-print.patch
> > deleted file mode 100644
> > index c63086d..0000000
> > --- a/recipes-qt/qt5/qtwebengine/0005-Always-compile-
> QWebEnginePage-print.patch
> > +++ /dev/null
> > @@ -1,241 +0,0 @@
> > -From a8c0deca850ca519b3f146c71492a8f42a33dd84 Mon Sep 17 00:00:00 2001
> > -From: =?UTF-8?q?J=C3=BCri=20Valdmann?= <juri.valdmann@qt.io>
> > -Date: Tue, 20 Jun 2017 15:36:43 +0200
> > -Subject: [PATCH] Always compile QWebEnginePage::print
> > -
> > -- Remove two out of five layers of ifdefs around and inside this method.
> > -- Now always compiled but will yield an error if printing is disabled.
> > -- Remove printing-related ifdefs from demobrowser.
> > -
> > -Task-number: QTBUG-61510
> > -Change-Id: I79781189d3d3fb62db0a2216b2b989e3fa1d1f86
> > -Reviewed-by: Allan Sandfeld Jensen <allan.jensen@qt.io>
> > -Reviewed-by: Rolf Eike Beer <eb@emlix.com>
> > ----
> > - examples/webenginewidgets/demobrowser/browsermainwindow.cpp | 12
> ------------
> > - examples/webenginewidgets/demobrowser/browsermainwindow.h   |  6
> ------
> > - examples/webenginewidgets/demobrowser/printtopdfdialog.cpp  |  7
> -------
> > - src/webenginewidgets/api/qwebenginepage.cpp                 | 10
> ++--------
> > - src/webenginewidgets/api/qwebenginepage.h                   |  8
> --------
> > - 5 files changed, 2 insertions(+), 41 deletions(-)
> > -
> > -diff --git a/examples/webenginewidgets/demobrowser/browsermainwindow.cpp
> b/examples/webenginewidgets/demobrowser/browsermainwindow.cpp
> > -index 327d7a9d..14d49f7f 100644
> > ---- a/examples/webenginewidgets/demobrowser/browsermainwindow.cpp
> > -+++ b/examples/webenginewidgets/demobrowser/browsermainwindow.cpp
> > -@@ -109,9 +109,7 @@ BrowserMainWindow::BrowserMainWindow(QWidget
> *parent, Qt::WindowFlags flags)
> > -     , m_historyForward(0)
> > -     , m_stop(0)
> > -     , m_reload(0)
> > --#ifndef QT_NO_PRINTER
> > -     , m_currentPrinter(nullptr)
> > --#endif
> > - {
> > -     setToolButtonStyle(Qt::ToolButtonFollowStyle);
> > -     setAttribute(Qt::WA_DeleteOnClose, true);
> > -@@ -312,9 +310,7 @@ void BrowserMainWindow::setupMenu()
> > - #if defined(QWEBENGINEPAGE_PRINT)
> > -     fileMenu->addAction(tr("P&rint Preview..."), this,
> SLOT(slotFilePrintPreview()));
> > - #endif
> > --#ifndef QT_NO_PRINTER
> > -     fileMenu->addAction(tr("&Print..."), this, SLOT(slotFilePrint()),
> QKeySequence::Print);
> > --#endif
> > -     fileMenu->addAction(tr("&Print to PDF..."), this,
> SLOT(slotFilePrintToPDF()));
> > -     fileMenu->addSeparator();
> > -
> > -@@ -702,23 +698,19 @@ void BrowserMainWindow::slotFileOpen()
> > -
> > - void BrowserMainWindow::slotFilePrintPreview()
> > - {
> > --#ifndef QT_NO_PRINTPREVIEWDIALOG
> > -     if (!currentTab())
> > -         return;
> > -     QPrintPreviewDialog *dialog = new QPrintPreviewDialog(this);
> > -     connect(dialog, SIGNAL(paintRequested(QPrinter*)),
> > -             currentTab(), SLOT(print(QPrinter*)));
> > -     dialog->exec();
> > --#endif
> > - }
> > -
> > - void BrowserMainWindow::slotFilePrint()
> > - {
> > --#ifndef QT_NO_PRINTER
> > -     if (!currentTab())
> > -         return;
> > -     printRequested(currentTab()->page());
> > --#endif
> > - }
> > -
> > - void BrowserMainWindow::slotHandlePdfPrinted(const QByteArray& result)
> > -@@ -751,7 +743,6 @@ void BrowserMainWindow::slotFilePrintToPDF()
> > -     currentTab()->page()->printToPdf(invoke(this, &BrowserMainWindow::slotHandlePdfPrinted),
> dialog->pageLayout());
> > - }
> > -
> > --#ifndef QT_NO_PRINTER
> > - void BrowserMainWindow::slotHandlePagePrinted(bool result)
> > - {
> > -     Q_UNUSED(result);
> > -@@ -763,7 +754,6 @@ void BrowserMainWindow::slotHandlePagePrinted(bool
> result)
> > -
> > - void BrowserMainWindow::printRequested(QWebEnginePage *page)
> > - {
> > --#ifndef QT_NO_PRINTDIALOG
> > -     if (m_currentPrinter)
> > -         return;
> > -     m_currentPrinter = new QPrinter();
> > -@@ -774,9 +764,7 @@ void BrowserMainWindow::printRequested(QWebEnginePage
> *page)
> > -         return;
> > -     }
> > -     page->print(m_currentPrinter, invoke(this, &BrowserMainWindow::
> slotHandlePagePrinted));
> > --#endif
> > - }
> > --#endif
> > -
> > - void BrowserMainWindow::slotPrivateBrowsing()
> > - {
> > -diff --git a/examples/webenginewidgets/demobrowser/browsermainwindow.h
> b/examples/webenginewidgets/demobrowser/browsermainwindow.h
> > -index 91e1c1d2..5bbbb292 100644
> > ---- a/examples/webenginewidgets/demobrowser/browsermainwindow.h
> > -+++ b/examples/webenginewidgets/demobrowser/browsermainwindow.h
> > -@@ -56,9 +56,7 @@
> > - #include <QtCore/QUrl>
> > -
> > - QT_BEGIN_NAMESPACE
> > --#ifndef QT_NO_PRINTER
> > - class QPrinter;
> > --#endif
> > - class QWebEnginePage;
> > - QT_END_NAMESPACE
> > -
> > -@@ -142,10 +140,8 @@ private slots:
> > -     void slotSwapFocus();
> > -     void slotHandlePdfPrinted(const QByteArray&);
> > -
> > --#ifndef QT_NO_PRINTER
> > -     void slotHandlePagePrinted(bool result);
> > -     void printRequested(QWebEnginePage *page);
> > --#endif
> > -     void geometryChangeRequested(const QRect &geometry);
> > -     void updateToolbarActionText(bool visible);
> > -     void updateBookmarksToolbarActionText(bool visible);
> > -@@ -180,9 +176,7 @@ private:
> > -     QAction *m_restoreLastSession;
> > -     QAction *m_addBookmark;
> > -
> > --#ifndef QT_NO_PRINTER
> > -     QPrinter *m_currentPrinter;
> > --#endif
> > -
> > -     QIcon m_reloadIcon;
> > -     QIcon m_stopIcon;
> > -diff --git a/examples/webenginewidgets/demobrowser/printtopdfdialog.cpp
> b/examples/webenginewidgets/demobrowser/printtopdfdialog.cpp
> > -index 0f3b1765..50a8bb91 100644
> > ---- a/examples/webenginewidgets/demobrowser/printtopdfdialog.cpp
> > -+++ b/examples/webenginewidgets/demobrowser/printtopdfdialog.cpp
> > -@@ -52,10 +52,8 @@
> > - #include "ui_printtopdfdialog.h"
> > -
> > - #include <QtCore/QDir>
> > --#ifndef QT_NO_PRINTER
> > - #include <QtPrintSupport/QPageSetupDialog>
> > - #include <QtPrintSupport/QPrinter>
> > --#endif // QT_NO_PRINTER
> > - #include <QtWidgets/QFileDialog>
> > -
> > - PrintToPdfDialog::PrintToPdfDialog(const QString &filePath, QWidget
> *parent) :
> > -@@ -66,11 +64,8 @@ PrintToPdfDialog::PrintToPdfDialog(const QString
> &filePath, QWidget *parent) :
> > -     ui->setupUi(this);
> > -     setWindowFlags(windowFlags() & ~Qt::WindowContextHelpButtonHint);
> > -     connect(ui->chooseFilePathButton, &QToolButton::clicked, this,
> &PrintToPdfDialog::onChooseFilePathButtonClicked);
> > --#ifndef QT_NO_PRINTER
> > -     connect(ui->choosePageLayoutButton, &QToolButton::clicked, this,
> &PrintToPdfDialog::onChoosePageLayoutButtonClicked);
> > --#else
> > -     ui->choosePageLayoutButton->hide();
> > --#endif // QT_NO_PRINTER
> > -     updatePageLayoutLabel();
> > -     setFilePath(filePath);
> > - }
> > -@@ -82,7 +77,6 @@ PrintToPdfDialog::~PrintToPdfDialog()
> > -
> > - void PrintToPdfDialog::onChoosePageLayoutButtonClicked()
> > - {
> > --#ifndef QT_NO_PRINTER
> > -     QPrinter printer;
> > -     printer.setPageLayout(currentPageLayout);
> > -
> > -@@ -92,7 +86,6 @@ void PrintToPdfDialog::onChoosePageLayoutButtonClicke
> d()
> > -     currentPageLayout.setPageSize(printer.pageLayout().pageSize());
> > -     currentPageLayout.setOrientation(printer.
> pageLayout().orientation());
> > -     updatePageLayoutLabel();
> > --#endif // QT_NO_PRINTER
> > - }
> > -
> > - void PrintToPdfDialog::onChooseFilePathButtonClicked()
> > -diff --git a/src/webenginewidgets/api/qwebenginepage.cpp
> b/src/webenginewidgets/api/qwebenginepage.cpp
> > -index 82720ae3..20d3268c 100644
> > ---- a/src/webenginewidgets/api/qwebenginepage.cpp
> > -+++ b/src/webenginewidgets/api/qwebenginepage.cpp
> > -@@ -80,11 +80,9 @@
> > - #include <QMenu>
> > - #include <QMessageBox>
> > - #include <QMimeData>
> > --#if defined(QT_PRINTSUPPORT_LIB)
> > --#ifndef QT_NO_PRINTER
> > -+#ifdef ENABLE_PRINTING
> > - #include <QPrinter>
> > --#endif //QT_NO_PRINTER
> > --#endif //QT_PRINTSUPPORT_LIB
> > -+#endif
> > - #include <QStandardPaths>
> > - #include <QStyle>
> > - #include <QTimer>
> > -@@ -2052,8 +2050,6 @@ void QWebEnginePage::printToPdf(const
> QWebEngineCallback<const QByteArray&> &res
> > - #endif // if defined(ENABLE_PDF)
> > - }
> > -
> > --#if defined(QT_PRINTSUPPORT_LIB)
> > --#ifndef QT_NO_PRINTER
> > - /*!
> > -     \fn void QWebEnginePage::print(QPrinter *printer, FunctorOrLambda
> resultCallback)
> > -     Renders the current content of the page into a temporary PDF
> document, then prints it using \a printer.
> > -@@ -2090,8 +2086,6 @@ void QWebEnginePage::print(QPrinter *printer,
> const QWebEngineCallback<bool> &re
> > -     d->m_callbacks.invokeDirectly(resultCallback, false);
> > - #endif // if defined(ENABLE_PDF)
> > - }
> > --#endif // if defined(QT_NO_PRINTER)
> > --#endif // if defined(QT_PRINTSUPPORT_LIB)
> > -
> > - /*!
> > -     \since 5.7
> > -diff --git a/src/webenginewidgets/api/qwebenginepage.h
> b/src/webenginewidgets/api/qwebenginepage.h
> > -index c7d5a19e..5619639c 100644
> > ---- a/src/webenginewidgets/api/qwebenginepage.h
> > -+++ b/src/webenginewidgets/api/qwebenginepage.h
> > -@@ -55,11 +55,7 @@
> > -
> > - QT_BEGIN_NAMESPACE
> > - class QMenu;
> > --#if defined(QT_PRINTSUPPORT_LIB)
> > --#ifndef QT_NO_PRINTER
> > - class QPrinter;
> > --#endif // QT_NO_PRINTER
> > --#endif // QT_PRINTSUPPORT_LIB
> > -
> > - class QWebChannel;
> > - class QWebEngineContextMenuData;
> > -@@ -294,15 +290,11 @@ public:
> > -     void printToPdf(const QWebEngineCallback<const QByteArray&>
> &resultCallback, const QPageLayout &layout = QPageLayout(QPageSize(QPageSize::A4),
> QPageLayout::Portrait, QMarginsF()));
> > - #endif
> > -
> > --#if defined(QT_PRINTSUPPORT_LIB)
> > --#ifndef QT_NO_PRINTER
> > - #ifdef Q_QDOC
> > -     void print(QPrinter *printer, FunctorOrLambda resultCallback);
> > - #else
> > -     void print(QPrinter *printer, const QWebEngineCallback<bool>
> &resultCallback);
> > - #endif // QDOC
> > --#endif // QT_NO_PRINTER
> > --#endif // QT_PRINTSUPPORT_LIB
> > -
> > -     const QWebEngineContextMenuData &contextMenuData() const;
> > -
> > diff --git a/recipes-qt/qt5/qtwebengine/0005-chromium-musl-include-fcntl.h-for-loff_t.patch
> b/recipes-qt/qt5/qtwebengine/0005-chromium-musl-include-
> fcntl.h-for-loff_t.patch
> > index 2d7bd02..00c875b 100644
> > --- a/recipes-qt/qt5/qtwebengine/0005-chromium-musl-include-
> fcntl.h-for-loff_t.patch
> > +++ b/recipes-qt/qt5/qtwebengine/0005-chromium-musl-include-
> fcntl.h-for-loff_t.patch
> > @@ -1,4 +1,4 @@
> > -From 0a409a773f2b2936a2f1868d983e7bd1c92110bd Mon Sep 17 00:00:00 2001
> > +From 8780db69819ba37c8e2364ba361b03badf3c3ee4 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Fri, 7 Jul 2017 14:37:49 -0700
> >  Subject: [PATCH] chromium: musl: include fcntl.h for loff_t
> > diff --git a/recipes-qt/qt5/qtwebengine/0006-chromium-musl-use-off64_
> t-instead-of-the-internal-__.patch b/recipes-qt/qt5/qtwebengine/
> 0006-chromium-musl-use-off64_t-instead-of-the-internal-__.patch
> > index f58de8f..085cb01 100644
> > --- a/recipes-qt/qt5/qtwebengine/0006-chromium-musl-use-off64_
> t-instead-of-the-internal-__.patch
> > +++ b/recipes-qt/qt5/qtwebengine/0006-chromium-musl-use-off64_
> t-instead-of-the-internal-__.patch
> > @@ -1,4 +1,4 @@
> > -From 375b70a99760c156b45e60def9bafd04902fb5a4 Mon Sep 17 00:00:00 2001
> > +From b360b036bb1ad31a74c056ce5d19e0271d75ff57 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Fri, 7 Jul 2017 14:38:37 -0700
> >  Subject: [PATCH] chromium: musl: use off64_t instead of the internal
> __off64_t
> > diff --git a/recipes-qt/qt5/qtwebengine/0007-chromium-musl-linux-
> glibc-make-the-distinction.patch b/recipes-qt/qt5/qtwebengine/
> 0007-chromium-musl-linux-glibc-make-the-distinction.patch
> > index c3b1cbb..e23cabe 100644
> > --- a/recipes-qt/qt5/qtwebengine/0007-chromium-musl-linux-
> glibc-make-the-distinction.patch
> > +++ b/recipes-qt/qt5/qtwebengine/0007-chromium-musl-linux-
> glibc-make-the-distinction.patch
> > @@ -1,4 +1,4 @@
> > -From 314cfb7b41be8fc4f962956e0acd34f110114c6e Mon Sep 17 00:00:00 2001
> > +From 455a6603a33a87dfb7ab85a09587f534d9f5d984 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Fri, 7 Jul 2017 14:54:38 -0700
> >  Subject: [PATCH] chromium: musl: linux != glibc, make the distinction
> > diff --git a/recipes-qt/qt5/qtwebengine/0008-chromium-musl-allocator-
> Do-not-include-glibc_weak_sy.patch b/recipes-qt/qt5/qtwebengine/
> 0008-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch
> > index 550fd79..53e8a81 100644
> > --- a/recipes-qt/qt5/qtwebengine/0008-chromium-musl-allocator-
> Do-not-include-glibc_weak_sy.patch
> > +++ b/recipes-qt/qt5/qtwebengine/0008-chromium-musl-allocator-
> Do-not-include-glibc_weak_sy.patch
> > @@ -1,4 +1,4 @@
> > -From bc3745992889e3dc3b42c890b6a458038c6994e0 Mon Sep 17 00:00:00 2001
> > +From aa3bfc656b3c84aba04c8294ad17c630141f4b09 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Fri, 7 Jul 2017 15:09:02 -0700
> >  Subject: [PATCH] chromium: musl: allocator: Do not include
> glibc_weak_symbols
> > diff --git a/recipes-qt/qt5/qtwebengine/0009-chromium-musl-Use-
> correct-member-name-__si_fields-fr.patch b/recipes-qt/qt5/qtwebengine/
> 0009-chromium-musl-Use-correct-member-name-__si_fields-fr.patch
> > index 82a2ccc..385e729 100644
> > --- a/recipes-qt/qt5/qtwebengine/0009-chromium-musl-Use-
> correct-member-name-__si_fields-fr.patch
> > +++ b/recipes-qt/qt5/qtwebengine/0009-chromium-musl-Use-
> correct-member-name-__si_fields-fr.patch
> > @@ -1,4 +1,4 @@
> > -From de4e672044de11c5927aeb42a554f5eced0abf6c Mon Sep 17 00:00:00 2001
> > +From 85b21493f19bd2046f84836e03f0a9c32862bce8 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Fri, 7 Jul 2017 15:12:39 -0700
> >  Subject: [PATCH] chromium: musl: Use correct member name __si_fields
> from
> > diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/
> qtwebengine_git.bb
> > index 9879749..2815cb9 100644
> > --- a/recipes-qt/qt5/qtwebengine_git.bb
> > +++ b/recipes-qt/qt5/qtwebengine_git.bb
> > @@ -16,7 +16,7 @@ DEPENDS += " \
> >      ninja-native \
> >      yasm-native \
> >      qtwebchannel \
> > -    qtbase qtdeclarative qtxmlpatterns qtquickcontrols \
> > +    qtbase qtdeclarative qtxmlpatterns qtquickcontrols qtquickcontrols2
> \
> >      qtlocation \
> >      libdrm fontconfig pixman openssl pango cairo icu pciutils \
> >      libcap \
> > @@ -130,18 +130,17 @@ RDEPENDS_${PN}-examples += " \
> >  QT_MODULE_BRANCH_CHROMIUM = "56-based"
> >
> >  # Patches from https://github.com/meta-qt5/qtwebengine/commits/b5.9
> > -# 5.9.meta-qt5.1
> > +# 5.9.meta-qt5.2
> >  SRC_URI += " \
> >      ${QT_GIT}/qtwebengine-chromium.git;name=chromium;
> branch=${QT_MODULE_BRANCH_CHROMIUM};protocol=${QT_GIT_
> PROTOCOL};destsuffix=git/src/3rdparty \
> >      file://0001-functions.prf-allow-build-for-linux-oe-g-platform.patch
> \
> >      file://0002-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
> \
> >      file://0003-Include-dependency-to-QCoreApplication-translate.patch
> \
> >      file://0004-Force-host-toolchain-configuration.patch \
> > -    file://0005-Always-compile-QWebEnginePage-print.patch \
> >  "
> >
> >  # Patches from https://github.com/meta-qt5/
> qtwebengine-chromium/commits/56-based
> > -# 56-based.meta-qt5.1
> > +# 56-based.meta-qt5.2
> >  SRC_URI += " \
> >      file://0001-chromium-Change-false-to-FALSE-and-1-to-TRUE-
> FIX-qtw.patch;patchdir=src/3rdparty \
> >      file://0002-chromium-Force-host-toolchain-configuration.patch;patchdir=src/3rdparty
> \
> > @@ -163,8 +162,8 @@ SRC_URI_append_libc-musl = "\
> >      file://0015-chromium-musl-tcmalloc-Use-off64_t-insread-
> of-__off6.patch;patchdir=src/3rdparty \
> >  "
> >
> > -SRCREV_qtwebengine = "73f7be5b2a95eab3dce11caede538eeb7beb71f2"
> > -SRCREV_chromium = "aa2fdd6be3d465280d2a0c3aacdc738bb4ffec05"
> > +SRCREV_qtwebengine = "99f84ffd2c0c78014a24534a863aa1c755abd51c"
> > +SRCREV_chromium = "21508b5b5421f10ba8627c3c66c5281efb39b2f9"
> >  SRCREV = "${SRCREV_qtwebengine}"
> >
> >  SRCREV_FORMAT = "qtwebengine_chromium"
> > diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/
> qtwebkit-examples_git.bb
> > index 286aeca..3e3e4a0 100644
> > --- a/recipes-qt/qt5/qtwebkit-examples_git.bb
> > +++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
> > @@ -17,4 +17,4 @@ DEPENDS += "qtwebkit qtxmlpatterns"
> >  RDEPENDS_${PN}-examples += "qtwebkit-qmlplugins"
> >  RDEPENDS_${PN}-examples += "${@bb.utils.contains('PACKAGECONFIG_OPENSSL',
> 'openssl', 'ca-certificates', '', d)}"
> >
> > -SRCREV = "822426abc77a74752b0ee0da4d0a1c106c4dac22"
> > +SRCREV = "a24c780b60d7d8bc00c4a48042cf7f32db777d55"
> > diff --git a/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
> b/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
> > index d393dc4..764b030 100644
> > --- a/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
> > +++ b/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
> > @@ -1,4 +1,4 @@
> > -From f8bcac01fd5d95d0df8342809c53917aff1bf798 Mon Sep 17 00:00:00 2001
> > +From c4e691a8dd2037d9b359e0de9d4790da9078f74e Mon Sep 17 00:00:00 2001
> >  From: Trevor Woerner <trevor.woerner@linaro.org>
> >  Date: Fri, 7 Feb 2014 04:07:17 +0100
> >  Subject: [PATCH] qtwebkit: fix QA issue (bad RPATH)
> > diff --git a/recipes-qt/qt5/qtwebkit/0002-Exclude-backtrace-API-for-non-glibc-libraries.patch
> b/recipes-qt/qt5/qtwebkit/0002-Exclude-backtrace-API-
> for-non-glibc-libraries.patch
> > index 147a7ba..cec6376 100644
> > --- a/recipes-qt/qt5/qtwebkit/0002-Exclude-backtrace-API-
> for-non-glibc-libraries.patch
> > +++ b/recipes-qt/qt5/qtwebkit/0002-Exclude-backtrace-API-
> for-non-glibc-libraries.patch
> > @@ -1,4 +1,4 @@
> > -From 5d4f3219be0b66d63765e077644a51e18b1f4502 Mon Sep 17 00:00:00 2001
> > +From fc2773961eaa536e6a617ded7c1a972d979fa2e4 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Fri, 5 Jun 2015 19:55:05 -0700
> >  Subject: [PATCH] Exclude backtrace() API for non-glibc libraries
> > diff --git a/recipes-qt/qt5/qtwebkit/0003-Fix-compilation-with-ICU-59.patch
> b/recipes-qt/qt5/qtwebkit/0003-Fix-compilation-with-ICU-59.patch
> > deleted file mode 100644
> > index debbda1..0000000
> > --- a/recipes-qt/qt5/qtwebkit/0003-Fix-compilation-with-ICU-59.patch
> > +++ /dev/null
> > @@ -1,89 +0,0 @@
> > -From 240bd33ba3e78fcc0e5e3299d9e0e53299ea07f8 Mon Sep 17 00:00:00 2001
> > -From: Konstantin Tokarev <annulen@yandex.ru>
> > -Date: Thu, 4 May 2017 15:12:37 +0300
> > -Subject: [PATCH] Fix compilation with ICU 59
> > -
> > -Upstream fix: https://bugs.webkit.org/show_bug.cgi?id=171612
> > -
> > -Task-number: QTBUG-60532
> > -Change-Id: I6014feea213aa70ebe40b09d9d1a03fd1ed3c843
> > -Reviewed-by: Allan Sandfeld Jensen <allan.jensen@qt.io>
> > ----
> > - Source/JavaScriptCore/API/JSStringRef.cpp        | 6 +++---
> > - Source/JavaScriptCore/runtime/DateConversion.cpp | 3 ++-
> > - Source/WTF/wtf/TypeTraits.h                      | 3 +++
> > - Source/WebKit2/Shared/API/c/WKString.cpp         | 2 +-
> > - 4 files changed, 9 insertions(+), 5 deletions(-)
> > -
> > -diff --git a/Source/JavaScriptCore/API/JSStringRef.cpp
> b/Source/JavaScriptCore/API/JSStringRef.cpp
> > -index 812f3d413..77a3fd0f4 100644
> > ---- a/Source/JavaScriptCore/API/JSStringRef.cpp
> > -+++ b/Source/JavaScriptCore/API/JSStringRef.cpp
> > -@@ -37,7 +37,7 @@ using namespace WTF::Unicode;
> > - JSStringRef JSStringCreateWithCharacters(const JSChar* chars, size_t
> numChars)
> > - {
> > -     initializeThreading();
> > --    return OpaqueJSString::create(chars, numChars).leakRef();
> > -+    return OpaqueJSString::create(reinterpret_cast<const
> UChar*>(chars), numChars).leakRef();
> > - }
> > -
> > - JSStringRef JSStringCreateWithUTF8CString(const char* string)
> > -@@ -62,7 +62,7 @@ JSStringRef JSStringCreateWithUTF8CString(const
> char* string)
> > - JSStringRef JSStringCreateWithCharactersNoCopy(const JSChar* chars,
> size_t numChars)
> > - {
> > -     initializeThreading();
> > --    return OpaqueJSString::create(StringImpl::createWithoutCopying(chars,
> numChars, WTF::DoesNotHaveTerminatingNullCharacter)).leakRef();
> > -+    return OpaqueJSString::create(StringImpl::createWithoutCopying(reinterpret_cast<const
> UChar*>(chars), numChars, WTF::DoesNotHaveTerminatingNullChar
> acter)).leakRef();
> > - }
> > -
> > - JSStringRef JSStringRetain(JSStringRef string)
> > -@@ -83,7 +83,7 @@ size_t JSStringGetLength(JSStringRef string)
> > -
> > - const JSChar* JSStringGetCharactersPtr(JSStringRef string)
> > - {
> > --    return string->characters();
> > -+    return reinterpret_cast<const JSChar*>(string->characters());
> > - }
> > -
> > - size_t JSStringGetMaximumUTF8CStringSize(JSStringRef string)
> > -diff --git a/Source/JavaScriptCore/runtime/DateConversion.cpp
> b/Source/JavaScriptCore/runtime/DateConversion.cpp
> > -index 0b57f012d..05e27338b 100644
> > ---- a/Source/JavaScriptCore/runtime/DateConversion.cpp
> > -+++ b/Source/JavaScriptCore/runtime/DateConversion.cpp
> > -@@ -107,7 +107,8 @@ String formatDateTime(const GregorianDateTime& t,
> DateTimeFormat format, bool as
> > - #if OS(WINDOWS)
> > -             TIME_ZONE_INFORMATION timeZoneInformation;
> > -             GetTimeZoneInformation(&timeZoneInformation);
> > --            const WCHAR* timeZoneName = t.isDST() ?
> timeZoneInformation.DaylightName : timeZoneInformation.StandardName;
> > -+            const WCHAR* winTimeZoneName = t.isDST() ?
> timeZoneInformation.DaylightName : timeZoneInformation.StandardName;
> > -+            String timeZoneName(reinterpret_cast<const
> UChar*>(winTimeZoneName));
> > - #else
> > -             struct tm gtm = t;
> > -             char timeZoneName[70];
> > -diff --git a/Source/WTF/wtf/TypeTraits.h b/Source/WTF/wtf/TypeTraits.h
> > -index 9df2c95cf..f5d6121fd 100644
> > ---- a/Source/WTF/wtf/TypeTraits.h
> > -+++ b/Source/WTF/wtf/TypeTraits.h
> > -@@ -72,6 +72,9 @@ namespace WTF {
> > -     template<> struct IsInteger<unsigned long>      { static const
> bool value = true; };
> > -     template<> struct IsInteger<long long>          { static const
> bool value = true; };
> > -     template<> struct IsInteger<unsigned long long> { static const
> bool value = true; };
> > -+#if __cplusplus >= 201103L || defined(__GXX_EXPERIMENTAL_CXX0X__) ||
> (defined(_HAS_CHAR16_T_LANGUAGE_SUPPORT) && _HAS_CHAR16_T_LANGUAGE_
> SUPPORT)
> > -+    template<> struct IsInteger<char16_t>           { static const
> bool value = true; };
> > -+#endif
> > - #if !COMPILER(MSVC) || defined(_NATIVE_WCHAR_T_DEFINED)
> > -     template<> struct IsInteger<wchar_t>            { static const
> bool value = true; };
> > - #endif
> > -diff --git a/Source/WebKit2/Shared/API/c/WKString.cpp
> b/Source/WebKit2/Shared/API/c/WKString.cpp
> > -index cbac67dd8..23400a64e 100644
> > ---- a/Source/WebKit2/Shared/API/c/WKString.cpp
> > -+++ b/Source/WebKit2/Shared/API/c/WKString.cpp
> > -@@ -55,7 +55,7 @@ size_t WKStringGetLength(WKStringRef stringRef)
> > - size_t WKStringGetCharacters(WKStringRef stringRef, WKChar* buffer,
> size_t bufferLength)
> > - {
> > -     COMPILE_ASSERT(sizeof(WKChar) == sizeof(UChar),
> WKStringGetCharacters_sizeof_WKChar_matches_UChar);
> > --    return (toImpl(stringRef)->getCharacters(static_cast<UChar*>(buffer),
> bufferLength));
> > -+    return (toImpl(stringRef)->getCharacters(reinterpret_cast<UChar*>(buffer),
> bufferLength));
> > - }
> > -
> > - size_t WKStringGetMaximumUTF8CStringSize(WKStringRef stringRef)
> > diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/
> qtwebkit_git.bb
> > index 0792c4a..8b3c3f5 100644
> > --- a/recipes-qt/qt5/qtwebkit_git.bb
> > +++ b/recipes-qt/qt5/qtwebkit_git.bb
> > @@ -19,11 +19,10 @@ ARM_INSTRUCTION_SET_armv4 = "arm"
> >  ARM_INSTRUCTION_SET_armv5 = "arm"
> >
> >  # Patches from https://github.com/meta-qt5/qtwebkit/commits/b5.9
> > -# 5.9.meta-qt5.1
> > +# 5.9.meta-qt5.2
> >  SRC_URI += "\
> >      file://0001-qtwebkit-fix-QA-issue-bad-RPATH.patch \
> >      file://0002-Exclude-backtrace-API-for-non-glibc-libraries.patch \
> > -    file://0003-Fix-compilation-with-ICU-59.patch \
> >  "
> >
> >  PACKAGECONFIG ??= "gstreamer qtlocation qtmultimedia qtsensors
> qtwebchannel \
> > @@ -88,4 +87,4 @@ PACKAGES_remove = "${PN}-examples-dev
> ${PN}-examples-staticdev ${PN}-examples-db
> >  RUBY_SYS = "${@ '${BUILD_SYS}'.replace('i486', 'i386').replace('i586',
> 'i386').replace('i686', 'i386') }"
> >  export RUBYLIB="${STAGING_DATADIR_NATIVE}/rubygems:${STAGING_
> LIBDIR_NATIVE}/ruby:${STAGING_LIBDIR_NATIVE}/ruby/${RUBY_SYS}"
> >
> > -SRCREV = "f27089657a207ef8c5c9d27d661d3d12c3af8df2"
> > +SRCREV = "97c4a80a1282c8c3eaa343011286b76fd4838c5f"
> > diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/
> qtwebsockets_git.bb
> > index 41ec27f..448ce5c 100644
> > --- a/recipes-qt/qt5/qtwebsockets_git.bb
> > +++ b/recipes-qt/qt5/qtwebsockets_git.bb
> > @@ -1,14 +1,14 @@
> >  require qt5.inc
> >  require qt5-git.inc
> >
> > -LICENSE = "GFDL-1.3 & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1
> | LGPL-3.0)"
> > +LICENSE = "GFDL-1.3 & (GPL-3 | LGPL-3.0)"
> >  LIC_FILES_CHKSUM = " \
> > -    file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
> > -    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
> > -    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
> > -    file://LGPL_EXCEPTION.txt;md5=bb426f3367c4805d1e12fad05bd0b750 \
> > +    file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> > +    file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
> > +    file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
> > +    file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
> >  "
> >
> >  DEPENDS += "qtbase qtdeclarative"
> >
> > -SRCREV = "1421c3e4ae4213ca18f2f51d5ddb38e223450222"
> > +SRCREV = "fb71c823a7ae823345518ca33ccfe273fcf76494"
> > diff --git a/recipes-qt/qt5/qtwebview/0001-Add-missing-include-for-qWarning.patch
> b/recipes-qt/qt5/qtwebview/0001-Add-missing-include-for-qWarning.patch
> > deleted file mode 100644
> > index 82087b9..0000000
> > --- a/recipes-qt/qt5/qtwebview/0001-Add-missing-include-for-
> qWarning.patch
> > +++ /dev/null
> > @@ -1,22 +0,0 @@
> > -From b946b6ea4a2a30bd12ecd036e40c9ef671681ba8 Mon Sep 17 00:00:00 2001
> > -From: Samuli Piippo <samuli.piippo@qt.io>
> > -Date: Fri, 2 Jun 2017 13:12:18 +0300
> > -Subject: [PATCH] Add missing include for qWarning
> > -
> > -Change-Id: I7c7699e7a2b7ce59e4f659d460ec835f59bba439
> > ----
> > - src/webview/qquickwebview.cpp | 1 +
> > - 1 file changed, 1 insertion(+)
> > -
> > -diff --git a/src/webview/qquickwebview.cpp b/src/webview/qquickwebview.
> cpp
> > -index d760564..fbbbfd6 100644
> > ---- a/src/webview/qquickwebview.cpp
> > -+++ b/src/webview/qquickwebview.cpp
> > -@@ -39,6 +39,7 @@
> > - #include <QtWebView/private/qwebviewloadrequest_p.h>
> > - #include <QtQml/qqmlengine.h>
> > - #include <QtCore/qmutex.h>
> > -+#include <QtCore/QDebug>
> > -
> > - namespace {
> > -
> > diff --git a/recipes-qt/qt5/qtwebview_git.bb b/recipes-qt/qt5/qtwebview_
> git.bb
> > index 8b79aa1..0bbb09e 100644
> > --- a/recipes-qt/qt5/qtwebview_git.bb
> > +++ b/recipes-qt/qt5/qtwebview_git.bb
> > @@ -9,10 +9,6 @@ LIC_FILES_CHKSUM = " \
> >  require qt5.inc
> >  require qt5-git.inc
> >
> > -# Patches from https://github.com/meta-qt5/qtwebview/commits/b5.9
> > -# 5.9.meta-qt5.1
> > -SRC_URI += "file://0001-Add-missing-include-for-qWarning.patch"
> > -
> >  DEPENDS += "qtbase qtwebengine"
> >
> >  COMPATIBLE_MACHINE = "(-)"
> > @@ -23,4 +19,4 @@ COMPATIBLE_MACHINE_armv7a = "(.*)"
> >  COMPATIBLE_MACHINE_armv7ve = "(.*)"
> >  COMPATIBLE_MACHINE_aarch64 = "(.*)"
> >
> > -SRCREV = "6e55abf3b6a5f373cd4b649c2318a45c49b40589"
> > +SRCREV = "e4016a67bbffefed71a407494e249e978d212b3d"
> > diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/
> qtx11extras_git.bb
> > index bf03e9b..ed1440c 100644
> > --- a/recipes-qt/qt5/qtx11extras_git.bb
> > +++ b/recipes-qt/qt5/qtx11extras_git.bb
> > @@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
> >
> >  DEPENDS += "qtbase"
> >
> > -SRCREV = "9e83ff8713c1a3f69ce514bf3e31335194668da7"
> > +SRCREV = "f65d50eb063ad3c9a1d6f008f66e881d2e15f1d8"
> > diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/
> qtxmlpatterns_git.bb
> > index 30e5262..7c18079 100644
> > --- a/recipes-qt/qt5/qtxmlpatterns_git.bb
> > +++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
> > @@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = " \
> >
> >  DEPENDS += "qtbase"
> >
> > -SRCREV = "c1c3af0ae456247c9bcd30161d51a94c9b38dc52"
> > +SRCREV = "fcfa824402bb4edaf644fad786dac3560c743ebe"
> >
> >  BBCLASSEXTEND =+ "native nativesdk"
> >
> > --
> > 2.14.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

