Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF28AD44D48
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 10:39:15 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.42720.1730889548707118235
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Nov 2024 02:39:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bnsvx9au;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: festevam@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fc96f9c41fso8482711fa.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 02:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730889547; x=1731494347; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5/40fTIFhZnregJDybnEEv1qoPlydudDcHJVUKxtm0=;
        b=bnsvx9ausco79jg2Z5NRmMp5t4JTdWP1jMYXAWJot0LkWvag1tErNdTUTrhJVB0JQB
         BbmE9LNRfrnufBTAVwYvOBEVxbrt9VOzwhNaqvoU8o7/kiBbGn/q/4vPK6iRASSSoOrH
         SNicIupAnmPwOUQwuz9G3uiqy3OORlEx76FMc4q+MkgFJYq8pY5PyrzN97juqZ+zYC4+
         sgo0HXnjbBAmZec/YjoDlbBrFzrmcvyu4ewIzmNXibwte6AXNLfTdY4iJRJyTysD5N+G
         Lug+mquyITtHngIPxezv05I7P46FfYaxXCTjgOEZgzqdQUdylbPDKvPqqM3tFClE5tgy
         Df+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730889547; x=1731494347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p5/40fTIFhZnregJDybnEEv1qoPlydudDcHJVUKxtm0=;
        b=lYehKCCPeRPKpQ5ZOaOTXIdpJ2a3wC5n0Tv5y03yWqE9fNMf1Orsb6cFKI8iy8tQCH
         DtCBWa6d8h0Dj8rVi525PdUswPEHJ/CeYSxy/QOal+ZMNprKoHionqFtMHJgnx//PhoP
         aCRYxIRvLBkhnt/P+zLuRh8IzdN6a+0Mj7K7HntjPeYjmyjsiQ1UMxQPyUGd+Pc/R68V
         eH6s/ulhmPbpIXJDKNeU4TE9I3d64kwrzV3UJ1RyJO8ZAND0m0b21hcEHSQ7BcftCje3
         VnmUDk2Xm+0Lu+hZc2mfm1qw32PKXNhra55Uap5jc8rxR+F+CrWsagZJQaO4qeiCsuaF
         JGpg==
X-Gm-Message-State: AOJu0Yywfz00rSgLOqWoLzqY1JP9TJdiaJx6/yq6t//FYm90QFJJgojQ
	JnWFOpWGg4R6VmahHkGWHnH/JpTAd9sdffVg5p4VU+rtgUeLi1Hed6XsZ21qPfzwzYhI/OkWEXA
	CtcwHatHuTNFW13ZA/MvLHf4FduX8EA==
X-Google-Smtp-Source: AGHT+IFPUfO/lR5StGoDnVl87udC1/BLRRcbUZ0wAd8h+SAS5L58I58IiEwdcT0pQ1rlAtvfFK4urJkwMnhKkM3VP8A=
X-Received: by 2002:a05:651c:154c:b0:2fb:6110:c5a6 with SMTP id
 38308e7fff4ca-2ff0cba4b46mr7355541fa.8.1730889546155; Wed, 06 Nov 2024
 02:39:06 -0800 (PST)
MIME-Version: 1.0
References: <20241106103614.281919-1-peng.zhang1.cn@windriver.com>
In-Reply-To: <20241106103614.281919-1-peng.zhang1.cn@windriver.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 6 Nov 2024 07:38:54 -0300
Message-ID: <CAOMZO5AJt0sdQroX6-9to1ERuJNg8Q+T_=0rG0-ekRd-2Cu1ew@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] parallel: Add recipe for GUN Parallel
To: peng.zhang1.cn@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 10:39:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113736

On Wed, Nov 6, 2024 at 7:36=E2=80=AFAM Zhang, Peng (Paul) (CN) via
lists.openembedded.org
<peng.zhang1.cn=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Zhang Peng <peng.zhang1.cn@windriver.com>
>
> This recipe adds the parallel package, a shell tool for executing jobs
> in parallel using one or more computers.
>
> Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>

There is a typo in the Subject: GUN -> GNU.

