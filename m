Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E64D9C54E5D
	for <webhook@archiver.kernel.org>; Sat, 16 Mar 2024 08:02:47 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.2617.1710576161607855509
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Mar 2024 01:02:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=enBUXJ5q;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-414087091b3so1763485e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 16 Mar 2024 01:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710576160; x=1711180960; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6YYMbWJ3bI3pfNTihKUMJHBmK/RKTeZ1AraPfrr4HXo=;
        b=enBUXJ5qqRiw2vIU/Sg0Nc1KuLvkhWbaGKcwEpii/axL1szn3iQF04VN0bHe4Z84gf
         8oN9qRFDDUY2AXzZc76v+lXapXYWEoseh8R5uzmiYUVXibq1yV2vuNlTZQnar8S1gluS
         7er8fwxPHCzwRIIXAtk8fDK/kfDl8eiEo/lmt+j38qOGA3rZYYJhtKaAvOKOm8Yenmpd
         MiZ2lpPZ7t3wjzhFOlKIe17TzxouYwxYHwAPvOtZ1K7SOg8gy6fTIqOrVuz0rQwH3Bg1
         SlqgvjFKb3qo2KqbKrkbTFRJEhxs3DzlcPxnez56k+SAkLZckyvkQzdgc+HYGhjMtOS3
         +DWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710576160; x=1711180960;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6YYMbWJ3bI3pfNTihKUMJHBmK/RKTeZ1AraPfrr4HXo=;
        b=TXT12Bqk4GNCoFd+oXs3hDj9jwYr2LxpNtVnlySLX88F+P4fWHcmtcdwPJ2CSlpe26
         wKi3v01qlSqXThmyn21A9yCxLPSY39FcnfQQrSX2Oh6Z9PzC1S1tofEoROujNdd2l2hs
         J5NapQF+hEwkN8bIw37aZYH3Lky/6VrnqFclA9uKVRFx03/ik31/MKJNNli9QqabX9Na
         TNjJwIT37pJ2dQbLrgi80pnLlY4MoEevUYWJv5LlL4/rx4iqvKxXfvfmz1WdsXOOIssY
         eMxuMEiaJdE/JKo8746jfvx8EdxX6QxrB+sRi+730ZDFQTOh47Aa//I00o29S/ffTxzw
         UF9w==
X-Forwarded-Encrypted: i=1; AJvYcCXj6KnQ19SHN/ffC3hgu+vUFpYZNhDCfsVb1zzOem3E+fkIi4TIAx0OtwNvrHadf9z3byT1C201gmmADLUrtLw+Fap3yeJCujsZz6rECwKS2fbUgj6xRCZM6w==
X-Gm-Message-State: AOJu0Yys8z6v5wdFygbyK87NQbpeVdGYFe/wiqPcewlYA4ye6oLIw7Wf
	Bgx/AEw2ebL5DH2CycYrWkwX1TaqulM9mBmXbZxlvZ3t42FY1+EvuBSsElw0PmYxFGtBl+OhEWx
	FWTcZFeGCSM1L8yjRZp/ZriL89Ac=
X-Google-Smtp-Source: AGHT+IGu0N8DXQ9YCDOY7/VOWg8onfjKHKcgbjI8E9ujoUpMeodWyUgKxmrzM4OKWUOe6BKyNEH0M+/rgT3BRBLXQvU=
X-Received: by 2002:a5d:5589:0:b0:33e:69db:bf9e with SMTP id
 i9-20020a5d5589000000b0033e69dbbf9emr920781wrv.67.1710576159535; Sat, 16 Mar
 2024 01:02:39 -0700 (PDT)
MIME-Version: 1.0
References: <0afe6e7d5c9f3de0c3b82a646236bb9bbbe8210f.1710445397.git.joerg.sommer@navimatix.de>
 <CAMKF1sqA7eN1pMRKzeSQp8UZKhdADaW5yHLaXZHOd9+-jDaexA@mail.gmail.com>
 <CAMKF1sozBtpLKoYQRribC2+58bcsaDSRC9A6acNVAQuC_9KFjg@mail.gmail.com> <AM6PR0102MB36562D01AE5A0C995D43D2D2FC282@AM6PR0102MB3656.eurprd01.prod.exchangelabs.com>
In-Reply-To: <AM6PR0102MB36562D01AE5A0C995D43D2D2FC282@AM6PR0102MB3656.eurprd01.prod.exchangelabs.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 16 Mar 2024 09:02:27 +0100
Message-ID: <CA+chaQe4qY3KAZt-yK--5UyoSqyZ_oPxX+=jQ+M6YhW2XXfY5A@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH v2] spandsp: new telephony DSP library
To: joerg.sommer@navimatix.de
Cc: Khem Raj <raj.khem@gmail.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000059bbda0613c28c16"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Mar 2024 08:02:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109352

--00000000000059bbda0613c28c16
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm seeing the same errors with gcc :)

libtool: compile:  ccache arm-oe-linux-gnueabi-gcc -mthumb -mfpu=3Dneon
-mfloat-abi=3Dsoftfp -mcpu=3Dcortex-a9 -mtune=3Dcortex-a9
-fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-securi=
ty
-Werror=3Dformat-security -Werror=3Dreturn-type -funwind-tables -D_TIME_BIT=
S=3D64
-D_FILE_OFFSET_BITS=3D64
--sysroot=3DTOPDIR/BUILD/work/mach-oe-linux-gnueabi/lib32-spandsp/3.0.0+git=
/lib32-recipe-sysroot
-DHAVE_CONFIG_H -I. -I../../git/src -I.. -DNDEBUG -Wunused-but-set-variable
-std=3Dgnu99 -ffast-math -Wall -Wunused-variable -Wwrite-strings
-Wstrict-prototypes -Wmissing-prototypes -fvisibility=3Dhidden
-DHAVE_VISIBILITY=3D1 -O2 -pipe -g -feliminate-unused-debug-types
-fcanon-prefix-map
-fmacro-prefix-map=3DTOPDIR/BUILD/work/mach-oe-linux-gnueabi/lib32-spandsp/=
3.0.0+git/git=3D/usr/src/debug/lib32-spandsp/3.0.0+git
-fdebug-prefix-map=3DTOPDIR/BUILD/work/mach-oe-linux-gnueabi/lib32-spandsp/=
3.0.0+git/git=3D/usr/src/debug/lib32-spandsp/3.0.0+git
-fmacro-prefix-map=3DTOPDIR/BUILD/work/mach-oe-linux-gnueabi/lib32-spandsp/=
3.0.0+git/build=3D/usr/src/debug/lib32-spandsp/3.0.0+git
-fdebug-prefix-map=3DTOPDIR/BUILD/work/mach-oe-linux-gnueabi/lib32-spandsp/=
3.0.0+git/build=3D/usr/src/debug/lib32-spandsp/3.0.0+git
-fdebug-prefix-map=3DTOPDIR/BUILD/work/mach-oe-linux-gnueabi/lib32-spandsp/=
3.0.0+git/lib32-recipe-sysroot=3D
-fmacro-prefix-map=3DTOPDIR/BUILD/work/mach-oe-linux-gnueabi/lib32-spandsp/=
3.0.0+git/lib32-recipe-sysroot=3D
-fdebug-prefix-map=3DTOPDIR/BUILD/work/mach-oe-linux-gnueabi/lib32-spandsp/=
3.0.0+git/recipe-sysroot-native=3D
-c ../../git/src/t38_terminal.c  -fPIC -DPIC -o .libs/t38_terminal.o
../../git/src/ademco_contactid.c:449:110: error: expected ')' before ';'
token
  449 | static const int detection_threshold            =3D
goertzel_threshold_dbm0(GOERTZEL_SAMPLES_PER_BLOCK, -42.0f);
      |
                                         ^
In file included from ../../git/src/ademco_contactid.c:66:
../../git/src/spandsp/tone_detect.h:63:55: note: to match this '('
   63 | #define goertzel_threshold_dbm0(len,thresh)     (int)
