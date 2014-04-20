Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8D00265D22
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 11:21:16 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id t10so2968205eei.28
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 04:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=EfAJYYW7ZL2x0D1mwcGww9+gsA7YotTysAWPCUoDqNk=;
	b=km0s1CyskctjQCFkHmIznp8MY0AHVHnR+d7psAqtpobv1dRekBeP4sESvReByp0tvT
	64bV+4m3z5/gGEweB/RM5IzjwRieSRxZPBb9RJOKItTCVKPC7YiwVzjq886tVixx4ZXJ
	ELvdrjOjE5uaEOfS3lXav6IRsKlm5QOoiSvmQrEBJKSXM0uAyalm/1zFNdKMBGTxAvwO
	YF5/1/Rx9yTGpqQAwwFHgKF8WJnZeoTLa9dsnMgk4cC/u4zFEWyWIDViCY2X2Dk9foYJ
	8S5MVNYf8I+KsQxmocrIUgMELyMkcyPh2MTVS6Qs5xHZJyNpELOmIH4QpAUitctyVnKg
	VYRg==
X-Received: by 10.14.241.139 with SMTP id g11mr38394198eer.49.1397992877788;
	Sun, 20 Apr 2014 04:21:17 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	s46sm93770417ees.3.2014.04.20.04.21.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 04:21:16 -0700 (PDT)
Date: Sun, 20 Apr 2014 13:21:22 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420112122.GR2486@jama>
References: <cover.1397024315.git.jackie.huang@windriver.com>
	<e45df12394beb4be7872eae57f0beab8734d9447.1397024315.git.jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <e45df12394beb4be7872eae57f0beab8734d9447.1397024315.git.jackie.huang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 1/2] eject: fix multilib builds
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 20 Apr 2014 11:21:17 -0000
X-Groupsio-MsgNum: 49325
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7JtmyEQckRKrnqj+"
Content-Disposition: inline

--7JtmyEQckRKrnqj+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 09, 2014 at 02:27:08PM +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> Use BPN instead of PN, BP instead of P to fix the multilib builds.

Merged, thanks!

>=20
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta-oe/recipes-support/eject/eject_2.1.5.bb |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/eject/eject_2.1.5.bb b/meta-oe/recip=
es-support/eject/eject_2.1.5.bb
> index 3f2c90d..98319a3 100644
> --- a/meta-oe/recipes-support/eject/eject_2.1.5.bb
> +++ b/meta-oe/recipes-support/eject/eject_2.1.5.bb
> @@ -5,12 +5,12 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842c=
2336e835926c2166c28b"
> =20
>  inherit autotools gettext update-alternatives
> =20
> -SRC_URI =3D "http://sources.openembedded.org/${P}.tar.gz"
> +SRC_URI =3D "http://sources.openembedded.org/${BP}.tar.gz"
> =20
>  SRC_URI[md5sum] =3D "b96a6d4263122f1711db12701d79f738"
>  SRC_URI[sha256sum] =3D "ef9f7906484cfde4ba223b2682a37058f9a3c7d3bb1adda7=
a34a67402e2ffe55"
> =20
> -S =3D "${WORKDIR}/${PN}"
> +S =3D "${WORKDIR}/${BPN}"
> =20
>  PR =3D "r1"
> =20
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7JtmyEQckRKrnqj+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTrbIACgkQN1Ujt2V2gBz3NwCfXuS17aAbkCn+tkJB50cHI1CL
rk8An2H5AJzZbbewgQGKEhXFi8RS3eCt
=2x8g
-----END PGP SIGNATURE-----

--7JtmyEQckRKrnqj+--
