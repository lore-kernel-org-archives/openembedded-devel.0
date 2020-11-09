Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web10.18632.1604957545201573463
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2020 13:32:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ivgI9RGp;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id i7so7126147qti.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2020 13:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nx2/5zSBTcbhUYhPlIduA7Vo/8r0sF98MAasQbSHh7s=;
        b=ivgI9RGpkcyIt1QrVvhpEodmQWKgvJTl3/UaMqhOC8xcivgZXspUK5h/hbXVMgAMWf
         HVAi/agQyCsLaq5Wmvr8ug6TAJUCsVg1tPrhAkzfug3MY049h+N9KFpNDJLt9Vqd6Jf2
         +gle1a8n3bJhi3w1rppRsv2mQhrsONd/CrhQecfd0yd2+SK7jbNt1voJwBuW7OUslgPh
         CrQNM8dMwRr64AwRXmN0yA9PIicp9Dj7UUrPllYG22q0AyzaxmVeOswbgKq8lt3U+hCn
         K+hABxDcT5ixF+paGWzaKNPqdj2BcUG8rHQuOEldq1bs3FscuMDi1ZaE9I59Qs+U0CCE
         pViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nx2/5zSBTcbhUYhPlIduA7Vo/8r0sF98MAasQbSHh7s=;
        b=NTeZGpg8UKMm3B2Dj3/nCo3edol1/YR/ZWQHFzl++6YoBiitzDdOy1+9qQP6Romqzf
         BZJNvu1NP0InsdUlCLW4U6OgTgZ0CPTDDfxKfMZFte8+tm+VWv/o6Xm4jHdNBQs0vRnq
         Ikpi1Ysq+mJSlFrl1ccWOHNnGGSjFc4zagM8CUHLC1r0B0WAia8ewl78sU8iBTifQnpU
         6ni+dWgtyf1eQoKfYFLUAAoGKZDl/LI+rDmnhVcMQUlc1vU4G5q9y+MJaqrzrw1OroZr
         TWgP9sJdd2n9achyk0qoAigXB2z8RkSJk7CEy1eCqg+CLlPNJY/AZcUGTZ1ibXx7D0al
         Jn6A==
X-Gm-Message-State: AOAM530pwBl0VOLHtLMpP8ohAJAXcWcYrjBxxnN7vdAuFTwnpx5p26hC
	+67b0P/v+YKHk3rwoMJqkTZ9QMo3imwsgxwaz9I=
X-Google-Smtp-Source: ABdhPJyQdcDEFk2ZVDsYM3U+VHVYlxoWc0xmwiOAh3pWEQPrIFCgkQ/OCiQxNjjPlNLXdRbQt6qAkbBUoTKt4797pHc=
X-Received: by 2002:a05:622a:1cb:: with SMTP id t11mr15676761qtw.378.1604957544182;
 Mon, 09 Nov 2020 13:32:24 -0800 (PST)
MIME-Version: 1.0
References: <cover.1604605168.git.rosbrookn@ainfosec.com> <4941002037351503fa2164149722ebca8cef9b58.1604605168.git.rosbrookn@ainfosec.com>
In-Reply-To: <4941002037351503fa2164149722ebca8cef9b58.1604605168.git.rosbrookn@ainfosec.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 9 Nov 2020 13:31:57 -0800
Message-ID: <CAMKF1sr03H0TbgdfxODcr6K2o1y8NmnucU+Fxtc954dddSH3Rw@mail.gmail.com>
Subject: Re: [meta-networking][PATCH 2/2] strongswan: add some PACKAGECONFIG options for EAP
To: Nick Rosbrook <rosbrookn@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Nick Rosbrook <rosbrookn@ainfosec.com>
Content-Type: text/plain; charset="UTF-8"

Hi Nick

I am seeing a failure with clang compiler

https://errors.yoctoproject.org/Errors/Details/537872/

Other builds have not finished yet so don't know if its specific to
clang or generic.

On Thu, Nov 5, 2020 at 11:50 AM Nick Rosbrook <rosbrookn@gmail.com> wrote:
>
> Add options for eap-identity and eap-mschapv2 plugins.
>
> Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
> ---
>  meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb b/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
> index 59641cb83..075982c77 100644
> --- a/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
> +++ b/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
> @@ -32,6 +32,8 @@ PACKAGECONFIG[aesni] = "--enable-aesni,--disable-aesni,,${PN}-plugin-aesni"
>  PACKAGECONFIG[bfd] = "--enable-bfd-backtraces,--disable-bfd-backtraces,binutils"
>  PACKAGECONFIG[charon] = "--enable-charon,--disable-charon,"
>  PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl,${PN}-plugin-curl"
> +PACKAGECONFIG[eap-identity] = "--enable-eap-identity,--disable-eap-identity,,${PN}-plugin-eap-identity"
> +PACKAGECONFIG[eap-mschapv2] = "--enable-eap-mschapv2,--disable-eap-mschapv2,,${PN}-plugin-eap-mschapv2"
>  PACKAGECONFIG[gmp] = "--enable-gmp,--disable-gmp,gmp,${PN}-plugin-gmp"
>  PACKAGECONFIG[ldap] = "--enable-ldap,--disable-ldap,openldap,${PN}-plugin-ldap"
>  PACKAGECONFIG[mysql] = "--enable-mysql,--disable-mysql,mysql5,${PN}-plugin-mysql"
> --
> 2.17.1
>
