Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1762CCD13DE
	for <webhook@archiver.kernel.org>; Sat, 31 Aug 2024 16:03:51 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.93.1725120220898658593
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Aug 2024 09:03:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TtGSWQk1;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3dee95035bbso1777515b6e.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 31 Aug 2024 09:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725120220; x=1725725020; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uDHQuVRDuCQk9ZOppTCgM2vBr9vUncqULuNXj3udZFE=;
        b=TtGSWQk1YsTMNlYiq+/SjshUKDsdQgFvbgtwanujP4vwYPJV5+ADA68aZ5dQwCg/eB
         eK8Gs35CUKqlhYAJjo5kdyWYYkhn4NEBpn/KeyIdz1KL+0GrwOEGXRpqC0IIUsScTu26
         Q/vvRLOrBaKepo/zswTZ9NYH0xNy6VfNAma4yXTMFoCPQ8eZpw3Hoa9cahJm3RqLrTnu
         xfGYFErYC49VKrzXjC7NCImKvnN2WQ+jOqIGF1ELMGSimp1veLbaVoVxb3BKPQJ/y1Ds
         fUfVgV06wj73A5kQeRsqkI1+mP0HLpXNZogmnl1+0OHcFjMjRUpsLiI39ENnpokVV37F
         equA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725120220; x=1725725020;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uDHQuVRDuCQk9ZOppTCgM2vBr9vUncqULuNXj3udZFE=;
        b=BoIpvk+7fzxqtrEOZ0PEumEvGRDZ+sC9n3CzomjvhbIGy+9F09peb0iXBxvplvZiSp
         0rpCaw7wrcsyQmOAkLZd1Wbc7Q6SNcO1YJwLOORYRuPtIkvxvhcSDUEkhSgPoEjf9BD8
         v9boBmdMytvVKh916thFvHHPBLydMrxC7JECULY8cFLEuWqphV47b4QdTzWymeXkNeoD
         HhqprC6XYKz4vzpUbY+cS3V4eY/J9OSle+XQ0isvk9URhffZiSXvB5q1OaXkJVcrcWbH
         rVNGFznm3aEOv2sat6XeaBbCPZW2eFT+Vp027buU5YHOFbV1Z7MOMBYNeYkp+whkDqYL
         yCvQ==
X-Gm-Message-State: AOJu0Yx34qLay/JTel1zqpHzBuxbnkEKkos/WJvlfHjUvoQMSpK+3nSQ
	60lHadVyTo38RVVZO/BdLnLVvvwWGDV5HkwMaVvp8Ebt2T6+wgFz5OeyKt/taNU/8tYnRjZfMTz
	5ujHMmrr5YCMSkGFJn8wTQNnjzKjasOsy
X-Google-Smtp-Source: AGHT+IGhr90JyxPzps58vGmEn0e0dZEcJzy0VTza+I5DgeT61eRioJIpqSTsb6eoYzfQLfe1/jwJ4OBoXPDuqNExPe8=
X-Received: by 2002:a05:6808:2393:b0:3db:199e:bdf2 with SMTP id
 5614622812f47-3df0682ca68mr3279121b6e.17.1725120220017; Sat, 31 Aug 2024
 09:03:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240830035827.406391-1-raj.khem@gmail.com> <20240830035827.406391-5-raj.khem@gmail.com>
 <17F08A6E249C2A38.19027@lists.openembedded.org> <8c7ff1e0-6ef0-49e0-901f-7a5f94aead69@ti.com>
In-Reply-To: <8c7ff1e0-6ef0-49e0-901f-7a5f94aead69@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 31 Aug 2024 09:03:28 -0700
Message-ID: <CAMKF1srUMXCWim9yOcRR-fUEYk7RcAiaUB0+Lb5WS2Tw8sx9GQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 5/8] mpv: Upgrade to 0.38.0 release
To: Ryan Eatmon <reatmon@ti.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e8bddf0620fcd9d7"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 Aug 2024 16:03:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112062

--000000000000e8bddf0620fcd9d7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 31, 2024 at 8:41=E2=80=AFAM Ryan Eatmon <reatmon@ti.com> wrote:

>
>
> On 8/30/2024 10:14 AM, Ryan Eatmon via lists.openembedded.org wrote:
> >
> >
>
> >
> >> +PACKAGECONFIG[x11] =3D "-Dx11=3Denabled,-Dx11=3Ddiabled,virtual/libx1=
1 xsp
> >> libxv libxscrnsaver libxinerama libxpresent libxext"
> >
> > Mispelling on "diabled", should be "disabled".
> >
>
> Well... since the patch has already made it to master I'll send a new
> patch that fixes this spelling mistake.
>

Yeah thanks for noticing and yes it was already in
Thanks for sending patch

>
>
>
> --
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS
>

--000000000000e8bddf0620fcd9d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Aug 31, 2024 at 8:41=E2=80=AFAM Ryan Eatmon &lt;<a =
href=3D"mailto:reatmon@ti.com">reatmon@ti.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"><br>
<br>
On 8/30/2024 10:14 AM, Ryan Eatmon via <a href=3D"http://lists.openembedded=
.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote=
:<br>
&gt; <br>
&gt; <br>
<br>
&gt; <br>
&gt;&gt; +PACKAGECONFIG[x11] =3D &quot;-Dx11=3Denabled,-Dx11=3Ddiabled,virt=
ual/libx11 xsp <br>
&gt;&gt; libxv libxscrnsaver libxinerama libxpresent libxext&quot;<br>
&gt; <br>
&gt; Mispelling on &quot;diabled&quot;, should be &quot;disabled&quot;.<br>
&gt; <br>
<br>
Well... since the patch has already made it to master I&#39;ll send a new <=
br>
patch that fixes this spelling mistake.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Yeah thanks for =
noticing and yes it was already in</div><div dir=3D"auto">Thanks for sendin=
g patch</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><br>
<br>
<br>
-- <br>
Ryan Eatmon=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=
=3D"mailto:reatmon@ti.com" target=3D"_blank">reatmon@ti.com</a><br>
-----------------------------------------<br>
Texas Instruments, Inc.=C2=A0 -=C2=A0 LCPD=C2=A0 -=C2=A0 MGTS<br>
</blockquote></div></div>

--000000000000e8bddf0620fcd9d7--