((len*len*256.0*256.0/2.0*pow(10.0, (thresh - DBM0_MAX_SINE_POWER)/10.0))
      |                                                       ^
../../git/src/ademco_contactid.c:449:51: note: in expansion of macro
'goertzel_threshold_dbm0'
  449 | static const int detection_threshold            =3D
goertzel_threshold_dbm0(GOERTZEL_SAMPLES_PER_BLOCK, -42.0f);
      |
^~~~~~~~~~~~~~~~~~~~~~~
../../git/src/ademco_contactid.c:449:18: warning: 'detection_threshold'
defined but not used [-Wunused-const-variable=3D]
  449 | static const int detection_threshold            =3D
goertzel_threshold_dbm0(GOERTZEL_SAMPLES_PER_BLOCK, -42.0f);
      |                  ^~~~~~~~~~~~~~~~~~~
../../git/src/ademco_contactid.c:210:35: warning: 'ademco_codes' defined
but not used [-Wunused-const-variable=3D]
  210 | static const struct ademco_code_s ademco_codes[] =3D
      |                                   ^~~~~~~~~~~~
make[2]: *** [Makefile:1091: ademco_contactid.lo] Error 1

This is with master-next meta-oe from yesterday in build with multilib
(night not be important)

On Fri, Mar 15, 2024 at 8:19=E2=80=AFAM J=C3=B6rg Sommer via lists.openembe=
dded.org
<joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:

> Yes, I'm getting these errors, too, when compiling with clang; independen=
t
> of the clang version up to 19. It seems to be a problem of `pow()`. gcc
> might have a built-in and can compute it at compile-time, while clang has
> no built-in of pow.
>
>
>
> J=C3=B6rg Sommer
>
> Software Developer / Programmierer
> --
>
> Navimatix GmbH
>
> Tatzendpromenade 2
>
> 07745 Jena
>
> T: 03641 - 327 99 0
>
> F: 03641 - 526 306
>
> M: *joerg.sommer@navimatix.de <joerg.sommer@navimatix.de>*
>
> *www.navimatix.de <http://www.navimatix.de/>*
>
>
>
> Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
>
> Registergericht: Amtsgericht Jena, HRB 501480
>
> ------------------------------
> *From:* Khem Raj <raj.khem@gmail.com>
> *Sent:* Friday, 15 March 2024 06:13
> *To:* J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> *Cc:* openembedded-devel@lists.openembedded.org <
> openembedded-devel@lists.openembedded.org>
> *Subject:* Re: [oe] [meta-multimedia][PATCH v2] spandsp: new telephony
> DSP library
>
> Not much to do with musl, it fails when I use clang on my desktop as
> well. you can see the same errors with clang on host
>
> CC=3Dclang ./configure
> make
>
> On Thu, Mar 14, 2024 at 9:37=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > fails to build with musl/clang
> >
> > https://snips.sh/f/qCR86Rwwz1
> >
> > On Thu, Mar 14, 2024 at 12:43=E2=80=AFPM J=C3=B6rg Sommer via
> > lists.openembedded.org
> > <joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:
> > >
> > > From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> > >
> > > Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> > > ---
> > >  .../spandsp/spandsp/configure.patch           |  56 ++++++
> > >  .../spandsp/spandsp/makefile.patch            | 161 ++++++++++++++++=
++
> > >  .../recipes-multimedia/spandsp/spandsp_git.bb |  47 +++++
> > >  3 files changed, 264 insertions(+)
> > >  create mode 100644
> meta-multimedia/recipes-multimedia/spandsp/spandsp/configure.patch
> > >  create mode 100644
> meta-multimedia/recipes-multimedia/spandsp/spandsp/makefile.patch
> > >  create mode 100644 meta-multimedia/recipes-multimedia/spandsp/
> spandsp_git.bb
> > >
> > > diff --git
> a/meta-multimedia/recipes-multimedia/spandsp/spandsp/configure.patch
> b/meta-multimedia/recipes-multimedia/spandsp/spandsp/configure.patch
> > > new file mode 100644
> > > index 000000000..af504be76
> > > --- /dev/null
> > > +++
> b/meta-multimedia/recipes-multimedia/spandsp/spandsp/configure.patch
> > > @@ -0,0 +1,56 @@
> > > +From: =3D?UTF-8?q?J=3DC3=3DB6rg=3D20Sommer?=3D <joerg.sommer@navimat=
ix.de>
> > > +Date: Thu, 14 Mar 2024 09:41:57 +0100
> > > +Subject: [PATCH 2/2] configure: Replace manual search for libxml by
> > > + AC_CHECK_LIB
> > > +MIME-Version: 1.0
> > > +Content-Type: text/plain; charset=3DUTF-8
> > > +Content-Transfer-Encoding: 8bit
> > > +
> > > +The manual search fails if the include directories (and build
> environment)
> > > +are located somewhere else.
> > > +
> > > +Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> > > +Upstream-Status: Submitted [
> https://github.com/freeswitch/spandsp/pull/74]
> > > +---
> > > +
> > > +ERROR: spandsp-3.0.0+git-r0 do_configure: QA Issue: This autoconf lo=
g
> indicates errors, it looked at host include and/or library paths while
> determining system capabilities.
> > > +
> > > + configure.ac | 22 +++++-----------------
> > > + 1 file changed, 5 insertions(+), 17 deletions(-)
> > > +
> > > +diff --git a/configure.ac b/configure.ac
> > > +index 2140837..b5138d6 100644
> > > +--- a/configure.ac
> > > ++++ b/configure.ac
> > > +@@ -185,23 +185,11 @@ then
> > > + fi
> > > +
> > > + # Determine XML2 include path
> > > +-AC_MSG_CHECKING(for libxml/xmlmemory.h)
> > > +-
> > > +-# Can we include headers using system include dirs?
> > > +-AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[#include
> <libxml/xmlmemory.h>]], [[int a =3D 1;]])],[XML2_INCLUDE=3D" "],[XML2_INC=
LUDE=3D])
> > > +-
> > > +-# Hunt through several possible directories to find the includes fo=
r
> libxml2
> > > +-if test "x$XML2_INCLUDE" =3D "x"; then
> > > +-    old_CPPFLAGS=3D"$CPPFLAGS"
> > > +-    for i in $xml2_include_dir /usr/include /usr/local/include
> /usr/include/libxml2 /usr/local/include/libxml2 ; do
> > > +-        CPPFLAGS=3D"$old_CPPFLAGS -I$i"
> > > +-        AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[#include
> <libxml/xmlmemory.h>]], [[int a =3D
> 1;]])],[XML2_INCLUDE=3D"-I$i"],[XML2_INCLUDE=3D
> > > +-        ])
> > > +-        if test "x$XML2_INCLUDE" !=3D "x"; then
> > > +-            break;
> > > +-        fi
> > > +-    done
> > > +-    CPPFLAGS=3D"$old_CPPFLAGS $XML2_INCLUDE"
> > > ++AC_CHECK_LIB([xml2], [xmlParseFile], [libxml2_found=3Dyes])
> > > ++if test "$libxml2_found" =3D "yes" ; then
> > > ++    AC_DEFINE(HAVE_LIBXML2,1,[defined when libxml2 is available])
> > > ++else
> > > ++    AC_MSG_WARN([libxml2 not found. Disabling cache.])
> > > + fi
> > > +
> > > + AC_CHECK_HEADERS([libxml/xmlmemory.h])
> > > +--
> > > +2.34.1
> > > +
> > > diff --git
> a/meta-multimedia/recipes-multimedia/spandsp/spandsp/makefile.patch
> b/meta-multimedia/recipes-multimedia/spandsp/spandsp/makefile.patch
> > > new file mode 100644
> > > index 000000000..d3eb047fe
> > > --- /dev/null
> > > +++ b/meta-multimedia/recipes-multimedia/spandsp/spandsp/makefile.pat=
ch
> > > @@ -0,0 +1,161 @@
> > > +From: =3D?UTF-8?q?J=3DC3=3DB6rg=3D20Sommer?=3D <joerg.sommer@navimat=
ix.de>
> > > +Date: Thu, 14 Mar 2024 08:08:13 +0100
> > > +Subject: [PATCH 1/2] configure: Use AX_PROG_CC_FOR_BUILD for cross
> compiling
> > > +MIME-Version: 1.0
> > > +Content-Type: text/plain; charset=3DUTF-8
> > > +Content-Transfer-Encoding: 8bit
> > > +
> > > +The macro AX_PROG_CC_FOR_BUILD [1] sets the variables CC_FOR_BUILD a=
nd
> > > +..._FLAGS_FOR_BUILD they can be used [2] to build binaries used at
> compile
> > > +time.
> > > +
> > > +[1]:
> https://www.gnu.org/software/autoconf-archive/ax_prog_cc_for_build.html
> > > +[2]:
> https://stackoverflow.com/questions/24201260/autotools-cross-compilation-=
and-generated-sources/24208587#24208587
> > > +
> > > +Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> > > +Upstream-Status: Submitted [
> https://github.com/freeswitch/spandsp/pull/74]
> > > +---
> > > + configure.ac    | 49 +-------------------------------------------
> > > + src/Makefile.am | 54
> +++++++++++++++++++++++++------------------------
> > > + 2 files changed, 29 insertions(+), 74 deletions(-)
> > > +
> > > +diff --git a/configure.ac b/configure.ac
> > > +index 96fd022..2140837 100644
> > > +--- a/configure.ac
> > > ++++ b/configure.ac
> > > +@@ -55,54 +55,7 @@ AC_LANG([C])
> > > +
> > > + AX_COMPILER_VENDOR
> > > +
> > > +-if test "${build}" !=3D "${host}"
> > > +-then
> > > +-    # If we are doing a Canadian Cross, in which the host and build
> systems
> > > +-    # are not the same, we set reasonable default values for the
> tools.
> > > +-
> > > +-    CC_FOR_BUILD=3D${CC_FOR_BUILD-gcc}
> > > +-    CPPFLAGS_FOR_BUILD=3D"\$(CPPFLAGS)"
> > > +-    CC=3D${CC-${host_alias}-gcc}
> > > +-    CFLAGS=3D${CFLAGS-"-g -O2"}
> > > +-    CXX=3D${CXX-${host_alias}-c++}
> > > +-    CXXFLAGS=3D${CXXFLAGS-"-g -O2"}
> > > +-else
> > > +-    # Set reasonable default values for some tools even if not
> Canadian.
> > > +-    # Of course, these are different reasonable default values,
> originally
> > > +-    # specified directly in the Makefile.
> > > +-    # We don't export, so that autoconf can do its job.
> > > +-    # Note that all these settings are above the fragment inclusion
> point
> > > +-    # in Makefile.in, so can still be overridden by fragments.
> > > +-    # This is all going to change when we autoconfiscate...
> > > +-    CC_FOR_BUILD=3D"\$(CC)"
> > > +-    CPPFLAGS_FOR_BUILD=3D"\$(CPPFLAGS)"
> > > +-    AC_PROG_CC
> > > +-
> > > +-    # We must set the default linker to the linker used by gcc for
> the correct
> > > +-    # operation of libtool.  If LD is not defined and we are using
> gcc, try to
> > > +-    # set the LD default to the ld used by gcc.
> > > +-    if test -z "$LD"
> > > +-    then
> > > +-        if test "$GCC" =3D yes
> > > +-        then
> > > +-            case $build in
> > > +-            *-*-mingw*)
> > > +-                gcc_prog_ld=3D`$CC -print-prog-name=3Dld 2>&1 | tr =
-d
> '\015'` ;;
> > > +-            *)
> > > +-                gcc_prog_ld=3D`$CC -print-prog-name=3Dld 2>&1` ;;
> > > +-            esac
> > > +-            case $gcc_prog_ld in
> > > +-            # Accept absolute paths.
> > > +-            [[\\/]* | [A-Za-z]:[\\/]*)]
> > > +-                LD=3D"$gcc_prog_ld" ;;
> > > +-            esac
> > > +-        fi
> > > +-    fi
> > > +-
> > > +-    CXX=3D${CXX-"c++"}
> > > +-    CFLAGS=3D${CFLAGS-"-g -O2"}
> > > +-    CXXFLAGS=3D${CXXFLAGS-"-g -O2"}
> > > +-fi
> > > ++AX_PROG_CC_FOR_BUILD
> > > +
> > > + AC_DEFUN([REMOVE_FROM_VAR],[
> > > +     new_val=3D""
> > > +diff --git a/src/Makefile.am b/src/Makefile.am
> > > +index e05fad5..9b409a1 100644
> > > +--- a/src/Makefile.am
> > > ++++ b/src/Makefile.am
> > > +@@ -386,44 +386,46 @@ noinst_HEADERS =3D cielab_luts.h \
> > > +                  v34_tx_pre_emphasis_filters.h \
> > > +                  v34_tables.h
> > > +
> > > +-make_at_dictionary$(EXEEXT): $(top_srcdir)/src/make_at_dictionary.c
> > > +-      $(CC_FOR_BUILD) -o make_at_dictionary$(EXEEXT)
> $(top_srcdir)/src/make_at_dictionary.c -DHAVE_CONFIG_H -I$(top_builddir)/=
src
> > > ++LINK_FOR_BUILD.c =3D $(CC_FOR_BUILD) -DHAVE_CONFIG_H
> -I$(top_builddir)/src $(CFLAGS_FOR_BUILD) $(CPPFLAGS_FOR_BUILD)
> $(LDFLAGS_FOR_BUILD) $(TARGET_ARCH_FOR_BUILD)
> > > +
> > > +-make_cielab_luts$(EXEEXT): $(top_srcdir)/src/make_cielab_luts.c
> > > +-      $(CC_FOR_BUILD) -o make_cielab_luts$(EXEEXT)
> $(top_srcdir)/src/make_cielab_luts.c -DHAVE_CONFIG_H -I$(top_builddir)/sr=
c
> -lm
> > > ++make_at_dictionary$(BUILD_EXEEXT):
> $(top_srcdir)/src/make_at_dictionary.c
> > > ++      $(LINK_FOR_BUILD.c) -o $@ $^
> > > +
> > > +-make_math_fixed_tables$(EXEEXT):
> $(top_srcdir)/src/make_math_fixed_tables.c
> > > +-      $(CC_FOR_BUILD) -o make_math_fixed_tables$(EXEEXT)
> $(top_srcdir)/src/make_math_fixed_tables.c -DHAVE_CONFIG_H
> -I$(top_builddir)/src -lm
> > > ++make_cielab_luts$(BUILD_EXEEXT): $(top_srcdir)/src/make_cielab_luts=
.c
> > > ++      $(LINK_FOR_BUILD.c) -o $@ $^ -lm
> > > +
> > > +-make_modem_filter$(EXEEXT): $(top_srcdir)/src/make_modem_filter.c
> $(top_srcdir)/src/filter_tools.c
> > > +-      $(CC_FOR_BUILD) -o make_modem_filter$(EXEEXT)
> $(top_srcdir)/src/make_modem_filter.c $(top_srcdir)/src/filter_tools.c
> -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
> > > ++make_math_fixed_tables$(BUILD_EXEEXT):
> $(top_srcdir)/src/make_math_fixed_tables.c
> > > ++      $(LINK_FOR_BUILD.c) -o $@ $^ -lm
> > > +
> > > +-make_modem_godard_coefficients$(EXEEXT):
> $(top_srcdir)/src/make_modem_godard_coefficients.c
> $(top_srcdir)/src/filter_tools.c
> > > +-      $(CC_FOR_BUILD) -o make_modem_godard_coefficients$(EXEEXT)
> $(top_srcdir)/src/make_modem_godard_coefficients.c
> $(top_srcdir)/src/filter_tools.c -DHAVE_CONFIG_H -I$(top_builddir)/src -l=
m
> > > ++make_modem_filter$(BUILD_EXEEXT):
> $(top_srcdir)/src/make_modem_filter.c $(top_srcdir)/src/filter_tools.c
> > > ++      $(LINK_FOR_BUILD.c) -o $@ $^ -lm
> > > +
> > > +-make_t43_gray_code_tables$(EXEEXT):
> $(top_srcdir)/src/make_t43_gray_code_tables.c
> > > +-      $(CC_FOR_BUILD) -o make_t43_gray_code_tables$(EXEEXT)
> $(top_srcdir)/src/make_t43_gray_code_tables.c -DHAVE_CONFIG_H
> -I$(top_builddir)/src -lm
> > > ++make_modem_godard_coefficients$(BUILD_EXEEXT):
> $(top_srcdir)/src/make_modem_godard_coefficients.c
> $(top_srcdir)/src/filter_tools.c
> > > ++      $(LINK_FOR_BUILD.c) -o $@ $^ -lm
> > > +
> > > +-make_v17_v32_constellation_map$(EXEEXT):
> $(top_srcdir)/src/make_v17_v32_constellation_map.c $(top_srcdir)/src/g711=
.c
> $(top_srcdir)/src/alloc.c
> > > +-      $(CC_FOR_BUILD) -o make_v17_v32_constellation_map$(EXEEXT)
> $(top_srcdir)/src/make_v17_v32_constellation_map.c $(top_srcdir)/src/g711=
.c
> $(top_srcdir)/src/alloc.c -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
> > > ++make_t43_gray_code_tables$(BUILD_EXEEXT):
> $(top_srcdir)/src/make_t43_gray_code_tables.c
> > > ++      $(LINK_FOR_BUILD.c) -o $@ $^ -lm
> > > +
> > > +-make_v17_v32_convolutional_encoder$(EXEEXT):
> $(top_srcdir)/src/make_v17_v32_convolutional_encoder.c
> $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c
> > > +-      $(CC_FOR_BUILD) -o make_v17_v32_convolutional_encoder$(EXEEXT=
)
> $(top_srcdir)/src/make_v17_v32_convolutional_encoder.c
> $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c -DHAVE_CONFIG_H
> -I$(top_builddir)/src -lm
> > > ++make_v17_v32_constellation_map$(BUILD_EXEEXT):
> $(top_srcdir)/src/make_v17_v32_constellation_map.c $(top_srcdir)/src/g711=
.c
> $(top_srcdir)/src/alloc.c
> > > ++      $(LINK_FOR_BUILD.c) -o $@ $^ -lm
> > > +
> > > +-make_v29_constellation_map$(EXEEXT):
> $(top_srcdir)/src/make_v29_constellation_map.c $(top_srcdir)/src/g711.c
> $(top_srcdir)/src/alloc.c
> > > +-      $(CC_FOR_BUILD) -o make_v29_constellation_map$(EXEEXT)
> $(top_srcdir)/src/make_v29_constellation_map.c $(top_srcdir)/src/g711.c
> $(top_srcdir)/src/alloc.c -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
> > > ++make_v17_v32_convolutional_encoder$(BUILD_EXEEXT):
> $(top_srcdir)/src/make_v17_v32_convolutional_encoder.c
> $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c
> > > ++      $(LINK_FOR_BUILD.c) -o $@ $^ -lm
> > > +
> > > +-make_v34_convolutional_coders$(EXEEXT):
> $(top_srcdir)/src/make_v34_convolutional_coders.c
> > > +-      $(CC_FOR_BUILD) -o make_v34_convolutional_coders$(EXEEXT)
> $(top_srcdir)/src/make_v34_convolutional_coders.c -DHAVE_CONFIG_H
> -I$(top_builddir)/src -lm
> > > ++make_v29_constellation_map$(BUILD_EXEEXT):
> $(top_srcdir)/src/make_v29_constellation_map.c $(top_srcdir)/src/g711.c
> $(top_srcdir)/src/alloc.c
> > > ++      $(LINK_FOR_BUILD.c) -o $@ $^ -lm
> > > +
> > > +-make_v34_probe_signals$(EXEEXT):
> $(top_srcdir)/src/make_v34_probe_signals.c $(top_srcdir)/src/g711.c
> $(top_srcdir)/src/alloc.c
> > > +-      $(CC_FOR_BUILD) -o make_v34_probe_signals$(EXEEXT)
> $(top_srcdir)/src/make_v34_probe_signals.c $(top_srcdir)/src/g711.c
> $(top_srcdir)/src/alloc.c -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
> > > ++make_v34_convolutional_coders$(BUILD_EXEEXT):
> $(top_srcdir)/src/make_v34_convolutional_coders.c
> > > ++      $(LINK_FOR_BUILD.c) -o $@ $^ -lm
> > > +
> > > +-make_v34_shell_map$(EXEEXT): $(top_srcdir)/src/make_v34_shell_map.c
> > > +-      $(CC_FOR_BUILD) -o make_v34_shell_map$(EXEEXT)
> $(top_srcdir)/src/make_v34_shell_map.c -DHAVE_CONFIG_H -I$(top_builddir)/=
src
> > > ++make_v34_probe_signals$(BUILD_EXEEXT):
> $(top_srcdir)/src/make_v34_probe_signals.c $(top_srcdir)/src/g711.c
> $(top_srcdir)/src/alloc.c
> > > ++      $(LINK_FOR_BUILD.c) -o $@ $^ -I$(top_srcdir)/src -lm
> > > +
> > > +-make_v34_tx_pre_emphasis_filters$(EXEEXT):
> $(top_srcdir)/src/make_v34_tx_pre_emphasis_filters.c
> $(top_srcdir)/tools/meteor-engine.c
> > > +-      $(CC_FOR_BUILD) -o make_v34_tx_pre_emphasis_filters$(EXEEXT)
> $(top_srcdir)/src/make_v34_tx_pre_emphasis_filters.c
> $(top_srcdir)/tools/meteor-engine.c -DHAVE_CONFIG_H -I$(top_builddir)/src
> -I$(top_builddir)/tools -lm
> > > ++make_v34_shell_map$(BUILD_EXEEXT):
> $(top_srcdir)/src/make_v34_shell_map.c
> > > ++      $(LINK_FOR_BUILD.c) -o $@ $^
> > > ++
> > > ++make_v34_tx_pre_emphasis_filters$(BUILD_EXEEXT):
> $(top_srcdir)/src/make_v34_tx_pre_emphasis_filters.c
> $(top_srcdir)/tools/meteor-engine.c
> > > ++      $(LINK_FOR_BUILD.c) -o $@ $^ -I$(top_srcdir)/tools -lm
> > > +
> > > + # We need to run make_at_dictionary, so it generates the
> > > + # at_interpreter_dictionary.h file
> > > +--
> > > +2.34.1
> > > +
> > > diff --git a/meta-multimedia/recipes-multimedia/spandsp/spandsp_git.b=
b
> b/meta-multimedia/recipes-multimedia/spandsp/spandsp_git.bb
> > > new file mode 100644
> > > index 000000000..84bc4a8f1
> > > --- /dev/null
> > > +++ b/meta-multimedia/recipes-multimedia/spandsp/spandsp_git.bb
> > > @@ -0,0 +1,47 @@
> > > +SUMMARY =3D "A DSP library for telephony"
> > > +DESCRIPTION =3D "\
> > > +    SpanDSP is a low-level signal processing library that modulates
> and \
> > > +    demodulates signals commonly used in telephony, such as the
> \"noise\" \
> > > +    generated by a fax modem or DTMF touchpad. \
> > > +"
> > > +HOMEPAGE =3D "https://www.soft-switch.org/"
> > > +BUGTRACKER =3D "https://github.com/freeswitch/spandsp/issues"
> > > +SECTION =3D "libs"
> > > +LICENSE =3D "LGPL-2.1-only"
> > > +LIC_FILES_CHKSUM =3D "
> file://COPYING;md5=3D8791c23ddf418deb5be264cffb5fa6bc"
> > > +
> > > +DEPENDS =3D "\
> > > +    libxml2 \
> > > +    tiff \
> > > +    tiff-native \
> > > +"
> > > +
> > > +PV =3D "3.0.0+git"
> > > +
> > > +SRC_URI =3D "\
> > > +    git://
> github.com/freeswitch/spandsp.git;protocol=3Dhttps;branch=3Dmaster \
> > > +    file://configure.patch \
> > > +    file://makefile.patch \
> > > +"
> > > +SRCREV =3D "7b0b8cf3d42b725405bcc63145de5e280265ce4e"
> > > +
> > > +S =3D "${WORKDIR}/git"
> > > +
> > > +inherit autotools
> > > +
> > > +PACKAGECONFIG ?=3D ""
> > > +
> > > +PACKAGECONFIG[mmx] =3D "--enable-mmx,--disable-mmx"
> > > +PACKAGECONFIG[sse] =3D "--enable-sse,--disable-sse"
> > > +PACKAGECONFIG[sse2] =3D "--enable-sse2,--disable-sse2"
> > > +PACKAGECONFIG[sse3] =3D "--enable-sse3,--disable-sse3"
> > > +PACKAGECONFIG[ssse3] =3D "--enable-ssse3,--disable-ssse3"
> > > +PACKAGECONFIG[sse4-1] =3D "--enable-sse4-1,--disable-sse4-1"
> > > +PACKAGECONFIG[sse4-2] =3D "--enable-sse4-2,--disable-sse4-2"
> > > +PACKAGECONFIG[avx] =3D "--enable-avx,--disable-avx"
> > > +PACKAGECONFIG[avx2] =3D "--enable-avx2,--disable-avx2"
> > > +PACKAGECONFIG[neon] =3D "--enable-neon,--disable-neon"
> > > +PACKAGECONFIG[fixed-point] =3D
> "--enable-fixed-point,--disable-fixed-point"
> > > +PACKAGECONFIG[v32bis] =3D "--enable-v32bis,--disable-v32bis"
> > > +PACKAGECONFIG[v34] =3D "--enable-v34,--disable-v34"
> > > +PACKAGECONFIG[sslfax] =3D "--enable-sslfax,--disable-sslfax"
> > > --
> > > 2.34.1
> > >
> > >
> > >
> > >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109334):
> https://lists.openembedded.org/g/openembedded-devel/message/109334
> Mute This Topic: https://lists.openembedded.org/mt/104933829/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000059bbda0613c28c16
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m seeing the same errors with gcc :)<div><br></div><=
div>libtool: compile: =C2=A0ccache arm-oe-linux-gnueabi-gcc -mthumb -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mcpu=3Dcortex-a9 -mtune=3Dcortex-a9 -fstack-p=
rotector-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werro=
r=3Dformat-security -Werror=3Dreturn-type -funwind-tables -D_TIME_BITS=3D64=
 -D_FILE_OFFSET_BITS=3D64 --sysroot=3DTOPDIR/BUILD/work/mach-oe-linux-gnuea=
