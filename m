Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A8A6ECE577
	for <webhook@archiver.kernel.org>; Sat,  7 Sep 2024 23:58:51 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web11.20090.1725753531101190771
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Sep 2024 16:58:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EWemvrhL;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5e1bf327af8so481992eaf.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Sep 2024 16:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725753530; x=1726358330; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQxBJrdYyshS/pg8py5W/kZGaWQX1J237xlDpErg+BE=;
        b=EWemvrhLv6I9dXMjg83cyMRz5MQzo+HCHKWELflqC+De5X7kxrynLve+rz4QKNpnUy
         H5Iyhwwpbt7GWYP++EoIygoI8vND992R2l6Tr+trBQ3+oY0pUbQabyHYYW1266ov7BNs
         q5N+R9DG82565GSef+PwE8/AkApt8JGd4BcyDq4nUxQnEz+M9UvAgQgJykmydWIBbu6n
         tcfXgya/RLdHrDDjUrbyDBuhpznNAMOkSFx66lpGPqaN8mUYEXXu4PWlh4P0rFWnahwb
         x6EPGpEbP2Bx82/CQjjZs/uFejSfieKV2kp5zL5fAWf+jR/3G0bO6k/oabcr8pE6Wvnt
         e3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725753530; x=1726358330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qQxBJrdYyshS/pg8py5W/kZGaWQX1J237xlDpErg+BE=;
        b=JMTca9KMxKNszYBBDy+wg0a8zS2lWseHsABcp90KF0kSc1YY0k9FKt3hpbRU1o9iaF
         HAqXvWV7XA8b3JT/s5LNgDkFOEyqauyQbp6SsVFfahdaYRo3jgSfHrau4Gpbjwp92G3X
         mipLRXwK63gtwi62i5L4GZk9plT4y7MMkfmh271e+WvroYltpFZ+BMRq2f10ZiDrrd04
         r0wqS3qb4+emrhSIMgbEdvEztq9TiiATFxLAS8tcknq95BbhWddSij0Ny/9fWGUsM5cl
         yejVK8WN5ixFZXSrOhTs87hsdDI00+AgQiiC1KhNS6XXECsio40CAnEmL27n9JE0rPGx
         HtKQ==
X-Gm-Message-State: AOJu0YxaI1M81Ttv98kblO0XDPlwBHVtmUaXhxMx3mhSVSTTn8kKKNAl
	XNjIHbPnRQybONE+/8WYQ/+/g5LEr7mqc7O9gfx0thlfGHRFS8vsW4tomQ+LWlS0Ere1ntO0tKS
	TZWzXAuy8i+TukUdQve98yo/IvuA=
X-Google-Smtp-Source: AGHT+IFyFJ9+qPxyVW9mMrxcKq+8T59TNfRfCoXBoAUbec1L18FF0D7ZPjv5dBMN0NQmrUjF2x/r78o/cnk+01EA9+Q=
X-Received: by 2002:a05:6820:168d:b0:5c4:7b18:b8eb with SMTP id
 006d021491bc7-5e1a9c07acfmr7423187eaf.2.1725753530302; Sat, 07 Sep 2024
 16:58:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240906184711.3654693-1-festevam@gmail.com> <CAMKF1spUuXBtPQtPyx-3Mh3JXy_-RanRXjpotWB2k3agAi8Rdw@mail.gmail.com>
 <CAOMZO5AezVAT_wv77eFJjYyqpTzffhJ2Dk=0Z5jQFwASFAxp+A@mail.gmail.com>
In-Reply-To: <CAOMZO5AezVAT_wv77eFJjYyqpTzffhJ2Dk=0Z5jQFwASFAxp+A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 7 Sep 2024 16:58:24 -0700
Message-ID: <CAMKF1srVDxY4cDWcxXJ8LSfiRCfr_qP75EVC2EiCNNp=MZbE_Q@mail.gmail.com>
Subject: Re: [oe] [PATCH] imx-cst: Add recipe
To: Fabio Estevam <festevam@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, otavio@ossystems.com.br, 
	Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Sep 2024 23:58:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112123

Hi Fabio

On Sat, Sep 7, 2024 at 3:02=E2=80=AFPM Fabio Estevam <festevam@gmail.com> w=
rote:
>
> Hi Khem,
>
> On Sat, Sep 7, 2024 at 5:48=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
> > what's the rationale for proposing this to include in meta-oe ? is it
> > used for non-imx platforms ?
>
> I should have explained the rationale in the commit log, sorry.
>
> Multiple layers include the imx-cst package and offer their version of
> the recipes:
>
> - meta-freescale
> - meta-secure-imx
> - meta-phytec
>
> and probably others.
>
> The idea of having imx-cst in meta-oe is to centralize and maintain
> the efforts in a single location.
>
> The imx-cst package is i.MX specific.
>
> I can improve the commit log and submit a v2, if you agree.

Thanks for explaining and yes add it to commit msg in v2 would be good.

