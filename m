Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12822D743D8
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 20:37:17 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web11.25485.1732135034058380298
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Nov 2024 12:37:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=js3AR61W;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3e5ffbc6acbso177697b6e.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 12:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732135033; x=1732739833; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=koy7ppIZe2pcnmAB20eF/ThW8qNUkDmwDDQJcMFUSaw=;
        b=js3AR61WKph8V6v/D4nLr6DoJWt7ulMhjiywaeLtLq7yCLfYed8CxQ/WxxMwlGjDtM
         PklyddMU4X6kieFoAjX3C/NKnN32GPdRwJVKJKozzD7uTJ6a0NhBlLF5wR2i052gWhQU
         ww6LN0TcqvXNHvyG4DTdg7o+TfjvOn2VYegShv//Un/mAM/Sb1NVuh4vSiuAcCk/8vku
         4az7h6vigzPsM2NByWPM8f5cOvszjHWPt/zYpo0Lrc7XU3Rgel5TrS01y1g2L4d6Q9l+
         LDjcH6W2eCuPkC5323V0pWYzVMBkD7vKLSaXBfGWh2d4dUfF8LTm9CNGcSJnl0wuRjvj
         71FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732135033; x=1732739833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=koy7ppIZe2pcnmAB20eF/ThW8qNUkDmwDDQJcMFUSaw=;
        b=esKgupDcbd4yzKsMZHgV09oZZj2vPulsDZRos4CLe0GfygJEe/h/KCW8DmYudleQ8z
         cOy52RotBMtBX+OlEuB4CFcmAQFgPA2nPWhpLASmjuagh7TLRwVLuFZY8WSueYDpIQM2
         iQKRcp2L6gZymZdbx49pwjGJyjvZJ5rCQTGbkwah+m/ecKrIIwsN4lVSxkQuXP/UOUpK
         7RVFmg1I7xumLMKWax77W8UWsgoJtUQkPhLOElYpzRdiABZI0WGyZgC/AECVWBN2Km47
         IjPj50qp5AlXxBt89GkhBMaMERZqzrgk95/x6g/QAv2V/T+kJLkG4U4++yx+Q7qOyvJA
         mpnA==
X-Forwarded-Encrypted: i=1; AJvYcCXoO0SIyV6oGDHLZW9C+aRAFxRNBbR54e08mB3nwgHINRAqpmUxtRaxtg5f5ROEvlEq9mH/C4+CG6GrVKuve3Ur4aA=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzzHmqeVh7GC/pkTBjFYYBtUFOO2bNHC2+8iqFmGPbRJ/bXoXzb
	R9xA47ROoFPHy10Aoax5D40WYOKo5uLa9309Yk4wlHF6OyaiV55ppXocVGHjO4q683cCe5MNS8P
	tzJ2RibrpzUpnSe4THCMkGtPLWZw=
X-Google-Smtp-Source: AGHT+IEWjzUNIeebijhG7vOFX+nCyD0W2A6PvZyArroXQJnR/YUvuYjgpmsJuoxZQn6bGetofg5urhHTkAwO5bukIJY=
X-Received: by 2002:a05:6808:2129:b0:3e5:d591:c9a9 with SMTP id
 5614622812f47-3e7eb7be5ebmr4418016b6e.26.1732135033271; Wed, 20 Nov 2024
 12:37:13 -0800 (PST)
MIME-Version: 1.0
References: <20241109132924.4334-1-brgl@bgdev.pl> <CAMKF1sp-HYajgrrGyxLQ7DY7oWDXgOD4tez_LCKM+cr4qOkk5Q@mail.gmail.com>
 <CAMRc=MdgRw0giy2=EK=wXsNFivi5+GmTa_pWBWA4HxAVQ2kmew@mail.gmail.com>
In-Reply-To: <CAMRc=MdgRw0giy2=EK=wXsNFivi5+GmTa_pWBWA4HxAVQ2kmew@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Nov 2024 12:36:47 -0800
Message-ID: <CAMKF1sqe13-H+1+EeV=QAa3Ko09QL3Bxg7HgdAOEcLGokbHHOg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-fuse: new recipe
To: brgl@bgdev.pl
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 20:37:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113939

On Wed, Nov 20, 2024 at 12:33=E2=80=AFPM Bartosz Golaszewski via
lists.openembedded.org <brgl=3Dbgdev.pl@lists.openembedded.org> wrote:
>
> On Wed, Nov 20, 2024 at 1:59=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > this is breaking YP compatible check. see
> > https://valkyrie.yoctoproject.org/#/builders/81/builds/141/steps/12/log=
s/errors
> >
> > It depends on fuse which comes from meta-filesystems. Perhaps this
> > recipe should be added to meta-filesystems layer as well.
> >
>
> I sent a v2 moving the recipe to meta-filesystems but on that note:
> I'm working on a project that will eventually depend on this package
> and python3-gpiod from meta-python. Where would we put the future
> recipe for it in this case?

I would suggest to explore dynamic layers for hosting it in meta-oe perhaps=
 once
thats ready

>
> Bart
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113938): https://lists.openembedded.org/g/openembedde=
d-devel/message/113938
> Mute This Topic: https://lists.openembedded.org/mt/109480959/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