bi/lib32-spandsp/3.0.0+git/lib32-recipe-sysroot -DHAVE_CONFIG_H -I. -I../..=
/git/src -I.. -DNDEBUG -Wunused-but-set-variable -std=3Dgnu99 -ffast-math -=
Wall -Wunused-variable -Wwrite-strings -Wstrict-prototypes -Wmissing-protot=
ypes -fvisibility=3Dhidden -DHAVE_VISIBILITY=3D1 -O2 -pipe -g -feliminate-u=
nused-debug-types -fcanon-prefix-map -fmacro-prefix-map=3DTOPDIR/BUILD/work=
/mach-oe-linux-gnueabi/lib32-spandsp/3.0.0+git/git=3D/usr/src/debug/lib32-s=
pandsp/3.0.0+git -fdebug-prefix-map=3DTOPDIR/BUILD/work/mach-oe-linux-gnuea=
bi/lib32-spandsp/3.0.0+git/git=3D/usr/src/debug/lib32-spandsp/3.0.0+git -fm=
acro-prefix-map=3DTOPDIR/BUILD/work/mach-oe-linux-gnueabi/lib32-spandsp/3.0=
.0+git/build=3D/usr/src/debug/lib32-spandsp/3.0.0+git -fdebug-prefix-map=3D=
TOPDIR/BUILD/work/mach-oe-linux-gnueabi/lib32-spandsp/3.0.0+git/build=3D/us=
r/src/debug/lib32-spandsp/3.0.0+git -fdebug-prefix-map=3DTOPDIR/BUILD/work/=
mach-oe-linux-gnueabi/lib32-spandsp/3.0.0+git/lib32-recipe-sysroot=3D -fmac=
ro-prefix-map=3DTOPDIR/BUILD/work/mach-oe-linux-gnueabi/lib32-spandsp/3.0.0=
+git/lib32-recipe-sysroot=3D -fdebug-prefix-map=3DTOPDIR/BUILD/work/mach-oe=
-linux-gnueabi/lib32-spandsp/3.0.0+git/recipe-sysroot-native=3D -c ../../gi=
t/src/t38_terminal.c =C2=A0-fPIC -DPIC -o .libs/t38_terminal.o<br>../../git=
/src/ademco_contactid.c:449:110: error: expected &#39;)&#39; before &#39;;&=
#39; token<br>=C2=A0 449 | static const int detection_threshold =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D goertzel_threshold_dbm0(GOERTZEL_SAMPLES=
_PER_BLOCK, -42.0f);<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>In file =
included from ../../git/src/ademco_contactid.c:66:<br>../../git/src/spandsp=
/tone_detect.h:63:55: note: to match this &#39;(&#39;<br>=C2=A0 =C2=A063 | =
#define goertzel_threshold_dbm0(len,thresh) =C2=A0 =C2=A0 (int) ((len*len*2=
56.0*256.0/2.0*pow(10.0, (thresh - DBM0_MAX_SINE_POWER)/10.0))<br>=C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>../../git/src/=
ademco_contactid.c:449:51: note: in expansion of macro &#39;goertzel_thresh=
old_dbm0&#39;<br>=C2=A0 449 | static const int detection_threshold =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D goertzel_threshold_dbm0(GOERTZEL_SAMP=
LES_PER_BLOCK, -42.0f);<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ^~~~~~~~~~~~~~~~~~~~~~~<br>../../git/src/ademco_contactid.c:449:18: war=
ning: &#39;detection_threshold&#39; defined but not used [-Wunused-const-va=
riable=3D]<br>=C2=A0 449 | static const int detection_threshold =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D goertzel_threshold_dbm0(GOERTZEL_SAMPLES=
_PER_BLOCK, -42.0f);<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~<br>../../git/src/adem=
co_contactid.c:210:35: warning: &#39;ademco_codes&#39; defined but not used=
 [-Wunused-const-variable=3D]<br>=C2=A0 210 | static const struct ademco_co=
