Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3E65A7D663
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Apr 2019 17:50:27 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id y197so8112788wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Apr 2019 10:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=+3+u8Uw4Ntrn0XY8z0AH58vov7B4WSzcRWs2vsXE0VY=;
	b=lsED1iP9nAWgBxnUfdFjVENqZtemRAvAq2BWHcyeniYk1UCWf8JEg6aGKFM1t/LaTK
	Rr1hokB5z1I3+ykiMCUxBHFWMl2wAv0zl6a56VuAmXw1nBhjKE7x7WPzY1a/+NJsf+lw
	PAtPoIjhoB1vRMSTxYlTyCIi+PLDmNPCG7bZHloON3xC/L+oruDzxJSJ0vUGo3PAyjbL
	x1DdKyKkg7kaXP7azs2SLY8CACdofBhKrMOEDj1bJvMTGoqMXW5a3cvZ4xu560f+rOrw
	v3sbBCQ9UEpDpymZ2T0twyYcbo0lqOeDHkQTxXLvQ+I0N31zgrt9AgDC59rgedpVwaHw
	jQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=+3+u8Uw4Ntrn0XY8z0AH58vov7B4WSzcRWs2vsXE0VY=;
	b=jTym9+zHV18gp/ZVMi8cZdytBn8iDEXuaXynUBzxyj28jNRl0thxDHb+8ot4YbaXwY
	/U++YqJN38frb+TrdjfHGA5slvIZKG5u1jn1198se3UMTW9Exv2Mh+cZM+5ejVI/4klR
	W7GaEgOZq1RnnoSYcvcytzP3sEGt/pjK5ozYeEZGaUVX7K6X7nFDM+0pnhkOx4gO1Va4
	Mt5KCFbBzYNilMy4IUh4sqA5iUE4DfZfvuZu+9zjaSs0XVVgT/kepn7VhK96g6v5dGSV
	w5pmxz7U2BLD4r3sYx0ozv7RbP7RKozcyLCQ06Vwip0sen81ko2xdij06aJ5EUAgMEaz
	izwg==
X-Gm-Message-State: APjAAAWua6NyRSU0U9sPUHtdE0qTdGgyfE1hyGA1GqbNEVY7hCj3PVZ4
	JKa1lHk2/RE+XLewKM8vZkwHWNyX
X-Google-Smtp-Source: APXvYqzbjd5g67xKpXKK436W6qgXxMuNMmzqDks7fYIeHi8tfvIDXIK4JJXqJDXxREkH+I0uzz7Ssw==
X-Received: by 2002:a7b:c353:: with SMTP id l19mr9131278wmj.12.1554486627874; 
	Fri, 05 Apr 2019 10:50:27 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	z74sm10373428wmc.2.2019.04.05.10.50.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 05 Apr 2019 10:50:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 5 Apr 2019 19:50:32 +0200
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <20190405175032.GA1614@jama>
References: <20190405173706.1707-1-alistair.francis@wdc.com>
MIME-Version: 1.0
In-Reply-To: <20190405173706.1707-1-alistair.francis@wdc.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v3 2/6] libfann: Initial commit
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
X-List-Received-Date: Fri, 05 Apr 2019 17:50:27 -0000
X-Groupsio-MsgNum: 77033
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline

--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 05, 2019 at 05:38:14PM +0000, Alistair Francis wrote:
> Use the current master branch instead of the last release in 2013.
>=20
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  meta-oe/recipes-support/libfann/libfann_git.bb | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libfann/libfann_git.bb
>=20
> diff --git a/meta-oe/recipes-support/libfann/libfann_git.bb b/meta-oe/rec=
ipes-support/libfann/libfann_git.bb
> new file mode 100644
> index 000000000..943bdc8c9
> --- /dev/null
> +++ b/meta-oe/recipes-support/libfann/libfann_git.bb
> @@ -0,0 +1,15 @@
> +SUMMARY =3D "Fast Artificial Neural Network (FANN) Library"
> +DESCRIPTION =3D "Fast Artificial Neural Network (FANN) Library is a free=
 open source neural network library, which implements multilayer artificial=
 neural networks in C with support for both fully connected and sparsely co=
nnected networks."
> +HOMEPAGE =3D "https://github.com/libfann/fann"
> +SECTION =3D "libs/devel"
> +
> +LICENSE =3D "LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Df14599a2f089f6ff8c97e2baa4=
e3d575"
> +
> +inherit cmake
> +

Also set some usable PV (instead of the default git).

> +SRCREV =3D "7ec1fc7e5bd734f1d3c89b095e630e83c86b9be1"
> +SRC_URI =3D "git://github.com/libfann/fann.git;branch=3Dmaster \
> +          "
> +
> +S =3D "${WORKDIR}/git"
> --=20
> 2.21.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXKeVZwAKCRA3VSO3ZXaA
HAMrAJ95m9ydACEWlHlNIfZBmNtztbAMQgCcCxRhqA/3YYPg8ruBFNSnxcmPrUM=
=Xkjz
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--
