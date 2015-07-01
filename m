Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4764C6E5F5
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jul 2015 13:14:37 +0000 (UTC)
Received: by widjy10 with SMTP id jy10so57421150wid.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jul 2015 06:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=h3/S7+kc3Wb3qiNZT+VXWWADL6F6vx9SPEuupmRYggQ=;
	b=J73FwMGsoleL1OzBQZ3bo+wOz+9Fxsl8JzkU7ac1fRfiH9/Ti/FIB3VEodLGezI3IG
	hx/QCuE5zTY3Kvt9EH6al4hHymG9sJ6GIBbz+FOGFHTi9qul8wQCLfkcEsBqsIGMR9RA
	ev2ZQ6UpfLjs9wXaT0wRDceUMAq5oH+lN3Slglg7VrON/HgICuKrZts+SUBtqCxChyHT
	sHSapDSK++cvH7rkWJwbAzTSenXSOhHlL/KMagGTqFbXpxzSvQZDJlUWnCPvzczky2Zs
	TO+bWroGa9sjQEZVYnuu14hlxbjrlEsp0Yk/ot93VmPxEx25rzFxPDbPUAoukA3pAckm
	ClZw==
X-Received: by 10.180.91.107 with SMTP id cd11mr5943996wib.51.1435756477439;
	Wed, 01 Jul 2015 06:14:37 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id a6sm2882207wjy.33.2015.07.01.06.14.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Jul 2015 06:14:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 1 Jul 2015 15:14:59 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150701131459.GE2409@jama>
References: <1435732411-23079-1-git-send-email-net147@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1435732411-23079-1-git-send-email-net147@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] qrencode: new recipe
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
X-List-Received-Date: Wed, 01 Jul 2015 13:14:40 -0000
X-Groupsio-MsgNum: 56108
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/i8j2F0k9BYX4qLc"
Content-Disposition: inline

--/i8j2F0k9BYX4qLc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01, 2015 at 04:33:31PM +1000, Jonathan Liu wrote:
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  meta-oe/recipes-graphics/qrencode/qrencode_git.bb | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/qrencode/qrencode_git.bb
>=20
> diff --git a/meta-oe/recipes-graphics/qrencode/qrencode_git.bb b/meta-oe/=
recipes-graphics/qrencode/qrencode_git.bb
> new file mode 100644
> index 0000000..fc7b020
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/qrencode/qrencode_git.bb
> @@ -0,0 +1,16 @@
> +SUMMARY =3D "C library for encoding data in a QR Code symbol"
> +AUTHOR =3D "Kentaro Fukuchi"
> +HOMEPAGE =3D "http://fukuchi.org/works/qrencode/"
> +SECTION =3D "libs"
> +LICENSE =3D "LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b=
0a1"
> +PV =3D "3.4.4+git${SRCPV}"

lets discuss +git/+gitr in previous patch

> +
> +SRCREV =3D "1b565c7b599029818fc596e7da4371a3083da36c"
> +SRC_URI =3D "git://github.com/fukuchi/libqrencode.git;protocol=3Dgit"

protocol=3Dgit is default, you can drop it
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> +
> +EXTRA_OECONF +=3D "--without-tools --without-tests"
> --=20
> 2.4.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/i8j2F0k9BYX4qLc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWT59IACgkQN1Ujt2V2gBwIwgCfQ9b6bj5ilN+Jap3oBct3C+OI
zIgAoJlv9kwsT7rY3XzbnikqJWseD4YB
=ywu6
-----END PGP SIGNATURE-----

--/i8j2F0k9BYX4qLc--
