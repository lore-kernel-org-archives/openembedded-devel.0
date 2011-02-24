Received: from vms173013pub.verizon.net ([206.46.173.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1PsSyQ-0002tG-J2
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Feb 2011 05:38:47 +0100
Received: from gandalf.denix.org ([unknown] [71.251.49.88])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LH300BMBU5W0YN3@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	23 Feb 2011 22:37:15 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 9B0B314AF6D; Wed,
	23 Feb 2011 23:37:07 -0500 (EST)
Date: Wed, 23 Feb 2011 23:37:07 -0500
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <AANLkTin-fKddL80Sn4m08AwayH4t0+EGmFMof72Rwueq@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110224043707.GC17536@denix.org>
MIME-version: 1.0
References: <1298337246-11794-1-git-send-email-tom_rini@mentor.com>
	<1298337246-11794-2-git-send-email-tom_rini@mentor.com>
	<AANLkTin-fKddL80Sn4m08AwayH4t0+EGmFMof72Rwueq@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH] bitbake.conf: Simplify TARGET_CPPFLAGS/LDFLAGS
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
X-List-Received-Date: Thu, 24 Feb 2011 04:38:47 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: QUOTED-PRINTABLE
Content-disposition: inline

On Mon, Feb 21, 2011 at 10:21:12PM -0800, Khem Raj wrote:
> On Mon, Feb 21, 2011 at 5:14 PM, Tom Rini <tom_rini@mentor.com> wro=
te:
> > This is based on poky's ba2e1f4d933c37b372d6749d64614f2510ee9d7b,=
 which
> > simplifies TARGET_CPPFLAGS (and thus CFLAGS) and TARGET_LDFLAGS
> > based on gcc any company having --sysroot
> >
> > Signed-off-by: Tom Rini <tom_rini@mentor.com>
>=20
> Acked-by:Khem Raj <raj.khem@gmail.com>

Tom, Khem,

This change seems to break external-toolchains, e.g. CodeSourcery Lit=
e, at=20
least 2009q1 (gcc-4.3 based)...

I'm seeing issues like this in libxau:

| ./include/X11/Xauth.h:48:31: error: X11/Xfuncproto.h: No such file =
or directory
| ./include/X11/Xauth.h:49:27: error: X11/Xfuncs.h: No such file or d=
irectory

It cannot find standard X headers from OE sysroot.

Do I need to pass an extra --sysroot to CSL? Any other pointers?
Here's (hopefully useful) info from my toolchain:

$ arm-none-linux-gnueabi-gcc -print-sysroot
/opt/arm-2009q1/bin/../arm-none-linux-gnueabi/libc

$ arm-none-linux-gnueabi-gcc -print-search-dirs
install: /opt/arm-2009q1/bin/../lib/gcc/arm-none-linux-gnueabi/4.3.3/
programs: =3D/opt/arm-2009q1/bin/../libexec/gcc/arm-none-linux-gnueab=
i/4.3.3/:/opt/arm-2009q1/bin/../libexec/gcc/:/opt/arm-2009q1/bin/../l=
ib/gcc/arm-none-linux-gnueabi/4.3.3/../../../../arm-none-linux-gnueab=
i/bin/arm-none-linux-gnueabi/4.3.3/:/opt/arm-2009q1/bin/../lib/gcc/ar=
m-none-linux-gnueabi/4.3.3/../../../../arm-none-linux-gnueabi/bin/
libraries: =3D/opt/arm-2009q1/bin/../lib/gcc/arm-none-linux-gnueabi/4=
.3.3/:/opt/arm-2009q1/bin/../lib/gcc/:/opt/arm-2009q1/bin/../lib/gcc/=
arm-none-linux-gnueabi/4.3.3/../../../../arm-none-linux-gnueabi/lib/a=
rm-none-linux-gnueabi/4.3.3/:/opt/arm-2009q1/bin/../lib/gcc/arm-none-=
linux-gnueabi/4.3.3/../../../../arm-none-linux-gnueabi/lib/:/opt/arm-=
2009q1/bin/../arm-none-linux-gnueabi/libc/lib/arm-none-linux-gnueabi/=
4.3.3/:/opt/arm-2009q1/bin/../arm-none-linux-gnueabi/libc/lib/:/opt/a=
rm-2009q1/bin/../arm-none-linux-gnueabi/libc/usr/lib/arm-none-linux-g=
nueabi/4.3.3/:/opt/arm-2009q1/bin/../arm-none-linux-gnueabi/libc/usr/=
lib/

--=20
Denys


> > ---
> > =A0conf/bitbake.conf | =A0 =A04 ++--
> > =A01 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> > index f005658..ec20332 100644
> > --- a/conf/bitbake.conf
> > +++ b/conf/bitbake.conf
> > @@ -502,7 +502,7 @@ PATCHRESOLVE =3D 'noop'
> >
> > =A0export BUILD_CPPFLAGS =3D "-isystem${STAGING_INCDIR_NATIVE}"
> > =A0export CPPFLAGS =3D "${TARGET_CPPFLAGS}"
> > -export TARGET_CPPFLAGS =3D "-isystem${STAGING_DIR_TARGET}${inclu=
dedir}"
> > +export TARGET_CPPFLAGS =3D ""
> > =A0export SDK_CPPFLAGS =3D "-isystem${STAGING_DIR_SDK}${includedi=
r} -isystem${STAGING_DIR_HOST}${includedir}"
> >
> > =A0export BUILD_CFLAGS =3D "${BUILD_CPPFLAGS} ${BUILD_OPTIMIZATIO=
N}"
> > @@ -520,7 +520,7 @@ export BUILD_LDFLAGS =3D "-L${STAGING_LIBDIR_=
NATIVE} \
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -Wl,-rpath,${STAG=
ING_LIBDIR_NATIVE} -Wl,-O1"
> >
> > =A0export LDFLAGS =3D "${TARGET_LDFLAGS}"
> > -export TARGET_LDFLAGS =3D '${@["-L${STAGING_DIR_TARGET}${libdir}=
 -Wl,-rpath-link,${STAGING_DIR_TARGET}${libdir} -Wl,-O1 ${TARGET_LINK=
_HASH_STYLE}", "-Wl,-O1 ${TARGET_LINK_HASH_STYLE}"][bb.data.getVar('L=
IBTOOL_HAS_SYSROOT', d, 1) =3D=3D "yes"]}'
> > +export TARGET_LDFLAGS =3D "-Wl,-O1 ${TARGET_LINK_HASH_STYLE}"
> >
> > =A0export SDK_LDFLAGS =3D "-L${STAGING_DIR_SDK}${libdir} \
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0-Wl,-rpath-lin=
k,${STAGING_DIR_SDK}${libdir} \
> > --
> > 1.7.0.4
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-=
devel
> >
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-de=
vel



