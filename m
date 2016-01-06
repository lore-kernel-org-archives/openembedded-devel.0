Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1CE4C73212
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jan 2016 11:59:37 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id f206so72088171wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jan 2016 03:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ldvhOOW5L7+71F4Dr+4gqB6+fk9gvZmxwyB9sIFN184=;
	b=ZZ4DHTHHzpTftLhEzwqKw3zepGmPfyzHq7J9yYcMPlQTeTaRKS84cMCI0i2rG7QFu6
	NqO3wPMHShuEPWSxb90rhjb20QaTObouSwh07dLgKPo8uQQF6s22dRhe8Z0FXlvqMS49
	Ex5uBfGr+hS0jsAE3LHqX1+5cQhGuIsN+x5e8Z8kgbUYgAiH2y0+E2prSOYMzZ/oIs0v
	qSECfxjSe5BF8n2R2P3Ekb/FbsBOQ/RkYVnBnB25FHB68MthaGGshd6ZE16vWttXz+HO
	x6qOZmcpFklhFmz+AnzH5d1R9WlAIo7+ujha+zPhBjL2zd9ezWI0rHxVrAFoq6eG0Vw8
	LUJw==
X-Received: by 10.28.130.7 with SMTP id e7mr9560834wmd.68.1452081578143;
	Wed, 06 Jan 2016 03:59:38 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	w73sm8332389wmw.21.2016.01.06.03.59.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jan 2016 03:59:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 6 Jan 2016 12:59:55 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160106115955.GA11478@jama>
References: <1451873503-5364-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1451873503-5364-1-git-send-email-lixin.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH] xterm: 308 -> 320
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
X-List-Received-Date: Wed, 06 Jan 2016 11:59:38 -0000
X-Groupsio-MsgNum: 59380
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
Content-Disposition: inline

--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 03, 2016 at 06:11:43PM -0800, Li Xin wrote:
> Upgrade xterm from 308 to 320.

Introduces new QA issue:
xterm-320: xterm rdepends on libxinerama, but it isn't a build dependency? =
[build-deps]

Mention what was changed in LIC_FILES_CHKSUM.

>=20
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  meta-oe/recipes-graphics/xorg-app/{xterm_308.bb =3D> xterm_320.bb} | 6 +=
++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-graphics/xorg-app/{xterm_308.bb =3D> xterm_320.bb=
} (77%)
>=20
> diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_308.bb b/meta-oe/rec=
ipes-graphics/xorg-app/xterm_320.bb
> similarity index 77%
> rename from meta-oe/recipes-graphics/xorg-app/xterm_308.bb
> rename to meta-oe/recipes-graphics/xorg-app/xterm_320.bb
> index 9198ca2..c8140d1 100644
> --- a/meta-oe/recipes-graphics/xorg-app/xterm_308.bb
> +++ b/meta-oe/recipes-graphics/xorg-app/xterm_320.bb
> @@ -2,12 +2,12 @@ require recipes-graphics/xorg-app/xorg-app-common.inc
>  SUMMARY =3D "xterm is the standard terminal emulator for the X Window Sy=
stem"
>  DEPENDS =3D "libxaw xproto xextproto libxext libxau libxpm ncurses"
> =20
> -LIC_FILES_CHKSUM =3D "file://xterm.h;beginline=3D3;endline=3D31;md5=3D54=
0cf18ccc16bc3c5fea40d2ab5d8d51"
> +LIC_FILES_CHKSUM =3D "file://xterm.h;beginline=3D3;endline=3D31;md5=3Dee=
6435019d00b884cde8d7ba2b318ff0"
> =20
>  SRC_URI =3D "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz"
> =20
> -SRC_URI[md5sum] =3D "1ec76c1a79a70de4f82c24c527ef4626"
> -SRC_URI[sha256sum] =3D "c5bf7377a5bf35e34b7e3a4ab6c848fbc89e8901dd98f8b2=
37662a72bdbfe372"
> +SRC_URI[md5sum] =3D "0d7f0e6390d132ae59876b3870e5783d"
> +SRC_URI[sha256sum] =3D "a60dbb574334c081425fa30f011cd9f571e3be7a91e2a84e=
252461798bce24a7"
> =20
>  EXTRA_OECONF =3D " --x-includes=3D${STAGING_INCDIR} \
>                   --x-libraries=3D${STAGING_LIBDIR} \
> --=20
> 1.9.1
>=20
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wac7ysb48OaltWcw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaNAboACgkQN1Ujt2V2gBzAEwCfSjdM+Wq+LtudCenqKV247xLF
qmgAoLHQrzhXckGfaRFT+1IJtGeD2al2
=mfFy
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--
