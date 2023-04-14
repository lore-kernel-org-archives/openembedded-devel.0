Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D931CC77B70
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 07:42:19 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web10.3758.1681458138015663302
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Apr 2023 00:42:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=F7vJh0gB;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1842cddca49so21230828fac.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Apr 2023 00:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681458137; x=1684050137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVtToVBiEegGCrhpWBJPJupRwMWk47tYp1+evXP/WCk=;
        b=F7vJh0gBFJ3zjpeZZM/IscKL27jkOeiz8YST5N1xZBbHY7gGIroBahS6zS7MvhGnIR
         Ew29H9HSgOCOcz3V3X1K5mIsXnq6EBacp7kjbewKU4r7Zj1qNpSqd/xE2ObIZifZMe+d
         /pKqClOrXeOx9VRcEOFz2tKo9/GlfqZ/wW8ALttEaS9QF8zyoW3vFsNX+OZnKkNqxDuN
         4JoW9+tQcxfNwsxSW5GuB8cQy/UJO1zIYj8zpdLVILgTyxgL/UiEWgr3ujEh43GpA0rG
         G3Aps7xuXgP2wZZ7sLqzNIel8s0GmUuB+xQknTkMh9q/QjZ7uf0co0QtQSxoVsWHBtiM
         FFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681458137; x=1684050137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lVtToVBiEegGCrhpWBJPJupRwMWk47tYp1+evXP/WCk=;
        b=fqqyqIproJ73Ub8ihQH4cVVwtIvIBjmSAVbA/ZTI+L2hAaLiqhPZLdDW2qoCVngmeO
         vURR9eNW58JR3GPv5ybGXD/llye9B0ACVth4UsTIYP2SfJ7MeGV4LhvXamsieCoTleX7
         zGAIPLFo8BIfK1q/xQrZFNrZnuS0VqK9PQK87QnfDai35LzinuWrAS7jRuw7/cjk3Aw4
         gE380M+SayxNBPoXC6VrHy1ALwevfetyvRQep6XqT9EV+cNNrkiBAOc3iqGHbjgj5566
         je/1oG9W4E/vPV0zoLB3J2YStqIviBMIvFrZ5KCsZdGKi2hEmI7792fJD4+SKHZBDvqC
         Gk0A==
X-Gm-Message-State: AAQBX9cOI2NFxjUnyDZb0WZOeI//B7NCRoK/Ydanxslxt0q8IBtn5h8S
	+GGuUJDsnF8dv1VA1xAZa8OpTtW/OMNgcDbRg9c=
X-Google-Smtp-Source: AKy350Y8BkN/QKRgVIXnPT3Sk8heKklW6e93jccgh3uPypEV45pa652UehMPQj2jDSsdVMQMglo5mWKflJ0WlGsS0Fw=
X-Received: by 2002:a05:6870:9708:b0:183:fc80:7361 with SMTP id
 n8-20020a056870970800b00183fc807361mr2595509oaq.4.1681458137227; Fri, 14 Apr
 2023 00:42:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230411131518.401912-1-brgl@bgdev.pl> <20230411131518.401912-4-brgl@bgdev.pl>
 <CAMKF1spb_w1q6dy2GApO=UyoGm67jnuOfPG55dKbh78Dk6cPCg@mail.gmail.com>
 <CAMRc=Md6AsrBea7NE6odvAxG0bJ7j4Nm3+k48Xij-KPwO=Ps6w@mail.gmail.com>
 <CAMKF1sraz6M2hVAL5wqwnFWpe4+V5dggn1FMCYyn4U0PfnPCzA@mail.gmail.com> <CAMRc=McxyOcsCrPRvVM=OLoeyFHJeZVNLs6rp0XeBd3LuodOMg@mail.gmail.com>
In-Reply-To: <CAMRc=McxyOcsCrPRvVM=OLoeyFHJeZVNLs6rp0XeBd3LuodOMg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Apr 2023 00:41:51 -0700
Message-ID: <CAMKF1sogPatjGj4VPb5XZ3bQ2sN0oMLXCM7Dyx1Ddp-XA0Ky6g@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 4/4] libgpiod: update to v2.0.1
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Apr 2023 07:42:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102091

On Fri, Apr 14, 2023 at 12:38=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> On Fri, Apr 14, 2023 at 9:28=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > https://errors.yoctoproject.org/Errors/Details/699672/
> >
>
> Ah, I need to remember to always test with clang...
>

Not clang particularly, but with ptest enabled distro feature
the recipe has deleted

PTEST_CFLAGS =3D "${@bb.utils.contains("PTEST_ENABLED", "1",
"-I../../tests/gpiosim", "", d)}"

but its still referenced.


> This looks like a different bug than the one spotted in libgpiod
> v2.0-rc1, it appeared now after switching to python3-build based
> build.
>
> I'll take a look.
>
> Bart
>
> > On Thu, Apr 13, 2023 at 11:21=E2=80=AFPM Bartosz Golaszewski <brgl@bgde=
v.pl> wrote:
> > >
> > > On Fri, Apr 14, 2023 at 3:19=E2=80=AFAM Khem Raj <raj.khem@gmail.com>=
 wrote:
> > > >
> > > > still seeing these errors
> > > >
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2=
659/steps/14/logs/stdio
> > > >
> > >
> > > Seems like this is from python3-gpiod. Can I see the recipe logs some=
where?
> > >
> > > Bart

