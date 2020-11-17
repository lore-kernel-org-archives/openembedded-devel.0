Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web12.11371.1605634030465931451
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2020 09:27:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U5wVC5H0;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id q5so21192782qkc.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2020 09:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5BT7VIHKfTBqNtG76uyBIWIzmbSmc4FLcNoPcI8HHBg=;
        b=U5wVC5H0NwaBHbNmZBB3P0nfZdd/8jn8EgIA0U89dOk9JXclKtV9IyD3dwQg6jNmb0
         4kKjjXdmxThodsUgl1at2M+XTj1G4+0xRgz1kF0KzvgBQsztJwwWZqKF5SH9iY4y2Xcz
         +Vh8e7ioUeackqNN9eP1lGH1T/BjP4Hi6eIDH+/+9y6uyzuCWEaA5V/r47fmSaVHlCYm
         Bm3vuCKH8mUxU9Sz20mb0mzu0TlAkF1xmwJuMdkWDRUGkCvMiES5uwU+cKBPV/97TRS0
         H70WZH8B7NqfeeGbOn01ChKYdQHoHhYPF/ZXGLllQheSRJ6Y8ohVameWr7Qbtnug0jBL
         MxDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5BT7VIHKfTBqNtG76uyBIWIzmbSmc4FLcNoPcI8HHBg=;
        b=Bm70oGjJUBnHe5er9iE5VgHaSsgRo7ydAe7rbzt52H94BfK0PIhX0uj64SjYXUBg0z
         NJw76OIGpIiQPSpwBRcJ3rOZhbo+kInDQZS+hI7KEGXFWna5FVict1JuYDUcYS/pR0xD
         j/kS91Yi9BzYfrPf9wti8cGAYRpsUoBIbOOeEyrK1jYJYjsnd5dc//OXmB/TzaBTcZJ+
         UJMellFz0MRvQzzGg2pJg2mdaqRUOAmlw+nD3ADIM8SBvP1B21nXPYJED7jDDZ1Q1xUl
         elb8M7JgB4Ci34/hszmnCp6j7CBwgTZGxOdDTmQ3HW5/JD8oGHjplTWGHMFTYQpV+16b
         jLtA==
X-Gm-Message-State: AOAM533n0JGF+XaCbywlBWJgKPbQYqWJBEtfBwVy15NrD7fZAObtNeFH
	Gf85XcSrJugIY41hTwoxdIrbbc5cz2tZd64pKcI=
X-Google-Smtp-Source: ABdhPJyEEkeOXzMxTLjllmoGLQiYmEsJYPRBlvXn1lWe9bpqRxvyxdvG6c5w3uf+LItbnf9lFNLZwdawhmArH/pSqj4=
X-Received: by 2002:a05:620a:204c:: with SMTP id d12mr661080qka.212.1605634029527;
 Tue, 17 Nov 2020 09:27:09 -0800 (PST)
MIME-Version: 1.0
References: <20201117163942.22157-1-philip@opensdr.com>
In-Reply-To: <20201117163942.22157-1-philip@opensdr.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 17 Nov 2020 09:26:43 -0800
Message-ID: <CAMKF1spejni5vvkzaJKgs1sbCDrXkWQDA_8OT6nuSAZzhmc4Zg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] spdlog: Fix recipe so other recipes can use spdlog with external fmt.
To: Philip Balister <philip@balister.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Philip Balister <philip@opensdr.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2020 at 8:39 AM Philip Balister <philip@balister.org> wrote:
>
>  * I enabled the shared library option to eliminate linker issues
>    with a package that used spdlog.
>  * Edited the tweak.h file so programs use the external fmt library
>    headers, not the oners in spdlog.
>
> Signed-off-by: Philip Balister <philip@opensdr.com>
> ---
>  meta-oe/recipes-support/spdlog/spdlog_1.8.1.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/spdlog/spdlog_1.8.1.bb b/meta-oe/recipes-support/spdlog/spdlog_1.8.1.bb
> index 7d28fff5e..c5227a5e9 100644
> --- a/meta-oe/recipes-support/spdlog/spdlog_1.8.1.bb
> +++ b/meta-oe/recipes-support/spdlog/spdlog_1.8.1.bb
> @@ -12,10 +12,14 @@ S = "${WORKDIR}/git"
>
>  BBCLASSEXTEND = "native"
>  # no need to build example&text&benchmarks on pure yocto
> -EXTRA_OECMAKE += "-DSPDLOG_INSTALL=on -DSPDLOG_BUILD_EXAMPLES=off -DSPDLOG_BUILD_TESTS=off -DSPDLOG_BUILD_BENCH=off -DSPDLOG_FMT_EXTERNAL=on"
> +EXTRA_OECMAKE += "-DSPDLOG_INSTALL=on -DSPDLOG_BUILD_SHARED=on -DSPDLOG_BUILD_EXAMPLES=off -DSPDLOG_BUILD_TESTS=off -DSPDLOG_BUILD_BENCH=off -DSPDLOG_FMT_EXTERNAL=on"
>
>  inherit cmake
>
> +do_configure_append() {
> +       sed -i 's|// #define SPDLOG_FMT_EXTERNAL|#define SPDLOG_FMT_EXTERNAL|' ${S}/include/spdlog/tweakme.h
> +}
> +

This should be a static patch instead

>  # Header-only library
>  RDEPENDS_${PN}-dev = ""
>  RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
> --
> 2.13.6
>
>
> 
>
