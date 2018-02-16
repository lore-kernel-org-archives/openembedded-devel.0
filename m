Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2E420602D9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Feb 2018 22:59:48 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id ay8so2460159plb.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Feb 2018 14:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yH7v2aTh0CfbOuANu+I98tiqQ84fSIrHKU0k5GdT4Jk=;
	b=FSMtz9JO0m+5z0aGLR87z5pR77wOEGgVjkve5wqRru1quW3Ps9eFNaRzMXcIc83b5w
	o3E82aAzn0wLr6426/6skajIU5rJI/40YelJKZKNaUOt73R03uyqhbQvkFeVsuVoMvmD
	dJH7/5IYbzQsKnHWEKZBGOEGpSi+QqrXkySsf1r+3Ffer7SPjhUxeXrZghKvW19dE4ew
	dYo1XFPvcyCVFMd3PTa/admSssy5OfyLf4H0SrXW1uBp8wflZ8LVBbj8tXKf+AnVnWIc
	C/pzu9Ii7l0/NOBvCMvGSxhMSqj0rXt/HHAa00q6gLytOdGvwSkW/MNy+igxT7LrOFX2
	NpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yH7v2aTh0CfbOuANu+I98tiqQ84fSIrHKU0k5GdT4Jk=;
	b=F0cTYrEflinJAa1MvWF9QybD6LTRlLz24cZsjVhjTgziGgmCpqEoqXTcpi/+CSVKCA
	s0Zb9VIP26lfPermNnpJKNjU0GSlmFx88TN5fZi4m/vcSMXgSUWyDlMNFdMVyVlLdfZr
	I804bKvYQVbnFh2ylMycPeLYBAxPSUFbfIDgZzvNwFUWGFP8yh6vpbO4yOrO4XPz8dni
	dCplxNT8eerNBAKAJtDUiehzUEL1t6dY+KHTmv1usDztd6Kf4mBS+i1fOHSmpK8U0kIX
	flEbfQeUhhdcaF9AQfiKn1nhHwyydgAixb/8x3+0TYczPEcjMC0D6CgwIzq0Nm0VQc9I
	fM9w==
X-Gm-Message-State: APf1xPC+HPoY2UJk9dCRbFrLIBu7mGC2RhMblSPEzZbCmRsrZ58JgwzF
	g1E2vJjDfUwIGbVj0zk/rQk/I3MOnvCDxkQJjVA=
X-Google-Smtp-Source: AH8x227jjkcshJD5NZ4oQtHJs1xf/KnQ9NgbJKY+hLRGa8YMNMjzRmNTEMmxmsd+lIREskDZJ7R95ULwOaMwx+TBFFg=
X-Received: by 2002:a17:902:2b84:: with SMTP id
	l4-v6mr7242912plb.338.1518821990204; 
	Fri, 16 Feb 2018 14:59:50 -0800 (PST)
MIME-Version: 1.0
References: <20180215043848.14310-1-raj.khem@gmail.com>
	<20180215234152.GQ2786@denix.org>
	<CAMKF1sp7e7mQRWQPNHYPDHm-QZXtKuNFv_YrwLiD57+Q=JhQOg@mail.gmail.com>
	<20180216220142.GS2786@denix.org>
In-Reply-To: <20180216220142.GS2786@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 Feb 2018 22:59:39 +0000
Message-ID: <CAMKF1spkGJpYTAmQ9gh+af51ya3qkZja8XMmVP5u=Q-ycc5qbw@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Fri, 16 Feb 2018 22:59:49 -0000
Content-Type: text/plain; charset="UTF-8"

I am using arch Linux for host distro and security flags enabled May be
that is something

On Fri, Feb 16, 2018 at 2:01 PM Denys Dmytriyenko <denis@denix.org> wrote:

