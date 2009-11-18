Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NAtrD-0005LX-78 for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 00:22:42 +0100
Received: from f053035105.adsl.alicedsl.de ([78.53.35.105]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NAtq0-0006Ut-RG for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 23:21:25 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1258537305.3021.14.camel@mattotaupa.wohnung.familie-menzel.net>
References: <1258311783.18820.149.camel@mattotaupa.wohnung.familie-menzel.net>
	<1258537305.3021.14.camel@mattotaupa.wohnung.familie-menzel.net>
Date: Thu, 19 Nov 2009 00:21:10 +0100
Message-ID: <1258586470.3071.10.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: bitbake base-image: gmp-native: ERROR: function do_configure failed: configure: error: Oops, mp_limb_t is 32 bits, but the assembler code
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
X-List-Received-Date: Wed, 18 Nov 2009 23:22:42 -0000
X-Groupsio-MsgNum: 14449
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-hXW9yj0Q5MQZMEjXSC2F"

--=-hXW9yj0Q5MQZMEjXSC2F
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OpenEmbedded hackers,


Am Mittwoch, den 18.11.2009, 10:41 +0100 schrieb Paul Menzel:
> Am Sonntag, den 15.11.2009, 20:03 +0100 schrieb Paul Menzel:
> > I am trying to build =C3=85ngstr=C3=B6m following [1]. But
> >=20
> >         $ bitbake base-image
> >=20
> > fails when working with gmp-native.
> >=20
> >         ERROR: function do_configure failed
> >         ERROR: see log in /oe/angstrom-dev/work/x86_64-linux/gmp-native=
-4.2.4-r0/temp/log.do_configure.29183
> >         NOTE: Task failed: /oe/angstrom-dev/work/x86_64-linux/gmp-nativ=
e-4.2.4-r0/temp/log.do_configure.29183
> >         ERROR: TaskFailed event exception, aborting
> >         ERROR: Build of /oe/openembedded/recipes/gmp/gmp-native_4.2.4.b=
b do_configure failed
> >         ERROR: Task 1273 (/oe/openembedded/recipes/gmp/gmp-native_4.2.4=
.bb, do_configure) failed
> >         NOTE: Waiting for 3 active tasks to finish
> >         NOTE: 1: /oe/openembedded/recipes/gettext/gettext-native_0.17.b=
b, do_configure (29189)
> >         NOTE: 2: /oe/openembedded/recipes/zlib/zlib-native_1.2.3.bb, do=
_configure (12652)
> >         NOTE: 3: /oe/openembedded/recipes/pkgconfig/pkgconfig-native_0.=
23.bb, do_configure (12447)
> >         NOTE: Waiting for 2 active tasks to finish
> >         NOTE: 1: /oe/openembedded/recipes/gettext/gettext-native_0.17.b=
b, do_configure (29189)
> >         NOTE: 2: /oe/openembedded/recipes/pkgconfig/pkgconfig-native_0.=
23.bb, do_configure (12447)
> >         NOTE: Waiting for 1 active tasks to finish
> >         NOTE: 1: /oe/openembedded/recipes/gettext/gettext-native_0.17.b=
b, do_configure (29189)
> >         NOTE: Tasks Summary: Attempted 539 tasks of which 0 didn't need=
 to be rerun and 1 failed.
> >         ERROR: '/oe/openembedded/recipes/gmp/gmp-native_4.2.4.bb' faile=
d
> >=20
> > The log [2] =E2=80=93 also attached =E2=80=93 shows
> >=20
> >         checking size of mp_limb_t... 4
> >         configure: error: Oops, mp_limb_t is 32 bits, but the assembler=
 code
> >         in this configuration expects 64 bits.
> >         You appear to have set $CFLAGS, perhaps you also need to tell G=
MP the
> >         intended ABI, see "ABI and ISA" in the manual.
> >         FATAL: oe_runconf failed
> >=20
> > The exact same happens for gmp-native 4.3.1. blindvt send me the recipe=
s for this.
> >=20
> > Could someone enlighten me please, what I am missing.
> >=20
> > local.conf is attached and all other files related to gmp-native.
> >=20
> >         $ git branch
> >         * stable/2009
> >=20
> >         HEAD fdfedf718dd484607f1b1b839e5e9608406e02e4
> >=20
> > I am using Debian unstable and MACHINE =3D "beagleboard".
> >=20
> > I think the problem is that I am running a 64-bit Linux kernel with a
> > 32-bit userspace.
> >=20
> >         $ uname -r
> >         2.6.31-1-amd64
> >         $ dpkg --print-architecture
> >         i386
> >=20
> > But running `./.bootstrap` and `./configure` on a normal gmplib checkou=
t
> > [3] does not return any errors, so it must be OpenEmbedded related, mus=
t
> > not it?
> >=20
> > Please tell me, if you need other information.
>=20
> I did some more testing and the same problem exists in the branch
> org.openembedded.dev where gmp 4.2.4 is also present.
>=20
> 1. Is there a maintainer for GMP in OpenEmbedded? I did not find an
> entry in MAINTAINERS [4].
>=20
> 2. Running `./configure` with the flags in the log file
>=20
>         $ ./configure                --build=3Dx86_64-linux
>         --host=3Dx86_64-linux                     --target=3Dx86_64-linux
>         --prefix=3D/srv/oe/angstrom-dev/staging/x86_64-linux/usr
>         --exec_prefix=3D/srv/oe/angstrom-dev/staging/x86_64-linux/usr
>         --bindir=3D/srv/oe/angstrom-dev/staging/x86_64-linux/usr/bin
>         --sbindir=3D/srv/oe/angstrom-dev/staging/x86_64-linux/usr/sbin
>         --libexecdir=3D/srv/oe/angstrom-dev/staging/x86_64-linux/usr/libe=
xec                --datadir=3D/srv/oe/angstrom-dev/staging/x86_64-linux/us=
r/share                     --sysconfdir=3D/srv/oe/angstrom-dev/staging/x86=
_64-linux/etc                --sharedstatedir=3D/srv/oe/angstrom-dev/stagin=
g/x86_64-linux/com                    --localstatedir=3D/srv/oe/angstrom-de=
v/staging/x86_64-linux/var                     --libdir=3D/srv/oe/angstrom-=
dev/staging/x86_64-linux/usr/lib                --includedir=3D/srv/oe/angs=
trom-dev/staging/x86_64-linux/usr/include                --oldincludedir=3D=
/srv/oe/angstrom-dev/staging/x86_64-linux/usr/include                     -=
-infodir=3D/srv/oe/angstrom-dev/staging/x86_64-linux/usr/share/info        =
        --mandir=3D/srv/oe/angstrom-dev/staging/x86_64-linux/usr/share/man
>=20
> in the upstream source and in the temporary directory for build =C3=85ngs=
tr=C3=B6m
> `angstrom-dev/work/x86_64-linux/gmp-native-4.2.4-r0.1/gmp-4.2.4` works
> without problem.
>=20
>         [=E2=80=A6]
>         checking if the assembler takes cl with shldl... yes
>         checking size of unsigned short... 2
>         checking size of unsigned... 4
>         checking size of unsigned long... 4
>         checking size of mp_limb_t... 4
>         checking for stack_t... yes
>         checking for tputs in -lncurses... yes
>         [=E2=80=A6]
>=20
> How do find out what other flags are passed during the BitBake run or
> what environment variables are set, so that I can test the upstream copy
> with these settings?

well, unfortunately my search results did not include any hits from the
OE bug tracker. I looked there a moment ago and found bug #3470 which
seems to be related to my problem [5].

I will try to update it with the information from my messages to the
list in the next days.


Thanks,

Paul


> > [1] http://www.angstrom-distribution.org/building-=C3=A5ngstr=C3=B6m
> > [2] oe/angstrom-dev/work/x86_64-linux/gmp-native-4.2.4-r0/temp$ less lo=
g.do_configure.29183
> > [3] hg clone http://gmplib.org:8000/gmp-4.3/
> [4] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/MAINTAINERS
[5] http://bugs.openembedded.net/show_bug.cgi?id=3D3470

--=-hXW9yj0Q5MQZMEjXSC2F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAksEgWUACgkQPX1aK2wOHViV8ACdE093ywkL85lFw381O31BgWZg
P0UAn2WXgiBGFCo9ytVjGD1dBqR6pmcz
=BC+b
-----END PGP SIGNATURE-----

--=-hXW9yj0Q5MQZMEjXSC2F--
