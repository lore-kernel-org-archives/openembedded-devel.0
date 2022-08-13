Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 890AFC19F2D
	for <webhook@archiver.kernel.org>; Sat, 13 Aug 2022 14:08:44 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web09.5207.1660399717738621708
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Aug 2022 07:08:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EbEvFbx1;
 spf=pass (domain: gmail.com, ip: 209.85.128.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-32269d60830so33040767b3.2
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Aug 2022 07:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=6y9q0K1benvr3QGYvpohfjGfTeY7o9GFuwXPqC/AcU0=;
        b=EbEvFbx1vqSAxA5MamiCFty1HMEo76bu2GVprHOhXCw/q250xvkTDWjpmr8iYOv/mX
         H49FPAslgj6p442L4J0IBjTkpD5qJcRs5IBxsB/Jt2zA5v14eZ3bRcJjvOcXOpZR8fVq
         j7Oho1u8BX6Nmsv9AtT6R3dv8o9wegs7zjQkgy2qXFo7H2VBzcF4XOOMt5Ii9Tx+0u/h
         4ljL8SCWHetu+6CA6lMqx2UwiEpLuS5sMH47Qt+MIh4dfBIa5oavoD3rVHstQUvRz7dQ
         LjnEaZWezNjmQDFcBG+jdgkrVmG8ltv279kNEs3H6jMCfbJj2tDJaHXgS1oDWkV47bNZ
         pulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=6y9q0K1benvr3QGYvpohfjGfTeY7o9GFuwXPqC/AcU0=;
        b=aloudfewMhJSXXfZIQq/IfAAhQBnzVaVnVQFUDkoYbpJFKj4GYK4tO652lLi9DrMPD
         oeSef6gENyeC9ftpbVtF1v+jR7JnAx8B+azJWOMfiAWqQc/B2JdGVpiAT3BPOAhK4NK4
         gEuDXO8rtY0QnLgze2UyYeDUZLOvleNUntkLvTUq0kaNyoA3MyZUcDsegay597j6nX7p
         +UF2mv4QcdXfcBWkuQJdEPZKL/6DAsDRNk0Q3ctMvWZFaXjUBrhAWvnKTANpuGluWNkw
         BL/G4W4hknOw2erQKAzcfQh4pXzs8wujcTOHe4Nn58bnqS7tORIWLYOBo2jAEALvPQfl
         jJhg==
X-Gm-Message-State: ACgBeo037prY9EQ8+9P0Zsm8BVUWSIHDVf91N2CxVOdxphzUZ9qav0r7
	MwPlAOf1Evk1HALUJ7oB8TUpYbOfrIK9SiGB/wE=
X-Google-Smtp-Source: 
 AA6agR47KKu6KIzhwtK1Apyw23pZT9qN5MOJpHPlvFoJnGdegKZpsoYUBalpGZQJYOJ2zUmzjclgvt6jAslZgJnGFvI=
X-Received: by 2002:a81:88c5:0:b0:31e:f1e:dc23 with SMTP id
 y188-20020a8188c5000000b0031e0f1edc23mr7819858ywf.139.1660399716644; Sat, 13
 Aug 2022 07:08:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220812091458.1395202-1-changqing.li@windriver.com>
 <b0229209-e6c6-0c14-298e-b173532e6409@windriver.com>
In-Reply-To: <b0229209-e6c6-0c14-298e-b173532e6409@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 13 Aug 2022 07:08:08 -0700
Message-ID: 
 <CAMKF1sphy2-znVeZBB6tE2x7w=nPXgOeZr7jx4p4AbuO7P2DQw@mail.gmail.com>
Subject: Re: [oe] [kirtstone][master][meta-oe][PATCH] redis: fix do_patch fuzz
 warning
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Changqing Li <changqing.li@windriver.com>,
 openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Aug 2022 14:08:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98228

On Sat, Aug 13, 2022 at 3:10 AM Robert Yang <liezhi.yang@windriver.com> wrote:
>
> Please hold on this patch, we need a V2 to fix the multilib do_fetch error.
>

dropped. thanks

> // Robert
>
> On 8/12/22 17:14, Changqing Li wrote:
> > From: Changqing Li <changqing.li@windriver.com>
> >
> > Fix:
> > WARNING: lib32-redis-7.0.4-r0 do_patch: Fuzz detected:
> > Applying patch GNU_SOURCE.patch
> > patching file src/zmalloc.c
> > Hunk #1 succeeded at 32 with fuzz 2 (offset 4 lines).
> >
> > There are two version of redis, and need different GNU_SOURCE.patch
> >
> > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > ---
> >   .../redis/redis-7/{GNU_SOURCE.patch => GNU_SOURCE-7.patch}      | 0
> >   meta-oe/recipes-extended/redis/redis_7.0.4.bb                   | 2 +-
> >   2 files changed, 1 insertion(+), 1 deletion(-)
> >   rename meta-oe/recipes-extended/redis/redis-7/{GNU_SOURCE.patch => GNU_SOURCE-7.patch} (100%)
> >
> > diff --git a/meta-oe/recipes-extended/redis/redis-7/GNU_SOURCE.patch b/meta-oe/recipes-extended/redis/redis-7/GNU_SOURCE-7.patch
> > similarity index 100%
> > rename from meta-oe/recipes-extended/redis/redis-7/GNU_SOURCE.patch
> > rename to meta-oe/recipes-extended/redis/redis-7/GNU_SOURCE-7.patch
> > diff --git a/meta-oe/recipes-extended/redis/redis_7.0.4.bb b/meta-oe/recipes-extended/redis/redis_7.0.4.bb
> > index 993ff34b10..e292237097 100644
> > --- a/meta-oe/recipes-extended/redis/redis_7.0.4.bb
> > +++ b/meta-oe/recipes-extended/redis/redis_7.0.4.bb
> > @@ -16,7 +16,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
> >              file://lua-update-Makefile-to-use-environment-build-setting.patch \
> >              file://oe-use-libc-malloc.patch \
> >              file://0001-src-Do-not-reset-FINAL_LIBS.patch \
> > -           file://GNU_SOURCE.patch \
> > +           file://GNU_SOURCE-7.patch \
> >              file://0006-Define-correct-gregs-for-RISCV32.patch \
> >              "
> >   SRC_URI[sha256sum] = "f0e65fda74c44a3dd4fa9d512d4d4d833dd0939c934e946a5c622a630d057f2f"
> >
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98227): https://lists.openembedded.org/g/openembedded-devel/message/98227
> Mute This Topic: https://lists.openembedded.org/mt/92976372/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

