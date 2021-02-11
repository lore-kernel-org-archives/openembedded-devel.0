Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web09.12158.1613064527265263616
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Feb 2021 09:28:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gSfuYS/M;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id h8so5949855qkk.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Feb 2021 09:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WYBG8ixSuH7yDnV5ZcG7CAjVpIRXXEjYkAAp1vTxNNM=;
        b=gSfuYS/Mcd+8BSZE+29aDs8+J1giCgfYDLq8aCt6ZvhPY2HpWb+/FgW/8fbnD04nfY
         k1lK7T60qUm7fFjO9QeP8e7RZZfPvGdmgznRhpK96lsn6RPwp9sS7A/AtU2UKqEAcqXU
         N10HC6prdLSqUv36k5g88wb2d42Mnr9JYjtgXHspi6GyMvibOSwWRPa7tzSN14phAkw1
         3SCx1aTHEqCZv24FVQVZx4B1vD/2HZgbpFoHN9pQNZ/PG017ipBx+RUFb817rSLa5RrH
         oY0krDekK+4LBhVeG1GK6P309EoHOVGALlLDbi3ALTeMWzFiNF22S5joIEceMba47MYD
         E1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WYBG8ixSuH7yDnV5ZcG7CAjVpIRXXEjYkAAp1vTxNNM=;
        b=D76oocIcaJvFSvz0qNzX3MKhK1wzyfYVoCwN7dCcZYn7fwrXFiZdC0/mDAibx/NFYH
         wSsK6g7qMKC91+3Cx/wyoq1YDwymOd0xq5LaZrz48g3QNf5sGwOrT4lAn1CoC9lyAGGN
         Y3FwOY0PcIg6C/6eTw42iCB5nP/JytaMd64TWDCH5aLMiX2hX6zVxyOmhIZaJdU7nm+v
         LeCrIx8qklR43+jwr8eKPsb0tgT57+2VxS3sEbC5Uy89tEJlFk0ibcLgEe7H9cOMDhQ6
         RQn0qPEeqA+vx/iuGw7+7zqZ5lgctfyWbJeP93HjY/qSsA082sRnv+I+gDSHNQ1nltju
         xciA==
X-Gm-Message-State: AOAM531xZ1TKFGpdZOs1PtbEA5FGq847N97fdPkKQixgkCXiQSq01vhn
	9sGkHzcQF2b/x960tNCK8qYnO/CHz4mAVGRDvb4=
X-Google-Smtp-Source: ABdhPJxpO/C8pOBZsLD52HXAdvxC4ioax8NtKZSVB48Q2ZJZ1vcr2TAMsBZvVfJ5DfyecFpZekRYuJ9MTqkm4idVJ3E=
X-Received: by 2002:a37:b346:: with SMTP id c67mr9477766qkf.212.1613064526301;
 Thu, 11 Feb 2021 09:28:46 -0800 (PST)
MIME-Version: 1.0
References: <20210210204201.8468-1-yifan.yu@windriver.com>
In-Reply-To: <20210210204201.8468-1-yifan.yu@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 11 Feb 2021 09:28:20 -0800
Message-ID: <CAMKF1srEG-AjncSrtS1jUsnFgtbXA11jDEi5oM8cpr5wxEHzLw@mail.gmail.com>
Subject: Re: [oe] [meta-OE][PATCH] rsyslog: upgrade 8.2006.0->8.2012.0
To: Yi Fan Yu <yifan.yu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

fails in install

https://errors.yoctoproject.org/Errors/Details/570348/

On Wed, Feb 10, 2021 at 12:42 PM Yi Fan Yu <yifan.yu@windriver.com> wrote:
>
> Ptest Results: (Timeout 800) (qemux86-64)
>        2006 2012
> ================
> TOTAL: 411  424
> PASS:  361  372
> SKIP:  39   41
> XFAIL: 0    0
> FAIL:  11   11
> XPASS: 0    0
> ERROR: 0    0
>
> Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
> ---
>  .../rsyslog/{rsyslog_8.2006.0.bb => rsyslog_8.2012.0.bb}      | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.2006.0.bb => rsyslog_8.2012.0.bb} (98%)
>
> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2012.0.bb
> similarity index 98%
> rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb
> rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.2012.0.bb
> index b6c2a991f..5c6af5dd2 100644
> --- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb
> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2012.0.bb
> @@ -29,8 +29,8 @@ SRC_URI_append_libc-musl = " \
>      file://0001-Include-sys-time-h.patch \
>  "
>
> -SRC_URI[md5sum] = "33de768941953ceeca9d1a437b47891b"
> -SRC_URI[sha256sum] = "d9589e64866f2fdc5636af4cae9d60ebf1e3257bb84b81ee953ede6a05878e97"
> +SRC_URI[md5sum] = "2a64947e3d157c0198609aabd37be42f"
> +SRC_URI[sha256sum] = "d74cf571e6bcdf8a4c19974afd5e78a05356191390c2f80605a9004d1c587a0e"
>
>  UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/releases"
>  UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
> --
> 2.29.2
>
>
> 
>
