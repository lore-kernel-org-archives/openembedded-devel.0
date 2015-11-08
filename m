Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id D1E8B75EE7
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Nov 2015 20:50:51 +0000 (UTC)
Received: by wiva10 with SMTP id a10so22863740wiv.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Nov 2015 12:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=lbyBjvIqjD+/OjF/6azLNaHIOtlcByoJEa0UrdeA5IY=;
	b=Mc1wIMLDo9EJa35UlYY4xPZ5DrmXwCuWWSruuzAl45GZgtkmK8Bh8VXwl7TQWep9nx
	LoU5UZoNIRWgwu7lZjUNf1H2ArOAlHqLtyrwUmruVlRWj3XNZ3UCQTxTNpwRR02qCVrb
	I4C2mfxck+q+YVG1LlFbKbVq8VnY/GdNvi75xCKRCcAV8+XizYUGl8+8GMCt0b3NPfcb
	yPEDAFOL9yJDGGVD2WoaC8ZjMvm6QOsO8FmKgM+WQrYBQ85DQJmacpLizPVGobfRscJC
	GzJguc71VpT1AnWYWaT+/DdfQzgSB4Uu2KykjIFY2S/AOfgjoB1iDahP2acP4Ou+qLBm
	HM7g==
MIME-Version: 1.0
X-Received: by 10.194.142.142 with SMTP id rw14mr26977200wjb.100.1447015851372;
	Sun, 08 Nov 2015 12:50:51 -0800 (PST)
Received: by 10.194.154.232 with HTTP; Sun, 8 Nov 2015 12:50:51 -0800 (PST)
In-Reply-To: <CALbNGRQk84xAEK01=RAKK3vsY5X0CTqUUAD6Sb6GXqpMEDRswg@mail.gmail.com>
References: <1446980869-13083-1-git-send-email-Martin.Jansa@gmail.com>
	<CALbNGRQk84xAEK01=RAKK3vsY5X0CTqUUAD6Sb6GXqpMEDRswg@mail.gmail.com>
Date: Sun, 8 Nov 2015 21:50:51 +0100
Message-ID: <CA+chaQfyy2rFonPRt6v7_wML08JUCFWLnoRic2Rbr33LDiHnaQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH][meta-oe] Revert "luajit: Upgrade to 2.1 beta1"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 08 Nov 2015 20:50:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Was it needed for 2.0 as well? If yes, then I'll re-add it.

On Sun, Nov 8, 2015 at 9:32 PM, Andreas M=C3=BCller <schnitzeltony@googlema=
il.com
> wrote:

