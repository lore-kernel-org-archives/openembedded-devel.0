Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7E33E6DC62
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2014 16:16:14 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d17so1652078eek.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2014 08:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=F+1iM2PhWcUKhxXoQjGscgqXMMfOhhp6qDBInF61+cM=;
	b=vTzWnSAGAeLFGxrTIaF0Js6jVozKTqeF6TdnFNsx6d1ivwp55N4YBHASSINFofyrrY
	SbMCLeoeauOJnuy5lZJnSdLeDazjh22i7joYdqUv4t+ip2KLMxre9yB7FmKs0CdNsswW
	MpEY3WhBpkhHlBBUbim/ZsLNq063/o6LCywHFND+4YsJ+7iqPUxz9GsksBFD+lrAQKEE
	ZboBkpjqg88eS4NqN1mHwleMwI5s9B8mBYu8OcYYopUCu1jlV5cWDg5cjcd7b8skXqPU
	rltVxbMdXVWPJLYTXeIsGuqECTmdHogdUEpGdPitfiz73znsbWiNmMQ1rLpqEFCU+Yvg
	HFgA==
X-Received: by 10.15.23.139 with SMTP id h11mr13514436eeu.25.1389888975022;
	Thu, 16 Jan 2014 08:16:15 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id m1sm19362411eeg.0.2014.01.16.08.16.13
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Jan 2014 08:16:14 -0800 (PST)
Date: Thu, 16 Jan 2014 17:16:36 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140116161636.GH3742@jama>
References: <1389888244-1899-1-git-send-email-ulf@emagii.com>
MIME-Version: 1.0
In-Reply-To: <1389888244-1899-1-git-send-email-ulf@emagii.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Ulf Samuelsson <ulf@emagii.com>
Subject: Re: [PATCH] python-nose: avoid duplicate install of setup.py*
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
X-List-Received-Date: Thu, 16 Jan 2014 16:16:14 -0000
X-Groupsio-MsgNum: 47778
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PWfwoUCx3AFJRUBq"
Content-Disposition: inline

--PWfwoUCx3AFJRUBq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2014 at 05:04:04PM +0100, Ulf Samuelsson wrote:
> Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
> ---
>  .../recipes-devtools/python/python-nose_1.2.1.bb   |    4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/meta-oe/recipes-devtools/python/python-nose_1.2.1.bb b/meta-=
oe/recipes-devtools/python/python-nose_1.2.1.bb
> index 083d052..1cf3869 100644
> --- a/meta-oe/recipes-devtools/python/python-nose_1.2.1.bb
> +++ b/meta-oe/recipes-devtools/python/python-nose_1.2.1.bb
> @@ -11,4 +11,8 @@ SRC_URI[sha256sum] =3D "2171e9202d118d302d5db1decb52dd8=
62b79e2a626ca19653a6914574a
> =20
>  S =3D "${WORKDIR}/nose-${PV}"
> =20
> +do_install_append() {
> +	rm -f ${D}${libdir}/python*/site-packages/site.py*
> +}

it was moved to oe-core and I believe that fixed there by RP (change of
inherit)

> +
>  inherit distutils
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PWfwoUCx3AFJRUBq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLYBeQACgkQN1Ujt2V2gBw/ngCfXQ4mJXccEWJk9raqihOjwWgd
heMAn3nmBJ7yW0P8y8H1nos8hVAG/rSp
=igc7
-----END PGP SIGNATURE-----

--PWfwoUCx3AFJRUBq--
