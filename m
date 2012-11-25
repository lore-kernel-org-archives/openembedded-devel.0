Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pabigot@gmail.com>) id 1TcwDz-0008LM-GJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Nov 2012 11:47:39 +0100
Received: by mail-wi0-f177.google.com with SMTP id c10so2719995wiw.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2012 02:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=iILBixj4KPLM/2T6+Z1T831hPd4YZCIZuWDtYIBsJnE=;
	b=LbfLoI/hHkiRYuZZgqbhE7nnGDaDJ9xvnY5TKpsNIIqDA3EjKn3LooDi3Z7RPPyx1p
	D2buzt7jS7QLngP3ZJWLO0igSR81iCcuE0V7qc3LW4SYWP/vlCGy9zjLUKvtmCV/i4Cz
	Z2dOhiOm1I4hdiEa9YVBDhj7PExtJeZ//sIQrCYTa01h9hju1ZCHCB7PhTuHcOBOGYKC
	GkwvnAD+eKLd4iv3yc1XweUm79YT0rgJzGq16iG2/xxLIimO50HRFejdkYVPzQRu6rhL
	qkTsYRxRQe9hporF3LnOvG6dCqZGuU/PEh6onAEZ32ucIMZbpisq6ZieSN4LHA8Z5xvw
	z8VQ==
MIME-Version: 1.0
Received: by 10.216.141.86 with SMTP id f64mr3363646wej.38.1353866603957; Sun,
	25 Nov 2012 10:03:23 -0800 (PST)
Sender: pabigot@gmail.com
Received: by 10.216.24.140 with HTTP; Sun, 25 Nov 2012 10:03:23 -0800 (PST)
In-Reply-To: <CALbNGRTjM3MWC=_Lrcb5c2=astYGZB317KBNvdBf0erLS1-=0Q@mail.gmail.com>
References: <CAPOJ94OVOe=fP-8cgCdDFGFEJskce4G=DMcTR6a-JDM9QHJg0w@mail.gmail.com>
	<CALbNGRTjM3MWC=_Lrcb5c2=astYGZB317KBNvdBf0erLS1-=0Q@mail.gmail.com>
Date: Sun, 25 Nov 2012 12:03:23 -0600
X-Google-Sender-Auth: Gns2NDl9ZM9fG2GpMZlpJfmn-f4
Message-ID: <CAPOJ94MCuwZnt9VVu8ed0PJwRBkUuDa_7qgvhbmzaTcwEUDh5w@mail.gmail.com>
From: Peter Bigot <bigotp@acm.org>
To: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] gphoto2: fix gettext build error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Nov 2012 10:47:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 25, 2012 at 11:46 AM, Andreas M=FCller <
schnitzeltony@googlemail.com> wrote:

