Return-Path: <ticotimo@gmail.com>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 321A76F6AA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2014 22:32:48 +0000 (UTC)
Received: by mail-lb0-f179.google.com with SMTP id p9so123324lbv.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2014 15:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=CswDZ76yFeYqdcICIoPT8c6Z3l7sgyO+Aig3j4Whp/w=;
	b=G+oeYDkkXcAQzg7ESx7PS6QavJg7Y3Ky9eZB+1yqsSsYBKLbRR5wHw9dnXOBDd7D6/
	XFBmSKeKJHtecJtBtfzI/77rWMhNMiArIVAGu76YfbXn2dt4CQ6FIoh4cax1tyFInxFz
	+Xo2CxKyu4PhTr+aXzHt9Kki87LGWD7uxGRgwHbL0SM3TyiUWykm21ARUQlB0uB0mdho
	l/3KboIRj+NM0ZXlEPOzhsbszL5OmPZrfRBsEWB1XpA8In7lcXGritYJ4EJLk11w5P7d
	7a+zf0LBfFZOiG4pxEAAYYlhv2/V/B+g0VkkNV4BpWO5JmX20/hki5T43sP/52B25iCt
	BYLg==
MIME-Version: 1.0
X-Received: by 10.112.88.138 with SMTP id bg10mr32799lbb.42.1394663567974;
	Wed, 12 Mar 2014 15:32:47 -0700 (PDT)
Received: by 10.114.191.202 with HTTP; Wed, 12 Mar 2014 15:32:47 -0700 (PDT)
In-Reply-To: <20140312211229.GA3759@jama>
References: <1393393197-23806-1-git-send-email-ticotimo@gmail.com>
	<1393393197-23806-4-git-send-email-ticotimo@gmail.com>
	<20140305175641.GY26981@jama>
	<CANx9H-CN6DaJsC=8nhAzAKjaeT1rPy0N9N39tfg=y-A9MS+K=w@mail.gmail.com>
	<20140311152656.GH2137@jama>
	<CANx9H-AWsNEJzoKwMbfxVB_H5bnGuypSgZpute5235PTfUvxEA@mail.gmail.com>
	<20140312211229.GA3759@jama>
Date: Wed, 12 Mar 2014 15:32:47 -0700
Message-ID: <CANx9H-C1oCoinugR+8ZbsCY-zFitfaayMzw1J-w5qgZSoBFOgw@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-multimedia][PATCH v2 3/3] vlc: update to 2.1.2
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
X-List-Received-Date: Wed, 12 Mar 2014 22:32:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

I made the mistake of doing FILES_libvlc-staticdev when I should have used
FILES_${PN}-staticdev. I will fix in the patch.


