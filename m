Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 701E7C3DA49
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 15:28:12 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.17898.1721316483767233455
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jul 2024 08:28:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Qty63h2x;
 spf=pass (domain: konsulko.com, ip: 209.85.167.43, mailfrom: tim.orling@konsulko.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52e976208f8so515063e87.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jul 2024 08:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1721316482; x=1721921282; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e9GJ/t35uYadVBeeQ04TWpl8OeALvRelD3hNeVdQFno=;
        b=Qty63h2xGddM4rJwYMros1lnSlb0NTZXxMlX0f9ni6DCHAyoN5OobEhN6aw9NPcC/N
         l1TJycCgO33CL7IAAGRG7yDnDWvnG7i+kzmTvqTxfYtwSlmcAK2kPzVqYu+miijI0h7e
         38VirqfRlj8xX1ygW4FEMPj7FZW27la0/tmGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721316482; x=1721921282;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e9GJ/t35uYadVBeeQ04TWpl8OeALvRelD3hNeVdQFno=;
        b=TpQRsL7eehSPCl/p6TDkyC+8YRMGdMtVkOcw34tDchmJjTwZnPCbZ+6US7D1n1Muf4
         N5o3MtF5cmjDweacZtKQlZKSiY6gVpY/EOsEBwXH1o+EI9RlsYkB9WjuPJckAozKgkbV
         aPZuyNrm95uIrWMYnHn7rKDh+tizUw2reAZBe5UwovpKkU81O7NWGNmRG2OvCnnsQInw
         EfzdD3jO5f9r31XEKZtJIFx/Y19+u2b+cQM6KVKEk5Rqifin04jC10GCbJ1xz71V5PoT
         ZEi+6NcohcXpy7ror2H9xKonbXnvCU76oh3kgTEF7r/uN+jCAT0Jd4kI5TBWRXerP9NO
         WTdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkwQC0c+9BVzCHIXe4k4Gr8ND2bmK8VmmFHSs0OpNCtEhlt0JwmVZ6h+4DLMJUJKgJkoQ5obaV+W5oD0FVET9rBaXlAGvg2NvUvh2c1yjlNmPSBKk7iPtrmQ==
X-Gm-Message-State: AOJu0YyMOG1U0OOADwvvAE0vxb11FUNjtvBVjwIznCJwfa3J9c09gdIf
	WHvxiJeRKMoIGjcraS52ikLWxPsmt/SC8pc1jEENBQsVKK+wVGqHEMPfawOkNchiZl93spZV56g
	zYQ49KVvirU3eugYUry2SXAiQifQArsNjD7lUPA==
X-Google-Smtp-Source: AGHT+IE0F6VQiBdPW0cvgGSgVjfTwURvywnGZi5NMHwjoryj0vux0NOp4LiCKD51TV2Vpo/SufeI7uPCTddQ5hpTm2s=
X-Received: by 2002:ac2:4c43:0:b0:52c:90b6:170f with SMTP id
 2adb3069b0e04-52ee53cc000mr3732936e87.29.1721316481807; Thu, 18 Jul 2024
 08:28:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240706180810.1707296-1-dev@g0hl1n.net> <26a61314-0aa1-4e5c-ac71-d0ece3591362@gmail.com>
 <w24ywr4aiiqxecb46semqmbw4ulstn4rz25mwbiurkwh4xzxva@oyphvy5wc7nj>
 <CAOyo-87-wojy-WxNs98qWp9kev2Dpui-Nk8ffLzwWQbmsvpvjQ@mail.gmail.com>
 <CAOyo-86Zds3bvy0GvmiBEDRignUn2Z509SkD7Lw1xZ-0Ky30bg@mail.gmail.com> <lhsjaroyl6ivizrhqd6dmwtibvcgjynf756u5o6turi7aqxzb6@cdl46qnvnn4t>
In-Reply-To: <lhsjaroyl6ivizrhqd6dmwtibvcgjynf756u5o6turi7aqxzb6@cdl46qnvnn4t>
From: Tim Orling <tim.orling@konsulko.com>
Date: Thu, 18 Jul 2024 08:27:50 -0700
Message-ID: <CAOyo-87sBZUxfGGzK2zio2kBkRCZYrExjYcGNSnNZyRMf3EnaQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][scarthgap][PATCH] python3-pydantic-core:
 upgrade 2.16.3 -> 2.18.1
