Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 711D2C43334
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 20:59:55 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web09.515.1655931586231353482
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jun 2022 13:59:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=hTikYC5H;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.218.47,
 mailfrom: brgl@bgdev.pl)
Received: by mail-ej1-f47.google.com with SMTP id pk21so13710966ejb.2
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jun 2022 13:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=b67JsxfOBuM3iUCSMk4l42patkm8q/f1G/3NjOaPNr8=;
        b=hTikYC5HrcCwfuSuLTGzQyk6p+iX6oobIzomkr4sanUgACkR0sCTh5lAQMIw+BT7uS
         t69IPffbhAYTSxsCVDrYkUgtJCEl/9+rtUpdpfCFGXQrL11xg5+w9k51Q1XTPj+upvuE
         XHBgIzbrgex1X7XeYBOwhS8dRvM9m0IMQzHkuwE/Np9X1Fot0qmInYtOFxTYeKo5S+bv
         NN7gcwRccTVJul4CX5DfDrwaGYaDHUb461BpgOUbgpRHxejpVWkOjj3ylUDaur84atbD
         bA06y8zxgkGw2bEkv1GpLEMY4IBT4GyOUoNaRjYUBWArXgB8gMhnGFLO198aQ9cd4ZNv
         5UcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=b67JsxfOBuM3iUCSMk4l42patkm8q/f1G/3NjOaPNr8=;
        b=1egWW9dD0XE4uzTQHPpRN3oSReziYcM5ZXGFCl4Je9W7MMlgcgGLK9xzV45mOu2taB
         D0GTpqd4S+TojOcNqQhPvsWN1peJh8IRwvL4IWKFjQ479ksN78m92FBN6V9NP7nnjYNM
         xxV5LXn25uIUKTR20XgNIkd2PjWETSHtEC8h5xnLcxY5rZzzcvXH/XdZZXuepSSkrIeK
         mn6scCoRx6wB/ePYC8hVNvpuqsXPU7RclaNr9E9hmdG6dCgoRefej7trpT9ZkorjRafy
         p/taEb6N/ZhZ6XRc2E63UCB/3Ny6X1r/sBmO+hJkKyVR+UGFvAtuA7XcKraYvrhXtBFj
         j2Bw==
X-Gm-Message-State: AJIora9tc25Xn5wUlzsoVWNqqIFAIIywmsSt8s1iETqHlpPIF9B/PlHF
	91rX8fermou8NNPHOjcRi4j7ZLsSkM5ha2VlCOnkqg==
X-Google-Smtp-Source: 
 AGRyM1s/RjHp/2mWA3CJqabavtKkilVf2Um+PEfLE7ekrSGNmYck2M44RcAi92lY51+6BUpUMYVtCeYQmGH8aI3IH7c=
X-Received: by 2002:a17:906:739d:b0:722:e94a:24c5 with SMTP id
 f29-20020a170906739d00b00722e94a24c5mr5091541ejl.734.1655931584402; Wed, 22
 Jun 2022 13:59:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220614115906.37309-1-brgl@bgdev.pl>
In-Reply-To: <20220614115906.37309-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Jun 2022 22:59:33 +0200
Message-ID: 
 <CAMRc=MdFa+HK=UbDipA5rZD=0hUd7K6vUXXhdWeNbQo4gY-1Nw@mail.gmail.com>
Subject: Re: [PATCH] python3-pybluez: fix a runtime issue with python 3.10
To: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jun 2022 20:59:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97571

On Tue, Jun 14, 2022 at 1:59 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> Add an upstream patch that's not part of any release yet that addresses
> an issue with python 3.10 (related to a missing macro).
>
> Link: https://github.com/pybluez/pybluez/issues/426
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---

Hey, I think this got lost because I forgot the [meta-python] label.

Should I resend or can you pick it up without it?

Bart

