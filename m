Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAE20C433EF
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 17:47:48 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.48221.1635788868033333837
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 10:47:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bZ2sLcfv;
 spf=pass (domain: gmail.com, ip: 209.85.216.43,
 mailfrom: schnitzeltony@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id
 q2-20020a17090a2e0200b001a0fd4efd49so386246pjd.1
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 10:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P6W/sHew1EPU3BZYpiOn/z/J5pGOyEsef89MlpRwKtY=;
        b=bZ2sLcfva7ixTRjOOHmm6NI/3icGyQk7fWqbOMn6g0yOFztHwcN4XbVL4cBsptitGF
         PA0v8q2r60hzt6gqh23ZFa7a1SeJG2dgYneUIR9Ir0xXWm60YsJmPEp2s33w+BQXeLrD
         DfuA+tmOMAgvOhLSUUlu2yQ9ezDhEBmiWva8jAdjOw4zhBNEm+JrOYPMFl8MPmRjljvd
         +0boIOCAi0Q2e+uOCGlvuse/Bo9cv1yrFJCohZNU8u1wXlud6YoRuFvhRMYkmpg1F9Ty
         D1z+7D8ZXBxX93qNdJK21UbX87qfpcTAezFmcPdSUvLd9wwQB1XSxueoE/xhZM/SpBDj
         HZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P6W/sHew1EPU3BZYpiOn/z/J5pGOyEsef89MlpRwKtY=;
        b=TmKa9OtxXil+qP7eJ4vI3oMfGDns2C81HsOa+nsQUV4lFP9IgPNYsPlhcKypGyhtzd
         bcP0vNgfNVtCtGa/lC9WfXe/5b0cbmTkv2XUazN6O+W3HoZQZ2UwSDtmyCUJsccG3rLz
         Vgd4w2sJldVAmbqlbJZRnnbLiNR8pOOMNVkZvdlxDYmZW+5M4/whBKDhtwM/+QVYSi8V
         KpuyqJDZQWC1/l1+oPTZ9TiX5kxmy4q0VJgEdac7vKJZTzqjZsdIZbuSFspNO09Fa9WE
         /ah9pcV/sNJLQELVC825kB+VyqjVKymL6Xu4kZTZpilm3BYQ856PAOmtDrWziB53ku0s
         Zkng==
X-Gm-Message-State: AOAM532jSqcAOpD8XVyzUBHCekBtG5k8QKBqFdyZpaBMDzFcy1E2wZgf
	2It+zdRXnUZjujUPGhUZqwMqqQhVg71IRY0/7eI=
X-Google-Smtp-Source: 
 ABdhPJzo5vXrHHdHxMNuERjZB58g3dbGQCJzqU2zFAhpupCm3oOAVmHjMwsZs6bN9xI2InGhB6BS8HeN346HJuhE2fo=
X-Received: by 2002:a17:90b:4c0d:: with SMTP id
 na13mr419301pjb.232.1635788867555;
 Mon, 01 Nov 2021 10:47:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211101114934.3646836-1-schnitzeltony@gmail.com>
 <CAMKF1spFaSR8DdV3rQRtUD3MOa5kbSWpUxdaHPUEY3DovoeAHw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spFaSR8DdV3rQRtUD3MOa5kbSWpUxdaHPUEY3DovoeAHw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 1 Nov 2021 18:47:35 +0100
Message-ID: 
 <CALbNGRRUfLkNX2kJV4Qam7XMCMGNLerpvNCJ8Q9j9HfEp96Gng@mail.gmail.com>
Subject: Re: [oe] [meta-gnome++][PATCH 00/31] De-rotten meta-gnome
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Nov 2021 17:47:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93749

On Mon, Nov 1, 2021 at 2:43 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> seeing these when polkit is not in distro features, is there a way out ?
Was my bad - did send a fix

Andreas

