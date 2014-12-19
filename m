Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id B3650728FE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Dec 2014 19:15:32 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id x12so2132694wgg.39
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Dec 2014 11:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7TKoL/sfneQg22IDwvWpFWY75rqnYh/EvbAovUanODY=;
	b=bHKhJK6rqn+g+O5TEEOZlJTH6rgsciz2iLq20leNuIatgyDSWcwCCkrj5OanKtPhyl
	x6YHpxiZr8YS1DN3TGKRtv2Mu2f6uzGi3fVz/9TnQ/GRj0YteybCJUalg/Y4CFRs5oDI
	gDCOKQyto60nM4XX7YH43kmC+x3Freag8m8lwLXLA50SFuOXuhy/Nu/41LNXFiLZUEvd
	mDUjUtUbx+pX98q3EFMyE2239epHw+UAxY4bZkc6zoXMqBrOWreAp7FMQir8Pa1zuFyz
	1LcOjYvIAAbGoZILAh3PtvEx4yz2WvZ6/Y9sDI/91a6YtV4TWm95A8SXiGQM5W81SeDn
	D66w==
X-Received: by 10.180.205.163 with SMTP id lh3mr8649834wic.63.1419016532528;
	Fri, 19 Dec 2014 11:15:32 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u18sm13736745wjq.42.2014.12.19.11.15.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Dec 2014 11:15:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 19 Dec 2014 20:15:38 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141219191538.GB2461@jama>
References: <BLU436-SMTP19311B478F533B1CE52EB1BD66A0@phx.gbl>
MIME-Version: 1.0
In-Reply-To: <BLU436-SMTP19311B478F533B1CE52EB1BD66A0@phx.gbl>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH] cyassl: updated to version 3.3.0, removed 3.2.0
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
X-List-Received-Date: Fri, 19 Dec 2014 19:15:38 -0000
X-Groupsio-MsgNum: 53403
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xXmbgvnjoT4axfJE"
Content-Disposition: inline

--xXmbgvnjoT4axfJE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 18, 2014 at 01:20:33PM -0700, lchristina26 wrote:
> Signed-off-by: Leah Thompson <lchristina26@hotmail.com>

There isn't 3.2.0 version in meta-networking, so this doesn't apply
again.

http://patchwork.openembedded.org/patch/81639/ wasn't applied because
updated patch wasn't sent (or was missed in patchwork).

> ---
>  .../recipes-connectivity/cyassl/{cyassl_3.2.0.bb =3D> cyassl_3.3.0.bb}  =
| 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-networking/recipes-connectivity/cyassl/{cyassl_3.2.0.bb =3D>=
 cyassl_3.3.0.bb} (81%)
>=20
> diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl_3.2.0.bb =
b/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
> similarity index 81%
> rename from meta-networking/recipes-connectivity/cyassl/cyassl_3.2.0.bb
> rename to meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
> index 508bab4..b6f852d 100644
> --- a/meta-networking/recipes-connectivity/cyassl/cyassl_3.2.0.bb
> +++ b/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
> @@ -11,8 +11,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5=
fce4486a80fdaf4a4263"
> =20
>  SRC_URI =3D "http://www.yassl.com/${BP}.zip"
> =20
> -SRC_URI[md5sum] =3D "9f076e82d32bea986651ada34c49f6c0"
> -SRC_URI[sha256sum] =3D "c9e97cd3fa4697e55328c2016965ac4b304fcef45a10559c=
af540c42f1d5e93a"
> +SRC_URI[md5sum] =3D "0303eb0f2f9065a1207d9104ab0eba7c"
> +SRC_URI[sha256sum] =3D "e51583ea1e4d64537553922d67a96360312811dffef58d4c=
05506aa98a296fe3"
> =20
>  inherit autotools
> =20
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xXmbgvnjoT4axfJE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSUeVoACgkQN1Ujt2V2gBye5wCglMx3qXXKmrhgQEtv9LJtB2Fi
F5IAoIyY4sJothsL/PMp/u66C4b5Joco
=w9iq
-----END PGP SIGNATURE-----

--xXmbgvnjoT4axfJE--
