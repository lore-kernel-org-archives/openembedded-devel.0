Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P1JGZ-0000Mh-CM for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 15:33:46 +0200
Received: from g225136165.adsl.alicedsl.de ([92.225.136.165]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P1JGN-00082C-T2 for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 13:33:32 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F080310F20D5C@dlee06.ent.ti.com>
References: <1285781858-5299-1-git-send-email-chase.maupin@ti.com>
	<1285803797.5168.3.camel@mattotaupa>
	<131E5DFBE7373E4C8D813795A6AA7F080310F20D5C@dlee06.ent.ti.com>
Date: Thu, 30 Sep 2010 15:33:30 +0200
Message-ID: <1285853610.3805.96.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
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
X-List-Received-Date: Thu, 30 Sep 2010 13:33:47 -0000
X-Groupsio-MsgNum: 24217
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-eiCs3BPSufFfmE2SCBJB"

--=-eiCs3BPSufFfmE2SCBJB
Content-Type: multipart/mixed; boundary="=-mWWXAZ/hMheGB0FhT+HK"

--=-mWWXAZ/hMheGB0FhT+HK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 30.09.2010, 08:13 -0500 schrieb Maupin, Chase:
> > -----Original Message-----
> > On Behalf Of Paul Menzel
> > Sent: Wednesday, September 29, 2010 6:43 PM

> > Am Mittwoch, den 29.09.2010, 12:37 -0500 schrieb Chase Maupin:
> > > * Updated the SRCREV to the latest version of this project
> > >   which includes support for multiple platforms.
> > > * Add COMPATIBLE_MACHINE setting for recipe.
> > >
> > > Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> >=20
> > it would be great if you could briefly note what changed between the
> > patch iterations after a --- line, so that it will get removed when it
> > is committed. v1 =E2=86=92 v2
>=20
> Paul,
>=20
> Sorry, I'm not exactly sure what you mean here.  Are you saying I should =
do:
>=20
> ---
> What I changed in the v2 version

Dear Chase,


yes, exactly.

[=E2=80=A6]

> > > ---
> > >  recipes/ti/am-benchmarks_svn.bb |   13 ++++++++++---
> > >  1 files changed, 10 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/recipes/ti/am-benchmarks_svn.bb b/recipes/ti/am-
> > benchmarks_svn.bb
> > > index 51ac6af..6ab29f5 100644
> > > --- a/recipes/ti/am-benchmarks_svn.bb
> > > +++ b/recipes/ti/am-benchmarks_svn.bb
> > > @@ -4,15 +4,22 @@ LICENSE =3D "BSD"
> > >  SECTION =3D "system"
> > >  PRIORITY =3D "optional"
> > >
> > > -SRCREV =3D "33"
> > > -PV =3D "1.0"
> > > +SRCREV =3D "56"
> > > +PV =3D "1.1"
> > >  PR =3D "r1+svnr${SRCPV}"
> > >
> > > +COMPATIBLE_MACHINE =3D "(dm365|omapl138|omap3|ti816x)"
> > > +
> > > +ARCHITECTURE_dm365 =3D "arm9"
> > > +ARCHITECTURE_omapl138 =3D "arm9"
> > > +ARCHITECTURE_omap3 =3D "cortex-a8"
> > > +ARCHITECTURE_ti816x =3D "cortex-a8"
> > > +
> > >  INSANE_SKIP_${PN} =3D "True"
> > >
> > >  SRC_URI =3D
> > "svn://gforge.ti.com/svn/am_benchmarks/;module=3Dtrunk;proto=3Dhttps;us=
er=3Danon
> > ymous;pswd=3D''"
> > >
> > > -S =3D "${WORKDIR}/trunk"
> > > +S =3D "${WORKDIR}/trunk/${ARCHITECTURE}"
> > >
> > >  do_compile() {
> > >  	# don't build debug version
> >=20
> > I get the following error with minimal-uclibc. The other distributions
> > still build. The error looks generic though.
> >=20
> >         ERROR: 'oe/openembedded/recipes/ti/am-benchmarks_svn.bb' failed
> >         ERROR: Function do_compile failed
> >         [=E2=80=A6]
> >         Log data follows:
> >         | make: *** No rule to make target `release'.  Stop.
> >         | ERROR: Function do_compile failed
> >         NOTE: package am-benchmarks-1.1-r1+svnr56: task do_compile: Fai=
led
> >=20
>=20
> What device was this built for?

	MACHINE =3D "beagleboard"

> Does this issue occur in the previous version of the recipe?

I checked with minimal-uclibc and the build fails with a different
error.

        | Building file: ../linpack.c
        | Invoking: ARM Sourcery Linux GCC C Compiler=20
        | arm-oe-linux-uclibceabi-gcc -DUNROLL -DSP -O3 -mfloat-abi=3Dsoftf=
p -march=3Darmv7-a -c -fmessage-length=3D0 -MMD -MP -MF"linpack.d" -MT"linp=
ack.d" -mcpu=3Dcortex-a8 -o"linpack.o" "../linpack.c"
        | ../linpack.c:1:0: warning: switch -mcpu=3Dcortex-a8 conflicts wit=
h -march=3D switch
        | ../linpack.c:92:13: error: 'time' redeclared as different kind of=
 symbol
        | /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-li=
nux-uclibceabi/usr/include/time.h:189:15: note: previous declaration of 'ti=
me' was here
        | make[1]: *** [linpack.o] Error 1
        | make[1]: Leaving directory `/oe/build-minimal-uclibc/minimal-ucli=
bc-dev/work/armv7a-oe-linux-uclibceabi/am-benchmarks-1.0-r1+svnr33/trunk/li=
npack/Release'
        | make: *** [release] Error 2
        | ERROR: Function do_compile failed

But I do not know if the make target `release` is just not reached. I
have not yet been able to test with libc or eglibc and will report back
as soon as possible.

> I only ever use Angstrom.  Can you provide some details on how I can repe=
at your build?

        DISTRO =3D "minimal-uclibc"
       =20
        ENABLE_BINARY_LOCALE_GENERATION =3D "0"
        GLIBC_GENERATE_LOCALES =3D "en_US.UTF-8 en_GB.UTF-8 de_DE.UTF-8"
       =20
        # Don't generate the mirror tarball for SCM repos, the snapshot is =
enough
        BB_GENERATE_MIRROR_TARBALLS =3D "0"
       =20
        MACHINE ?=3D "beagleboard"
        BUILD_ARCH =3D "i686"
        BUILD_OS =3D "linux"
       =20
        BB_NICE_LEVEL=3D"19"
       =20
        PREFERRED_UCLIBC_VERSION	=3D "git"

I attached `local.conf` too.


Thanks,

Paul

--=-mWWXAZ/hMheGB0FhT+HK
Content-Disposition: attachment; filename="local.conf"
Content-Type: text/plain; name="local.conf"; charset="UTF-8"
Content-Transfer-Encoding: base64

IyBXaGVyZSB0byBzdG9yZSBzb3VyY2VzDQpETF9ESVIgPSAiJHtPRVRSRUV9L2Rvd25sb2FkcyIN
Cg0KI0lOSEVSSVQgKz0gInJtX3dvcmsiDQoNCiMgTWFrZSBzdXJlIHlvdSBoYXZlIHRoZXNlIGlu
c3RhbGxlZA0KI0FTU1VNRV9QUk9WSURFRCArPSAiZ2RrLXBpeGJ1Zi1jc291cmNlLW5hdGl2ZSBp
bWFnZW1hZ2ljay1uYXRpdmUgbGlicnN2Zy1uYXRpdmUiDQoNCiMgV2hpY2ggZmlsZXMgZG8gd2Ug
d2FudCB0byBwYXJzZToNCkJCRklMRVMgOj0gIiR7T0VUUkVFfS9vcGVuZW1iZWRkZWQvcmVjaXBl
cy8qLyouYmIiDQpCQk1BU0sgPSAiIg0KIA0KIyBXaGF0IGtpbmQgb2YgaW1hZ2VzIGRvIHdlIHdh
bnQ/DQpJTUFHRV9GU1RZUEVTICs9ICJ0YXIuYnoyIg0KDQojIFNldCBUTVBESVIgaW5zdGVhZCBv
ZiBkZWZhdWx0aW5nIGl0IHRvICRwd2QvdG1wDQpUTVBESVIgPSAiJHtPRVRSRUV9L2J1aWxkLW1p
bmltYWwtdWNsaWJjLyR7RElTVFJPfS1kZXYiDQoNCiMgTWFrZSB1c2Ugb2YgU01QIGFuZCBmYXN0
IGRpc2tzDQpQQVJBTExFTF9NQUtFID0gIi1qNCINCkJCX05VTUJFUl9USFJFQURTID0gIjQiDQoN
CiN0aW5kZXJib3gNCiNJTkhFUklUICs9ICJvZXN0YXRzLWNsaWVudCINCiNPRVNUQVRTX0JVSUxE
RVIgICAgICA9ICIiDQoNCkRJU1RSTyA9ICJtaW5pbWFsLXVjbGliYyINCg0KRU5BQkxFX0JJTkFS
WV9MT0NBTEVfR0VORVJBVElPTiA9ICIwIg0KR0xJQkNfR0VORVJBVEVfTE9DQUxFUyA9ICJlbl9V
Uy5VVEYtOCBlbl9HQi5VVEYtOCBkZV9ERS5VVEYtOCINCg0KIyBEb24ndCBnZW5lcmF0ZSB0aGUg
bWlycm9yIHRhcmJhbGwgZm9yIFNDTSByZXBvcywgdGhlIHNuYXBzaG90IGlzIGVub3VnaA0KQkJf
R0VORVJBVEVfTUlSUk9SX1RBUkJBTExTID0gIjAiDQoNCk1BQ0hJTkUgPz0gImJlYWdsZWJvYXJk
Ig0KQlVJTERfQVJDSCA9ICJpNjg2Ig0KQlVJTERfT1MgPSAibGludXgiDQoNCkJCX05JQ0VfTEVW
RUw9IjE5Ig0KDQpQUkVGRVJSRURfVUNMSUJDX1ZFUlNJT04JPSAiZ2l0Ig0K

--=-mWWXAZ/hMheGB0FhT+HK--

--=-eiCs3BPSufFfmE2SCBJB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkykkaoACgkQPX1aK2wOHVjidACfX3aghzb+xwYW9G/Bpo1JgVYQ
fNQAn1OuGfcyw8cuhjnBlyIBvqZTwSFJ
=lYB+
-----END PGP SIGNATURE-----

--=-eiCs3BPSufFfmE2SCBJB--
