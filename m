Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54719C64EDD
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:11 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web09.14171.1650492519198932816
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Apr 2022 15:08:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FNnqIdjG;
 spf=pass (domain: gmail.com, ip: 209.85.222.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id s70so2314805qke.8
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Apr 2022 15:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wABFhmn2aojnUEBMSluZ/owtHsb17520ZbVKM7CQGZk=;
        b=FNnqIdjGZCGONUYLJN/1Q8OIhbP/PSm08+2TMwB5Jd2U6pbBSPiNsGVSh3MMz7qrD9
         Sjmom6sT7zUHfhmgWUeifDjMoLPC3prTrHFzqb6SKHoLc6/7F1dCHgsyoBN5yXA7xHaz
         WDjvMhXul0j4Jv8tPzmHRcwVtLACIQzx0RLjd4BBotDu47ofNwuB3O2o8+71n5tL/Eh2
         5PT5idg8evKInos53nvfaLD+R/l13dqwfa9wqL5Y7wiCMlnLnOi5bQh7q7MGfc9CHbKV
         oQY6YJZxCbAetI7mCVDlr+gUXFuFC3Txym7HzPl+IHeTbFEcdyQ8LCVt9+18K+iGDUJQ
         yFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wABFhmn2aojnUEBMSluZ/owtHsb17520ZbVKM7CQGZk=;
        b=1xlish+vcFMH0BTZRMlnOnL+YwXdVeQhvKODz/1GgICVFa3a6Hcs+qF0cF/9Z60LK7
         tmaPI64uuzN20Mew4NgZwh41epLs3jVzipl8ggP0WyoI+1ro6VeIezrsW/+FzRCnMRNt
         5+pIu0YjIEx/A75HVDH4jDT7hvYrK2Z7VTr3jfedWs3mFC7bSn9vBAvCF0jj+fkZocVd
         tOZ4czgvk+1YOOm2+sAI2IcdN6wyNNjV13PE4d3RvE+zwsn8w3a9lGIVB+4k3GvVdkBu
         o0QU2QWZ7SxfJGCkS9VimaCjjKFAUOKzaGp4beeN7Vr9B8j2+F9VXnZ7m5aDJOogrRkw
         VBXQ==
X-Gm-Message-State: AOAM532gReW3TBIz7zuDabrfEXCw5fXNYN/JZNZj3XHirC4TTxVmKg02
	4wDfRMR8FTtEAU60Cr4/2QdqPixvaJ67/yHgVIM=
X-Google-Smtp-Source: 
 ABdhPJynXBfdxLwzOtsXA7TnXButkrAJBLDAxGnjnkvfxmMl6rMlt1jFJVMb+n/Go9Hz7tmumaWPHjfZtMTMZ+/4vOU=
X-Received: by 2002:a05:620a:444e:b0:69e:d240:9cd2 with SMTP id
 w14-20020a05620a444e00b0069ed2409cd2mr4250405qkp.72.1650492518223; Wed, 20
 Apr 2022 15:08:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220420094227.2826875-1-dmitry.baryshkov@linaro.org>
 <97a9dad0-fb8a-3bf0-8ee7-f45494e37cf4@gmail.com>
 <CALT56yOZ=jr48+-9-Ko2AdqoK73_+KtG53yJRWgx25dSjQhuVw@mail.gmail.com>
In-Reply-To: 
 <CALT56yOZ=jr48+-9-Ko2AdqoK73_+KtG53yJRWgx25dSjQhuVw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Apr 2022 15:08:12 -0700
Message-ID: 
 <CAMKF1srk00kSdinLs=E3R_AsayTAtBk5Y3-6YPpcHdUC5+sFzA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] gpsd: split python utils from gps-utils
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96719

On Wed, Apr 20, 2022 at 10:43 AM Dmitry Baryshkov <dbaryshkov@gmail.com> wr=
ote:
>
> Hi,
>
> =D1=81=D1=80, 20 =D0=B0=D0=BF=D1=80. 2022 =D0=B3. =D0=B2 17:53, Khem Raj =
<raj.khem@gmail.com>:
> >
> > It does not apply on top of master-next, can you rebase
> > and resend please.
>
> I have rechecked, it applies on top of master-next w/o any issues. Did
> you push your master-next branch?
>

yes master-next is up2date but groking this patch from mailing list
via an email client
and then git am'ing it is failing, too mant hoops to jump for catching
patches so there could be something
wrong on the way. Regardless I have done the conflicts manually and pushed
to master-next, hope I did not miss anything

> >
> > On 4/20/22 02:42, Dmitry Baryshkov wrote:
> > > Neither gpsd nor significant part of gps-utils depend on python. Howe=
ver
> > > installing gps-utils package would require installing python, which a=
dds
> > > about 17 MB to the image size. Split away gps-utils-python to allow
> > > using gpsd/gps-utils in the systems with limited resources (or in the
> > > initramfs).
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >   .../recipes-navigation/gpsd/gpsd_3.23.1.bb    | 23 +++++++++++-----=
---
> > >   1 file changed, 14 insertions(+), 9 deletions(-)
>
> [skipped]
>
> --
> With best wishes
> Dmitry

