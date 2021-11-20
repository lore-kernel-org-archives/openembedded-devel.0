Return-Path: <cazfi74@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 903CBC433F5
	for <webhook@archiver.kernel.org>; Sat, 20 Nov 2021 06:42:59 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web08.4981.1637390578785964562
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Nov 2021 22:42:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UWp5Q0BL;
 spf=pass (domain: gmail.com, ip: 209.85.219.172, mailfrom: cazfi74@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id v7so34735088ybq.0
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Nov 2021 22:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EZsKjoF7eRSJ9MjlBQJaqlB34LqxikBmds+/byN3nhE=;
        b=UWp5Q0BLYAB6Vipip3sLD64nXAoGEO+DL5gDmPPgM3drJnl8XpwPkWtdbNlnZ9+sDI
         y6DwNchazTpJ1Ghh6iCjbSm/vcrGOkrdrgAk2uMYvL4K1mCRi2gc3fSYYixdCk7clSFG
         oeUU6v1Kwe2ntf9bpJll6yMSaxsLNG/b6WXLaRYsUY9FEAPu+P+Uppn/IsCX3knR9Btj
         1Jeu3cjftwr89mHS+6Zk1wKRgQwDhxV9onSTTLKhKKa73OZmZR2kKHRhhKh/aisBbyUD
         1xfVL/WC12QlD262QgI9OI/eI5gJoT9t8fexISg/LaQV/dtgWCt3MapOr9Ywh4LuIN+D
         ugLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EZsKjoF7eRSJ9MjlBQJaqlB34LqxikBmds+/byN3nhE=;
        b=znQVOv80wkJNbu4OsnbbFUn5T1MHP06YedW3Q0pMsQkNf/8fgyRc1u8DMl3MkfBmNp
         NvhvEqHgnH7K6fp4Ap3I5p7UAmPpHys6U8hN+8aCUuEGBCXSc4mUZK2THO/SBsf+J9Mb
         l4X5UPpJ5Kzb+JBZvzEJC0noaLE+JZTZo2+NS64jZGKUOVn37OA4kmvTj/VFw0Z+Vvgk
         eeUOQn1tlm94XW5j3cKADRWT8uL6fN6v/ba5z546BxA44Jzs8P9hm4mpiyntXhSWiPsW
         Fy0pUmpwekttfnr2E5AzOqyS48OvA81c2KAueJOKt4JKNkir0ON9ukK3GaqP1ddIhmZI
         TSKA==
X-Gm-Message-State: AOAM531BmTKocmjROjwbG7z3qZHM0hJoAgrDuYzfCz4iO9kM49SRhNc1
	EYYv4fuqqsJByFXG+vbUwJ15ziRoae/CClyROWM=
X-Google-Smtp-Source: 
 ABdhPJw4syw5Nj8TKJAVii4mGKWqQgtiU1UTjJQs0GFHgU1yBJxTpZ6IPl28QtFKSJsiF69Ncu9Zi7Z/l24OUGMLjJM=
X-Received: by 2002:a25:ec07:: with SMTP id j7mr42646690ybh.313.1637390577972;
 Fri, 19 Nov 2021 22:42:57 -0800 (PST)
MIME-Version: 1.0
References: <20211119220833.133927-1-marex@denx.de>
 <7fca4b13-199a-ff2a-4680-370cb8a48a01@gmail.com>
In-Reply-To: <7fca4b13-199a-ff2a-4680-370cb8a48a01@gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
Date: Sat, 20 Nov 2021 08:42:46 +0200
Message-ID: 
 <CAF6bG8f9xb2qn8sDkAtz_6xKxGKwFkudFFUZTQJoUaa8qPa=og@mail.gmail.com>
Subject: Re: [oe] [meta-games][PATCH v2] neverball: Add neverball
To: Khem Raj <raj.khem@gmail.com>
Cc: Marek Vasut <marex@denx.de>, openembedded-devel@lists.openembedded.org,
 hs@denx.de
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 20 Nov 2021 06:42:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94074

On Sat, 20 Nov 2021 at 03:12, Khem Raj <raj.khem@gmail.com> wrote:
>
> On 11/19/21 2:08 PM, Marek Vasut wrote:
> > This is an interactive game with a rolling ball, useful for
> > testing whether point sprites work correctly in GPU drivers.
> >
> > The user should install both neverball neverball-data packages.
> >
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > ---
> > V2: Use cp -R --no-dereference --preserve=mode,links
> > ---
> >   recipes-games/neverball/neverball-data_git.bb | 16 ++++++++++++
> >   recipes-games/neverball/neverball.inc         | 26 +++++++++++++++++++
> >   recipes-games/neverball/neverball_git.bb      | 16 ++++++++++++
>
> hmm, these recipes should belong to a layer, perhaps meta-oe or
> meta-multimedia

 I think this was meant for meta-games: https://github.com/cazfi/meta-games


 - ML

