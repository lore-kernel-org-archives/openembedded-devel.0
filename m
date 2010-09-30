Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P1KVV-0006Wt-S9 for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 16:53:15 +0200
Received: from g225136165.adsl.alicedsl.de ([92.225.136.165]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P1KVK-0001db-FB for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 14:53:02 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1285853610.3805.96.camel@mattotaupa>
References: <1285781858-5299-1-git-send-email-chase.maupin@ti.com>
	<1285803797.5168.3.camel@mattotaupa>
	<131E5DFBE7373E4C8D813795A6AA7F080310F20D5C@dlee06.ent.ti.com>
	<1285853610.3805.96.camel@mattotaupa>
Date: Thu, 30 Sep 2010 16:53:00 +0200
Message-ID: <1285858380.3805.108.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCHv2] am-benchmarks: update to latest version
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
X-List-Received-Date: Thu, 30 Sep 2010 14:53:16 -0000
X-Groupsio-MsgNum: 24223
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-lSRpDrDWnVVMqo87uLVi"

--=-lSRpDrDWnVVMqo87uLVi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 30.09.2010, 15:33 +0200 schrieb Paul Menzel:
> Am Donnerstag, den 30.09.2010, 08:13 -0500 schrieb Maupin, Chase:
> > > -----Original Message-----
> > > On Behalf Of Paul Menzel
> > > Sent: Wednesday, September 29, 2010 6:43 PM
>=20
> > > Am Mittwoch, den 29.09.2010, 12:37 -0500 schrieb Chase Maupin:
> > > > * Updated the SRCREV to the latest version of this project
> > > >   which includes support for multiple platforms.
> > > > * Add COMPATIBLE_MACHINE setting for recipe.
> > > >
> > > > Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> > >=20
> > > it would be great if you could briefly note what changed between the
> > > patch iterations after a --- line, so that it will get removed when i=
t
> > > is committed. v1 =E2=86=92 v2
> >=20
> > Paul,
> >=20
> > Sorry, I'm not exactly sure what you mean here.  Are you saying I shoul=
d do:
> >=20
> > ---
> > What I changed in the v2 version
>=20
> Dear Chase,
>=20
>=20
> yes, exactly.
>=20
> [=E2=80=A6]
>=20
> > > > ---
> > > >  recipes/ti/am-benchmarks_svn.bb |   13 ++++++++++---
> > > >  1 files changed, 10 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/recipes/ti/am-benchmarks_svn.bb b/recipes/ti/am-
> > > benchmarks_svn.bb
> > > > index 51ac6af..6ab29f5 100644
> > > > --- a/recipes/ti/am-benchmarks_svn.bb
> > > > +++ b/recipes/ti/am-benchmarks_svn.bb
> > > > @@ -4,15 +4,22 @@ LICENSE =3D "BSD"
> > > >  SECTION =3D "system"
> > > >  PRIORITY =3D "optional"
> > > >
> > > > -SRCREV =3D "33"
> > > > -PV =3D "1.0"
> > > > +SRCREV =3D "56"
> > > > +PV =3D "1.1"
> > > >  PR =3D "r1+svnr${SRCPV}"
> > > >
> > > > +COMPATIBLE_MACHINE =3D "(dm365|omapl138|omap3|ti816x)"
> > > > +
> > > > +ARCHITECTURE_dm365 =3D "arm9"
> > > > +ARCHITECTURE_omapl138 =3D "arm9"
> > > > +ARCHITECTURE_omap3 =3D "cortex-a8"
> > > > +ARCHITECTURE_ti816x =3D "cortex-a8"
> > > > +
> > > >  INSANE_SKIP_${PN} =3D "True"
> > > >
> > > >  SRC_URI =3D
> > > "svn://gforge.ti.com/svn/am_benchmarks/;module=3Dtrunk;proto=3Dhttps;=
user=3Danon
> > > ymous;pswd=3D''"
> > > >
> > > > -S =3D "${WORKDIR}/trunk"
> > > > +S =3D "${WORKDIR}/trunk/${ARCHITECTURE}"
> > > >
> > > >  do_compile() {
> > > >  	# don't build debug version
> > >=20
> > > I get the following error with minimal-uclibc. The other distribution=
s
> > > still build. The error looks generic though.
> > >=20
> > >         ERROR: 'oe/openembedded/recipes/ti/am-benchmarks_svn.bb' fail=
ed
> > >         ERROR: Function do_compile failed
> > >         [=E2=80=A6]
> > >         Log data follows:
> > >         | make: *** No rule to make target `release'.  Stop.
> > >         | ERROR: Function do_compile failed
> > >         NOTE: package am-benchmarks-1.1-r1+svnr56: task do_compile: F=
ailed
> > >=20
> >=20
> > What device was this built for?
>=20
> 	MACHINE =3D "beagleboard"
>=20
> > Does this issue occur in the previous version of the recipe?
>=20
> I checked with minimal-uclibc and the build fails with a different
> error.
>=20
>         | Building file: ../linpack.c
>         | Invoking: ARM Sourcery Linux GCC C Compiler=20
>         | arm-oe-linux-uclibceabi-gcc -DUNROLL -DSP -O3 -mfloat-abi=3Dsof=
tfp -march=3Darmv7-a -c -fmessage-length=3D0 -MMD -MP -MF"linpack.d" -MT"li=
npack.d" -mcpu=3Dcortex-a8 -o"linpack.o" "../linpack.c"
>         | ../linpack.c:1:0: warning: switch -mcpu=3Dcortex-a8 conflicts w=
ith -march=3D switch
>         | ../linpack.c:92:13: error: 'time' redeclared as different kind =
of symbol
>         | /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-=
linux-uclibceabi/usr/include/time.h:189:15: note: previous declaration of '=
time' was here
>         | make[1]: *** [linpack.o] Error 1
>         | make[1]: Leaving directory `/oe/build-minimal-uclibc/minimal-uc=
libc-dev/work/armv7a-oe-linux-uclibceabi/am-benchmarks-1.0-r1+svnr33/trunk/=
linpack/Release'
>         | make: *** [release] Error 2
>         | ERROR: Function do_compile failed
>=20
> But I do not know if the make target `release` is just not reached. I
> have not yet been able to test with libc or eglibc and will report back
> as soon as possible.

Building `am-benchmarks-1.0-r1+svnr33` worked with minimal (eglibc).

> > I only ever use Angstrom.  Can you provide some details on how I can re=
peat your build?
>=20
>         DISTRO =3D "minimal-uclibc"
>        =20
>         ENABLE_BINARY_LOCALE_GENERATION =3D "0"
>         GLIBC_GENERATE_LOCALES =3D "en_US.UTF-8 en_GB.UTF-8 de_DE.UTF-8"
>        =20
>         # Don't generate the mirror tarball for SCM repos, the snapshot i=
s enough
>         BB_GENERATE_MIRROR_TARBALLS =3D "0"
>        =20
>         MACHINE ?=3D "beagleboard"
>         BUILD_ARCH =3D "i686"
>         BUILD_OS =3D "linux"
>        =20
>         BB_NICE_LEVEL=3D"19"
>        =20
>         PREFERRED_UCLIBC_VERSION	=3D "git"
>=20
> I attached `local.conf` too.


Thanks,

Paul

--=-lSRpDrDWnVVMqo87uLVi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkykpEwACgkQPX1aK2wOHVj9bwCcCYQGcwiN+baCwz52s7w2m/uK
ET4An0+1WRX4bpz09k5XX3ct2UQ8aW1D
=Uu4g
-----END PGP SIGNATURE-----

--=-lSRpDrDWnVVMqo87uLVi--
