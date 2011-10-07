Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RCDqn-0005Te-P3 for openembedded-devel@lists.openembedded.org;
	Fri, 07 Oct 2011 19:04:45 +0200
Received: from f053037204.adsl.alicedsl.de ([78.53.37.204]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RCDlY-0004Fl-Tt for openembedded-devel@lists.openembedded.org;
	Fri, 07 Oct 2011 16:59:21 +0000
Message-ID: <1318006734.5812.5.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 07 Oct 2011 18:58:54 +0200
In-Reply-To: <CAKHrxHGv4Sjky=nEQs4ma0bHB7TMtGhfoDyXeJ7xtYY125ZeCA@mail.gmail.com>
References: <1317942096-32057-1-git-send-email-gavinswanson@gmail.com>
	<1317981695.3685.22.camel@mattotaupa>
	<CAKHrxHGv4Sjky=nEQs4ma0bHB7TMtGhfoDyXeJ7xtYY125ZeCA@mail.gmail.com>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [PATCH] Added ImageMagick 6.7.2-3
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
X-List-Received-Date: Fri, 07 Oct 2011 17:04:45 -0000
X-Groupsio-MsgNum: 34614
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-/wyIG5e+3uzi8ovpbYnI"

--=-/wyIG5e+3uzi8ovpbYnI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 07.10.2011, 09:38 -0700 schrieb Gavin Swanson:
> This is my first attempt at submitting a patch. Please bear with me.

I will. Thank you for following up on my review comments.

> I read through the style guide and used the oe-stylize script on my
> changed version. I still have some questions.
>=20
> On Fri, Oct 7, 2011 at 3:01 AM, Paul Menzel wrote:

> > Am Donnerstag, den 06.10.2011, 16:01 -0700 schrieb gavinswanson@gmail.c=
om:
> >> From: Gavin Swanson <gavinswanson@gmail.com>
> >
> > Please refer to our commit policy [1] and style guide [2].
> > (Unfortunately the Wiki is down at the moment.)
> >
> > Change the commit summary to
> >
> >        imagemagick: Add version 6.7.2-3
> >
> > and add some more information to the commit message. What distribution
> > and machine did you use for testing? Have you run tested the new
> > version.
> >
> > You seem to have used an existing recipe as a template. Please note tha=
t
> > too.
> >
> > At last please add you Signed-off-by line.
> >
> >> ---
> >>  recipes/imagemagick/imagemagick_6.7.2-3.bb |   36 +++++++++++++++++++=
+++++++++
> >>  1 files changed, 36 insertions(+), 0 deletions(-)
> >>  create mode 100644 recipes/imagemagick/imagemagick_6.7.2-3.bb
> >>
> >> diff --git a/recipes/imagemagick/imagemagick_6.7.2-3.bb b/recipes/imag=
emagick/imagemagick_6.7.2-3.bb
> >> new file mode 100644
> >> index 0000000..14746c9
> >> --- /dev/null
> >> +++ b/recipes/imagemagick/imagemagick_6.7.2-3.bb
> >> @@ -0,0 +1,36 @@
> >> +DESCRIPTION =3D "ImageMagick is an image convertion tools"
> >> +SECTION =3D "console/utils"
> >> +LICENSE =3D "GPL"
> >
> > I updated those meta fields in the repository. Please update the above
> > too.
>=20
> I'm using the gumstix repo,

Please include such information in your commit message.

> so I didn't have these changes, I looked them up though and have
> included them.

Great. I am sorry for the hassle.

[=E2=80=A6]

> >> +
> >> +SRC_URI =3D "ftp://ftp.nluug.nl/pub/ImageMagick/ImageMagick-${PV}.tar=
.bz2 \
> >> +#           file://PerlMagic_MakePatch;apply=3Dyes \
> >
> > Why is this patch not needed anymore? You can just delete the line then=
.
> >
>=20
> Not sure why it was needed in the first place, but it builds and runs
> fine without it.
>=20
> >> +          "
> >> +
> >> +IMVER =3D "6.7.2-3"
> >
> > I think the old recipes strip the `-3` to get the correct directory
> > names. This way `IMVER` is equal to `PN`.
>=20
> The build does not succeed without the -3 in it

What was the error? But as noted below, they seem to have changed the
directory name in the source archive.

> >> +
> >> +S =3D "${WORKDIR}/ImageMagick-${IMVER}"
> >
> > It looks like you can delete this line for this version, since in your
> > version the archive seems to have a =E2=80=9Ccorrectly=E2=80=9D named f=
older included.
>=20
> This line has been removed with success
>=20
> > $ ls minimal-dev/work/armv7a-oe-linux-gnueabi/imagemagick-6.4.4-1-r7/
> > ImageMagick-6.4.4  temp
> >
> > $ ls minimal-dev/work/armv7a-oe-linux-gnueabi/imagemagick-6.7.2-3-r1/
> > ImageMagick-6.7.2-3  temp
> >
> >> +
> >> +inherit autotools binconfig pkgconfig
> >> +
> >> +EXTRA_OECONF =3D "--program-prefix=3D --without-x --without-freetype =
--without-perl --disable-openmp"
> >> +
> >> +FILES_${PN} +=3D "${libdir}/ImageMagick-${IMVER}/modules-Q16/*/*.so \
> >> +                ${libdir}/ImageMagick-${IMVER}/modules-Q16/*/*.la \
> >> +                ${libdir}/ImageMagick-${IMVER}/config/ \
> >> +                ${datadir}/ImageMagick-${IMVER}"
> >
> > Could you please look into the following warnings.
> >
> >        NOTE: package imagemagick-6.7.2-3-r1: task do_qa_staging: Succee=
ded
> >        WARNING: the following files were installed but not shipped in a=
ny package:
> >        WARNING:   /usr/share/ImageMagick-6.7.2/francais.xml
> >        WARNING:   /usr/share/ImageMagick-6.7.2/locale.xml
> >        WARNING:   /usr/share/ImageMagick-6.7.2/english.xml
> >        WARNING:   /usr/share/ImageMagick-6.7.2/configure.xml
> >
>=20
> Not sure where those warnings show up for you, I don't get them during
> the build, is there some kind of extra warnings flag I should be
> using?

I am using `minimal` (EGLIBC) for `MACHINE =3D "beagleboard"`. Are these
files included in your final package?

> > Here you can also see that the directory name seems to only include
> > 6.7.2 instead of 6.7.2-3. So you should check where `IMVER` should be
> > used and where `PV`, which is 6.7.2-3.
>=20
> Not sure what you mean by this. As stated the build fails without the
> -3 on the IMVER

As seen with the warnings above, there seems to be a directory where the
`-3` needs to be stripped. You should use `PV` instead of `IMVER` where
possible like below too.

> >> +
> >> +FILES_${PN}-dev +=3D "${libdir}/ImageMagick-${IMVER}/modules-Q16/*/*.=
a"
> >> +
> >> +FILES_${PN}-dbg +=3D "${libdir}/ImageMagick-${IMVER}/modules-Q16/*/.d=
ebug/*"
> >> +
> >> +BBCLASSEXTEND =3D "native"
> >> +
> >> +LEAD_SONAME =3D "libMagickCore.so.*"
> >> +
> >> +
> >> +SRC_URI[md5sum] =3D "62e12090d2d385f4800c06f58f477bea"
> >> +SRC_URI[sha256sum] =3D "50fe6e1af9e900e5d4bef45879a3a7e15512bb9ab3dbb=
afb521825359cb6d2c7"


Thanks,

Paul


> > [1] http://www.openembedded.org/wiki/Commit_Policy
> > [2] http://www.openembedded.org/index.php?title=3DStyleguide

--=-/wyIG5e+3uzi8ovpbYnI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk6PL84ACgkQPX1aK2wOHVjivgCghCri0TRfn7M54yECzaSs1kEs
mlsAniWY8sa4k1M0DCNLoXxHfkZwIoBP
=SDIh
-----END PGP SIGNATURE-----

--=-/wyIG5e+3uzi8ovpbYnI--
