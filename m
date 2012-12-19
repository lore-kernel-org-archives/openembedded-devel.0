Received: from mail-pb0-f49.google.com ([209.85.160.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TlL4P-0002bG-34
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Dec 2012 15:56:33 +0100
Received: by mail-pb0-f49.google.com with SMTP id un15so1258394pbc.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2012 06:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XzP//11HtQoZgfuZ2la8FOEWcldszdyJ8C3m55ZkUao=;
	b=bZNck61ekkRKPLZQnGFze+3BOS2gBLKVSElzqX2TP0w2zzejwCD5lBXRDXC/HSNJ83
	yfBkW8T+WuTK4nhVKAdgvqG6eQMeR0L5nC1L+NLRBX4pJW/8Y6iMMDXFE/FsVauvpF7H
	5kh+VbU+jOeP1lfm/dCgC+UIB+KQ7Zpw9zqLyWgGkFcUTdeqfG8pMAKzzG248PRvbgh0
	EOHWWztXIZAb+00ZnOkGmvF1Iv5WV8QLRcYwT1ZcaQcMHsBTFQQ4qWJ6F5GjRWsYKWFc
	G8cQxh9cZYSvuCPJV/MOgKKIZYNNkDQ14V5TU9VChoUsqrPleY9GN5AWhSeqScReNAxy
	52kw==
X-Received: by 10.69.0.101 with SMTP id ax5mr19051127pbd.105.1355928105124;
	Wed, 19 Dec 2012 06:41:45 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id f5sm3540126pav.22.2012.12.19.06.41.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 19 Dec 2012 06:41:44 -0800 (PST)
Date: Wed, 19 Dec 2012 15:41:41 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121219144141.GC14543@jama.palm1.palmone.com>
References: <1355927784-13401-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1355927784-13401-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH V2] python-mako: install standalone, not as an egg
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
X-List-Received-Date: Wed, 19 Dec 2012 14:56:35 -0000
X-Groupsio-MsgNum: 42260
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DIOMP1UsTsWJauNi"
Content-Disposition: inline

--DIOMP1UsTsWJauNi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 19, 2012 at 02:36:24PM +0000, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>

missing meta-oe prefix in subject, but I'll add it to in-test bundle and
merge it later.

> ---
>  meta-oe/recipes-devtools/python/python-mako_0.7.2.bb |    6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb b/meta-=
oe/recipes-devtools/python/python-mako_0.7.2.bb
> index 9113666..d2222d6 100644
> --- a/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb
> +++ b/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb
> @@ -3,7 +3,7 @@ SECTION =3D "devel/python"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dda8dd26ed9751ee0cfdf9df1a16bb=
b54"
> =20
> -PR =3D "r0"
> +PR =3D "r1"
> =20
>  SRC_URI =3D "http://www.makotemplates.org/downloads/Mako-${PV}.tar.gz"
>  SRC_URI[md5sum] =3D "e3c0a677aa4216da9e89ef8fa76cbafb"
> @@ -13,6 +13,10 @@ S =3D "${WORKDIR}/Mako-${PV}"
> =20
>  inherit distutils
> =20
> +DISTUTILS_INSTALL_ARGS =3D "--single-version-externally-managed \
> +                          --root=3D${D} \
> +                          --install-lib=3D${PYTHON_SITEPACKAGES_DIR}"
> +
>  RDEPENDS_${PN} =3D "python-threading \
>                    python-netclient \
>                    python-html \
> --=20
> 1.7.10
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--DIOMP1UsTsWJauNi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDR0iUACgkQN1Ujt2V2gBycwwCgrtLG0ZNhqjQmvKm/8GEG9ifO
3xAAnjIIXeKtg+40zSN99zO/6RPcKrVv
=SAZL
-----END PGP SIGNATURE-----

--DIOMP1UsTsWJauNi--
