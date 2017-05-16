Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0A30A71A2D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 May 2017 07:55:49 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id d127so35757914wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 May 2017 00:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=wXmLHwe0duTMPevleV34hemZ+cCgtpd/gpODZZlvWv8=;
	b=mruIgBl6oV7p/V7ET23tERFbx8d73Ofi8gcbRaFWShNKXzCPeXYn6kz+Gac9CgDAG9
	3KZGqsbl7ny5/DVwuQ8fGC7WKpXSZbiFpua3efSOPufr4wtIY7h5P1VPqVEdF2rvN3p9
	Fr0pQleqrqRfJBVUNXkpzMSFlIm6kTNjI0jC9wUlYhGQoxCfotcOqGeZfdrBf7x0Xcek
	ojU/Vdyiwv4ytXSdiGC3ej2DdvTscRpHK1bVfbdc0/eJoRweBhXYMI5UxtbBpUX9XGA2
	tlQwXV3Zx7z9AUFlGV74tolG/Ff8NwoTLSKM306NiuL8/tIMdkvaCqKK31OKbRYY6V9T
	Em7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=wXmLHwe0duTMPevleV34hemZ+cCgtpd/gpODZZlvWv8=;
	b=CzIkMBg84WoDNRuw4QdmHC5zD4Zi9Q/N+JtBKKB5blo8J5SgArgBde2c14zF3/tqms
	b7B/JyJy8of5OvJ/qHMxyeFSXlss+xOpfFwU5YxMoIlJSSVGPJploiwWlPvqut7A5pZY
	iou68chDtAMTo/kFkxQbW9d7QAkzt3m94kV494G7wMoutL6J/8wgXfRaBKR/7FxErxlP
	4odGhqCH3gG2qwBcYXZPLgetrUUM9JGW/tm8cy/8Xp5H3FdDKqzc3dLbrapHCfM7QW8H
	whLJhZTKcyG6q+SKDE2IZ7h4six/tuQs3TJuQPWW9Y2mOORCXjzcXBaDIpvPccQoz6ZG
	z63w==
X-Gm-Message-State: AODbwcD6921rTqf2d1w4bQ0dusapzEje53LyTC0RA/zm/2/HofiaLK6R
	YbmQxpknEhY+nA==
X-Received: by 10.28.207.207 with SMTP id f198mr6860797wmg.85.1494921350468;
	Tue, 16 May 2017 00:55:50 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id n2sm1475815wmd.16.2017.05.16.00.55.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 16 May 2017 00:55:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 16 May 2017 09:56:39 +0200
To: Stefano Babic <sbabic@denx.de>
Message-ID: <20170516075639.GC3088@jama>
References: <1494605830-18765-1-git-send-email-sbabic@denx.de>
MIME-Version: 1.0
In-Reply-To: <1494605830-18765-1-git-send-email-sbabic@denx.de>
User-Agent: Mutt/1.8.2 (2017-04-18)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Fix broken package fbida
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
X-List-Received-Date: Tue, 16 May 2017 07:55:56 -0000
X-Groupsio-MsgNum: 66750
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PuGuTyElPB9bOcsM"
Content-Disposition: inline

--PuGuTyElPB9bOcsM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 12, 2017 at 06:17:10PM +0200, Stefano Babic wrote:
> Missing pkgconfig does not let build the package.

The summary should start with
fbida:
I've updated the summary when adding it to master-next

How does this relate to:
https://patchwork.openembedded.org/patch/138960/
?

Was Marek's change just a fix for the case when the pkgconfig wasn't
used because of missing inherit?

>=20
> Signed-off-by: Stefano Babic <sbabic@denx.de>
> ---
>=20
> Tested on current master, i.MX6 ARM target
>=20
>  meta-oe/recipes-graphics/fbida/fbida_2.10.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-graphics/fbida/fbida_2.10.bb b/meta-oe/recip=
es-graphics/fbida/fbida_2.10.bb
> index eb31f7b..1febac8 100644
> --- a/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
> +++ b/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
> @@ -18,6 +18,8 @@ SRC_URI[sha256sum] =3D "7a5a3aac61b40a6a2bbf716d270a46e=
2f8e8d5c97e314e927d41398a4d
> =20
>  B =3D "${WORKDIR}/build"
> =20
> +inherit pkgconfig
> +
>  EXTRA_OEMAKE =3D "STRIP=3D 'srcdir=3D${S}' -f ${S}/GNUmakefile"
> =20
>  PACKAGECONFIG ??=3D "gif png curl"
> @@ -66,5 +68,3 @@ do_install() {
>  }
> =20
>  RDEPENDS_${PN} =3D "ttf-dejavu-sans-mono bash"
> -
> -PNBLACKLIST[fbida] ?=3D "Fails to build with RSS http://errors.yoctoproj=
ect.org/Errors/Details/130677/ - the recipe will be removed on 2017-09-01 u=
nless the issue is fixed"
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PuGuTyElPB9bOcsM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWRqwtgAKCRA3VSO3ZXaA
HEECAJkBv+tQ3yY+wsaHRJutVieBXhnbiQCeIK5FNIDqHJyrUP2/nvNvdd+ji14=
=tqiI
-----END PGP SIGNATURE-----

--PuGuTyElPB9bOcsM--
