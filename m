Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RCHXn-000396-4Y for openembedded-devel@lists.openembedded.org;
	Fri, 07 Oct 2011 23:01:23 +0200
Received: from f053037204.adsl.alicedsl.de ([78.53.37.204]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RCHSY-0004x1-Ea for openembedded-devel@lists.openembedded.org;
	Fri, 07 Oct 2011 20:55:58 +0000
Message-ID: <1318020946.5812.22.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 07 Oct 2011 22:55:46 +0200
In-Reply-To: <1318006734.5812.5.camel@mattotaupa>
References: <1317942096-32057-1-git-send-email-gavinswanson@gmail.com>
	<1317981695.3685.22.camel@mattotaupa>
	<CAKHrxHGv4Sjky=nEQs4ma0bHB7TMtGhfoDyXeJ7xtYY125ZeCA@mail.gmail.com>
	<1318006734.5812.5.camel@mattotaupa>
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
X-List-Received-Date: Fri, 07 Oct 2011 21:01:23 -0000
X-Groupsio-MsgNum: 34618
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-a+3HcmDJaSN/96PuuFw8"

--=-a+3HcmDJaSN/96PuuFw8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 07.10.2011, 18:58 +0200 schrieb Paul Menzel:
> Am Freitag, den 07.10.2011, 09:38 -0700 schrieb Gavin Swanson:
> > This is my first attempt at submitting a patch. Please bear with me.
>=20
> I will. Thank you for following up on my review comments.
>=20
> > I read through the style guide and used the oe-stylize script on my
> > changed version. I still have some questions.
> >=20
> > On Fri, Oct 7, 2011 at 3:01 AM, Paul Menzel wrote:
>=20
> > > Am Donnerstag, den 06.10.2011, 16:01 -0700 schrieb gavinswanson@gmail=
.com:
> > >> From: Gavin Swanson <gavinswanson@gmail.com>
> > >
> > > Please refer to our commit policy [1] and style guide [2].
> > > (Unfortunately the Wiki is down at the moment.)
> > >
> > > Change the commit summary to
> > >
> > >        imagemagick: Add version 6.7.2-3
> > >
> > > and add some more information to the commit message. What distributio=
n
> > > and machine did you use for testing? Have you run tested the new
> > > version.
> > >
> > > You seem to have used an existing recipe as a template. Please note t=
hat
> > > too.
> > >
> > > At last please add you Signed-off-by line.
> > >
> > >> ---
> > >>  recipes/imagemagick/imagemagick_6.7.2-3.bb |   36 +++++++++++++++++=
+++++++++++
> > >>  1 files changed, 36 insertions(+), 0 deletions(-)
> > >>  create mode 100644 recipes/imagemagick/imagemagick_6.7.2-3.bb
> > >>
> > >> diff --git a/recipes/imagemagick/imagemagick_6.7.2-3.bb b/recipes/im=
agemagick/imagemagick_6.7.2-3.bb
> > >> new file mode 100644
> > >> index 0000000..14746c9
> > >> --- /dev/null
> > >> +++ b/recipes/imagemagick/imagemagick_6.7.2-3.bb
> > >> @@ -0,0 +1,36 @@
> > >> +DESCRIPTION =3D "ImageMagick is an image convertion tools"
> > >> +SECTION =3D "console/utils"
> > >> +LICENSE =3D "GPL"
> > >
> > > I updated those meta fields in the repository. Please update the abov=
e
> > > too.
> >=20
> > I'm using the gumstix repo,
>=20
> Please include such information in your commit message.
>=20
> > so I didn't have these changes, I looked them up though and have
> > included them.
>=20
> Great. I am sorry for the hassle.
>=20
> [=E2=80=A6]
>=20
> > >> +
> > >> +SRC_URI =3D "ftp://ftp.nluug.nl/pub/ImageMagick/ImageMagick-${PV}.t=
ar.bz2 \
> > >> +#           file://PerlMagic_MakePatch;apply=3Dyes \
> > >
> > > Why is this patch not needed anymore? You can just delete the line th=
en.
> > >
> >=20
> > Not sure why it was needed in the first place, but it builds and runs
> > fine without it.
> >=20
> > >> +          "
> > >> +
> > >> +IMVER =3D "6.7.2-3"
> > >
> > > I think the old recipes strip the `-3` to get the correct directory
> > > names. This way `IMVER` is equal to `PN`.
> >=20
> > The build does not succeed without the -3 in it
>=20
> What was the error? But as noted below, they seem to have changed the
> directory name in the source archive.
>=20
> > >> +
> > >> +S =3D "${WORKDIR}/ImageMagick-${IMVER}"
> > >
> > > It looks like you can delete this line for this version, since in you=
r
> > > version the archive seems to have a =E2=80=9Ccorrectly=E2=80=9D named=
 folder included.
> >=20
> > This line has been removed with success

Are you sure? Testing this, it looks like the default is to make
everything lower case and it broke for me.

| + do_install
| + autotools_do_install
| + oe_runmake DESTDIR=3D/oe/build-minimal-uclibc/minimal-uclibc-dev/work/a=
rmv7a-oe-linux-uclibceabi/imagemagick-6.7.2-3-r1/image install
| + oenote make DESTDIR=3D/oe/build-minimal-uclibc/minimal-uclibc-dev/work/=
armv7a-oe-linux-uclibceabi/imagemagick-6.7.2-3-r1/image install
| + echo NOTE: 'make DESTDIR=3D/oe/build-minimal-uclibc/minimal-uclibc-dev/=
work/armv7a-oe-linux-uclibceabi/imagemagick-6.7.2-3-r1/image install'
| NOTE: make DESTDIR=3D/oe/build-minimal-uclibc/minimal-uclibc-dev/work/arm=
v7a-oe-linux-uclibceabi/imagemagick-6.7.2-3-r1/image install
| + make DESTDIR=3D/oe/build-minimal-uclibc/minimal-uclibc-dev/work/armv7a-=
oe-linux-uclibceabi/imagemagick-6.7.2-3-r1/image install
| make: *** No rule to make target `install'.  Stop.
| + die 'oe_runmake failed'
| + oefatal 'oe_runmake failed'
| + echo FATAL: 'oe_runmake failed'
| FATAL: oe_runmake failed
| + exit 1

> > > $ ls minimal-dev/work/armv7a-oe-linux-gnueabi/imagemagick-6.4.4-1-r7/
> > > ImageMagick-6.4.4  temp
> > >
> > > $ ls minimal-dev/work/armv7a-oe-linux-gnueabi/imagemagick-6.7.2-3-r1/
> > > ImageMagick-6.7.2-3  temp
> > >
> > >> +
> > >> +inherit autotools binconfig pkgconfig
> > >> +
> > >> +EXTRA_OECONF =3D "--program-prefix=3D --without-x --without-freetyp=
e --without-perl --disable-openmp"
> > >> +
> > >> +FILES_${PN} +=3D "${libdir}/ImageMagick-${IMVER}/modules-Q16/*/*.so=
 \
> > >> +                ${libdir}/ImageMagick-${IMVER}/modules-Q16/*/*.la \
> > >> +                ${libdir}/ImageMagick-${IMVER}/config/ \
> > >> +                ${datadir}/ImageMagick-${IMVER}"
> > >
> > > Could you please look into the following warnings.
> > >
> > >        NOTE: package imagemagick-6.7.2-3-r1: task do_qa_staging: Succ=
eeded
> > >        WARNING: the following files were installed but not shipped in=
 any package:
> > >        WARNING:   /usr/share/ImageMagick-6.7.2/francais.xml
> > >        WARNING:   /usr/share/ImageMagick-6.7.2/locale.xml
> > >        WARNING:   /usr/share/ImageMagick-6.7.2/english.xml
> > >        WARNING:   /usr/share/ImageMagick-6.7.2/configure.xml
> > >
> >=20
> > Not sure where those warnings show up for you, I don't get them during
> > the build, is there some kind of extra warnings flag I should be
> > using?
>=20
> I am using `minimal` (EGLIBC) for `MACHINE =3D "beagleboard"`. Are these
> files included in your final package?
>=20
> > > Here you can also see that the directory name seems to only include
> > > 6.7.2 instead of 6.7.2-3. So you should check where `IMVER` should be
> > > used and where `PV`, which is 6.7.2-3.
> >=20
> > Not sure what you mean by this. As stated the build fails without the
> > -3 on the IMVER
>=20
> As seen with the warnings above, there seems to be a directory where the
> `-3` needs to be stripped. You should use `PV` instead of `IMVER` where
> possible like below too.

So currently I think the following should be correct.

        IMVER =3D "6.7.2"
       =20
        S =3D "${WORKDIR}/ImageMagick-${PV}"

Maybe safe the current directory `packages-split/` somewhere and compare
it with the changes above.

> > >> +
> > >> +FILES_${PN}-dev +=3D "${libdir}/ImageMagick-${IMVER}/modules-Q16/*/=
*.a"
> > >> +
> > >> +FILES_${PN}-dbg +=3D "${libdir}/ImageMagick-${IMVER}/modules-Q16/*/=
.debug/*"
> > >> +
> > >> +BBCLASSEXTEND =3D "native"
> > >> +
> > >> +LEAD_SONAME =3D "libMagickCore.so.*"
> > >> +
> > >> +
> > >> +SRC_URI[md5sum] =3D "62e12090d2d385f4800c06f58f477bea"
> > >> +SRC_URI[sha256sum] =3D "50fe6e1af9e900e5d4bef45879a3a7e15512bb9ab3d=
bbafb521825359cb6d2c7"


Thanks,

Paul


> > > [1] http://www.openembedded.org/wiki/Commit_Policy
> > > [2] http://www.openembedded.org/index.php?title=3DStyleguide

--=-a+3HcmDJaSN/96PuuFw8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk6PZ1IACgkQPX1aK2wOHVjFaACeN6vKI+OOFhVI3qtfPaVaLd1q
GssAnRi2YtqOSi8hEYQTTZbw1fs5E25y
=xW+I
-----END PGP SIGNATURE-----

--=-a+3HcmDJaSN/96PuuFw8--
