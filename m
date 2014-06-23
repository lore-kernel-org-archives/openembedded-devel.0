Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2849A65E63
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 23:58:59 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id b13so7061828wgh.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 16:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HDj4WOmF3dycQmxFWRDtgj+OOY5cBvJ4zAlNZk9j7bw=;
	b=lm1wsyZiJI+euVt8bDYI0l/Z2wTH1fxrGIMiWizqKkkST8xXKeJLfdpmcfp/zw3Ctx
	Ti7Ka/W8Zdir/6SI/nYqoMI74doESWcomtSm32q+4L7Cem8Xtravx0o7HG9YoTio8WoF
	IuML9Zy2oS6D+rSEEwFsarkDjJ5iE7+78SRpPkUFfiK+Pmw8ZmvUUJXr+8kaavbT4Sl5
	Ce7lxdVJ7SGejBNKy2aUKK6idF81HGp7ILjo2Vx9PGwUTnrJqHz6eyzPf66oE4a1trD8
	MTenNThn4Zpwm3uFNJ9lkHzoXDSWJwbmmjp58ALyv2NdZZlBOjD0zWaSpQT6BwXHpPGM
	JPKg==
X-Received: by 10.181.8.198 with SMTP id dm6mr29601666wid.30.1403567939765;
	Mon, 23 Jun 2014 16:58:59 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gi7sm37891321wib.1.2014.06.23.16.58.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jun 2014 16:58:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 24 Jun 2014 01:58:59 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140623235859.GK2437@jama>
References: <1403553432.2104.112.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1403553432.2104.112.camel@ted>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] eject: Fix B != S builds
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
X-List-Received-Date: Mon, 23 Jun 2014 23:59:02 -0000
X-Groupsio-MsgNum: 50543
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lZZ4ablUVnt2XgAh"
Content-Disposition: inline

--lZZ4ablUVnt2XgAh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2014 at 08:57:12PM +0100, Richard Purdie wrote:
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> diff --git a/meta-oe/recipes-support/eject/eject_2.1.5.bb b/meta-oe/recip=
es-support/eject/eject_2.1.5.bb
> index 9534577..6cb31a7 100644
> --- a/meta-oe/recipes-support/eject/eject_2.1.5.bb
> +++ b/meta-oe/recipes-support/eject/eject_2.1.5.bb
> @@ -9,6 +9,11 @@ SRC_URI =3D "http://sources.openembedded.org/${BP}.tar.g=
z \
>             file://eject-2.1.5-error-return.patch \
>  "
> =20
> +do_compile_prepend () {
> +    mkdir -p ${B}/po
> +    cp -r ${S}/po/* ${B}/po/
> +}

Wasn't this fixed already? I've seen it in your big patch, but the same
logic is applied in newer master already.

> +
>  SRC_URI[md5sum] =3D "b96a6d4263122f1711db12701d79f738"
>  SRC_URI[sha256sum] =3D "ef9f7906484cfde4ba223b2682a37058f9a3c7d3bb1adda7=
a34a67402e2ffe55"
> =20
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lZZ4ablUVnt2XgAh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOov0MACgkQN1Ujt2V2gBzbggCgml+ZjdHqSi2DUNmYoy2HYe6d
0WsAnj9VK3IBysqXsBym/205VrAjEehr
=WLqu
-----END PGP SIGNATURE-----

--lZZ4ablUVnt2XgAh--
