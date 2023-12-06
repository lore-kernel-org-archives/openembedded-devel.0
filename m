Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCED0C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 18:26:59 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.40514.1701887215594853362
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Dec 2023 10:26:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wm1M7HBb;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-67a894ccb4eso679016d6.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 10:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701887214; x=1702492014; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vQ/iCwPSHBrYFBmHtpgH97ftUpbKL9NUqpJKEVaT9A4=;
        b=Wm1M7HBbRzs/dSqx/Gf04aJwr7dOu4Cz2mjUD49sLBkYvV3401XPtK9USKFM9xuSA4
         zwClt4yhasR/9LCMkIzjmYDdZNio9mw2xWQGXnq8qnQQ0E5pGahaZntMbrCfwOvuufmn
         wne1J1IeSRUcK6GtQQqXRWasDR8LhMXFJv2dtDGNiKXllnQ9pbAZPAV2BZmnSps3YW79
         nURRUJwRCLXNVqOoYlqQTh+ZuM9nOU72UfFg9A0rqXbarywvDuo+i1b6Iy9Tqqf2FzBe
         q78ghPcNk6txez3q15ayuQxWRwijP+ScJsfwxMy48piuSAf5EB8tt8xSYSZm1/KqbAAb
         ypLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701887214; x=1702492014;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vQ/iCwPSHBrYFBmHtpgH97ftUpbKL9NUqpJKEVaT9A4=;
        b=ZTM1godtr0DucTAhdLLe9tIi09OdmVVdn1e25XT0lxwMEkzkS9pSuZ8hDFfmfP7bGk
         VTqFyA+mgA4+hJUgSjjpgm1vdIObH1dYb0mAaYyvLKYqW50cMVXDVUaEDV7gE2BIzahS
         9SdwwxTwa4PIWfsv46B5MgefndD5HGXYUvuxjaPdBq1WQIKkftchGEGHb1XpjgtulvIo
         pHuwjnir5cRyJOGNb6WLH3rbKRz95c8PtHzgnUrNlKInlDM2RUkbORw/u70NyeWmDGpx
         27K8VRDsgAX85U9TwcOi60YqVHIzKH8FEndd0ssmdQwNJGDSXbW+K7LVHHMXKoZvZHqx
         nUDQ==
X-Gm-Message-State: AOJu0YxEm1kXX4JJprmTR7hvSjwJ5sbx+q71Xzif62Gno1Mmt+m131VX
	e4xkzpqb8WrDmuZ8zGhGlEzCYMEbhG16vkcfcK8za5y7
X-Google-Smtp-Source: AGHT+IEiw7Ol4xpBi7XVAmUJe2C+If8qPszTzmypm1PRLgM4iMmwBKQZxOPDm2jyi0/vC6JklwEVmPAIUDQune9hpuE=
X-Received: by 2002:a0c:e892:0:b0:67a:a721:830f with SMTP id
 b18-20020a0ce892000000b0067aa721830fmr1195638qvo.105.1701887214631; Wed, 06
 Dec 2023 10:26:54 -0800 (PST)
MIME-Version: 1.0
References: <CA+cAkeqg51T1u1DuPM_5vx+2gAn-6KxWYfY0GYuXdqvM_mbF4A@mail.gmail.com>
 <CAMKF1soZHS40B7x+YvNF_EvnCk=E1+tcSrmEMXY1MVOUgd6CEw@mail.gmail.com>
In-Reply-To: <CAMKF1soZHS40B7x+YvNF_EvnCk=E1+tcSrmEMXY1MVOUgd6CEw@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Wed, 6 Dec 2023 19:26:43 +0100
Message-ID: <CA+cAkerDPsrxPe0GeG1J8yZoCidtWdg8Z3toMUVXp5=sjEEVPA@mail.gmail.com>
Subject: Re: Crash cross canadian?
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e04332060bdb7e11"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 18:26:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107263

--000000000000e04332060bdb7e11
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok great, I'll rebase these on master on the coming days. The problem is
that my hardware (pretty specifics) just have been upgraded with Kirkstone
and since I will not be able to test those on master branch. At least I can
make it compile, have you some advices to non regressed crash utility
(without involving real target test)?

Le mer. 6 d=C3=A9c. 2023, 19:11, Khem Raj <raj.khem@gmail.com> a =C3=A9crit=
 :

>
>
> On Wed, Dec 6, 2023 at 10:02=E2=80=AFAM Fr=C3=A9d=C3=A9ric Martinsons <
> frederic.martinsons@gmail.com> wrote:
>
>> Hello list,
>>
>> Since some times (back to warrior branch I think), I have in my custom
>> layer a cross canadian version from the crash tool, I personnally used i=
t
>> for analysing vmcore from an arm target (cortex a53) offline within the =
sdk.
>>
>> I recently upgraded to kirsktone and the update of this version was a
>> little tricky (must have played with LDFLAGS, gdb target build and host =
and
>> so on...)
>>
>> I finally managed to get crash working for all my hardware (both include
>> aarch64 and x86-64 arch).
>>
>> I would like to know if it would be acceptable to have a cross canadian
>> arch in meta-openembedded (from what I see, there is only native and tar=
get
>> flavor)?
>>
>
> It=E2=80=99s fine. I guess there were no such recipe needing it so far. P=
lease
> submit your patches
>
>
>> If you think it is accurate, I'll work to push some patches against
>> master.
>>
>> Please tell me, thanks!
>>
>

--000000000000e04332060bdb7e11
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Ok great, I&#39;ll rebase these on master on the coming d=
ays. The problem is that my hardware (pretty specifics) just have been upgr=
aded with Kirkstone and since I will not be able to test those on master br=
anch. At least I can make it compile, have you some advices to non regresse=
d crash utility (without involving real target test)?=C2=A0</div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le mer. 6 d=C3=
=A9c. 2023, 19:11, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.k=
hem@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Dec 6, 2023 at 10:02=E2=80=AFAM Fr=C3=A9d=C3=
=A9ric Martinsons &lt;<a href=3D"mailto:frederic.martinsons@gmail.com" targ=
et=3D"_blank" rel=3D"noreferrer">frederic.martinsons@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto">Hello list,<di=
v dir=3D"auto"><br></div><div dir=3D"auto">Since some times (back to warrio=
r branch I think), I have in my custom layer a cross canadian version from =
the crash tool, I personnally used it for analysing vmcore from an arm targ=
et (cortex a53) offline within the sdk.</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">I recently upgraded to kirsktone and the update of this ver=
sion was a little tricky (must have played with LDFLAGS, gdb target build a=
nd host and so on...)=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">I finally managed to get crash working for all my hardware (both includ=
e aarch64 and x86-64 arch).</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">I would like to know if it would be acceptable to have a cross canadian=
 arch in meta-openembedded (from what I see, there is only native and targe=
t flavor)?=C2=A0</div><div dir=3D"auto"></div></div></blockquote><div dir=
=3D"auto"><br></div><div dir=3D"auto">It=E2=80=99s fine. I guess there were=
 no such recipe needing it so far. Please submit your patches</div><div dir=
=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto"><div d=
ir=3D"auto"><br></div><div dir=3D"auto">If you think it is accurate, I&#39;=
ll work to push some patches against master.</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">Please tell me, thanks!=C2=A0</div></div>
</blockquote></div></div>
</blockquote></div>

--000000000000e04332060bdb7e11--

