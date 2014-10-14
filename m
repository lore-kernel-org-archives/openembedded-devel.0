Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id E110C6ACB8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 09:31:43 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id l18so10498931wgh.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 02:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gE+GRnXzQF3mb50ZELaAcx/EcN+vpExDOm8RsBR5Ok4=;
	b=DDBF/FDoNkHpckDA6eed0jUJ3jcHdTtNkEXDblssiP5BG1xY4qq/CrXLWeJLx3fnrN
	C7j+vwUJ04E5ItUMwMdM36LxzLH+vF5rm6W8cLWy0y6JGR+3qq7zVcy0oIoXn1AwPmar
	E3k0bPg2lxih1rNeVb5tnKMsGd8E607lL2BrJ5Nopv9dr29b251itD+i2SG3vfQ9emKd
	eqUkYxMtisQDSiB5HWu7bamF333QVcFVtb8KjtgaGAYVRg9fKGpmrIksPX4hMiG6bpeL
	8oKN5Bh3jEHV1B8X8OHiEbBCVE1eVxRQ+ArXP394NKThrP7HkOAerFwXaMl+GccOgtz3
	B6Sw==
X-Received: by 10.194.90.144 with SMTP id bw16mr847451wjb.133.1413279104247;
	Tue, 14 Oct 2014 02:31:44 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	pn4sm4593150wjc.38.2014.10.14.02.31.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Oct 2014 02:31:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 14 Oct 2014 11:33:32 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141014093332.GI3000@jama>
References: <BLU436-SMTP515C53ADE83EDFDE88FD20D6AC0@phx.gbl>
MIME-Version: 1.0
In-Reply-To: <BLU436-SMTP515C53ADE83EDFDE88FD20D6AC0@phx.gbl>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH v2] cyassl: add version 3.2.0 with updates
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
X-List-Received-Date: Tue, 14 Oct 2014 09:31:50 -0000
X-Groupsio-MsgNum: 52489
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eMP3JyRexyk9c0Bv"
Content-Disposition: inline

--eMP3JyRexyk9c0Bv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2014 at 11:51:59AM -0600, lchristina26 wrote:
> Update 3.2.0 to include the correct md5sum and sha256sum values.

Send the commit which will squash both changes (upgrade together with
checksums update)

> Signed-off-by: Leah Thompson <lchristina26@hotmail.com>
> ---
>  meta-networking/recipes-connectivity/cyassl/cyassl_3.2.0.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl_3.2.0.bb =
b/meta-networking/recipes-connectivity/cyassl/cyassl_3.2.0.bb
> index 0c0cac2..508bab4 100644
> --- a/meta-networking/recipes-connectivity/cyassl/cyassl_3.2.0.bb
> +++ b/meta-networking/recipes-connectivity/cyassl/cyassl_3.2.0.bb
> @@ -1,4 +1,4 @@
> -SUMMARY =3D "CyaSSL Embedded SSL Library"
> +SUMMARY =3D "CyaSSL Lightweight, Embedded SSL Library"
>  DESCRIPTION =3D "CyaSSL is a lightweight SSL library written in C and \
>                 optimized for embedded and RTOS environments. It can be \
>                 Up to 20 times smaller than OpenSSL while still supportin=
g \
> @@ -11,8 +11,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5=
fce4486a80fdaf4a4263"
> =20
>  SRC_URI =3D "http://www.yassl.com/${BP}.zip"
> =20
> -SRC_URI[md5sum] =3D "72477eb50697e759d309c49cb1aef18a"
> -SRC_URI[sha256sum] =3D "85a79009d2a7468910dfb1e4b975e0b00a42c695f4f1a2ad=
c16d2507b5d0b03e"
> +SRC_URI[md5sum] =3D "9f076e82d32bea986651ada34c49f6c0"
> +SRC_URI[sha256sum] =3D "c9e97cd3fa4697e55328c2016965ac4b304fcef45a10559c=
af540c42f1d5e93a"
> =20
>  inherit autotools
> =20
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

--eMP3JyRexyk9c0Bv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQ87ewACgkQN1Ujt2V2gBwYkACgkNdLhg3yj3YuzNx4ab7/G1p0
aIYAn3SwptQ6NVMX6TQDnIizyRqtw3+u
=2fj3
-----END PGP SIGNATURE-----

--eMP3JyRexyk9c0Bv--
