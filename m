Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web08.8814.1618916187670730618
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Apr 2021 03:56:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ulU9FrtK;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id l4so57562775ejc.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Apr 2021 03:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HBtQob9YOZIuUzwPevlco+pTa3oQDFvRrX0bvh4zWQ0=;
        b=ulU9FrtKoApXQGLCWuOOPRfLIu4P2UkyCZQ2zA1dAiUZxviO7ym66EQ8gCp/iUNxOa
         OVSYkV4uD1bJJrU80e7NlKKUZM0Wkqn/kmfQjhi7LaMQE05e+j5BF5imJMtNK216iMr8
         A/DBz/jhl/YpZ1cITHId56VtAQjWboX64UdapV0/EWZ8h0ne16br6BLlhXB+BiOLu6qA
         5nuiQqgf6O4GAUJ8eXIZBV4XBVwE5OH680s4HO8ordGJivimS87vPCKb1QVyTNTIy7oT
         YldSDgCU47x0YSPNXgTiM57Ng6WYyv6zcKNlEWq/kWQe/v4JO+J73pnBYA7RKRIPOtZ5
         ubQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HBtQob9YOZIuUzwPevlco+pTa3oQDFvRrX0bvh4zWQ0=;
        b=ryUtTMKZ/wmjPShoIN2CH6ZDbMXdvfbk9/X6JTHcCCFjjk5EUdrQwih6+tHo7M43xQ
         Y6GX7VaX0Xvrn0jXLoA0NGOUhponq4vJK1QJfre2wKVSO21be2RQWNnwkyOGKgUaslZR
         ZWdBQafKnVs5ZGbPcP1VnSrPTsxDdh0OCGhtwyYX2JIaU5utl4YAAg992Qz9MvnKelkI
         RRmSlyqVGojvKojgkd36O71l+jSYnAJ9h2dFEkaXfYN1quyRqSCMxrqJGAEMfASSDbdU
         j83YP5pthnhbLauVeLeiaEHiq93wi7GXijVSkRFGIhx9Gi9qB8mhf+JKUUIb/EAHxTcK
         1Ikw==
X-Gm-Message-State: AOAM530kSJo0JfcB5mmgTEjkiFNbAv+tyA+l7lpbKntTcOG7tShJJ+gz
	mT7KyZWIvmwriWk2TIUNHGEcDWAdUzU=
X-Google-Smtp-Source: ABdhPJwEWfYvmNQ0PF5Dh4aC4TIF9su0ge9JIa6sPDRE5og6tfk45VX7842iQtxhKijrL5kWwLeKpA==
X-Received: by 2002:a17:906:138c:: with SMTP id f12mr26812307ejc.180.1618916185840;
        Tue, 20 Apr 2021 03:56:25 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id s13sm12156849ejz.110.2021.04.20.03.56.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 03:56:25 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 20 Apr 2021 12:56:24 +0200
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][dunfell][PATCH 3/3] libyui: switch to libyui-old repo which still has this SRCREV
Message-ID: <20210420105624.nbhzv633jdso2m34@jama>
References: <20210406184327.1585452-1-Martin.Jansa@gmail.com>
 <1673590F38769AC5.4402@lists.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <1673590F38769AC5.4402@lists.openembedded.org>
X-Groupsio-MsgNum: 90947
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zy2w4h3dobg6gzgy"
Content-Disposition: inline

--zy2w4h3dobg6gzgy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 06, 2021 at 08:43:27PM +0200, Martin Jansa via lists.openembedd=
ed.org wrote:
> * 8459235919f592b1bc099ecf9a947cb6344b6fa5 doesn't exist in current repo:
>   libyui$ git branch -a --contains 8459235919f592b1bc099ecf9a947cb6344b6f=
a5
>   error: no such commit 8459235919f592b1bc099ecf9a947cb6344b6fa5
>=20
> * there are no common commits in the new libyui repo, but luckily old
>   repo is kept as
>   https://github.com/libyui/libyui-old
>   similarly libyui-ncurses now contains only README about being obsolete =
in:
>   https://github.com/libyui/libyui-ncurses
>   but at least it wasn't rewritten to have the new content
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-graphics/libyui/libyui_3.6.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-graphics/libyui/libyui_3.6.0.bb b/meta-oe/re=
cipes-graphics/libyui/libyui_3.6.0.bb
> index 7c6f4c13d2..f3c112c3b8 100644
> --- a/meta-oe/recipes-graphics/libyui/libyui_3.6.0.bb
> +++ b/meta-oe/recipes-graphics/libyui/libyui_3.6.0.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING.gpl-3;md5=3Dd32239bc=
b673463ab874e80d47fae504 \
>                      file://COPYING.lgpl-3;md5=3De6a600fd5e1d9cbde2d98368=
0233ad02 \
>                     "
> =20
> -SRC_URI =3D "git://github.com/libyui/libyui.git \
> +SRC_URI =3D "git://github.com/libyui/libyui-old.git \
>             file://0001-Fix-build-with-clang.patch \
>             file://0001-Use-relative-install-paths-for-CMake.patch \
>             "

Gentle ping for these 3 (and 3 hostapd fixes currently in
stable/dunfell-nut).

--zy2w4h3dobg6gzgy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYH6zUgAKCRA3VSO3ZXaA
HJX1AJ93lwCH5CqrZBeEy53uMyPOgQ/YBQCdFt25DLK/WHYqhe/Xcpgbnoj+KIU=
=VsxE
-----END PGP SIGNATURE-----

--zy2w4h3dobg6gzgy--
