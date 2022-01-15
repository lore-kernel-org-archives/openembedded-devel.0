Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B88C433EF
	for <webhook@archiver.kernel.org>; Sat, 15 Jan 2022 19:02:37 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web09.11158.1642273356395407468
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 11:02:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TFLTHS0U;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id c2so4088430qvw.3
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 11:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LHaftbkjxVsU+v0b8ll6Lp2jjelp23SwsI5BoVh1zvo=;
        b=TFLTHS0UC5tpWPszqINy6IQVQS7HnTaAMJyWUBzrwO1YtN2jdUU5/YAa2RLQjWSKxy
         BMb2HS3ullzNMVLH1O0yOzH1uWYMu6BbZT/A3TQxDlaLCDQNxpKqaFWEvg1c1MAXzOia
         IwU2aMEqz3LzDEsTC0WGE42YvcpiWnCns44qbWQ5riWOS7bPX6et22TDmxcVKKDiYjjd
         l3OmsjFBfKqtudCJFVl5SU80nBFQm9alPQ9fYxYTi4oQPsJS6I+IsbInPJSAae7Uoy1F
         7UzfBn+OcPv4dzG6sELDFvreZKbLwPYp6sCJ7FShtOCt3hk3PNP2djkJD/ziS7TW0qDX
         yBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LHaftbkjxVsU+v0b8ll6Lp2jjelp23SwsI5BoVh1zvo=;
        b=vLcyhtyZodtLWPyr/tOTblyYF2YNn5rGThERZ1WqUduH8yi2H3oxdWZIMX67J7Vz11
         lxPfb2MteDYs91fyoTN5a0NTybL+GG7xUv+es2eWPWGDV3Hv50u+7BgplZnjlfMfR/xS
         dGKkTMp0LcxJvgsGBmGqXSd3EyfqcFB1jxqSmg0/FBWCyzUGT7soADvUeGjvGsyjYbpG
         jutNzWjWPtK16FVQxehLBLVVSRZ1jA2bEEcyiXzuX0LSlsVlBYrmfGInRdRoKFutX+1b
         /so+hwpUjMqhMVm/HvS+nXfzUY1o1osDvPc8wg2LGhrTUpOWiOeTxVK31WAubnv8hy6Y
         HNxQ==
X-Gm-Message-State: AOAM532anbBnXRQsHDJ7VZlo3ATgenbPl9WssOiEp9fndGN91w7HPqNg
	7la1XcBOmY+ppffdZ4GEeCnIVvqm/93I6fYdpIo=
X-Google-Smtp-Source: 
 ABdhPJwiLH+ihu5q8I/lEjqOxGdIL8OOpfHlhuEj6M0Rb9i684o14crsjYvrWMA83q+cXNLl2Yle+mbXFKka6nfhDYo=
X-Received: by 2002:a05:6214:629:: with SMTP id
 a9mr314462qvx.110.1642273355245;
 Sat, 15 Jan 2022 11:02:35 -0800 (PST)
MIME-Version: 1.0
References: <20220114115246.3985850-1-ross.burton@arm.com>
 <20220114115246.3985850-2-ross.burton@arm.com>
 <CAMKF1sqe8REidDKhe+VxwSSB9EPHtqVcdfQCXSvH4KPRqUuhGQ@mail.gmail.com>
 <CAAnfSTuwhM8oik521ND9qPtFeorOxchkvWqrJDVcKEP+cSgOeg@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTuwhM8oik521ND9qPtFeorOxchkvWqrJDVcKEP+cSgOeg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 15 Jan 2022 11:02:24 -0800
Message-ID: 
 <CAMKF1sqo1Rj2x74+KnGY4oNmpF06mkmB2dr1yrA_Q-zLGopGuA@mail.gmail.com>
Subject: Re: [oe] [PATCH 2/3] iotop: move to the C port of iotop
To: Ross Burton <ross@burtonini.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f6ad6405d5a38f42"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Jan 2022 19:02:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94872

--000000000000f6ad6405d5a38f42
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 15, 2022 at 2:33 AM Ross Burton <ross@burtonini.com> wrote:

> On Sat, 15 Jan 2022 at 01:26, Khem Raj <raj.khem@gmail.com> wrote:
> > It fails on clang/arm see
> > https://errors.yoctoproject.org/Errors/Details/622623/
>
> That's clang segfaulting, fun!  I don't have access to my build
> machine this weekend, can you just throw in TOOLCHAIN=3D"gcc" for now?
>

Yeah and it=E2=80=99s with glibc master so not a big deal I will still extr=
act a
test case for reporting to llvm GitHub issue

>
> Ross
>

--000000000000f6ad6405d5a38f42
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Jan 15, 2022 at 2:33 AM Ross Burton &lt;<a href=3D"=
mailto:ross@burtonini.com">ross@burtonini.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">On Sat, 15 Jan 2022 at 01:26, Khem Raj &lt;<a hre=
f=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt=
; wrote:<br>
&gt; It fails on clang/arm see<br>
&gt; <a href=3D"https://errors.yoctoproject.org/Errors/Details/622623/" rel=
=3D"noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/De=
tails/622623/</a><br>
<br>
That&#39;s clang segfaulting, fun!=C2=A0 I don&#39;t have access to my buil=
d<br>
machine this weekend, can you just throw in TOOLCHAIN=3D&quot;gcc&quot; for=
 now?<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Yeah and it=E2=
=80=99s with glibc master so not a big deal I will still extract a test cas=
e for reporting to llvm GitHub issue=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><br>
Ross<br>
</blockquote></div></div>

--000000000000f6ad6405d5a38f42--

