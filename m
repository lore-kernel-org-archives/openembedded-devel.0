Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43C31C433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 16:47:22 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.568.1634748441346796779
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 09:47:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Xh6AFmqQ;
 spf=pass (domain: gmail.com, ip: 209.85.216.54,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id
 u6-20020a17090a3fc600b001a00250584aso924272pjm.4
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 09:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1C3vhxMGpaYBUCwNVH0jcc4ZHjn5FbFNrg/lMreZAwA=;
        b=Xh6AFmqQiz3C1HOJt4EtCVxJTjdOzqQuxyCNnPj5/oJEew8IoNGPBRjMrchBVt4s/9
         eG3hA/QIyW6CsfRZEcs8Z9eeGzQmVe8AsFpGvtAxARNEddHVrPyITgSivrXQW06x3yiQ
         pk7pAEoKDTfCGjyJch6yu5QY4NRwyyctvI9K6T11v4WIRKyNdGu3SIrhqgEv7ykxgGVn
         fLbqplIhrV3F79l3UpGi8ZVGyq9w9NTZhsDEvIH90gRPNyU5MEDYdhbPeSStwBk3+oez
         cs9Tmh2D6AreCyyacrvgvlppF3bhnIrFLzl5LIEvsvcUUMLz6SrNk8MafVlw6YoUJ7wT
         eaDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1C3vhxMGpaYBUCwNVH0jcc4ZHjn5FbFNrg/lMreZAwA=;
        b=WaGlx0uDevlAgf/kNgpXKo/JiPoEvp5wtSxvMn7ElFwRNINHXV0IkbnhMfGEE4eQA9
         hJStNijaFVRj+DCRPmqoDkfRx0sN9TyATVzrEcxAdsNIh5xt/0L3ep51sdzGuVkWzbOI
         vU1mBz9XIWakpTXcslAhN55rreTzLU+2OXb/fBwkbOG1Yylr4D751fpkxXG0pZWs3+IC
         Mx+alezaIBju7q3ZVVhBm9F6zXWAgOs3R/ar8mq9ampc9X3EKroCQzcNrqOdUJucctto
         7dT195Kud/s3A50dnmOhenXZn6EODdO1mPJR5NaNWzISQkB9HJSo94QSUfiOVl4pQF49
         HE7g==
X-Gm-Message-State: AOAM530avesOnqaSOlBjwHBPN6sSvtSpYJlFc4S6TwPfA/sHveOhmJfl
	5KlUcMgDFyyRD81e9yAYbqRpFpLgiGjjSugLTQA=
X-Google-Smtp-Source: 
 ABdhPJz88l9aAzpbloyhnhRLDTOo3p7PkSGuVFyGj8xZVHbQkPwsFh1joMk9CHjABnpKgkvGTkdNyW1+3+XuuNE7Cls=
X-Received: by 2002:a17:90b:3e8d:: with SMTP id
 rj13mr50079pjb.183.1634748440889;
 Wed, 20 Oct 2021 09:47:20 -0700 (PDT)
MIME-Version: 1.0
References: <20211011184140.653609-1-alex@linutronix.de>
 <20211011184140.653609-23-alex@linutronix.de>
In-Reply-To: <20211011184140.653609-23-alex@linutronix.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 20 Oct 2021 18:47:10 +0200
Message-ID: 
 <CA+chaQeHXgVqBmjRBFNsZGYoz076q4MHwEfMPCzbmO-ScUgsSQ@mail.gmail.com>
Subject: Re: [oe] [PATCH 23/24] luaposix: update 33.4.0 -> 35.1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>,
 Haseeb Ashraf <Haseeb_Ashraf@mentor.com>
Content-Type: multipart/alternative; boundary="0000000000001dcb1505cecb886f"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Oct 2021 16:47:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93483

--0000000000001dcb1505cecb886f
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 11, 2021 at 8:42 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Drop autotools/makefile patch and change the build system to luke,
> as upstream uses that now.
>

Any idea why it fails?

luaposix/35.1-r0/git$ build-aux/luke
luke: fatal: required symbol 'crypt' not found in any of libc, libcrypt

I already have a fix from Khem:
https://git.openembedded.org/meta-openembedded/commit/?id=60d4e95b4ba3c42e70e321af4c30b5767bcf564b

but it doesn't seem enough.

--0000000000001dcb1505cecb886f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Oct 11, 2021 at 8:42 PM Alexander=
 Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">al=
ex.kanavin@gmail.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Drop autotools/makefile patc=
h and change the build system to luke,<br>
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

--0000000000001dcb1505cecb886f--