On Wed, Mar 12, 2014 at 2:12 PM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Wed, Mar 12, 2014 at 08:13:45AM -0700, Tim Orling wrote:
> > Confirmed. That's what I "meant" to do in the first place.
> >
> > I'll submit an updated patch within the next day or so.
>
> It worked, but in the end vlc shows a lot of new QA issues:
>
> vlc-2.1.2: non -staticdev package contains static .a library: vlc path
>
> '/work/armv5te-oe-linux-gnueabi/vlc/2.1.2-r0/packages-split/vlc/usr/lib/vlc/plugins/lua/liblua_plugin.a'
>
> vlc-2.1.2: non -staticdev package contains static .a library: vlc path
>
> '/work/armv5te-oe-linux-gnueabi/vlc/2.1.2-r0/packages-split/vlc/usr/lib/vlc/plugins/arm_neon/libyuv_rgb_neon_plugin.a'
>
> ~ 100 more
>
> Can you please update packaging or if they are needed then add
> INSANE_SKIP to hide QA message.
>
> Thanks
>
> > On Tue, Mar 11, 2014 at 8:26 AM, Martin Jansa <martin.jansa@gmail.com
> >wrote:
> >
> > > On Sat, Mar 08, 2014 at 08:54:31PM -0800, Tim Orling wrote:
> > > > Can you check the build directory to see if
> > > > arm-nodistro-linux-gnueabi-libtool was created? I'm building in
> angstrom,
> > > > so I see arm-angstrom-linux-gnueabi-libtool... This was not being
> found
> > > by
> > > > the doltlibtool script, which was the reason for the sed fix in
> vlc.inc.
> > > I
> > > > suspect it is behaving differently in your environment. It's on my
> list
> > > to
> > > > duplicate your build environment, including jenkins, but I haven't
> done
> > > it
> > > > yet.
> > >
> > > It doesn't exist in WORKDIR
> > > OE qemuarm@ ~/oe/shr-core-branches/shr-core $ find
> > >
> > >
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/vlc/2.1.2-r0
> > > -name arm-nodistro-linux-gnueabi-libtool
> > >
> > > or sysroot
> > >
> > > OE qemuarm@ ~/oe/shr-core-branches/shr-core $ find
> > > /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm
> > > -name arm-nodistro-linux-gnueabi-libtool
> > >
> > > only libtool I have is:
> > >
> > >
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/bin/crossscripts/libtoolize
> > >
> > >
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/bin/crossscripts/arm-oe-linux-gnueabi-libtool
> > >
> > >
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/x86_64-linux-libtool
> > >
> > >
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/libtoolize
> > >
> > > > > > +    sed -i -e
> > > > >
> > >
> s:'${top_builddir_slash}libtool':${TARGET_ARCH}-${DISTRO}-${TARGET_OS}-libtool:g
> > > > > doltlibtool
> > >
> > > I guess you should use ${TARGET_SYS}-libtool here.
> > >
> > > Because TARGET_VENDOR != ${DISTRO}
> > >
> > > I'll change it in master-next and check it in my build, please test it
> > > in your angstrom build as well and let me know.
> > >
> > > > --Tim
> > > >
> > > >
> > > > On Wed, Mar 5, 2014 at 9:56 AM, Martin Jansa <martin.jansa@gmail.com
> >
> > > wrote:
> > > >
> > > > > On Tue, Feb 25, 2014 at 09:39:57PM -0800, Tim Orling wrote:
> > > > > > From: Tim Orling <TicoTimo@gmail.com>
> > > > > >
> > > > > > Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> > > > > > ---
> > > > > >  .../vlc/files/0001-enable-subdir-objects.patch        | 13
> > > +++++++++++++
> > > > > >  .../files/0002-glibc-does-not-provide-strlcpy.patch   | 17
> > > > > +++++++++++++++++
> > > > > >  meta-multimedia/recipes-multimedia/vlc/vlc.inc        | 10
> > > +++++++---
> > > > > >  meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.bb  | 19
> > > > > -------------------
> > > > > >  meta-multimedia/recipes-multimedia/vlc/vlc_2.1.2.bb   | 17
> > > > > +++++++++++++++++
> > > > > >  5 files changed, 54 insertions(+), 22 deletions(-)
> > > > > >  create mode 100644
> > > > >
> > >
> meta-multimedia/recipes-multimedia/vlc/files/0001-enable-subdir-objects.patch
> > > > > >  create mode 100644
> > > > >
> > >
> meta-multimedia/recipes-multimedia/vlc/files/0002-glibc-does-not-provide-strlcpy.patch
> > > > > >  delete mode 100644 meta-multimedia/recipes-multimedia/vlc/
> > > vlc_1.1.11.bb
> > > > > >  create mode 100644 meta-multimedia/recipes-multimedia/vlc/
> > > vlc_2.1.2.bb
> > > > >
> > > > > Hi,
> > > > >
> > > > > it fails to build in world verification:
> > > > >
> > > > > | make[1]: Entering directory
> > > > >
> > > > >
> > >
> `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/vlc/2.1.2-r0/vlc-2.1.2'
> > > > > | Making all in compat
> > > > > | make[2]: Entering directory
> > > > >
> > > > >
> > >
> `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/vlc/2.1.2-r0/vlc-2.1.2/compat'
> > > > > | make  all-am
> > > > > | make[3]: Entering directory
> > > > >
> > > > >
> > >
> `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/vlc/2.1.2-r0/vlc-2.1.2/compat'
> > > > > | ../doltcompile arm-oe-linux-gnueabi-gcc  -march=armv5te -marm
> > > > > -mthumb-interwork
> > > > >
> > > > >
> > >
> --sysroot=/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm
> > > > > -std=gnu99 -DHAVE_CONFIG_H -I. -I..   -I../include -I../include
> -O2
> > > > > -pipe -g -feliminate-unused-debug-types -Wall -Wextra
> -Wsign-compare
> > > > > -Wundef -Wpointer-arith -Wbad-function-cast -Wwrite-strings
> > > > > -Wmissing-prototypes -Wvolatile-register-var
> > > > > -Werror-implicit-function-declaration -pipe -fvisibility=hidden
> > > > > -ffast-math -funroll-loops -fomit-frame-pointer -c -o dummy.lo
> dummy.c
> > > > > | ../doltcompile arm-oe-linux-gnueabi-gcc  -march=armv5te -marm
> > > > > -mthumb-interwork
> > > > >
> > > > >
> > >
> --sysroot=/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm
> > > > > -std=gnu99 -DHAVE_CONFIG_H -I. -I..   -I../include -I../include
> -O2
> > > > > -pipe -g -feliminate-unused-debug-types -Wall -Wextra
> -Wsign-compare
> > > > > -Wundef -Wpointer-arith -Wbad-function-cast -Wwrite-strings
> > > > > -Wmissing-prototypes -Wvolatile-register-var
> > > > > -Werror-implicit-function-declaration -pipe -fvisibility=hidden
> > > > > -ffast-math -funroll-loops -fomit-frame-pointer -c -o strlcpy.lo
> > > > > strlcpy.c
> > > > > | ../doltlibtool  --tag=CC   --mode=link arm-oe-linux-gnueabi-gcc
> > > > > -march=armv5te -marm -mthumb-interwork
> > > > >
> > > > >
> > >
> --sysroot=/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm
> > > > > -std=gnu99  -O2 -pipe -g -feliminate-unused-debug-types -Wall
> -Wextra
> > > > > -Wsign-compare -Wundef -Wpointer-arith -Wbad-function-cast
> > > > > -Wwrite-strings -Wmissing-prototypes -Wvolatile-register-var
> > > > > -Werror-implicit-function-declaration -pipe -fvisibility=hidden
> > > > > -ffast-math -funroll-loops -fomit-frame-pointer -no-undefined
> -static
> > > > > -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o libcompat.la-rpath
> > > > > /usr/lib/vlc dummy.lo strlcpy.lo
> > > > > | ../doltlibtool: line 18: exec:
> arm-nodistro-linux-gnueabi-libtool:
> > > not
> > > > > found
> > > > > | make[3]: *** [libcompat.la] Error 127
> > > > > | make[3]: Leaving directory
> > > > >
> > > > >
> > >
> `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/vlc/2.1.2-r0/vlc-2.1.2/compat'
> > > > > | make[2]: *** [all] Error 2
> > > > > | make[2]: Leaving directory
> > > > >
> > > > >
> > >
> `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/vlc/2.1.2-r0/vlc-2.1.2/compat'
> > > > > | make[1]: *** [all-recursive] Error 1
> > > > > | make[1]: Leaving directory
> > > > >
> > > > >
> > >
> `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/vlc/2.1.2-r0/vlc-2.1.2'
> > > > > | make: *** [all] Error 2
> > > > > | ERROR: oe_runmake failed
> > > > > | WARNING: exit code 1 from a shell command.
> > > > > | ERROR: Function failed: do_compile (log file is located at
> > > > >
> > > > >
> > >
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/vlc/2.1.2-r0/temp/log.do_compile.6302)
> > > > > NOTE: recipe vlc-2.1.2-r0: task do_compile: Failed
> > > > >
> > > > > Can you please check? I'll send updated bitbake world status later
> > > today
> > > > > or tomorrow (with full log)
> > > > > http://www.openembedded.org/wiki/Bitbake_World_Status
> > > > >
> > > > > >
> > > > > > diff --git
> > > > >
> > >
> a/meta-multimedia/recipes-multimedia/vlc/files/0001-enable-subdir-objects.patch
> > > > >
> > >
> b/meta-multimedia/recipes-multimedia/vlc/files/0001-enable-subdir-objects.patch
> > > > > > new file mode 100644
> > > > > > index 0000000..9f0e708
> > > > > > --- /dev/null
> > > > > > +++
> > > > >
> > >
> b/meta-multimedia/recipes-multimedia/vlc/files/0001-enable-subdir-objects.patch
> > > > > > @@ -0,0 +1,13 @@
> > > > > > +Index: vlc-2.1.2/configure.ac
> > > > > >
> +===================================================================
> > > > > > +--- vlc-2.1.2.orig/configure.ac
> > > > > > ++++ vlc-2.1.2/configure.ac
> > > > > > +@@ -24,7 +24,7 @@ AC_CANONICAL_BUILD
> > > > > > + AC_CANONICAL_HOST
> > > > > > + AC_PRESERVE_HELP_ORDER
> > > > > > +
> > > > > > +-AM_INIT_AUTOMAKE(tar-ustar color-tests foreign)
> > > > > > ++AM_INIT_AUTOMAKE(tar-ustar color-tests foreign subdir-objects)
> > > > > > + AC_CONFIG_HEADERS([config.h])
> > > > > > +
> > > > > > + # Disable with "./configure --disable-silent-rules" or "make
> V=1"
> > > > > > diff --git
> > > > >
> > >
> a/meta-multimedia/recipes-multimedia/vlc/files/0002-glibc-does-not-provide-strlcpy.patch
> > > > >
> > >
> b/meta-multimedia/recipes-multimedia/vlc/files/0002-glibc-does-not-provide-strlcpy.patch
> > > > > > new file mode 100644
> > > > > > index 0000000..6d2a46f
> > > > > > --- /dev/null
> > > > > > +++
> > > > >
> > >
> b/meta-multimedia/recipes-multimedia/vlc/files/0002-glibc-does-not-provide-strlcpy.patch
> > > > > > @@ -0,0 +1,17 @@
> > > > > > +Index: vlc-2.1.2/src/input/subtitles.c
> > > > > >
> +===================================================================
> > > > > > +--- vlc-2.1.2.orig/src/input/subtitles.c
> > > > > > ++++ vlc-2.1.2/src/input/subtitles.c
> > > > > > +@@ -44,6 +44,12 @@
> > > > > > + #include "input_internal.h"
> > > > > > +
> > > > > > + /**
> > > > > > ++ * Drepper's alternative
> > > > > > ++ *
> > > > >
> > >
> http://en.wikibooks.org/wiki/C_Programming/C_Reference/nonstandard/strlcpy
> > > > > > ++ */
> > > > > > ++#define strlcpy(dst, src, n) *((char* ) mempcpy(dst, src, n)) =
> > > '\0'
> > > > > > ++
> > > > > > ++/**
> > > > > > +  * We are not going to autodetect more subtitle files than
> this.
> > > > > > +  */
> > > > > > + #define MAX_SUBTITLE_FILES 128
> > > > > > diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> > > > > b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> > > > > > index 6400719..976c3bf 100644
> > > > > > --- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> > > > > > +++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> > > > > > @@ -5,13 +5,13 @@ SECTION = "multimedia"
> > > > > >
> > > > > >  DEPENDS = "libfribidi libtool libgcrypt gst-plugins-bad
> > > virtual/libsdl
> > > > > qt4-x11-free dbus libxml2 gnutls tremor faad2 ffmpeg flac libxpm
> > > fluidsynth
> > > > > alsa-lib"
> > > > > >
> > > > > > -SRC_URI = "
> > > > >
> http://download.videolan.org/pub/videolan/vlc/${PV}/vlc-${PV}.tar.bz2"
> > > > > > +SRC_URI = "
> > > > >
> http://download.videolan.org/pub/videolan/vlc/${PV}/vlc-${PV}.tar.xz"
> > > > > >
> > > > > >  inherit autotools gettext
> > > > > >
> > > > > >  ARM_INSTRUCTION_SET = "arm"
> > > > > >
> > > > > > -DEPENDS += "libdvdcss libdvdread lua5.1-native lua5.1"
> > > > > > +DEPENDS += "libdvdcss libdvdread lua-native lua"
> > > > > >
> > > > > >  LEAD_SONAME = "libvlc.so.5"
> > > > > >
> > > > > > @@ -36,6 +36,8 @@ FILES_libvlc-dbg = "\
> > > > > >
> > > > > >  FILES_libvlc = "${libdir}/lib*.so.*"
> > > > > >
> > > > > > +FILES_libvlc-staticdev = "${libdir}/vlc/plugins/*/*.a"
> > > > > > +
> > > > > >  FILES_${PN} += "${bindir}/vlc \
> > > > > >      ${datadir}/applications \
> > > > > >      ${datadir}/vlc/ \
> > > > > > @@ -71,6 +73,7 @@ PACKAGECONFIG[id3tag] =
> > > > > "--enable-id3tag,--disable-id3tag,libid3tag"
> > > > > >  PACKAGECONFIG[a52] = "--enable-a52,--disable-a52,liba52"
> > > > > >  PACKAGECONFIG[mpeg2dec] =
> > > > > "--enable-mpeg2dec,--disable-mpeg2dec,mpeg2dec"
> > > > > >  PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
> > > > > > +PACKAGECONFIG[live555] =
> > > "--enable-live555,--disable-live555,live555"
> > > > > >
> > > > > >  do_configure() {
> > > > > >      cp ${STAGING_DATADIR}/aclocal/libgcrypt.m4 ${S}/m4/
> > > > > > @@ -81,6 +84,7 @@ do_configure() {
> > > > > >      cp ${STAGING_DATADIR}/libtool/config.* ${S}/autotools/ ||
> true
> > > > > >      oe_runconf
> > > > > >      rm config.log
> > > > > > -    sed -i -e s:-L/usr/lib:-L${STAGING_LIBDIR}/:g vlc-config
> > > > > > +    #sed -i -e s:-L/usr/lib:-L${STAGING_LIBDIR}/:g vlc-config
> > > > > >      sed -i -e s:'$(MOC) $(DEFS) $(CPPFLAGS)':'$(MOC) $(DEFS)'\
> > > > > -I${S}/include\ -DSYS_LINUX:g ${S}/modules/gui/qt4/Makefile
> > > > > > +    sed -i -e
> > > > >
> > >
> s:'${top_builddir_slash}libtool':${TARGET_ARCH}-${DISTRO}-${TARGET_OS}-libtool:g
> > > > > doltlibtool
> > > > > >  }
> > > > > > diff --git
> > >
> a/meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.bbb/meta-multimedia/recipes-multimedia/vlc/
> > > > > vlc_1.1.11.bb
> > > > > > deleted file mode 100644
> > > > > > index 368db59..0000000
> > > > > > --- a/meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.bb
> > > > > > +++ /dev/null
> > > > > > @@ -1,19 +0,0 @@
> > > > > > -# This recipe packages vlc as a library as well, so qt4
> dependencies
> > > > > > -# can be avoided when only the library is installed.
> > > > > > -
> > > > > > -LIC_FILES_CHKSUM =
> > > "file://COPYING;md5=ed7e492ee44e70125a5d42e118354a13"
> > > > > > -
> > > > > > -require vlc.inc
> > > > > > -
> > > > > > -SRC_URI +=
> > > > >
> > >
> "file://0001-V4L2-mark-horizontal-and-vertical-center-controls-ob.patch"
> > > > > > -SRC_URI += "file://0002-fix-build-with-newer-freetype.patch"
> > > > > > -SRC_URI += "file://0003-fix-build-with-newer-flac-1.3.0.patch"
> > > > > > -
> > > > > > -PR = "r4"
> > > > > > -
> > > > > > -# work around build failure
> > > > > > -EXTRA_OECONF += " --enable-libxml2=no"
> > > > > > -
> > > > > > -SRC_URI[md5sum] = "a64846d6f21ea179ae8e8bfb6f9447fe"
> > > > > > -SRC_URI[sha256sum] =
> > > > > "682560be08b82bedfaf30d8a611d80093c5883c1de72fcbcf05715b8e9f4e1cb"
> > > > > > -
> > > > > > diff --git
> > >
> a/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.2.bbb/meta-multimedia/recipes-multimedia/vlc/
> > > > > vlc_2.1.2.bb
> > > > > > new file mode 100644
> > > > > > index 0000000..a33f93f
> > > > > > --- /dev/null
> > > > > > +++ b/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.2.bb
> > > > > > @@ -0,0 +1,17 @@
> > > > > > +# This recipe packages vlc as a library as well, so qt4
> dependencies
> > > > > > +# can be avoided when only the library is installed.
> > > > > > +
> > > > > > +LIC_FILES_CHKSUM =
> > > "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> > > > > > +
> > > > > > +require vlc.inc
> > > > > > +
> > > > > > +# work around build failure
> > > > > > +EXTRA_OECONF += " --enable-libxml2=no"
> > > > > > +
> > > > > > +SRC_URI += "file://0001-enable-subdir-objects.patch \
> > > > > > +            file://0002-glibc-does-not-provide-strlcpy.patch \
> > > > > > +"
> > > > > > +
> > > > > > +SRC_URI[md5sum] = "fb6787ad749aadcfaeab3471939b3426"
> > > > > > +SRC_URI[sha256sum] =
> > > > > "219b812be1bc2eba40faa86419d0aa2c479a7380af8af216e8bfa22eb6fc8ec4"
> > > > > > +
> > > > > > --
> > > > > > 1.8.3.2
> > > > > >
> > > > > > _______________________________________________
> > > > > > Openembedded-devel mailing list
> > > > > > Openembedded-devel@lists.openembedded.org
> > > > > >
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > > >
> > > > > --
> > > > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > > > >
> > > > > _______________________________________________
> > > > > Openembedded-devel mailing list
> > > > > Openembedded-devel@lists.openembedded.org
> > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > > >
> > > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > > --
> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

