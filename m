Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web12.13466.1596179104263821375
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2020 00:05:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=p8Wgjx0N;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id g26so27986608qka.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2020 00:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6Vnk8yfjZfZl017sMCmSHR/KB/HBlxcGKURNF/3xVzM=;
        b=p8Wgjx0NDAdUNexhkMDJUGXaivGqR5OgljbOomnIja9/ciCbwx7JJqFBw6MdtAixmt
         U050NMwfRTc1VMgdpHDHFYcw5YeqxIE2691Zz2xO8B1OIsmjzVpuMmpwcnHDRHMN34u7
         vs0G/gJwUEkYn95wtWjmt+dHeeROOENA7z8ylmw1t2fQr8MxhzAZjw1aCd1NvHNQHJ7h
         3jseFykjXTZ+1BfnK27brBDgAtUOo1F4pD5UQZshd/k+KHI2mR7C6k2jkQIt+ng2wORj
         ceQGumpaWEFc5+95bqo20l1Aet40FI+6p2YC2E9Ny+wT1uXKOejhDnzLeTOAE2haDOtA
         96MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6Vnk8yfjZfZl017sMCmSHR/KB/HBlxcGKURNF/3xVzM=;
        b=HjMNcqwXwGmH+Ci4e/i9gD3xpwPAXpObmoVYEVX8wU7TGRfdl5QeyW6N85xD3FAUA2
         XaLgvefNfsZuppk60yoMFsiRsGG9kK3ttLlsStg9BpB05VAs+MWdFk0nvKM6bKGi1B+n
         gZSvNFKg/CIsNzsDMO41POmhQSE5IYKpYbsEYr2ENYsyZHTYtaTqppBsk1um93GVALX/
         6Nf8Ekc7XDIKiEvnv9yHR5uFsRlCSlmz5wK6RBfjLoCi6/461ihSXtGHu/eJV5JJaEt5
         JHhcE/F9NlARZ8HBFGSjiRMdn9J7rSeT+dgDzo/+OdZ37e6fZWqm0KnNRrH3a/i5cwN9
         cm2g==
X-Gm-Message-State: AOAM530PbPMyZxBk+9+zw5p80znSprwDgeR92URGPoju5wbSJtADgYnQ
	Xt3QcVQChk7sf0dUNbuL6iQ6kjG8jaJr1Du6nyY=
X-Google-Smtp-Source: ABdhPJy0I1N6fzDMkn3xlkP0s1kw7gVpjx4qkCW1OOrB/oKC4Dt7rZDS5Es2C2wrn1+bcePqY1U4CwDMYlaPBpSbAWk=
X-Received: by 2002:a37:9d0d:: with SMTP id g13mr2646106qke.165.1596179103242;
 Fri, 31 Jul 2020 00:05:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200729124155.3367618-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20200729124155.3367618-1-open.source@oleksandr-kravchuk.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 31 Jul 2020 00:04:37 -0700
Message-ID: <CAMKF1sp=wyRip=ZdvV=R7EAbLrnSqSVVUH=CDtjHJcAK-D-EGw@mail.gmail.com>
Subject: Re: [oe] [PATCH][meta-networking] mbedtls: update to 0.23.0
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 29, 2020 at 5:42 AM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> License checksum due to dropped due to CLA requirement being removed
> from the license (see c76a54554ca8bffedf@).
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../mbedtls/{mbedtls_2.16.6.bb => mbedtls_2.23.0.bb}     | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>  rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.16.6.bb => mbedtls_2.23.0.bb} (84%)
>
> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.6.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.23.0.bb
> similarity index 84%
> rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.6.bb
> rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_2.23.0.bb
> index 12ad39761..3e4553291 100644
> --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.6.bb
> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.23.0.bb
> @@ -18,13 +18,14 @@ understand what the code does. It features:                          \
>  HOMEPAGE = "https://tls.mbed.org/"
>
>  LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=302d50a6369f5f22efdb674db908167a"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>
>  SECTION = "libs"
>
> -SRC_URI = "https://tls.mbed.org/download/mbedtls-${PV}-apache.tgz"
> -SRC_URI[md5sum] = "1f629a43c166de2eca808f3e30aa961d"
> -SRC_URI[sha256sum] = "66455e23a6190a30142cdc1113f7418158839331a9d8e6b0778631d077281770"
> +SRC_URI = "https://github.com/ARMmbed/mbedtls/archive/mbedtls-${PV}.tar.gz"

We do not use github archives, so either use git fetcher or see if
project has static release artifacts

> +SRC_URI[sha256sum] = "5c8998217402aa1fc734f4afaeac38fad2421470fac4b3abc112bd46391054fe"
> +
> +S = "${WORKDIR}/mbedtls-mbedtls-${PV}"
>
>  inherit cmake
>
> --
> 2.25.1
>
> 