de_s ademco_codes[] =3D<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~<br>make[2]: *** [Makefile:1091: ademco_co=
ntactid.lo] Error 1<br></div><div><br></div><div>This is with master-next m=
eta-oe from yesterday in build with multilib (night not be important)</div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Fri, Mar 15, 2024 at 8:19=E2=80=AFAM J=C3=B6rg Sommer via <a href=3D"htt=
p://lists.openembedded.org">lists.openembedded.org</a> &lt;joerg.sommer=3D<=
a href=3D"mailto:navimatix.de@lists.openembedded.org">navimatix.de@lists.op=
enembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div class=3D"msg636519657037224576">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Yes, I&#39;m getting these errors, too, when compiling with clang; independ=
ent of the clang version up to 19. It seems to be a problem of `pow()`. gcc=
 might have a built-in and can compute it at compile-time, while clang has =
no built-in of pow.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div id=3D"m_636519657037224576Signature">
<div><span style=3D"font-family:Calibri,serif;font-size:12pt;color:rgb(64,6=
4,64)"><br>
</span></div>
<p style=3D"line-height:115%;margin-bottom:0in;font-family:Calibri,serif">
<span style=3D"font-size:12pt;color:rgb(64,64,64)">J=C3=B6rg Sommer</span><=
/p>
<p style=3D"line-height:115%;margin-bottom:0in;font-family:Calibri,serif">
<span style=3D"font-size:12pt;color:rgb(64,64,64)">Software Developer / Pro=
grammierer</span></p>
<span style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cal=
ibri,Helvetica,sans-serif;font-size:12pt;color:rgb(64,64,64)">--<br>
</span>
<div><span style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontServic=
e,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(64,64,64)"><br>
</span></div>
<table id=3D"m_636519657037224576tableSelected0" style=3D"width:586px">
<tbody>
<tr>
<td style=3D"border-width:medium;border-style:none;border-color:currentcolo=
r;padding:0in;vertical-align:top;width:184px">
<p style=3D"line-height:115%;margin-bottom:0in;font-family:Calibri,serif">
<span style=3D"font-size:10pt;color:rgb(64,64,64)">Navimatix GmbH</span></p=
>
<p style=3D"line-height:115%;margin-bottom:0in;font-family:Calibri,serif">
<span style=3D"font-size:10pt;color:rgb(64,64,64)">Tatzendpromenade 2</span=
></p>
<p style=3D"line-height:115%;margin-bottom:0.1in;font-family:Calibri,serif"=
>
<span style=3D"font-size:10pt;color:rgb(64,64,64)">07745 Jena</span><span s=
tyle=3D"font-size:9pt;color:rgb(64,64,64)"> =C2=A0</span></p>
</td>
<td style=3D"border-width:medium;border-style:none;border-color:currentcolo=
r;padding:0in;vertical-align:top;width:220px">
<p style=3D"line-height:115%;margin-bottom:0in;font-family:Calibri,serif">
<span style=3D"font-size:10pt;color:rgb(64,64,64)">T: 03641 - 327 99 0</spa=
n></p>
<p style=3D"line-height:115%;margin-bottom:0in;font-family:Calibri,serif">
<span style=3D"font-size:10pt;color:rgb(64,64,64)">F: 03641 - 526 306</span=
></p>
<p style=3D"line-height:115%;margin-bottom:0in;font-family:Calibri,serif">
<span style=3D"font-size:10pt;color:rgb(64,64,64)">M: </span><span style=3D=
"font-size:10pt;color:rgb(5,99,193)"><u><a href=3D"mailto:joerg.sommer@navi=
matix.de" target=3D"_blank">joerg.sommer@navimatix.de</a></u></span></p>
<p style=3D"line-height:115%;margin-bottom:0in;font-family:Calibri,serif">
<span style=3D"font-size:10pt;color:rgb(5,99,193)"><u><a href=3D"http://www=
.navimatix.de/" style=3D"margin-top:0px;margin-bottom:0px" target=3D"_blank=
">www.navimatix.de</a></u></span></p>
</td>
<td style=3D"border-width:medium;border-style:none;border-color:currentcolo=
r;padding:0in;width:139px">
<p style=3D"line-height:115%;margin-bottom:0.1in;font-family:Calibri,serif"=
>
<span style=3D"font-size:12pt;color:rgb(0,0,0)"><br>
</span></p>
</td>
</tr>
</tbody>
</table>
<p style=3D"line-height:115%;margin-bottom:0in;font-family:Calibri,serif">
<span style=3D"font-size:12pt;color:rgb(0,0,0)"><br>
</span></p>
<p style=3D"line-height:115%;margin-bottom:0in;font-family:Calibri,serif">
<span style=3D"font-size:10pt;color:rgb(64,64,64)">Gesch=C3=A4ftsf=C3=BChre=
r: Steffen Sp=C3=A4the, Jan Rommeley</span></p>
<p style=3D"line-height:115%;margin-bottom:0in;font-family:Calibri,serif">
<span style=3D"font-size:10pt;color:rgb(64,64,64)">Registergericht: Amtsger=
icht Jena, HRB 501480</span></p>
<span style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cal=
ibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)"><br>
</span></div>
<div id=3D"m_636519657037224576appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_636519657037224576divRplyFwdMsg" dir=3D"ltr"><font face=3D"Cal=
ibri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>From:</b> K=
hem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khe=
m@gmail.com</a>&gt;<br>
<b>Sent:</b> Friday, 15 March 2024 06:13<br>
<b>To:</b> J=C3=B6rg Sommer &lt;<a href=3D"mailto:joerg.sommer@navimatix.de=
" target=3D"_blank">joerg.sommer@navimatix.de</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-devel@lists.openembedded.org" tar=
get=3D"_blank">openembedded-devel@lists.openembedded.org</a> &lt;<a href=3D=
"mailto:openembedded-devel@lists.openembedded.org" target=3D"_blank">openem=
bedded-devel@lists.openembedded.org</a>&gt;<br>
<b>Subject:</b> Re: [oe] [meta-multimedia][PATCH v2] spandsp: new telephony=
 DSP library</font>
