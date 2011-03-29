Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q4Ubz-0002h2-Vq for openembedded-devel@lists.openembedded.org;
	Tue, 29 Mar 2011 10:49:16 +0200
Received: from f053045115.adsl.alicedsl.de ([78.53.45.115]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q4Ua8-0002Bg-CJ for openembedded-devel@lists.openembedded.org;
	Tue, 29 Mar 2011 08:47:20 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1301337206-24526-1-git-send-email-philippedeswert@gmail.com>
References: <1301337206-24526-1-git-send-email-philippedeswert@gmail.com>
Date: Tue, 29 Mar 2011 10:47:18 +0200
Message-ID: <1301388439.4200.8.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH] poppler 0.12.3: remove "default_preference = -1"
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
X-List-Received-Date: Tue, 29 Mar 2011 08:49:16 -0000
X-Groupsio-MsgNum: 30687
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-CLkvgQBJkHJIvLBGMQRB"

--=-CLkvgQBJkHJIvLBGMQRB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Philippe,


please read the commit policy [1] and example [2] on how to format the
commit message. You do not have to resend this patch as I will edit the
commit message before pushing your patch.

Am Montag, den 28.03.2011, 21:33 +0300 schrieb phdeswer:

> remove default_preference game as everybody wants to use the latest
> version, but the default_prefernce is -1 so this fails building packages
> that depend on poppler if not used with a distro that has a preferred
> version or default_preference bump

Please note that you can always set your preferred version in
`conf/local.conf`.

> Signed-off-by: phdeswer <philippedeswert@gmail.com>
>
> ---
>  recipes/poppler/poppler_0.12.3.bb |    5 -----
>  1 files changed, 0 insertions(+), 5 deletions(-)
>=20
> diff --git a/recipes/poppler/poppler_0.12.3.bb b/recipes/poppler/poppler_=
0.12.3.bb
> index 8b9fcca..ce1952e 100644
> --- a/recipes/poppler/poppler_0.12.3.bb
> +++ b/recipes/poppler/poppler_0.12.3.bb
> @@ -2,11 +2,6 @@ require poppler.inc
> =20
>  DEPENDS +=3D "lcms"
> =20
> -DEFAULT_PREFERENCE =3D "-1"
> -DEFAULT_PREFERENCE_angstrom =3D "1"
> -DEFAULT_PREFERENCE_minimal =3D "1"
> -DEFAULT_PREFERENCE_minimal-uclibc =3D "1"
> -
>  EXTRA_OECONF_append =3D " --disable-abiword-output "
> =20
>  RDEPENDS_${PN} =3D "poppler-data"

Do all distribution maintainers agree with this patch? I do not see a
problem since it has been used in tested in =C8=A6ngstr=C3=B6m and
minimal{,-uclibc} for over six months.

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul


[1] http://openembedded.org/index.php/Commit_Policy
[2] http://openembedded.org/index.php/Commit_log_example

--=-CLkvgQBJkHJIvLBGMQRB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2RnIUACgkQPX1aK2wOHVhnlwCeIh8k8k6oAUknGIWOAfC61iaq
6+EAmgPJBfwqBYFVsYXpGye50h5DjoHR
=qvjs
-----END PGP SIGNATURE-----

--=-CLkvgQBJkHJIvLBGMQRB--
