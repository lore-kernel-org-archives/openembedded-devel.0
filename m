Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TYd1n-0002G8-Jg
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Nov 2012 14:29:15 +0100
Received: by mail-bk0-f47.google.com with SMTP id jk7so179567bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Nov 2012 05:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KWEOwhBZnE8Kkw6/PqHx16fKLFPdmglpf0UuUuTPMIg=;
	b=OyImd/jrm5MlbeaKAqoOJe1zRYQ1vRPZZKNzMLJwHPwaODBd0rAmOIWxFlNpZTEnvo
	hkS1Lq8OzPyJwUENMr+YIqL0M4jSDaGhEpOsRBBEeDj6qKzMfyK+uQdBcex3LhGZkU+Q
	UR1CozjwNDUJ9rlTpJvRQOGhzw6ezgwEeISHMrX41sVNFb+RIb0Pweeo++niQ193waRK
	MBgE7/dKNYH0go1qTXee4/e6txdp6cPfxkrhekkU1Tqwk9eGShPFCI5vKt8K/XHQh+mD
	/HqrRUkjnoKQWR9oGbT1giMrRkaHaLF88UWLVCWbWi2F09HYIWpoxjKFG6V/Zrldw770
	8HaA==
Received: by 10.204.150.209 with SMTP id z17mr9022446bkv.8.1352898920029;
	Wed, 14 Nov 2012 05:15:20 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u3sm1436775bkw.9.2012.11.14.05.15.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Nov 2012 05:15:18 -0800 (PST)
Date: Wed, 14 Nov 2012 14:15:31 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121114131531.GL3928@jama.jama.net>
References: <1352896266-24517-1-git-send-email-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1352896266-24517-1-git-send-email-marcin.juszkiewicz@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] packagegroup-cli-tools: remove mdbus2, mterm2, mkdump, mioctl
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
X-List-Received-Date: Wed, 14 Nov 2012 13:29:16 -0000
X-Groupsio-MsgNum: 41504
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Xb8pJpF45Qg/t7GZ"
Content-Disposition: inline

--Xb8pJpF45Qg/t7GZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 14, 2012 at 01:31:06PM +0100, Marcin Juszkiewicz wrote:
> Missing or unbuildable dependency chain was: ['mdbus2']
> Missing or unbuildable dependency chain was: ['mterm2']
> Missing or unbuildable dependency chain was: ['mkdump']
> Missing or unbuildable dependency chain was: ['mioctl']
> ---
>  meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

BTW: those are available in meta-fso if someone will need them.

Cheers,

>=20
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb=
 b/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
> index 07fb056..88b62b8 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
> @@ -4,7 +4,7 @@ SECTION =3D "console"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
>  PV =3D "1.0"
> -PR =3D "r20"
> +PR =3D "r21"
> =20
>  inherit packagegroup allarch
> =20
> @@ -24,9 +24,7 @@ RDEPENDS_${PN} =3D "\
>    iptables \
>    lsof \
>    mbuffer \
> -  mdbus2 \
>    mtd-utils \
> -  mterm2 \
>    nano \
>    nfs-utils-client \
>    nmon \
> @@ -41,8 +39,6 @@ RDEPENDS_${PN}-debug =3D "\
>    devmem2 \
>    i2c-tools \
>    gdb \
> -  mkdump \
> -  mioctl \
>    procps \
>    pxaregs \
>    s3c24xx-gpio \
> --=20
> 1.8.0
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Xb8pJpF45Qg/t7GZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCjmXMACgkQN1Ujt2V2gBzSSACfVi8gbEr8j84zjTO41LUoGCsL
OKwAoJ1SKjrFlbUfPo0XcwAE2C88aNUi
=BZDq
-----END PGP SIGNATURE-----

--Xb8pJpF45Qg/t7GZ--
