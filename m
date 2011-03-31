Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q5OSb-0002e5-9c for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 22:27:17 +0200
Received: from f053040238.adsl.alicedsl.de ([78.53.40.238]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q5OQh-00084b-5m for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 20:25:19 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1301600813-32334-1-git-send-email-philippedeswert@gmail.com>
References: <1301600813-32334-1-git-send-email-philippedeswert@gmail.com>
Date: Thu, 31 Mar 2011 22:25:17 +0200
Message-ID: <1301603117.3988.21.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH [2/2]] ephoto: new recipe. Depends on eio
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
X-List-Received-Date: Thu, 31 Mar 2011 20:27:17 -0000
X-Groupsio-MsgNum: 30794
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-rU4yzpdy0uKCBnImRPo3"

--=-rU4yzpdy0uKCBnImRPo3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 31.03.2011, 22:46 +0300 schrieb Philippe De Swert:

=C2=BBDepends on eio=C2=AB is not useful in my opinion and it is enough, th=
at
`eio` will be committed before this patch.

> Signed-off-by: Philippe De Swert <philippedeswert@gmail.com>
> ---
>  recipes/e17/ephoto_svn.bb |   11 +++++++++++
>  1 files changed, 11 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/e17/ephoto_svn.bb
>=20
> diff --git a/recipes/e17/ephoto_svn.bb b/recipes/e17/ephoto_svn.bb
> new file mode 100644
> index 0000000..c2c744a
> --- /dev/null
> +++ b/recipes/e17/ephoto_svn.bb
> @@ -0,0 +1,11 @@
> +LICENSE =3D "MIT"
> +PV =3D "0.0.1+svnr${SRCREV}"
> +PR =3D "${INC_PR}.0"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddf45d9de58df0b48f515eae8d2421=
257"
> +
> +require e-module.inc
> +
> +DEPENDS +=3D "elementary ethumb ecore eio"
> +
> +SRCNAME =3D "${PN}"

I will build test this tomorrow.


Thanks,

Paul

--=-rU4yzpdy0uKCBnImRPo3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEUEABECAAYFAk2U4y0ACgkQPX1aK2wOHVj58wCbBE/VtFvm/HXg5TBjEGj/WaRQ
YGwAmLCbVledNkCfwKWMmazkZl9oTTs=
=owzV
-----END PGP SIGNATURE-----

--=-rU4yzpdy0uKCBnImRPo3--
