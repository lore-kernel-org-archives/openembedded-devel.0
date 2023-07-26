Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39006C0015E
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 09:26:29 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web11.7231.1690363581462389851
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jul 2023 02:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=iAg4RuHN;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-569bad45b63so474113eaf.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jul 2023 02:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690363581; x=1690968381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AmqY+cDCd7oF0r480m6PW0dX0gBieqZCkQzqg/2v/8k=;
        b=iAg4RuHN4kA0efg9EEAtxYcgRn4xi2y2bNYE2fdFxx3mpGEspEI4B6+0gIh4rHKpuI
         dEWLxdPXE2jZBGxkB9Kho2nH+S4bU4euRABhBKskJzB214BEDBVFQBK1T5bQuUeA68RD
         4j+mZKbSsT/C/JEVd0iiIbWGIp1f5ch7ALbiuLQ+G77aIbXOnIi9Bzswf0PeNn0IyUF3
         2AqP2Ya7kJ/5h5hRFFNsaIfM6sbfNxwVQRbK1uCsHmMNxMuzWfpCNgrfH1niFHCjrX7i
         OUQNiUYYejK2B9qkpqsxXnXdMoMTZzZmtvzVnJaIyKR1ktY/+wSCpC+9CGWwiRRjUof2
         0Wnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690363581; x=1690968381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AmqY+cDCd7oF0r480m6PW0dX0gBieqZCkQzqg/2v/8k=;
        b=l3OZV645/Ji9odzBCivuulzP9M1ATkembAg524DtvrggV0wS5RX/ReDjnk2zted6UA
         svQ3FfAlDQyfCPE9Ujs8l+NhactFhsEEQKZOxdglV6fsM+VzqM4ROYXTWMTClJIklCWS
         GB7GZrvs+RtcIG3BNsMbkGztJ0YQKi536diNoM0OEQr5yIes+8suWU6ki1gmUSzB/EXP
         KyTDzSm6BIxmVISRzHB2EVCcyrginchiJp47uRaJZrtWYCPMwMVyPCLgR8IaDxBNHUZt
         RbxtFVibSeS5mPoyrOlcKUpgyPik4lOBYfRpTSE4x9uwF8nDoN+ZaFermZTdJ0WQ9JTg
         g9zQ==
X-Gm-Message-State: ABy/qLai95WGQ50Nb7wMPcNWbAU6lsEwC/3PL5jsEcdcwDAGBml99m+9
	BLN/VCCbMcPdOXHOZC9suWjAaugN7mVdtkXmhpE=
X-Google-Smtp-Source: APBJJlG73r6zE4rUuBK5VLwLDz8xIN7Vtbs8J8hroNQznriERT7tnQhATGpV81KeeGxL4I9FmYnCK4Lls8WmSi5lPSQ=
X-Received: by 2002:a05:6808:130e:b0:38e:e5b5:493e with SMTP id
 y14-20020a056808130e00b0038ee5b5493emr4295116oiv.11.1690363580628; Wed, 26
 Jul 2023 02:26:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230724113527.141274-1-andrej.valek@siemens.com>
 <23f21fb658e12efe80dce29b82c1fa87cd60874d.camel@siemens.com>
 <CAMKF1sq0SUzD6EG1OoqwD-3uuC5j1BczOKQjb8a6=wKJJRf6jw@mail.gmail.com> <0ef0267c66a001318d7dfac1543b3b70bc665c51.camel@siemens.com>
In-Reply-To: <0ef0267c66a001318d7dfac1543b3b70bc665c51.camel@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Jul 2023 02:25:54 -0700
Message-ID: <CAMKF1spxYzhjtwTintKFFB0GqLQ_FWMzTT04Tnp=7V5jVYM3hQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] cve_check: convert CVE_CHECK_IGNORE to CVE_STATUS
To: "Valek, Andrej" <andrej.valek@siemens.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jul 2023 09:26:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104034

On Wed, Jul 26, 2023 at 1:46=E2=80=AFAM Valek, Andrej <andrej.valek@siemens=
.com> wrote:
>
> Are you sure?
>
> I see it here :)
> https://patchwork.yoctoproject.org/project/oe/list/?series=3D&submitter=
=3D178&state=3D*&q=3D&archive=3Dboth&delegate=3D
> https://patchwork.yoctoproject.org/project/oe/patch/20230724113527.141274=
-1-andrej.valek@siemens.com/
>

I remember now, it failed to apply on master-next and I ignored it.

Failed to apply patch:
error: meta-oe/recipes-devtools/php/php_8.2.7.bb: does not exist in index
hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
Applying: cve_check: convert CVE_CHECK_IGNORE to CVE_STATUS
Patch failed at 0001 cve_check: convert CVE_CHECK_IGNORE to CVE_STATUS
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

So perhaps it would be good to rebase and resend.

> Regards,
> Andrej
>
> On Wed, 2023-07-26 at 01:31 -0700, Khem Raj wrote:
> > On Wed, Jul 26, 2023 at 1:09=E2=80=AFAM Valek, Andrej <andrej.valek@sie=
mens.com>
> > wrote:
> > >
> > > Hello Raj,
> > >
> > > Not sure if you realized, that I made a huge "conversion" for meta-oe=
 as
> > > same as
> > > here
> > > https://git.yoctoproject.org/poky/commit/?id=3Dc15e506a4674e558922c5a=
75512ca2b5c296cd44
> > > .
> > >
> > > Could you please take a care of it?
> >
> > This patch did not appear in patchwork perhaps some issues with size
> > maybe I have no idea.
> > Can you resend
> >
> > >
> > > Thanks,
> > > Andrej
> > >
> > > On Mon, 2023-07-24 at 13:35 +0200, Andrej Valek wrote:
> > > > openembedded-devel@lists.openembedded.org
> > >
>

