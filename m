Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68E15CF9C5F
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 17:44:02 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web11.24278.1726854233274504643
 for <Openembedded-devel@lists.openembedded.org>;
 Fri, 20 Sep 2024 10:43:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AFzCZnc5;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5e1ba0adcb0so1183149eaf.0
        for <Openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 10:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726854232; x=1727459032; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Umtp6WoZbdPvag2l6L2fv/NEWDw1+dy73Xub/2L8RSg=;
        b=AFzCZnc5DOYizZBtdL9NWXadJPiCWYJR5NlZFJQi/ES/5r7DjQmG5qk/lvK/rrLAh+
         ImF/XxyuW0T/Sd50s+SNn4EsrkwLnjZx7a0KmR5yCW37FcacNqR79HixZFcLIhpsVrEk
         xN/X7hLeRWjNbLf+fYL29zM7Z6Ipi1Khxja1/FxmA6QiEeekk72ypBi4CBTSmfug9Pfl
         D61hEstDHhQc0rMb3cruWQhYw0Wti9oG/NnjvfqaWLjgJxocCu6YPENh6mcqVYnbfICu
         z0F0ZS0UKc4/dtOrJYuAAy2lsfw/jjawtRZja0O02+enWH4CAUEdHW5uAUaXp0vULl+j
         4emw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726854232; x=1727459032;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Umtp6WoZbdPvag2l6L2fv/NEWDw1+dy73Xub/2L8RSg=;
        b=hy9LpsSt3xaMszUE3AA0PkGJM9vEn9G6RafBCmmI3J+ITtlRouuN+Hlb7xrNP8MfT/
         LDV9wYikLrLGXGNkrg73zw3JhUuGWi1djdOmcsjKUmRUaWLe4YPydCA7YPF4V2Oqn5Hf
         x3KFumBdfT1UnI0LQdPkDrCbqp9JR0J9QkdF9C1FT+XLOGutQcI+QHOTG0w/IvUR0L33
         ziXrGpJK5u7gSPsiDovI75YJUlGTIRKA4uuKRpfPOyng/ah8zpioCS809xJRhOGwygIo
         W9LDZa2s+Yx4sF6Twwt8aEyvrDN7ho9aQOQGjCg2hTpmaB5VYzHmBMybE0u36zrhp2gA
         agwg==
X-Gm-Message-State: AOJu0YzLea8twkuh56nYLh666kF9S2buwZgGtSkMUeAy/F1Nl5wG4+0f
	S6JUwVyKBdxmrvzO67U/WuRGGG80MZxbi14TPUgcAnHIxqxtrlntYzggV1XwDeUvCgudYQxyfkj
	rckhRG44vNg7OF5apiJ36dxSBnppOzVjR
X-Google-Smtp-Source: AGHT+IEpzdYJAjwSuwsbsjBdmEr0bMQVmZe3BmFJpyA8dt73rRA6c/gD+i6/8PtyIkXutet52MT92Ul+KROoDGWoR30=
X-Received: by 2002:a05:6820:1c98:b0:5d8:e6a:236 with SMTP id
 006d021491bc7-5e58ba5d1fbmr2218841eaf.3.1726854232268; Fri, 20 Sep 2024
 10:43:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sopXXE0pCtYV-RZHRoSVbjYfFpxd6wDxdhJhN3dYhq4dg@mail.gmail.com>
In-Reply-To: <CAMKF1sopXXE0pCtYV-RZHRoSVbjYfFpxd6wDxdhJhN3dYhq4dg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 20 Sep 2024 13:43:26 -0400
Message-ID: <CAMKF1sq4P7Y3Hq2tURMSY7arMc0T03WyM6bm2NRys1B=JwwfoA@mail.gmail.com>
Subject: Re: meta-openembedded styhead release branch update
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 17:44:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112427

I meant to say "styhead branch is now" instead of "styhead branch is not" :=
)

On Wed, Sep 18, 2024 at 8:57=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> Hello all,
>
> `styhead` branch is not available in meta-openembedded repository. Armin
> has agreed to maintain this branch as part of his release maintainer
> responsibilities.
>
> Help out testing it out with styhead branch of core layer and other layer=
s
> so we can weed out any issues.
>
> Send out patches with [styhead] marker in subject-prefix. This will
> help in applying them appropriately.
>
> master branch is open for regular development.
>
> Thank you
> -Khem

