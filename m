Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE086C433F5
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 17:14:38 +0000 (UTC)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
 [209.85.222.45])
 by mx.groups.io with SMTP id smtpd.web09.336.1634750078244878520
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:14:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N3kB3JcG;
 spf=pass (domain: gmail.com, ip: 209.85.222.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f45.google.com with SMTP id r17so7987447uaf.8
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pcphkAxWSZNVjDh1IySLJvlanfIF7ck9LCRHjWgHD7A=;
        b=N3kB3JcG3x3lcKcQpVHxc/TUnBhv37y8xxfeKigKbTmulsHKM1uBsSLfgv/b2kjQk2
         PoGZnjSC3dlM5CNqPbCYBczEJJXpY4VveZ60GxVMyUWoflA3va+who1hO4A/umb/Y9CV
         L2Ev8kpM2UIk47AKUiar8kbKnvtH3kW8cGfIOj91MtaQNLrRNkNetzhcwsT0UNRZ5Zry
         +peDs5DA4l3nfsUY5kO6TEZ3CakFIvfOUUSD7LOWndgMrLh6kZQpuA1csIx0TY9Ttw77
         5zkvjTNA4VUPJKGdCKZiSeR4EtIWeo65hZxj7uqptaKxvVMQGGbJV/NnD1q1vb7OUTRC
         Dyyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pcphkAxWSZNVjDh1IySLJvlanfIF7ck9LCRHjWgHD7A=;
        b=1ObcjzBjC+LdkNjYSwHCNEhF0p80FYXhyOEvu4WI4h3ii8QHOiTHlocI5MeMkaMFD5
         w0x7RZRPycKRvTub7jjl2+QKhlVCt0ONQfC1LVMwBnG/e2hoX67xD6Yh0PFWrMyo1OoC
         lHMePlrmpOn8of69Vt023aLzSSl0MPRyvgDXDCRYsZbu4H8+bnDkFiNG1ikoYTrZMLm7
         8XXG3ip6px3l+bCK852y0bN8l0Jd5r/UU577PSLx6zmkwVaenhBOMavrHLm6S/8Huos0
         c+pj/+yTQzR/ZTJOFRl/oODbUh/DMOc63uOv8p4nqJoroYRqgtHzUehrC5wQKdn9deJw
         OndA==
X-Gm-Message-State: AOAM533zB2z1grpgTLDeyQ67t70C+PLteKf6gy56rGhKvCVXYxsf28zj
	JIf2oTfddERyUaLYyc+twvCkbD96a/6Y+YUUbSY=
X-Google-Smtp-Source: 
 ABdhPJwM893qvzOjnpf/1VALz2+fpIkrfp6dlk9QaO/nerCiug2AhbYaz8xsgjbuNrGmosADUOPP/TN+NLGO0+kFRj8=
X-Received: by 2002:a05:6102:954:: with SMTP id
 a20mr821603vsi.40.1634750077301;
 Wed, 20 Oct 2021 10:14:37 -0700 (PDT)
MIME-Version: 1.0
References: <20211011184140.653609-1-alex@linutronix.de>
 <20211011184140.653609-23-alex@linutronix.de>
 <CA+chaQeHXgVqBmjRBFNsZGYoz076q4MHwEfMPCzbmO-ScUgsSQ@mail.gmail.com>
In-Reply-To: 
 <CA+chaQeHXgVqBmjRBFNsZGYoz076q4MHwEfMPCzbmO-ScUgsSQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Oct 2021 19:14:26 +0200
Message-ID: 
 <CANNYZj9pqNFjkP+WpdQ+KdF2KECO=rF4qQz_YphKx97HZeYvGA@mail.gmail.com>
Subject: Re: [oe] [PATCH 23/24] luaposix: update 33.4.0 -> 35.1
To: Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a7777a05cecbe95f"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Oct 2021 17:14:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93489

--000000000000a7777a05cecbe95f
Content-Type: text/plain; charset="UTF-8"

That should be libxcrypt, not libxcrypt-native.

For some reason Khem replaced my update patch with his, and somehow it does
not have libscrypt:
http://git.openembedded.org/meta-openembedded/log/meta-oe/recipes-devtools/luaposix/luaposix_35.1.bb

What happened, why was my patch not taken?

Alex





On Wed, 20 Oct 2021 at 18:47, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Mon, Oct 11, 2021 at 8:42 PM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> Drop autotools/makefile patch and change the build system to luke,
>> as upstream uses that now.
>>
>
> Any idea why it fails?
>
> luaposix/35.1-r0/git$ build-aux/luke
> luke: fatal: required symbol 'crypt' not found in any of libc, libcrypt
>
> I already have a fix from Khem:
>
> https://git.openembedded.org/meta-openembedded/commit/?id=60d4e95b4ba3c42e70e321af4c30b5767bcf564b
>
> but it doesn't seem enough.
>

--000000000000a7777a05cecbe95f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>That should be libxcrypt, not libxcrypt-native.</div>=
<div><br></div><div>For some reason Khem replaced my update patch with his,=
 and somehow it does not have libscrypt:</div><div><a href=3D"http://git.op=
enembedded.org/meta-openembedded/log/meta-oe/recipes-devtools/luaposix/luap=
osix_35.1.bb">http://git.openembedded.org/meta-openembedded/log/meta-oe/rec=
ipes-devtools/luaposix/luaposix_35.1.bb</a></div><div><br></div><div>What h=
appened, why was my patch not taken?<br></div><div><br></div><div>Alex<br><=
/div><div><br></div><div><br></div><div><br></div><div><br></div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 20=
 Oct 2021 at 18:47, Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.c=
om">martin.jansa@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">On Mon, Oct 11,=
 2021 at 8:42 PM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail=
.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><div=
 class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Dr=
op autotools/makefile patch and change the build system to luke,<br>
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

--000000000000a7777a05cecbe95f--