To: Richard Leitner <dev@g0hl1n.net>
Cc: akuster808 <akuster808@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000071e274061d873920"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Jul 2024 15:28:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111403

--00000000000071e274061d873920
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 18, 2024 at 7:49=E2=80=AFAM Richard Leitner <dev@g0hl1n.net> wr=
ote:

> Hi Tim, Hi Armin,
>
> sorry for the late response, just came back from vacation.
>
> On Wed, Jul 10, 2024 at 12:10:01PM GMT, Tim Orling wrote:
> > On Wed, Jul 10, 2024 at 8:14=E2=80=AFAM Tim Orling <tim.orling@konsulko=
.com>
> wrote:
> > > On Tue, Jul 9, 2024 at 5:54=E2=80=AFAM Richard Leitner <dev@g0hl1n.ne=
t> wrote:
> > >
> > >> Hi Armin,
> > >>
> > >> On Tue, Jul 09, 2024 at 08:12:06AM GMT, akuster808 wrote:
> > >> > Hello Richard,
> > >> >
> > >> > On 7/6/24 2:08 PM, Richard Leitner via lists.openembedded.org
> wrote:
> > >> > > The currently available python-3-pydantic v2.7.0 requires
> > >> > > python3-pydantic-core to be updated to v2.18.1.
> <snip>
> Do you got failing ptests for scarthgap (with this patch applied) too?
> Or did you just tested master?
>

I won't try any stable branches until I get it fully functional on master.
The challenge is time and the fact that Rust is injecting TMPDIR into the
.so
Given that master now makes [build-paths] QA WARNING an ERROR, we need to
fix this.

I suspect, but have not proven, that it was already a problem with the
original python3-pydantic-core before any of these upgrades.

>
> [1] https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS
>
> Thanks & regards;rl
>
>

--00000000000071e274061d873920
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 18, 2024 at 7:49=E2=80=AF=
AM Richard Leitner &lt;<a href=3D"mailto:dev@g0hl1n.net">dev@g0hl1n.net</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi T=
im, Hi Armin,<br>
<br>
sorry for the late response, just came back from vacation.<br>
<br>
On Wed, Jul 10, 2024 at 12:10:01PM GMT, Tim Orling wrote:<br>
&gt; On Wed, Jul 10, 2024 at 8:14=E2=80=AFAM Tim Orling &lt;<a href=3D"mail=
to:tim.orling@konsulko.com" target=3D"_blank">tim.orling@konsulko.com</a>&g=
t; wrote:<br>
&gt; &gt; On Tue, Jul 9, 2024 at 5:54=E2=80=AFAM Richard Leitner &lt;<a hre=
f=3D"mailto:dev@g0hl1n.net" target=3D"_blank">dev@g0hl1n.net</a>&gt; wrote:=
<br>
&gt; &gt;<br>
&gt; &gt;&gt; Hi Armin,<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On Tue, Jul 09, 2024 at 08:12:06AM GMT, akuster808 wrote:<br>
&gt; &gt;&gt; &gt; Hello Richard,<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; On 7/6/24 2:08 PM, Richard Leitner via <a href=3D"http:/=
/lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openemb=
edded.org</a> wrote:<br>
&gt; &gt;&gt; &gt; &gt; The currently available python-3-pydantic v2.7.0 re=
quires<br>
&gt; &gt;&gt; &gt; &gt; python3-pydantic-core to be updated to v2.18.1.<br>=
&lt;snip&gt;<br>
Do you got failing ptests for scarthgap (with this patch applied) too?<br>
Or did you just tested master?<br></blockquote><div><br></div><div>I won&#3=
9;t try any stable branches until I get it fully functional on master. The =
challenge is time and the fact that Rust is injecting TMPDIR into the .so</=
div><div>Given that master now makes [build-paths] QA WARNING an ERROR, we =
need to fix this.</div><div><br></div><div>I suspect, but have not proven, =
that it was already a problem with the original python3-pydantic-core=C2=A0=
before any of these upgrades.=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
<br>
[1] <a href=3D"https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS" r=
el=3D"noreferrer" target=3D"_blank">https://wiki.yoctoproject.org/wiki/Stab=
le_Release_and_LTS</a><br>
<br>
Thanks &amp; regards;rl<br>
<br>
</blockquote></div></div>

--00000000000071e274061d873920--

