Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rgwsm-0000lD-9b
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Dec 2011 12:13:48 +0100
Received: by eeit10 with SMTP id t10so9242695eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Dec 2011 03:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Y0CowuyW5ORjz+hXJiBK9L8Sw2mvAAoCnQHgxG8dPlI=;
	b=GaFMMhtqaUdFk2vU8G3e/CrWXSG8fG7nOpDt85TeIS2Y3ihvTy/gVjUMyuj/yF8Tcl
	Fy8JE2G5Eu/YBf2p6Q7CsQ/VUOHW5HPjjQzLyHQF7cfZ5sqmtm9KUHW6WJ2FTFkYFk6F
	6RercirLe5VtrgBLHVSBhYtv6wM06RKqjAx4Y=
Received: by 10.213.113.2 with SMTP id y2mr7856078ebp.147.1325329267710;
	Sat, 31 Dec 2011 03:01:07 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 13sm160862078eeu.1.2011.12.31.03.01.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 31 Dec 2011 03:01:06 -0800 (PST)
Date: Sat, 31 Dec 2011 12:00:54 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111231110054.GC3667@jama.jama.net>
References: <1325328013-23217-1-git-send-email-adriano.pallavicino@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1325328013-23217-1-git-send-email-adriano.pallavicino@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Adriano Pallavicino <adriano.pallavicino@gmail.com>
Subject: Re: [PATCHv1] binutils_2.20.1 fixed md5 and sha256 sum
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
X-List-Received-Date: Sat, 31 Dec 2011 11:13:48 -0000
X-Groupsio-MsgNum: 36331
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pvezYHf7grwyp3Bc"
Content-Disposition: inline

--pvezYHf7grwyp3Bc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 31, 2011 at 11:40:13AM +0100, Adriano Pallavicino wrote:
> Signed-off-by: Adriano Pallavicino <adriano.pallavicino@gmail.com>
>=20
> Fixed md5sum and sha256sum

Please check ML, there was about 10 threads for this and examples of
proper fix (using 2.20.1a in SRC_URI) and send updated patch if still
needed.

> ---
>  recipes/binutils/binutils_2.20.1.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes/binutils/binutils_2.20.1.bb b/recipes/binutils/binut=
ils_2.20.1.bb
> index 5154e2d..f40b676 100644
> --- a/recipes/binutils/binutils_2.20.1.bb
> +++ b/recipes/binutils/binutils_2.20.1.bb
> @@ -24,8 +24,8 @@ SRC_URI_append_nios2 =3D" \
>  	file://binutils-nios2.patch \
>  	"
> =20
> -SRC_URI[tarball.sha256sum] =3D "228b84722d87e88e7fdd36869e590e649ab523a0=
800a7d53df906498afe6f6f8"
> -SRC_URI[tarball.md5sum] =3D "9cdfb9d6ec0578c166d3beae5e15c4e5"
> +SRC_URI[tarball.sha256sum] =3D "71d37c96451333c5c0b84b170169fdcb138bbb27=
397dc06281905d9717c8ed64"
> +SRC_URI[tarball.md5sum] =3D "2b9dc8f2b7dbd5ec5992c6e29de0b764"
> =20
>  # powerpc patches
>  SRC_URI +=3D "\
> --=20
> 1.7.4.1
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pvezYHf7grwyp3Bc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7+62YACgkQN1Ujt2V2gBwJywCfZL+F3aFZ4QQnKCsEiRyYi3uz
HJMAoLTSpWYMKi3ftthKFPN9ts4RAatw
=94Gl
-----END PGP SIGNATURE-----

--pvezYHf7grwyp3Bc--
