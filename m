Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web10.13144.1601351870176579830
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2020 20:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eEFGlT1X;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id w16so3155954qkj.7
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2020 20:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w6WuZdyK1jrcLaY1mnDvDxylgMYN/LRrTJR80yxDafQ=;
        b=eEFGlT1XwyVCZkKV5fS5ijKBOCet619YRD9JlEnCbrdg7NOAnZkFkDkGCDECznkCQ/
         tK1F+ZxswHCmz9exvCRRGtq8S1mjv74TK+1EkRdep2nHQtDbyJeAfRXo4KLfyw/EfKaz
         20kEAoswQ61DdigqPdvYCscxCJPO3W7QUhRTqOx/a1GUzrciy4/jYWZWmH1TbDJSXOSM
         YCQ7KfJnCxGq37WvRDlRS8vdxmc3M3E/jbQ/VadQ79QPCya6tO+hMOlO5r0iUqfNjJeL
         qwR5pHi/ggQ7fmJ7hXLtcFf5y2nulLHx9Vw946EZUqAb2vzYZ/unsTfYo8T/RlgVKkG9
         OQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w6WuZdyK1jrcLaY1mnDvDxylgMYN/LRrTJR80yxDafQ=;
        b=n+SH6LipBapWFljin1l5xNpVbac24k7dXsJiFkUFM6zdISUajlSaegcjaiR1f6ng3v
         ZmOCVIrAqaLPG+DsDRscGQLcfyOb3jORF22To2jM0gzzZCvSumd2UtCQhYwwTH3ShJ+D
         AO4rVW4/Boq+mZSAgdfTwIH6biKV2kuIrCzN20Q9iITke7qwmS6AP6TKbmGeLQS6PpyM
         eHOH5tQcIwM1nyxW86wKE2A4N7Ec6DxiRfAgKIUhRblYfOds69GAvg2JeGUw011tvRVm
         b9tRTU9f6tfLgmVEamVvxeSTrlBL8AvDxzbnE7JfppZ6BSzuceo8HYagY4MA0VR1TY7F
         d/7w==
X-Gm-Message-State: AOAM530Is2drVQ2yniWgPWopXrjmnooeTjy5al/Hid+3Qqorg26pBYbk
	zKt6fyVS+ekiW6+mDkEuRSvI7c+iypkDSrOdRjM=
X-Google-Smtp-Source: ABdhPJymfIaWGY7+cT6a0FgLa9a06VAYhK3x5fb27f12EW1BoEQNbzVaDTFnBiRfMih4KGt7qihC3Lt560c5I9K5dsE=
X-Received: by 2002:a05:620a:1670:: with SMTP id d16mr2695650qko.474.1601351869205;
 Mon, 28 Sep 2020 20:57:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200929033344.120687-1-okaya@kernel.org>
In-Reply-To: <20200929033344.120687-1-okaya@kernel.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 28 Sep 2020 20:57:23 -0700
Message-ID: <CAMKF1spq1W9fKgyVX96nNYY5q2M268Dvs26LqTGy8QYcijq4sA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] collectd: make rrdtool and rrdcached optional
To: Sinan Kaya <okaya@kernel.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 28, 2020 at 8:33 PM Sinan Kaya <okaya@kernel.org> wrote:
>
> rrdtool plugin pulls x11 library dependencies into the target.
> It should be only set on need basis.
>

I do not see x11 in either collectd dependencies or rrdtools, is that
an oversight ?

> Signed-off-by: Sinan Kaya <okaya@kernel.org>
> ---
>  meta-oe/recipes-extended/collectd/collectd_5.12.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb b/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
> index 40a8442a53..b9e735f27d 100644
> --- a/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
> +++ b/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
> @@ -49,6 +49,8 @@ PACKAGECONFIG[libesmtp] = "--with-libesmtp,--without-libesmtp,libesmtp"
>  PACKAGECONFIG[libmnl] = "--with-libmnl,--without-libmnl,libmnl"
>  PACKAGECONFIG[libatasmart] = "--with-libatasmart,--without-libatasmart,libatasmart"
>  PACKAGECONFIG[ldap] = "--enable-openldap --with-libldap,--disable-openldap --without-libldap, openldap"
> +PACKAGECONFIG[rrdtool] = "--enable-rrdtool,--disable-rrdtool,rrdtool"
> +PACKAGECONFIG[rrdcached] = "--enable-rrdcached,--disable-rrdcached,rrdcached"
>
>  EXTRA_OECONF = " \
>                  ${FPLAYOUT} \
> --
> 2.17.1
>
>
> 
>
