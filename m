Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id D0CA671E10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2017 09:42:26 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id s27so5403797wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2017 01:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xQ6mgrD+w64gdDOlVte7N3EQSwtnqE/6s1Byobv9Aow=;
	b=euMOL6oHXRHFfkKlVWzqBZkgVpUDGM1VNkfX5EV8AsKRhry6ppoZJ7MDZGgSyXtMX3
	tgMRr6shEoxEAX5VltRbR97ygBh65EALXIUSCUb7R+CftkQDx6ZiRdBKSNnE+JZaRQzM
	nrLY4N5/X72x/+0O20B7Xc5KZhRsBz4grKPBzT5MpX/BmxXeY1JVEt5HRcky64ySKWpk
	4GEQxjdKTbHAyoljDp9JOQXisglg2CtDjd2FwfQ88/GxZ4c4rahoV7joQ5/TXjGr1q/t
	oD7FaW/Ve62qxO5vwWM1h42+B+sqLQ2n06IrBj0JYd2R+UrXGyBK7Ei0AZP9+12DCXz0
	+uDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xQ6mgrD+w64gdDOlVte7N3EQSwtnqE/6s1Byobv9Aow=;
	b=VBSatnhIys7VCNIEAfxJz2TgYPuWoOQK4x0IsNnB146yFrTL6FoKgJ1wOHS5O4NU5b
	UgQv10Ga08Y2hpLHsmBeDD58o8+4RAcxnJwaPpnlkuF53zle+guYnO7gkzIQ82sOfOgP
	/OdOlFGNOReaYyFNpQBHSyY9C9s+8/R2RonKAAmwDacTRIwAMKAd0Z7DXcdSFQ85432D
	z0xHVkbkvvY7ZcV7JDbNhD6+OsPizNgu86y0jOkvQaufY01RSL7hh1ptqTXWJTni16ua
	mQqg8lltf4zzAmsq8tACHKk/WEw0EDSKySokI/HiqqgpH+jWs3idQFtlWqyG2TjA+zsp
	N6Ng==
X-Gm-Message-State: AMke39mDKtgHaGKs+8bS9fhuB1UFAbY81JB9krst2h0TV7a29QdZmHCvQsYVpWJt3tbSVaUqdz+Ku7iml5B1UA==
X-Received: by 10.223.136.79 with SMTP id e15mr7409820wre.14.1487670146712;
	Tue, 21 Feb 2017 01:42:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.212.30 with HTTP; Tue, 21 Feb 2017 01:42:26 -0800 (PST)
In-Reply-To: <20170220230719.10066-1-schnitzeltony@googlemail.com>
References: <20170220230719.10066-1-schnitzeltony@googlemail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 21 Feb 2017 10:42:26 +0100
Message-ID: <CA+chaQdtBBjM--afi_5sGTYHx6iDx_3XPv5toAkDVH6Cvm5O8g@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/6] geany: add intltool-native to DEPENDS and unblacklist
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
X-List-Received-Date: Tue, 21 Feb 2017 09:42:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

It needs gettext inherit as well.

On Tue, Feb 21, 2017 at 12:07 AM, Andreas M=C3=BCller <
schnitzeltony@googlemail.com> wrote:

> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  meta-oe/recipes-devtools/geany/geany_1.29.bb | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/geany/geany_1.29.bb
> b/meta-oe/recipes-devtools/geany/geany_1.29.bb
> index a2c6787..745c3ac 100644
> --- a/meta-oe/recipes-devtools/geany/geany_1.29.bb
> +++ b/meta-oe/recipes-devtools/geany/geany_1.29.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://www.geany.org/"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbd7b2c994af21d318bd2cd3b3f80c=
2d5"
>
> -DEPENDS =3D "gtk+ libxml-parser-perl-native python3-docutils-native"
> +DEPENDS =3D "gtk+ libxml-parser-perl-native python3-docutils-native
> intltool-native"
>
>  inherit autotools pkgconfig perlnative pythonnative
>
> @@ -14,5 +14,3 @@ SRC_URI[sha256sum] =3D "394307596bc908419617e4c33e93ea
> e8b5b733dfc8d01161677b8cbd3a
>  FILES_${PN} +=3D "${datadir}/icons"
>
>  EXTRA_OECONF =3D "--disable-html-docs"
> -
> -PNBLACKLIST[geany] ?=3D "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/132822/"
> --
> 2.9.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

