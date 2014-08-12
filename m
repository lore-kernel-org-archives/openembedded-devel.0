Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0D80D65E1B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 11:13:56 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id n3so5649481wiv.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 04:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=EAPkpXWtqeHna91uCUW90knLm7rX8D3C7Sw+GrQkwhg=;
	b=L3e0+6/alg6UjgPK1HIMJU3Gfib+fh80qrE09dN5KA3v5LIxVdOKCORvQNU6PvRTrH
	ZZ0m0J/2kqsyBtkm+uEy0igo46TS7w0b7AJZQpi5+AJXu2jbaCE2eNASwGExWgyUPbWO
	TCLz67N1GTf+rX2SJHIYTsoZ1mihB5unH8sS15Yv3Ebr+QlwjyCdVE11agtkbKLmU5nN
	eudC7y7pbCFBnOUvBpr4a8BRHgTKOQil/UqGAPoRuUbIOQ9w5xhCQmc1ERxSOqVdkBZ3
	M4nPccwduGEU/NxqFhWkXOv9ZE37jj2jCMhkfyCEe2r4tCDC4chipSKv29jqMQyqEEVP
	7BgQ==
X-Received: by 10.180.187.6 with SMTP id fo6mr32325772wic.58.1407842037128;
	Tue, 12 Aug 2014 04:13:57 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	y10sm55078344wie.18.2014.08.12.04.13.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Aug 2014 04:13:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 12 Aug 2014 13:14:32 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140812111432.GC14848@jama>
References: <BLU436-SMTP782D203C1A9AF2454095C9D6ED0@phx.gbl>
MIME-Version: 1.0
In-Reply-To: <BLU436-SMTP782D203C1A9AF2454095C9D6ED0@phx.gbl>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] 'Update cyassl bb file'
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
X-List-Received-Date: Tue, 12 Aug 2014 11:13:57 -0000
X-Groupsio-MsgNum: 51613
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iL56M8+TQkEbRzRg"
Content-Disposition: inline

--iL56M8+TQkEbRzRg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2014 at 11:32:36AM -0600, lchristina26 wrote:
> Signed-off-by: lchristina26 <lchristina26@hotmail.com>
> ---
>  meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb | 5 -----
>  1 file changed, 5 deletions(-)
>=20
> diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb =
b/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
> index accc144..441d321 100644
> --- a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
> +++ b/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
> @@ -9,8 +9,6 @@ SECTION =3D "libs/network"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> =20
> -PR =3D "r1"
> -

NAK ^ you cannot break upgrade path (make version going backwards) just to =
remove 2 comments.

>  SRC_URI =3D "http://www.yassl.com/cyassl-${PV}.zip"
> =20
> =20
> @@ -21,6 +19,3 @@ S =3D "${WORKDIR}/${PN}-${PV}"
> =20
>  inherit autotools
> =20
> -# Detect and build with correct endianness
> -# CFLAGS +=3D "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '', '-DB=
IG_ENDIAN_ORDER', d)}"
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

--iL56M8+TQkEbRzRg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPp9xgACgkQN1Ujt2V2gBzZUACggK04KKlRy+RqrntMhpaPGVZo
v/cAn0o9fYh6Ko5fkH99nNtQPkh9g23D
=850S
-----END PGP SIGNATURE-----

--iL56M8+TQkEbRzRg--
