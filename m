Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41DDDC28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:25:48 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web11.2335.1743578739177628898
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DjboZJQw;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5fcd61e9bcdso2825924eaf.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 00:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743578738; x=1744183538; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pB4f6DBvAzou6Q618cCd4qoXLHB1rOchLuJu3bWE/Ig=;
        b=DjboZJQwYyRRqGoHFlzjgPwMxzwXON8DowQHQ9yu/WzM2QOhW6oyiw4hIdmn12+iNS
         O6PV2NZi2Z+OydsLPHzAKDvAGJxHkAwcPr7jop8XMJ7/UYHir1Obq4pQcRm4Q6vetPnA
         FB3L+EBj4r85Q2xHDIbqBjijBTmIND7/3zSzopIUG2TJf3bzoEJ8iNaEprm0mp4isqgo
         fjuDu9Jr7U4FXhVOvWltNekHKki/G/SJl42Uwz9F9b+YDFp0McH9v/4em3IA+o51tyEZ
         QTKLgAwOeXPrdGeFDJIh6BBEBPWl7MMyHoTZh2ugcXG0Nao2OrCeTLUU2rGX+/71cCWT
         40+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743578738; x=1744183538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pB4f6DBvAzou6Q618cCd4qoXLHB1rOchLuJu3bWE/Ig=;
        b=lxqYlG0nbICP+N+yZvcNYYJIIQRfBt2HTF9DPF/NwzOU49TP+OOKm6bqXuhmK5USBV
         H/I8V+YF0lTckwdsSYZoqWrnX5zr60NlECJVq5NG33WACRu42w5PcG29RrxXYwJFce9x
         bRMDI70wQY7DaYxhey7RN8iOsrOkww5HcO1t90oOB2pc9NUW9F+/GxV4CgkXn1cPeS+8
         NNFKqyNQ8jsTil5nHI2OULzpuD72cySKCxJdz+jorG0iGzEKSJlP0jJgixZ7sDlGQbRA
         p66PBZ2abPEjQ6QeTFX0CAIbeICVULOwgaPPARlmhrg5BIfQl2UC8jJB3aqDi8A+OtQD
         bZPQ==
X-Gm-Message-State: AOJu0Yz5pbmEAPXoa5Q/2qR4Y4V2+GTHIOLsOK7Shmx6XsICfwafvDMp
	LLABFahxLT3xyQwqGFIy3f5C5bEYpNev62kdC7EIlzoiu6g7MvnSMvpo6/z9PclpQxNnKmg80qx
	xGYYuQE/0IC5tXfb03dwwdBsrxMUByEAu
X-Gm-Gg: ASbGnctS5oMqhhPBTVe3/bRiGWrDUYUgAXRAKElouHTPSvk0UvTGrqPRVrcxz4be3cf
	T96hXSAjCCAwvJS6lP3Ph/eK6ZVxiYgjbDXm4/+cOjMOYss38oS8C8Ke0U5GhKcWS6Kcdk9+HD4
	m1ULIKraUG7bGgyE/uv1pMEb9yD8KVxeqN1w5Xe9YM
X-Google-Smtp-Source: AGHT+IGqY07lfqVOLwDcSC1yqRKP8/S1L43ATcyPfADKH5lHItp8YP6qAX3+AvtNT0WRuca/q9LB8UKD2caUE73ZwOw=
X-Received: by 2002:a05:6820:620:b0:603:e736:929e with SMTP id
 006d021491bc7-604004541b3mr601107eaf.7.1743578738387; Wed, 02 Apr 2025
 00:25:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250310202922.4072091-1-raj.khem@gmail.com> <bd65b4f7-b93b-4c84-8796-e82168decaf6@axis.com>
In-Reply-To: <bd65b4f7-b93b-4c84-8796-e82168decaf6@axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 Apr 2025 00:25:12 -0700
X-Gm-Features: AQ5f1Jr5n9LSxnCy9CMfH0h1qjLxyILQRHPhzpI5Cn7KbUzHWOaxAhUTfXq7a7Y
Message-ID: <CAMKF1sqgNDKhuHQ=6Hrv-FtKmKh6_U0v+Lfom6UcKZ9_c5R_XA@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] Revert "crucible: Use go module fetcher"
To: Christian Lindeberg <christian.lindeberg@axis.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 07:25:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116507

please do

On Tue, Apr 1, 2025 at 11:18=E2=80=AFPM Christian Lindeberg
<christian.lindeberg@axis.com> wrote:
>
>
> On 10/03/2025 21:29, Khem Raj wrote:
> > This reverts commit 8d635b0510c86a80261a461f833142d2bdfad0f0.
> >
> > gomod fetcher fails for this see [1]
> >
> > [1] https://autobuilder.yoctoproject.org/valkyrie/#/builders/82/builds/=
211/steps/16/logs/stdio
> With the fix for the gomod fetcher mirroring problem now on master,
> https://git.openembedded.org/bitbake/commit/?id=3D7762cea087597019460d66b=
04268757bd46befdf,
> I will send the patch again.
>

