Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B013CFB43F
	for <webhook@archiver.kernel.org>; Sun,  6 Oct 2024 16:09:56 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web11.33668.1728230989185896144
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Oct 2024 09:09:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XTYLvcG0;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5e1c65eb5bbso1944312eaf.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 06 Oct 2024 09:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728230988; x=1728835788; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kbwTTTfE1DPmNJkbenSqyUxiyZq58oFrwETQozJB1IU=;
        b=XTYLvcG0vMJa/Ag9mwuaFasGNuePeY5PQ0nLFCZ6npPjvqzH84g9V1KgwxxzLX313O
         poFT9NhHmEs17fJQvJpUcn4+IhLBvBZNNvdKneflmKZzR9T7Gv7QnKYMq+kW16hxhT/z
         GeTEtmryXZeKMrTeSulCo4osh8jPq0Ij2ijsbxL/iS++9YE+LOD8IyGzKSJAsDnKdIyh
         Ih4C7N08GQ6BS1Sv20rymPhK5H26gufQDQoC+l8N7U9INXOZ6KwwxL8GgT9tE9stVUZ3
         0pVttZJVE1HFbOyeytZ8u7ZFWc/SJJIdEWhvz9EWbohcGZafk8Gp0iyBNGEM3GiFpSPn
         In0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728230988; x=1728835788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kbwTTTfE1DPmNJkbenSqyUxiyZq58oFrwETQozJB1IU=;
        b=mU+v2/NBBGrM4Ttxzi94XZn2MDm7S1ndfyCFfFeVrEN4fj4BHxsR869SeJvxAxc6x6
         xqTmqVh2gPcypRxL/tOSWPTH2OvJuDdr6xbZYtAJlsIpd1SeVsI6nl8eb5HwBDtaKd7r
         EwfRMXyzrbe8V6HK2BpInZ0NnwnXp1OVKk0fvgPk6oFyE9BUhqnl2bqibW/mpTpFW7mw
         6rXjIBY1FujSmDn0VKX+8TKtwCLk8YRBO/u0G1k7Y/Jm+NTk8YoZdSsSBH/E7Rhd0eLN
         aa4F9Fp0NgRyegQcjzEPqJNZ8cXrSJbpIevfwgM8sgueL02OXE5F86SWnvBTAH2X+GpO
         sKbw==
X-Forwarded-Encrypted: i=1; AJvYcCX8DAsdoX96FJJt2PqvwBu2qWqhnbATnBJVMjTxFIS/uPoMQd8M7vwu8sKsg+DfTseBcD9VXBhRKZfe2GC0OFA64WU=@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywq3kGGcesmoaTd+H7XHexJijVYwbWzGZ25MGrGB3q2rrsxW6Rk
	6jM5kNBnHsDnNbcKgvzY+uaevC/vCXB9lrWzQ2XbC9X72iFKrJN1VIhsqFwuVcEs5zKOZ7iz+nA
	p6+pmqu9ZwebPA49MpGGS6ISZaEw=
X-Google-Smtp-Source: AGHT+IHyOgVwreYbwLK6j+enU1YUqq8MjV+uGFbwFjlBLD7j1780yexw1YF5ygEMBBgyE2oKawWFrcqgnc0TVFWGODs=
X-Received: by 2002:a05:6870:219a:b0:24f:c31a:5c29 with SMTP id
 586e51a60fabf-287c22b6dfbmr6568897fac.43.1728230988424; Sun, 06 Oct 2024
 09:09:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240924063229.2309109-1-quic_raghuvar@quicinc.com> <ZwKqfttwAQ-AhX74@eriador.lumag.spb.ru>
In-Reply-To: <ZwKqfttwAQ-AhX74@eriador.lumag.spb.ru>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 6 Oct 2024 09:09:22 -0700
Message-ID: <CAMKF1sqPgSf+fFoyBypBiHQ7f6vzhrum=i1ZnT-RGDkhom1ieg@mail.gmail.com>
Subject: Re: [meta-oe][scarthgap][PATCH 1/3] android-tools-adbd.service:
 Update ConditionPathExists to /etc
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Raghuvarya S <quic_raghuvar@quicinc.com>, Armin Kuster <akuster808@gmail.com>, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Oct 2024 16:09:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112684

On Sun, Oct 6, 2024 at 8:19=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, Sep 24, 2024 at 12:02:28PM +0530, Raghuvarya S wrote:
> > To ensure android-tools-adbd.service starts at boot, the path
> > for ConditionPathExists must be present at build time. /etc is
> > more suitable for build-time files than /var, which is for
> > runtime files. Changed ConditionPathExists from
> > /var/usb-debugging-enabled to /etc/usb-debugging-enabled
> >
> > Backport-of: 8106cfe769aa ("android-tools-adbd.service: Change /var to =
/etc in ConditionPathExists")
> > CC: Khem Raj <raj.khem@gmail.com>
> > CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Raghuvarya S <quic_raghuvar@quicinc.com>
> > ---
> >  .../android-tools/android-tools/android-tools-adbd.service      | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Armin, Khem, what is the plan with respect to this backport request?
> Could you please clarify, is there anything remaining on the Qualcomm's
> side? Is it rejected for backporting to stable branches?
>

It's staged in stable/scarthgap-nut so if nothing regresses it should
be in next monthly release of scarthgap
always check the nut branches if you want to see latest status of your
backport requests.

https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable/scar=
thgap-nut

> --
> With best wishes
> Dmitry

