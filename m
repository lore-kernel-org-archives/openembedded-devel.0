Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA8F4D3A676
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 17:24:46 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.2434.1730222678440117753
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Oct 2024 10:24:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=YFzWtbqC;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.208.169, mailfrom: brgl@bgdev.pl)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb51f39394so57418101fa.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Oct 2024 10:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730222676; x=1730827476; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AVUkso9zuL0e6DFQ3otI+/lJtTPkv4+Gyx/hLY1vOGo=;
        b=YFzWtbqC5PF8DTkIWq5jqTEjGgzkwUVjIU7uSybP2A5jJ/9PjNPQGUKNmRS7tNlL5J
         MBVEubitt2T7IYpheDJ0PWhCPPcwiqhPvwy43fy8mMh4wYeEbC4lY/VgIvW4va8oKyy3
         lwpr8P19ktgfMAZsaU+sKSQKVxMQAYZIEzTtgUFYOfqr9LIPPDae8eoBBxWu21NnU2iA
         1eaNFckkbCo11K9M+MG2i3Ty5ajOZAAGpf1ru6Cckkm3Vfet2ZkiFGHY5H6bX/ikl6W9
         1MXEvqrmATKAwrr0mz+LjdQyTMslvyhuAFYGPCQ77jtLySGxmLF7+BraxrvmvwO9aj/r
         S0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730222677; x=1730827477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AVUkso9zuL0e6DFQ3otI+/lJtTPkv4+Gyx/hLY1vOGo=;
        b=fS1kJ+4keTCKuXHTBVVKSgLNmfhfzKl2u/9ribDITHkR38qO5hnGeeeemLuC4IX9pB
         VHB5QjGHbN+XKagoqfJSiqsL2j1hN0bn7cNw6Ubk8cTGKaFyVAyBJKf7ZuEwcMcE32i6
         SANtnCKMzWGu2NjRWCVKtNTDrnB5TpkRyRBFz6mGAkM1Rq1XUcgounzkDCJDCT6JBJDK
         7RU7gb2k5fk269dIET2l0RvIVqk10WIv9OFLMDHScXYgsaieLr9H9YEjM8OStFyjpev9
         RS0wBy5aJsXkniaeF9/llU5K2HCQOnNqizebdpDv8Xpfbgtg2GPfAKxrvNa4VTwZFyJ9
         giXg==
X-Forwarded-Encrypted: i=1; AJvYcCXI2AerglxXbdLQ1rmvgCiB3AppXdZpBogwm8IGziMwE+0FpNm4NktxRs1nCkVA+Dj5yo9Qxk2GthQi/i7HeItUeeQ=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxo+RsimrNX8YjM0ENVxhi8klDYE3gpW6KDRLqgYDwRQt256a0t
	7X0paGbKbK5a+H68VEQofPBPjLnva/l0PGHVUic76UuFNbetnhrJmV3nZ9EzRh9DBXzIYugqPGf
	A00oNX8MXlfP+FNnI8v/pXt8B7BkofHa3Xu1nog==
X-Google-Smtp-Source: AGHT+IHkl7X1kyu/F6ZSQUc3Q23Uon32vSl70JtGhI34oaXS/auL7zvmoic5Nq2lRYW1TL/3NE5elA3WG1Nun+MrZ3k=
X-Received: by 2002:a2e:be85:0:b0:2fb:5392:cfd0 with SMTP id
 38308e7fff4ca-2fcbe005e38mr60864961fa.22.1730222676366; Tue, 29 Oct 2024
 10:24:36 -0700 (PDT)
MIME-Version: 1.0
References: <20241024135126.48781-1-brgl@bgdev.pl> <29bbf4a17cfa28fc45c0f3e7fe3b472170d6bdec.camel@siemens.com>
 <CAMKF1spzk7ezwr1ekRq+NxoLFuT3gZ66-ARsc1_ZYfi0czwUgg@mail.gmail.com>
 <CA+chaQdCQquu7TDt=YONbXmA8rpdoALUDPJ22eJRe50Zumo73g@mail.gmail.com>
 <CAMRc=MdDpw6O-T5uGsos4gFr87J85wtFxLK1F+TeJLd8JctdwA@mail.gmail.com> <CA+chaQdB0DWJ_UjrFp3NRzDyU48rLtf8--XUj9yvrKRXUQ0GVQ@mail.gmail.com>
In-Reply-To: <CA+chaQdB0DWJ_UjrFp3NRzDyU48rLtf8--XUj9yvrKRXUQ0GVQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 29 Oct 2024 18:24:23 +0100
Message-ID: <CAMRc=McXnYFrM5gPftv8BpBSc2X8=E-++PrP-LiPy2Cs5qCG4A@mail.gmail.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Oct 2024 17:24:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113329

On Tue, Oct 29, 2024 at 5:54=E2=80=AFPM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> > I'm not sure how you got there
>
> bitbake python3-gpiod
>

There must be something more to it though as a simple 'bitbake
python3-gpiod' works fine for me. Anything particular in the config?

Bart

