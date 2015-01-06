Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 84C15728DB
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Jan 2015 16:28:07 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id h11so5704084wiw.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jan 2015 08:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=EgxfD7L4hsrPKHaXLfFpPfanWxJT7Nu7StEbp3H9ikA=;
	b=pUsIghIlCG6ieUl8j1ecCLApgKRObYJBNH3P0zqyD1Y/A+Mn4Q/gC3U+mzZYXeMsoq
	igynRMqGh2kds1sJ4EyoMmVKVsZWBHCQTtR/Itbj/6PMuZ+OkqQVdnbUewyfoDG8Joke
	jORul4/PsXn4MCTP1JLdC/IeNc6pTLXPKGZVPWN/7w3X1zV5oXtW8+1YwmlUmtJJJkAN
	E6qMbyp8YFZWi1l+RDjqOXqYu/vSd0pWHHVmWzTIbmwYzuM8bsMhuRc1RINlX8nqKCc6
	AWPl7Yho7qcAAJZMz5Lm23o44rxmduOpssQEV5k7S4ztZeUTjhdO+y3S2rfNf1EA9m8b
	q7Ng==
X-Received: by 10.194.52.37 with SMTP id q5mr189294371wjo.39.1420561687614;
	Tue, 06 Jan 2015 08:28:07 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w3sm29573342wjf.3.2015.01.06.08.28.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Jan 2015 08:28:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 6 Jan 2015 17:28:09 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150106162809.GB12498@jama>
References: <1420560067-8617-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1420560067-8617-1-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 1/2] log4c: fix expat rdepends issue
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
X-List-Received-Date: Tue, 06 Jan 2015 16:28:11 -0000
X-Groupsio-MsgNum: 53698
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZoaI/ZTpAVc4A5k6"
Content-Disposition: inline

--ZoaI/ZTpAVc4A5k6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 06, 2015 at 08:01:06AM -0800, Armin Kuster wrote:
> add --without-expat
>=20
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-oe/recipes-support/log4c/log4c_1.2.4.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/log4c/log4c_1.2.4.bb b/meta-oe/recip=
es-support/log4c/log4c_1.2.4.bb
> index 43e0746..0e58db7 100644
> --- a/meta-oe/recipes-support/log4c/log4c_1.2.4.bb
> +++ b/meta-oe/recipes-support/log4c/log4c_1.2.4.bb
> @@ -12,5 +12,7 @@ S =3D "${WORKDIR}/${PN}-${PV}"
> =20
>  EXTRA_OECONF =3D "--prefix=3D/usr"
> =20
> -inherit autotools
> +PACKAGECONFIG ??=3D""
> +PACKAGECONFIG[expat] =3D ", --without-expat, expat, expat"

Is explicit expat runtime dependency needed when enabled?

It was detected by dependency test so I don't think so (so it's
correctly added by shlibs providers when enabled/detected).

> +inherit autotools
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

--ZoaI/ZTpAVc4A5k6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSsDRkACgkQN1Ujt2V2gBz+EQCeKW7lJ5iaPJZiZRfl1tclcE0W
WqAAniQ/d6XAtwyT8FTeraOPJwomazyK
=lE9S
-----END PGP SIGNATURE-----

--ZoaI/ZTpAVc4A5k6--
