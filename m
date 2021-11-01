Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6AB6C433EF
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 13:18:43 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web10.43909.1635772722532484546
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 06:18:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zp7GXAIJ;
 spf=pass (domain: gmail.com, ip: 209.85.160.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id v17so15758378qtp.1
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 06:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=oXzDUWJ6AwskFcbPmn1iQiRRzQNHGxTbuFTacuvBH/Q=;
        b=Zp7GXAIJhfyRaTy5xVj8V/DKL8pq/f0QvzMJEOtSQZg1t1fCksTOWLqMZrBhLJ32jl
         VLUZEc56YqyD0TTjWxfZLMAETNZPYl4I4LSbUx2Es/+abSmJHEA6XAwGGUCg95+SyYrW
         ibwS4fUcdyBbesPgOaK4rnvspc5u25+jr+v3/7K2390degtrt9/quOX7hL592u7qdIqG
         ucdEZ6eQCCLz9EP7KM1j/rVSVTzj7CU9QWkXDFsQyvZFVLflgejJC2JpLibJbyf7VxaK
         LTowTA3spU2Wf3l02MGiaqK/f95e1BBkkawMsOD9qhhpvZ9usl2X7M5VvfoFps6OL6g0
         U2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oXzDUWJ6AwskFcbPmn1iQiRRzQNHGxTbuFTacuvBH/Q=;
        b=cGRDkrbAoXywfUVB3i85qJZtDWRCaAFDLMFy0BsCbNkE/LtkhfHKTeTQk8isEFPMI1
         bL3B2D6JPDuLJ24qJBjvTrcZ/8Ka7QbCkNSEHsTQjFAgQFDv1cW5SzC3lIx+YIgxfkby
         tK91c0kt2hrTokkaDyEyEPGGURFxwDEAzLYc8tOROJzvWMt2Ry0pTxI6pwMw801qppb+
         ql0xkDuMzE1fW7PY22yaRqCUVqM85Ixt7vcLVIu02E61LJvr3SUvsiNKz08hC7qHt4/X
         F+yfA52tS8nIqSgp528FjS9aNAdm5E7vfPlNIGIVL45h5Swfx57zgZdFo1VEwdH/WEPD
         gYaA==
X-Gm-Message-State: AOAM533m2MEH9MRIxai1Fu9JDLYGAY7UOeUGzfSfm1IPenQf/NrDgi7S
	Hwhe+ecLxyuU3ptQTMqkdxTBNgtgKIVBgW0xCWE=
X-Google-Smtp-Source: 
 ABdhPJwAkj+I9BusjXMGzyYxpmn36PfqoRN9U3DNBIP5NSZtbLbybhBVH1Aga6wI2DUGTQAaXBqqzzJxlCdxl2EbGaE=
X-Received: by 2002:ac8:7087:: with SMTP id y7mr30686469qto.112.1635772721431;
 Mon, 01 Nov 2021 06:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <20211101114934.3646836-1-schnitzeltony@gmail.com>
 <20211101114934.3646836-12-schnitzeltony@gmail.com>
 <CANNYZj940v8Kruz72p2oM64A8aqwZGmZ=WBKj9Df6M_i0opG8g@mail.gmail.com>
 <CALbNGRRy3RtxQ7SnoGZKQRe8BPTVkQDDe_ForqkZz_VFObQxtQ@mail.gmail.com>
In-Reply-To: 
 <CALbNGRRy3RtxQ7SnoGZKQRe8BPTVkQDDe_ForqkZz_VFObQxtQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Nov 2021 06:18:15 -0700
Message-ID: 
 <CAMKF1sr_YXp3Ht-V1iWKwj5h9--WFn32_iO4r==_hQXU8SkJgg@mail.gmail.com>
Subject: Re: [oe] [meta-gnome++][PATCH 11/31] gtk4: initial add 4.4.0
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Nov 2021 13:18:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93741

On Mon, Nov 1, 2021 at 5:07 AM Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
>
> On Mon, Nov 1, 2021 at 12:51 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Can you please name this one simply 'gtk'? There's no reason to append =
4 in there.
> >
> > Alex
> >
> Did this to make the difference clear and to be prepared once they
> invent gtk5. What do others think?

What you have is fine and here is why.
Every major distribution is naming it gtk4, this is to accommodate
API breaking changes and need to
ship multiple versions of gtk, while dropping + is evident, nowhere I
could find that API promise is being
mentioned that gtk 5 will be backward compatible. So whenever it comes
we will be in same fix like today
some apps would want gtk5 and some gtk4 and it takes a while to move
whole package universe in some
case apps may just live with older version of gtk till end of their
lives. Calling it gtk would mean that
when gtk comes out with gtk5 someone will upgrade it in OE-core or
wherever it lives from gtk_4.x to gtk_5.x
and break every layer or force them to upgrade the packages to support
new gtk which in many cases
may not even be possible. This would mean the old recipe now has to be
renamed to gtk4 and every recipe
using it rebuilds packages.

>
> Andreas
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93739): https://lists.openembedded.org/g/openembedded=
-devel/message/93739
> Mute This Topic: https://lists.openembedded.org/mt/86737136/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

