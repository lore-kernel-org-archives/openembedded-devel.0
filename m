Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id C7554784A2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Feb 2018 22:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C3CA120A8A;
	Fri, 16 Feb 2018 22:01:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id xqAbKBbRA7MO; Fri, 16 Feb 2018 22:01:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 97EB2200BB;
	Fri, 16 Feb 2018 22:01:42 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 318D51632A8; Fri, 16 Feb 2018 17:01:42 -0500 (EST)
Date: Fri, 16 Feb 2018 17:01:42 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20180216220142.GS2786@denix.org>
References: <20180215043848.14310-1-raj.khem@gmail.com>
	<20180215234152.GQ2786@denix.org>
	<CAMKF1sp7e7mQRWQPNHYPDHm-QZXtKuNFv_YrwLiD57+Q=JhQOg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp7e7mQRWQPNHYPDHm-QZXtKuNFv_YrwLiD57+Q=JhQOg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtbase: Replace -isystem with -I
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
X-List-Received-Date: Fri, 16 Feb 2018 22:01:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 15, 2018 at 03:50:56PM -0800, Khem Raj wrote:
> On Thu, Feb 15, 2018 at 3:41 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> > On Wed, Feb 14, 2018 at 08:38:48PM -0800, Khem Raj wrote:
> >> Fixes no-x11 builds (eglfs)
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>  recipes-qt/qt5/qtbase-native_git.bb                |  1 +
> >>  ...mon-gcc-base.conf-Use-I-instead-of-isyste.patch | 36 ++++++++++++++++++++++
> >>  recipes-qt/qt5/qtbase_git.bb                       |  1 +
> >>  3 files changed, 38 insertions(+)
> >>  create mode 100644 recipes-qt/qt5/qtbase/0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch
> >>
> >> diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
> >> index ac3924e..ffde8ee 100644
> >> --- a/recipes-qt/qt5/qtbase-native_git.bb
> >> +++ b/recipes-qt/qt5/qtbase-native_git.bb
> >> @@ -34,6 +34,7 @@ SRC_URI += "\
> >>      file://0009-Add-OE-specific-specs-for-clang-compiler.patch \
> >>      file://0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch \
> >>      file://0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch \
> >> +    file://0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch \
> >>  "
> >>
> >>  # common for qtbase-native and nativesdk-qtbase
> >> diff --git a/recipes-qt/qt5/qtbase/0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch b/recipes-qt/qt5/qtbase/0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch
> >> new file mode 100644
> >> index 0000000..44e9009
> >> --- /dev/null
> >> +++ b/recipes-qt/qt5/qtbase/0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch
> >> @@ -0,0 +1,36 @@
> >> +From 61c858474804fd772d612e6c5b4bb6df261d521a Mon Sep 17 00:00:00 2001
> >> +From: Khem Raj <raj.khem@gmail.com>
> >> +Date: Wed, 14 Feb 2018 17:08:43 -0800
> >> +Subject: [PATCH] mkspecs/common/gcc-base.conf: Use -I instead of -isystem
> >> +
> >> +-isystem fails to build when code uses include_next on certain files e.g.
> >> +
> >> +qtbase/5.10.0+gitAUTOINC+50117d738a-r0/recipe-sysroot/usr/include/c++/7.3.0/cstdlib:75:15: fatal error: stdlib.h: No such file or directory
> >> + #include_next <stdlib.h>
> >> +               ^~~~~~~~~~
> >
> > I'm building qt 5.10.0 in master with gcc 7.3.0 in a no-x11 environment with
> > eglfs and not seeing this issue. What else is different?
> 
> DISTRO_FEATURES_remove = "x11"
> DISTRO_FEATURES_remove = "wayland"
> DISTRO_FEATURES_append = " directfb"
> 
> then in qtbase
> PACKAGECONFIG_GL = "gles2"
> PACKAGECONFIG_FONTS = "fontconfig"
> PACKAGECONFIG_append = " libinput eglfs"
> PACKAGECONFIG_remove = "tests"

Yeah, I had slightly different flags - no-x11, but wayland+kms.

After disabling wayland and enabling eglfs explicitly, I still don't see any 
issues building qtbase.

Anyone else see the problem?


> >> +compilation terminated.
> >> +make[2]: *** [Makefile:11592: .obj/qgenericpluginfactory.o] Error 1
> >> +
> >> +Upstream-Status: Pending
> >> +
> >> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> +---
> >> + mkspecs/common/gcc-base.conf | 2 +-
> >> + 1 file changed, 1 insertion(+), 1 deletion(-)
> >> +
> >> +diff --git a/mkspecs/common/gcc-base.conf b/mkspecs/common/gcc-base.conf
> >> +index 234f71d495..ee3da023e6 100644
> >> +--- a/mkspecs/common/gcc-base.conf
> >> ++++ b/mkspecs/common/gcc-base.conf
> >> +@@ -46,7 +46,7 @@ QMAKE_CFLAGS_DEBUG         += -g
> >> + QMAKE_CFLAGS_SHLIB         += $$QMAKE_CFLAGS_PIC
> >> + QMAKE_CFLAGS_STATIC_LIB    += $$QMAKE_CFLAGS_PIC
> >> + QMAKE_CFLAGS_APP           += $$QMAKE_CFLAGS_PIC
> >> +-QMAKE_CFLAGS_ISYSTEM        = -isystem
> >> ++QMAKE_CFLAGS_ISYSTEM        = -I
> >> + QMAKE_CFLAGS_YACC          += -Wno-unused -Wno-parentheses
> >> + QMAKE_CFLAGS_HIDESYMS      += -fvisibility=hidden
> >> + QMAKE_CFLAGS_EXCEPTIONS_OFF += -fno-exceptions
> >> +--
> >> +2.16.1
> >> +
> >> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> >> index 4f3ade2..cc9bce3 100644
> >> --- a/recipes-qt/qt5/qtbase_git.bb
> >> +++ b/recipes-qt/qt5/qtbase_git.bb
> >> @@ -29,6 +29,7 @@ SRC_URI += "\
> >>      file://0009-Add-OE-specific-specs-for-clang-compiler.patch \
> >>      file://0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch \
> >>      file://0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch \
> >> +    file://0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch \
> >>      file://run-ptest \
> >>  "
> >>
> >> --
> >> 2.16.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 

