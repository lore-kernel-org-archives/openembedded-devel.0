Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.6515.1587044289234200019
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2020 06:38:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=g7K3o0X5;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id b11so4861921wrs.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2020 06:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2SMxd8WFqm0f2fl+sHxTaYdSqxOO5PfwgxEf2j/Urg8=;
        b=g7K3o0X5v1h5BFss1Icqhw9F7jBpTkxJYGszEv0iZ+G3LCIXx/dhE9ChP/ABTmK4hf
         f2ShVRmxm8sEO+ZCs8GvSO6fm9yijTANGClNzPeu6uFiVMqlMYh56MbGzJcxe7yeCsKb
         doQFIIWoGoKDhwr0eVxs4kU/8hF1HklJTzutpECaqo/UCym8r1ntdz/hQJeCyTuqQK6/
         6L7ADhBsK1QUrmMU5elucyPDUzOPuQg6pzTk8+HZqI9dd96brzkv0nUQgVj+XoyH5w6v
         L/iVrx04RKdBXnBg4KrhDFsUK1BfZ9c4pT0Va78WE6JObwMcl/OIWgA7iUH2NJCYD02Y
         ey+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2SMxd8WFqm0f2fl+sHxTaYdSqxOO5PfwgxEf2j/Urg8=;
        b=JhsjE+wNda8HctVWZxcCFOu0Xs5Lk64WByyBKwNDMsGKWVMsyfHIcTq1kDHhd4AdQI
         ApCtkOvtEO07prbXSdW4cOG+DJu55qLZuEGE8OukjgCHtqoTq/mYVvjxj6T3DVSkbW0u
         6zQtcmUkmHMDk3zstmRbUEUbKm0LD42BdqUL26FYMl2z+s8qQtt5FhdlJXdgghZuaaaq
         EX9rzz9R4FAQ2S2E47DN/poE1HnVv/A5toTnD1R8/vKRNmTNXYqSLegQ3Yswa6OUd7v4
         bDwM8oOk1hxOFHRThuLP0kbWcud7wWSQThwNwT+03DFVuawGOAJsUR7FYxaX7NHTNLMy
         +k7w==
X-Gm-Message-State: AGi0PuamQgdYQU4RTodQr9vBYPKmBPz5Y4nAUjK+1maasamxWsD+KSnv
	wD3RAkdlz6Hye8+zMVe5EGo=
X-Google-Smtp-Source: APiQypIG8FVssx7OKxxfXFRcCVOio1+XWEe3rVtVlkn+cSFVYfrRA9JJ4tHLjagfQjpkP6e9Sc/72A==
X-Received: by 2002:adf:97cc:: with SMTP id t12mr33265323wrb.261.1587044287712;
        Thu, 16 Apr 2020 06:38:07 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id j135sm3613510wmj.46.2020.04.16.06.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 06:38:06 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 16 Apr 2020 15:38:06 +0200
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-multimedia][PATCH 3/3] vlc: Add check to require X11
Message-ID: <20200416133806.fo4gq6kmdjzkifeo@jama>
References: <20200413214513.1793854-1-raj.khem@gmail.com>
 <20200413214513.1793854-3-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200413214513.1793854-3-raj.khem@gmail.com>
X-Groupsio-MsgNum: 83957
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iolixx4a2nrlmrxg"
Content-Disposition: inline

--iolixx4a2nrlmrxg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2020 at 02:45:13PM -0700, Khem Raj wrote:
> It needs X11 as of now to build. there is a possiblily to build it
> without X11, but lets keep this check until that path is fixed
>=20
> Also fixes
>=20
> TOPDIR/build/tmp/work/aarch64-yoe-linux/vlc/3.0.9.2-r0/recipe-sysroot-na=
tive/usr/bin/aarch64-yoe-linux/aarch64-yoe-linux-ld: cannot find -lGL
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb b/met=
a-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb
> index 9e41512c3e..556e79c7e6 100644
> --- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb
> +++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb
> @@ -25,7 +25,9 @@ SRC_URI =3D "http://download.videolan.org/pub/videolan=
/${BPN}/${PV}/${BP}.tar.xz \
>  "
>  SRC_URI[sha256sum] =3D "a9bdad293d81cd48516abad8d490d8ab4012964ae541ff1=
9e00021e071e47601"
>  
> -inherit autotools gettext pkgconfig features_check mime-xdg
> +inherit autotools features_check gettext pkgconfig features_check mime-=
xdg

No big deal, but there already was features_check few words later (left
over from REQUIRED_DISTRO_FEATURES removal in
0f2b3139521570ad494a72399f8a9dae76e69b16 which made x11 optional)

> +
> +REQUIRED_DISTRO_FEATURES =3D "x11"
>  
>  ARM_INSTRUCTION_SET =3D "arm"
>  export BUILDCC =3D "${BUILD_CC}"
> --=20
> 2.26.0
>=20

>=20


--iolixx4a2nrlmrxg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXphfvQAKCRA3VSO3ZXaA
HB2TAJ9pWqD/WSYWFQj3S8tWOJyDmc/NnwCdH5pisr8JVJomXhVbLh6peQm7Pdg=
=bxx/
-----END PGP SIGNATURE-----

--iolixx4a2nrlmrxg--
