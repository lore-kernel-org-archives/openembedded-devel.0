Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 28EBC724E2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Dec 2014 10:24:33 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id z12so400339wgg.15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Dec 2014 02:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=GDT3UO7NNjBFXOyzFCGTWRhMzQO8lME+u8spsg1EZf0=;
	b=iBMpm4nAy+oqZYrqWOSDslfQSWXUV7pe9pPwJcl6Ook+dYcAtJgxEaaz3IedK9jrlC
	4iGTHq7JfIVWPBxK7NytXBo64JUoB4lRyKkbdX64SWpzBRH6X7+1AvX0qgHPjNkMVcGi
	BejptVZ33+QoUzuQuBAis7mpUvFS+BiZwUh0PYXkj6I0nPVz9DxPlNko5p3ZY18i9Fiy
	my5shmDUsCbFx1ahi8w9gOt1zlXJfgEzBWLAeHALNctCRrVLcUlV3FVSgnnCdaGZIeva
	+5pfPFBslqfvwV69S6xEVAMBsBdgpYZohd1aHBjDpWEbdhrJjlTJ0Helv5dZW6TjtCpe
	g6OQ==
X-Received: by 10.194.156.138 with SMTP id we10mr3773283wjb.72.1418120673873; 
	Tue, 09 Dec 2014 02:24:33 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ef1sm13235079wic.0.2014.12.09.02.24.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Dec 2014 02:24:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 9 Dec 2014 11:24:34 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141209102434.GE2470@jama>
References: <1417486264-1878-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1417486264-1878-1-git-send-email-lixin.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] pkcs11-helper : add new recipe
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
X-List-Received-Date: Tue, 09 Dec 2014 10:24:34 -0000
X-Groupsio-MsgNum: 53232
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ytoMbUMiTKPMT3hY"
Content-Disposition: inline

--ytoMbUMiTKPMT3hY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 02, 2014 at 10:11:04AM +0800, Li xin wrote:
> PKCS#11 is a published standard. PKCS#11 is the de-facto standard
> to access cryptographic devices.
> pkcs11-helper is a library that simplifies the interaction with
> PKCS#11 providers for end-user applications using a simple API
> and optional OpenSSL engine.

Fails to configure, check the logs from last world build.

> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  .../pkcs11-helper/pkcs11-helper_1.11.bb            | 28 ++++++++++++++++=
++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 meta-oe/recipes-support/pkcs11-helper/pkcs11-helper_1=
=2E11.bb
>=20
> diff --git a/meta-oe/recipes-support/pkcs11-helper/pkcs11-helper_1.11.bb =
b/meta-oe/recipes-support/pkcs11-helper/pkcs11-helper_1.11.bb
> new file mode 100644
> index 0000000..9d08d25
> --- /dev/null
> +++ b/meta-oe/recipes-support/pkcs11-helper/pkcs11-helper_1.11.bb
> @@ -0,0 +1,28 @@
> +SUMMARY =3D "A library for using PKCS"
> +DESCRIPTION =3D "pkcs11-helper is a library that simplifies the interact=
ion with PKCS \
> +providers for end-user applications using a simple API and optional Open=
SSL \
> +engine. The library allows using multiple PKCS enumerating available tok=
en \
> +certificates, or selecting a certificate directly by serialized id, hand=
ling \
> +card removal and card insert events, handling card ie-insert to a differ=
ent \
> +slot, supporting session expiration and much more all using a simple API=
=2E"
> +
> +HOMEPAGE =3D "git://github.com/OpenSC/pkcs11-helper.git"
> +SECTION =3D "Development/Libraries"
> +
> +LICENSE =3D "GPLv2 BSD"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4948810631bcac142af53d32df5b6=
ee1 \
> +    file://COPYING.GPL;md5=3D8a71d0475d08eee76d8b6d0c6dbec543 \
> +    file://COPYING.BSD;md5=3Df79f90ea7a106796af80b5d05f1f8da1"
> +
> +SRC_URI =3D "git://github.com/OpenSC/pkcs11-helper.git"
> +SRC_URI[md5sum] =3D "9f62af9f475901b89355266141306673"
> +SRC_URI[sha256sum] =3D "494ec59c93e7c56c528f335d9353849e2e7c94a6b1b41c89=
604694e738113386"
> +
> +S =3D "${WORKDIR}/git"
> +SRCREV =3D "e7adf8f35be232a4f04c53b4ac409be52792093e"
> +
> +DEPENDS =3D "zlib nettle gnutls gmp openssl"
> +
> +inherit autotools pkgconfig
> +
> +EXTRA_OECONF =3D " --disable-static --enable-doc "
> --=20
> 1.8.4.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ytoMbUMiTKPMT3hY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSGzeIACgkQN1Ujt2V2gBxRbwCePLKXwdnsTxVih1I8HjbDcjMz
a5YAn1T4B7C82YkQtL5kQ1oWPFOGnVvv
=0uzI
-----END PGP SIGNATURE-----

--ytoMbUMiTKPMT3hY--
