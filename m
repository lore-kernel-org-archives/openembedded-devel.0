Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RZUU0-0003FT-Q2 for openembedded-devel@lists.openembedded.org;
	Sat, 10 Dec 2011 22:29:24 +0100
Received: from f053033126.adsl.alicedsl.de ([78.53.33.126]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RZUNb-0006SU-IE for openembedded-devel@lists.openembedded.org;
	Sat, 10 Dec 2011 21:22:47 +0000
Message-ID: <1323552152.25802.133.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 10 Dec 2011 22:22:32 +0100
In-Reply-To: <1323547821-19780-1-git-send-email-vitperov@gmail.com>
References: <1323547821-19780-1-git-send-email-vitperov@gmail.com>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [PATCH] ftplib: add initial version of recipe
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
X-List-Received-Date: Sat, 10 Dec 2011 21:29:24 -0000
X-Groupsio-MsgNum: 36026
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-+2oXK4nl2168tuhSw7PF"

--=-+2oXK4nl2168tuhSw7PF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Vitaly,


thank you for your patch.

Am Sonntag, den 11.12.2011, 00:10 +0400 schrieb Vitaly Perov:
> From: Vitaly Perov <vit@vt-tech.eu>

Please add the recipe version to the commit summary (subject) and follow
our commit policy [1][2][3].

Especially your Signed-off-by line is missing. Please also add
information how you tested that recipe.

> ---
>  recipes/ftplib/ftplib_3.1.bb |   38 ++++++++++++++++++++++++++++++++++++=
++
>  1 files changed, 38 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/ftplib/ftplib_3.1.bb
>=20
> diff --git a/recipes/ftplib/ftplib_3.1.bb b/recipes/ftplib/ftplib_3.1.bb
> new file mode 100644
> index 0000000..1dcdb3d
> --- /dev/null
> +++ b/recipes/ftplib/ftplib_3.1.bb
> @@ -0,0 +1,38 @@
> +#! /bin/sh
> +

The shebang is not needed.

> +DESCRIPTION =3D "A set of routines that implement the FTP protocol"
> +HOMEPAGE =3D "http://nbpfaus.net/~pfau/ftplib/"
> +LICENSE =3D "LGPLv2"
> +
> +PR =3D "r1"

Please start with `r0` when submitting.

> +
> +########################################################################=
##############

Please remove these =E2=80=9Cstyle=E2=80=9D lines. They are not common. [4]

> +
> +TARGET_CC_ARCH +=3D "${LDFLAGS}"

Why is that needed. Please add a comment and explain it in the commit
message.

> +
> +SRC_URI =3D "http://nbpfaus.net/~pfau/ftplib/ftplib-${PV}-src.tar.gz"

Can you talk with upstream, that they release versioned tarballs
otherwise that will become a mess when upgraded.

> +
> +S =3D "${WORKDIR}/ftplib-${PV}"
> +
> +########################################################################=
##############
> +
> +SRC_URI[md5sum] =3D "c6af758ccbf806b28f022a587a41d9c5"
> +SRC_URI[sha256sum] =3D "be524e1086cfe9d86afa832e1413dde79a4e88ee8ea5325a=
87ffaaf6620a0a2b"
> +
> +########################################################################=
##############
> +do_compile() {
> +    cd linux && make

Are you sure that works? At least `oe-runmake` should be used. This way
you should get not the correct target architecture since the build host
make is used. (I could be mistaken and maybe the Makefile figures it out
nevertheless.)

> +}
> +
> +do_install() {
> +    install -d ${D}/${libdir}
> +    install -d ${D}/${includedir}
> +    install -d ${D}/${bindir}
> +    install -m 755 ${S}/linux/libftp.so.3.1 ${D}/${libdir}
> +    install -m 755 ${S}/linux/libftp.a ${D}/${libdir}
> +    install -m 644 ${S}/linux/ftplib.h ${D}/${includedir}
> +    install -m 755 ${S}/linux/qftp ${D}/${bindir}
> +    (cd ${D}/${libdir} && \
> +     ln -sf libftp.so.3.1 libftp.so.3 && \
> +     ln -sf libftp.so.3 libftp.so)
> +}

I do not know if the last three lines are common. But if it works,
great!


Thanks,

Paul


[1] http://www.openembedded.org/wiki/Category:Policy
[2] http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
[3] http://www.openembedded.org/wiki/Commit_Policy
[4] http://www.openembedded.org/wiki/Styleguide

--=-+2oXK4nl2168tuhSw7PF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk7jzZgACgkQPX1aK2wOHViVNwCfdfOp6McU3Zjrd1EQByZkrtg9
/HMAniQEL7/R+vI0xwBwAceVoqkRi0GQ
=yDry
-----END PGP SIGNATURE-----

--=-+2oXK4nl2168tuhSw7PF--
