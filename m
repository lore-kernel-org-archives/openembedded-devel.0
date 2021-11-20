Return-Path: <cazfi74@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7C9BC433EF
	for <webhook@archiver.kernel.org>; Sat, 20 Nov 2021 06:54:04 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web10.4913.1637391240791215261
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Nov 2021 22:54:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dTe4Xdb2;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: cazfi74@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 131so34567135ybc.7
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Nov 2021 22:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6raiIA3VBMuGh44Y+2sBmE54XBEeHhTRqwlA0o0Sij0=;
        b=dTe4Xdb2o3kO3Z4sJe/Tmvp8Y5GYia9zMwY2qslJTSgEIZGiZKcRmcaFsLX1Zcp51U
         stmVdYaJP+cLWMcxIUXT09rY/7hMvwVVKJWEP7f4cRTeCleMlaHwJ3S5rxKZZjtV1cDT
         0TMnFh2WyOwLRsh3ufoOya43+IH0pQ9GAWcBA/rPoHElLy9v7lrYqxouNveqFw7NIrsS
         85usK1CigdNcIOPtxMfz59EfJPQyF4+fkZtZXlVK4u9IqUho1Go7jEygR1hPNfzKl8fg
         LR10PxrME57TZ3Qf2vmmueSbVkeqOK1aSw8tEUDKMjUdOuqW8P5TZ3Prvps5E55urTof
         euHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6raiIA3VBMuGh44Y+2sBmE54XBEeHhTRqwlA0o0Sij0=;
        b=Eyf50tRD7t5FpZLdvTf5SXl7YxV0JvV9XZvxLv32lQMrz23OytjgAm8Vhw7RSekhEX
         UbRkNi79gqkOPvv3ZAu6ZHgL0HtTQtjjSUWsBEdeFStCybhvorif1AwAm33bjHoWYtBG
         diTnyLdlu/846JjYn8qsAwMfRoyQL64BGJe5Ljzve987pTIAKhna0xgD17XjUGr6p2GB
         ocWU4VhcRL1ifMUFkJ1/ZqK6gYi4KfLN9ZzFUROOOTVR2SSzB0SippVSfQTHxAG4zJpH
         TbIc4a3Khy1+3X7ouGAcOKJwZJHjdMdDHCk6mEa16cr6WI8upS1Vjh8J/2Y11Y8jyyz0
         Pawg==
X-Gm-Message-State: AOAM533Dr8m5dCwTUtK+SRRxkBdtSiIkMCdGS7ZqsyNj8hKo/fbmGnsn
	2f1au7NP+G71k52A9nnDsdGfwrwL6fRzk3j+l7Y=
X-Google-Smtp-Source: 
 ABdhPJxQRbavBaHO/1jlDibo2t4Ndx2eXepr5I9qKdC4idNpnKL/S8VW2jwEGLRgh/mwSh+CMI5N39Inx5B5NlD8+e8=
X-Received: by 2002:a25:8411:: with SMTP id
 u17mr44992153ybk.376.1637391240015;
 Fri, 19 Nov 2021 22:54:00 -0800 (PST)
MIME-Version: 1.0
References: <20211119220833.133927-1-marex@denx.de>
 <7fca4b13-199a-ff2a-4680-370cb8a48a01@gmail.com>
 <16B92E0E734D3B91.8839@lists.openembedded.org>
In-Reply-To: <16B92E0E734D3B91.8839@lists.openembedded.org>
From: Marko Lindqvist <cazfi74@gmail.com>
Date: Sat, 20 Nov 2021 08:53:48 +0200
Message-ID: 
 <CAF6bG8fe87WZ+zVD88ngjyZwes7QEDm6ruQFc5XDNdOcsHrn=A@mail.gmail.com>
Subject: Re: [oe] [meta-games][PATCH v2] neverball: Add neverball
To: Marko Lindqvist <cazfi74@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, Marek Vasut <marex@denx.de>,
	openembedded-devel@lists.openembedded.org, hs@denx.de
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 20 Nov 2021 06:54:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94075

 Branch parameter is missing:

WARNING: /work/openembedded/meta-games/recipes-games/neverball/neverball-data_git.bb:
URL: git://github.com/Neverball/neverball.git;protocol=https does not
set any branch parameter. The future default branch used by tools and
repositories is uncertain and we will therefore soon require this is
set in all git urls.




 - ML


 - ML

