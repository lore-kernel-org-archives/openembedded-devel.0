Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01EB6D2E01B
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 07:29:39 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.3291.1729668570090710314
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Oct 2024 00:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=m1vw+R3Q;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.167.48, mailfrom: brgl@bgdev.pl)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539d9fffea1so6098940e87.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Oct 2024 00:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729668568; x=1730273368; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/5YZAhCJE9mO6mkXJKLm4rMiBJybSTg0YYmaizhERM=;
        b=m1vw+R3Qny3MT1FcXpfN4EDz+H7UX+b1xMfo+MXR4fCDRTjOB+oo3XdkOag+7KY6b/
         IcuWuI6RJFtmReVGu1yxAhj4JWyes/RO+H7xGu9Qgs9fErPc56+DPX/fOYYKYxFNs+U2
         0aemw7VciAvTAsO7FjZ5qv2Z/ymo9pZtQ1k4hFHYqPtXRQBSOXzY4XytrdY5Qb1OYluM
         eDLd8EX7oZ7PPZrWos5gt1Jj6qMlgvhCfiSk3pSP7m2DO0qOOqWD7qDAmbLk0vwh7wHS
         sBc7vA8o7AyBOij7VVK1KserJpca1wCYTa4pGQ26xzUzvEj1omCoYDf85vedEtuP98GA
         vPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729668568; x=1730273368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/5YZAhCJE9mO6mkXJKLm4rMiBJybSTg0YYmaizhERM=;
        b=RRHai86L5HRSjKGJ5jZVSt6jGnZfOqw+XUk785f5VmroyPKLNt4xrp+CRwYOTmt2jv
         K0laBBeytiQQnHkEHApGKZ921jrTMSqDBud1aqLs93T+TiB9XLg8Z/zSW+bAWNyDecxU
         xaHsAZgFRC/O3xBZeSuedt3ydHE6AwUm43W7jWBxGlnVYrsjBhR8zgEShTMZpI66cYmp
         qxuQOCg7QFyxZDMm8idH3yNbtZdTjEhH7/hkwXaRjxQvo41X2A9DjSETQ3iDxJCmQrt/
         lV99RTo553ZaMhUW5CdV0yPDkJIOe+t+I7Q7dFurbD2lfjS7xp87OU2GymVhRxwrlRWw
         +38g==
X-Forwarded-Encrypted: i=1; AJvYcCVuZPTMI5vfRNDI82Uo7Bugu6+VAOBUofi0q0HarmUcZ7pZpdj1SkVdn5KiKIh3y/MnE4SlPhWyMWMcopMc7RZFjxk=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzvBvZ/jbQNTQvSZp58Of9E58DoC3doXCD5wEX3+ttaFYQ1in28
	HMeSmyF6ff4RT/A7y6aNpGw6Bt5sN79FllJ98sYgGnbnuDcsBrWeVP5t2WThUzkg6NgLnU6BFyU
	CUcaJGz1DxhqRn4hto0/HLL7d6PNHuc8eX65uQw==
X-Google-Smtp-Source: AGHT+IE5gFIj3cxnt8FH7PX7NoEt+gMUGlpGEBFl22EVjweVCIeR0ZmIXym1LaYTCCenPdE9UhYLUoudx5XnybiOheI=
X-Received: by 2002:a05:6512:3d8b:b0:539:96a1:e4cf with SMTP id
 2adb3069b0e04-53b1a3561f3mr718579e87.32.1729668566966; Wed, 23 Oct 2024
 00:29:26 -0700 (PDT)
MIME-Version: 1.0
References: <20241022105134.231556-1-brgl@bgdev.pl> <CAMKF1sokb5Kq7TLz5iLMOFAhvzTUQriDLoYzksg47V8oUjoVUw@mail.gmail.com>
In-Reply-To: <CAMKF1sokb5Kq7TLz5iLMOFAhvzTUQriDLoYzksg47V8oUjoVUw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Oct 2024 09:29:15 +0200
Message-ID: <CAMRc=MdyTphfJEzesjHgmavcTmX1n6fE53b6KB6Q6V3iwQ6CTQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] libgpiod: update to v2.2
To: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Oct 2024 07:29:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113140

On Wed, Oct 23, 2024 at 6:02=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> it failed to build/fetch
>
> https://valkyrie.yoctoproject.org/#/builders/81/builds/81/steps/14/logs/e=
rrors
>

I think this is a false positive? Some network error? It works fine
here if I wget this address and I can fetch it from bitbake alright.

Bart

