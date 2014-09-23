Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6327260167
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2014 16:56:14 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id d1so5530324wiv.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2014 09:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=yrVPhZsTXmukqh/1vZ7/UV8v/+Dc4dvsHHfhh/QuHB8=;
	b=G2LmrdrgM6tzQYlmObSQBcNtPRyYQbUb96TEgFUS07kN9n70atHD0nH6CtYjA/LIWM
	wUtevPSI9OeL63QckcoO8+UAaI+w6nCoW5fNlOCQtiqWohgikNaEWA65vm8fnpRp4smY
	Lf+5nrhuGBcHH7hw+Y5IN0U9Si92cpFnC8hS1uELStYaQk94bHwpQuByZoOOarWsgx/L
	tyiZfOKDpFRJTLM8FRoGugdVXhQmzcd8fN1obF7bBvAQ0M/AUvQxnSG1vFOhd20/7qc1
	S9ElfxH71yzBJmF+kvu3sy2lBem9MwMdx+amVEBgUIh+bMvJpY+MWsnZTSPQzorUL5pg
	j2yA==
X-Received: by 10.180.78.226 with SMTP id e2mr4994512wix.68.1411491375065;
	Tue, 23 Sep 2014 09:56:15 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ic8sm16535859wjb.25.2014.09.23.09.56.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Sep 2014 09:56:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 23 Sep 2014 18:56:59 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140923165659.GC25706@jama>
References: <BLU436-SMTP9355D4FBC3BF05DD79ABFBD6B60@phx.gbl>
MIME-Version: 1.0
In-Reply-To: <BLU436-SMTP9355D4FBC3BF05DD79ABFBD6B60@phx.gbl>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH] cyassl: update to version 3.2.0, remove 3.1.0
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
X-List-Received-Date: Tue, 23 Sep 2014 16:56:17 -0000
X-Groupsio-MsgNum: 52192
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JWEK1jqKZ6MHAcjA"
Content-Disposition: inline

--JWEK1jqKZ6MHAcjA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2014 at 10:34:49AM -0600, lchristina26 wrote:
> This release includes bug fixes and several new features
> which we think will be beneficial to our user and customer base.

You haven't added 3.2.0 version in this patch and your earlier patch
contains exactly the same SRC_URI checksums as 3.1.0 version which looks
very suspicious.

Please re-test and re-send.

>=20
> Signed-off-by: Leah Thompson <lchristina26@hotmail.com>
> ---
>  .../recipes-connectivity/cyassl/cyassl_3.1.0.bb        | 18 ------------=
------
>  1 file changed, 18 deletions(-)
>  delete mode 100644 meta-networking/recipes-connectivity/cyassl/cyassl_3.=
1.0.bb
>=20
> diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb =
b/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
> deleted file mode 100644
> index 0c0cac2..0000000
> --- a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -SUMMARY =3D "CyaSSL Embedded SSL Library"
> -DESCRIPTION =3D "CyaSSL is a lightweight SSL library written in C and \
> -               optimized for embedded and RTOS environments. It can be \
> -               Up to 20 times smaller than OpenSSL while still supportin=
g \
> -               a full TLS 1.2 client and server."
> -HOMEPAGE =3D "http://www.yassl.com/yaSSL/Products-cyassl.html"
> -BUGTRACKER =3D "http://github.com/cyassl/cyassl/issues"
> -SECTION =3D "libs/network"
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> -
> -SRC_URI =3D "http://www.yassl.com/${BP}.zip"
> -
> -SRC_URI[md5sum] =3D "72477eb50697e759d309c49cb1aef18a"
> -SRC_URI[sha256sum] =3D "85a79009d2a7468910dfb1e4b975e0b00a42c695f4f1a2ad=
c16d2507b5d0b03e"
> -
> -inherit autotools
> -
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

--JWEK1jqKZ6MHAcjA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQhplsACgkQN1Ujt2V2gBzZDgCglN5lXVJRNEj+kasmGEeeEelU
yD4AoLpfVR1SP/CFZV8KwqBGpmbyCWq6
=08/s
-----END PGP SIGNATURE-----

--JWEK1jqKZ6MHAcjA--
