Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 836A1C4345F
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 14:13:33 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.19527.1713795204761325772
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Apr 2024 07:13:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M16+0BIu;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51b09c3a111so1884926e87.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 07:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713795203; x=1714400003; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Aae/TM+kmuB9KtFeeWpRNcARY4c8Yg2SHHNfdS/jIcc=;
        b=M16+0BIuf19XMd2IqJ5FBRg3AZ1cowz5sqSDejbX6ZDh74WlpsSYqEL2cWGgTZltw0
         zymWJvyuFj2i7rjsANjolFIqJHGeArmq+G6wBBN702wpsquOBCn+Uk9+RQ9ZbBED/Rmm
         ZYCT8qz9XI6LPkr5mlbv+bNf7gqavEUEmIRpK4OG/VlAQv0fze23i7fiplAPn4tioRdr
         b8Zx1FIKy+/vha9HDdm7YYPMIFiUw9AicEvCXEWpxm75ux/+g+D62vngehXZQEXNuaeF
         WhNXOCv2i6BAiV2Otk53RVis6rscICjf/YbzB6Xy3L64djw8r8Y/eBI81kuyTReHu4US
         yshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713795203; x=1714400003;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aae/TM+kmuB9KtFeeWpRNcARY4c8Yg2SHHNfdS/jIcc=;
        b=ovGzpHA5+dytDdWVRZcn6Tx/jL1BqTVV2GAL7IczxPcxjoFIpTZaaEA0GlWEUvt7wG
         acLp2OgI0X6Z46Br9eKg3dR463SyDJzhJUBPFm4T1CtykIcqxQQ9/Bi6iWy4ZkJc5T8q
         l6YuVF/kLW+gOpnwS7qyWEa2CCCCEH32ffXojfYJSwwAZMbviEkXT1xLbu1FVPeoAz4+
         EjFa6JSYKIOWytF6ttYWUX2SpFMz+4LqDBrup9OUBqYzqtDk8RToCb/tR741sFd7GPd1
         eBWSACkGverilpg16zyHtRj3CBBbhsQ+lvli2CyfVktOA5IrqPlkxEoB9vAGkBgeSwJ9
         GtyA==
X-Gm-Message-State: AOJu0YyNnecCPKMuMqpwNo4CbRH+ncc+/jGBkGon/VJ5a9bUg22c1mAq
	5DachTbn4maO2uZqNUTSV+ixMNOEWBciBxWjnOeY4qg4/wO3gjQmnyZYhdhcN61aeaLXOFt3sU+
	CNPdOVJr9y0PvSKe2i1FFi2w2atUXYQ==
X-Google-Smtp-Source: AGHT+IFhWAVQpclkOg8Ppm3BM4z+IwbGuMLQAiXipLsQrQqoUiuMrqkMq8JgU1m60XXjA2BgjR8JPoRqEukUTggasAg=
X-Received: by 2002:ac2:4986:0:b0:519:3c0d:d0b with SMTP id
 f6-20020ac24986000000b005193c0d0d0bmr6548418lfl.39.1713795202551; Mon, 22 Apr
 2024 07:13:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240422132347.3180714-1-joseph.mills@cnhind.com> <20240422132347.3180714-2-joseph.mills@cnhind.com>
In-Reply-To: <20240422132347.3180714-2-joseph.mills@cnhind.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 22 Apr 2024 16:13:10 +0200
Message-ID: <CANNYZj9MCDz=Wj1RNVe25UMxDozXsBqTVo97tvXVBGBpNVbJiw@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/1] [mesa] Update do_install as needed per upstream changes
To: joseph.mills@cnhind.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 14:13:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110104

Incorrect mailing list. Please read poky/README.md

Text of DSO is not needed in the commit message.

Alex


On Mon, 22 Apr 2024 at 15:24, Joseph Mills via lists.openembedded.org
<joseph.mills=cnhind.com@lists.openembedded.org> wrote:
>
> Signed-off-by: Joseph Mills <joseph.mills@cnhind.com>
>
> Developer's Certificate of Origin 1.1
>
> By making a contribution to this project, I certify that:
>
> (a) The contribution was created in whole or in part by me and I
>     have the right to submit it under the open source license
>     indicated in the file; or
>
> (b) The contribution is based upon previous work that, to the best
>     of my knowledge, is covered under an appropriate open source
>     license and I have the right under that license to submit that
>     work with modifications, whether created in whole or in part
>     by me, under the same open source license (unless I am
>     permitted to submit under a different license), as indicated
>     in the file; or
>
> (c) The contribution was provided directly to me by some other
>     person who certified (a), (b) or (c) and I have not modified
>     it.
>
> (d) I understand and agree that this project and the contribution
>     are public and that a record of the contribution (including all
>     personal information I submit with it, including my sign-off) is
>     maintained indefinitely and may be redistributed consistent with
>     this project or the open source license(s) involved.
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 6e96190084..f4fcf31df0 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -27,12 +27,12 @@ SRC_URI[sha256sum] = "94e28a8edad06d8ed2b83eb53f253b9eb5aa62c3080f939702e1b3039b
>  UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
>
>  #because we cannot rely on the fact that all apps will use pkgconfig,
> -#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
> +#make eglplatform.h independent of USE_X11
>  do_install:append() {
>    # sed can't find EGL/eglplatform.h as it doesn't get installed when glvnd enabled.
>    # So, check if EGL/eglplatform.h exists before running sed.
>    if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)} && [ -f ${D}${includedir}/EGL/eglplatform.h ]; then
> -      sed -i -e 's/^#elif defined(__unix__) && defined(EGL_NO_X11)$/#elif defined(__unix__) \&\& defined(EGL_NO_X11) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
> +      sed -i -e 's/^#elif defined(USE_X11)$/#elif ${@bb.utils.contains('PACKAGECONFIG', 'x11', '1', '0', d)}/' ${D}${includedir}/EGL/eglplatform.h
>    fi
>  }
>
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110101): https://lists.openembedded.org/g/openembedded-devel/message/110101
> Mute This Topic: https://lists.openembedded.org/mt/105669186/1686489
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

