Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q5OQO-0002W2-Ej for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 22:25:00 +0200
Received: from f053040238.adsl.alicedsl.de ([78.53.40.238]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q5OOU-00083P-4q for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 20:23:02 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1301600399-32041-1-git-send-email-philippedeswert@gmail.com>
References: <1301600399-32041-1-git-send-email-philippedeswert@gmail.com>
Date: Thu, 31 Mar 2011 22:23:00 +0200
Message-ID: <1301602980.3988.18.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH [1/2]] eio: New recipe for eio
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
X-List-Received-Date: Thu, 31 Mar 2011 20:25:00 -0000
X-Groupsio-MsgNum: 30793
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-S4XZ0hGEJ3F50DTr0b8t"

--=-S4XZ0hGEJ3F50DTr0b8t
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 31.03.2011, 22:39 +0300 schrieb Philippe De Swert:

=C2=BBeio: add initial recipe (svn)=C2=AB  or something like that would be =
a
better commit summary in my opinion.

> Signed-off-by: Philippe De Swert <philippedeswert@gmail.com>
> ---
>  recipes/efl1/eio.inc    |   11 +++++++++++
>  recipes/efl1/eio_svn.bb |   13 +++++++++++++
>  2 files changed, 24 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/efl1/eio.inc
>  create mode 100644 recipes/efl1/eio_svn.bb
>=20
> diff --git a/recipes/efl1/eio.inc b/recipes/efl1/eio.inc
> new file mode 100644
> index 0000000..396b455
> --- /dev/null
> +++ b/recipes/efl1/eio.inc
> @@ -0,0 +1,11 @@
> +DESCRIPTION =3D "Enlightenment Input Output Library"
> +LICENSE =3D "MIT BSD"
> +DEPENDS =3D "ecore eina"
> +
> +inherit efl
> +
> +BBCLASSEXTEND =3D "native"
> +INC_PR =3D "r0"
> +
> +# Some upgrade path tweaking
> +AUTO_LIBNAME_PKGS =3D ""

What upgrade patch?

> diff --git a/recipes/efl1/eio_svn.bb b/recipes/efl1/eio_svn.bb
> new file mode 100644
> index 0000000..6a12dcf
> --- /dev/null
> +++ b/recipes/efl1/eio_svn.bb
> @@ -0,0 +1,13 @@
> +require eio.inc
> +
> +SRCREV =3D "${EFL_SRCREV}"
> +PV =3D "0.1.0+svnr${SRCPV}"
> +PR =3D "${INC_PR}.0"
> +DEFAULT_PREFERENCE =3D "-1"

It is the only recipe, so `DP =3D "-1"` should not be useful.

> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D403f20cf42c847686ac2956f14bfa=
30f"
> +
> +SRC_URI =3D "\
> +  ${E_SVN}/trunk;module=3D${SRCNAME};proto=3Dhttp;scmdata=3Dkeep \
> +"
> +S =3D "${WORKDIR}/${SRCNAME}"


Thanks,

Paul

--=-S4XZ0hGEJ3F50DTr0b8t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2U4qQACgkQPX1aK2wOHViIsACfSCyVY+XPk/y3VXNkysItHBBS
MIkAn0EULaRikEPCy3ef0I1mG5N7EhdZ
=81CW
-----END PGP SIGNATURE-----

--=-S4XZ0hGEJ3F50DTr0b8t--
