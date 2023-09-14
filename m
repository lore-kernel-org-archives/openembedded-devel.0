Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0124EEAA4B
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 14:35:30 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.13997.1694702129675036349
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Sep 2023 07:35:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=i95xxwN6;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1d643db2c98so178143fac.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Sep 2023 07:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694702129; x=1695306929; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WTfMCaqC2jISgWkQlSeBKMopcbxphmoL5I7q+INqzAU=;
        b=i95xxwN6wZwHAOGl4FXu4m1oBZHBMVYDBl2hBSyMKs8uQg78X2DlzoBBTD++X4XgJF
         kJDH+kBoEFUtYKnZaJKTxkk+GaPtyQtXE6A3EuIPecfE7+Ae3fLzbex5xLJERZvGN7zX
         +O2qVPmr0dvaX5puiqIPIwmzphvjk6Uj1XZOtoanL9pwEkUPu1vdRAMCSNT2dPkamNUb
         PLXaGhdRqoFcap1ew2+mT8jXr0FJ2d79yfQ1S05CvYDlHcBAwsctzfe0G882eGRFGrJJ
         c2ARnhfGtuU4dXKAc/2Vhy7DCS5KSkXG+Nytj7lEj/E2BB/d2RYGLjLYYrw6+RJp8SCh
         JlhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694702129; x=1695306929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WTfMCaqC2jISgWkQlSeBKMopcbxphmoL5I7q+INqzAU=;
        b=D/kn+jzalEqeHGgQSHytmhJf35ZxsOUMpuaC7efywsGzTl0sVPCLgHBP2DYslbVG9a
         pHNfdwVCUNMds8Z/eKMSHuNTcrKkd9FIEt5DYJSy0C7RhBd8VxwtWyOItvn7evllRCJX
         pGysRsDoMnsbiA1DizXbNJF8aSCCBLh5oNchd2H4T883HGu0shMWmuhxWHIqutJ7uflM
         rwkS46OWeVliTUedImZcnXxOOkBpr9XmH1Tbaa3TLKC0LSQhcPdL6+tbr8i6n0nJySMO
         5Vzjq5uwLhNuF2xU1v0s8sGDUD67R0wa7sDydr0UrQzwC+fC3Lgl7HQHSrZSU53jrtmW
         XsIA==
X-Gm-Message-State: AOJu0YwsKob/fCF6CgbVCnyxDjvRAfic4iWqkCYctq93JWsa+2VWyjU2
	Nf+009yBFUI1j98IJhb5I9AuVaVwEZ+rcO9JCMA=
X-Google-Smtp-Source: AGHT+IHe9GuIr/XBHD4qOxNUVbbNonbbSkz/NCDpSb/pyFudM9lX8/QQbhF1qBmUbbjxABSvXg4SxrVOl4A2Ph9MiyE=
X-Received: by 2002:a05:6870:2489:b0:1c8:baa5:a50f with SMTP id
 s9-20020a056870248900b001c8baa5a50fmr6559108oaq.27.1694702128891; Thu, 14 Sep
 2023 07:35:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230914130631.182859-1-f_l_k@t-online.de> <CAMKF1sryxz18v8wavJc3hAxG+RQVD-51oEwfziKOVxHzBvVtpw@mail.gmail.com>
 <8ECZ0S.CJJI5JIUCNWO2@t-online.de>
In-Reply-To: <8ECZ0S.CJJI5JIUCNWO2@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Sep 2023 07:35:02 -0700
Message-ID: <CAMKF1srdC7TmtFESJ43Y+zdYAJNLwjThqKqJGCL1fd8-G1yFzQ@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH 1/2] webrtc-audio-processing: add
 recipe for 1.x
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Sep 2023 14:35:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104871

On Thu, Sep 14, 2023 at 7:32=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> On Thu, Sep 14 2023 at 07:28:21 AM -07:00:00, Khem Raj <raj.khem@gmail.co=
m> wrote:
>
> This setting S is redundant so remove it.
>
>
> I think it isn't, because without setting that to 'webrtc-audio-processin=
g-1.3" it would expect S to be webrtc-audio-processing-1-1.3

ah NOCOFFEEYET error on my end.

>
> By the way, the build failed for musl. I'll send an update

