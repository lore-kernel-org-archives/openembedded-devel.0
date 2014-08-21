Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3DD3F65DB1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Aug 2014 19:31:38 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id m15so9581073wgh.29
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Aug 2014 12:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dAHZ7+vqetk+nx+Ptb1oPMJNZ7drkL1g5KATucu+OrI=;
	b=OAznzOF8ZUSced10+cDNgBOghZBBrjYn1z8M0/RH+/YePHpvHi1EdD930UVlB+KLS2
	J4roFfrfJp56IiRDDx3xbyRjUAGFsFJrKMKpLiESClEqHvd1E4Ovp8WZWl584O7vt56I
	HVr0XJY+53bo0vQTn/uAyJb74oAJp8PuOprb4R3dYJYgXGz5qRPOEYOGB9JLlXTYDy1X
	IepTdrx+sCFhyw9c9sk4TZtHJi+1DR55uT0lG3Hd+YVtmzAFfYpGjGSC2wHj1Uvd4ndV
	bwDlXVHFUNB8JaUbg9nkGiPe1ugwFxjAm/YgDedy74c4Dbdaab6eNK34WmG2LyKZUXqD
	oOlg==
X-Received: by 10.194.77.212 with SMTP id u20mr513090wjw.27.1408649499220;
	Thu, 21 Aug 2014 12:31:39 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	r1sm22928835wia.21.2014.08.21.12.31.37 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Aug 2014 12:31:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 21 Aug 2014 21:31:42 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140821193142.GB3660@jama>
References: <1408612843-22017-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1408612843-22017-1-git-send-email-jackie.huang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] lmbench: remove debianutils from RDEPENDS and add perl
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
X-List-Received-Date: Thu, 21 Aug 2014 19:31:40 -0000
X-Groupsio-MsgNum: 51813
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hCRFYJKfs6IGypzU"
Content-Disposition: inline

--hCRFYJKfs6IGypzU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2014 at 05:20:43AM -0400, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> - I don't see any evdidence that lmbench needs debianutils to run:
>   debianutils provides:
>     run-parts, tempfile, savelog, which, ischroot,
>     add-shell, installkernel, remove-shell
>   but none of them is used by lmbench scripts and I tested it work
>   fine without debianutils, so remove debianutils from RDEPENDS

Lets see how far Tom's memory goes :)

commit 6dbe8d71c465fdf86310ca7f83332ff32baf12f5
Author: Tom Rini <trini@embeddedalley.com>
Date:   Fri Feb 13 01:14:22 2009 -0500

    lmbench: Fix config file location in lmbench-run add RDEP on debianutil=
s, bump PR

>=20
> - Some scripts in lmbench are perl scripts, so add
>   RDEPENDS on perl (no addtional perl module is needed).
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-o=
e/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> index 38e0d2e..0586d72 100644
> --- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> +++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> @@ -74,5 +74,5 @@ pkg_postinst_${PN} () {
>      fi
>  }
> =20
> -RDEPENDS_${PN} =3D "debianutils"
> +RDEPENDS_${PN} =3D "perl"
>  FILES_${PN} +=3D "${datadir}/lmbench ${libdir}/lmbench"
> --=20
> 2.0.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hCRFYJKfs6IGypzU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlP2SR4ACgkQN1Ujt2V2gByEXwCgrw53kcbtqEIqHOa3nCbUnwxo
eUAAniYtTvKMSuHxEklhMLKluRWadnds
=kuqP
-----END PGP SIGNATURE-----

--hCRFYJKfs6IGypzU--
