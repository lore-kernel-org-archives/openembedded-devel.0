Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C0E4D3A674
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 16:54:26 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.1609.1730220856594700419
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Oct 2024 09:54:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JV+aXZzo;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539e4b7409fso37433e87.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Oct 2024 09:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730220855; x=1730825655; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sMY7AXAgkcAuWfibA9BTTSpf7RTl4xtzTlzan0Hnn5E=;
        b=JV+aXZzosHWKTdETdy5jGGkWFqLXqKAWF9IXUh+unGIQVjDzmepks1TbG9KtoACIDX
         uenCGfbshPu/4svbr2WHsoQQXVGBiMa0R7QTSPv32HPaukdt0oIv+2TH7TOMFU5izxFT
         nmLSoQuIy1QsgYLft9adMMsXtEKuJ/xjrdwY5OvGEcRufAPsqtl8PNrPIjnXEHjYCiow
         j7xiM//m9EhCCZWheKeugjPRCflRfvkY2MNkQQIOxUoTncdD1bQDt11PBRgXS3YuG12N
         kP+On04cp7X2YUi6HjSxg6NPIZ3C1wlhjMHk2LT/s7VysIP2hfBbYr81mLAPwTiNJNGf
         KCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730220855; x=1730825655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sMY7AXAgkcAuWfibA9BTTSpf7RTl4xtzTlzan0Hnn5E=;
        b=GpDz8Fv9wonY7Sv07kQsrR7D7r4Qm5UqnApbhnhjMYWeqZVDvZzVEENUpR8kzsGo/j
         vBjvcrNeFgmorcAL1wZkh3EkrvprD+0e6fgbTlInAERz59wBMQu2dho+eaaCuCYuxO8P
         VPrBdR4bef8T1+Zz1u4avworuyQ8bTP27D/O3ucB6foqD7yTTp7GXaVvPKTm1Pxhrhdw
         f0or6lKVFz5gLyNv6JKBT9aoa2rDK8ztda1axn3J1E7o0HTdyjlQiaaszXSlWNXjbfZD
         KkyaRG3htAz+kY+f9j4CHXXNcW5GePuAH6wnXmbKA2HN7eOZMJiTTvDRGEFIbqJ1ovfs
         IhcA==
X-Forwarded-Encrypted: i=1; AJvYcCVtGFBl2f6Ruk1rrVoEBrTOoVcHyb+/OQFtkc+UVDvRASDL/8mYkhRc1dSQ94hK4OGcLNKH1WNlEcz8hIA/+nBdYyo=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwbLE1Vcbe6uPC6qqiHTeNc4DhklebEE0sLBcMJmiaM8d74xqlJ
	ijZqC4hBBzj8pC9Q97ds/LTBmaIGnQ1tD2oCQTA12W6wiv/WOGjdakh7H/z2vvm1F0uLHbXd+Ha
	N/s+obBL/YPvGCJ1g8JmWJImihj0=
X-Google-Smtp-Source: AGHT+IGjq8s6cgHq0lJKN2yMt7YYPGCmvjWAjnHzFZqwYc62J7Hl1b5EXTPZjzqOkF8jDPv5uny6NmZdMZLGPvp1Xx0=
X-Received: by 2002:a05:6512:1051:b0:539:fc50:915f with SMTP id
 2adb3069b0e04-53b491f6fb2mr979993e87.2.1730220854358; Tue, 29 Oct 2024
 09:54:14 -0700 (PDT)
MIME-Version: 1.0
References: <20241024135126.48781-1-brgl@bgdev.pl> <29bbf4a17cfa28fc45c0f3e7fe3b472170d6bdec.camel@siemens.com>
 <CAMKF1spzk7ezwr1ekRq+NxoLFuT3gZ66-ARsc1_ZYfi0czwUgg@mail.gmail.com>
 <CA+chaQdCQquu7TDt=YONbXmA8rpdoALUDPJ22eJRe50Zumo73g@mail.gmail.com> <CAMRc=MdDpw6O-T5uGsos4gFr87J85wtFxLK1F+TeJLd8JctdwA@mail.gmail.com>
