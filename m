Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
	[209.85.222.182])
	by mail.openembedded.org (Postfix) with ESMTP id 57FCE746D3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Oct 2018 20:32:57 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id a189-v6so4356657qkb.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2018 13:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=U6/3NkWdj6UW0grGciz5/9Yd0f2GWjH7B8NiWF2e+6M=;
	b=LF4kjGr9sgHexHje+29YNiB/m5/wQT1z7TD7xQNFSXorb5iu6yUEeFhpkWFDiIktb/
	q/Ff71s6ej+259oik97hVi35G+B5DjNB1cpe9rm69Q/4wLoKxcoOYU/5prWefoy/FsUu
	KKMJyXLqCbxurVJYdBSzOjmp4vXJEaHTcBBxtLDBoudWfrAYfQhoHSQKzqF7hqnvoG6k
	V7Dt89bvx1+zRYZZrJCTgaKgCVLPdwpTUFeEMXQGHg7ZArn88cNx/aSKlZQ2K25g/D0d
	I3Rm+AKTe5nH8RduKtNHTtABB2Hk0sYSvOhUXZGVprG/8JdOGe/jtoqNjjCmLFiSVqIY
	zpaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=U6/3NkWdj6UW0grGciz5/9Yd0f2GWjH7B8NiWF2e+6M=;
	b=nG6qGRfAz86D30rRlTWXaEWEeEy7jb7R5zmuYgr9m/8MD1LyuD5J8+VPwg9inwA8QA
	Ni+psik5rRS7FRxF6F3iFPh+9y1a0yCBaKxdJShf72zzMGPAdQRL8LDU1QQqYUoY6jX2
	M3Z6WJOES35pp7hy+oG6tI4YZMcO1faSDDqHOXBp+F5n+nMrI77/ZrWmpe0qmxevB0L/
	VBWpwKQpg6dALhy/xVJ00e3iTtDh48LGRQ6+upQ8SkFyA66uDC9gGW3g82FBZp6yPRCl
	EuM1hd1l4RQ8UHaxwJxH6x6xgTD8qlqVkfPaxN17ROa760WDzp+orByX18shvq3KDmjv
	C4cA==
X-Gm-Message-State: ABuFfojEhRBUPjT8oOckuRgGt8bxnHxHkcgcB57y6dRnmyPPNtfloZN1
	fVcf+F5rO18nNslIU17ANP787BoTD2BFQSLg+p8=
X-Google-Smtp-Source: ACcGV62m/9IkXuRQVQoPUG+Ozj2oKNcdFCfZziAMnVNEzcJjAhFpzJWj9bsKn6VdqgBHvBdHi/F99g6mrfm/YMZMAzQ=
X-Received: by 2002:a37:2915:: with SMTP id
	p21-v6mr2650102qkh.206.1538598777882; 
	Wed, 03 Oct 2018 13:32:57 -0700 (PDT)
MIME-Version: 1.0
References: <20181003192455.24921-1-schnitzeltony@gmail.com>
In-Reply-To: <20181003192455.24921-1-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Oct 2018 13:32:30 -0700
Message-ID: <CAMKF1sotCFH3POn6S11GOdkuH2A886iKN=PGdPA_81c59TzwhA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/8] libsdl-gfx: initial add 2.0.25
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
X-List-Received-Date: Wed, 03 Oct 2018 20:32:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 3, 2018 at 12:25 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> Recipes like this live in in meta-games and meta-game-emulators. Once app=
lied
> here, pull requests will go out.
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.25.bb | 20 ++++++++++++++=
++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.25.bb
>
> diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.25.bb b/meta-=
oe/recipes-graphics/libsdl/libsdl-gfx_2.0.25.bb
> new file mode 100644
> index 000000000..c9910cb1b
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.25.bb
> @@ -0,0 +1,20 @@
> +SUMMARY =3D "SDL graphics drawing primitives and other support functions=
"
> +SECTION =3D "libs"
> +LICENSE =3D "Zlib"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5d1de21f0b70830e299905eac3419=
084"
> +
> +DEPENDS =3D "virtual/libsdl"
> +
> +SRC_URI =3D "http://www.ferzkopp.net/Software/SDL_gfx-2.0/SDL_gfx-${PV}.=
tar.gz"
> +SRC_URI[md5sum] =3D "ea24ed4b82ff1304809c363494fa8e16"
> +SRC_URI[sha256sum] =3D "556eedc06b6cf29eb495b6d27f2dcc51bf909ad82389ba2f=
a7bdc4dec89059c0"
> +
> +S =3D "${WORKDIR}/SDL_gfx-${PV}"
> +
> +inherit autotools pkgconfig
> +
> +EXTRA_OECONF +=3D " \
> +    SDL_CONFIG=3D${STAGING_BINDIR_CROSS}/pkg-config sdl \

is the intention to have SDL_CONFIG point to pkg-config here

> +    --disable-mmx \
> +"
> +
> --
> 2.14.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

