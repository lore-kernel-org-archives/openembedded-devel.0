Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA420C3DA4A
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 23:43:54 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.112079.1723679033631489045
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Aug 2024 16:43:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kt0L7bXj;
 spf=pass (domain: konsulko.com, ip: 209.85.218.44, mailfrom: tim.orling@konsulko.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a7a9a369055so57653166b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Aug 2024 16:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723679032; x=1724283832; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1MQI6MKkT+EEPBP34haeEa28IJTBopds4QLxP+UVAkE=;
        b=kt0L7bXjSHwvj4XWiskU1WoBx386fQtaZbrkZHgV/1WAvLnRybtprs17VS90PdHSrs
         rBfCswcUCNKyTKRV8CHOIZ6QIj+9p8eUI76YoohjI59iEppOQJdWMv/5sCH1R9EMW5rf
         21vUoWLo0dwdL+5lcLuqziFB64l2pDdhg+oRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723679032; x=1724283832;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1MQI6MKkT+EEPBP34haeEa28IJTBopds4QLxP+UVAkE=;
        b=ZTTrvhlJG1/fovE27VTtagqZKvnL5mZcyFZLi55nV3TL4LcO9/sIhs2aeSc+M7Xvkd
         RUsq+i+8ROJMXVjlEc5dBVMTXTM2xw/oKOB15DKRsu3+jt36NVMvZdA+u3d3EkbqU9KB
         K7a7SnQVtA9AXw7uyH9DLrrY+aAv6Hm4dd6IL/SRGBvZ9N0Iw1OcmbaRNHzwzQd9YxZY
         Uo/oAU2DT1mVCoq/imbRuPJGeMqnN0jP1FSP9YxG+GNDHi9mhWmvS8QZkeko/xrQcRii
         Z3c/22bUUVmGcYGm01eCLwOYzgKKGiI7zC+vncPpqdRm+XHqsbpRhnzx0FS1uStBFoUo
         s23w==
X-Forwarded-Encrypted: i=1; AJvYcCXiMfazo3fDJJ5/7FcxnT51A8+PT85isEzvd6k6hnMpzfbzhh2TuPJV1wum1Wh1BUq27ObpHUmab7+q7XnPRI9cxaT/s6vNkX0jz04Wrm7VvaEOrWCSo17+wg==
X-Gm-Message-State: AOJu0Yz24xUsumxU6TCokPLzODWWJojkQCnDBMXH45+BgDJMdvayr5kr
	lJr+v0PSapdZrlbF/s1xV/mLiDjX1jzkD2n+OqlexY5Xamk2UHz98VRJvwQS+iMCoZAecHSl8lU
	Fqx1LRx0mOnltW+gxK70txVXagcntRuTqUtUIvA==
X-Google-Smtp-Source: AGHT+IH/exRWgR/kHqK9rdHQ+qU4Kpkk/W4tVbkl7LyLYSNIdwFev2cod2NT2P2kefgFJQsfnGnIxsonb+p/JwfpiTQ=
X-Received: by 2002:a17:907:d59f:b0:a80:f6f1:b7f1 with SMTP id
 a640c23a62f3a-a8366d770bcmr283521866b.36.1723679031722; Wed, 14 Aug 2024
 16:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <CANx9H-BtPB4RwF1RZB4mc_oV0wzRnicM3TYCw0cvtCGMBzfY=g@mail.gmail.com>
 <C09FA63B-2B46-4B0C-9D72-25AAF014935A@gmail.com>
In-Reply-To: <C09FA63B-2B46-4B0C-9D72-25AAF014935A@gmail.com>
From: Tim Orling <tim.orling@konsulko.com>
Date: Wed, 14 Aug 2024 16:43:40 -0700
Message-ID: <CAOyo-85tGrhWYL-bNKfYudpqdNYJpqX_4BjSi=q4zRh5iyL4Ew@mail.gmail.com>
Subject: Re: [oe] [meta-python][scarthgap][PATCH] python3-pydantic-core:
 upgrade 2.16.3 -> 2.18.1
To: Frank de Brabander <debrabander@gmail.com>
Cc: Tim Orling <ticotimo@gmail.com>, akuster808@gmail.com, Khem Raj <raj.khem@gmail.com>, 
	dev@g0hl1n.net, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000649ab6061fad4c88"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Aug 2024 23:43:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111807

--000000000000649ab6061fad4c88
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2024 at 9:08=E2=80=AFPM Frank de Brabander <debrabander@gma=
il.com>
wrote:

> So now that master is updated, what are the ideas for fixing the
> incompatibility issues with pydantic amd pydantic-core for the scarthgap
> branch?
>
>
I submitted the series which is the plan:
https://lore.kernel.org/openembedded-devel/cover.1723432397.git.tim.orling@=
konsulko.com/T/#t

and Armin has it staged:
https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable/scar=
thgap-nut

So folks can comment on the patch series, but ultimately it is in Armin's
hands to determine his "stable/scarthgap-nut" branch is ready and then he
will ask Khem to merge it. This is the normal process for stable branches
under the meta-openembedded umbrella.


> Regards,
> Frank

--000000000000649ab6061fad4c88
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 13, 2024 at 9:08=E2=80=AF=
PM Frank de Brabander &lt;<a href=3D"mailto:debrabander@gmail.com">debraban=
der@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">So now that master is updated, what are the ideas for fixing t=
he incompatibility issues with pydantic amd pydantic-core for the scarthgap=
 branch?<br>
<br></blockquote><div><br></div><div>I submitted the series which is the pl=
an:</div><div><a href=3D"https://lore.kernel.org/openembedded-devel/cover.1=
723432397.git.tim.orling@konsulko.com/T/#t">https://lore.kernel.org/openemb=
edded-devel/cover.1723432397.git.tim.orling@konsulko.com/T/#t</a></div><div=
><br></div><div>and Armin has it staged:</div><div><a href=3D"https://git.o=
penembedded.org/meta-openembedded-contrib/log/?h=3Dstable/scarthgap-nut">ht=
tps://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable/scarth=
gap-nut</a></div><div><br></div><div>So folks can comment on the patch seri=
es, but ultimately it is in Armin&#39;s hands to determine his &quot;stable=
/scarthgap-nut&quot; branch is ready and then he will ask Khem to merge it.=
 This is the normal process for stable branches under the meta-openembedded=
 umbrella.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
Regards,<br>
Frank</blockquote></div></div>

--000000000000649ab6061fad4c88--

