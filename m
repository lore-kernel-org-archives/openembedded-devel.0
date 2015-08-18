Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id E870760043
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 09:40:57 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so89963691wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 02:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=V6DFYiWZGNplcQ/RoQF+8+hgeXGFteGbByu1WnzKLxE=;
	b=fkcFsBmBavuXOwwzXBbrZQUV0L4APNpZb90YeJXhkP7ULmOqWa/p0t7ksI0Ncj4j6B
	jRohoLT3EzFlrQ5cBk+/yFEOB7Xv5TfWDKCwNITAssh4bm8eGC3kXc4RoY3ZCPq7/zLA
	YkickSY7GYI55OoxkV1XjfKD7F4rpe74wOW7sxKZavvAfrKtwPyrEmP0E+6l/5p4ch1K
	p2YhGE9TlVUYj8VaNVS5OIjKg8BTtDj4HRci3PpubFYB+9Hk4C8jWSwf5gU7QBbzpNDR
	YV718C+hZn8PdkgolYj0H/9kOGBtYO7QuZK+cG/FpFLnDI90F9wq+GjYUq/ss3oka2ST
	DqHQ==
X-Received: by 10.194.57.19 with SMTP id e19mr12216383wjq.152.1439890857158;
	Tue, 18 Aug 2015 02:40:57 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	by17sm20539894wib.18.2015.08.18.02.40.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Aug 2015 02:40:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 18 Aug 2015 11:41:00 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150818094100.GH2458@jama>
References: <1438562844-16736-1-git-send-email-TicoTimo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1438562844-16736-1-git-send-email-TicoTimo@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][meta-multimedia][PATCH 1/2] libdvdread: update to 5.0.3
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
X-List-Received-Date: Tue, 18 Aug 2015 09:40:58 -0000
X-Groupsio-MsgNum: 56763
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="82evfD9Ogz2JrdWZ"
Content-Disposition: inline

--82evfD9Ogz2JrdWZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 02, 2015 at 05:47:23PM -0700, Tim Orling wrote:
> * libdvdread > 4.9 required for vlc 2.2.1
>=20
> Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> ---
>  .../vlc/{vlc_2.1.4.bb =3D> vlc_2.2.1.bb}                  |  0

This part belongs to next patch, I've moved it before merge to master.

>  .../recipes-multimedia/libdvdread/libdvdread_4.2.0.bb   | 17 -----------=
------
>  .../recipes-multimedia/libdvdread/libdvdread_5.0.3.bb   | 13 +++++++++++=
++
>  3 files changed, 13 insertions(+), 17 deletions(-)
>  rename meta-multimedia/recipes-multimedia/vlc/{vlc_2.1.4.bb =3D> vlc_2.2=
=2E1.bb} (100%)
>  delete mode 100644 meta-oe/recipes-multimedia/libdvdread/libdvdread_4.2.=
0.bb
>  create mode 100644 meta-oe/recipes-multimedia/libdvdread/libdvdread_5.0.=
3.bb
>=20
> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb b/meta-m=
ultimedia/recipes-multimedia/vlc/vlc_2.2.1.bb
> similarity index 100%
> rename from meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb
> rename to meta-multimedia/recipes-multimedia/vlc/vlc_2.2.1.bb
> diff --git a/meta-oe/recipes-multimedia/libdvdread/libdvdread_4.2.0.bb b/=
meta-oe/recipes-multimedia/libdvdread/libdvdread_4.2.0.bb
> deleted file mode 100644
> index 4895dd2..0000000
> --- a/meta-oe/recipes-multimedia/libdvdread/libdvdread_4.2.0.bb
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -SUMMARY =3D "DVD access multimeda library"
> -SECTION =3D "libs/multimedia"
> -LICENSE =3D "GPLv2+"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D64e753fa7d1ca31632bc383da3b57=
c27"
> -SRC_URI =3D "http://dvdnav.mplayerhq.hu/releases/libdvdread-${PV}.tar.bz=
2"
> -
> -SRC_URI[md5sum] =3D "ab7a19d3ab1a437ae754ef477d6231a4"
> -SRC_URI[sha256sum] =3D "0bea15da842a4b04a482b009d72dcc6d9c9524ccc1bf67e5=
748319ec5ada8097"
> -
> -inherit autotools lib_package binconfig pkgconfig
> -
> -CONFIGUREOPTS_remove =3D "--disable-silent-rules"
> -
> -do_configure_prepend() {
> -    # For some weird reason, libdvdread only provides a `configure2' scr=
ipt...
> -    cp ${S}/configure2 ${S}/configure
> -}
> diff --git a/meta-oe/recipes-multimedia/libdvdread/libdvdread_5.0.3.bb b/=
meta-oe/recipes-multimedia/libdvdread/libdvdread_5.0.3.bb
> new file mode 100644
> index 0000000..0506725
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/libdvdread/libdvdread_5.0.3.bb
> @@ -0,0 +1,13 @@
> +SUMMARY =3D "DVD access multimeda library"
> +SECTION =3D "libs/multimedia"
> +LICENSE =3D "GPLv2+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D64e753fa7d1ca31632bc383da3b57=
c27"
> +SRC_URI =3D "http://download.videolan.org/pub/videolan/libdvdread/${PV}/=
libdvdread-${PV}.tar.bz2"
> +
> +SRC_URI[md5sum] =3D "b7b7d2a782087ed2a913263087083715"
> +SRC_URI[sha256sum] =3D "321cdf2dbdc83c96572bc583cd27d8c660ddb540ff16672e=
cb28607d018ed82b"
> +
> +inherit autotools lib_package binconfig pkgconfig
> +
> +CONFIGUREOPTS_remove =3D "--disable-silent-rules"
> +
> --=20
> 2.1.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--82evfD9Ogz2JrdWZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXS/asACgkQN1Ujt2V2gBwZJACcDfhVWZsd7GcyvdT5CJWe0IbF
fPYAn1H+OtTr9CnjOQlJ2fWYvTovyzNj
=YFpM
-----END PGP SIGNATURE-----

--82evfD9Ogz2JrdWZ--
