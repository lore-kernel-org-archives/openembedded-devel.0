Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id AF83365D81
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 11:29:41 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id t10so2885740eei.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 04:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7+Ztcn47Hx0/pwsbVM/Hm4KPleh13MU36WqhbPTwlRc=;
	b=xMEaxjJ/UllYRg7nOW05Sf4PxwbBwZ6cRVKfNQJD9O5SgnAORdb02cb59k5Av8zlMj
	JcVjRcqrxHWgegUBmhbJLye8HKbAXyz6lkjOCp9PbI9ODXN/g2VY16HtUm+GWy5uvcYo
	sYtNb5L9lhTrzrEQ4q3nQPQ3TKSS0Tq43rCh4rl5LRhX4VTV+wqKvDsutM1sCUBk2kdT
	0MjfJMdA2GcNRM1Sh4VdOciZTPYDKkLQ2rzlfrJCWS4jRH0KfhF5TFD/WabLA1vNlVe3
	PW+4SX2iX98luM+fsiYprJS4p28ZPo6cBNERVAfXhh3RH1uO8etcG0JDqF5G/PdO1bL9
	EbfA==
X-Received: by 10.14.215.9 with SMTP id d9mr2896345eep.64.1397993381732;
	Sun, 20 Apr 2014 04:29:41 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m8sm93829079eeg.11.2014.04.20.04.29.40 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 04:29:40 -0700 (PDT)
Date: Sun, 20 Apr 2014 13:29:45 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420112945.GU2486@jama>
References: <1397725187-28708-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1397725187-28708-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH] gimp, gegl, babl: change SRC_URI to http
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
X-List-Received-Date: Sun, 20 Apr 2014 11:29:43 -0000
X-Groupsio-MsgNum: 49328
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+vl+q9EKybVy/Rgp"
Content-Disposition: inline

--+vl+q9EKybVy/Rgp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2014 at 10:59:47AM +0200, Koen Kooi wrote:
> The FTP server on ftp.gimp.org hasn't been working for a few weeks now,
> so switch to http which does work.

Merged, thanks!

>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta-oe/recipes-graphics/babl/babl_0.1.10.bb | 2 +-
>  meta-oe/recipes-graphics/gegl/gegl_0.2.0.bb  | 2 +-
>  meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-oe/recipes-graphics/babl/babl_0.1.10.bb b/meta-oe/recip=
es-graphics/babl/babl_0.1.10.bb
> index 1ef4956..dbff746 100644
> --- a/meta-oe/recipes-graphics/babl/babl_0.1.10.bb
> +++ b/meta-oe/recipes-graphics/babl/babl_0.1.10.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6a6a8e020838b2=
3406c81b19c1d46df6"
> =20
>  inherit gnome
> =20
> -SRC_URI =3D "ftp://ftp.gimp.org/pub/${PN}/0.1/${PN}-${PV}.tar.bz2"
> +SRC_URI =3D "http://ftp.gimp.org/pub/${PN}/0.1/${PN}-${PV}.tar.bz2"
>  SRC_URI[md5sum] =3D "9e1542ab5c0b12ea3af076a9a2f02d79"
>  SRC_URI[sha256sum] =3D "943fc36ceac7dd25bc928256bc7b535a42989c6b97157814=
6869eee5fe5955f4"
> =20
> diff --git a/meta-oe/recipes-graphics/gegl/gegl_0.2.0.bb b/meta-oe/recipe=
s-graphics/gegl/gegl_0.2.0.bb
> index 9d8d190..bd40946 100644
> --- a/meta-oe/recipes-graphics/gegl/gegl_0.2.0.bb
> +++ b/meta-oe/recipes-graphics/gegl/gegl_0.2.0.bb
> @@ -11,7 +11,7 @@ PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[jasper] =3D "--with-jasper,--without-jasper,jasper"
>  PACKAGECONFIG[avformat] =3D "--with-libavformat,--without-libavformat,li=
bav"
> =20
> -SRC_URI =3D "ftp://ftp.gimp.org/pub/${PN}/0.2/${PN}-${PV}.tar.bz2"
> +SRC_URI =3D "http://ftp.gimp.org/pub/${PN}/0.2/${PN}-${PV}.tar.bz2"
>  SRC_URI[md5sum] =3D "32b00002f1f1e316115c4ed922e1dec8"
>  SRC_URI[sha256sum] =3D "df2e6a0d9499afcbc4f9029c18d9d1e0dd5e8710a75e17c9=
b1d9a6480dd8d426"
> =20
> diff --git a/meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb b/meta-oe/recip=
es-graphics/gimp/gimp_2.8.10.bb
> index b70148e..68a669c 100644
> --- a/meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb
> +++ b/meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb
> @@ -8,7 +8,7 @@ DEPENDS =3D "babl gdk-pixbuf-native libart-lgpl gtk+ jpeg=
 libpng libexif tiff webk
> =20
>  inherit gnome
> =20
> -SRC_URI =3D "ftp://ftp.gimp.org/pub/gimp/v2.8/gimp-${PV}.tar.bz2 \
> +SRC_URI =3D "http://ftp.gimp.org/pub/gimp/v2.8/gimp-${PV}.tar.bz2 \
>             file://freetype.patch \
>            "
>  SRC_URI[md5sum] =3D "84c964aab7044489af69f7319bb59b47"
> --=20
> 1.9.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+vl+q9EKybVy/Rgp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTr6kACgkQN1Ujt2V2gBy34gCeLawvFShnvOmTRa83ENwEG9m4
Zj0AoINfMKH73H1fBxmIZlkkIHVz+wH2
=GsdP
-----END PGP SIGNATURE-----

--+vl+q9EKybVy/Rgp--
