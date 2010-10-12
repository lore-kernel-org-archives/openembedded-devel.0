Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P5n07-0000vU-Fn for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 00:07:16 +0200
Received: from f053038011.adsl.alicedsl.de ([78.53.38.11]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P5mzi-0001Ry-HL for openembedded-devel@lists.openembedded.org;
	Tue, 12 Oct 2010 22:06:50 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1286545200-15699-1-git-send-email-msmith@cbnco.com>
References: <1286545200-15699-1-git-send-email-msmith@cbnco.com>
Date: Wed, 13 Oct 2010 00:06:48 +0200
Message-ID: <1286921208.13054.18.camel@mattotaupa>
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
Subject: Re: [PATCH resend 1/4] make 3.82: set DEFAULT_PREFERENCE = "-1"
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
X-List-Received-Date: Tue, 12 Oct 2010 22:07:16 -0000
X-Groupsio-MsgNum: 24753
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Fkdy7AgjjVLTQJb4VR4g"

--=-Fkdy7AgjjVLTQJb4VR4g
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 08.10.2010, 09:39 -0400 schrieb Michael Smith:
> This version has introduced several backwards incompatibilities and some
> packages are known not to build with 3.82. In particular:
>=20
> - glibc-initial fails in do_install when prefix=3D"".
> - eglibc manual/Makefile has not yet been patched (see 3a06f50f)

Are there patches for these problems available upstream?

> Signed-off-by: Michael Smith <msmith@cbnco.com>
> ---
>  recipes/make/make_3.82.bb |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
>=20
> diff --git a/recipes/make/make_3.82.bb b/recipes/make/make_3.82.bb
> index 3cdc0a0..86c58d6 100644
> --- a/recipes/make/make_3.82.bb
> +++ b/recipes/make/make_3.82.bb
> @@ -1,5 +1,8 @@
>  require make.inc
> =20
> +# Stock eglibc fails to build with make 3.82.

What do you mean by =C2=BBstock=C2=AB? The pristine upstream version or the
version in OE?

> +DEFAULT_PREFERENCE =3D "-1"
> +
>  BBCLASSEXTEND =3D "native"
>  SRC_URI[md5sum] =3D "1a11100f3c63fcf5753818e59d63088f"
>  SRC_URI[sha256sum] =3D "e2c1a73f179c40c71e2fe8abf8a8a0688b8499538512984d=
a4a76958d0402966"


Thanks,

Paul

--=-Fkdy7AgjjVLTQJb4VR4g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAky02/gACgkQPX1aK2wOHVh7FACeIF513lxbCOznUR0rMKFBh+k6
Q8gAn20poxPLBfVRlbONBeJNsnKqVbyO
=ULhe
-----END PGP SIGNATURE-----

--=-Fkdy7AgjjVLTQJb4VR4g--
