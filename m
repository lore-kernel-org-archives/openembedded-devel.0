Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC6E7C67861
	for <webhook@archiver.kernel.org>; Mon,  8 Apr 2024 16:12:52 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.111153.1712592770470778994
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Apr 2024 09:12:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gNQ7dCY4;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-22e6b61d652so1470887fac.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Apr 2024 09:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712592770; x=1713197570; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SiykdWWpZFWPpuhgtHiyv2OJtp6umj8v68RDBXJgStk=;
        b=gNQ7dCY4P/INOtv2o6YkuJLtwOTV2uNAsPtjRqD0wM8rgEhA2z11WAgMtUx0jXhPaL
         8y8yxK9e2szHKZcmBqgbobFMQCXpk6/v+b8OjDdWtH0JIDsWSXCC+P5jGre5xTPAooeg
         egDnHizUsCR8qfE/TjaWX248yeISs+rzagVgvA3OpTRwoJbcTOtzyY/AaAwl6sNOi3iG
         UP78t/9+GA/AsW0/EZtVWP4WreXxLg3SK9erBpzThpC4PXMl3LK4nDSu2bIuP473VvGJ
         DBOnEIto5h1klBYxZ22xAyBkpHHEMct6gkpT4+F7rf5N7ps4fRHDcaTyTs+v6VsMdL7Q
         K5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712592770; x=1713197570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SiykdWWpZFWPpuhgtHiyv2OJtp6umj8v68RDBXJgStk=;
        b=ffBdE3vVthoAsIk3SJCxWl3fuPhQvuatIjjTNJfJnVaJDh5GdQ2ovoJydY1JdudCDp
         tP/zxWIB5sb5I++86vwOhZfZZeU3l6G+Zt31B1Wb4ac9n5t2znT+ntFsxipgsZtLTXbA
         SHE7demUeCj4HlcONLPd0GLHSrRoTBQFp9KoSazX3uRpmiKtdkXqAe+G/cBhTIEktTbn
         y/9UcpcsZVntHi0cOBGWmQ4vxKe9cMJI7j5I2j7wCTKyQMsKMksxxBpYh9Ha+t+kD1bo
         Ne9ncdMG4KVXr3fSq5FN7mDFIoxlDDKHZ86uVRstKDiJ2yXAfyNUMptaQ3RZ4g7NKpWe
         devQ==
X-Gm-Message-State: AOJu0YwClhUEJeDJGWOThERWaalJxAYd3PMFVrdcvMd1MEFUvu0jOoMt
	xod8D1o+cJXKOV68cdKvP0fdx5Kp0ozwvaivrTt5maj7NKFwltF2t9FxjQkKt9mHCuhVcfALkig
	ml1ZOxD7pXLEIk0rEKvA1gwZMZFQ=
X-Google-Smtp-Source: AGHT+IELmDPYtC+BGh0z/NyyPuJ27JUVEctaWcSYhtCYDgMr9EDW5gA4sKftBqQ/uVDExVsk3KlaeOiKOrW0SWbc68o=
X-Received: by 2002:a05:6871:340a:b0:22e:d324:b888 with SMTP id
 nh10-20020a056871340a00b0022ed324b888mr8910931oac.56.1712592769575; Mon, 08
 Apr 2024 09:12:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240408092657.436963-1-xiangyu.chen@eng.windriver.com>
In-Reply-To: <20240408092657.436963-1-xiangyu.chen@eng.windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Apr 2024 09:12:23 -0700
Message-ID: <CAMKF1soVBNOQpqiZn-m-MeeEm6ERm-7t-FKWbKiY+MEGsE0+eg@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] libgpiod: fix QA error in ptest RDEPENDS
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Apr 2024 16:12:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109869

On Mon, Apr 8, 2024 at 1:47=E2=80=AFAM Xiangyu Chen
<xiangyu.chen@eng.windriver.com> wrote:
>
> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>
> The bash in ptest RDEPENDS would cause following QA error:
>
>    ERROR: QA Issue: lib32-libgpiod package lib32-libgpiod-ptest-dev -
>    suspicious values 'bash-dev' in RRECOMMENDS [multilib]
>
> Add a ptest enable dependency to avoid this QA error happens.
>
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  meta-oe/recipes-support/libgpiod/libgpiod_2.1.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.1.1.bb b/meta-oe=
/recipes-support/libgpiod/libgpiod_2.1.1.bb
> index c62c9a3567..4a568b4fbe 100644
> --- a/meta-oe/recipes-support/libgpiod/libgpiod_2.1.1.bb
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.1.1.bb
> @@ -21,7 +21,7 @@ FILES:${PN}-ptest +=3D "${libdir}/libgpiosim.so.*"
>  FILES:${PN}-ptest-dev +=3D "${includedir}/gpiosim.h"
>
>  RDEPENDS:${PN}-ptest +=3D " \
> -    bash \
> +    ${@bb.utils.contains('PTEST_ENABLED', '1', 'bash', '', d)} \

This check is already available below, so just add it next to shunit2

>      ${@bb.utils.contains('PTEST_ENABLED', '1', 'shunit2', '', d)} \
>  "
>  RRECOMMENDS:${PN}-ptest +=3D "kernel-module-gpio-sim kernel-module-confi=
gfs"
> --
> 2.35.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109861): https://lists.openembedded.org/g/openembedde=
d-devel/message/109861
> Mute This Topic: https://lists.openembedded.org/mt/105397634/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

