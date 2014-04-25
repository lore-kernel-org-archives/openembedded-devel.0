Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id DFD3365DA0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 12:35:01 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id e49so2752399eek.17
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 05:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vRcdrs/MFACTjahNbLodB1w4aMXKoLEO125hmATteQ8=;
	b=TwaO+Eida56GV7KwYazzpxHK3TDb17EkzoVG4cbzyQaSTf/GAcCKd8Q3T7pmiUXBFD
	yjJQa4i1656bzjmdz9x3fGu89CHnr1AhNjjSv7CwOIiYdElPnYu0oqDWXFLl9MWDfVf0
	ndhbvEh6ELUgWFJWchFtRsTkteBGdgAkIVMMruzQYi7r8UuZMdGRykFbpekFACe2fN47
	TwW103KVHQHFn+6sOQnUlABN2mvluocSKe6LA37+x7ZBNguTfgloCGHvZccuk53ExrkM
	jHO3huhVAm2xkTBsm5TL240UNUDHMMzivFvKyb1dCokSISOh0kImy1Bxq7RkKvx1ovPG
	OAoA==
X-Received: by 10.14.176.193 with SMTP id b41mr4473487eem.55.1398429302108;
	Fri, 25 Apr 2014 05:35:02 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	h47sm24524735eey.13.2014.04.25.05.35.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Apr 2014 05:35:01 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 25 Apr 2014 14:35:11 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140425123511.GT2486@jama>
References: <ljcu7p$b1t$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <ljcu7p$b1t$1@ger.gmane.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][PATCH]Fix: QA Issue: qtmultimedia: Files/directories were installed but not shipped
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
X-List-Received-Date: Fri, 25 Apr 2014 12:35:02 -0000
X-Groupsio-MsgNum: 49492
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="o9qiPLpykPxkk5uk"
Content-Disposition: inline

--o9qiPLpykPxkk5uk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2014 at 08:10:01AM +0200, Neuer User wrote:
> Fix: QA Issue: qtmultimedia: Files/directories were installed but not
> shipped on imx6

Please show the list of files which weren't packaged, I've seen it in
e-mail you sent me, but it should be in commit message as well.

Add SOB line.

>=20
> diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
> index dfc1c76..a2f9a73 100644
> --- a/recipes-qt/qt5/qt5.inc
> +++ b/recipes-qt/qt5/qt5.inc
> @@ -54,6 +54,7 @@ FILES_${PN}-tools-dbg =3D " \
>  "
>  FILES_${PN}-plugins-dbg =3D " \
>      ${OE_QMAKE_PATH_PLUGINS}/*/.debug/* \
> +    ${OE_QMAKE_PATH_PLUGINS}/*/*/.debug/* \
>  "
>=20
>  # extra packages
> @@ -98,6 +99,7 @@ FILES_${PN}-tools =3D " \
>  "
>  FILES_${PN}-plugins =3D " \
>      ${OE_QMAKE_PATH_PLUGINS}/*/*${SOLIBSDEV} \
> +    ${OE_QMAKE_PATH_PLUGINS}/*/*/*${SOLIBSDEV} \
>  "
>  FILES_${PN}-mkspecs =3D "\
>      ${OE_QMAKE_PATH_ARCHDATA}/mkspecs \
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--o9qiPLpykPxkk5uk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNaVn8ACgkQN1Ujt2V2gBwZ9QCgh1NzX6Ru+3YTwdpD7MgS71Mu
Dj4AmwdJpU849TEqq2E57nhafbkYQhg0
=9Rzg
-----END PGP SIGNATURE-----

--o9qiPLpykPxkk5uk--
