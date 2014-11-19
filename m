Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 19565714D7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 15:11:27 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id r20so2188336wiv.14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 07:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=BKAMUzWVPNAzRovF5owoA/GDVN1JXcGULlM90818/tc=;
	b=B3s+LwESSyiSNdjORkCXmrCEwkshj/UQl7Pj8qExTy4JCLStlRL4OeX6Qub2QJfyXl
	GR+P34R3huDI7IKfX2p5UUn7LM/rQUmspMAn5p3LI22YpEJuyCBGkUsmnL20hP5Jwz9A
	AqYdoZwoVVu3SLFaqtTC8a2aeYcZjiCgJvDAt2YOCBbxcMAD+0ZJvw/BBTGtycVgTYU9
	CGqc2Oe4AUa1dUu+hWeTYYA6WeWklgQMAIKGBa3X4wbpcLFFRKQ1D5B+eIeFilB/rIND
	053LGV/8dlLn9OqN0O440NN2hLzYLTUpV6VUoGnTsJmeChYJEp+xWOK1d55AA+hETEci
	+lpQ==
X-Received: by 10.194.110.161 with SMTP id ib1mr60971389wjb.78.1416409887852; 
	Wed, 19 Nov 2014 07:11:27 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id dg7sm15847wib.24.2014.11.19.07.11.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Nov 2014 07:11:27 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 19 Nov 2014 16:11:28 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141119151128.GN3315@jama>
References: <1416352369-166176-1-git-send-email-mark.hatle@windriver.com>
	<1416352369-166176-2-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1416352369-166176-2-git-send-email-mark.hatle@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH] polarssl: add dependency openssl
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
X-List-Received-Date: Wed, 19 Nov 2014 15:11:30 -0000
X-Groupsio-MsgNum: 52940
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rFUhhEVnhEf/dYhU"
Content-Disposition: inline

--rFUhhEVnhEf/dYhU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2014 at 05:12:49PM -0600, Mark Hatle wrote:
> From: Kai Kang <kai.kang@windriver.com>
>=20
> polarssl compiles with openssl to build unit test cases. If openssl
> doesn't exist, native libssl.so will be used. Then causes error:
>=20
> | .../bitbake_build/tmp/sysroots/x86_64-linux/usr/lib/libssl.so: error ad=
ding symbols: File in wrong format
>=20
> Add dependency openssl for polarssl to fix it.
>=20
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  recipes-connectivity/polarssl/polarssl_1.3.8.bb | 1 +
>  1 file changed, 1 insertion(+)

Doesn't apply because it doesn't have meta-networking/ directory prefix

>=20
> diff --git a/recipes-connectivity/polarssl/polarssl_1.3.8.bb b/recipes-co=
nnectivity/polarssl/polarssl_1.3.8.bb
> index 8ca1b1c..7a496b7 100644
> --- a/recipes-connectivity/polarssl/polarssl_1.3.8.bb
> +++ b/recipes-connectivity/polarssl/polarssl_1.3.8.bb
> @@ -28,6 +28,7 @@ SRC_URI =3D "https://polarssl.org/download/polarssl-${P=
V}-gpl.tgz"
>  SRC_URI[md5sum] =3D "d1a2b4f21727e888f143414d2e3144e6"
>  SRC_URI[sha256sum] =3D "318171db41335cacbb5b0047c94f1faf91442ab70a223b52=
23436703c9406ff1"
> =20
> +DEPENDS =3D "openssl"
>  RDEPENDS_${PN} +=3D "libcrypto"
>  EXTRA_OECMAKE =3D "-DUSE_SHARED_POLARSSL_LIBRARY=3Don"
> =20
> --=20
> 1.9.3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rFUhhEVnhEf/dYhU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRssyAACgkQN1Ujt2V2gBz0iACglbpERrCf5jHoo+G9vzOLTk7v
njcAn1HPCJY9V/bdc8c6mATNkmjcOK+Z
=4aSQ
-----END PGP SIGNATURE-----

--rFUhhEVnhEf/dYhU--