> On Sun, Nov 8, 2015 at 12:07 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > This reverts commit 2ce3086aa859178fb5f7d6db9876229c8ed5a6eb.
> >
> > Causes sysdig and devilspie2 build failures.
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  ...p-automatically-this-leaves-the-stripping.patch | 33 +++++++++++
> >  meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb    | 56
> ++++++++++++++++++
> >  meta-oe/recipes-devtools/luajit/luajit_2.1.bb      | 67
> ----------------------
> >  3 files changed, 89 insertions(+), 67 deletions(-)
> >  create mode 100644
> meta-oe/recipes-devtools/luajit/luajit/0001-Do-not-strip-automatically-th=
is-leaves-the-stripping.patch
> >  create mode 100644 meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
> >  delete mode 100644 meta-oe/recipes-devtools/luajit/luajit_2.1.bb
> >
> > diff --git
> a/meta-oe/recipes-devtools/luajit/luajit/0001-Do-not-strip-automatically-=
this-leaves-the-stripping.patch
> b/meta-oe/recipes-devtools/luajit/luajit/0001-Do-not-strip-automatically-=
this-leaves-the-stripping.patch
> > new file mode 100644
> > index 0000000..f123b3f
> > --- /dev/null
> > +++
> b/meta-oe/recipes-devtools/luajit/luajit/0001-Do-not-strip-automatically-=
this-leaves-the-stripping.patch
> > @@ -0,0 +1,33 @@
> > +From 528009f5ca0685c95ef27f6c8957160499c0576a Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 10 May 2013 10:42:45 -0700
> > +Subject: [PATCH] Do not strip automatically, this leaves the stripping
> > + busines to OE
> > +
> > +Upstream-Status: Inappropriate [OE-Specific]
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + src/Makefile |    2 --
> > + 1 file changed, 2 deletions(-)
> > +
> > +diff --git a/src/Makefile b/src/Makefile
> > +index 278324a..5ecd6d5 100644
> > +--- a/src/Makefile
> > ++++ b/src/Makefile
> > +@@ -665,12 +665,10 @@ $(LUAJIT_A): $(LJVMCORE_O)
> > + $(LUAJIT_SO): $(LJVMCORE_O)
> > +       $(E) "DYNLINK   $@"
> > +       $(Q)$(TARGET_LD) $(TARGET_ASHLDFLAGS) -o $@ $(LJVMCORE_DYNO)
> $(TARGET_ALIBS)
> > +-      $(Q)$(TARGET_STRIP) $@
> > +
> > + $(LUAJIT_T): $(TARGET_O) $(LUAJIT_O) $(TARGET_DEP)
> > +       $(E) "LINK      $@"
> > +       $(Q)$(TARGET_LD) $(TARGET_ALDFLAGS) -o $@ $(LUAJIT_O)
> $(TARGET_O) $(TARGET_ALIBS)
> > +-      $(Q)$(TARGET_STRIP) $@
> > +       $(E) "OK        Successfully built LuaJIT"
> > +
> > +
> #########################################################################=
#####
> > +--
> > +1.7.9.5
> > +
> > diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
> b/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
> > new file mode 100644
> > index 0000000..4a15a4e
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
> > @@ -0,0 +1,56 @@
> > +SUMMARY =3D "Just-In-Time Compiler for Lua"
> > +LICENSE =3D "MIT"
> > +LIC_FILES_CHKSUM =3D
> "file://COPYRIGHT;md5=3D3992f1fbae3b8b061f9056b7fcda8cc6"
> > +HOMEPAGE =3D "http://luajit.org"
> > +
> > +SRC_URI =3D "http://luajit.org/download/LuaJIT-${PV}.tar.gz \
> > +
>  file://0001-Do-not-strip-automatically-this-leaves-the-stripping.patch \
> > +"
> > +SRC_URI[md5sum] =3D "dd9c38307f2223a504cbfb96e477eca0"
> > +SRC_URI[sha256sum] =3D
> "620fa4eb12375021bef6e4f237cbd2dd5d49e56beb414bee052c746beef1807d"
> > +
> > +S =3D "${WORKDIR}/LuaJIT-${PV}"
> > +
> > +inherit pkgconfig binconfig
> > +
> > +BBCLASSEXTEND =3D "native"
> > +
> > +do_configure_prepend() {
> > +    sed -i 's:PREFIX=3D /usr/local:PREFIX=3D ${prefix}:g' ${S}/Makefil=
e
> > +    sed -i 's:MULTILIB=3D lib:MULTILIB=3D ${baselib}:g' ${S}/Makefile
> > +}
> > +
> > +EXTRA_OEMAKE =3D 'CROSS=3D${HOST_PREFIX} \
> > +                TARGET_CFLAGS=3D"${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}"=
 \
