Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id EAA3C71CAF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Apr 2017 12:10:58 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id d79so24532849wmi.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Apr 2017 05:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=lePwKqVS/FpTxhyqPKexm114lXIJ0KvtCMRYeLTBEFI=;
	b=X+qzWbQpeHf9hTDaXEZvFj1xYsuyD3VlEedR5EdPLm/S3D5RqSk1cy3prK1wfcrbnp
	IgzRZGKDSXnk/ZQVoxG6iJYJfzMl9YlE5UKViRJjn5m4MZMggns6UiiPfkgzZe83ehcA
	4+Fan/1h/7Taw2LZW5p06GNc/gE4jqgFgpdT4O5VbAH941Uw77QbrnhzzhirfrUQ7HZE
	WRamHLHAxOAJcFfXZvY1COoR+5Q3Ytm70y7HCcfPNFz+6zuhvVMC/UQQKeDaAFIFJZ7D
	gVgte6ZMClhIorhksAVAloZYdKgQbtrrFNPu6qGl5a2sXFtTD+XtR/sbwPHN77qOliBB
	g10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=lePwKqVS/FpTxhyqPKexm114lXIJ0KvtCMRYeLTBEFI=;
	b=I4vnzhHEMBSYKHBDvduCDmCWlA5+XtYgj56U9usX2FHhMgj25zqqiNuAMEHQJpFkNg
	3fSJ2YD4zCzpywTStHOmH2+jOOIjB12/p6KgzdHwK52nCm+5fGel2OSgQNEPCH8EsgAY
	TtvFOz7k1cQrd+p1bMxjfjVUaHXP+F+gCotFG7f8WsfU31mz2e3V0XLCXFPx6Jh/CiN5
	X4k3D8/t+D86VV9Dyz6lf+4hcpvx5IXnBVVOSVKhX6oN3CoCb1zbnP5CI36JRhXhZoRv
	ipl4+/7GylrNh7id2+FWa8nvN3i3fx4TVtONV2xwHkyKYlEhLK2NB+/yaFwsXD2laQkU
	6kvA==
X-Gm-Message-State: AN3rC/6ywrjys/6AywGjpfr7c+mUnsiXnIYEAaJMVTgoXbjpbM6eu8Wu
	PAW6DNTqTI3Edw==
X-Received: by 10.28.230.84 with SMTP id d81mr1748953wmh.58.1493122259422;
	Tue, 25 Apr 2017 05:10:59 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	w96sm14354195wrc.14.2017.04.25.05.10.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 25 Apr 2017 05:10:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 25 Apr 2017 14:11:14 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170425121114.GA28641@jama>
References: <20170424052058.4952-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170424052058.4952-1-raj.khem@gmail.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-multimedia][PATCH 01/17] musicbrainz: Upgrade to 5.1.0
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
X-List-Received-Date: Tue, 25 Apr 2017 12:10:59 -0000
X-Groupsio-MsgNum: 66515
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline

--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 23, 2017 at 10:20:42PM -0700, Khem Raj wrote:
> Drop uclibc specific flags

http://errors.yoctoproject.org/Errors/Details/141292/

>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-multimedia/musicbrainz/libmusicbrainz_git.bb           | 7 +=
+-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrain=
z_git.bb b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_gi=
t.bb
> index a6a4f6a8a..250c5f14e 100644
> --- a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
> +++ b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
> @@ -5,17 +5,14 @@ LICENSE =3D "LGPLv2.1+"
>  LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3Dfbc093901857fcd118f065f90=
0982c24"
>  DEPENDS =3D "expat neon neon-native"
> =20
> -PV =3D "5.0.1+git${SRCPV}"
> -PR =3D "r1"
> +PV =3D "5.1.0+git${SRCPV}"
> =20
> -SRCREV =3D "0749dd0a35b4a54316da064475863a4ac6e28e7e"
> +SRCREV =3D "44c05779dd996035758f5ec426766aeedce29cc3"
>  SRC_URI =3D "git://github.com/metabrainz/libmusicbrainz.git \
>             file://allow-libdir-override.patch "
> =20
>  S =3D "${WORKDIR}/git"
> =20
> -LDFLAGS_prepend_libc-uclibc =3D " -lpthread "
> -
>  inherit cmake pkgconfig
> =20
>  do_configure_prepend() {
> --=20
> 2.12.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWP884QAKCRA3VSO3ZXaA
HJ4FAKCLtcEFTRqJLWhb/yxr0pMLiqw+KwCfd8vHn9jxF8S/y2K+VTr+5hCMaEU=
=3LKd
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--
