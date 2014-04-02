Return-Path: <joe@deserted.net>
Received: from mail-qc0-f180.google.com (mail-qc0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 556F16FAD7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Apr 2014 15:23:50 +0000 (UTC)
Received: by mail-qc0-f180.google.com with SMTP id w7so381384qcr.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Apr 2014 08:23:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=cmmhnyK658iz89IQY1ygBxsQCf1Z4xZYb+OhKdGfUBU=;
	b=WvCzmMT/llB+KSu3NEUNwUKg0RKv6jxPARY3k6ZKJFNJXgofZ/6LxZDzmc27YdQoF0
	nm0shk2xNgzi1U3rfbUHVaqpaMtxUkZmXMDADkgMHZcEH6pUsa5IM7uPQPD6U9D78qht
	nVbtqEXIsj7uBvPoFo4oZuBnXr5GYrWVUO8TGMyOnq3d5e1DM+IUURG5pxXoAn/3/aUl
	4lzZFpxWGuwY83yq8m0EjlIvMd7MRQXlbDkcXDIsZEhgT+qC6ZpxezuasUxVyrCsfwRY
	2sPuJ9oSOE6ve7d64CmxA+otsue/j8A1xEQ1qtDPlDS5b3fWQuyhhis1sFik59dFT2r3
	3BDA==
X-Gm-Message-State: ALoCoQmfOMx4NyQo2mHem7d4g3XtVecCBaYiN01VipO6UUvyDIV2MzNppMZ7hhZl0lfGgLdjSVHC
X-Received: by 10.224.164.199 with SMTP id f7mr1207050qay.83.1396452231720;
	Wed, 02 Apr 2014 08:23:51 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id u15sm3005553qge.2.2014.04.02.08.23.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 02 Apr 2014 08:23:51 -0700 (PDT)
Date: Wed, 2 Apr 2014 11:23:48 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140402152347.GC4392@deserted.net>
References: <1396445186-64883-1-git-send-email-javier.viguera@digi.com>
MIME-Version: 1.0
In-Reply-To: <1396445186-64883-1-git-send-email-javier.viguera@digi.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-networking][PATCH] stunnel: fix SRC_URI
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
X-List-Received-Date: Wed, 02 Apr 2014 15:23:53 -0000
X-Groupsio-MsgNum: 49037
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xo44VMWPx7vlQ2+2"
Content-Disposition: inline

--xo44VMWPx7vlQ2+2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-networking][PATCH] stunnel: fix SRC_URI] On 14.04.02 (Wed 15:26=
) Javier Viguera wrote:

> Trying to build stunnel fails with:
>=20
>   ERROR 404: Not Found.
>=20
> Seems that after the new release (5.x) they have moved the old tarball
> under a 'archive/4.x' subdirectory.
>=20
> Signed-off-by: Javier Viguera <javier.viguera@digi.com>
> ---
>  meta-networking/recipes-support/stunnel/stunnel_4.56.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-support/stunnel/stunnel_4.56.bb b/me=
ta-networking/recipes-support/stunnel/stunnel_4.56.bb
> index 7ac2e23afa96..086d0b7aafea 100644
> --- a/meta-networking/recipes-support/stunnel/stunnel_4.56.bb
> +++ b/meta-networking/recipes-support/stunnel/stunnel_4.56.bb
> @@ -5,7 +5,7 @@ LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df41ebed8571077706fee0b860c4d6=
666"
>  DEPENDS =3D "openssl"
> =20
> -SRC_URI =3D "https://www.stunnel.org/downloads/${BP}.tar.gz"
> +SRC_URI =3D "https://www.stunnel.org/downloads/archive/4.x/${BP}.tar.gz"
> =20
>  SRC_URI[md5sum] =3D "ac4c4a30bd7a55b6687cbd62d864054c"
>  SRC_URI[sha256sum] =3D "9cae2cfbe26d87443398ce50d7d5db54e5ea363889d5d2ec=
8d2778a01c871293"
--=20
-Joe MacDonald.
:wq

--xo44VMWPx7vlQ2+2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlM8K4MACgkQwFvcllog0XxD0QCgokaw8mrJo6K2AYApXd0vDJV9
iCAAnA+WQMyfvCLizewvnR6binf/9mHW
=L8Jf
-----END PGP SIGNATURE-----

--xo44VMWPx7vlQ2+2--
