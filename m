Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id ECAAC78B9B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Sep 2018 18:15:17 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id 63-v6so2298759wra.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Sep 2018 11:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=aF/2E65m6HHd7Nqx9tThRIshKCZ3VXfXhtuYIluX9Uw=;
	b=o2anIhW+gaBNX+lJXfcJ6jfz2wOiRpRCo23FuEbcsC5e76L/Wee1dSmMGNTLXujhiL
	l/dGmrMP91vV9AeO0Yoc3ZR5rq6ibDOMfnEiohUqPo8F8TzYT5pWBmwNvaOPjPZwGilQ
	fu0h3ccbnCuSIJwVSBlURyhmdty/M23rvgKy9SaAcpLUeFtTaQLc3c4v6ECY9uTbELTi
	1innmOhUHxhgL1gffNAhbR+rsEiqpjIY22R+dLk9GVnvKXIUDYhOqabEv8/iZsz/UFv0
	VtlfJ7ELLB7xX61mVwbU0cv/WwTfDIzbDSLk9R0xHC/fyyUPbl+y54F0NT0MY5TMbCD7
	WFxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=aF/2E65m6HHd7Nqx9tThRIshKCZ3VXfXhtuYIluX9Uw=;
	b=XPbrEAD0DVkdzxfmYmOK0wS5jdU3Q0X5fUeScfCrhg6CzhFEAFUygH9YLQsgdkffZx
	GOO0qDt/ZBrpK6CLCrFfUv6EYN3w3aJAC20aU8+/v6OUPzfZvi0PrQVaxyOdW6FzHu2n
	lNu1aEbXus+z+HvlgYszbvj++h0mynY8iaCOEh/YuDosT3ILE8d943V9L2bpeGocoTDK
	xpbWoa14eQcfGeW+TxSjuFa7iJZF6xFYY5zCEXW6clEInD5721b1ujbCkPEvVDZNqEbI
	vXPnyoNc871sni5YarQztaRlqONe3iGgxcGuNKospCke07s+YF94evv8loclKKUneL5y
	4hog==
X-Gm-Message-State: ABuFfojxM5YXAneBp4LSoJ0O5D+Jp3U23QyLuICOg1LhPnqiHoeN/qXp
	2O1ejsoTx6hSnTIXGQ9mp/c=
X-Google-Smtp-Source: ACcGV62yNL9MRugV927fnSSOjgrDpLj+RF5jZZLg/t8fjx1cm+cJTGXyfjKc+AKzQd2o0Ml0GLulbA==
X-Received: by 2002:adf:a481:: with SMTP id
	g1-v6mr2683568wrb.167.1538244918440; 
	Sat, 29 Sep 2018 11:15:18 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	y128-v6sm3982907wmy.26.2018.09.29.11.15.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 29 Sep 2018 11:15:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 29 Sep 2018 20:15:18 +0200
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20180929181518.GB1449@jama>
References: <20180929181029.22080-1-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20180929181029.22080-1-akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-multimedia][PATCH] mpd: fix yocto-check-layer issue with mulitmedia
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
X-List-Received-Date: Sat, 29 Sep 2018 18:15:18 -0000
X-Groupsio-MsgNum: 74784
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IrhDeMKUP4DT/M7F"
Content-Disposition: inline

--IrhDeMKUP4DT/M7F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 29, 2018 at 11:10:29AM -0700, Armin Kuster wrote:
> ERROR: Nothing PROVIDES 'faad2' (but /home/akuster/oss/maint/meta-openemb=
edded/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb DEPENDS on =
or otherwise requires it)
>=20
> enable acc only if LICENSE_FLAGS is commercial

aac

> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb b/=
meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
> index c0d4c8c2b..aee9e0769 100644
> --- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
> +++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
> @@ -27,7 +27,8 @@ SRC_URI[sha256sum] =3D "8322764dc265c20f05c8c8fdfdd578b=
0722e74626bef56fcd8eebfb01a
>  EXTRA_OECONF =3D "enable_bzip2=3Dyes"
>  EXTRA_OECONF +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-=
-with-systemdsystemunitdir=3D${systemd_unitdir}/system/', '--without-system=
dsystemunitdir', d)}"
> =20
> -PACKAGECONFIG ??=3D "aac alsa ao bzip2 ffmpeg flac fluidsynth iso9660 ja=
ck libsamplerate mms mpg123 modplug sndfile upnp openal opus vorbis wavpack=
 zlib"
> +PACKAGECONFIG ??=3D "alsa ao bzip2 ffmpeg flac fluidsynth iso9660 jack l=
ibsamplerate mms mpg123 modplug sndfile upnp openal opus vorbis wavpack zli=
b"
> +PACKAGECONFIG +=3D "${@bb.utils.contains('LICENSE_FLAGS', 'commercial', =
'aac', '', d)}"
> =20
>  PACKAGECONFIG[aac] =3D "--enable-aac,--disable-aac,faad2"
>  PACKAGECONFIG[alsa] =3D "--enable-alsa,--disable-alsa,alsa-lib"
> --=20
> 2.17.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IrhDeMKUP4DT/M7F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW6/BNgAKCRA3VSO3ZXaA
HJ7fAJ9RUyzSh+l0TE6EotGPx7e5c8uotgCfdIIVTHIVd3aQnpSVVlX8Hjxe4w0=
=uYwW
-----END PGP SIGNATURE-----

--IrhDeMKUP4DT/M7F--
