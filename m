Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 524A0CA1009
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 12:11:42 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.10682.1756901501332574547
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 05:11:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ciVR43FI;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-71a2d730d03so24912756d6.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 05:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756901500; x=1757506300; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bunGtIl2xpsVaGfrYvjQOLKSC2EPl5N4BAy8/ikQ1is=;
        b=ciVR43FI/+a7lrFC2TrYgzTzdV1r+UHG775VP6+SXQYowQ/jKl9KGobvpJARFWbEFN
         mL03IyUPjdSScgfr/Z102yJZUNKTKidJSKlveYaaVUFzZ0WvjQ+7mJs3xzjGG3u4WOrn
         IgtkqN42E1Ic71k6rLQYZZUsc5NsvhL9tavEMeu+DceSwXR3xR3+nSqhNuy5igjs91CU
         i5V1YM+Pgy5ULixWNUhXSF5ZhkqfLAvs8o+TxaKAuq77qLQ1SmsgRJg80PGBVl1vdGij
         Z+VoSr9XaOeL8X/SnWy4yvA5DaOUxnL6E9toW6y+ufgK41VHgCmoqo2dcQaH/I4p2qQZ
         FgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756901500; x=1757506300;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bunGtIl2xpsVaGfrYvjQOLKSC2EPl5N4BAy8/ikQ1is=;
        b=PVD9aMl5VzG/hX7mUota41XeIS93QFBrhhIpySQX+8PUPnA0gtP7bhfL135as1uwGB
         bR94/BcILQxybdsQs48QBwUoG0chYZ9VCEi93fCieoPkam9Ouomo6Oendfw8iyMG7qZK
         p+WKE05gTEbbIuRy2eEPRwQCr6jOUQuabQMS4ZfM9woWZ5afFRAhpfEzmvfOM1kP9vfn
         +hbm8P51VEYcXV4Xo/h5HWLscX3ksigD9k5l8WaFfq4lXTVb1vy+JRyH8EicFXSUG44E
         d4JLDUYqlBTnn0tNiltuHqNdVEEgJdrO6fAsqRCsjT4md/ktBEUdyfBdLhVjb5tR3KMX
         bV0g==
X-Forwarded-Encrypted: i=1; AJvYcCW8yhBCh93iJe5aGDInDY1Goj8JgdraFI5Gxpm3s2nVWwBRn4Q7YEdF7dEQh67P0pFLnWHZIlbe+6McCAsk6mZ4tng=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwC+1dTVQsUGC8ImoxWqK/+eye+qIUFHV3t0iwJz9ycB+D9ONbf
	nAwlBXJ7Q76hf2YROhgur887DSL7he6phsKqSYy135mtR1h4bJZJccCkOdu6qZrFwxjYOwjvAVy
	fyOREumYiP0gS/wlq8T0KdMUeva7q78g=
X-Gm-Gg: ASbGnctuWf2QP053hQC1NY0Wb+oT2D9c/waiv/JOOIXx+pEXdBvVHH68U4Dk9QzJNCT
	mEfxJ83e3i1dFHpVcPY1Pq2Sr3jpUomdO7/4HVcxO9MQYopACedOC57geavbVHAr3A9IT1d5PBh
	e5RjOqGh+nRzDLqQLV8uP1wQsCUwrsdNgPNtEZwdD8T0WckoPPU0662n23NDBHkUdvkmwz1ayso
	8efeXqa7ABpNCaJoGWWorByZ2htCbSejOqQNUPqYgZ4rNo6wB+UBIYqE6z2Xz8GtAsVGOn/JUIT
	aVlqqV7JoWLKo0o2A3O2QEKOe/hUvi/eVlT2cuUu
X-Google-Smtp-Source: AGHT+IFxsRY0FdaFc8jqJvRlTbUA1j+kVQuxbgB0nLqTGX9j8nvnQnQNZ0JLCG485TEHr+eHWwwdchu/LU9SjacWAEU=
X-Received: by 2002:a05:6214:f09:b0:70d:f9d0:de72 with SMTP id
 6a1803df08f44-70fac940a7dmr162490476d6.61.1756901500234; Wed, 03 Sep 2025
 05:11:40 -0700 (PDT)
MIME-Version: 1.0
References: <mtcyc6sh3ncw36xq2ngxwfzqjo4jwakclrwsitncnjxeb3nke4@czy7r2g73dwr> <45bcc161-228d-4900-a384-7c3869b97ef7@gmail.com>
In-Reply-To: <45bcc161-228d-4900-a384-7c3869b97ef7@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 3 Sep 2025 14:11:29 +0200
X-Gm-Features: Ac12FXyNs7jJzH7ZPXX1pGx5f9MIygbJCjKyUeTgY8JiLKsosW8jXJk4aiGM_ug
Message-ID: <CANNYZj-=HOLVM=hLdnb7MPU89xeZRm144gTyujDpXQYfcxQr5A@mail.gmail.com>
Subject: Re: [yocto] No meta-openembedded/krikstone updates since 2025-07-13
To: yocto@lists.yoctoproject.org, skandigraun@gmail.com
Cc: joerg.sommer@navimatix.de, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 12:11:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119258

On Wed, 3 Sept 2025 at 12:49, Gyorgy Sarvari via
lists.yoctoproject.org <skandigraun=gmail.com@lists.yoctoproject.org>
wrote:
> > there are some patches for Kirkstone on the mailing list openembedded-devel,
> > but no updates of the Git branch at
> > https://git.openembedded.org/meta-openembedded/log/?h=kirkstone, since
> > 7 weeks. Is a push missing?
>
> I'm merely guessing - probably Armin (the maintainer of the branch) is
> on holiday?

This unfortunately is not the case. Armin is unable to continue, and
the layer needs a new maintainer. I am expecting that openembedded TSC
will come out with an official message, but, unofficially, any of you
are welcome to step up.

Alex

