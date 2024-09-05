Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D146CD5BAB
	for <webhook@archiver.kernel.org>; Thu,  5 Sep 2024 11:37:07 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.7026.1725536220190863843
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Sep 2024 04:37:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f6Q9567l;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f64e82aeacso8179521fa.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Sep 2024 04:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725536218; x=1726141018; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SfRLwl9aQeZjwTgRK1mODjWFynJC8pa/yCWdRRSvuKg=;
        b=f6Q9567l0yqI/DMO04fiXih1VlTSByFsWreTbGDcvrm9PIkKkPuN/dQ9rTrOjM0aAW
         uapfkoQ0ZRBcwWdfv3G9ZKpuMIKPAlXNXvgkplyJ2YD+/XGYRoLIA/OuUVn0W+6X+jHd
         o/+r4UZBREpSP3oZhdrmn3yXkA/cIBMqn66df9adX5+5Fjz7VcecZc9AQIWFOtanHXGF
         8I8TnPK9jAeu7kd73sfzUC26/Ybjf3xotplerkstTXVpQ0VTg+YmoPEshFyYyMm4FrxI
         95Yj4iggTTEeg/71fVU3srNXmJBGfx0zFtiLJtHg8BlpE88kAGu/0IGdGHVg7I9jTwlF
         ZVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725536218; x=1726141018;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SfRLwl9aQeZjwTgRK1mODjWFynJC8pa/yCWdRRSvuKg=;
        b=BmNC00oVQ4GWHd4oJkEadesJKT330BhEMdKC9Y54Xz1dNpIqNG5Vk/3ChzWyirJZLU
         NGMn6BHtqFXFxomAkU1nKJAFOTd5Rzb87SByaO2nRrNGbI3ErnncC3rg5gRI5gevC4W2
         dL0GQgpli5UEdKmo50UR/lpCgTu0DdQPFIp10fSPAEGvVa0+7hXKyF+MYynM3qcisO/W
         UVI6MGQSLyEIOSCEMIllPVdiZDEAECg2Jyedj9kK0SpYgAhVT+8WlFY2eIgKGoCna1ly
         xeuSTtPVJ31UEjyMYqq4SNRik+y25Nnflmzh0nYMk5n+c9i1yN5Q5oo+uE4fob4BFrNf
         lnlg==
X-Gm-Message-State: AOJu0YxN3TbazLkRu2lb6K/5cTZlIqfoD2ml8s5EgBhVVf9g7WeRvL9s
	oeLEQkVlBqW5T5cERu1k6ETOAxpbFykNx0Ln1anc2C1GzPoHaKx2BmofDxd8t4Mybylji0X6yYW
	n3E2v7Ndy2kLJaYRsGhRdL+5xazA=
X-Google-Smtp-Source: AGHT+IHzio5cpIgYeRqCwkhnZx3mmm0xKondUfZRL8K08K0kDZIZOWtJuNjrhHAFpPa+D5cUgkHbVbR+EjfrzJUyWUM=
X-Received: by 2002:a05:651c:b1f:b0:2ef:22ef:a24e with SMTP id
 38308e7fff4ca-2f6443face4mr82991991fa.10.1725536217345; Thu, 05 Sep 2024
 04:36:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240905093005.2731956-1-yoann.congal@smile.fr>
 <CANNYZj8WR11Cm+Chio-FeS-tpS3Ydi=MTM1ivVTuNXZ6eXktLw@mail.gmail.com> <CAMSfU+6NAhDtNwYgGXibbR7u1cVTE7snm3+2yAunmHYUxAEAtA@mail.gmail.com>
In-Reply-To: <CAMSfU+6NAhDtNwYgGXibbR7u1cVTE7snm3+2yAunmHYUxAEAtA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 5 Sep 2024 13:36:46 +0200
Message-ID: <CANNYZj9M-foBdCVoJ3hpUiNEbA2aD_Pa20Hb--ALMJAOqf=vhg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2 1/2] polkit: Switch PAM files to common-*
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Sep 2024 11:37:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112103

On Thu, 5 Sept 2024 at 13:07, Yoann Congal <yoann.congal@smile.fr> wrote:
> You mean submit the patch in v1 upstream?
> https://lists.openembedded.org/g/openembedded-devel/message/112093
>
> Why not! I'll do it, let's see what upstream says.

Yes - another possibility is to convince them to define an option
named 'generic', so we don't run the risk of future suse-specific
changes getting in the way and causing regressions.

I definitely prefer v1 patch, if it's sent usptream.

Alex

