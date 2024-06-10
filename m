Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB0DC27C55
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 19:31:53 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.28585.1718047903968083445
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jun 2024 12:31:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SqlrviCc;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-25488f4e55aso1322756fac.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Jun 2024 12:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718047903; x=1718652703; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFa2rKLHlYkyydl4LaUeXrgcquJqp9IOwSbuR0gSyho=;
        b=SqlrviCclHJ7dbM7PzvuGRM8F2kwsobRM5+2RMWa5ceei4Lx9tWXqdXCGloqYo8yqF
         uz8pl6MEVqOkJExa03M/BbUo/UCWegOlP/noBifoA34gTxZ7JFU9nllyMYus9GmQc7LC
         ikkzvls7zuOE+cVdt5ERgNv+EaUXDeoF0lqQwwSg/0mXIGuFdi+AlXF6wl5KALD+eIR5
         YCC2o50+lj7YlEadNa3V/zYwxHKbBDxpSPGYDieIcgDmiWgWDfEZMEE1JdfeJSGCg6AF
         WmIy+9KNcKfk9B9gYtz3/WbR2hyxTZu2salf7T1NgsisHPil7VY2SeKM+nZ+snVAHL6L
         iocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718047903; x=1718652703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UFa2rKLHlYkyydl4LaUeXrgcquJqp9IOwSbuR0gSyho=;
        b=ZG7wgTM0rPB/ktbK8qJsI92I12FvP5U3O/hauwY3R47QWU+hVvBhgBfVeEapb3A3DU
         +pxIPUvQ0g8ZeOT/UQaBOn0HFOR2A3pjebu2uyUXggnMOHu2ra8n95C02bgxLLOoy/XW
         qXwuNCg4DpH8niiUXCjz+I7rMonWHoPbWzJq9bHPoZUkBIGbNMY/F3Oib8+0JsQ3HqbL
         LoUtkR/aZyEfrZ8u6lqU6DhOjD9KaGIWgpdlgVYGXOYFOBrDMbnZiCTgxtrIE+JP3HY9
         j1lB6SxDxq0FdK5+arGKA7LWQH5VrPoMrdWPcu73Be2l1OIe4+b4WpB+HHpld9X+RiAW
         brtA==
X-Gm-Message-State: AOJu0Yys4duTpPJs8rBEk778+WgK+7J3PZ5ssF6GcUtC+SwQg5FETKqo
	MVj+M/HtgIoy5gpY/3+DyIo5ZkmnoC/O4JE8iYlJLPXBGcmH08akqz8pSzBr8XvKqhY/Fq02qWt
	MtyBZSARBWKMNxYKx6qz8rwhj1To=
X-Google-Smtp-Source: AGHT+IGPLtzedZZ8ILUPxfiHiKTO61RymlyO3ymbigreZA5e31PSodWvAFOj2RvA/1oUK0xDdnZJMO1GaFfb9Gb2Nng=
X-Received: by 2002:a05:6870:459a:b0:254:c7f6:3290 with SMTP id
 586e51a60fabf-254c7f63460mr3369974fac.4.1718047903124; Mon, 10 Jun 2024
 12:31:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240610182058.2286377-1-raj.khem@gmail.com> <CAMRc=Mc3e8PdFPHRCcPMvE4Js+utpwN-oXzaHy2w9976tWa7ig@mail.gmail.com>
In-Reply-To: <CAMRc=Mc3e8PdFPHRCcPMvE4Js+utpwN-oXzaHy2w9976tWa7ig@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Jun 2024 12:31:16 -0700
Message-ID: <CAMKF1srw9-pcKB0Z08uxZYbD2R1WK9VUv5vsiGC-AAqk8pwKqQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libgpiod-1.x: Disable ptests and fix build
 on musl
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jun 2024 19:31:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110803

On Mon, Jun 10, 2024 at 11:34=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> On Mon, 10 Jun 2024 at 20:21, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > libgpiod-1.x is still in use by some BSPs e.g.
> > variscite SOMs, so we can not get rid of completely
> > so give some time to move away from 1.x and disable
> > ptests as they need older version of catch2 which is
> > being removed
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
>
> TBH I still support v1.6.x as this is what Debian stable still ships
> with (and will continue to for some time) so how about dropping only
> C++ tests?

Should be ok I guess, would you mind sending a hint on top of this patch
how to do it ?

>
> Bart