In-Reply-To: <CAMRc=MdDpw6O-T5uGsos4gFr87J85wtFxLK1F+TeJLd8JctdwA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 29 Oct 2024 17:54:00 +0100
Message-ID: <CA+chaQdB0DWJ_UjrFp3NRzDyU48rLtf8--XUj9yvrKRXUQ0GVQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3] libgpiod: update to v2.2
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: raj.khem@gmail.com, "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>, 
	"bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	"bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Oct 2024 16:54:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113328

> I'm not sure how you got there

bitbake python3-gpiod

it builds the 2.2 recipe:
bitbake -n python3-gpiod | grep gpiod.*do_compile
NOTE: Running task 1878 of 2433
(/OE/build/oe-core/meta-openembedded/meta-oe/recipes-support/libgpiod/libgp=
iod_2.2.bb:do_compile)
NOTE: Running task 1886 of 2433
(/OE/build/oe-core/meta-openembedded/meta-oe/recipes-support/libgpiod/libgp=
iod_2.2.bb:do_compile_ptest_base)
NOTE: Running task 1984 of 2433
(/OE/build/oe-core/meta-openembedded/meta-python/recipes-devtools/python/py=
thon3-gpiod_2.2.1.bb:do_compile)
NOTE: Running task 2041 of 2433
(/OE/build/oe-core/meta-openembedded/meta-python/recipes-devtools/python/py=
thon3-gpiod_2.2.1.bb:do_compile_ptest_base)

I don't use either libgpiod nor python3-gpiod, it's just one of new
failures detected in my world builds after the libgpiod-2.2 was merged
in master.

On Tue, Oct 29, 2024 at 5:45=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Tue, Oct 29, 2024 at 1:39=E2=80=AFPM Martin Jansa <martin.jansa@gmail.=
com> wrote:
> >
> > Doesn't this upgrade break python3-gpiod
> > (meta-oe/meta-python/recipes-devtools/python/python3-gpiod_2.2.1.bb)?
> >
>
> No. The release is fully backward compatible and python bindings
> v2.2.1 build fine against it.
>
> Please note: the versioning of libgpiod and python3-gpiod is
> independent since v2.0.
>
> > In world builds I'm seeing new build failure which looks like caused
> > by update libgpiod API:
> >
>
> []
>
> > gpiod/ext/chip.c: In function 'chip_fd':
> > gpiod/ext/chip.c:48:32: error: implicit declaration of function
> > 'gpiod_chip_get_fd'; did you mean 'gpiod_chip_get_line'?
> > [-Wimplicit-function-declaration]
> >    48 |         return PyLong_FromLong(gpiod_chip_get_fd(self->chip));
> >       |                                ^~~~~~~~~~~~~~~~~
> >       |                                gpiod_chip_get_line
> > gpiod/ext/chip.c: In function 'chip_get_info':
> > gpiod/ext/chip.c:82:16: error: implicit declaration of function
> > 'gpiod_chip_get_info'; did you mean 'gpiod_chip_get_lines'?
> > [-Wimplicit-function-declaration]
> >    82 |         info =3D gpiod_chip_get_info(self->chip);
> >       |                ^~~~~~~~~~~~~~~~~~~
> >       |                gpiod_chip_get_lines
> > gpiod/ext/chip.c:82:14: error: assignment to 'struct gpiod_chip_info
> > *' from 'int' makes pointer from integer without a cast
> > [-Wint-conversion]
> >    82 |         info =3D gpiod_chip_get_info(self->chip);
> >       |              ^
> > gpiod/ext/chip.c:87:38: error: implicit declaration of function
> > 'gpiod_chip_info_get_name'; did you mean 'gpiod_chip_open_by_name'?
> > [-Wimplicit-function-declaration]
>
> What you're seeing here is caused by trying to build python bindings
> for libgpiod API v2 with headers from libgpiod v1.6.x. I'm not sure
> how you got there because the recipe sets the run-time dependency on
> libgpiod to version >=3D v2.1.
>
> Bart
>
> [0] https://git.openembedded.org/meta-openembedded/tree/meta-python/recip=
es-devtools/python/python3-gpiod_2.2.1.bb#n19

