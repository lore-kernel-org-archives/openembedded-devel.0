Received: from mail-ee0-f53.google.com ([74.125.83.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ULYZh-0006WT-E9
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Mar 2013 13:38:29 +0100
Received: by mail-ee0-f53.google.com with SMTP id c13so204685eek.40
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Mar 2013 05:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=sLpLiad50jG9W9mpQwpGaP780cXBHOz8A0d+kMJGGnU=;
	b=t+9dnpvdQ4aWp0ms3q5zQLiWbRyXzYy53LmSC4NTjByFXVn8u3PqqJBCqiODyv9X16
	5oYSJLYt5W/oGlGSxrvVdJjGKG2NiOoMVj3G5UWBFMFxDICHeES7rIF6a/3tHpOlH0cg
	Hb3PrVTzXNkBSKlzPHVwMsF8/uxYh10riC52OkPqOU1y+GEF2YMx76KW34EIbqxtFUYZ
	n/DwXy+bIyAPJospx9N91Ai4d4BacouUFvBR4wkkyWCwDsY1/5+LaibA8kzVsSX2tMlr
	h2KQ+bC1GcQbJ7MdIEGfICF395xPAMzSDRCMzpIXxf4tTelf5xMzxxmlRPglU+epmUCU
	BWPA==
X-Received: by 10.15.34.198 with SMTP id e46mr7364714eev.27.1364559685753;
	Fri, 29 Mar 2013 05:21:25 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 3sm3751737eej.6.2013.03.29.05.21.24
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 29 Mar 2013 05:21:25 -0700 (PDT)
Date: Fri, 29 Mar 2013 13:21:29 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130329122129.GC11120@jama>
References: <F7146556-015E-4D6A-9F58-38284AFCF988@gmail.com>
	<1364283126-22715-1-git-send-email-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1364283126-22715-1-git-send-email-marcin.juszkiewicz@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] libmcrypt: add 2.5.8
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
X-List-Received-Date: Fri, 29 Mar 2013 12:38:29 -0000
X-Groupsio-MsgNum: 43784
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f+W+jCU1fRNres8c"
Content-Disposition: inline

--f+W+jCU1fRNres8c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2013 at 08:32:06AM +0100, Marcin Juszkiewicz wrote:
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Applied, thanks!

Hopefully in right (last) revision.

Would be great if you can update patchwork status and use PATCHvN for
next patches.

memcached/libmemcached are still pending (unresolved review comments=20
afaik).

> ---
>  meta-oe/recipes-support/libmcrypt/libmcrypt_2.5.8.bb | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libmcrypt/libmcrypt_2.5.8.bb
>=20
> diff --git a/meta-oe/recipes-support/libmcrypt/libmcrypt_2.5.8.bb b/meta-=
oe/recipes-support/libmcrypt/libmcrypt_2.5.8.bb
> new file mode 100644
> index 0000000..a169390
> --- /dev/null
> +++ b/meta-oe/recipes-support/libmcrypt/libmcrypt_2.5.8.bb
> @@ -0,0 +1,12 @@
> +DESCRIPTION =3D "Replacement for the old crypt() package and crypt(1) co=
mmand, with extensions."
> +HOMEPAGE =3D "http://mcrypt.sourceforge.net/"
> +LICENSE =3D "LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3Dbbb461211a33b134d42ed5ee8=
02b37ff"
> +DEPENDS =3D "libtool"
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/mcrypt/Libmcrypt/${PV}/libmcr=
ypt-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] =3D "0821830d930a86a5c69110837c55b7da"
> +SRC_URI[sha256sum] =3D "e4eb6c074bbab168ac47b947c195ff8cef9d51a211cdd18c=
a9c9ef34d27a373e"
> +
> +inherit autotools gettext binconfig
> --=20
> 1.8.1.2
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--f+W+jCU1fRNres8c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFVh0kACgkQN1Ujt2V2gByyGACfQimmi5ex+rgImHGYFDFT0ZE1
fHYAn2ltGkkp0I5Ip0sckkxUreAvGAA4
=aOpy
-----END PGP SIGNATURE-----

--f+W+jCU1fRNres8c--
