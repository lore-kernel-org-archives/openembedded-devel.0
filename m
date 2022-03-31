Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEF2EC433EF
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 18:45:17 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web12.920.1648752316601210130
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cL7aWgoR;
 spf=pass (domain: gmail.com, ip: 209.85.214.182,
 mailfrom: schnitzeltony@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id w8so370722pll.10
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e/cfBWuJe/SmNSgnFR4yTeWSN9uFrzUvn8pDSTZ3JM4=;
        b=cL7aWgoRtSbYYMB9gRA8BXW2YeYxpp5XLDGuhGwOmG/Ig6MiLf19JMI1qG6wHxjF0Y
         CFx0C2GJj1Cixf+7SgDs4Bnt4ndwvGRN2b7UpfenpbyfRwIGn4Wlsww8JTvDqst1oPdQ
         Ktjl2x1uBAWFK5qzEhWY1hsvFZQUVZKyHBJ6ybmFYpoLV9PqHL9WJcvIpooGxukiSIGj
         WxrjBsEeuyp3Y5Z1s3VV3qEtYb1OI4Zabxt1/TIBDuTfDsXNNNAF8DM0UmZChNMuiKyl
         5PZzU6Y25rxTMyLwelijZ0uYVH7JVr7FpYjmLaWZ3r002Utq03ehKayPnWCHiTfSoAgR
         FbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e/cfBWuJe/SmNSgnFR4yTeWSN9uFrzUvn8pDSTZ3JM4=;
        b=AIyQ22JN7YOlIg9/d1M7ckE9o6gusqQuYp7NLazGjIMfsotWSJmwteULMgW0dp1tH8
         F4+6vGQOfQRUuH/0BRiTTlcIWfinT40Hc8M7v20481czr1MibXhPTIbw6gw5BIg+fbM5
         eDshXvqIJNdO1b9cMTVqJV4hB8NnuYs2F4htEDae8tmcX7DWUoDYiJQf0ku24KF+9Khv
         qa+YiYM+fldwN5/FJ8K7tYEnAh3PovaO1weFmY76pAhh+WyhTd20yKFtTTw2aM5W+HV8
         nHtWyGXZypnAZuxzI0Q38coOi1059xWYxFzsQvbiZSGz4KrWO/q60vR/MCKOWOU8TVGD
         6yXg==
X-Gm-Message-State: AOAM531XFsmyaITYU5Wfe0Z1qAtVXHfnWzt9N4xvg+vENqlbrHGqldtb
	AX1fBzQVkzqnvfb5wvm3lcTqSXGqjn51jmlLNYw=
X-Google-Smtp-Source: 
 ABdhPJyXaC4vyWGbuWt0iX2t+BQ7snlAly71IZI91hCE1+ypRpFHxnOcYV4ln5eE1vLys+WzaBtjaCPPZd4MXgjC8AA=
X-Received: by 2002:a17:902:c105:b0:154:81e0:529d with SMTP id
 5-20020a170902c10500b0015481e0529dmr6439009pli.1.1648752316034; Thu, 31 Mar
 2022 11:45:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220331064935.2763629-1-schnitzeltony@gmail.com>
 <20220331064935.2763629-2-schnitzeltony@gmail.com>
 <CAMKF1soHzWsBnGVWH4ZPmbb=C=_KSD-b_1xFOq7u30eS4D09NA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soHzWsBnGVWH4ZPmbb=C=_KSD-b_1xFOq7u30eS4D09NA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 31 Mar 2022 20:45:02 +0200
Message-ID: 
 <CALbNGRRW4RDt=d78QQ1h03OfHcPyVo=_VW9kh9HjZKKjcUHbsQ@mail.gmail.com>
Subject: Re: [oe] [PATCH 2/6] gnome-commander: initial add 1.14.2
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Mar 2022 18:45:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96304

On Thu, Mar 31, 2022 at 6:09 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> seeing this build failure on arm64 ( I use clang )
>
> | In file included from
> ../../../gnome-commander-1.14.2/src/intviewer/searcher.cc:27:
> | In file included from
> ../../../gnome-commander-1.14.2/src/intviewer/libgviewer.h:40:
> | In file included from
> ../../../gnome-commander-1.14.2/src/intviewer/viewer-window.h:27:
> | In file included from
> ../../../gnome-commander-1.14.2/src/intviewer/../gnome-cmd-includes.h:24:
>
>              | In file included from
> ../../../gnome-commander-1.14.2/libgcmd/libgcmd.h:26:
> | ../../../gnome-commander-1.14.2/libgcmd/libgcmd-widget-factory.h:167:70:
> warning: 'format' attribute argument not supported: gnu_printf
> [-Wignored-attributes]
> |     void create_error_dialog (const gchar *msg, ...) __attribute__
> ((format (gnu_printf, 1, 2)));
> |                                                                      ^
> | ../../../gnome-commander-1.14.2/src/intviewer/searcher.cc:303:5:
> error: cannot initialize a parameter of type 'gint *' (aka 'int *')
> with an rvalue of type 'void *'
> |     g_atomic_int_compare_and_exchange (&src->priv->progress_value,
> oldval, (gint)d);
> |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> | /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/gnome-commander/1.14.2-r0/recipe-sysroot/usr/include/glib-2.0/glib/gatomic.h:160:44:
> note: expanded from macro 'g_atomic_int_co
> mpare_and_exchange'
> |     __atomic_compare_exchange_n ((atomic), (void *)
> (&(gaicae_oldval)), (newval), FALSE, __ATOMIC_SEQ_CST,
> __ATOMIC_SEQ_CST) ? TRUE : FALSE; \
> |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> | 1 warning and 1 error generated.
> | make[3]: *** [Makefile:521: searcher.o] Error 1
> | make[3]: Leaving directory
> '/mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/gnome-commander/1.14.2-r0/build/src/intviewer'

Looked into this and think the code of gnome-commander is correct.
Looks to me that glib-2 atomic macros do not work properly in your
environment. My clang/gcc-runtime build is still pending so I ask: Was
this with llvm runtime?

Andreas

