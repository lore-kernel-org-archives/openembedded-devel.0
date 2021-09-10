Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web12.2795.1631233803722703451
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Sep 2021 17:30:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UGJNsrGY;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id a66so292463qkc.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Sep 2021 17:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6s7OouUJWEzMAopQbXDEw2ebOoPgZNcsOZ3BdCho71E=;
        b=UGJNsrGY9KJrHnzD7GvoOSgCOEzqBLyHiMLTA9y1yRv34SZ53OGb3xdKFxx6BuGlM9
         lA5U1+CNF5zda2743MNynuGoD310MvMGm6OhFl3qO0OiSA4jKZXKptLJtBf1pxnP8DF8
         npSgFNOCEOwIbOVOIkIwYVahQ5YsW6vC/YX+frACqiIF/CEA3xu727xoB5Yzz6wkfYLS
         pYIiiYtczuiwcOT8k7ekVRUAFDHUc+RAPN1N582qa+mqboZlw6wIT1a7+wK3aw5W/lLK
         jFc5kX3s0hQn209IpSPXQYdjTmtGWXgQ8PED5a8A8nAugvFA49sLwenXHxuMBBRm5LHP
         bLZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6s7OouUJWEzMAopQbXDEw2ebOoPgZNcsOZ3BdCho71E=;
        b=iQYsBYgMfEShVp/ngkJyjGAJwikzWaoDfRTxh+ULPVT1i3fa6cnhcf3YZRa3t+dMfn
         whoY7QgK8i2y8vqSb3Oou28cq2JfkiFq1iJn/8A8mjoQFJvhbJ1wgDXphJr/kwFl3MYa
         i0pSdgvJ5F0VPWNtb+VH/y7t2C/opswd6O5Ilyshe8fanMEkZqrFyXwvJOQ6TCAORrSq
         4gVP3zR67EIw1kJtTFaarZoBb8gJUiQ0joIUyfbdzz4cysZkCHBCXaADwPYKxkWzZhnc
         QsuGqTZZYsCmlYsizUVu/aldHUtvQ8V84WDWtfhTtzWF8hV0T+NxDO316I/HstCv/hTL
         y8SA==
X-Gm-Message-State: AOAM532UU+xMpMPVOTXPuwMECvrqGt1FUzk6IStJ/7+Suo9JRKORHfFB
	vqEeNbO/BYWW1uTlZjnGHQM9xTURgPri5UouK1ecFqCFsPs=
X-Google-Smtp-Source: ABdhPJxsznP6orF5miJXQdpFqDPxtyhFCTYYAMO81zToLZ0LaUWond0msvFGCwrNZu9IBNO419gop/2yx9jikUHgtwA=
X-Received: by 2002:a37:a04e:: with SMTP id j75mr5446795qke.98.1631233802529;
 Thu, 09 Sep 2021 17:30:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210909190030.74738-1-joe.slater@windriver.com> <CAMKF1sq8iVBodq3kMa0GxV2wkUyH-r6W=OwVg16AYrGYF1XU2g@mail.gmail.com>
In-Reply-To: <CAMKF1sq8iVBodq3kMa0GxV2wkUyH-r6W=OwVg16AYrGYF1XU2g@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 9 Sep 2021 17:29:36 -0700
Message-ID: <CAMKF1srUDJ_QBGabpGnSQXZju6ANL9H0qSpFD32MPwcqoCmg2g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/1] redis: advance to version 6.2.5
To: Joe Slater <joe.slater@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Randy MacLeod <randy.macleod@windriver.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 9, 2021 at 2:38 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Hi Joe
>
> Seeing reproducible issue
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1521
>
> can you take a look

nm, it seems it was an AB glitch.
>
> On Thu, Sep 9, 2021 at 12:00 PM Joe Slater <joe.slater@windriver.com> wrote:
> >
> > Pull in fix for CVE-2021-32761.
> >
> > Signed-off-by: Joe Slater <joe.slater@windriver.com>
> > ---
> >  .../recipes-extended/redis/{redis_6.2.4.bb => redis_6.2.5.bb}   | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-oe/recipes-extended/redis/{redis_6.2.4.bb => redis_6.2.5.bb} (96%)
> >
> > diff --git a/meta-oe/recipes-extended/redis/redis_6.2.4.bb b/meta-oe/recipes-extended/redis/redis_6.2.5.bb
> > similarity index 96%
> > rename from meta-oe/recipes-extended/redis/redis_6.2.4.bb
> > rename to meta-oe/recipes-extended/redis/redis_6.2.5.bb
> > index 0db71240e..58d759b59 100644
> > --- a/meta-oe/recipes-extended/redis/redis_6.2.4.bb
> > +++ b/meta-oe/recipes-extended/redis/redis_6.2.5.bb
> > @@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
> >             file://GNU_SOURCE.patch \
> >             file://0006-Define-correct-gregs-for-RISCV32.patch \
> >             "
> > -SRC_URI[sha256sum] = "ba32c406a10fc2c09426e2be2787d74ff204eb3a2e496d87cff76a476b6ae16e"
> > +SRC_URI[sha256sum] = "4b9a75709a1b74b3785e20a6c158cab94cf52298aa381eea947a678a60d551ae"
> >
> >  inherit autotools-brokensep update-rc.d systemd useradd
> >
> > --
> > 2.25.1
> >
> >
> > 
> >
