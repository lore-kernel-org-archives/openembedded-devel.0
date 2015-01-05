Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 2BB1360167
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 11:59:08 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id k14so27622693wgh.29
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Jan 2015 03:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7/ZLsza6qaX1NR/7peBwprkKcfuRKIV5JtmXwOl3ou8=;
	b=gA3MisewqNW7U8BoWyFMsXqUERUenCBkHgSYXMVzsj/IRxsCC+h8HO4C7FD04BHdzI
	BCUxRzXgnljj5gEe6MyecPiuHfOlkM5S8rFQiU2Dhd+HV8QpFtM8jIysnUXhL+C+XK94
	x8SdoJSSgmtF5UHTDMRij5YekFo+wWCrKfjgGyD5SOPvR7ZoAo7TMEdnG3g4+jM6tZzh
	I0HG+X/3UAj4/AooN0HnLrPdU8VU429H3QNJytAt9XH02E/ymNYCyUO80FAAliCMsuBQ
	SwzfeXA6SJ4I+Iz3Li+aG/S6W0px29G5ztFQQGhlnJszsp9b3kWSnfuYMMtoUfByJnBz
	imAA==
X-Received: by 10.180.74.212 with SMTP id w20mr25327185wiv.22.1420459148852;
	Mon, 05 Jan 2015 03:59:08 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o1sm30402706wjf.41.2015.01.05.03.59.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Jan 2015 03:59:02 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 5 Jan 2015 12:59:03 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150105115903.GE2484@jama>
References: <1420425013-19013-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1420425013-19013-1-git-send-email-liezhi.yang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe] [V2 PATCH 1/5] dash: use BP in SRC_URI
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
X-List-Received-Date: Mon, 05 Jan 2015 11:59:15 -0000
X-Groupsio-MsgNum: 53646
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mrJd9p1Ce66CJMxE"
Content-Disposition: inline

--mrJd9p1Ce66CJMxE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Thanks for v2

Please remember to update your old series as superseded when pushing
newer version, it would help me a lot when sorting the pending patches.

On Sun, Jan 04, 2015 at 06:30:09PM -0800, Robert Yang wrote:
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta-oe/recipes-extended/dash/dash_0.5.8.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-extended/dash/dash_0.5.8.bb b/meta-oe/recipe=
s-extended/dash/dash_0.5.8.bb
> index c2b5249..4961d7b 100644
> --- a/meta-oe/recipes-extended/dash/dash_0.5.8.bb
> +++ b/meta-oe/recipes-extended/dash/dash_0.5.8.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db5262b4a1a1bff=
72b48e935531976d2e"
> =20
>  inherit autotools update-alternatives
> =20
> -SRC_URI =3D "http://gondor.apana.org.au/~herbert/dash/files/${PN}-${PV}.=
tar.gz"
> +SRC_URI =3D "http://gondor.apana.org.au/~herbert/${BPN}/files/${BP}.tar.=
gz"
>  SRC_URI[md5sum] =3D "5c152209680dab3c319e8923f6c51378"
>  SRC_URI[sha256sum] =3D "c6db3a237747b02d20382a761397563d813b306c020ae28c=
e25a1c3915fac60f"
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

--mrJd9p1Ce66CJMxE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSqfIcACgkQN1Ujt2V2gBxhXACdEQztMmgI4Z8rfHWL1Upg2ROe
P+sAoISGtsrxu7UuCyIVFMgbIyQZxrs+
=rWg3
-----END PGP SIGNATURE-----

--mrJd9p1Ce66CJMxE--
