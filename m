Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0622FC5B572
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 14:06:23 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20046.1786629976260168857
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 07:06:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Pun01O5d;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: raj.khem@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a15d54ac95so1391368a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 07:06:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786629974; cv=none;
        d=google.com; s=arc-20260327;
        b=LsuhOxBGNpckreW7pkZozj7WXj7EM5qKm02eaMEb4kMr+78GTZ9xTHoLgL/+kwJDdv
         ECPpRQnted7Oq39QRO+bJGSvI7s/NHL3WxoUiIOdGJI16eE9gKQLDJXdi8baPvDTIzis
         PXoCh7NTogNH8C3EwlCwxuiuSwihbh6milcutaBac6bTP3cIA04Fv40W5/xDEyX912Q0
         Xw4W6XRIVMBKfPVKYA0OmjICfub+lPQvmCLHGi7LKk1sR7IpLMlhfnLPH/KAD2skyXgt
         t9CFmO3SE5qtbFjR6VS/+rChQ685SrfNFfdgF/3RyqFc3cF0/10ZiSklQsTzF+6uHldz
         XnqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IsqiwjqSLlwMUH+6wK5USwzQFmoyuYVQT6OQuoFfhiU=;
        fh=O8gUHejns1mVh8Edy5CV43f7pOyvXVNI6vuw2QaY0oU=;
        b=O+mpC37+9/aKOmI4o6WAjKGHOltWBJZfO9DfzkjvDlsHiFfGqMFq9eIhFIwG3txrBB
         gwUO3y0eZ0kwMcnlmJAlNvaKtoilF8fzU/atlvyK/AXcLc6ZuAZYbW+SFILkcX7aqdEu
         xMLFF11GtAWEo/QzUkOSXZ9NCgJxR2b48FVimF2u1jHDADTLshS2c0vyiyjNb0xmHfrk
         f5xCou3BjhsC5E2ROnMv/tiMNWo64bXBT3AiWYjaGvNglKUhOLsm7CuBhULs7bvD2cNe
         3ZKV9QBuI+5n+18W2N2rJ+lzWwTJ68BZswwuqFAVNP8cs1sT6SFIm/qAms1d7GsLCBhK
         tXyg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786629974; x=1787234774; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IsqiwjqSLlwMUH+6wK5USwzQFmoyuYVQT6OQuoFfhiU=;
        b=Pun01O5dC2R3ZMwsoWUL2uS0JHR97mLA3GdirpyjHPncIRvWKwf4FLkbFM1cQLVaco
         kSoHsu+JuikS1Iwm/XcZuViMIy+i/4zuCO290yNT4Zpz5OhyX4qQ7qmBJZZRVZ/vKBx5
         slQGCaQbhA0X0lfmTf7NJtzQhS7K7dR+N6VEGLlEp5NzfJvHxD8gL/O1YHimvinqAPtV
         Hbe1zXTp5hq+nwt0F7e6RvJrERz/dIEKRCXnRMCBKMn0eCZW9GUJeXhBMmS93jM/xh7X
         DAE+WuQMhnrHtyJfIi+XYKwBtr5EPSXjhrBZCMhkessiXgKa2ouI2Wu5+NzMJ65LlSSk
         5gyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786629974; x=1787234774;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IsqiwjqSLlwMUH+6wK5USwzQFmoyuYVQT6OQuoFfhiU=;
        b=Q8OwR5SsGCYTpFOv3YrzkT42UnZkhxXe8L8mYkHb6XPi/wwjOkNWrWWVq03KuTFfI2
         m507o4cGpsE+2pFXIfMBUd27XnS0UfZ4coCJCC1oUrBNSkIdaOodM7puVoeHSGBn0zMy
         9uVXT6Ff8EkHEEPWlotMRsN2j0CDmFosu8gLXlU4P5VwGhPVlxyz678S17lD9aAJTPbC
         UAN912h07PPVzk1EbuXbXfWz3Lane7rs13KjdKBuXg18BaTcq1fRMLklGE2kUxzVwtCA
         dq48TLT/GlhWIvBPy6b82OfQiQQ1aH0t5HKs/FeWyFgK40bk52nq0cu1BqY8c5hF+XcM
         nI1Q==
X-Forwarded-Encrypted: i=1; AHgh+RoSQ7XvhVg2U8xVDrNm+K4OeU9kqKYIEJaY1rYY5nGAXo6Dt25blAx6+GIuwwSTi2wcrFkGdLoTv0BDd9WLgq7vscE=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx3QE5facj9uvz7lFAoPmDlbz6pU+KEdQXK6emr7Z6IICPpCitZ
	aeeOvrODhzE9vlUklUDR3CAymnQ//bpV3CsO6+MkT53ceYya/hq0+rgMW66XxqYtfHQeqEoHZPe
	AI5AQg33sbhorjFdzipTQNonvaiipqYM=
