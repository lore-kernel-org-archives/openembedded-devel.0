Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88FB3C433F5
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 17:27:18 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.486.1634750838012264157
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:27:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=miwKcVxC;
 spf=pass (domain: gmail.com, ip: 209.85.216.53,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id ls18so2956337pjb.3
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4uajNMRr696VTQ4xPLyurfoXVDbrxQ9G8EOC3gMPKLI=;
        b=miwKcVxCMNxUGN7lILflmgHAX/W58O2oUxwgWT40L0/3voPUi9m9IV9Nso8LlVqoRM
         774N8aOKvMFIPuvyGMoA59pJERO4l821ivV5zXrRf4CaHRuf8vzIWbrAgn35td5fW0Ea
         GGZgpmr/z0bcEFjvxZWqdhLGMj5pmmOaRKwNZFKSfvf3aJiTmRsQcFh3cY8G+wmnlBUv
         89KOSaRjY9VzcQx3mIS11GYtzbjPehBr8qVScRUVFQTh8RUkOVHVuGbeMJJuQuSdyfN8
         0PZYZBLeNU/+GRRIwpIrth/bzG9HpEd7ADJm2GC2ws+jlNT/LhSPxvF0NSt0F/28m+ji
         RB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4uajNMRr696VTQ4xPLyurfoXVDbrxQ9G8EOC3gMPKLI=;
        b=tXFaFjBvPLY/M791mBf1VQmWVDZbc2/SRffC0HjQobEQmdGHCSJIlvmP6LGp214GlO
         V/0ogX8iKGUTnerpo+xBwv3imBt/m0c1r24nDPmQiqXhzmoXAOoX9ZDDsdMfmyYNScsw
         h2nIE/RbjVz3fi4TjHQOLXN/8jvg7SknIGfE3vpMy5fNgVZPva+OzSmP8tngZg8r5Ezk
         nciaCIQF84nY66fszGnHZ+A4tVhF2MfEIwY8kQjm7b5fgAN8Us/q/3/B3lMmG7zillTt
         ddc8iS1arHQViD4ixZQ1xDnbT+izpWhVJGsisd44Mm/P/XiuJ5gUPN5ZabNyXSke1MO/
         j9jA==
X-Gm-Message-State: AOAM531+LiP0+I0ZrP5aKGYcqN4gMvDEzhIUbRqiu/8+kIJLyQVvb4zd
	sEgopwmNpMZbVaMvGbKMQZPULfzsjAYH8gX2Hc4=
X-Google-Smtp-Source: 
 ABdhPJw14hfcsP1FdZBk3AegVMl/iogjKK6LlA5s+kunrT5NC64z6F9YY9FQzYJw23U8/eoKEbXg3B4+gDwdDfRY69U=
X-Received: by 2002:a17:902:6808:b0:13e:a85b:52bd with SMTP id
 h8-20020a170902680800b0013ea85b52bdmr319969plk.76.1634750837511; Wed, 20 Oct
 2021 10:27:17 -0700 (PDT)
MIME-Version: 1.0
References: <20211011184140.653609-1-alex@linutronix.de>
 <20211011184140.653609-23-alex@linutronix.de>
 <CA+chaQeHXgVqBmjRBFNsZGYoz076q4MHwEfMPCzbmO-ScUgsSQ@mail.gmail.com>
 <CANNYZj9pqNFjkP+WpdQ+KdF2KECO=rF4qQz_YphKx97HZeYvGA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9pqNFjkP+WpdQ+KdF2KECO=rF4qQz_YphKx97HZeYvGA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 20 Oct 2021 19:27:06 +0200
Message-ID: 
 <CA+chaQeCjFzS2JPL5BDdbgq-LAMgw8dD7uxgGFz_can5ekWcVQ@mail.gmail.com>
Subject: Re: [oe] [PATCH 23/24] luaposix: update 33.4.0 -> 35.1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f7574a05cecc16b4"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Oct 2021 17:27:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93495

--000000000000f7574a05cecc16b4
Content-Type: text/plain; charset="UTF-8"

Thanks, target libxcrypt worked here.

On Wed, Oct 20, 2021 at 7:14 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> That should be libxcrypt, not libxcrypt-native.
>
> For some reason Khem replaced my update patch with his, and somehow it
> does not have libscrypt:
>
> http://git.openembedded.org/meta-openembedded/log/meta-oe/recipes-devtools/luaposix/luaposix_35.1.bb
>
> What happened, why was my patch not taken?
>
> Alex
>
>
>
>
>
> On Wed, 20 Oct 2021 at 18:47, Martin Jansa <martin.jansa@gmail.com> wrote:
>
>> On Mon, Oct 11, 2021 at 8:42 PM Alexander Kanavin <alex.kanavin@gmail.com>
>> wrote:
>>
>>> Drop autotools/makefile patch and change the build system to luke,
>>> as upstream uses that now.
>>>
>>
>> Any idea why it fails?
>>
>> luaposix/35.1-r0/git$ build-aux/luke
>> luke: fatal: required symbol 'crypt' not found in any of libc, libcrypt
>>
>> I already have a fix from Khem:
>>
>> https://git.openembedded.org/meta-openembedded/commit/?id=60d4e95b4ba3c42e70e321af4c30b5767bcf564b
>>
>> but it doesn't seem enough.
>>
>

--000000000000f7574a05cecc16b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks, target libxcrypt worked here.</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 20, 2021=
 at 7:14 PM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
>alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div dir=3D"ltr"><div>That should be libxcrypt, not =
libxcrypt-native.</div><div><br></div><div>For some reason Khem replaced my=
 update patch with his, and somehow it does not have libscrypt:</div><div><=
a href=3D"http://git.openembedded.org/meta-openembedded/log/meta-oe/recipes=
-devtools/luaposix/luaposix_35.1.bb" target=3D"_blank">http://git.openembed=
ded.org/meta-openembedded/log/meta-oe/recipes-devtools/luaposix/luaposix_35=
.1.bb</a></div><div><br></div><div>What happened, why was my patch not take=
n?<br></div><div><br></div><div>Alex<br></div><div><br></div><div><br></div=
><div><br></div><div><br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Wed, 20 Oct 2021 at 18:47, Martin Jansa &=
lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa=
@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">On Mon, Oct 11, 2021 at 8:42 P=
M Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D=
"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Drop autotools/ma=
kefile patch and change the build system to luke,<br>
as upstream uses that now.<br></blockquote><div><br></div><div>Any idea why=
 it fails?</div><div><br></div><div>luaposix/35.1-r0/git$ build-aux/luke</d=
iv>luke: fatal: required symbol &#39;crypt&#39; not found in any of libc, l=
ibcrypt</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote=
">I already have a fix from Khem:</div><div class=3D"gmail_quote"><a href=
=3D"https://git.openembedded.org/meta-openembedded/commit/?id=3D60d4e95b4ba=
3c42e70e321af4c30b5767bcf564b" target=3D"_blank">https://git.openembedded.o=
rg/meta-openembedded/commit/?id=3D60d4e95b4ba3c42e70e321af4c30b5767bcf564b<=
/a><br></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote=
">but it doesn&#39;t seem enough.</div></div>
</blockquote></div>
</blockquote></div>

--000000000000f7574a05cecc16b4--