> On Thu, Feb 15, 2018 at 03:50:56PM -0800, Khem Raj wrote:
> > On Thu, Feb 15, 2018 at 3:41 PM, Denys Dmytriyenko <denis@denix.org>
> wrote:
> > > On Wed, Feb 14, 2018 at 08:38:48PM -0800, Khem Raj wrote:
> > >> Fixes no-x11 builds (eglfs)
> > >>
> > >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > >> ---
> > >>  recipes-qt/qt5/qtbase-native_git.bb                |  1 +
> > >>  ...mon-gcc-base.conf-Use-I-instead-of-isyste.patch | 36
> ++++++++++++++++++++++
> > >>  recipes-qt/qt5/qtbase_git.bb                       |  1 +
> > >>  3 files changed, 38 insertions(+)
> > >>  create mode 100644
> recipes-qt/qt5/qtbase/0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch
> > >>
> > >> diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/
> qtbase-native_git.bb
> > >> index ac3924e..ffde8ee 100644
> > >> --- a/recipes-qt/qt5/qtbase-native_git.bb
> > >> +++ b/recipes-qt/qt5/qtbase-native_git.bb
> > >> @@ -34,6 +34,7 @@ SRC_URI += "\
> > >>      file://0009-Add-OE-specific-specs-for-clang-compiler.patch \
> > >>
> file://0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch \
> > >>      file://0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch \
> > >> +
> file://0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch \
> > >>  "
> > >>
> > >>  # common for qtbase-native and nativesdk-qtbase
> > >> diff --git
> a/recipes-qt/qt5/qtbase/0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch
> b/recipes-qt/qt5/qtbase/0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch
> > >> new file mode 100644
> > >> index 0000000..44e9009
> > >> --- /dev/null
> > >> +++
> b/recipes-qt/qt5/qtbase/0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch
> > >> @@ -0,0 +1,36 @@
> > >> +From 61c858474804fd772d612e6c5b4bb6df261d521a Mon Sep 17 00:00:00
> 2001
> > >> +From: Khem Raj <raj.khem@gmail.com>
> > >> +Date: Wed, 14 Feb 2018 17:08:43 -0800
> > >> +Subject: [PATCH] mkspecs/common/gcc-base.conf: Use -I instead of
> -isystem
> > >> +
> > >> +-isystem fails to build when code uses include_next on certain files
> e.g.
> > >> +
> > >>
> +qtbase/5.10.0+gitAUTOINC+50117d738a-r0/recipe-sysroot/usr/include/c++/7.3.0/cstdlib:75:15:
> fatal error: stdlib.h: No such file or directory
> > >> + #include_next <stdlib.h>
> > >> +               ^~~~~~~~~~
> > >
> > > I'm building qt 5.10.0 in master with gcc 7.3.0 in a no-x11
> environment with
> > > eglfs and not seeing this issue. What else is different?
> >
> > DISTRO_FEATURES_remove = "x11"
> > DISTRO_FEATURES_remove = "wayland"
> > DISTRO_FEATURES_append = " directfb"
> >
> > then in qtbase
> > PACKAGECONFIG_GL = "gles2"
> > PACKAGECONFIG_FONTS = "fontconfig"
> > PACKAGECONFIG_append = " libinput eglfs"
> > PACKAGECONFIG_remove = "tests"
>
> Yeah, I had slightly different flags - no-x11, but wayland+kms.
>
> After disabling wayland and enabling eglfs explicitly, I still don't see
> any
> issues building qtbase.
>
> Anyone else see the problem?
>
>
> > >> +compilation terminated.
> > >> +make[2]: *** [Makefile:11592: .obj/qgenericpluginfactory.o] Error 1
> > >> +
> > >> +Upstream-Status: Pending
> > >> +
> > >> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > >> +---
> > >> + mkspecs/common/gcc-base.conf | 2 +-
> > >> + 1 file changed, 1 insertion(+), 1 deletion(-)
> > >> +
> > >> +diff --git a/mkspecs/common/gcc-base.conf
> b/mkspecs/common/gcc-base.conf
> > >> +index 234f71d495..ee3da023e6 100644
> > >> +--- a/mkspecs/common/gcc-base.conf
> > >> ++++ b/mkspecs/common/gcc-base.conf
> > >> +@@ -46,7 +46,7 @@ QMAKE_CFLAGS_DEBUG         += -g
> > >> + QMAKE_CFLAGS_SHLIB         += $$QMAKE_CFLAGS_PIC
> > >> + QMAKE_CFLAGS_STATIC_LIB    += $$QMAKE_CFLAGS_PIC
> > >> + QMAKE_CFLAGS_APP           += $$QMAKE_CFLAGS_PIC
> > >> +-QMAKE_CFLAGS_ISYSTEM        = -isystem
> > >> ++QMAKE_CFLAGS_ISYSTEM        = -I
> > >> + QMAKE_CFLAGS_YACC          += -Wno-unused -Wno-parentheses
> > >> + QMAKE_CFLAGS_HIDESYMS      += -fvisibility=hidden
> > >> + QMAKE_CFLAGS_EXCEPTIONS_OFF += -fno-exceptions
> > >> +--
> > >> +2.16.1
> > >> +
> > >> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/
> qtbase_git.bb
> > >> index 4f3ade2..cc9bce3 100644
> > >> --- a/recipes-qt/qt5/qtbase_git.bb
> > >> +++ b/recipes-qt/qt5/qtbase_git.bb
> > >> @@ -29,6 +29,7 @@ SRC_URI += "\
> > >>      file://0009-Add-OE-specific-specs-for-clang-compiler.patch \
> > >>
> file://0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch \
> > >>      file://0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch \
> > >> +
> file://0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch \
> > >>      file://run-ptest \
> > >>  "
> > >>
> > >> --
> > >> 2.16.1
> > >>
> > >> --
> > >> _______________________________________________
> > >> Openembedded-devel mailing list
> > >> Openembedded-devel@lists.openembedded.org
> > >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
>

