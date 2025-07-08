Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFFBEC83F09
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 16:33:57 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.843.1751992432573098017
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 09:33:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DfhB8Q45;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-711756ae8c9so31808427b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 09:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751992432; x=1752597232; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXURNVqsWegzqJwYsIR/t5W9828ATuSzH9yKM1YQMYk=;
        b=DfhB8Q45F8AGt3TnSGwP7RAILSOCCVcb8oI0xwNtLPc9yW8PoFEaCu/yr25pCF6OKY
         QGiDY60qFyiNE2cVjz+KYpOeiM2hl1VvaMXeIExglbqW5hauoSMxFEWTSiN/PCftBUKa
         mPKNjeWmReOjcWRcqDUjRGMp1vLTWtfiUTRBX8Q90lRjr17NtxM8aQXOBw5SyRIq26dW
         BDq7nOJQ/sjPTuqpxlAIr6B52OmOmBtzyHwPWgLHQkDHNeYwvgWQxwPle4SFC9hRxwoF
         /PasouTIaRzt/sCNGLtajpIuXfwg0IYCNmBtaNeirwn2oC6W9m82y5Xzd2CQXuCo3NKi
         dqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751992432; x=1752597232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lXURNVqsWegzqJwYsIR/t5W9828ATuSzH9yKM1YQMYk=;
        b=R5TNUKAd/BE+zDipjdl/3HtjkJ6fGA4w/Gq76Y2X18mWELlSPH8EbkurLzyhBBZDAD
         08yqOC18Ri5AZqSU+uT9pXyVZ/BO8gq0KrkLcKDSoxI/6kvaFnt1cZ0mm4aZmjibUF6Y
         G+kKKvesRTf283g7dtJCYofaQ7G03dLu5iCG4bJAZyctxK3nWKwLTmoOHLIS3QWDNo7L
         pM/EHRyS8aTvbsN7j5HX1PcY5/l8q/ig5YbGG+6oOavfe/TdFzQMVXEaV089/JiGY7gn
         kMEa/XTYBnhcM20+xZ8kbFt+fvCG1BVmsP6zJRT1I0pka1Yt4WP7mfXlQOafgY0tl/as
         71Yg==
X-Forwarded-Encrypted: i=1; AJvYcCVoG+fwguzgfW15fej/sraji+/NNaku9x5cp/Wy/1QFvFEFOq4V8oFr/smkDm9u7vTDjwfiNBIlLztx9LWiizhd1xA=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz3u3FuT8/rtkz4HyF5DvyktCbjizLOnsdp3ZhKG/z3sbyHowrp
	pTVvHPCkfteXW8S/W1rCxHaF3EdYRHi55KgQbY5dhhaS8YJFBZe2EWKZUeybBn1yjfABQaXIhQH
	pq0Y4GqeKCifTRBPslhecuDAAOSwr/2s=
X-Gm-Gg: ASbGncsCG74qV/Z33sJlnubIXpQi8sSAbfsao8yNaLp4nPPzgGY8HiNNKvutYdATzTE
	SQPoYnA3z8FEVhGvZnEPaLzFAEqjj5/Txua2KO6/1eQ6tzQH6WuwSHW8cFwpeAWpX/iii/tfg/S
	KmqR4O4WsI3DiWVqazc7QbiY5sB2ExACXZ6miK94PCWQ==
X-Google-Smtp-Source: AGHT+IHcXovKlbpwLHFfZcJB7ataZUeyj7edqVhC3DGmtWMwlqSgB9FowwR6StaLI7N+eii3NlvM0kpzJzBhUPBNLUQ=
X-Received: by 2002:a05:690c:281:b0:710:edf9:d940 with SMTP id
 00721157ae682-717ae11bd18mr6534287b3.36.1751992431385; Tue, 08 Jul 2025
 09:33:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250625144522.189693-1-brgl@bgdev.pl> <CAMRc=Md=exc9r+cRi+GXV_5DvJAEVXfnMk_0JmbtSCTdnbs12g@mail.gmail.com>
In-Reply-To: <CAMRc=Md=exc9r+cRi+GXV_5DvJAEVXfnMk_0JmbtSCTdnbs12g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Jul 2025 09:33:24 -0700
X-Gm-Features: Ac12FXwHWxhHEnmnOP4kI7SCMjl6pQbhB64Rx1E4u7Oi5UbDJPBOH9F6Wy1nJeY
Message-ID: <CAMKF1so8igA1V-MNXyN3geOhf4j4eruHB6x65Zn_+OuThZR6fw@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] libgpiod: update to v2.2.2
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 16:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118317

On Tue, Jul 8, 2025 at 12:33=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Wed, Jun 25, 2025 at 4:45=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > This is a bugfix release addressing issues in tools and core library. N=
o
> > API changes.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  .../libgpiod/{libgpiod_2.2.1.bb =3D> libgpiod_2.2.2.bb}           | 2 =
+-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-oe/recipes-support/libgpiod/{libgpiod_2.2.1.bb =3D> libgpi=
od_2.2.2.bb} (98%)
> >
> > diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.1.bb b/meta-=
oe/recipes-support/libgpiod/libgpiod_2.2.2.bb
> > similarity index 98%
> > rename from meta-oe/recipes-support/libgpiod/libgpiod_2.2.1.bb
> > rename to meta-oe/recipes-support/libgpiod/libgpiod_2.2.2.bb
> > index 93c3e3b92d..09b0928dfa 100644
> > --- a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.1.bb
> > +++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.2.bb
> > @@ -13,7 +13,7 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${BPN}-2.x:"
> >
> >  SRC_URI +=3D "file://gpio-manager.init"
> >
> > -SRC_URI[sha256sum] =3D "0e948049c309b87c220fb24ee0d605d7cd5b72f22376e6=
08470903fffa2d4b18"
> > +SRC_URI[sha256sum] =3D "7e3bff0209d75fbca2e9fcff1fd5f07cc58b543e129e08=
b6d4bb1e4a56cfec0d"
> >
> >  # Enable all project features for ptest
> >  PACKAGECONFIG[tests] =3D " \
> > --
> > 2.48.1
> >
>
> Hi!
>
> Gentle ping, as this patch seems to have been lost on the list.
>

Thanks, I picked it now.

> Bart