<div>=C2=A0</div>
</div>
<div><font size=3D"2"><span style=3D"font-size:11pt">
<div>Not much to do with musl, it fails when I use clang on my desktop as<b=
r>
well. you can see the same errors with clang on host<br>
<br>
CC=3Dclang ./configure<br>
make<br>
<br>
On Thu, Mar 14, 2024 at 9:37=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:raj.=
khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; fails to build with musl/clang<br>
&gt;<br>
&gt; <a href=3D"https://snips.sh/f/qCR86Rwwz1" target=3D"_blank">https://sn=
ips.sh/f/qCR86Rwwz1</a><br>
&gt;<br>
&gt; On Thu, Mar 14, 2024 at 12:43=E2=80=AFPM J=C3=B6rg Sommer via<br>
&gt; <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.open=
embedded.org</a><br>
&gt; &lt;joerg.sommer=3D<a href=3D"mailto:navimatix.de@lists.openembedded.o=
rg" target=3D"_blank">navimatix.de@lists.openembedded.org</a>&gt; wrote:<br=
>
&gt; &gt;<br>
&gt; &gt; From: J=C3=B6rg Sommer &lt;<a href=3D"mailto:joerg.sommer@navimat=
ix.de" target=3D"_blank">joerg.sommer@navimatix.de</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: J=C3=B6rg Sommer &lt;<a href=3D"mailto:joerg.somme=
r@navimatix.de" target=3D"_blank">joerg.sommer@navimatix.de</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 .../spandsp/spandsp/configure.patch=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 56 ++++++<br>
&gt; &gt;=C2=A0 .../spandsp/spandsp/makefile.patch=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 161 ++++++++++++++++++<br>
&gt; &gt;=C2=A0 .../recipes-multimedia/spandsp/<a href=3D"http://spandsp_gi=
t.bb" target=3D"_blank">spandsp_git.bb</a> |=C2=A0 47 +++++<br>
&gt; &gt;=C2=A0 3 files changed, 264 insertions(+)<br>
&gt; &gt;=C2=A0 create mode 100644 meta-multimedia/recipes-multimedia/spand=
sp/spandsp/configure.patch<br>
&gt; &gt;=C2=A0 create mode 100644 meta-multimedia/recipes-multimedia/spand=
sp/spandsp/makefile.patch<br>
&gt; &gt;=C2=A0 create mode 100644 meta-multimedia/recipes-multimedia/spand=
sp/<a href=3D"http://spandsp_git.bb" target=3D"_blank">spandsp_git.bb</a><b=
r>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-multimedia/recipes-multimedia/spandsp/spandsp/c=
onfigure.patch b/meta-multimedia/recipes-multimedia/spandsp/spandsp/configu=
re.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 000000000..af504be76<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta-multimedia/recipes-multimedia/spandsp/spandsp/configur=
e.patch<br>
&gt; &gt; @@ -0,0 +1,56 @@<br>
&gt; &gt; +From: =3D?UTF-8?q?J=3DC3=3DB6rg=3D20Sommer?=3D &lt;<a href=3D"ma=
ilto:joerg.sommer@navimatix.de" target=3D"_blank">joerg.sommer@navimatix.de=
</a>&gt;<br>
&gt; &gt; +Date: Thu, 14 Mar 2024 09:41:57 +0100<br>
&gt; &gt; +Subject: [PATCH 2/2] configure: Replace manual search for libxml=
 by<br>
