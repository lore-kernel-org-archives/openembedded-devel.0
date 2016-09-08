Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7BAC465D00
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Sep 2016 08:40:14 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id b187so2729662wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Sep 2016 01:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=xmkg4vtUYaZ/0emsuMEO6Y1zMOu0XUVX+kb/4v1JBN0=;
	b=f4kvLKgifwBM6rXfcUNMdPKjMFh9JTopdAkG4K3WZRAFD7lmMg11vTqUUKZvqT6Atl
	h3q+yVmthdDFnIcw8/sDDEKYR7yjHNSiLfnfnA+xVVYB5D2gTah/Vw0YjF5RZxWPVcX4
	S6SZMqMqdWaeH1T9vEfYyUyq7gqnyBHg1FOaiUgC7Ef2Q0KcJ5dP40PCpY6Q1L77eF5b
	m2v+gjrp/PLF1hkneLzg5248n2VFRVxnta+ZqQKNWoqLweauWQGLOAegwgrcumPMOxG6
	61dI+wcrjATEkf4I/fNYpQgzd9fQ8FAY9DyPoVYKjdhgnHGzdoTTKIgI9RURCifOVn/0
	rBdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=xmkg4vtUYaZ/0emsuMEO6Y1zMOu0XUVX+kb/4v1JBN0=;
	b=fG7RbwAJtowryShsD+qv2i5EaszVBJodlt1z9PuSG/+/Jh0m5Onyb7sdoUuac7luDD
	o9HCP6qGQyB0Xvapt/JoHxgs9PLLx2ZTEN/O/JMCPX6BsHIfmTNtkv/E4QZtZD3wYwvq
	uIY1tJTxcJW4Akt3ILdIwgpr7uqi2tv7ZXz33TZ+8e+acCp8sH0d0eWJnjEYaMoACeYO
	Pe+tVy7y2qG6d6yf+tIBdb/KdX56fydBQZaI3IDzw/tuwsgW13QPYlnAxX1VBVwkg+nQ
	5PwCKZ0wxU1MBZ7DSgdQai5eTBqsMUlVl/Y8rP7YaBRWRz3egVK/8Tt6cfTrhfXddfJ+
	x1ZQ==
X-Gm-Message-State: AE9vXwP9Qi0LXmT76Qng/mQSIYOehHF7+A1Z5PWBf0SOTLQCdd2kjybdO+l7tgvTL3V+zw==
X-Received: by 10.28.39.134 with SMTP id n128mr7563744wmn.60.1473324014651;
	Thu, 08 Sep 2016 01:40:14 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	uv6sm1105789wjc.31.2016.09.08.01.40.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 08 Sep 2016 01:40:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 8 Sep 2016 10:40:15 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160908084015.GA2636@jama>
References: <20160908051048.15948-1-jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20160908051048.15948-1-jackie.huang@windriver.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
Subject: Re: [meta-networking][PATCH] waf-samba.bbclass: Append PACKAGECONFIG_CONFARGS to EXTRA_OECONF
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
X-List-Received-Date: Thu, 08 Sep 2016 08:40:15 -0000
X-Groupsio-MsgNum: 63012
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VS++wcV0S1rZb1Fb"
Content-Disposition: inline

--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 08, 2016 at 01:10:48PM +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> Append PACKAGECONFIG_CONFARGS to EXTRA_OECONF for waf-samba.bbclass
> because the PACKAGECONFIG will not be handled for all recipes after
> the following commit in oe-core:
>=20
> commit c98fb5f5129e71829ffab4449b3d28082bc95ab4
> Author: Martin Jansa <martin.jansa@gmail.com>
> Date:   Tue Aug 30 16:19:58 2016 +0200
>=20
>     base, autotools: Append PACKAGECONFIG_CONFARGS to EXTRA_OECONF only i=
n autotools.bbclass
>=20
>     * recipes which don't inherit autotools or cmake bbclass and want to
>       use the configure options from PACKAGECONFIG need to handle
>       PACKAGECONFIG_CONFARGS themselves.
>=20
>     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta-networking/classes/waf-samba.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-networking/classes/waf-samba.bbclass b/meta-networking/=
classes/waf-samba.bbclass
> index 772bc75..a58ca2c 100644
> --- a/meta-networking/classes/waf-samba.bbclass
> +++ b/meta-networking/classes/waf-samba.bbclass
> @@ -20,6 +20,8 @@ CONFIGUREOPTS =3D " --prefix=3D${prefix} \
>                    --mandir=3D${mandir} \
>                  "
> =20
> +EXTRA_OECONF_append =3D " ${PACKAGECONFIG_CONFARGS}"

Cannot we append it to CONFIGUREOPTS and remove EXTRA_OECONF from this
bbclass completely?

> +
>  # Three methods for waf cross compile:
>  # 1. answers:
>  #    Only --cross-answers - try the cross-answers file, and if
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VS++wcV0S1rZb1Fb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfRI+4ACgkQN1Ujt2V2gBxIFgCguWGSYLweEImkiOr2fGLKSUWt
RBUAn2H+DnFdtAViJsC/xXiw+r7OBIyI
=NpYg
-----END PGP SIGNATURE-----

--VS++wcV0S1rZb1Fb--
