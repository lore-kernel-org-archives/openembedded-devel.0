Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id E44DE60089
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Aug 2015 12:38:52 +0000 (UTC)
Received: by wibxm9 with SMTP id xm9so64937016wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Aug 2015 05:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=MmZeZyypgGKpEZ11amd8jb2xWbzGPTqCTcl8submtQQ=;
	b=BDYF0c/qEZxzlcixCgiGH7iI4aZ4suUSZl9IPw5DsA1aucDmdNhWBiqhkg7XyX1wNe
	v4c4/SbBK+kzhUiaZ3151TnJDyVFET5WVtq1l0oxbaWYl84mO4CsMMZ6Wa9BbDUDtHkP
	oXe2wAjnBVsHeaH5sX4oBdV5c9hPsXQtGEBjQ1ohQkUqZPn/wSSt9PHHf6yXhEyn8QhI
	3F4VEC6peTu24TW0hgQ0BUaIfn80G486ypo87KboJvh7j8VJUtqe7AkPwwfZPRHwO0rq
	111/U+PAu6AT84GWenia7t+exZpJxFCCblmgXvwMSIifPdX+Bzuz5QQGPNVi6b2MPmjM
	8mPA==
X-Received: by 10.180.94.168 with SMTP id dd8mr9953470wib.76.1438778332481;
	Wed, 05 Aug 2015 05:38:52 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id z9sm7450327wiv.9.2015.08.05.05.38.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Aug 2015 05:38:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 5 Aug 2015 14:39:08 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150805123908.GB2452@jama>
References: <1438766979-2418-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1438766979-2418-1-git-send-email-lixin.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH] geoip: upgrade 1.6.0 -> 1.6.6
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
X-List-Received-Date: Wed, 05 Aug 2015 12:38:53 -0000
X-Groupsio-MsgNum: 56547
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hQiwHBbRI9kgIhsi"
Content-Disposition: inline

--hQiwHBbRI9kgIhsi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 05, 2015 at 05:29:39PM +0800, Li xin wrote:
> *Modify SRC_URI.
> *Modify chksum of file COPYING and LICENSE,since the context changed.
> But the LICENSE has not been changed.
>=20
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  .../recipes-support/geoip/{geoip_1.6.0.bb =3D> geoip_1.6.6.bb}     | 9 +=
++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>  rename meta-networking/recipes-support/geoip/{geoip_1.6.0.bb =3D> geoip_=
1.6.6.bb} (89%)
>=20
> diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.0.bb b/meta-=
networking/recipes-support/geoip/geoip_1.6.6.bb
> similarity index 89%
> rename from meta-networking/recipes-support/geoip/geoip_1.6.0.bb
> rename to meta-networking/recipes-support/geoip/geoip_1.6.6.bb
> index f1b2aac..eb9d31c 100644
> --- a/meta-networking/recipes-support/geoip/geoip_1.6.0.bb
> +++ b/meta-networking/recipes-support/geoip/geoip_1.6.6.bb
> @@ -8,12 +8,13 @@ using reverse DNS lookups."
>  HOMEPAGE =3D "http://dev.maxmind.com/geoip/"
>  SECTION =3D "libdevel"
> =20
> -SRC_URI =3D "http://www.maxmind.com/download/geoip/api/c/GeoIP-1.6.0.tar=
=2Egz;name=3Dtarball \
> +SRC_URI =3D "git://github.com/maxmind/geoip-api-c.git \
>             http://geolite.maxmind.com/download/geoip/database/GeoLiteCou=
ntry/GeoIP.dat.gz;apply=3Dno;name=3DGeoIP-dat \
>             http://geolite.maxmind.com/download/geoip/database/GeoIPv6.da=
t.gz;apply=3Dno;name=3DGeoIPv6-dat \
>             http://geolite.maxmind.com/download/geoip/database/GeoLiteCit=
y.dat.gz;apply=3Dno;name=3DGeoLiteCity-dat \
>             http://geolite.maxmind.com/download/geoip/database/GeoLiteCit=
yv6-beta/GeoLiteCityv6.dat.gz;apply=3Dno;name=3DGeoLiteCityv6-dat \
>  "
> +SRCREV =3D "ed3f3e2b87fba05a8f2a5b9b1328e7d55be8bf30"
> =20
>  SRC_URI[tarball.md5sum] =3D "89f4cdfdab43f1d67364cd7c85bbe8ca"
>  SRC_URI[tarball.sha256sum] =3D "075a0c2815cd099e9ec35c9569db716a3fefcdbb=
6a10dbfa1ce7c6cd48d4a635"

This isn't needed anymore

> @@ -32,10 +33,10 @@ SRC_URI[GeoLiteCityv6-dat.sha256sum] =3D "eda67f4204b=
a9fa5204a53cdb629167cca9394c7
> =20
>  LICENSE =3D "LGPL-2.1"
> =20
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd5d53d6b948c064f4070183180a4f=
a89 \
> -                    file://LICENSE;md5=3Df04db71812ba70aaba8b38da91984cd=
2 "
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D243b725d71bb5df4a1e5920b344b8=
6ad \
> +                    file://LICENSE;md5=3D0388276749a542b0d611601fa7c1dcc=
8 "
> =20
> -S =3D "${WORKDIR}/GeoIP-1.6.0"
> +S =3D "${WORKDIR}/git"
> =20
>  inherit autotools
> =20
> --=20
> 1.8.4.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hQiwHBbRI9kgIhsi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXCA+sACgkQN1Ujt2V2gByMlQCeLuQDD9v0oJ6ji+6moOlpFYab
paQAn1+IDa7NxZmILWMqTJu0aNBBWAPf
=n7ih
-----END PGP SIGNATURE-----

--hQiwHBbRI9kgIhsi--
