Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.8970.1595680861302927437
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jul 2020 05:41:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a87GsWYu;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: vincent.prince.fr@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id f18so10617620wrs.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jul 2020 05:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=75tlgHgh0seiRKtCPcZP4j9xENlg4qs4AQpChJMHMtQ=;
        b=a87GsWYuYoXIW3WkV0MwpNoUj68nZwuZdLBWBzrEuGkoFXNXLMJxOpDAWW3RQfKui1
         eeJt0c6OWxc5L7xk0Bx0LLMHxPkc/ExpyEFCgQ5Li00mrarHGyN/k/7eITQKzlHbqT1P
         5BSO5yltp5SL2sxOoSmrXkFsagnPKUi0l+elTqEuxNyH9B3Og/tPwiDgUhWis2jHQNkS
         y78egWLkWgAJ5O5arp3q4Rlpx+nA9azUBcgpQRExLvDylvQasSZfkmFQjUbreWOXq5PG
         Cz5DHKb3VWrnpnxt4EuKhGtZhewA8/awW7W1+5fX9qJ67rfk5719oRpHO8xqjsCrq+UI
         BcMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=75tlgHgh0seiRKtCPcZP4j9xENlg4qs4AQpChJMHMtQ=;
        b=hPhU4TjfT2KFEg7QUeY3SC+92rOdlFihSGOHawua0IAInaxma7GlGZnG89+mZ6+7wx
         3uL2ZEU8i3IpLd5+Dnzpanbpk7QO/a1Y+56qVom7v9BTlPtEnhZ8xKKGAu6AGJi5Dmzp
         4G6JZvymloql9YzoQPLNVUqsBRPsI12qovIzNzxGhlvK3ezWqIXegQ/vR74jqDs6ckFC
         JBfPHdfe39KNclRjX6auzZEGScqFkrDgQc1DdEEyUlCsPyJbnx3CD9gpmrxPKkFYtAkL
         93cNp6HE+lMgfnDpY+2tFMu5a3aoaAQz4yozR7HvXB8CJn5q8SMpWsz1CD6XgdOWvIJY
         4EVw==
X-Gm-Message-State: AOAM533Gc2W8etfROQGkfWIMAMIJg26G0YLsP5Lsy5UTrB7RQlqx1ZgQ
	Xp5XX2ayBP1K+Y5ncdZpEGJMWKNku84LCEn7g9Q=
X-Google-Smtp-Source: ABdhPJxdb5Se2Uebk7SZv135NgYnTG8/hLeevmPGJc8CzvpQjNX5eaYxwBWbiBBitLYmq6wcZ/8/2tS8uZscCho+zJ4=
X-Received: by 2002:adf:ef08:: with SMTP id e8mr7907449wro.164.1595680859763;
 Sat, 25 Jul 2020 05:40:59 -0700 (PDT)
MIME-Version: 1.0
References: <20191128152823.162778-1-cengiz@kernel.wtf>
In-Reply-To: <20191128152823.162778-1-cengiz@kernel.wtf>
From: "nefethael" <vincent.prince.fr@gmail.com>
Date: Sat, 25 Jul 2020 14:40:48 +0200
Message-ID: <CAB2nKc-zfyh3Wr_parZ5ovd==P8voHQjpCUiitRAaRgHdhhgfA@mail.gmail.com>
Subject: Re: [oe] [PATCH v2] recipes-support: gperftools: RDEPENDS for pprof
To: Cengiz Can <cengiz@kernel.wtf>, Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm using mongodb with tcmalloc PACKAGECONFIG so it rdepends on gperftools.
Before this commit, my image didn't need perl, so I'm wondering if we
cannot split tcmalloc library or pprof tool in separate
gperftools-{tcmalloc,pprof} package?

Kind regards,
Vincent

Le jeu. 28 nov. 2019 =C3=A0 16:38, Cengiz Can <cengiz@kernel.wtf> a =C3=A9c=
rit :
>
> gperftools comes with pprof tool that usually needs to be run at target
> machine to aggregate CPUPROFILE data.
>
> However since we were not shipping objdump (binutils), Getopt::long
> and POSIX perl5 modules, it was failing.
>
> I've extended RDEPENDS_${PN} with those so that whenever someone
> installs gperftools, those dependencies are fulfilled as well.
>
> Signed-off-by: Cengiz Can <cengiz@kernel.wtf>
> ---
>  meta-oe/recipes-support/gperftools/gperftools_2.7.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.7.bb b/meta-=
oe/recipes-support/gperftools/gperftools_2.7.bb
> index 731c83516..ee34acec2 100644
> --- a/meta-oe/recipes-support/gperftools/gperftools_2.7.bb
> +++ b/meta-oe/recipes-support/gperftools/gperftools_2.7.bb
> @@ -35,5 +35,10 @@ PACKAGECONFIG[static] =3D "--enable-static,--disable-s=
tatic,"
>
>  PACKAGE_BEFORE_PN +=3D "libtcmalloc-minimal"
>  FILES_libtcmalloc-minimal =3D "${libdir}/libtcmalloc_minimal*${SOLIBS} $=
{libdir}/libtcmalloc_minimal_debug*${SOLIBS}"
> +
> +# pprof tool requires Getopt::long and POSIX perl5 modules.
> +# Also runs `objdump` on each cpuprofile data file
> +RDEPENDS_${PN} +=3D "binutils perl-module-getopt-long perl-module-posix"
> +
>  RDEPENDS_${PN} +=3D "libtcmalloc-minimal (=3D ${EXTENDPKGV})"
>
> --
> 2.24.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
