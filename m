Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D40C77B73
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 18:48:52 +0000 (UTC)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
 by mx.groups.io with SMTP id smtpd.web10.15644.1685213330154801303
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 May 2023 11:48:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=5W2AI5vb;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.171, mailfrom: brgl@bgdev.pl)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-4572fa2a92fso434415e0c.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 27 May 2023 11:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685213329; x=1687805329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mtjw68FMAkoYlOo/3i7caKUpIh8qdne+yIBjxYbamGA=;
        b=5W2AI5vbYhpRFp+a+Q/JFuyMPkqlTaKj4uHbBTCYUOrOYueOshm30LQu/GIjKkdkBh
         nRNktC+6Ja7/Ba7FqGpPvA9OS503AP3FY42ULUyaeKBkJF/LpTPTWBKZn2dJy3DPdzp1
         7MTLL17frk2xgUU2fasoxGNi0m+iV7GrkEWUAk7rnzoJjGyQRrMZetqhxotjSa62FFa4
         RAAMN/nRbtt3BY/Lajx6O6G22fYEiLwCKrJwqu1Zmhft6Jsi5O3/usYoPRew84hYg0qX
         Xl9oeH1vQGkj0+BEmVC1skBHsSgr3WE4rEp/lBghi0G2C2x5pLBCnWgzneg7x75GQJDA
         OYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685213329; x=1687805329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mtjw68FMAkoYlOo/3i7caKUpIh8qdne+yIBjxYbamGA=;
        b=BqAfQaUgdr38a0NC82lEbddW0hDD9auBHPDG7334nVs1jJrnHmeS+fg2fxUhRzgSG4
         EBhJRovYdoqGdSG8rCx1FbyXqLlMTiMDhFX+4d7eSkOZbYTq+aHSDRF1dILzQKCW2151
         bLFh612ht66p9HWmaHJEHpDq6LlqXpG5LHNslHA450ee/eIKLD1Km8KzGTMSsM1MTtNk
         itPNySfJh6tgcG0agbGhbJd0tP0joEBQf7JdyJIDNUZk5eNq/yB3Xz4I62KMYZtLxFYI
         oN2TziSQa5AubBInPJFUHJg6UID6XPbgDe3SjE74GzSX1CcI5zrRfz3iwvI+36s6ZVwv
         hNEw==
X-Gm-Message-State: AC+VfDxculy2+oB6dU3qW6xdbDpMPxP6xXxk7EDOjYM+5XmnRmMgem2T
	PukuS0wE96J0xf6PmQI09OT8hWGiyfAgmErr5/FoTw==
X-Google-Smtp-Source: ACHHUZ7VWkeahnAAcJfxpdoV499o2QXd4eNeV01CzXjUPovbKCncjVvqjw6+PPGBnmZcjQ61Di3/NemBhRmHnH4fCo8=
X-Received: by 2002:a1f:bf58:0:b0:457:1a8:9eaa with SMTP id
 p85-20020a1fbf58000000b0045701a89eaamr1158467vkf.4.1685213329051; Sat, 27 May
 2023 11:48:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230526202409.74712-1-brgl@bgdev.pl> <CAMKF1sotJ7SsTd36bzEQKK2jpOtKccGEyHcfpgwFXTMQSznmBw@mail.gmail.com>
In-Reply-To: <CAMKF1sotJ7SsTd36bzEQKK2jpOtKccGEyHcfpgwFXTMQSznmBw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 27 May 2023 20:48:38 +0200
Message-ID: <CAMRc=MfE=tZ+4rqQ-tRFVmLDXkPWSptgLV=56ZWX7VnMSzhh5w@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] snagboot: new recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 May 2023 18:48:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102881

On Sat, May 27, 2023 at 6:36=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> Seeing this error
>
> Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
> 'snagboot', 'python3-pyusb']
>
> Perhaps this recipe should be in meta-python or under
> meta-oe/dynamic-layers/meta-python
>

It's a python package and fetched from pypi so I'll move it over to meta-py=
thon.

Bart

