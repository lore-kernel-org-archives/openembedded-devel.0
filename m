Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id C139865D28
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 18:26:42 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e53so3046693eek.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 11:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DV2RyeELKWfpO5TifFbwdNQul/i2fhw7D9urzriGppg=;
	b=iBmia4V3f4VATHlU9Piw7JlXL4/JW5jsh9Qo+DTZptLOUqlnPvHh7SFAFGFzFgVbyR
	QRUv0MxbY6vSZyLf1ulPln5zBTaGrozywCAvBjcOVNR70th8I7+4D+Z+GWqgVQ62KQ+b
	LH5vEH+cuX7DjjLjHNvUV/LezRTTnlg0kNp/E1LoVb0iaBZLGpMNuuzI/fY+OP4eE3Ac
	NNFze/whYnfiRyvcfSFh/DYhK6oPO5mJ2Wa5ikBqunE9WHxKnk9PWnhHupnpccK6K04Q
	8eTJG+vFU/4E1Icy52QLPDmOgNHN+s/74X7YHjNGRx2PWdTMcSxDR8+0DeA1VI3d9rys
	uYJQ==
X-Received: by 10.15.50.136 with SMTP id l8mr4448831eew.73.1398450403547;
	Fri, 25 Apr 2014 11:26:43 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	x45sm26781528eef.15.2014.04.25.11.26.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Apr 2014 11:26:42 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 25 Apr 2014 20:26:52 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140425182652.GZ2486@jama>
References: <1398450265-27979-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1398450265-27979-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] htop: Update 1.0.2 -> 1.0.3
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
X-List-Received-Date: Fri, 25 Apr 2014 18:26:44 -0000
X-Groupsio-MsgNum: 49503
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uGRt5eEWyOm7cD/8"
Content-Disposition: inline

--uGRt5eEWyOm7cD/8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2014 at 11:24:25AM -0700, Khem Raj wrote:
> Update to latest and at the same time fix
> building when S !=3D B

Please compare with
"[oe] [meta-oe][PATCH 1/4] htop: upgrade to 1.0.3 and apply brokensep"

sent today by Jack.

>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-support/htop/{htop_1.0.2.bb =3D> htop_1.0.3.bb} |   13 +++++=
+++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>  rename meta-oe/recipes-support/htop/{htop_1.0.2.bb =3D> htop_1.0.3.bb} (=
54%)
>=20
> diff --git a/meta-oe/recipes-support/htop/htop_1.0.2.bb b/meta-oe/recipes=
-support/htop/htop_1.0.3.bb
> similarity index 54%
> rename from meta-oe/recipes-support/htop/htop_1.0.2.bb
> rename to meta-oe/recipes-support/htop/htop_1.0.3.bb
> index 234978b..4e445c8 100644
> --- a/meta-oe/recipes-support/htop/htop_1.0.2.bb
> +++ b/meta-oe/recipes-support/htop/htop_1.0.3.bb
> @@ -8,12 +8,15 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc312653532e8=
e669f30e5ec8bdc23be3"
>  DEPENDS =3D "ncurses"
>  RDEPENDS_${PN} =3D "ncurses-terminfo"
> =20
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/htop/htop-${PV}.tar.gz"
> +SRC_URI =3D "http://hisham.hm/htop/releases/${PV}/htop-${PV}.tar.gz"
> =20
> -LDFLAGS_append_libc-uclibc =3D " -lubacktrace"
> +SRC_URI[md5sum] =3D "e768b9b55c033d9c1dffda72db3a6ac7"
> +SRC_URI[sha256sum] =3D "055c57927f75847fdc222b5258b079a9542811a9dcf5421c=
615c7e17f55d1829"
> =20
> -inherit autotools
> +LDFLAGS_append_libc-uclibc =3D " -lubacktrace"
> =20
> -SRC_URI[md5sum] =3D "0d01cca8df3349c74569cefebbd9919e"
> -SRC_URI[sha256sum] =3D "ee60657b044ece0df096c053060df7abf3cce3a568ab34d2=
60049e6a37ccd8a1"
> +do_configure_prepend () {
> +	rm -rf ${S}/config.h
> +}
> =20
> +inherit autotools
> --=20
> 1.7.10.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--uGRt5eEWyOm7cD/8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNaqOwACgkQN1Ujt2V2gBxgZQCeJ/9nqSQnvS/DM8b88rATjej8
PlcAnip02QzTyAJw5ssSYwrsX1vFs9PP
=GUW4
-----END PGP SIGNATURE-----

--uGRt5eEWyOm7cD/8--
