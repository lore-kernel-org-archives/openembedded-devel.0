Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 696EBC77B7A
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 16:12:38 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web11.1477.1685463152364063969
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 May 2023 09:12:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=OssTNHlc;
 spf=pass (domain: gmail.com, ip: 209.85.161.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-557d1360112so1142907eaf.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 May 2023 09:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685463151; x=1688055151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgzGhn1KOw7ur2TDsVBGNmmlv79j4qjTQ/Pv9ojD5Tk=;
        b=OssTNHlcQFAKlrbterrcsN+zeXvRrccFwWn3VdkdFO/xWm+JMpPJTf5hVBziU3U0oM
         PXpX9Rbu6lXiHnUTRkX7M0AkVtAtD7l+eA5+qzVfP5UlFOpvZ1nSVfB4PeoSDN5zT3vl
         +FBEr7OTcxXgdjilSnsqapfWLxzpsLY5YAmnMFwst/VUeUEu4Q1SuHT7KyNzzEzgFLLa
         3deSCJG9TGPAzTo7jvJbsrys2Kl4rD/+OMD0xmh5tOCfOst4wpIl8XwGRMoH4bqX5ypK
         IlSvHbch5U61BkDxEkR+0PUqc7/puo2iTUXde7lOb+oN96FU+lEwtuOG63jW1JJFax+6
         ojuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685463151; x=1688055151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HgzGhn1KOw7ur2TDsVBGNmmlv79j4qjTQ/Pv9ojD5Tk=;
        b=lssi0IYhHKih+mcWTCOkpJf8eDXb1yYz2M+CZyTjAFd9a51hemOvS6ubyobUjg+WIv
         uOJCG6yP4JymakbkCdWzG8y32RLGunTvWykOgHSQsm11eIAz9g2SL8I5r2TI01q1b0B7
         zX9p9nUzLjTXDcUL7dShlZxLqv8ymOk3zCge6dTHP+pUFcn31JBzDslW/AFqORv0Tzfh
         Yej5ERAT2zZPtog03f1N6h2ETKlOSqJStRyKgWa66Hp3OoZx+DilOgEw2At3ucc8Z6GE
         K1qZ93cFP5JFQLS0sUzDB4k1KlUcPkjEaej+ipb6hZornL99ggQi8PwPt11gYqmEc9UP
         7dtQ==
X-Gm-Message-State: AC+VfDzkoJUsk9RWG27CckE1V0ps0JG+LSaeQE0qcMKTit+o/bsRkbwU
	pgtAsX8lx/uqJJAj6VjNTk4SwH+1gPOtBBRm8H8=
X-Google-Smtp-Source: ACHHUZ5wIC8wJw8O/Sm7Sen+Vw1kkh4didt833iTBrJwM9VPbt8dnxaKuEdft/DD292m3m/dLDD1U+PnO1WVQxIyvqc=
X-Received: by 2002:a4a:4585:0:b0:555:9b48:93de with SMTP id
 y127-20020a4a4585000000b005559b4893demr1168290ooa.5.1685463151517; Tue, 30
 May 2023 09:12:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230519052617.2747159-1-schitrod@cisco.com> <SJ0PR11MB6717297349042BA59351FBB2DC4B9@SJ0PR11MB6717.namprd11.prod.outlook.com>
In-Reply-To: <SJ0PR11MB6717297349042BA59351FBB2DC4B9@SJ0PR11MB6717.namprd11.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 30 May 2023 09:12:05 -0700
Message-ID: <CAMKF1somw8Oxxe7QsQv-zOqE7mx4=WrbnH2y4F4Y=rg5CbT0jg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] gnulib: Update recipe name to 2018-12-18
To: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at Cisco)" <schitrod@cisco.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 May 2023 16:12:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102899

On Tue, May 30, 2023 at 2:27=E2=80=AFAM Sanjaykumar kantibhai Chitroda -X
(schitrod - E-INFO CHIPS INC at Cisco) <schitrod@cisco.com> wrote:
>
> Hi all,
>
> Any update/comment ?
> @raj.khem@gmail.com can you please guide me on how to procced further ?
>

the master branch has gnulib_2018-12-18.bb so this patch is not for
master. which branch are you referring to?
if its for a release branch then we do not allow version upgrades only
rare exceptions, I will leave it to Armin if its for a release branch

> Thanks,
> Sanjay
>
> -----Original Message-----
> From: Sanjay Chitroda <schitrod@cisco.com>
> Sent: Friday, May 19, 2023 10:56 AM
> To: openembedded-devel@lists.openembedded.org
> Cc: Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at Cis=
co) <schitrod@cisco.com>
> Subject: [meta-oe][PATCH] gnulib: Update recipe name to 2018-12-18
>
> As per gnulib_2018-03-07 recipe information, SRCREV =3D "0d6e3307bbdb8df4=
d56043d5f373eeeffe4cbef3"
> This revision was committed on "2018-12-18".
>
> There is a discrepancy between SRCREV and the recipe version.
> Which reports "CVE-2018-17942" as unpatched.
>
> To report "CVE-2018-17942" as patched,
> We need to align a recipe name with SRCREV commit date.
>
> Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
> ---
>  .../gnulib/{gnulib_2018-03-07.03.bb =3D> gnulib_2018-12-18.bb}      | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)  rename meta-oe/recipes-=
support/gnulib/{gnulib_2018-03-07.03.bb =3D> gnulib_2018-12-18.bb} (100%)
>
> diff --git a/meta-oe/recipes-support/gnulib/gnulib_2018-03-07.03.bb b/met=
a-oe/recipes-support/gnulib/gnulib_2018-12-18.bb
> similarity index 100%
> rename from meta-oe/recipes-support/gnulib/gnulib_2018-03-07.03.bb
> rename to meta-oe/recipes-support/gnulib/gnulib_2018-12-18.bb
> --
> 2.35.6
>

