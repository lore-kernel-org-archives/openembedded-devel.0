Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43925C433EF
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 00:14:06 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web09.54685.1638144844843463113
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Nov 2021 16:14:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=THpqdWtT;
 spf=pass (domain: gmail.com, ip: 209.85.222.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id m192so21039665qke.2
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Nov 2021 16:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dPHVOo/3iha7PfIQYN3FgbLhRzPe9MqWV/hqh9dFo0E=;
        b=THpqdWtTo6pjpVLZYpit7UAPtwVFnIOQL7XzZlxeKWQj2LlQ7aGKrHVs1Yikdm+/CU
         B8YfPFfj1IRdHMqHbVAr9CG3Icu04fxfw1VQcr2dhzWG7/gdcs5zRvM5xC4/VnlOTkwS
         kecj9e3Ams1vVEAPzK/wFrYljQ7Iq3kW3tdusl2iJSj/UHnAoKUnqG39ZYXaIXl3y+yn
         2nogBLvzrQPhoFn4jiJv4ZDbP9XTuGSG3hgJtYNjVE0o6kfrQkmaXR6tzMezDTzF6ssI
         Q4m7bdRyEFX9/X0/SFELdqDfCTEJYiQENqvJ/wKza/8Cwfk9VZiAj3Mfq07axjKyIOba
         l4KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dPHVOo/3iha7PfIQYN3FgbLhRzPe9MqWV/hqh9dFo0E=;
        b=wC5VLfXfGfrScISXYusE0B2VFhJj6U3txQmgaGbXyeSnZCMiHPinyy2B4+n6PRiIBn
         Rmru6XiwrwGTYpqFq552EPcn7tB0xc7pVLZ4fB995Fsnr9Lzy6bBs1EW5UcRYF3CHTS6
         mmpznY67TocC/cA70XpvZqgjuPbS4B4zd03tW+jP8UJRoeQmRiMTfhUTKGiS+KDvJFpz
         XRat0nAUAWZkxbXGcthYF09bqUfiZROrQqp8yPxUZfCJor9PwesppXVmYOna/aKDp0W/
         VJPX+knFgwqkvr88k6LOkR0rGa1gvTqy40DDIopj8GEnmSSYR4bG3LHmrJjynxD9/pG/
         X5Ug==
X-Gm-Message-State: AOAM53288hgtY8hrbMexo+99a3NYkbOWf0wVHMGh392TjiRjrP6ZLwTw
	UgM5AMYX3NI8UNJOWnCSVawar65kx6rC3rsuSVo=
X-Google-Smtp-Source: 
 ABdhPJxiFBCvwVNjK6eiFQcsetmXJkf/8pcufAnLIn8tiQFUxv655mhPBEgnoDVN+ohYQVj+dti5CeGaUrsYAlFHb0Y=
X-Received: by 2002:a05:620a:461f:: with SMTP id
 br31mr35996008qkb.72.1638144843718;
 Sun, 28 Nov 2021 16:14:03 -0800 (PST)
MIME-Version: 1.0
References: <085f66e8b83887bea714e92bf8f5ce2f61746414.camel@gmail.com>
In-Reply-To: <085f66e8b83887bea714e92bf8f5ce2f61746414.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 28 Nov 2021 16:13:37 -0800
Message-ID: 
 <CAMKF1somJZSyoGvboW7OJ5W9VV=kfNMHWsQjwUfsxO_1rg-zrA@mail.gmail.com>
Subject: Re: [oe] [meta-oe] gutenprint recipe in meta-oe
To: Claus Stovgaard <claus.stovgaard@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Nov 2021 00:14:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94132

On Sun, Nov 28, 2021 at 4:19 AM Claus Stovgaard
<claus.stovgaard@gmail.com> wrote:
>
> Hi folks.
>
> I have created a gutenprint recipe setup which I hope can be improved
> to a level where it can be part of
> meta-openembedded/meta-oe/recipes-printing
>
> If not - I hope by sharing it here on the mail list, that it might be
> to benefit to others needing gutenprint in Yocto.
>
> Currently they are located on github.
> https://github.com/frosteyes/yocto-printing/tree/master/meta-printing/recipes-printing/gutenprint

They look fine generally. You might want to see if you can use
BBCLASSEXTEND for native recipe instead of having dedicated recipe
also convert to new override syntax before submission

>
> Please comment on the recipes - do you think they would be ready for
> meta-openembedded? If this is the case - I will send a patch.
>
> Currently I have targeted dunfell - but it should properly be updated
> for kirkstone.
>
> A quick notice around gutenprint.
>
> It generate a tool, named extract-strings, for generating a header
> file. To support this, a native recipe is used for generating the tool
> and the header file. Next the target version disable this generation
> and just uses the header file from the native version.
>
> So both the target version and native version uses an include with the
> SRCREV, to be sure they are identical.
>
> Looking forward to input.
>
> Regards
> Claus Stovgaard
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94130): https://lists.openembedded.org/g/openembedded-devel/message/94130
> Mute This Topic: https://lists.openembedded.org/mt/87354310/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