> > +                TARGET_LDFLAGS=3D"${TOOLCHAIN_OPTIONS}" \
> > +                TARGET_SHLDFLAGS=3D"${TOOLCHAIN_OPTIONS}"'
> > +EXTRA_OEMAKE_append_powerpc =3D ' HOST_CC=3D"${BUILD_CC} -m32"'
> > +EXTRA_OEMAKE_append_x86 =3D ' HOST_CC=3D"${BUILD_CC} -m32"'
> > +EXTRA_OEMAKE_append_x86-64 =3D ' HOST_CC=3D"${BUILD_CC}"'
> > +EXTRA_OEMAKE_append_powerpc64 =3D ' HOST_CC=3D"${BUILD_CC}"'
> > +EXTRA_OEMAKE_append_arm =3D ' HOST_CC=3D"${BUILD_CC} -m32"'
> > +EXTRA_OEMAKE_append_mips64 =3D ' HOST_CC=3D"${BUILD_CC} -m32"'
> > +
> > +do_compile () {
> > +    oe_runmake
> > +}
> > +
> > +do_install () {
> > +    oe_runmake 'DESTDIR=3D${D}' install
> > +    rmdir ${D}${datadir}/lua/5.* \
> > +          ${D}${datadir}/lua \
> > +          ${D}${libdir}/lua/5.* \
> > +          ${D}${libdir}/lua
> > +}
> > +
> > +PACKAGES +=3D 'luajit-common'
> > +
> > +FILES_${PN} +=3D "${libdir}/libluajit-5.1.so.2 \
> > +    ${libdir}/libluajit-5.1.so.${PV} \
> > +"
> > +FILES_${PN}-dev +=3D "${libdir}/libluajit-5.1.a \
> > +    ${libdir}/libluajit-5.1.so \
> > +    ${libdir}/pkgconfig/luajit.pc \
> > +"
> > +FILES_luajit-common =3D "${datadir}/${BPN}-${PV}"
> > +
> > diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.1.bb
> b/meta-oe/recipes-devtools/luajit/luajit_2.1.bb
> > deleted file mode 100644
> > index 5cee532..0000000
> > --- a/meta-oe/recipes-devtools/luajit/luajit_2.1.bb
> > +++ /dev/null
> > @@ -1,67 +0,0 @@
> > -SUMMARY =3D "Just-In-Time Compiler for Lua"
> > -LICENSE =3D "MIT"
> > -LIC_FILES_CHKSUM =3D
> "file://COPYRIGHT;md5=3D3992f1fbae3b8b061f9056b7fcda8cc6"
> > -HOMEPAGE =3D "http://luajit.org"
> > -
> > -SRCREV =3D "776c6935ed807fc3b1ee6cd89a0cf682ffb7e9de"
> > -SRC_URI =3D "git://
> luajit.org/git/luajit-2.0.git;protocol=3Dhttp;branch=3Dv${PV} \
> > -"
> > -
> > -SPIN =3D ".0-beta1"
> > -
> > -S =3D "${WORKDIR}/git"
> > -
> > -inherit pkgconfig binconfig
> > -
> > -BBCLASSEXTEND =3D "native"
> > -
> > -do_configure_prepend() {
> > -    sed -i 's:PREFIX=3D /usr/local:PREFIX=3D ${prefix}:g' ${S}/Makefil=
e
> > -    sed -i 's:MULTILIB=3D lib:MULTILIB=3D ${baselib}:g' ${S}/Makefile
> > -}
> > -
> > -EXTRA_OEMAKE =3D 'CROSS=3D${HOST_PREFIX} \
> > -                TARGET_CFLAGS=3D"${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}"=
 \
> > -                TARGET_LDFLAGS=3D"${TOOLCHAIN_OPTIONS}" \
> > -                TARGET_SHLDFLAGS=3D"${TOOLCHAIN_OPTIONS}"
> TARGET_STRIP=3D"/bin/echo"'
> > -
> Would it be a big issue to re-add comment below - I was not aware of
> the build host requirements and there could be other users
> > -# Important note: On the build machine bit compatible glibc-dev and
> libgcc must
> > -# be installed. E.g if the target architecture has 32 bit (see '-m32'
> below),
> > -# 32 bit versions of glibc-dev/libgcc (e.g glibc-devel.i686 /
> libgcc.i686 on
> > -# fedora) are required.
> > -#
> > -# Otherwise the following error occurs:
> > -# | /usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No suc=
h
> file or directory
> > -# |  # include <gnu/stubs-32.h>
> > -
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

