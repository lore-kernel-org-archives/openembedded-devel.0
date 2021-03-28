Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.13717.1616970850239199762
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Mar 2021 15:34:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SBiGcLDJ;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id q26so10808938qkm.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Mar 2021 15:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cYgldLn2IS6wClPVRnoVNhxsil2HpfjopVDCwrmYd40=;
        b=SBiGcLDJ1lX1E/i+O6/v97JjHkelJ+76rQ9WStPBKH8dcDxbRPlRVvoHaq6TizUr2o
         XS18J0Yv1bs3m5X9QoXjo+YudZxM6gUyEqhH+VJvEKwFmllIq/rWJlUeb5oUvk8ikKlY
         e2kE8ZLhFm+Esv194opMuLE1Xc7c2BL3tWBH4kS7VF6KZUBoZzQFmZ4kXV8azwR7Si0W
         /9wXu/jNJykPCnFqc1CADqy7WHnrJ5EX+JG6Yfg7nXKyNY58ynXRVMF1xPWYwTvE5+o3
         IhINoeZQuaCbzlgRy+YWkpNMZAUs/m/hYJeJ6WiwXAXI9I/GgIMPojCcWkh3GTftChm/
         rBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cYgldLn2IS6wClPVRnoVNhxsil2HpfjopVDCwrmYd40=;
        b=umZSAn/3bQk8yny0Y6dk0X38Oo1TIV1/nh/hd3XO/YG0p6D9FyoJi80Q7KiCHskkI9
         s0AvsoHKO4/wLyXykbCDkZZESTtk4Znuc3suF0phhiWXlOzft4PRrtBb/s2W+ClfeCJQ
         XCi+BaRBwQLz3oi12Lqh9yLNeae3TprFn6L0Kh0OaDMUX6+IKEjIyr03AbuFN+Q8t7/E
         DMXiKZhYE83NZTxqqCdyobaqlm/sYt3SB4QPSjUSYv3RWcu1x6fUv6kz5Qor5h3MVDlH
         dtCoBE7bEGO4juG1TyM/RHP6zg0FdytJwdjZ00SvnNI8LcX03/2GFcgy5bUbB/JSH7KX
         +srg==
X-Gm-Message-State: AOAM532SmyDd2XEzWT+hyKGgOKdJ8mkXOvcqZJv3rVvq8oukkusuj6FA
	W13PP3L1sWFj9VTzw1EE97IOhw/GAupLJTPtNbs=
X-Google-Smtp-Source: ABdhPJyjwFGKXsmr75NA4BMgr6KYKNPSdlW7ORVqJXu2HtdUGLYSxdqvUoIQeX6v5k5QWt3KunDMjVUoPAZBsJklz6E=
X-Received: by 2002:a37:8ec4:: with SMTP id q187mr22665501qkd.381.1616970849423;
 Sun, 28 Mar 2021 15:34:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210325070600.1335182-1-raj.khem@gmail.com> <bcac6cd8-ea83-8512-59af-2fe95e4726a8@gmail.com>
 <CAMKF1sr07Z1dx4decfUZp7jBizp61PAcjbKhaOS+4U6CH7BqyQ@mail.gmail.com> <78523e8e-f833-85d8-bade-6051de21329a@gmail.com>
In-Reply-To: <78523e8e-f833-85d8-bade-6051de21329a@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 28 Mar 2021 15:33:43 -0700
Message-ID: <CAMKF1spTGCTv7m2vtLEnK3FpQDkWe0otqekjuTTu6AKnMfqH5w@mail.gmail.com>
Subject: Re: [oe] [PATCH] cryptsetup: DEPEND on renamed util-linux-libuuid
To: akuster808 <akuster808@gmail.com>
Cc: Luca Boccassi <luca.boccassi@microsoft.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 28, 2021 at 3:30 PM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 3/28/21 2:59 PM, Khem Raj wrote:
> >
> >
> > On Sun, Mar 28, 2021 at 2:10 PM akuster808 <akuster808@gmail.com
> > <mailto:akuster808@gmail.com>> wrote:
> >
> >     I am seeing a build failure with this change after updating both core
> >     and meta-oe to latest as of today.
> >
> >
> >     bitbake cryptsetup
> >
> >
> > Please update oe-core to the push that went in today
>
> As an RDEPENDS including "util-linux-libuuid" make sense but there is no
> recipe called "util-linux-libuuid" to use as a DEPENDS.
>
> Am I missing something?

see https://git.openembedded.org/openembedded-core/commit/?id=65efd76198ad805060fe28714765cd423fa748dc
>
> -armin
> >
> >
> >
> >     ERROR: Nothing PROVIDES 'util-linux-libuuid' (but
> >     /home/build/releases/master/meta-openembedded/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.5.bb
> >     <http://cryptsetup_2.3.5.bb>
> >     DEPENDS on or otherwise requires it). Close matches:
> >       util-linux
> >       util-linux-uuid
> >       util-linux-uuid RPROVIDES util-linux-libuuid
> >       util-linux-uuid-native
> >     ERROR: Required build target 'cryptsetup' has no buildable providers.
> >     Missing or unbuildable dependency chain was: ['cryptsetup',
> >     'util-linux-libuuid']
> >
> >     The recipe in core is not  util-linux-libuuid, its util-linux-uuid.
> >
> >     Do I need to cleanup any thing?
> >
> >     -armin
> >
> >     On 3/25/21 12:06 AM, Khem Raj wrote:
> >     > OE-core recipe is called util-linux-libuuid now
> >     >
> >     > Signed-off-by: Khem Raj <raj.khem@gmail.com
> >     <mailto:raj.khem@gmail.com>>
> >     > Cc: Luca Boccassi <luca.boccassi@microsoft.com
> >     <mailto:luca.boccassi@microsoft.com>>
> >     > ---
> >     >  meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.5.bb
> >     <http://cryptsetup_2.3.5.bb> | 2 +-
> >     >  1 file changed, 1 insertion(+), 1 deletion(-)
> >     >
> >     > diff --git
> >     a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.5.bb
> >     <http://cryptsetup_2.3.5.bb>
> >     b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.5.bb
> >     <http://cryptsetup_2.3.5.bb>
> >     > index 5faaada4b7..0da9a26e83 100644
> >     > --- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.5.bb
> >     <http://cryptsetup_2.3.5.bb>
> >     > +++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.5.bb
> >     <http://cryptsetup_2.3.5.bb>
> >     > @@ -13,7 +13,7 @@ DEPENDS = " \
> >     >      json-c \
> >     >      libdevmapper \
> >     >      popt \
> >     > -    util-linux-uuid \
> >     > +    util-linux-libuuid \
> >     >  "
> >     >
> >     >  RDEPENDS_${PN} = " \
> >     >
> >     > 
> >     >
> >
>
