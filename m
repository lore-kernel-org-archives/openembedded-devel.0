Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NXAqL-0002cv-NU for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jan 2010 10:57:54 +0100
Received: from f053039068.adsl.alicedsl.de ([78.53.39.68]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NXAoC-0004FT-Pd for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jan 2010 09:55:36 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1263650387.5298.80.camel@mattotaupa.wohnung.familie-menzel.net>
References: <1263292840.20557.80.camel@mattotaupa.wohnung.familie-menzel.net>
	<1263650387.5298.80.camel@mattotaupa.wohnung.familie-menzel.net>
Date: Tue, 19 Jan 2010 10:55:35 +0100
Message-ID: <1263894935.10980.38.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] libcap: Append `-fPIC` to `CFLAGS` to fix compilation on newer binutils/ld.
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
X-List-Received-Date: Tue, 19 Jan 2010 09:57:54 -0000
X-Groupsio-MsgNum: 15871
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-F/UOKwyE6sLxFSOg0guq"

--=-F/UOKwyE6sLxFSOg0guq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 16.01.2010, 14:59 +0100 schrieb Paul Menzel:

[=E2=80=A6]

> From c119072b0f13b674d705d3bc50150a252bf7c5d2 Mon Sep 17 00:00:00 2001
> From: Paul Menzel <paulepanter@users.sourceforge.net>
> Date: Sat, 16 Jan 2010 14:41:03 +0100
> Subject: [PATCH] libcap: Append `-fPIC` to `CFLAGS` to fix compilation on=
 newer binutils/ld.
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
>=20
> Doing `bitbake libcap` with
>=20
>         PREFERRED_VERSION_binutils               =3D "2.20"
>         PREFERRED_VERSION_binutils-cross         =3D "2.20"
>         PREFERRED_VERSION_binutils-cross-sdk     =3D "2.20"
>=20
>         PREFERRED_VERSION_gcc                    =3D "4.4.2"
>         PREFERRED_VERSION_gcc-cross              =3D "4.4.2"
>         PREFERRED_VERSION_gcc-cross-sdk          =3D "4.4.2"
>         PREFERRED_VERSION_gcc-cross-initial      =3D "4.4.2"
>         PREFERRED_VERSION_gcc-cross-intermediate =3D "4.4.2"
>=20
> in `local.conf` made `do_compile` error out with the following message [1=
].
>=20
>         arm-angstrom-linux-gnueabi-ld -soname libcap.so.1 -x -shared -o l=
ibcap.so.1.10 cap_alloc.o cap_proc.o cap_extint.o cap_flag.o cap_text.o cap=
_sys.o
>         arm-angstrom-linux-gnueabi-ld: cap_text.o: relocation R_ARM_MOVW_=
ABS_NC against `a local symbol' can not be used when making a shared object=
; recompile with -fPIC
>=20
> Khem Raj explained it the following way [2].
>=20
> Am Mittwoch, den 13.01.2010, 02:27 -0800 schrieb Khem Raj:
> > > I also get the same error which I did not get before with GCC 4.1.1.
> >
> > Older versions of binutils/ld can not detect MOVT/MOVW relocations whic=
h
> > are absolute and cant be used in PIC code.
> > hence even if the error was there it remained latent.
>=20
> Therefore just append `-fPIC` to the CFLAGS and bump the PR variable.
>=20
> The strange thing is still, that other distributions seem to have patched=
 libcap to build with `-fPIC` long ago [3=E2=80=935].
>=20
> [1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-January/=
016142.html
> [2] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-January/=
016211.html
> [3] http://www.linuxfromscratch.org/patches/downloads/libcap/libcap-1.10-=
fedora_fixes-1.patch
> [4] http://frugalware.org/pipermail/frugalware-darcs/2005-May/000824.html
> [5] http://cvs.fedoraproject.org/viewvc/rpms/libcap/F-7/libcap-1.10-fPIC.=
patch?revision=3D1.1&view=3Dmarkup
>=20
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> ---
>  recipes/libcap/libcap_1.10.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes/libcap/libcap_1.10.bb b/recipes/libcap/libcap_1.10.b=
b
> index 172acac..241529e 100644
> --- a/recipes/libcap/libcap_1.10.bb
> +++ b/recipes/libcap/libcap_1.10.bb
> @@ -3,9 +3,9 @@ PRIORITY =3D "optional"
>  SECTION =3D "libs"
>  LICENSE =3D "GPL"
>  DEPENDS =3D "bison-native flex-native"
> -PR =3D "r1"
> +PR =3D "r2"
> =20
> -CFLAGS_append =3D " -I${S}/libcap/include"
> +CFLAGS_append =3D " -I${S}/libcap/include -fPIC"
> =20
>  SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/libs/security/linux-privs/ker=
nel-2.4/${PN}-${PV}.tar.bz2 \
>  	   file://makenames.patch;patch=3D1 \

Could this patch please be applied.


Thanks,

Paul

--=-F/UOKwyE6sLxFSOg0guq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktVgZYACgkQPX1aK2wOHVj+yACggbRJlY7iOEyt4JDByXu/Z2WN
qfkAnRjPo22vj9dk8ZuielBvGO/bjJgT
=2xv8
-----END PGP SIGNATURE-----

--=-F/UOKwyE6sLxFSOg0guq--