&gt; &gt; + AC_CHECK_LIB<br>
&gt; &gt; +MIME-Version: 1.0<br>
&gt; &gt; +Content-Type: text/plain; charset=3DUTF-8<br>
&gt; &gt; +Content-Transfer-Encoding: 8bit<br>
&gt; &gt; +<br>
&gt; &gt; +The manual search fails if the include directories (and build en=
vironment)<br>
&gt; &gt; +are located somewhere else.<br>
&gt; &gt; +<br>
&gt; &gt; +Signed-off-by: J=C3=B6rg Sommer &lt;<a href=3D"mailto:joerg.somm=
er@navimatix.de" target=3D"_blank">joerg.sommer@navimatix.de</a>&gt;<br>
&gt; &gt; +Upstream-Status: Submitted [<a href=3D"https://github.com/freesw=
itch/spandsp/pull/74" target=3D"_blank">https://github.com/freeswitch/spand=
sp/pull/74</a>]<br>
&gt; &gt; +---<br>
&gt; &gt; +<br>
&gt; &gt; +ERROR: spandsp-3.0.0+git-r0 do_configure: QA Issue: This autocon=
f log indicates errors, it looked at host include and/or library paths whil=
e determining system capabilities.<br>
&gt; &gt; +<br>
&gt; &gt; + <a href=3D"http://configure.ac" target=3D"_blank">configure.ac<=
/a> | 22 +++++-----------------<br>
&gt; &gt; + 1 file changed, 5 insertions(+), 17 deletions(-)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/<a href=3D"http://configure.ac" target=3D"_blank">c=
onfigure.ac</a> b/<a href=3D"http://configure.ac" target=3D"_blank">configu=
re.ac</a><br>
&gt; &gt; +index 2140837..b5138d6 100644<br>
&gt; &gt; +--- a/<a href=3D"http://configure.ac" target=3D"_blank">configur=
e.ac</a><br>
&gt; &gt; ++++ b/<a href=3D"http://configure.ac" target=3D"_blank">configur=
e.ac</a><br>
&gt; &gt; +@@ -185,23 +185,11 @@ then<br>
&gt; &gt; + fi<br>
&gt; &gt; +<br>
&gt; &gt; + # Determine XML2 include path<br>
&gt; &gt; +-AC_MSG_CHECKING(for libxml/xmlmemory.h)<br>
&gt; &gt; +-<br>
&gt; &gt; +-# Can we include headers using system include dirs?<br>
&gt; &gt; +-AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[#include &lt;libxml/xmlmem=
ory.h&gt;]], [[int a =3D 1;]])],[XML2_INCLUDE=3D&quot; &quot;],[XML2_INCLUD=
E=3D])<br>
&gt; &gt; +-<br>
&gt; &gt; +-# Hunt through several possible directories to find the include=
s for libxml2<br>
&gt; &gt; +-if test &quot;x$XML2_INCLUDE&quot; =3D &quot;x&quot;; then<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 old_CPPFLAGS=3D&quot;$CPPFLAGS&quot;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 for i in $xml2_include_dir /usr/include /usr=
/local/include /usr/include/libxml2 /usr/local/include/libxml2 ; do<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CPPFLAGS=3D&quot;$ol=
d_CPPFLAGS -I$i&quot;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AC_COMPILE_IFELSE([A=
C_LANG_PROGRAM([[#include &lt;libxml/xmlmemory.h&gt;]], [[int a =3D 1;]])],=
[XML2_INCLUDE=3D&quot;-I$i&quot;],[XML2_INCLUDE=3D<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ])<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if test &quot;x$XML2=
_INCLUDE&quot; !=3D &quot;x&quot;; then<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 break;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 done<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 CPPFLAGS=3D&quot;$old_CPPFLAGS $XML2_INCLUDE=
&quot;<br>
&gt; &gt; ++AC_CHECK_LIB([xml2], [xmlParseFile], [libxml2_found=3Dyes])<br>
&gt; &gt; ++if test &quot;$libxml2_found&quot; =3D &quot;yes&quot; ; then<b=
r>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 AC_DEFINE(HAVE_LIBXML2,1,[defined when libxm=
l2 is available])<br>
&gt; &gt; ++else<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 AC_MSG_WARN([libxml2 not found. Disabling ca=
che.])<br>
&gt; &gt; + fi<br>
&gt; &gt; +<br>
&gt; &gt; + AC_CHECK_HEADERS([libxml/xmlmemory.h])<br>
&gt; &gt; +--<br>
&gt; &gt; +2.34.1<br>
&gt; &gt; +<br>
&gt; &gt; diff --git a/meta-multimedia/recipes-multimedia/spandsp/spandsp/m=
akefile.patch b/meta-multimedia/recipes-multimedia/spandsp/spandsp/makefile=
.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 000000000..d3eb047fe<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta-multimedia/recipes-multimedia/spandsp/spandsp/makefile=
.patch<br>
&gt; &gt; @@ -0,0 +1,161 @@<br>
&gt; &gt; +From: =3D?UTF-8?q?J=3DC3=3DB6rg=3D20Sommer?=3D &lt;<a href=3D"ma=
ilto:joerg.sommer@navimatix.de" target=3D"_blank">joerg.sommer@navimatix.de=
</a>&gt;<br>
&gt; &gt; +Date: Thu, 14 Mar 2024 08:08:13 +0100<br>
&gt; &gt; +Subject: [PATCH 1/2] configure: Use AX_PROG_CC_FOR_BUILD for cro=
ss compiling<br>
&gt; &gt; +MIME-Version: 1.0<br>
&gt; &gt; +Content-Type: text/plain; charset=3DUTF-8<br>
&gt; &gt; +Content-Transfer-Encoding: 8bit<br>
&gt; &gt; +<br>
&gt; &gt; +The macro AX_PROG_CC_FOR_BUILD [1] sets the variables CC_FOR_BUI=
LD and<br>
&gt; &gt; +..._FLAGS_FOR_BUILD they can be used [2] to build binaries used =
at compile<br>
&gt; &gt; +time.<br>
&gt; &gt; +<br>
&gt; &gt; +[1]: <a href=3D"https://www.gnu.org/software/autoconf-archive/ax=
_prog_cc_for_build.html" target=3D"_blank">
https://www.gnu.org/software/autoconf-archive/ax_prog_cc_for_build.html</a>=
<br>
&gt; &gt; +[2]: <a href=3D"https://stackoverflow.com/questions/24201260/aut=
otools-cross-compilation-and-generated-sources/24208587#24208587" target=3D=
"_blank">
https://stackoverflow.com/questions/24201260/autotools-cross-compilation-an=
d-generated-sources/24208587#24208587</a><br>
&gt; &gt; +<br>
&gt; &gt; +Signed-off-by: J=C3=B6rg Sommer &lt;<a href=3D"mailto:joerg.somm=
er@navimatix.de" target=3D"_blank">joerg.sommer@navimatix.de</a>&gt;<br>
&gt; &gt; +Upstream-Status: Submitted [<a href=3D"https://github.com/freesw=
itch/spandsp/pull/74" target=3D"_blank">https://github.com/freeswitch/spand=
sp/pull/74</a>]<br>
&gt; &gt; +---<br>
&gt; &gt; + <a href=3D"http://configure.ac" target=3D"_blank">configure.ac<=
/a>=C2=A0=C2=A0=C2=A0 | 49 +-------------------------------------------<br>
&gt; &gt; + src/Makefile.am | 54 +++++++++++++++++++++++++-----------------=
-------<br>
&gt; &gt; + 2 files changed, 29 insertions(+), 74 deletions(-)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/<a href=3D"http://configure.ac" target=3D"_blank">c=
onfigure.ac</a> b/<a href=3D"http://configure.ac" target=3D"_blank">configu=
re.ac</a><br>
&gt; &gt; +index 96fd022..2140837 100644<br>
&gt; &gt; +--- a/<a href=3D"http://configure.ac" target=3D"_blank">configur=
e.ac</a><br>
&gt; &gt; ++++ b/<a href=3D"http://configure.ac" target=3D"_blank">configur=
e.ac</a><br>
&gt; &gt; +@@ -55,54 +55,7 @@ AC_LANG([C])<br>
&gt; &gt; +<br>
&gt; &gt; + AX_COMPILER_VENDOR<br>
&gt; &gt; +<br>
&gt; &gt; +-if test &quot;${build}&quot; !=3D &quot;${host}&quot;<br>
&gt; &gt; +-then<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 # If we are doing a Canadian Cross, in which=
 the host and build systems<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 # are not the same, we set reasonable defaul=
t values for the tools.<br>
&gt; &gt; +-<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 CC_FOR_BUILD=3D${CC_FOR_BUILD-gcc}<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 CPPFLAGS_FOR_BUILD=3D&quot;\$(CPPFLAGS)&quot=
;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 CC=3D${CC-${host_alias}-gcc}<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 CFLAGS=3D${CFLAGS-&quot;-g -O2&quot;}<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 CXX=3D${CXX-${host_alias}-c++}<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 CXXFLAGS=3D${CXXFLAGS-&quot;-g -O2&quot;}<br=
>
&gt; &gt; +-else<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 # Set reasonable default values for some too=
ls even if not Canadian.<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 # Of course, these are different reasonable =
default values, originally<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 # specified directly in the Makefile.<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 # We don&#39;t export, so that autoconf can =
do its job.<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 # Note that all these settings are above the=
 fragment inclusion point<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 # in Makefile.in, so can still be overridden=
 by fragments.<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 # This is all going to change when we autoco=
nfiscate...<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 CC_FOR_BUILD=3D&quot;\$(CC)&quot;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 CPPFLAGS_FOR_BUILD=3D&quot;\$(CPPFLAGS)&quot=
;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 AC_PROG_CC<br>
&gt; &gt; +-<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 # We must set the default linker to the link=
er used by gcc for the correct<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 # operation of libtool.=C2=A0 If LD is not d=
efined and we are using gcc, try to<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 # set the LD default to the ld used by gcc.<=
br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 if test -z &quot;$LD&quot;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 then<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if test &quot;$GCC&q=
uot; =3D yes<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 then<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 case $build in<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 *-*-mingw*)<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 gcc_prog_ld=3D`$CC -print-prog-name=3Dld 2&gt;&=
amp;1 | tr -d &#39;\015&#39;` ;;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 *)<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 gcc_prog_ld=3D`$CC -print-prog-name=3Dld 2&gt;&=
amp;1` ;;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 esac<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 case $gcc_prog_ld in<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 # Accept absolute paths.<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [[\\/]* | [A-Za-z]:[\\/]*)]<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 LD=3D&quot;$gcc_prog_ld&quot; ;;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 esac<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 fi<br>
&gt; &gt; +-<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 CXX=3D${CXX-&quot;c++&quot;}<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 CFLAGS=3D${CFLAGS-&quot;-g -O2&quot;}<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 CXXFLAGS=3D${CXXFLAGS-&quot;-g -O2&quot;}<br=
>
&gt; &gt; +-fi<br>
&gt; &gt; ++AX_PROG_CC_FOR_BUILD<br>
&gt; &gt; +<br>
&gt; &gt; + AC_DEFUN([REMOVE_FROM_VAR],[<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0 new_val=3D&quot;&quot;<br>
&gt; &gt; +diff --git a/src/Makefile.am b/src/Makefile.am<br>
&gt; &gt; +index e05fad5..9b409a1 100644<br>
&gt; &gt; +--- a/src/Makefile.am<br>
&gt; &gt; ++++ b/src/Makefile.am<br>
&gt; &gt; +@@ -386,44 +386,46 @@ noinst_HEADERS =3D cielab_luts.h \<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v34_tx_pre_emphasis_filters.h \<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v34_tables.h<br>
&gt; &gt; +<br>
&gt; &gt; +-make_at_dictionary$(EXEEXT): $(top_srcdir)/src/make_at_dictiona=
ry.c<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(CC_FOR_BUILD) -o make_at_dicti=
onary$(EXEEXT) $(top_srcdir)/src/make_at_dictionary.c -DHAVE_CONFIG_H -I$(t=
op_builddir)/src<br>
&gt; &gt; ++LINK_FOR_BUILD.c =3D $(CC_FOR_BUILD) -DHAVE_CONFIG_H -I$(top_bu=
ilddir)/src $(CFLAGS_FOR_BUILD) $(CPPFLAGS_FOR_BUILD) $(LDFLAGS_FOR_BUILD) =
$(TARGET_ARCH_FOR_BUILD)<br>
&gt; &gt; +<br>
&gt; &gt; +-make_cielab_luts$(EXEEXT): $(top_srcdir)/src/make_cielab_luts.c=
<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(CC_FOR_BUILD) -o make_cielab_l=
uts$(EXEEXT) $(top_srcdir)/src/make_cielab_luts.c -DHAVE_CONFIG_H -I$(top_b=
uilddir)/src -lm<br>
&gt; &gt; ++make_at_dictionary$(BUILD_EXEEXT): $(top_srcdir)/src/make_at_di=
ctionary.c<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(LINK_FOR_BUILD.c) -o $@ $^<br>
&gt; &gt; +<br>
&gt; &gt; +-make_math_fixed_tables$(EXEEXT): $(top_srcdir)/src/make_math_fi=
xed_tables.c<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(CC_FOR_BUILD) -o make_math_fix=
ed_tables$(EXEEXT) $(top_srcdir)/src/make_math_fixed_tables.c -DHAVE_CONFIG=
_H -I$(top_builddir)/src -lm<br>
&gt; &gt; ++make_cielab_luts$(BUILD_EXEEXT): $(top_srcdir)/src/make_cielab_=
luts.c<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(LINK_FOR_BUILD.c) -o $@ $^ -lm=
<br>
&gt; &gt; +<br>
&gt; &gt; +-make_modem_filter$(EXEEXT): $(top_srcdir)/src/make_modem_filter=
.c $(top_srcdir)/src/filter_tools.c<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(CC_FOR_BUILD) -o make_modem_fi=
lter$(EXEEXT) $(top_srcdir)/src/make_modem_filter.c $(top_srcdir)/src/filte=
r_tools.c -DHAVE_CONFIG_H -I$(top_builddir)/src -lm<br>
&gt; &gt; ++make_math_fixed_tables$(BUILD_EXEEXT): $(top_srcdir)/src/make_m=
ath_fixed_tables.c<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(LINK_FOR_BUILD.c) -o $@ $^ -lm=
<br>
&gt; &gt; +<br>
&gt; &gt; +-make_modem_godard_coefficients$(EXEEXT): $(top_srcdir)/src/make=
_modem_godard_coefficients.c $(top_srcdir)/src/filter_tools.c<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(CC_FOR_BUILD) -o make_modem_go=
dard_coefficients$(EXEEXT) $(top_srcdir)/src/make_modem_godard_coefficients=
.c $(top_srcdir)/src/filter_tools.c -DHAVE_CONFIG_H -I$(top_builddir)/src -=
lm<br>
&gt; &gt; ++make_modem_filter$(BUILD_EXEEXT): $(top_srcdir)/src/make_modem_=
filter.c $(top_srcdir)/src/filter_tools.c<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(LINK_FOR_BUILD.c) -o $@ $^ -lm=
<br>
&gt; &gt; +<br>
&gt; &gt; +-make_t43_gray_code_tables$(EXEEXT): $(top_srcdir)/src/make_t43_=
gray_code_tables.c<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(CC_FOR_BUILD) -o make_t43_gray=
_code_tables$(EXEEXT) $(top_srcdir)/src/make_t43_gray_code_tables.c -DHAVE_=
CONFIG_H -I$(top_builddir)/src -lm<br>
&gt; &gt; ++make_modem_godard_coefficients$(BUILD_EXEEXT): $(top_srcdir)/sr=
c/make_modem_godard_coefficients.c $(top_srcdir)/src/filter_tools.c<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(LINK_FOR_BUILD.c) -o $@ $^ -lm=
<br>
&gt; &gt; +<br>
&gt; &gt; +-make_v17_v32_constellation_map$(EXEEXT): $(top_srcdir)/src/make=
_v17_v32_constellation_map.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/all=
oc.c<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(CC_FOR_BUILD) -o make_v17_v32_=
constellation_map$(EXEEXT) $(top_srcdir)/src/make_v17_v32_constellation_map=
.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c -DHAVE_CONFIG_H -I$(t=
op_builddir)/src -lm<br>
&gt; &gt; ++make_t43_gray_code_tables$(BUILD_EXEEXT): $(top_srcdir)/src/mak=
e_t43_gray_code_tables.c<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(LINK_FOR_BUILD.c) -o $@ $^ -lm=
<br>
&gt; &gt; +<br>
&gt; &gt; +-make_v17_v32_convolutional_encoder$(EXEEXT): $(top_srcdir)/src/=
make_v17_v32_convolutional_encoder.c $(top_srcdir)/src/g711.c $(top_srcdir)=
/src/alloc.c<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(CC_FOR_BUILD) -o make_v17_v32_=
convolutional_encoder$(EXEEXT) $(top_srcdir)/src/make_v17_v32_convolutional=
_encoder.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c -DHAVE_CONFIG=
_H -I$(top_builddir)/src -lm<br>
&gt; &gt; ++make_v17_v32_constellation_map$(BUILD_EXEEXT): $(top_srcdir)/sr=
c/make_v17_v32_constellation_map.c $(top_srcdir)/src/g711.c $(top_srcdir)/s=
rc/alloc.c<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(LINK_FOR_BUILD.c) -o $@ $^ -lm=
<br>
&gt; &gt; +<br>
&gt; &gt; +-make_v29_constellation_map$(EXEEXT): $(top_srcdir)/src/make_v29=
_constellation_map.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(CC_FOR_BUILD) -o make_v29_cons=
tellation_map$(EXEEXT) $(top_srcdir)/src/make_v29_constellation_map.c $(top=
_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c -DHAVE_CONFIG_H -I$(top_build=
dir)/src -lm<br>
&gt; &gt; ++make_v17_v32_convolutional_encoder$(BUILD_EXEEXT): $(top_srcdir=
)/src/make_v17_v32_convolutional_encoder.c $(top_srcdir)/src/g711.c $(top_s=
rcdir)/src/alloc.c<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(LINK_FOR_BUILD.c) -o $@ $^ -lm=
<br>
&gt; &gt; +<br>
&gt; &gt; +-make_v34_convolutional_coders$(EXEEXT): $(top_srcdir)/src/make_=
v34_convolutional_coders.c<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(CC_FOR_BUILD) -o make_v34_conv=
olutional_coders$(EXEEXT) $(top_srcdir)/src/make_v34_convolutional_coders.c=
 -DHAVE_CONFIG_H -I$(top_builddir)/src -lm<br>
&gt; &gt; ++make_v29_constellation_map$(BUILD_EXEEXT): $(top_srcdir)/src/ma=
ke_v29_constellation_map.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc=
.c<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(LINK_FOR_BUILD.c) -o $@ $^ -lm=
<br>
&gt; &gt; +<br>
&gt; &gt; +-make_v34_probe_signals$(EXEEXT): $(top_srcdir)/src/make_v34_pro=
be_signals.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(CC_FOR_BUILD) -o make_v34_prob=
e_signals$(EXEEXT) $(top_srcdir)/src/make_v34_probe_signals.c $(top_srcdir)=
/src/g711.c $(top_srcdir)/src/alloc.c -DHAVE_CONFIG_H -I$(top_builddir)/src=
 -lm<br>
&gt; &gt; ++make_v34_convolutional_coders$(BUILD_EXEEXT): $(top_srcdir)/src=
/make_v34_convolutional_coders.c<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(LINK_FOR_BUILD.c) -o $@ $^ -lm=
<br>
&gt; &gt; +<br>
&gt; &gt; +-make_v34_shell_map$(EXEEXT): $(top_srcdir)/src/make_v34_shell_m=
ap.c<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(CC_FOR_BUILD) -o make_v34_shel=
l_map$(EXEEXT) $(top_srcdir)/src/make_v34_shell_map.c -DHAVE_CONFIG_H -I$(t=
op_builddir)/src<br>
&gt; &gt; ++make_v34_probe_signals$(BUILD_EXEEXT): $(top_srcdir)/src/make_v=
34_probe_signals.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(LINK_FOR_BUILD.c) -o $@ $^ -I$=
(top_srcdir)/src -lm<br>
&gt; &gt; +<br>
&gt; &gt; +-make_v34_tx_pre_emphasis_filters$(EXEEXT): $(top_srcdir)/src/ma=
ke_v34_tx_pre_emphasis_filters.c $(top_srcdir)/tools/meteor-engine.c<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(CC_FOR_BUILD) -o make_v34_tx_p=
re_emphasis_filters$(EXEEXT) $(top_srcdir)/src/make_v34_tx_pre_emphasis_fil=
ters.c $(top_srcdir)/tools/meteor-engine.c -DHAVE_CONFIG_H -I$(top_builddir=
)/src -I$(top_builddir)/tools -lm<br>
&gt; &gt; ++make_v34_shell_map$(BUILD_EXEEXT): $(top_srcdir)/src/make_v34_s=
hell_map.c<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(LINK_FOR_BUILD.c) -o $@ $^<br>
&gt; &gt; ++<br>
&gt; &gt; ++make_v34_tx_pre_emphasis_filters$(BUILD_EXEEXT): $(top_srcdir)/=
src/make_v34_tx_pre_emphasis_filters.c $(top_srcdir)/tools/meteor-engine.c<=
br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(LINK_FOR_BUILD.c) -o $@ $^ -I$=
(top_srcdir)/tools -lm<br>
&gt; &gt; +<br>
&gt; &gt; + # We need to run make_at_dictionary, so it generates the<br>
&gt; &gt; + # at_interpreter_dictionary.h file<br>
&gt; &gt; +--<br>
&gt; &gt; +2.34.1<br>
&gt; &gt; +<br>
&gt; &gt; diff --git a/meta-multimedia/recipes-multimedia/spandsp/<a href=
=3D"http://spandsp_git.bb" target=3D"_blank">spandsp_git.bb</a> b/meta-mult=
imedia/recipes-multimedia/spandsp/<a href=3D"http://spandsp_git.bb" target=
=3D"_blank">spandsp_git.bb</a><br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 000000000..84bc4a8f1<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta-multimedia/recipes-multimedia/spandsp/<a href=3D"http:=
//spandsp_git.bb" target=3D"_blank">spandsp_git.bb</a><br>
&gt; &gt; @@ -0,0 +1,47 @@<br>
&gt; &gt; +SUMMARY =3D &quot;A DSP library for telephony&quot;<br>
&gt; &gt; +DESCRIPTION =3D &quot;\<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0 SpanDSP is a low-level signal processing libr=
ary that modulates and \<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0 demodulates signals commonly used in telephon=
y, such as the \&quot;noise\&quot; \<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0 generated by a fax modem or DTMF touchpad. \<=
br>
&gt; &gt; +&quot;<br>
&gt; &gt; +HOMEPAGE =3D &quot;<a href=3D"https://www.soft-switch.org/" targ=
et=3D"_blank">https://www.soft-switch.org/</a>&quot;<br>
&gt; &gt; +BUGTRACKER =3D &quot;<a href=3D"https://github.com/freeswitch/sp=
andsp/issues" target=3D"_blank">https://github.com/freeswitch/spandsp/issue=
s</a>&quot;<br>
&gt; &gt; +SECTION =3D &quot;libs&quot;<br>
&gt; &gt; +LICENSE =3D &quot;LGPL-2.1-only&quot;<br>
&gt; &gt; +LIC_FILES_CHKSUM =3D &quot;<a>file://COPYING;md5=3D8791c23ddf418=
deb5be264cffb5fa6bc</a>&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +DEPENDS =3D &quot;\<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0 libxml2 \<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0 tiff \<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0 tiff-native \<br>
&gt; &gt; +&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +PV =3D &quot;3.0.0+git&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +SRC_URI =3D &quot;\<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0 git://<a href=3D"http://github.com/freeswitch=
/spandsp.git;protocol=3Dhttps;branch=3Dmaster" target=3D"_blank">github.com=
/freeswitch/spandsp.git;protocol=3Dhttps;branch=3Dmaster</a> \<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0 <a>file://configure.patch</a> \<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0 <a>file://makefile.patch</a> \<br>
&gt; &gt; +&quot;<br>
&gt; &gt; +SRCREV =3D &quot;7b0b8cf3d42b725405bcc63145de5e280265ce4e&quot;<=
br>
&gt; &gt; +<br>
&gt; &gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +inherit autotools<br>
&gt; &gt; +<br>
&gt; &gt; +PACKAGECONFIG ?=3D &quot;&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +PACKAGECONFIG[mmx] =3D &quot;--enable-mmx,--disable-mmx&quot;<br=
>
&gt; &gt; +PACKAGECONFIG[sse] =3D &quot;--enable-sse,--disable-sse&quot;<br=
>
&gt; &gt; +PACKAGECONFIG[sse2] =3D &quot;--enable-sse2,--disable-sse2&quot;=
<br>
&gt; &gt; +PACKAGECONFIG[sse3] =3D &quot;--enable-sse3,--disable-sse3&quot;=
<br>
&gt; &gt; +PACKAGECONFIG[ssse3] =3D &quot;--enable-ssse3,--disable-ssse3&qu=
ot;<br>
&gt; &gt; +PACKAGECONFIG[sse4-1] =3D &quot;--enable-sse4-1,--disable-sse4-1=
&quot;<br>
&gt; &gt; +PACKAGECONFIG[sse4-2] =3D &quot;--enable-sse4-2,--disable-sse4-2=
&quot;<br>
&gt; &gt; +PACKAGECONFIG[avx] =3D &quot;--enable-avx,--disable-avx&quot;<br=
>
&gt; &gt; +PACKAGECONFIG[avx2] =3D &quot;--enable-avx2,--disable-avx2&quot;=
<br>
&gt; &gt; +PACKAGECONFIG[neon] =3D &quot;--enable-neon,--disable-neon&quot;=
<br>
&gt; &gt; +PACKAGECONFIG[fixed-point] =3D &quot;--enable-fixed-point,--disa=
ble-fixed-point&quot;<br>
&gt; &gt; +PACKAGECONFIG[v32bis] =3D &quot;--enable-v32bis,--disable-v32bis=
&quot;<br>
&gt; &gt; +PACKAGECONFIG[v34] =3D &quot;--enable-v34,--disable-v34&quot;<br=
>
&gt; &gt; +PACKAGECONFIG[sslfax] =3D &quot;--enable-sslfax,--disable-sslfax=
&quot;<br>
&gt; &gt; --<br>
&gt; &gt; 2.34.1<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; <br>
&gt; &gt;<br>
</div>
</span></font></div>
</div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#109334): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/109334" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/109334</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104933829/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/104933829/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" =
target=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</div></blockquote></div>

--00000000000059bbda0613c28c16--

