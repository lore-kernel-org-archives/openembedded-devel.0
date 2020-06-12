Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web11.1568.1591998377261068555
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 14:46:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RNzxh5GX;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id m81so11840499ioa.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2020 14:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4ve964iMTehfb7HdaB2fkNs1q2J64ue0VDfxbK/8AZE=;
        b=RNzxh5GXx+cwW6C7yfqPSrgFZKut7/tUF2NM6UoCf1yzMjlIzRmK8OzOGyUOpKFtf5
         o/xuIXqqs+QqNGCHk6ZFAvwCe5thnt1gPUQZZWW0hPq28nJpCrAzlVnw88Hnkvhh0gna
         TryY7CPaU0mDsRlRl+jNgRGQbbFyw/5KQ8o5p321MkUDnu774oVizOxN1HB7Ndt8ywU2
         y3q87VMmDrUYQR1zPZ88kF8eJFRtZncgDeXhoJVtNruJMDVTIh2CyZS+gq6jDuOxQqhh
         ck2TKFiYeo1Er4rl1gLUUb7g9l8+XW0SuItLDDQtI1HXiOmYke+SzQYfx9cdnX73LnJA
         Ajeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4ve964iMTehfb7HdaB2fkNs1q2J64ue0VDfxbK/8AZE=;
        b=ig2YvLbqdDbiYJJnVZNlSRs+n8dNPc500PTMA/OvPQcjJjTvoW4HNCWSJrm98njS+t
         kTRb2ep9rDDZMP0E4EuV6qRUxR97nvuSgMuHxrzve+pObqP9ReLSIksofAk1ugw0GaDh
         bD3f79sr/weHWccuSiRsn2IqyvVkuGJ20dWnvNdZObDjbAh9cCfry3f11ZiaGfprZSo8
         l61MTNRCOU+rcGurR1IXpVaCoADn/uU+o6qloNAyzGqbiJQ0c3kinjQlz2glry+w0rRV
         85xkM7oZ6FXOfevHS37A3SSHeU7aTbcOsscHQ/bT1VtHWallVAcoQMxMjcS/Ck4MVWUm
         bnhg==
X-Gm-Message-State: AOAM530zf0vpNSIwZEfy65d/3mz/xrcxMOBkS0FyuVJCglzlso4nBcfK
	IsWS/8gc2J4ckuV2DBZy3Dqx117/5wYa7FrLevE=
X-Google-Smtp-Source: ABdhPJyAaSyy4+25N6ycMpVWiCUlYCJyKdRUjahmquA8MD8p1GaUL+0JS6TU+FJSbUQMXymzZizJkjyN+Xjx8azrTF8=
X-Received: by 2002:a6b:249:: with SMTP id 70mr15608219ioc.146.1591998376621;
 Fri, 12 Jun 2020 14:46:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200612195425.36226-1-paulohefagundes@gmail.com> <7695.1591992084920889109@lists.openembedded.org>
In-Reply-To: <7695.1591992084920889109@lists.openembedded.org>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Fri, 12 Jun 2020 14:46:05 -0700
Message-ID: <CANx9H-AZVEXNaWuW=XAAY0kh7tiFda7SFg6SwuK9aMPjHVj_-Q@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-fastapi and python3-uvicorn: add packages and dependencies
To: "Fagundes, Paulo" <paulohefagundes@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b9a35605a7ea0194"

--000000000000b9a35605a7ea0194
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2020 at 1:01 PM Fagundes, Paulo <paulohefagundes@gmail.com>
wrote:

> this is only my second upstream patch to this project, so I'm still
> learning about email patches and about the standards. I'm not sure if it=
's
> ok to add multiple recipes to a single commit, but I added these because=
 I
> added fastapi and uvicorn to our project and all of these dependencies w=
ere
> needed.
>

It=E2=80=99s very hard to review multiple additions in one email. Instead,=
 stage
the dependencies first (each as a separate commit) and then add the
depending recipe.

This also makes handling patch review changes much easier, as each new
recipe becomes atomic.


> another thing to note is that some of my peers were having trouble
> building uvloop.
> I was able to build uvloop just fine on my Arch Linux system, but my pee=
rs
> on Ubuntu 18.04 LTS got errors in the compile stage when uvloop tried to
> call ./configure
>
> So if anyone can check that it works for them that would be great
>
> Let me know if this patch is ok and if we need to separate it into
> different patches for each recipe let me know. Thanks
>=20
>

--000000000000b9a35605a7ea0194
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Jun 12, 2020 at 1:01 PM Fagundes, Paulo &lt;<a hre=
f=3D"mailto:paulohefagundes@gmail.com">paulohefagundes@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">this is only my second upstrea=
m patch to this project, so I&#39;m still learning about email patches and =
about the standards. I&#39;m not sure if it&#39;s ok to add multiple recipe=
s to a single commit, but I added these because I added fastapi and uvicorn=
 to our project and all of these dependencies were needed.<br></blockquote>=
<div dir=3D"auto"><br></div><div dir=3D"auto">It=E2=80=99s very hard to rev=
iew multiple additions in one email. Instead, stage the dependencies first =
(each as a separate commit) and then add the depending recipe.</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">This also makes handling patch revie=
w changes much easier, as each new recipe becomes atomic.</div><div dir=3D"=
auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><br>another thing to note is=
 that some of my peers were having trouble building uvloop.<br>I was able t=
o build uvloop just fine on my Arch Linux system, but my peers on Ubuntu 18=
.04 LTS got errors in the compile stage when uvloop tried to call ./configu=
re<br><br>So if anyone can check that it works for them that would be great=
<br><br>Let me know if this patch is ok and if we need to separate it into =
different patches for each recipe let me know. Thanks
<br>
</blockquote></div></div>

--000000000000b9a35605a7ea0194--
