Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TeURD-0001TS-8P
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Nov 2012 18:31:43 +0100
Received: by mail-ie0-f175.google.com with SMTP id qd14so954283ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Nov 2012 09:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=DOWaj4UMMfBYIaCN8fo0eVqoMaGcZYeT7YoboRV3YuM=;
	b=gE0GmXx+t3I7yKWRkJXssBncNJ9d7MioZ7onf5q6fKMdlfuG0yFBz6h3U/KT9xq2Xj
	4kb9LZEpvzHGFxOBZi3qjEieaIWvJpr3wfy9/IVZrKYaN8LqL3iwOfpx7SXL3tUiHa2B
	vhhPoxGaU98ZCVuWPG+591xdcvccC3W+MLg9y7hhdp7mg4JcJwI1A7nWqsBTg/zuNUx6
	Nqu9Bd6BQuPv9VzWhGP4w6HzFfzKknho4/q/xqN+yGA4F8a8hTl0kC4rKODVqjllrf1I
	SwVwTMJ/trNnudVsLL9eTElbWZMFq2jlaXNNiuDItWdJXYG5mRZ821gGFp9AIBraegt1
	xlGA==
MIME-Version: 1.0
Received: by 10.50.11.234 with SMTP id t10mr5584033igb.50.1354295834603; Fri,
	30 Nov 2012 09:17:14 -0800 (PST)
Received: by 10.64.20.113 with HTTP; Fri, 30 Nov 2012 09:17:14 -0800 (PST)
In-Reply-To: <CAPOJ94NZvsiBoMemWPFdBUQtqQzH2rrkq9eP5hQGpB8amY4U2g@mail.gmail.com>
References: <CAPOJ94OVOe=fP-8cgCdDFGFEJskce4G=DMcTR6a-JDM9QHJg0w@mail.gmail.com>
	<CALbNGRRqj6NvBxqB+EGcLcFd9CcNKKnSNZmJHM8f=BA-biF3dg@mail.gmail.com>
	<CAPOJ94NZvsiBoMemWPFdBUQtqQzH2rrkq9eP5hQGpB8amY4U2g@mail.gmail.com>
Date: Fri, 30 Nov 2012 18:17:14 +0100
Message-ID: <CALbNGRSXeE0UvpsZqijRRg1nRW4XFe+52Zoz6kX6wX_QSuDM+Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Peter Bigot <bigotp@acm.org>
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
X-List-Received-Date: Fri, 30 Nov 2012 17:31:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 30, 2012 at 5:51 PM, Peter Bigot <bigotp@acm.org> wrote:
> On Fri, Nov 30, 2012 at 10:35 AM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>>
>> On Sun, Nov 25, 2012 at 3:19 PM, Peter Bigot <bigotp@acm.org> wrote:
>> > Koen Kooi <koen <at> dominion.thruhere.net> writes:
>> >
>> >>
>> >> Signed-off-by: Koen Kooi <koen <at> dominion.thruhere.net>
>> >
>> >> ---
>> >>  .../recipes-graphics/gphoto2/libgphoto2_2.4.11.bb  |    3 +--
>> >>  1 files changed, 1 insertions(+), 2 deletions(-)
>> >>
>> >> diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
>> > b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
>> >> index d7f6ac0..27f660b 100644
>> >> --- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
>> >> +++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
>> >> @@ -3,7 +3,7 @@ SECTION =3D "libs"
>> >>  LICENSE =3D "LGPLv2.1"
>> >>  LIC_FILES_CHKSUM =3D
>> >> "file://COPYING;md5=3D0448d3676bc0de00406af227d341a4d1"
>> >>
>> >> -PR =3D "r3"
>> >> +PR =3D "r4"
>> >>
>> >>  DEPENDS =3D "libtool jpeg virtual/libusb0 libexif"
>> >>
>> >> @@ -26,7 +26,6 @@ inherit autotools pkgconfig gettext lib_package
>> >>  EXTRA_OECONF =3D " --with-drivers=3Dall udevscriptdir=3D/lib/udev
>> > ac_cv_lib_ltdl_lt_dlcaller_register=3Dyes"
>> >>
>> >>  do_configure_append() {
>> >> -    cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in
>> >> ${S}/libgphoto2_port/po/
>> >>      cd ${S}/libgphoto2_port/
>> >>      autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECON=
F}
>> >> $acpaths
>> >>      cd ${S}
>> >
>> > I was about to submit a similar patch reverting the original.  Here's
>> > what I
>> > wrote up.
>> >
>> > Revert "libgphoto2: fix build"
>> >
>> > When using gettext-0.18's Makefile.in.in the elimination of
>> > AM_PO_SUBDIRS()
>> > prevented the substitution of @GETTEXT_MACRO_VERSION@.  With the
>> > original
>> > patch I get:
>> >
>> > | Making all in po
>> > | make[4]: Entering directory
>> >
>> > `/prj/oe/yocto-ang/build/tmp-angstrom_v2012_12-eglibc/work/armv7a-vfp-=
neon-angstrom-linux-gnueabi/libgphoto2-2.4.11-r3/libgphoto2-2.4.11/libgphot=
o2_port/po'
>> > | *** error: gettext infrastructure mismatch: using a Makefile.in.in
>> > from
>> > gettext version 0.18 but the autoconf macros are from gettext version
>> > @GETTEXT_MACRO_VERSION@
>> >
>> After last update it is again me to fail :-((
>>
>> One question: Is it possible that you don't have gettext installed on
>> your build machine? If installed: Which version is it?
>
>
> gettext 0.18.1 is installed both on the build machine, and as a native
> package used when building under bitbake.  If it's at all relevant, I hav=
e
> LANG=3Den_US.UTF-8 in the environment in which bitbake is executed.
>
> Did you try a full reversion of 5febf70?  Can you tell why, in your
> environment, autotools.bbclass replaces the Makefile.in.in for libgphoto2=
?
> It does not do this for me (otherwise I think Koen's patch that only reve=
rts
> part of 5febf70 would not work).
>
> Peter
>
It should copy see autotools.bbclass line 195

Andreas


