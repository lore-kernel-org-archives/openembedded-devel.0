Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id B5E686CEA7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 13:48:06 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id z15so3986557ead.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 06:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=k/IZhhBVx3KSq5y71edVkS6QFUr7cv61NCc38+xVkzw=;
	b=YcsnM3sWNGAvSYwyZAXSduQQi7kyDJ4zaAl8ml04KnHzmaJeqZG0c83c15H9HLz2d+
	uM83FSicMXcZTeEqjMkn1rU6VceIDe5FTvQjckK4ZvoP6Pu17yz+vWBt0Hmh5Gt4pUG/
	slFSrhq0zL/H7lwYKmx3ykXdhCApZbaiv3TtLMtYZcvj6V8QBKXkR6q/QCAlZ6fTkWzc
	E599NredOSwwMdNCZCIZxIi8MW4n/lLz6lNdanWwG3keDh0wxKunSZjnGMkgWV/OMAhh
	fpJwCb0tG5w8lvtlZV7O/ng5FKctIKlFN+B9BUT63x8vNmbwFVCC8johwov7wHFvN28U
	RmBA==
X-Received: by 10.14.45.70 with SMTP id o46mr887991eeb.19.1381844887751;
	Tue, 15 Oct 2013 06:48:07 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	k7sm166878053eeg.13.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Oct 2013 06:48:07 -0700 (PDT)
Date: Tue, 15 Oct 2013 15:48:09 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Fathi Boudra <fathi.boudra@linaro.org>
Message-ID: <20131015134809.GF3703@jama>
References: <1381841668-16211-1-git-send-email-fathi.boudra@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1381841668-16211-1-git-send-email-fathi.boudra@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCHv3 1/2] libjpeg-turbo: update to 1.3.0 release (svn r988)
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
X-List-Received-Date: Tue, 15 Oct 2013 13:48:08 -0000
X-Groupsio-MsgNum: 46733
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f61P+fpdnY2FZS1u"
Content-Disposition: inline

--f61P+fpdnY2FZS1u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2013 at 03:54:27PM +0300, Fathi Boudra wrote:
> License files changes:
>  + * This file was part of the Independent JPEG Group's software:
>    * Copyright (C) 1991-1998, Thomas G. Lane.
>    * Modified 2002-2009 by Guido Vollbeding.
>  - * Copyright (C) 2009-2011, D. R. Commander.
>  - * This file is part of the Independent JPEG Group's software.
>  + * Modifications:
>  + * Copyright (C) 2009-2011, 2013, D. R. Commander.
>=20
> Update SRC_URI to match new SF layout.
>=20
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
>  meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb b/meta-oe/rec=
ipes-core/jpeg/libjpeg-turbo_svn.bb
> index 4fd258f..cb3693f 100644
> --- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> +++ b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> @@ -3,13 +3,12 @@ HOMEPAGE =3D "http://libjpeg-turbo.org/"
> =20
>  LICENSE =3D"BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://cdjpeg.h;endline=3D12;md5=3D78fa8dbac547bb5=
b2a0e6457a6cfe21d \
> -                    file://jpeglib.h;endline=3D14;md5=3D7bb9a39828a1b1e8=
4acd4e8aec1e5532 \
> -                    file://djpeg.c;endline=3D13;md5=3De85613b52f2906c5df=
c0e21ec902cb33 \
> +                    file://jpeglib.h;endline=3D14;md5=3Da08bb0a80f782a9f=
8da313cc4015ed6f \
> +                    file://djpeg.c;endline=3D13;md5=3D03db065044529233c2=
96324be85530ab \
>  "
> -PV =3D "8d+1.2.1"
> -PR =3D "r2"
> -SRCREV =3D "837"
> -SRC_URI =3D "svn://libjpeg-turbo.svn.sourceforge.net/svnroot/libjpeg-tur=
bo;protocol=3Dhttps;module=3Dtrunk"
> +PV =3D "8d+1.3.0"
> +SRCREV =3D "988"
> +SRC_URI =3D "svn://svn.code.sf.net/p/libjpeg-turbo/code/trunk;protocol=
=3Dhttps;module=3Dtrunk"

looks like there is "trunk" twice now:

NOTE: recipe libjpeg-turbo-8d+1.3.0-r0: task do_fetch: Started
WARNING: Failed to fetch URL
svn://svn.code.sf.net/p/libjpeg-turbo/code/trunk;protocol=3Dhttps;module=3D=
trunk,
attempting MIRRORS if available
ERROR: Fetcher failure: Fetch command failed with exit code 1, output:
svn: E170000: URL
'https://svn.code.sf.net/p/libjpeg-turbo/code/trunk/trunk' doesn't exist

ERROR: Function failed: Fetcher failure for URL:
'svn://svn.code.sf.net/p/libjpeg-turbo/code/trunk;protocol=3Dhttps;module=
=3Dtrunk'.
Unable to fetch URL from any source.


> =20
>  S =3D "${WORKDIR}/trunk"
> =20
> --=20
> 1.8.1.2
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--f61P+fpdnY2FZS1u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJdR5kACgkQN1Ujt2V2gBxu4QCbBnFPA046mfZroD+905o/XiND
HO0AnRBS+C2VH/YTCAkMmtr0EI6H2jzH
=0iBU
-----END PGP SIGNATURE-----

--f61P+fpdnY2FZS1u--