> On Sun, Nov 25, 2012 at 3:19 PM, Peter Bigot <bigotp@acm.org> wrote:
> > Koen Kooi <koen <at> dominion.thruhere.net> writes:
> >
> >>
> >> Signed-off-by: Koen Kooi <koen <at> dominion.thruhere.net>
> >
> >> ---
> >>  .../recipes-graphics/gphoto2/libgphoto2_2.4.11.bb  |    3 +--
> >>  1 files changed, 1 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
> > b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
> >> index d7f6ac0..27f660b 100644
> >> --- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
> >> +++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
> >> @@ -3,7 +3,7 @@ SECTION =3D "libs"
> >>  LICENSE =3D "LGPLv2.1"
> >>  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D0448d3676bc0de00406af227d341a4d1"
> >>
> >> -PR =3D "r3"
> >> +PR =3D "r4"
> >>
> >>  DEPENDS =3D "libtool jpeg virtual/libusb0 libexif"
> >>
> >> @@ -26,7 +26,6 @@ inherit autotools pkgconfig gettext lib_package
> >>  EXTRA_OECONF =3D " --with-drivers=3Dall udevscriptdir=3D/lib/udev
> > ac_cv_lib_ltdl_lt_dlcaller_register=3Dyes"
> >>
> >>  do_configure_append() {
> >> -    cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in
> >> ${S}/libgphoto2_port/po/
> >>      cd ${S}/libgphoto2_port/
> >>      autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF=
}
> >> $acpaths
> >>      cd ${S}
> >
> > I was about to submit a similar patch reverting the original.  Here's
> what I
> > wrote up.
> >
> > Revert "libgphoto2: fix build"
> >
> > When using gettext-0.18's Makefile.in.in the elimination of
> AM_PO_SUBDIRS()
> > prevented the substitution of @GETTEXT_MACRO_VERSION@.  With the
> original
> > patch I get:
> >
> > | Making all in po
> > | make[4]: Entering directory
> >
> `/prj/oe/yocto-ang/build/tmp-angstrom_v2012_12-eglibc/work/armv7a-vfp-neo=
n-angstrom-linux-gnueabi/libgphoto2-2.4.11-r3/libgphoto2-2.4.11/libgphoto2_=
port/po'
> > | *** error: gettext infrastructure mismatch: using a Makefile.in.infro=
m
> > gettext version 0.18 but the autoconf macros are from gettext version
> > @GETTEXT_MACRO_VERSION@
> >
> > autotools.bbclass does not unconditionally copy po/Makefile.in.in over
> the
> > original gettext-0.14 version.  Presumably the original patch could be
> fixed
> > by replicating the logic in autotools.bbclass that determines whether
> this
> > should be done.  Reverting it is a simpler solution that works in my
> > environment.
> >
> > This reverts commit 5febf70d37c7e9cf55fa7de5285531a810312e3a.
> >
> I tested this patch and get
>
> ERROR: Function failed: do_install (see
>
> /home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gn=
ueabi/libgphoto2/2.4.11-r4/temp/log.do_install.6873
> for further information)
> ERROR: Logfile of failure stored in:
>
> /home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gn=
ueabi/libgphoto2/2.4.11-r4/temp/log.do_install.6873
> Log data follows:
> | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
> 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi',
> 'common']
> | DEBUG: Executing shell function do_install
> | NOTE: make -j20
>
> DESTDIR=3D/home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstro=
m-linux-gnueabi/libgphoto2/2.4.11-r4/image
> install
> | Making install in libgphoto2_port
> | make[1]: Entering directory
>
> `/home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-g=
nueabi/libgphoto2/2.4.11-r4/libgphoto2-2.4.11/libgphoto2_port'
> | Making install in po
> | make[2]: Entering directory
>
> `/home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-g=
nueabi/libgphoto2/2.4.11-r4/libgphoto2-2.4.11/libgphoto2_port/po'
> | /bin/sh @MKINSTALLDIRS@
>
> /home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gn=
ueabi/libgphoto2/2.4.11-r4/image/usr/share
> | /bin/sh: @MKINSTALLDIRS@: No such file or directory
> | make[2]: *** [install-data-yes] Error 127
> | make[2]: Leaving directory
>
> `/home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-g=
nueabi/libgphoto2/2.4.11-r4/libgphoto2-2.4.11/libgphoto2_port/po'
> | make[1]: *** [install-recursive] Error 1
> | make[1]: Leaving directory
>
> `/home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-g=
nueabi/libgphoto2/2.4.11-r4/libgphoto2-2.4.11/libgphoto2_port'
> | make: *** [install-recursive] Error 1
> | ERROR: oe_runmake failed
> | ERROR: Function failed: do_install (see
>
> /home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gn=
ueabi/libgphoto2/2.4.11-r4/temp/log.do_install.6873
> for further information)
> ERROR: Task 2
> (/home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes-g=
raphics/gphoto2/
> libgphoto2_2.4.11.bb,
> do_install) failed with exit code '1'
>
> Andreas
>

This makes some sense to me.  The proposed patch removes the unconditional
overwrite of po/Makefile.in.in, but left the removal of AC_PO_SUBDIRS().
It looks like your builds have something that causes autotools.bbclass to
rebuild the po directories (which I assume is why you needed the original
patch).  That doesn't happen in my build; I completely reverted your
original patch, because I didn't have any problems with the r2 version of
the recipe.

Dunno how to reconcile this.  Maybe figure out why autotools.bbclass
overwrites the top-level po/Makefile.in.in in your environment and making
the recipe extension do so only under the same conditions.

Peter