X-Gm-Gg: AR+sD104LvF5fgr2xJA5cPyGVF/CvnBUnpw0vPDQ0y5A43ejnBDAwx99G/yCPrKX/En
	gQD5Htr3IUy9zzrsxTSNc5afyjJRWhhfxgobnihdGObApg//pp3h3eSOu6YNeK8F8k/+z1Q9CSk
	3+meVlMsDZ+OtxpGR3gs075Nm8KDTorkud06U9bnLGDPklq7UGwzDO1lTruhbCjQ2256rX8kskw
	4sNrtOZhZwX8qwv1qbwFeuavolhUZI01C7GPhuYrYFEOpnh2+eKo+Nqa3ox4wGJQoyFD8vY2j2k
	t9iGEL1ScppK72w9ml1mSFPHTZQeN8Qw5rKPVCkfzcsdaK6GwyfaPUZpl65bg4HVHPfBWiaTOdA
	dlKcLMeV7Lmu7BmD7mtX04j1lEEmmPwcE/Uu2D83uym1i0NmZ//1K6kE72Ek9WsHDPVBUIPkb/E
	l3GkxxqHDLSn3fBDhfO/w1WFIfezF3RJuXWXV6CWmbTsbbWL0AkVNK8EfteWaGz+T/ywgpi2o+G
	FQUlCZ70RHmfw==
X-Received: by 2002:a05:6402:5112:b0:698:e614:e4bf with SMTP id
 4fb4d7f45d1cf-6a37fcf5300mr2996420a12.0.1786629974268; Thu, 13 Aug 2026
 07:06:14 -0700 (PDT)
MIME-Version: 1.0
References: <31000A93-3B00-4DD9-9909-5F725D919106@arm.com>
In-Reply-To: <31000A93-3B00-4DD9-9909-5F725D919106@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Aug 2026 07:05:45 -0700
X-Gm-Features: AUfX_mxUsx0jms7Kct-Gb2l4bfiwmOdiYs3zjOPpND6ePCnWzG78v_WB9df8f8s
Message-ID: <CAMKF1so6ZCBL2tUWW6tnmg83bADoF0yWPsfOPgBOnc0446+dWw@mail.gmail.com>
Subject: Re: Changes to python build dependencies
To: Ross Burton <Ross.Burton@arm.com>
Cc: Tim Orling <tim.orling@konsulko.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f622ce0658ee3490"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 14:06:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128943

--000000000000f622ce0658ee3490
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 5:26=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:

> Hi,
>
> Queued in oe-core master-next is a change to remove python3-wheel-native
> from the python build class dependencies, as this hasn=E2=80=99t been nee=
ded for
> several years now.  This will expose some upstreams which still declare
> =E2=80=98wheel=E2=80=99 as a build dependency for no good reason, this ca=
n be resolved
> simply adding python3-wheel-native to DEPENDS and ideally telling upstrea=
m
> to update their pyproject.toml.
>
> Obviously I=E2=80=99m sending the changes to core and then immediately go=
ing on
> holiday for two weeks, so I hope the fallout isn=E2=80=99t _too_ bad.
>

I suggest we hold on such changes in master-next for a bit to get soaked.
At least for meta-openembedded layers I do have CI loops running over
master-next
 now its pushed into master.
90+ failures in meta-openembedded
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/8277715/raw_inlin=
e


>
> Cheers,
> Ross

--000000000000f622ce0658ee3490
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 12,=
 2026 at 5:26=E2=80=AFAM Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.=
com">Ross.Burton@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Hi,<br>
<br>
Queued in oe-core master-next is a change to remove python3-wheel-native fr=
om the python build class dependencies, as this hasn=E2=80=99t been needed =
for several years now.=C2=A0 This will expose some upstreams which still de=
clare =E2=80=98wheel=E2=80=99 as a build dependency for no good reason, thi=
s can be resolved simply adding python3-wheel-native to DEPENDS and ideally=
 telling upstream to update their pyproject.toml.<br>
<br>
Obviously I=E2=80=99m sending the changes to core and then immediately goin=
g on holiday for two weeks, so I hope the fallout isn=E2=80=99t _too_ bad.<=
br></blockquote><div><br></div><div>I suggest=C2=A0we hold on such changes =
in master-next for a bit to get soaked. At least for meta-openembedded laye=
rs I do have CI loops running over master-next</div><div>=C2=A0now its push=
ed into master.</div><div>90+ failures in meta-openembedded</div><div><a hr=
ef=3D"https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/8277715/raw=
_inline">https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/8277715/=
raw_inline</a></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
Cheers,<br>
Ross</blockquote></div></div>

--000000000000f622ce0658ee3490--

