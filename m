Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD568C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 18:11:49 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web10.40422.1701886308353544175
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Dec 2023 10:11:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OuygOT9r;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1fa1c3755afso52017fac.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 10:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701886307; x=1702491107; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FXtvNkuz8i9bZRnvyNGW1FvThccl+DvqfgPgIfSAbJ8=;
        b=OuygOT9rBUspuRTEh/7ic8HLSTNV3MMLGRdGXNp2R/TIAnBgIaQwz0LIfcBzuHBv0T
         muo23TYeNbHG8kTi6oyuD5j7lBIm0gLM9RJSaoXkUqfLRJXWeQPq1EA1Ni0WhI/kmJjG
         /jWIHYQyX+6G501CUgDB19tZVnVm7CyVCQO6yPvPRSWp69nGEaoBhGwMiatm3LeSKcUT
         A4dhPKy+21cADzVndCbXsn9SrnbjpFxBF2zgEJGImhtT/KBB81XHTrMWyNcGX8Nv6nah
         P0jjkfd4Ex8Hg0TKMiJlQPxZvZtKmDdTvX4VTU+LZPWqqtf2mArwBCpa+N6Gu5cnC4AJ
         YqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701886307; x=1702491107;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FXtvNkuz8i9bZRnvyNGW1FvThccl+DvqfgPgIfSAbJ8=;
        b=U5EB7dLmYHVft5zgvPBWSHufPw6KHxp9bp5ewWhGTKITpv9yIigTEzYD72DoZwC/Qf
         SBU91CU4/1liNnj006ZPuCIdCQYuQL29fyYAJ3D8XnUV0bfq8bS0MXP2NLRSMmNF0IEq
         AiAd3VTg9WGvVs1v8WdJA4ykcNJ5zEQZdwiZ0i01jBhDsyJ68RXUbqk/GL78rBWBXCm2
         pwmCkmB47URhbylZj1OZHZ9n2+0am8h5y82AAwdHjwvQle9lYpQgn43Kj9t4xMZyvax4
         RnwLvjXp9bEkdE5fwFQjAYeOC64UtqTIKJyOOLEVL2aKjpTV7AgTYQ3Q+Svqtw46YFIa
         gjXg==
X-Gm-Message-State: AOJu0YwDeEywZwe1QTS/4T9GIg6FMDxBUBL84T/K20MrKMg1zUKc89MZ
	XRlUGOQgjvmKd9Y87Y9eDgGu0Cijt9XSApAO370=
X-Google-Smtp-Source: AGHT+IH+ozvjMbN4F2ZdN+HQCkFQLbjcMXWx8ztCtwsN5T/VIHXoYilU2WmS3WCGA5dJsY4tWs+gsfC6/hkkTdNkjf8=
X-Received: by 2002:a05:6870:f78b:b0:1fb:788:e8a9 with SMTP id
 fs11-20020a056870f78b00b001fb0788e8a9mr1731034oab.36.1701886307551; Wed, 06
 Dec 2023 10:11:47 -0800 (PST)
MIME-Version: 1.0
References: <CA+cAkeqg51T1u1DuPM_5vx+2gAn-6KxWYfY0GYuXdqvM_mbF4A@mail.gmail.com>
In-Reply-To: <CA+cAkeqg51T1u1DuPM_5vx+2gAn-6KxWYfY0GYuXdqvM_mbF4A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Dec 2023 10:11:36 -0800
Message-ID: <CAMKF1soZHS40B7x+YvNF_EvnCk=E1+tcSrmEMXY1MVOUgd6CEw@mail.gmail.com>
Subject: Re: Crash cross canadian?
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000cf4eca060bdb4853"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 18:11:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107262

--000000000000cf4eca060bdb4853
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 6, 2023 at 10:02=E2=80=AFAM Fr=C3=A9d=C3=A9ric Martinsons <
frederic.martinsons@gmail.com> wrote:

> Hello list,
>
> Since some times (back to warrior branch I think), I have in my custom
> layer a cross canadian version from the crash tool, I personnally used it
> for analysing vmcore from an arm target (cortex a53) offline within the s=
dk.
>
> I recently upgraded to kirsktone and the update of this version was a
> little tricky (must have played with LDFLAGS, gdb target build and host a=
nd
> so on...)
>
> I finally managed to get crash working for all my hardware (both include
> aarch64 and x86-64 arch).
>
> I would like to know if it would be acceptable to have a cross canadian
> arch in meta-openembedded (from what I see, there is only native and targ=
et
> flavor)?
>

It=E2=80=99s fine. I guess there were no such recipe needing it so far. Ple=
ase
submit your patches


> If you think it is accurate, I'll work to push some patches against maste=
r.
>
> Please tell me, thanks!
>

--000000000000cf4eca060bdb4853
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Dec 6, 2023 at 10:02=E2=80=AFAM Fr=C3=A9d=C3=A9ric =
Martinsons &lt;<a href=3D"mailto:frederic.martinsons@gmail.com">frederic.ma=
rtinsons@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
div dir=3D"auto">Hello list,<div dir=3D"auto"><br></div><div dir=3D"auto">S=
ince some times (back to warrior branch I think), I have in my custom layer=
 a cross canadian version from the crash tool, I personnally used it for an=
alysing vmcore from an arm target (cortex a53) offline within the sdk.</div=
><div dir=3D"auto"><br></div><div dir=3D"auto">I recently upgraded to kirsk=
tone and the update of this version was a little tricky (must have played w=
ith LDFLAGS, gdb target build and host and so on...)=C2=A0</div><div dir=3D=
"auto"><br></div><div dir=3D"auto">I finally managed to get crash working f=
or all my hardware (both include aarch64 and x86-64 arch).</div><div dir=3D=
"auto"><br></div><div dir=3D"auto">I would like to know if it would be acce=
ptable to have a cross canadian arch in meta-openembedded (from what I see,=
 there is only native and target flavor)?=C2=A0</div><div dir=3D"auto"></di=
v></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">It=E2=80=
=99s fine. I guess there were no such recipe needing it so far. Please subm=
it your patches</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><div dir=3D"auto"><div dir=3D"auto"><br></div><div dir=3D"auto">If you=
 think it is accurate, I&#39;ll work to push some patches against master.</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Please tell me, thanks!=
=C2=A0</div></div>
</blockquote></div></div>

--000000000000cf4eca060bdb4853--

