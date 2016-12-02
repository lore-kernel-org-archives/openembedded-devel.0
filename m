Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id E0FF0719CE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Dec 2016 09:54:19 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id m203so1841246wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Dec 2016 01:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ORg9yN+S22dLw6JkXQRhB+sB9NiGeBuTyt1JLbrIa+E=;
	b=b3IanZ5Sg0FcCJN88KQF5LsHT4EZyRMqgCI6VKMPV3qjKDLvyPY7DdZ6cfYluLF367
	qbj1RxQ0z/omYDswLynlGDmigursjIwoobXfiLl1fuwGwy9TH1lOrwG8p/h9AdCa0I1X
	fW8uycGBGyxdedOz2C/NNnP5LLrjOmD1NQKMJYMGBIjQWzQCa8VHINknjKbXV4SP5yGW
	wLGOhKj1gLLM6BXjhtJM9UDxH5Y0U452pq5vZ4kBHi9SxCjB3ZylRPF9K00Y/gOHn2ax
	MTcE1N1JTx2SUnD8cfPw958ICiA+8UOcmCWxPh+U30XN4AiqYxS4wgOg7ZKhELGFxg/v
	PhOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ORg9yN+S22dLw6JkXQRhB+sB9NiGeBuTyt1JLbrIa+E=;
	b=D5/TTtqK4PLfjZJdRmG2dAdJlH4LDgl2PiSk4gsomF/QRvL7kGvpyDJKaWuF7h5ZFO
	5nrUbUD6Llu8xJVBczXSYiS4HsrD+t0V9UdSk8JP73HhfGS604gnj1sv1oZlO31AmJIZ
	vABFda4hXJPnYdp4x8m5nXKlJdBXrQaBauFZ0SCGgFM1LjC0e81n/EMvC81EiDlcKkY/
	igazhZ9IUozSXnsIcvxPVuzbiH3TLQkK9e6g7UtD0DHLVlJnZqlgYYPH2rq28Wx6NBWx
	X0X5NBKNmMz5msMbOj3XRAoiSyBWZJ6ZSK1hPwF3jOvIuf+wnV1oe8mzPwLBKe60/H+m
	a26Q==
X-Gm-Message-State: AKaTC010za2adVLN6FfuRLch3jfZ+dmF0kmFkp0FLizmB0U1pFq0dnHFd5jxSWe54ZhCpg==
X-Received: by 10.28.152.79 with SMTP id a76mr2127134wme.47.1480672460229;
	Fri, 02 Dec 2016 01:54:20 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	l67sm2300743wmf.20.2016.12.02.01.54.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 02 Dec 2016 01:54:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 2 Dec 2016 10:54:19 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161202095419.GD3721@jama>
References: <20161202092012.12438-1-gordan.markus@pelagicore.com>
MIME-Version: 1.0
In-Reply-To: <20161202092012.12438-1-gordan.markus@pelagicore.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Cc: Gordan =?utf-8?Q?Marku=C5=A1?= <gordan.markus@pelagicore.com>
Subject: Re: [meta-qt5][PATCH] gdb: Fix QA Warning
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
X-List-Received-Date: Fri, 02 Dec 2016 09:54:20 -0000
X-Groupsio-MsgNum: 64205
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MAH+hnPXVZWQ5cD/"
Content-Disposition: inline

--MAH+hnPXVZWQ5cD/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 02, 2016 at 10:20:11AM +0100, Gordan Marku=C5=A1 wrote:
> WARNING: QA Issue: gdb: invalid PACKAGECONFIG: readline [invalid-packagec=
onfig]
>=20
> Signed-off-by: Gordan Marku=C5=A1 <gordan.markus@pelagicore.com>
> ---
>  recipes-devtools/gdb/gdb_%.bbappend | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/recipes-devtools/gdb/gdb_%.bbappend b/recipes-devtools/gdb/g=
db_%.bbappend
> index 3e663e7..41592c4 100644
> --- a/recipes-devtools/gdb/gdb_%.bbappend
> +++ b/recipes-devtools/gdb/gdb_%.bbappend
> @@ -1 +1 @@
> -PACKAGECONFIG ??=3D "readline python"
> +PACKAGECONFIG ??=3D "python"

What gdb are you using? The version in oe-core has readline
PACKAGECONFIG

meta/recipes-devtools/gdb/gdb-common.inc:PACKAGECONFIG ??=3D "readline"
meta/recipes-devtools/gdb/gdb-common.inc:# Use --without-system-readline to=
 compile with readline 5.
meta/recipes-devtools/gdb/gdb-common.inc:PACKAGECONFIG[readline] =3D "--wit=
h-system-readline,--without-system-readline,readline"

> --=20
> 2.9.3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MAH+hnPXVZWQ5cD/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWEFEygAKCRA3VSO3ZXaA
HEZbAJ9eeKzevD9Qx0Ui4bBvv8SRisfI7gCeOtfv95GNyPHPn02VbOn8dWmF9JU=
=5IvS
-----END PGP SIGNATURE-----

--MAH+hnPXVZWQ5cD/--
