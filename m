Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id B0E49719FA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2017 08:59:57 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r144so10404861wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2017 00:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=WzSv7PGbK85sUWwHn2QXkoKWu2PTjWFw942/m77BXgk=;
	b=r86NBdXGMuEVdjuJDaNjiGM4aL8ci8fASW0a6MGCpY5rz1UKn56FucZt02I3KxEZi2
	8eTx36lNQ7ZQTi4fJwZjT+OhLOJ1TQLhNbCic570Djpo+4AoOqFcUZvEi+7Q2eVP6018
	VsXqHyyxj62z7ldCsMPzotDHsKTblRotyD/w9XK+oclS4/as6kcBI8J3Zl94sIc/5Nxz
	oIMf/Gh6cMqbzXNG8Pj/hsUuw3QErReZ6Ror71klaT+EJVn3+mfbZWfrH+fKwKl6vAww
	fqqp0jEG13GZlceENQA9g5DLC4LYPSWDL3gLlD5eyF64iR6j6UgfjjzhKx4bdcockff5
	yENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=WzSv7PGbK85sUWwHn2QXkoKWu2PTjWFw942/m77BXgk=;
	b=VxNy1SeqU3AFH0zEQTkWvKHGUuvwlGOTS3867JA4iHTUQCsZ+RfBfllFXcn9BlHt0w
	xpuspH0QPTgrd3G50/jfA2H/y94RJpQGlO7G54OUuWkQ31nF6L+6IgQWtWDRBRDWXMM2
	bH3HGfApG+1kxE6Q63EO+iR0oZuR6drpfX1v8PXwhJ8KGGjtD1WemZO4F8Qu3J/9jXmn
	jaLJlWA8PfjaO2NAEQ3XD7KNPwzo8HegJPK5hAjJuZ4u3yFGL4cQk84F0w5ASl7mGH2h
	L2h2Ykt9f03yjToLtlq9oB9TVYRz60uJHM45rgMWNkrv4bhYEJ3dp/A2P6hzcN+sYkJb
	v/LQ==
X-Gm-Message-State: AIkVDXI7o1hLmWXV2+aHGrvFvMZ63Npvu8rSZmeQWM8FHyIGInznxQadvxv40IpqN9B+oA==
X-Received: by 10.28.207.70 with SMTP id f67mr5867485wmg.72.1484816397836;
	Thu, 19 Jan 2017 00:59:57 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	u81sm11350985wmu.10.2017.01.19.00.59.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 19 Jan 2017 00:59:56 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 19 Jan 2017 09:59:59 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170119085959.GD3265@jama>
References: <1484780365-11240-1-git-send-email-jslater@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1484780365-11240-1-git-send-email-jslater@windriver.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: [meta-webserver][PATCH 1/1] netdata: derive PV from SRCPV
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
X-List-Received-Date: Thu, 19 Jan 2017 08:59:58 -0000
X-Groupsio-MsgNum: 64789
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k4f25fnPtRuIRUb3"
Content-Disposition: inline

--k4f25fnPtRuIRUb3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 18, 2017 at 02:59:25PM -0800, Joe Slater wrote:
> Currently, PV is "git" and contains no version information.
>=20
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  .../recipes-webadmin/netdata/netdata_git.bb        |    1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_git.bb b/met=
a-webserver/recipes-webadmin/netdata/netdata_git.bb
> index 317ddcc..bd43cea 100644
> --- a/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
> +++ b/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
> @@ -5,6 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D747afe070ea=
9d6c2be0a31353609a35b"
> =20
>  SRC_URI =3D "git://github.com/firehol/netdata.git;protocol=3Dhttps"
>  SRCREV =3D "36c1304e37094174ea51001903058e65053107ca"
> +PV =3D "git+${SRCPV}"

1.0.1+git${SRCPV} as configure.ac says

> =20
>  # patch to disable timeout because timeout are not available with actual=
 version
>  # of core-utils
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

--k4f25fnPtRuIRUb3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWICADwAKCRA3VSO3ZXaA
HIkJAKCQwTWIZLIINnVOsHxpLv1Z0CyREQCfaKBZRi0MgHcNf4LJ2dLZrvlmTkg=
=T9dr
-----END PGP SIGNATURE-----

--k4f25fnPtRuIRUb3--
