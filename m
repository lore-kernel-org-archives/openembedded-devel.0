Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web12.26351.1600977443233357013
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Sep 2020 12:57:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a74QIieS;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id g72so676561qke.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2020 12:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xQH4hANEe6WMScKEcqXZ0zxzfQIDlbh6Qh9CaIiaLCU=;
        b=a74QIieSdobrk154qzOF5Qv9CZJJkkyh4p9GznPiy3d1EkwjAFvANntjZ5l01TCOVL
         oDmCD343AMdWJ54NZckNRVrWqG7uMAAgHbMjcWtV3o325YD2G5SYPht7ZcKqOpbO++aH
         p0dGSSl7rIFKnaEmGPrA/YvuQV9jl9jImBR0ZgidyPmUjtl1zOWkqru9mGiv1A66qwC3
         EzW83pqcJUgBWIHdTLxctoIWZntB/L8BYDiRt1QlBVWT2fKyAHjXkV3ZLi2ez3QvTEFo
         FdzPiriryRaXm8m7xzI2qvxqSLrdr3bDF/ShpVRbtefMGAy7lAiQleBZO1gQXJhWsT39
         txIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xQH4hANEe6WMScKEcqXZ0zxzfQIDlbh6Qh9CaIiaLCU=;
        b=NfvY6PcPF3TryFZm1aFuvhlKMNZ03CcawXN6pE5eUC9xOAGIdDkJskMGkCt/E4O80r
         FB+jnUvY5rocvxZgLXms2VHpJE1nEtVubol906dR4shgTkvHVNFWVuKg/YlXDoDP4Iwk
         i4idsra4GcZwZNMpa8q4xPo0KcPoNsf7Xz968SrF5fDAVJ8ymP/j99ki/viq3n3L6Sl3
         zb5XX79BZ47ypJwJX7jJRUC4yp5pDtdvx3uBL37nQzS17+ashIw7bVFaNIupULkLVbwt
         aTw6NjrDOFkcE4Q26KVA3GTiNvsj5pC9Ab4UiCvjOz5n3aHCWlbDkn9YqQRrz/fTgamU
         WTHA==
X-Gm-Message-State: AOAM530G6ihZkJVDuFCeKoKQNcR5MPeQRJaITViKdtlz8UUfMV7vsObl
	nEZqK04zadjdB+ciaggoShgLxHkf2AxsxQNNv7o=
X-Google-Smtp-Source: ABdhPJxdkGRIX4YS0lL5qrZlIGCxPisF5veLwAJvJumNqv1gwGPE6OLVElUqC1fDZMkGYuqH1WQuJ4yGbP1FPiGSvrw=
X-Received: by 2002:a37:c408:: with SMTP id d8mr741666qki.71.1600977442218;
 Thu, 24 Sep 2020 12:57:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200924144749.23149-1-sgaikova@yow-lpggp3.wrs.com>
In-Reply-To: <20200924144749.23149-1-sgaikova@yow-lpggp3.wrs.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 24 Sep 2020 12:56:56 -0700
Message-ID: <CAMKF1sr1eeJuFYbUpovsW+sH8+6a4jW8FucqSibi=QO+nDxwFQ@mail.gmail.com>
Subject: Re: [meta-browser][PATCH] conf/layer.conf: Add meta-python2 to LAYERDEPENDS
To: Stacy Gaikovaia <sgaikova@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Maksim Sisov <msisov@igalia.com>, Robert Yang <liezhi.yang@windriver.com>, 
	Stacy Gaikovaia <sgaikova@yow-lpggp3.wrs.com>
Content-Type: text/plain; charset="UTF-8"

Can you post this series via a github pull request please ?

On Thu, Sep 24, 2020 at 7:49 AM Stacy Gaikovaia <sgaikova@windriver.com> wrote:
>
> From: Robert Yang <liezhi.yang@windriver.com>
>
> The recipes-browser/chromium/chromium.inc requires pythonnative which is in meta-python2.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> Signed-off-by: Stacy Gaikovaia <sgaikova@yow-lpggp3.wrs.com>
> ---
>  conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/conf/layer.conf b/conf/layer.conf
> index 2572211..5fb9beb 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -112,4 +112,4 @@ BBFILE_PRIORITY_browser-layer = "7"
>  LAYERVERSION_browser-layer = "1"
>  LAYERSERIES_COMPAT_browser-layer = "warrior zeus dunfell gatesgarth"
>
> -LAYERDEPENDS_browser-layer = "clang-layer core openembedded-layer"
> +LAYERDEPENDS_browser-layer = "clang-layer core openembedded-layer meta-python2"
> --
> 2.27.0
>
