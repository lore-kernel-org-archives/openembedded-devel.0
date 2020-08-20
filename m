Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web12.114360.1597942682163242647
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2020 09:58:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m7QpK379;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id s23so1664983qtq.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2020 09:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IVuQNP/B5M0NgB26is8d2AjBBuEnNEuqfI4UzK5PBSI=;
        b=m7QpK379MocFdJrivG8l1owRa5/7GM0b04Bn915vZiqDUF3KcH6TFuob3cTqgmNbel
         1wrDlKBTUg+TpLVOvaU2CPc4ZLENZ5Tt9o7SfguGnZ3LlmjZbD3+B9T/ruOKuSVGNj/O
         +lfo+Q255vv15CdKD3nR67fgfHRdVj2t0lSktEHnXUqTCXxVziHMcRiruBgs/xknuk6T
         qz3YFxAhMySWBh5BCidx7pu6iIYzJQGKsuRbXLcEDvAkak61qhJY1TgGLw6+mci8feEt
         ZshRNmeeZRCNKrBpkvYF8KuCxa2tsPxAyczvyYvuxn4/Q4xj/uyA9GbZ/p3x1WFCVYCq
         A+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IVuQNP/B5M0NgB26is8d2AjBBuEnNEuqfI4UzK5PBSI=;
        b=RWH+PdF2gFdOuj2urTn5A5kNsAP2yMuAFXsAsUyR77B+ASF8xdngleI8HSjNabSGjl
         Yf4AAQknfGTwkwRHI4YiZKhDOwDbP38l1Wsx9uFL6n9AIHRqVKYP1IRkZkLWa2r7jCz6
         w6LsiRfUAELvaNc7InBBqmr8Ng6b2VeG9EO5Vc5Cy4HQZxuchadlRY7H1TzQBJxYlFwF
         /mEkgRfJjo4vGQT6+vqHa6SaVJREWPmEO+AX1L8kLWnee2lrq+hXD8FTKPcc4u8YqOb1
         jwlIr2dDoDsUaXyZ+/7AsgTEIOepHxsuPlkij109kbzrMy2aiuW4UbEiAFAadqpUl2KW
         eIWA==
X-Gm-Message-State: AOAM532O53n2prshHXRj/tb3ED+TuRPRHuewx3nSO1W2mES6fkn2njeC
	rA74oztG6rzNIlJftr28gpjL1JWATanTrhCmf/s=
X-Google-Smtp-Source: ABdhPJyyYoR9GNEgCatwPfy2INwzEuhWTBCgFydAUtCpFP9YOcuxFZz47CG/txwIjxxGH9ocufDtBJ6op0orfCwqQXw=
X-Received: by 2002:ac8:2962:: with SMTP id z31mr3503520qtz.88.1597942681208;
 Thu, 20 Aug 2020 09:58:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200820161825.11048-1-bjarne_michelsen@hotmail.com>
In-Reply-To: <20200820161825.11048-1-bjarne_michelsen@hotmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 20 Aug 2020 09:57:35 -0700
Message-ID: <CAMKF1sqFGc4qzk+oHyScXUpMwaByBZnQMdA+PrLLCU0giq7Qiw@mail.gmail.com>
Subject: Re: [oe] [PATCH] asio: extend recipe to add native support
To: Bjarne Michelsen <bjarne_michelsen@hotmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 20, 2020 at 9:32 AM Bjarne Michelsen via
lists.openembedded.org
<bjarne_michelsen=hotmail.com@lists.openembedded.org> wrote:
>
> Allows usage of asio for native packages
>
> Signed-off-by: Bjarne Michelsen <bjarne_michelsen@hotmail.com>
> ---
>  meta-oe/recipes-support/asio/asio_1.16.1.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta-oe/recipes-support/asio/asio_1.16.1.bb b/meta-oe/recipes-support/asio/asio_1.16.1.bb
> index f381d12fb..dfc3b798d 100644
> --- a/meta-oe/recipes-support/asio/asio_1.16.1.bb
> +++ b/meta-oe/recipes-support/asio/asio_1.16.1.bb
> @@ -25,3 +25,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/asio/${BP}.tar.bz2"
>  PACKAGECONFIG ??= "boost"
>
>  PACKAGECONFIG[boost] = "--with-boost,--without-boost,boost"
> +
> +BBCLASSEXTEND += "native nativesdk"
> +
> +EXTRA_OECONF_class-native += "--with-boost=${STAGING_LIBDIR_NATIVE}"

this should be EXTRA_OECONF_append_class-native = "
--with-boost=${STAGING_LIBDIR_NATIVE}"

> --
> 2.25.1
>
> 
