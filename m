Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.3587.1621560901105231632
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 May 2021 18:35:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=c+/zsptU;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id f8so14282690qth.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 May 2021 18:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hteO4mcJ4dQxLBUvrdLxDU8jhyjdEa/20+RjY0ZWbME=;
        b=c+/zsptU9MQ01ddBQVTQtzTWQx7xHsuGXukHucoboFhUCvXS3dqlJhLRpUrGzX0pkB
         5M49XfdaVdYc4MS/Is9BCDvn68mP8fW6aJFdo8CzB76OqvkqiFDZlf9KO20DfDsajN+A
         Vj4v3PbFpSHnE8oWzjcdPw7ZCCoy0y68O+sGUNc9IPnm7XTq4N4FXyONYkKGy7r/miVT
         i2RlQfAbqdey2ebr+rL9I23S/4tSusjgCwHOL7qii5PT6jknrrJuiUJWtDGN7r5w6yvV
         ZNVQvyZ6zYiO2x5AoCBqAjf/KT5g5IDh8b75MLYNdWO8tbW7v9cnu8lX4j87pI6XdZtf
         urBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hteO4mcJ4dQxLBUvrdLxDU8jhyjdEa/20+RjY0ZWbME=;
        b=IgoezrYO2kgobkoda8L6WDlqgQ7dfSYHyqzzPerx/o9zQBIjDO6MGjo/g1eLeDZRtL
         sZNYc0YXpGo6lFOAkUsC9og6iwQ3IsgZ6gz9c8wQhPp35vGdfSO4QlwIIF7sqVD5NmXS
         N3tdcjKxiGWXSIw7eonXaozmpl3IPW/5KHWFEkGWOsdaCDibnL8PXMLEqYFUsPKbT7vc
         ysfgm7ti+i8ZEnYO8hdkckK9tG6r4PTeB8uyP+cwDxAcnMQbcDyDBNr+qIs3+bW2bYcd
         eIiRwhrZZpHgM3W/d+6ZwDYOdw7/zL+qRX9/AsuUICnW5FxNrPyB2YHC6NfzawPJJdcH
         cgvQ==
X-Gm-Message-State: AOAM5320q/9KkleP0RTYdNB4N81Jf/A0KFh8KqcY8LqnO1aNVlB3mXTT
	nxZf3DH+a2+yQqhvSyimmajkeyYu5PeH34KmGXOyfJ8/ZQ3ToQ==
X-Google-Smtp-Source: ABdhPJwwGptPBjvCLA9k3HDwsQ9Wx4XG5ylflofWgfp4pr6UW/64swI0cBuKi48cpsgeogC6tgwOUrn/zKMW4CnJQ2U=
X-Received: by 2002:ac8:5d93:: with SMTP id d19mr8594720qtx.289.1621560900131;
 Thu, 20 May 2021 18:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210521012342.2205595-1-robert.joslyn@redrectangle.org>
In-Reply-To: <20210521012342.2205595-1-robert.joslyn@redrectangle.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 20 May 2021 18:34:34 -0700
Message-ID: <CAMKF1sqgn11fpRWTmJrHX+okNSx=-4Ay1Us=gb=F-_OcPT73ag@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] ctags: Recipe cleanup
To: Robert Joslyn <robert.joslyn@redrectangle.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 20, 2021 at 6:25 PM Robert Joslyn
<robert.joslyn@redrectangle.org> wrote:
>
> The configure script does not have a manpages option, resulting in a
> warning:
>         ctags-5.9.20210502.0-r0 do_configure: QA Issue: ctags: invalid PACKAGECONFIG: manpages [invalid-packageconfig]
>
> Since there does not seem to be any man pages or documentation related
> configuration options, remove the manpages class.
>

so it seems it will be using python-docutils for generating manpages ?

> Remove commented code which looks like leftover debugging. The binary is
> installed as expected.
>



> Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
> ---
>  meta-oe/recipes-devtools/ctags/ctags_5.9.20210502.0.bb | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/ctags/ctags_5.9.20210502.0.bb b/meta-oe/recipes-devtools/ctags/ctags_5.9.20210502.0.bb
> index aca0502db..c0ffe9be6 100644
> --- a/meta-oe/recipes-devtools/ctags/ctags_5.9.20210502.0.bb
> +++ b/meta-oe/recipes-devtools/ctags/ctags_5.9.20210502.0.bb
> @@ -12,14 +12,10 @@ HOMEPAGE = "https://ctags.io/"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
>
> -inherit autotools-brokensep pkgconfig manpages
> +inherit autotools-brokensep pkgconfig
>
>  DEPENDS += "libxml2 jansson libyaml python3-docutils-native"
>  SRCREV = "6df08b82d4845d1b9420d9268f24d5db16ee4480"
>  SRC_URI = "git://github.com/universal-ctags/ctags"
>
>  S = "${WORKDIR}/git"
> -
> -#do_install() {
> -#    install -Dm 755 ${B}/ctags ${D}${bindir}/ctags
> -#}
> --
> 2.26.3
>
>
> 
>
