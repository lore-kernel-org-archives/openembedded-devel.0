Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1684C77B73
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 07:36:59 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web11.3817.1681457813149244080
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Apr 2023 00:36:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=iGKkV6Ix;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.222.46, mailfrom: brgl@bgdev.pl)
Received: by mail-ua1-f46.google.com with SMTP id a38so11275563uax.12
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Apr 2023 00:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1681457812; x=1684049812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Hpu1CGTtighdJ5IaUh/8+IcIoP09LQzDi1irj++g/E=;
        b=iGKkV6IxpOW1YoVM3+iTFiRYGhypUHhepW1AQH1Tr23+nI6NzqjBbcQDdpnUo1d612
         UQCo9Fq9yxfIB3pSouxesc5MOINhjigT4hMRCbU4QOWHwvfub/5Ce23hbL576UZyd0Sy
         2KhLLB1a8gwjb6CQ0sciEFmABZY9cL/F5Zqy/G7iNXc81Ol3zRMgT6D5SEPdASekQRc1
         NczwRqK/gZoawni7k3umL2GeAjAHuDGurT2azqfCDltSGM0j9JlkB6XomftA+jjFZ05E
         ZrJLKyBrouGh92ZknUEdnbjtgglySBf3EszdhWAnvdLa5TorxhGsYWrRsO5RHnyKUab9
         2cxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681457812; x=1684049812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Hpu1CGTtighdJ5IaUh/8+IcIoP09LQzDi1irj++g/E=;
        b=ic38/TUHm6O1gMhzczl0d63SIIDJAW9pa0+j5Ja8IIioPqVpWxuf7krKBk05Y0AtA/
         HIKwR/np1ajBHvIs6EgJNvnADYKt5OmGE19NvrbC06UjoeM186qfBOX/H/650bsP9YdL
         ES6Sw6xrJIpzGHLVb+mjMKdRlg2U8hk7xNGR9zGyMIv+n9uP4YA+87BmebsS/D6WMNsY
         S5FELYqNEJcaITwrxvNjyUSJfJMIU/wo6DWmdlOLrQv4GNe59C2SJ7HwHlNEWRWJpyzG
         0N5VuTRsht2RGjtO2vm4u/SS58vAnhWeAsm7B37wPStcR/l/PdRkf3EXrkdrL4jOJnek
         dy6g==
X-Gm-Message-State: AAQBX9eKHbwWRiVmXgAjT1raMF6w7IIQ6hPLAkDFQUYegIE5JhEsy1K4
	QoRLouX1KQipuh2YJ5VfwHMsPKI5y754VCTRVJZNjtq/Uj7zgCMm
X-Google-Smtp-Source: AKy350Yth+Yc4s4bjYXQuY4XBZNtIWNSUfxturvKWu0vGc/7lV21wHPyAMhKvlktMS8K09iX0f8CrabsdN33GIyG3hg=
X-Received: by 2002:a1f:9bc4:0:b0:436:3381:85c3 with SMTP id
 d187-20020a1f9bc4000000b00436338185c3mr2435746vke.2.1681457810610; Fri, 14
 Apr 2023 00:36:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230411131518.401912-1-brgl@bgdev.pl> <20230411131518.401912-4-brgl@bgdev.pl>
 <0d9fdcf0-4093-45cd-140a-990f01592e18@windriver.com>
In-Reply-To: <0d9fdcf0-4093-45cd-140a-990f01592e18@windriver.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 14 Apr 2023 09:36:39 +0200
Message-ID: <CAMRc=MeVUR4BiFYstjJzzE5fQxxy9m6YZhqudyquZjQhYNPi8Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 4/4] libgpiod: update to v2.0.1
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Sakib Sajal <sakib.sajal@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Apr 2023 07:36:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102089

On Thu, Apr 13, 2023 at 11:19=E2=80=AFPM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
>
> On 2023-04-11 09:15, Bartosz Golaszewski via lists.openembedded.org wrote=
:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This is a bug-fix release addressing bugs discovered since the release
> of v2.0.
>
> Should we drop the old recipe?
>
> =E2=9D=AF fd libgpiod
> meta-oe/recipes-support/libgpiod
> meta-oe/recipes-support/libgpiod/libgpiod-1.x
> meta-oe/recipes-support/libgpiod/libgpiod-2.x
> meta-oe/recipes-support/libgpiod/libgpiod-src.inc
> meta-oe/recipes-support/libgpiod/libgpiod.inc
> meta-oe/recipes-support/libgpiod/libgpiod_1.6.4.bb
> meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
>
> I think that v2 was added when it was a release candidate:
>
> https://git.openembedded.org/meta-openembedded/log/?qt=3Dgrep&q=3Dlibgpio=
d
>
> ../Randy
>
>

No! v1.6.x is the old major release that's still widely used and I
still maintain it.

Bart

>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  .../libgpiod/{libgpiod_2.0.bb =3D> libgpiod_2.0.1.bb}             | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-support/libgpiod/{libgpiod_2.0.bb =3D> libgpiod_2=
.0.1.bb} (90%)
>
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb b/meta-oe/r=
ecipes-support/libgpiod/libgpiod_2.0.1.bb
> similarity index 90%
> rename from meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb
> rename to meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
> index bdfd72f2e..50b9203a7 100644
> --- a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D " \
>
>  FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-2.x:"
>
> -SRC_URI[sha256sum] =3D "f74cbf82038b3cb98ebeb25bce55ee2553be28194002d2a9=
889b9268cce2dd07"
> +SRC_URI[sha256sum] =3D "b5367d28d045b36007a4ffd42cceda4c358737ef4f2ce22b=
0c1d05ec57a38392"
>
>  # Enable all project features for ptest
>  PACKAGECONFIG[tests] =3D "--enable-tests --enable-tools --enable-binding=
s-cxx --enable-gpioset-interactive,--disable-tests,kmod util-linux glib-2.0=
 catch2 libedit"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102057): https://lists.openembedded.org/g/openembedde=
d-devel/message/102057
> Mute This Topic: https://lists.openembedded.org/mt/98196930/3616765
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
> --
> # Randy MacLeod
> # Wind River Linux

