Received: from mail-wi0-f173.google.com ([209.85.212.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pabigot@gmail.com>) id 1TeU25-0000gx-Fj
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Nov 2012 18:05:45 +0100
Received: by mail-wi0-f173.google.com with SMTP id hn17so6263858wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Nov 2012 08:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=ZjhnigtNzsmbOeOvNYPd2rhPmNNnq1d8oyK64ao38Bk=;
	b=RIKROXGBXridKl38hn56ZkROIJaDWqo73WoMQRI1DkKc+13de2IrTJT/sdAel85T2M
	1C+6fAd+9qpkb6CT6ToxMKAmxVRDDZ5Xur2c4qna2OFBSTaP3md3qmWsB0M8FRIIEnk2
	StY4yBineMGOunZ31wIuGOA3q8IvzHAKTHDPQB7/QX2uoQB/zuPTTAfB+GvDsJnfhVsp
	C/oBtX9VsDD3K8O0DzzVlu/gQ+cHvnf4XoZqu1ryTtQ1IBghGfI6cUspSscIktbuq5dc
	goBToDoiWxFVtasIbm4fg6Y8toi2RgKrndt+Af06Lqn6pI0xbDB+4w1IbnDeBjsfXLkb
	o3ZA==
MIME-Version: 1.0
Received: by 10.180.86.39 with SMTP id m7mr43867609wiz.1.1354294288207; Fri,
	30 Nov 2012 08:51:28 -0800 (PST)
Sender: pabigot@gmail.com
Received: by 10.216.24.140 with HTTP; Fri, 30 Nov 2012 08:51:27 -0800 (PST)
In-Reply-To: <CALbNGRRqj6NvBxqB+EGcLcFd9CcNKKnSNZmJHM8f=BA-biF3dg@mail.gmail.com>
References: <CAPOJ94OVOe=fP-8cgCdDFGFEJskce4G=DMcTR6a-JDM9QHJg0w@mail.gmail.com>
	<CALbNGRRqj6NvBxqB+EGcLcFd9CcNKKnSNZmJHM8f=BA-biF3dg@mail.gmail.com>
Date: Fri, 30 Nov 2012 10:51:27 -0600
X-Google-Sender-Auth: rIHtlX0MdrfaTN6SYnsu7_sGpf0
Message-ID: <CAPOJ94NZvsiBoMemWPFdBUQtqQzH2rrkq9eP5hQGpB8amY4U2g@mail.gmail.com>
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
X-List-Received-Date: Fri, 30 Nov 2012 17:05:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 30, 2012 at 10:35 AM, Andreas M=FCller <
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
> After last update it is again me to fail :-((
>
> One question: Is it possible that you don't have gettext installed on
> your build machine? If installed: Which version is it?
>

gettext 0.18.1 is installed both on the build machine, and as a native
package used when building under bitbake.  If it's at all relevant, I have
LANG=3Den_US.UTF-8 in the environment in which bitbake is executed.

Did you try a full reversion of 5febf70?  Can you tell why, in your
environment, autotools.bbclass replaces the Makefile.in.in for libgphoto2?
It does not do this for me (otherwise I think Koen's patch that only
reverts part of 5febf70 would not work).

Peter

