Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E92E6C433EF
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 15:31:57 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.10921.1653406310125695425
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 May 2022 08:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LpjuLGiP;
 spf=pass (domain: gmail.com, ip: 209.85.160.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id f35so2322896qtb.11
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 May 2022 08:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nT2PPeG0UR65sBfMi4eUKcVN0sSXtKE8BaLF8f35YBw=;
        b=LpjuLGiPQtmUbzTYOyTlT3mOtPmm2pW4Ts9qJpLs08Kji8g6CVdVzVzXYHoIuTF20b
         yb3kNH8mAOeIK9WEgOCF0dv5ObR2e8eCzKiOdh6g5zNF/a5+cJQSJuA3t2pAUUE6TrX3
         3Drl/IRT0mfnPYSRHu55gwhDLGB6C0Fx/Nrct0ttYnjZnEbiZrjtVq2lnqopmEy6DyxY
         21z3U3YO4Shmpl1E2jHgn36imAFNaLFUlRnmrsMUXpoA/HfYjQlZbTgF14qP+PdLUQAd
         ifJmkvTOYcIpYHAXDo11pPRUBNDH9a7pyvfjOwK7faWOvLaXSTB2ldcUfzgyGRvYqAq2
         6yog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nT2PPeG0UR65sBfMi4eUKcVN0sSXtKE8BaLF8f35YBw=;
        b=lL/1sEP1WwmFK+faC2yWbzXfQ9YGin/gN0d8M2aNFpkveylK27j4ymJBzOcp4EFwVN
         GUwd3EcgtgGJxokLC1EO0RgzrdUrHTP55tv3kSnJ16VfBX7i12En5PCPGT04eD2uWLLg
         3WprU0ZBx2vZvp8+/A9greNwk7BOLuw6Xpo4+CpGA7df5TXLSyOJzntn4lF5QknJ1jQ9
         DPvd7Xa3ttAdK1+jXV54O6EsaIJ3rGna89j3hgLQTPm8G1izkNTkoKGtOKRGA0ECa/Ge
         8ssG7pKsEzsnlER5F3782CcuJLJIPvrDbBzg7UJh/cQe+1CDEbZD/J/s/QLmMfi1DRby
         B1gw==
X-Gm-Message-State: AOAM53272GETyvTjxQYv8ezu86riBuEluAIAKoF3E+fCpuEHnOP+1Z+A
	DiasU/w6nFq+vOl6kpV5fHah7nC5V1StQhwrYXA=
X-Google-Smtp-Source: 
 ABdhPJyCCePwXZwL//DOMFomTuWs0C27Dtj4cLqFsdDogsJM2gvb7faTDp0CYcRp0E1ujNQXqZURZED7KTpe5+qkqaI=
X-Received: by 2002:ac8:7d44:0:b0:2f3:af0b:dec1 with SMTP id
 h4-20020ac87d44000000b002f3af0bdec1mr20218911qtb.634.1653406309175; Tue, 24
 May 2022 08:31:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220519131827.166725-1-brgl@bgdev.pl>
 <CAMRc=MfETFk_dWkd1RpgetXMJWgu=w5UAWgBVefRw51jSaYV0w@mail.gmail.com>
In-Reply-To: 
 <CAMRc=MfETFk_dWkd1RpgetXMJWgu=w5UAWgBVefRw51jSaYV0w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 May 2022 08:31:23 -0700
Message-ID: 
 <CAMKF1sqPXp8s36_Ua1rLXvxxDHtgikdhz-VZUFU_au04JfeXXg@mail.gmail.com>
Subject: Re: [meta-python][PATCH 1/2] python3-speedtest-cli: fix RDEPENDS
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 May 2022 15:31:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97256

On Tue, May 24, 2022 at 7:49 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Thu, May 19, 2022 at 3:18 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > There are packages missing in RDEPENDS needed to run speedtest-cli. Add
> > them and use += for the assignment as we don't know what inherited
> > classes may have added.
> >
> > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > ---
> >  .../recipes-devtools/python/python3-speedtest-cli_2.1.3.bb  | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-speedtest-cli_2.1.3.bb b/meta-python/recipes-devtools/python/python3-speedtest-cli_2.1.3.bb
> > index 06d98cbe1..472113b05 100644
> > --- a/meta-python/recipes-devtools/python/python3-speedtest-cli_2.1.3.bb
> > +++ b/meta-python/recipes-devtools/python/python3-speedtest-cli_2.1.3.bb
> > @@ -7,4 +7,8 @@ SRC_URI[sha256sum] = "5e2773233cedb5fa3d8120eb7f97bcc4974b5221b254d33ff16e2f1d41
> >
> >  inherit pypi setuptools3
> >
> > -RDEPENDS:${PN} = "${PYTHON_PN}-misc"
> > +RDEPENDS:${PN} += " \
> > +    python3-misc \
> > +    python3-threading \
> > +    python3-xml \
> > +"
> > --
> > 2.34.1
> >
>
> Hi!
>
> This has been in master-next for days but didn't get into master
> proper. Just a gentle ping.

Thanks for reminder, if you have not heard on it causing issues then
It will be in master in due course soon. Sometimes its other recipes being
sorted with current master etc. that delays merges

>
> Bart

