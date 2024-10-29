Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7640CD3A673
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 16:45:56 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.1389.1730220354894186038
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Oct 2024 09:45:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=inniF5wp;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.208.178, mailfrom: brgl@bgdev.pl)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb50e84ec7so41924101fa.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Oct 2024 09:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730220353; x=1730825153; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jvWj+enl8FlNjppMnCKNUdR6TAfw6N4JkQhgW+xhj5w=;
        b=inniF5wpeDaKgmsrQIIfdeyyFJv06jng/jPqp9OS4RNZMy8/eS1dlB1mOTVHiexKBV
         fHrbmRrQNa3f1xUm6V8wIrwl8RQ2KlvVXcYKDjgehgWyexrdTrCrKdoyk0GvB4KAuIHk
         BI4xHpmnL1oWj+/FGiQJcJEHsrQcNTDr+/c2AnoXPTgKmLo3sAG4TD2tCTNNlZqxuJWj
         XZGcLh7JRxQ3WsHLOshQYfnlqYUynH0siC+iM634dg0UEvz0pw1BkukkFzdhk7oqPRJL
         TuegE39PCss3w36fg3eZXKOlyG+oSrNgJ7xyYGd1deVYpUWgSctUxJ3YkXuqoG4zcBco
         TEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730220353; x=1730825153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jvWj+enl8FlNjppMnCKNUdR6TAfw6N4JkQhgW+xhj5w=;
        b=W66dm5+eyVGZ4cDfB2/TF8jYg2PAnMGDm21/q/gd6iTabQkJf5ZyfxHM92CPTZzK5G
         Eb7+HvvMvzyVNZvMygNIrQVNEia/1VIK30XeqGryuj9I+jMNh/q2VDcQTj0mTTjuvrV1
         iKpWfPSg1jNfXvlFHbogmPdfpkiNpYIzVDf00GmZ8epe5SEvfgZ4Ib9OeQK6Do2AwsEx
         Huq5V+FWdwVcRn8FWP910Hk6Kwc4uokkbdjSVutCW07JQHZ7W/xUfacSSRlCgzB9WseR
         qA2S0KiqCcf78Jf34/3S94wQMvA/jjEP3KalKK6BlY3ajFmPqFvVXIpPPiVcNEe5Vceu
         9fww==
X-Forwarded-Encrypted: i=1; AJvYcCXGP+PXgQhcWO8huEKwcXSduKCze2f4vh0n+U7H03z5U4v55ppdWTv+VVVdjtRi1gSxLcFBIimfdDQO+fRddZrqhNs=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx4YfsNP+QN7/YmDCYcGvL1+XPvyD/QnXgiOOZxdt8kPJgLMpY0
	EPNFrQdgq7HdXhHrZhUn1rEbfyJMa4EYcrIa1byvS1EFzdYhtQn/dtpCakQHXiA138MimLcOJ3+
	FiTXz1oKK73qcqBbjW9su5bYUZScOv+aTA/HYhQ==
X-Google-Smtp-Source: AGHT+IFf2j8N+UUEjO31CqffaI9YyfSc/4iaKj0FF8eHoq3paPdVte8luGoi6FWNzPZqkOopnq28IGj/17m3z/fvQ+c=
X-Received: by 2002:a05:651c:2112:b0:2fb:4ff6:eb0d with SMTP id
 38308e7fff4ca-2fcbdfdf40bmr59308451fa.22.1730220352793; Tue, 29 Oct 2024
 09:45:52 -0700 (PDT)
MIME-Version: 1.0
References: <20241024135126.48781-1-brgl@bgdev.pl> <29bbf4a17cfa28fc45c0f3e7fe3b472170d6bdec.camel@siemens.com>
 <CAMKF1spzk7ezwr1ekRq+NxoLFuT3gZ66-ARsc1_ZYfi0czwUgg@mail.gmail.com> <CA+chaQdCQquu7TDt=YONbXmA8rpdoALUDPJ22eJRe50Zumo73g@mail.gmail.com>
In-Reply-To: <CA+chaQdCQquu7TDt=YONbXmA8rpdoALUDPJ22eJRe50Zumo73g@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 29 Oct 2024 17:45:41 +0100
Message-ID: <CAMRc=MdDpw6O-T5uGsos4gFr87J85wtFxLK1F+TeJLd8JctdwA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3] libgpiod: update to v2.2
To: Martin Jansa <martin.jansa@gmail.com>
Cc: raj.khem@gmail.com, "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>, 
	"bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	"bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Oct 2024 16:45:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113327

On Tue, Oct 29, 2024 at 1:39=E2=80=AFPM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> Doesn't this upgrade break python3-gpiod
> (meta-oe/meta-python/recipes-devtools/python/python3-gpiod_2.2.1.bb)?
>

No. The release is fully backward compatible and python bindings
v2.2.1 build fine against it.

Please note: the versioning of libgpiod and python3-gpiod is
independent since v2.0.

> In world builds I'm seeing new build failure which looks like caused
> by update libgpiod API:
>

[]

> gpiod/ext/chip.c: In function 'chip_fd':
> gpiod/ext/chip.c:48:32: error: implicit declaration of function
> 'gpiod_chip_get_fd'; did you mean 'gpiod_chip_get_line'?
> [-Wimplicit-function-declaration]
>    48 |         return PyLong_FromLong(gpiod_chip_get_fd(self->chip));
>       |                                ^~~~~~~~~~~~~~~~~
>       |                                gpiod_chip_get_line
> gpiod/ext/chip.c: In function 'chip_get_info':
> gpiod/ext/chip.c:82:16: error: implicit declaration of function
> 'gpiod_chip_get_info'; did you mean 'gpiod_chip_get_lines'?
> [-Wimplicit-function-declaration]
>    82 |         info =3D gpiod_chip_get_info(self->chip);
>       |                ^~~~~~~~~~~~~~~~~~~
>       |                gpiod_chip_get_lines
> gpiod/ext/chip.c:82:14: error: assignment to 'struct gpiod_chip_info
> *' from 'int' makes pointer from integer without a cast
> [-Wint-conversion]
>    82 |         info =3D gpiod_chip_get_info(self->chip);
>       |              ^
> gpiod/ext/chip.c:87:38: error: implicit declaration of function
> 'gpiod_chip_info_get_name'; did you mean 'gpiod_chip_open_by_name'?
> [-Wimplicit-function-declaration]

What you're seeing here is caused by trying to build python bindings
for libgpiod API v2 with headers from libgpiod v1.6.x. I'm not sure
how you got there because the recipe sets the run-time dependency on
libgpiod to version >=3D v2.1.

Bart

[0] https://git.openembedded.org/meta-openembedded/tree/meta-python/recipes=
-devtools/python/python3-gpiod_2.2.1.bb#n19

