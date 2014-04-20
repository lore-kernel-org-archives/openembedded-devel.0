Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8767C65D2C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 09:31:05 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id e49so2864378eek.39
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 02:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bHq8cpEVCgNIZ7hNfOwPUDTDpKYPTqYqoqH50QnAj4I=;
	b=0Od60peAv9J8MG4JPJ7kwMMyDFztOJi9x3gyy6wDuMI2tHT9xy0BMPQbvGjL6iRnkv
	Zg5kLm3BqDj5MhGe8aPYxAMLUyxML+qvTUU0Vass4q6cxjo9TZirseyXxu0/5poMW9I3
	XHJPVcZbw2Nti6KETGFh4jc3qHJLucWW87EgCPEHPbeuyvl0ZQTCIgNEBoaZGoGmgGky
	jB/he8pI0Mg9p7J874v/d0kjz3fgf3C79Ynvso9Uo8M7ZSUq2hRtonM+FTxo/R1LEDNF
	D5vMnz8YA4KgxbkHAGGR/BEGJ8Pynv2N0GyKmd8duGBteBOcAhbkB7r+vaVVn5hQIjYj
	t+kg==
X-Received: by 10.15.31.137 with SMTP id y9mr37183822eeu.12.1397986266569;
	Sun, 20 Apr 2014 02:31:06 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	q49sm93026470eem.34.2014.04.20.02.31.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 02:31:04 -0700 (PDT)
Date: Sun, 20 Apr 2014 11:31:09 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420093109.GI2486@jama>
References: <1397023113-29936-1-git-send-email-kai.kang@windriver.com>
	<1397023113-29936-4-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1397023113-29936-4-git-send-email-kai.kang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 3/3] yajl: update to 2.1.0
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
X-List-Received-Date: Sun, 20 Apr 2014 09:31:06 -0000
X-Groupsio-MsgNum: 49316
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="K511Q2pAJ3dpTMb/"
Content-Disposition: inline

--K511Q2pAJ3dpTMb/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 09, 2014 at 01:58:33PM +0800, Kai Kang wrote:
> Update yajl to version 2.1.0:
> * Correct license
> * Update SRCREV
> * Drop PR

Merged, thanks!

>=20
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../yajl/{yajl_2.0.4.bb =3D> yajl_2.1.0.bb}               | 17 +++++++++=
++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
>  rename meta-oe/recipes-devtools/yajl/{yajl_2.0.4.bb =3D> yajl_2.1.0.bb} =
(24%)
>=20
> diff --git a/meta-oe/recipes-devtools/yajl/yajl_2.0.4.bb b/meta-oe/recipe=
s-devtools/yajl/yajl_2.1.0.bb
> similarity index 24%
> rename from meta-oe/recipes-devtools/yajl/yajl_2.0.4.bb
> rename to meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
> index 9d67e2d..1bf5389 100644
> --- a/meta-oe/recipes-devtools/yajl/yajl_2.0.4.bb
> +++ b/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
> @@ -1,10 +1,15 @@
> -DESCRIPTION =3D "Yet Another JSON Library - A Portable JSON parsing and =
serialization library in ANSI C"
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D74f541bd9a2b6c8e5d0714bcdc327=
f32"
> -PR =3D "r1"
> +SUMMARY =3D "Yet Another JSON Library."
> =20
> -SRCREV =3D "fee1ebef9fa7dc0e9f5a23f37123b19b68c796ff"
> -SRC_URI =3D "git://github.com/lloyd/yajl.git"
> +DESCRIPTION =3D "YAJL is a small event-driven (SAX-style) JSON parser \
> +written in ANSI C, and a small validating JSON generator."
> +
> +HOMEPAGE =3D "http://lloyd.github.com/yajl/"
> +
> +LICENSE =3D "ISC"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D39af6eb42999852bdd3ea00ad120a=
36d"
> +
> +SRC_URI =3D "git://github.com/lloyd/yajl"
> +SRCREV =3D "a0ecdde0c042b9256170f2f8890dd9451a4240aa"
> =20
>  S =3D "${WORKDIR}/git"
> =20
> --=20
> 1.8.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--K511Q2pAJ3dpTMb/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTk90ACgkQN1Ujt2V2gBxwfQCcD/C1lssbGsnoPR12wNxGKQCw
IZ4AnRlRDHcccAmfhaUDw1/guD2GyarN
=4A0h
-----END PGP SIGNATURE-----

--K511Q2pAJ3dpTMb/--
