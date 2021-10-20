Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 041E2C433F5
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 17:37:52 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web12.644.1634751470662583584
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:37:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B9J/+Jas;
 spf=pass (domain: gmail.com, ip: 209.85.222.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id n66so3919323qkn.0
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NAvHV2Z7Tl5Y4fVDbVbvuy3lA/HiA+DSP+smauo9zws=;
        b=B9J/+JasHM2n9M0x1383r6eW82luaF8megcls4iO9FqrUwhEgEdpEUmDZ7fpsWaufy
         /OY9pZFzqJYNpWsv7M71DXIqq1H9yBEn02owSVaxzo/LInyT+5l69x+NdNB9WLnTF4PC
         P2Man8BIl40znqwPdBhDMksTBNLZpGtNpta+SHmp6uIm5X2FvMmmEOw/PacL/9uAnxXe
         O0ZzMoUPmGP+2y0BKrwteUyJwiITR/TosdIj2L7QsaqLP4VuzKfhSWCF8GTUKdnRJi/u
         x+atyk4teq0eaX0I2AswqeZUU2pMUwC2+0y99NaOGN7CMrBKVZerclrUNCev8lmIBRqd
         2T+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NAvHV2Z7Tl5Y4fVDbVbvuy3lA/HiA+DSP+smauo9zws=;
        b=3O4Flmza6I+B9klRtS0J4pidjfhmsdnWVUHbk03agWsJNzEt23VkqwsSmMLxGfjud3
         Wgz/98SIb5CjA7NoIRyMOzQArD8gCNaQ2NFc3uv3pXBR6cue77xLtSg1DA3fcDHzYVUX
         /v8Rn+B8tNOPGLqE4z262jxgbaBac3yDzLrqRiIttE9sSS431YKEllqtO4fUWciXeNg8
         5WLubW1YKW7O1xcMCWeHnULSDKol4siWUo0Cz64az0N2cuSpK82NO7th9Kh3Eg9CVV2X
         /ihw8jYRN/dFNLVRZBPW9NMfsAHfmlUB3i2lHewK6tDTa1xvuP30uEY5Uy7pIJheQoMk
         3Z1A==
X-Gm-Message-State: AOAM533vfzPgVCditMng79LVjrm1eKk/ew6/VGK41cuXc5ChTF8T6QKc
	qgBBqJ7N4H4P8wMy81azn2B1aVYxvhcOgo1h7LE=
X-Google-Smtp-Source: 
 ABdhPJxQe1oyIyh38Ez0uTu45Q15J0rFRku9tU809M4LNJhEA/zpZZVHr9xY93GwKJlxxN0mamYlkt0yKc2egUgJnDg=
X-Received: by 2002:a37:9ec7:: with SMTP id h190mr401661qke.105.1634751469695;
 Wed, 20 Oct 2021 10:37:49 -0700 (PDT)
MIME-Version: 1.0
References: <20211011184140.653609-1-alex@linutronix.de>
 <20211011184140.653609-23-alex@linutronix.de>
 <CA+chaQeHXgVqBmjRBFNsZGYoz076q4MHwEfMPCzbmO-ScUgsSQ@mail.gmail.com>
 <CANNYZj9pqNFjkP+WpdQ+KdF2KECO=rF4qQz_YphKx97HZeYvGA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9pqNFjkP+WpdQ+KdF2KECO=rF4qQz_YphKx97HZeYvGA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Oct 2021 10:37:23 -0700
Message-ID: 
 <CAMKF1sq7f72VOyRnwu1TcvBpzmQP-3RfJpwx1_decMPteEwGnQ@mail.gmail.com>
Subject: Re: [oe] [PATCH 23/24] luaposix: update 33.4.0 -> 35.1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Oct 2021 17:37:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93500

On Wed, Oct 20, 2021 at 10:14 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> That should be libxcrypt, not libxcrypt-native.
>
> For some reason Khem replaced my update patch with his, and somehow it does not have libscrypt:
> http://git.openembedded.org/meta-openembedded/log/meta-oe/recipes-devtools/luaposix/luaposix_35.1.bb
>
> What happened, why was my patch not taken?
>

it did not work as it is because it missed setting lua-version and I
did not realize that during squashing the patches got reversed

> Alex
>
>
>
>
>
> On Wed, 20 Oct 2021 at 18:47, Martin Jansa <martin.jansa@gmail.com> wrote:
>>
>> On Mon, Oct 11, 2021 at 8:42 PM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>>>
>>> Drop autotools/makefile patch and change the build system to luke,
>>> as upstream uses that now.
>>
>>
>> Any idea why it fails?
>>
>> luaposix/35.1-r0/git$ build-aux/luke
>> luke: fatal: required symbol 'crypt' not found in any of libc, libcrypt
>>
>> I already have a fix from Khem:
>> https://git.openembedded.org/meta-openembedded/commit/?id=60d4e95b4ba3c42e70e321af4c30b5767bcf564b
>>
>> but it doesn't seem enough.

