Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id D922E6FFA4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Mar 2017 09:28:39 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id n11so10604668wma.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Mar 2017 01:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=SOEGYUhXJT3Llr57gI4Lmu8xuSD3+wiBxpTeeZrGIo8=;
	b=iHDebfFSyweDcVxmvjMyHxovR0EpJkp2KSsa3XJ7+2gdnGxKlGb0TsiNoBQeYMpbw/
	Vu0pnQwQVFfpSYPtz5dU3HL9yMNMet1Ygqt5PU+r8NBr/hBqI3ADauBQOcLxuhYmcMnf
	ZTGjgSSpK1VQAQ+5t7rEcOL+70wo6RO76zszvR2+oRLpxd197KsSR7Qd9M+SlRC5xsb7
	9nTo/YwWi0Y9wBn47OudhHI25oCTWzM8leN1jCaQ46mc7rxqizujE00HCoqyYsHUWcPo
	/nbpUeclInVU+eSTkZIpn/fipmBq7DBQWMAnfrn+ifhU0rwqW673kEj3uUW+n4fCcCef
	6T3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=SOEGYUhXJT3Llr57gI4Lmu8xuSD3+wiBxpTeeZrGIo8=;
	b=fIhH58lhEcERjwDvMvGsJg39a4KZ3Tm7eCeLvDYXi9I54tg2E0pMrds/AmmK3eZUJA
	XlT/MoKNR51Sv9yK7QgKxBwoQIHCuv1zakNJlIDvB08udriBIX7TWcNxXg9d1S+r/idn
	vM8PAmfK0FeT9V9xWEiBTXZByRzJ/pp6D4njUu5w1JHRyUgtCJfYvw/xMcgAv6TWvG8e
	YxWMBNDTjcp8uAsC+nSMbhunP7+YLZ6rFw3CMddfEQfVaHYSmQtP1TD3RZwj8IztpAh1
	8/KRZY5QEjkICUIxWH6n7yuRGVJFwKTOr5NcRDFtF04a4GrLpoNrDTfAvLCSwae4lakx
	yuAA==
X-Gm-Message-State: AMke39lru+MVDJIilqPMfSQjz8V064L18OiW69GndLdD9mGGRZHG5ebRqwLbyKzfhBVv6A==
X-Received: by 10.28.183.4 with SMTP id h4mr2189508wmf.140.1488533320388;
	Fri, 03 Mar 2017 01:28:40 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	r195sm2271832wme.25.2017.03.03.01.28.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 03 Mar 2017 01:28:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 3 Mar 2017 10:28:39 +0100
To: Adrian Calianu <Adrian.Calianu@enea.com>
Message-ID: <20170303092839.GA3276@jama>
References: <1488471230-46540-1-git-send-email-adrian.calianu@enea.com>
	<CA+chaQecKFVLcU6zXnNSUfogCNRmp08bJW1gnyvxTVoXaJ_Ezg@mail.gmail.com>
	<A1661D2DDD942248A02617DE63569A01AC279256@SESTOEX04.enea.se>
MIME-Version: 1.0
In-Reply-To: <A1661D2DDD942248A02617DE63569A01AC279256@SESTOEX04.enea.se>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] krb5: allow to generate empty package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Mar 2017 09:28:40 -0000
X-Groupsio-MsgNum: 65664
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Content-Disposition: inline

--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 03, 2017 at 09:24:24AM +0000, Adrian Calianu wrote:
> Hi Martin,
>=20
> From: Martin Jansa [mailto:martin.jansa@gmail.com]
> Sent: Thursday, March 02, 2017 6:53 PM
> To: Adrian Calianu <Adrian.Calianu@enea.com>
> Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
> Subject: Re: [oe] [meta-oe][PATCH] krb5: allow to generate empty package
>=20
> > Since other packages may depend on krb5(${PN}).
>=20
> Then fix these other packages.
> [Adrian Calianu]           If you want to install krb5-dev, krb5-dbg pack=
ages, they are dependent on krb5 but it does not exists!

Good, so you know which packages to fix.

Installing empty packages to rootfs never helped anyone except HW
manufactures because we're wasting disk space and processing on useless
empty packages.

> On Thu, Mar 2, 2017 at 5:13 PM, Adrian Calianu <adrian.calianu@enea.com<m=
ailto:adrian.calianu@enea.com>> wrote:
> Since other packages may depend on krb5(${PN}).
>=20
> Signed-off-by: Adrian Calianu <adrian.calianu@enea.com<mailto:adrian.cali=
anu@enea.com>>
> ---
>  meta-oe/recipes-connectivity/krb5/krb5_1.13.6.bb<http://krb5_1.13.6.bb> =
| 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.13.6.bb<http://krb5=
_1.13.6.bb> b/meta-oe/recipes-connectivity/krb5/krb5_1.13.6.bb<http://krb5_=
1.13.6.bb>
> index 656a02f..a0589a6 100644
> --- a/meta-oe/recipes-connectivity/krb5/krb5_1.13.6.bb<http://krb5_1.13.6=
=2Ebb>
> +++ b/meta-oe/recipes-connectivity/krb5/krb5_1.13.6.bb<http://krb5_1.13.6=
=2Ebb>
> @@ -107,6 +107,8 @@ PACKAGES =3D+ "${PN}-admin-server \
>               libkrb5support \
>               libverto"
>=20
> +ALLOW_EMPTY_${PN} =3D "1"
> +
>  FILES_${PN} =3D ""
>  FILES_${PN}-doc +=3D "${datadir}/examples"
>  FILES_${PN}-dbg +=3D "${libdir}/krb5/plugins/*/.debug"
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org<mailto:Openembedded-devel@lists=
=2Eopenembedded.org>
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWLk3RgAKCRA3VSO3ZXaA
HCz6AKCvnKi5lwO6Hza4hFGwcOaeyMtFRQCfaOr7FVKGPA7P0wfJxHKMEzfCCg4=
=EOXX
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--
