Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.15743.1599144445590199061
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2020 07:47:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CcDdciSv;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id cy2so1456776qvb.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2020 07:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mqVeHyZbNk/uyIhKqhzlsHDgvGVsnwO8fAtJmL2dPMY=;
        b=CcDdciSva44/SOfx0L5LWN6+TGc8gY1F3RefCl0Yys0S9ul7/S3vslCBzA+5Fl9RYh
         j+SZeXy74zYDE/UgEh5pmBPMNJiZbKXqJpT2mRUV9KHI26giUoGzxn0ldjcPONSn8vzT
         iQElryd1zHmATSEURqPHOsvEa1DwEc/+RMFrazJvphGk1uoIdgbSC6uLLVdf78uXjHjY
         7v13slRTKY3KvuigF2trgcsO8YqfM5xxFUPI4EoUUhw6VscHpRN0VbU6VsXYStzvtO8t
         h0VR8tseoUIThht035BOJfjXYl1qgeMSH/CPTuv6MfoP2kCOCha71aKla/yVAzwbHca5
         XY9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mqVeHyZbNk/uyIhKqhzlsHDgvGVsnwO8fAtJmL2dPMY=;
        b=ie37dutVWa7CfjKzUKujeC2MPjVggu07/TC+zCyURJ8OUMUkZ5JiS05AVI+fh5bGUn
         v4TInMGu4fVgQ0dMK6TJssLpOF/dEAIPUXyqJ5SlzgzAatLCUq/MTFzTbAFtZ/7s5HO3
         bdyj6xZLcuFw1TfUN6kckFHvIarJsH2ZscPRal2BnH0CeasY8uBLq4Jy6a99E0w7me5O
         dgAT8H3eTb+ki4Ko9GkyRIe5/ABWFKwjXid663zY/ixZwJ16QMM4DPn5agD9dMwPXbhN
         MwQBBufrlfxOp/hVv6KYzFmNx7qLSgVBzYRrAD0k+HROJx1eIBQ3U+Pyl1p99iRd/c6v
         fG2A==
X-Gm-Message-State: AOAM532D/V/i/aMSTTcFJLC7J6EW7PSWUuJj/Y1Y3rjOAgSORa9Duzi/
	GxnuSvARXtkjXc+1YEdoMHMAi69oUn/YyiQQTWc=
X-Google-Smtp-Source: ABdhPJygvv6xxx6G+vsnd3xiWn3goh4g4RzqNMK/49iydwXnQH2cE4nd45r5tagw120ZJLcuQeXXHQ+vBub5sUQ6UHQ=
X-Received: by 2002:a0c:d44e:: with SMTP id r14mr3266834qvh.105.1599144444569;
 Thu, 03 Sep 2020 07:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200903135825.71432-1-joe.slater@windriver.com>
In-Reply-To: <20200903135825.71432-1-joe.slater@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 3 Sep 2020 07:46:58 -0700
Message-ID: <CAMKF1sphB0y3vZjBMhY3iyZPecc1ZOaW6X+RkqLwpSU6+c87Xg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/1] luajit: advance SRCREV to fix two CVE's
To: Joe Slater <joe.slater@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Randy MacLeod <randy.macleod@windriver.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 3, 2020 at 6:58 AM Joe Slater <joe.slater@windriver.com> wrote:
>
> Fix CVE-2020-15890 and CVE-2020-24372.
>
> Also change PV format because the reference to 2.1.0-beta3
> was already far behind the SRCREV.  Now, base PV on the branch
> name and date of SRCREV commit.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  meta-oe/recipes-devtools/luajit/luajit_git.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/luajit/luajit_git.bb b/meta-oe/recipes-devtools/luajit/luajit_git.bb
> index cc9039416..820722195 100644
> --- a/meta-oe/recipes-devtools/luajit/luajit_git.bb
> +++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
> @@ -3,13 +3,15 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d739bb9250a55c124a545b588fd76771"
>  HOMEPAGE = "http://luajit.org"
>
> -PV = "2.1.0~beta3"
> -SRCREV = "0ad60ccbc3768fa8e3e726858adf261950edbc22"
>  SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http;branch=v2.1 \
>             file://0001-Do-not-strip-automatically-this-leaves-the-stripping.patch \
>             file://clang.patch \
>             "
>
> +# Set PV to the branch and date associated with SRCREV.
> +PV = "v2.1-200809"

does this sort above 2.1.0~beta3 ? and below 2.1.0

> +SRCREV = "94d4abcca966df2cc423e821bcacd04898f73117"
> +
>  S = "${WORKDIR}/git"
>
>  inherit pkgconfig binconfig siteinfo
> --
> 2.17.1
>
> 
