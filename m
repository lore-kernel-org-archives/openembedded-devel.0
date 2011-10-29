Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RK7c4-0001UV-Rf for openembedded-devel@lists.openembedded.org;
	Sat, 29 Oct 2011 14:02:12 +0200
Received: from g225082113.adsl.alicedsl.de ([92.225.82.113]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RK7WS-0001wK-Dx for openembedded-devel@lists.openembedded.org;
	Sat, 29 Oct 2011 11:56:24 +0000
Message-ID: <1319889370.3756.8.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 29 Oct 2011 13:56:10 +0200
In-Reply-To: <10e61d56dfc41e0b0a334ec248b20877a8ead600.1319884094.git.Martin.Jansa@gmail.com>
References: <eeffc3b2de8e5277ef3184874b88e4e382fa72c8.1319884094.git.Martin.Jansa@gmail.com>
	<10e61d56dfc41e0b0a334ec248b20877a8ead600.1319884094.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [meta-efl][meta-oe 08/12] elsa: add new login manager for Enlightenment
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
X-List-Received-Date: Sat, 29 Oct 2011 12:02:13 -0000
X-Groupsio-MsgNum: 35062
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-Vhx1XBlTugJ7B4n9yNlx"

--=-Vhx1XBlTugJ7B4n9yNlx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Martin,


could you add the version in the commit summary?


Am Samstag, den 29.10.2011, 12:29 +0200 schrieb Martin Jansa:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-efl/recipes-efl/efl/elsa_svn.bb |   16 ++++++++++++++++
>  1 files changed, 16 insertions(+), 0 deletions(-)
>  create mode 100644 meta-efl/recipes-efl/efl/elsa_svn.bb
>=20
> diff --git a/meta-efl/recipes-efl/efl/elsa_svn.bb b/meta-efl/recipes-efl/=
efl/elsa_svn.bb
> new file mode 100644
> index 0000000..59127d3
> --- /dev/null
> +++ b/meta-efl/recipes-efl/efl/elsa_svn.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION =3D "Login manager for Enlightenment"
> +DEPENDS =3D "efreet eina eet ecore elementary"
> +LICENSE =3D "GPLv3+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
> +SECTION =3D "e/apps"
> +
> +inherit e gettext
> +SRC_URI =3D "${E_SVN}/trunk/PROTO;module=3D${SRCNAME};proto=3Dhttp;scmda=
ta=3Dkeep"
> +S =3D "${WORKDIR}/${SRCNAME}"
> +
> +EXTRA_OECONF =3D "--with-edje-cc=3D${STAGING_BINDIR_NATIVE}/edje_cc"
> +
> +PV =3D "0.0.4+svnr${SRCPV}"
> +SRCREV =3D "${EFL_SRCREV}"
> +
> +#RDEPENDS_${PN} =3D "${PN}-themes"

Is there a reason the last line is commented out(?)?


Thanks,

Paul


--=-Vhx1XBlTugJ7B4n9yNlx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk6r6dsACgkQPX1aK2wOHVgY4gCfbJ6z5y3O+AKkeh7x3RBaS6C9
eAgAniGb1Tz8XKtTB8IG/zHOx3c3YVQZ
=/6Jy
-----END PGP SIGNATURE-----

--=-Vhx1XBlTugJ7B4n9yNlx--
