Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web12.1018.1630777792005028452
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Sep 2021 10:49:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OKyu2Y8p;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id g11so2036889qtk.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Sep 2021 10:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iFs0k65LJD/K9Oxx6CZcJUj6235cexSbrdE/l3vltk0=;
        b=OKyu2Y8porBxI7WUi8d7QlmDBT6PzveI2F2mM9AvnycYqNxPqsqeulSQDFLwtE9zmT
         p0/fBKMXg+kR2rZcpbO0yWvzRQ5G10EYOoRIFLn67MIg0gICGeYgUAp8ZuTemuhPgKYf
         jU8FaRXrWkJeD2jJlPc42Q1vIAUdyR88MYoEFZIyRmA8yDGzVwTELElShLbckrSgAyWd
         XRRO9l+j7YorgNlCxUtq23zlpUgdn479ge6SZXHdZ4rwufJUIJ2OpfLjLjuaLJ6p4fBh
         s+D4J7R78jN64RYbpEA23KBvpcQo3p8VUXZsnrNhohNWVkMzdnb3eHfmCouuHXFWxVDN
         abBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iFs0k65LJD/K9Oxx6CZcJUj6235cexSbrdE/l3vltk0=;
        b=NbXypMVLSZUqQ7KebuhvsHNJpgSzHaFBMrqJ0jMa0PslrtwEW59CRgRMEC/MKdWTEI
         MplJtaOHgTKxfdHDIqKkOnZinkEgsDIxIh1pw7mtEQ2niFGLMBN73C3n9Hgt7ZngjFNi
         E3xmvvpBPO9R0bH10jnyWpRdG//Wkj0xVTMlagATlF+8anY9Sq0aDuVTLCPgRaRDaYbe
         Pc0JEBvojRenn3XtNmN/1NaPEjNzBbMr4KdJaph2jhVr0bAPAmJBZ4BigSgUKrYUo7zB
         5F8eAVY998lwPCmvG3cX8PdsLFPV3VbIGA66/P0xdSv+V181TVMx0M1jUi3hwj1VnqVq
         mojA==
X-Gm-Message-State: AOAM5333CX98UzUdn3ODEhD5NblB2I8kdO0ujJEbKcdh7V5aXn/5IVLV
	qUqbW2h7dSsZRI/02uzTmeSujHZMEyPWVJVowIh2L6oo2/c=
X-Google-Smtp-Source: ABdhPJwZ8oOcgiamu39VaywskBUPeb6+SjE2MZklva1l6r+C7Wb8gpq1+JGg3t+sEWccRDJaq2g4m6xYPej9xtD4IxQ=
X-Received: by 2002:aed:314f:: with SMTP id 73mr4306813qtg.274.1630777790881;
 Sat, 04 Sep 2021 10:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210904174506.2263139-1-raj.khem@gmail.com> <20210904174506.2263139-2-raj.khem@gmail.com>
In-Reply-To: <20210904174506.2263139-2-raj.khem@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 4 Sep 2021 10:49:24 -0700
Message-ID: <CAMKF1sr3-Qnd7JD8ApPnJ=bbxsj85NeW73XXKx74GhtyqLPqDg@mail.gmail.com>
Subject: Re: [meta-python][PATCH 2/3] python3-kivy: Check for x11 and opengl before enabling the recipe
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Martin Jansa <Martin.Jansa@gmail.com>, William Huang <whuang8933@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 4, 2021 at 10:45 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Fixes
>
> ERROR: Nothing PROVIDES 'libsdl2-ttf' (but meta-openembedded/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb DEPENDS on or otherwise requires it)
> libsdl2-ttf was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
> ERROR: Nothing RPROVIDES 'python3-kivy-dev' (but meta-openembedded/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb RDEPENDS on or otherwise requires it)
> No eligible RPROVIDERs exist for 'python3-kivy-dev'
> NOTE: Runtime target 'python3-kivy-dev' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python3-kivy-dev']
> ERROR: Nothing RPROVIDES 'python3-kivy' (but meta-openembedded/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb RDEPENDS on or otherwise requires it)
> No eligible RPROVIDERs exist for 'python3-kivy'
> NOTE: Runtime target 'python3-kivy' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python3-kivy']
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Martin Jansa <Martin.Jansa@gmail.com>
> Cc: William Huang <whuang8933@gmail.com>
> ---
>  meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb b/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb
> index 63c2ae7334..29a050a891 100644
> --- a/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb
> @@ -4,7 +4,7 @@ HOMEPAGE = "https://kivy.org/"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=f0c851d60495c7e27225a819e179208a"
>
> -inherit setuptools3
> +inherit setuptools3 pkgconfig distro_features_check

this should be using features_check I have fixed it before staging
into master-next

>
>  SRC_URI = "\
>      git://github.com/kivy/kivy.git;protocol=git;\
> @@ -42,6 +42,8 @@ export KIVY_GRAPHICS
>  KIVY_CROSS_SYSROOT="${RECIPE_SYSROOT}"
>  export KIVY_CROSS_SYSROOT
>
> +REQUIRED_DISTRO_FEATURES += "x11 opengl"
> +
>  DEPENDS += " \
>      gstreamer1.0 \
>      gstreamer1.0-python \
> --
> 2.33.0
