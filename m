Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NUfFK-0007Ak-1R for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 12:49:17 +0100
Received: from g229061042.adsl.alicedsl.de ([92.229.61.42]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NUfDG-0005jr-SK for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 11:47:07 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ac9c93b11001120329wfe39627vda59932fb1c3784b@mail.gmail.com>
References: <1263292840.20557.80.camel@mattotaupa.wohnung.familie-menzel.net>
	<ac9c93b11001120329wfe39627vda59932fb1c3784b@mail.gmail.com>
Date: Tue, 12 Jan 2010 12:47:05 +0100
Message-ID: <1263296825.20557.139.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [gcc 4.4.2] [libcap, vdr] relocation R_ARM_MOVW_ABS_NC against `a local symbol' can not be used when making a shared object; recompile with -fPIC
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
X-List-Received-Date: Tue, 12 Jan 2010 11:49:17 -0000
X-Groupsio-MsgNum: 15589
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-0D3KWsPMfceZ0krbvOfN"

--=-0D3KWsPMfceZ0krbvOfN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 12.01.2010, 12:29 +0100 schrieb Frans Meulenbroeks:
> 2010/1/12 Paul Menzel <paulepanter@users.sourceforge.net>:
> > sorry for bothering you with this. I am trying to reproduce the errors
> > Henning has seen with g++ 4.4.2 [1] and therefore added the following
> > lines to my `local.conf` for =C3=85ngstr=C3=B6m with BeagleBoard [2].
> >
> > Am Montag, den 11.01.2010, 23:42 +0100 schrieb Paul Menzel:
> >
> > [=E2=80=A6]
> >
> >> Putting
> >>
> >>         PREFERRED_VERSION_binutils               =3D "2.20"
> >>         PREFERRED_VERSION_binutils-cross         =3D "2.20"
> >>         PREFERRED_VERSION_binutils-cross-sdk     =3D "2.20"
> >>
> >>         PREFERRED_VERSION_gcc                    =3D "4.4.2"
> >>         PREFERRED_VERSION_gcc-cross              =3D "4.4.2"
> >>         PREFERRED_VERSION_gcc-cross-sdk          =3D "4.4.2"
> >>         PREFERRED_VERSION_gcc-cross-initial      =3D "4.4.2"
> >>         PREFERRED_VERSION_gcc-cross-intermediate =3D "4.4.2"
> >>
> >> in my `local.conf` and running `bitbake vdr` gave me an error in
> >> `do_compile` for `libcap_1.10.bb`.
> >>
> >>         arm-angstrom-linux-gnueabi-ld -soname libcap.so.1 -x -shared -=
o libcap.so.1.10 cap_alloc.o cap_proc.o cap_extint.o cap_flag.o cap_text.o =
cap_sys.o
> >>         arm-angstrom-linux-gnueabi-ld: cap_text.o: relocation R_ARM_MO=
VW_ABS_NC against `a local symbol' can not be used when making a shared obj=
ect; recompile with -fPIC
> >
> > I do not get these errors if I use the standard versions defined for
> > =C3=85ngstr=C3=B6m which is 4.1.1. Adding `-fPIC` to the flags as sugge=
sted in [3]
> > solves the problem for me.
> >
> > Does anyone know if GCC=E2=80=99s behavior was changed somehow?
>=20
> Did you start from scratch (with an empty tmp)?

I think so. In my `local.conf` I made the following change.

-TMPDIR =3D "${OETREE}/${DISTRO}-dev"
+TMPDIR =3D "${OETREE}/t${DISTRO}-dev"

I hope that is correct.

[=E2=80=A6]


Thanks,

Paul

--=-0D3KWsPMfceZ0krbvOfN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktMYTgACgkQPX1aK2wOHVj+VgCfcVb4azN7k74N2SDSQen9/JOa
FTAAn0YP+t9AkCw2k4dt+ZcvDo/rckN1
=PLlN
-----END PGP SIGNATURE-----

--=-0D3KWsPMfceZ0krbvOfN--
