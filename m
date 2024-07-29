Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51BC9C3DA61
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 15:13:19 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.58740.1722265996932493267
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jul 2024 08:13:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ZtrV9pD1;
 spf=pass (domain: konsulko.com, ip: 209.85.218.53, mailfrom: tim.orling@konsulko.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a7aac70e30dso464321066b.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Jul 2024 08:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1722265995; x=1722870795; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Yv7dgI+PfV1nFi5u/NaokycK7C15MBuHNV46KoL5Euw=;
        b=ZtrV9pD1c0kyl1K5jetMljI9TtzStJmxYjJ51ATPXGvtengQlGDrpLLwTuG3ycLnzN
         M/BgICnRVj88HRQDvq/hmFDGwEI5RcjRJdorZ0xYg6JCODClDnop3NLUo/MjTD6+SFsC
         26Ooc06j9wWRtJIZUdsusPQ2n3iDLwAE2rMeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722265995; x=1722870795;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yv7dgI+PfV1nFi5u/NaokycK7C15MBuHNV46KoL5Euw=;
        b=mXymb9qpCDUpXms4JtFxY6t6g0aQObYDpKKsHkgTrEtBL1xjRE6/UaIljOwbnFFaGY
         HD9Ga4sfH3ACBcohWgx8JYsJduoEcD1yfvnQUkyFz1J2ZWcPnv66y5bDulKxAJR96c9n
         Ua1jnOP/H44YOiKLgK6dwF8csxgXS3kNtRYN94i5Q6NMznCA4o++xG/kfXE1XNSvR/Ad
         1EYhMYgdPO/duwr4ql/AF8gZOpsbR+KKLf5vxEulW/voybbZb6yk7mE387YB+d76Xtwd
         aLGk5s39WVaNR2L6zn8aQ69UhC9GYt/di9XVsBw1d6t9hMuvi9t4gTAxqk95eTSqlzCM
         unhg==
X-Forwarded-Encrypted: i=1; AJvYcCWetqIEpv7trFiuk/VFt1L3hxYpczTd0yaw13Ypbo3rgFswZIgbWjCXn8pxw/6iRNAbbEBzUeiQdqXiWbGs4fBPMHx7+Uebu9HJZgXhfhG/RhO28/Bh5NTrag==
X-Gm-Message-State: AOJu0YxVIaliwYJE/uOWD6h8/dTlUrBrfbgFNMY3Dr7md+Gsx1dlE+Ae
	kRPuxuoLDcOi4yf3vjFVsRQXJE8SgTHROm5hCJPvBBhbXHLnmfzpuSv5Y5ffuwmskGIdOsfBs9j
	1lJamtGADa30eQfjC63mZfe7bgN3f+iQZcaGh5g==
X-Google-Smtp-Source: AGHT+IEoryttBfYysqLAiNyfKJ0PbWFO7NoLJjy/1qyjCdXTegk8l9q12FyagEGWktB57MpagGwB9SEq4Skek75vZe0=
X-Received: by 2002:a17:907:3f23:b0:a7a:a4be:2f95 with SMTP id
 a640c23a62f3a-a7d3fdb6696mr650638866b.5.1722265994690; Mon, 29 Jul 2024
 08:13:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240706180810.1707296-1-dev@g0hl1n.net> <26a61314-0aa1-4e5c-ac71-d0ece3591362@gmail.com>
 <w24ywr4aiiqxecb46semqmbw4ulstn4rz25mwbiurkwh4xzxva@oyphvy5wc7nj>
 <CAOyo-87-wojy-WxNs98qWp9kev2Dpui-Nk8ffLzwWQbmsvpvjQ@mail.gmail.com>
 <CAOyo-86Zds3bvy0GvmiBEDRignUn2Z509SkD7Lw1xZ-0Ky30bg@mail.gmail.com>
 <lhsjaroyl6ivizrhqd6dmwtibvcgjynf756u5o6turi7aqxzb6@cdl46qnvnn4t>
 <CAOyo-87sBZUxfGGzK2zio2kBkRCZYrExjYcGNSnNZyRMf3EnaQ@mail.gmail.com> <deurtntaw6lr4jmfgn5ugtzrgb33ql5hndroqafp6q5o74zefd@3gc5rd42xlmh>
In-Reply-To: <deurtntaw6lr4jmfgn5ugtzrgb33ql5hndroqafp6q5o74zefd@3gc5rd42xlmh>
From: Tim Orling <tim.orling@konsulko.com>
Date: Mon, 29 Jul 2024 08:13:02 -0700
Message-ID: <CAOyo-84p8ZE7vueVV8nihTE5k41z53uUqYRCwMj+s_sw2Mg=Dw@mail.gmail.com>
Subject: Re: [oe] [meta-python][scarthgap][PATCH] python3-pydantic-core:
 upgrade 2.16.3 -> 2.18.1
To: Richard Leitner <dev@g0hl1n.net>
Cc: akuster808 <akuster808@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d29d74061e644c76"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Jul 2024 15:13:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111459

--000000000000d29d74061e644c76
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 4:07=E2=80=AFAM Richard Leitner <dev@g0hl1n.net> wr=
ote:

> On Thu, Jul 18, 2024 at 08:27:50AM GMT, Tim Orling wrote:
> > On Thu, Jul 18, 2024 at 7:49=E2=80=AFAM Richard Leitner <dev@g0hl1n.net=
> wrote:
> > > On Wed, Jul 10, 2024 at 12:10:01PM GMT, Tim Orling wrote:
> > > > On Wed, Jul 10, 2024 at 8:14=E2=80=AFAM Tim Orling <tim.orling@kons=
ulko.com>
> > > wrote:
> > > > > On Tue, Jul 9, 2024 at 5:54=E2=80=AFAM Richard Leitner <dev@g0hl1=
n.net>
> wrote:
> > > > >> On Tue, Jul 09, 2024 at 08:12:06AM GMT, akuster808 wrote:
> > > > >> > Hello Richard,
> > > > >> >
> > > > >> > On 7/6/24 2:08 PM, Richard Leitner via lists.openembedded.org
> > > wrote:
> > > > >> > > The currently available python-3-pydantic v2.7.0 requires
> > > > >> > > python3-pydantic-core to be updated to v2.18.1.
> > > <snip>
> > > Do you got failing ptests for scarthgap (with this patch applied) too=
?
> > > Or did you just tested master?
> > >
> >
> > I won't try any stable branches until I get it fully functional on
> master.
> > The challenge is time and the fact that Rust is injecting TMPDIR into t=
he
> > .so
> > Given that master now makes [build-paths] QA WARNING an ERROR, we need =
to
> > fix this.
>
> True. So will you follow up on the pydantic/core update for
> master as soon as there is a fix for this issue?
>

I am focused on master. I will not actively try to fix scarthgap. Others
are already working on that (see below).


>
> How to proceed with scarthgap? As we are definitely shipping
> non-compatible versions of pydantic/pydantic-core currently.
>

https://lore.kernel.org/openembedded-devel/20240726130135.1250-1-debrabande=
r@gmail.com/T/#u


>
> >
> > I suspect, but have not proven, that it was already a problem with the
> > original python3-pydantic-core before any of these upgrades.
>
> ...
>

--000000000000d29d74061e644c76
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 29, 2024 at 4:07=E2=80=AF=
AM Richard Leitner &lt;<a href=3D"mailto:dev@g0hl1n.net">dev@g0hl1n.net</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On T=
hu, Jul 18, 2024 at 08:27:50AM GMT, Tim Orling wrote:<br>
&gt; On Thu, Jul 18, 2024 at 7:49=E2=80=AFAM Richard Leitner &lt;<a href=3D=
"mailto:dev@g0hl1n.net" target=3D"_blank">dev@g0hl1n.net</a>&gt; wrote:<br>
&gt; &gt; On Wed, Jul 10, 2024 at 12:10:01PM GMT, Tim Orling wrote:<br>
&gt; &gt; &gt; On Wed, Jul 10, 2024 at 8:14=E2=80=AFAM Tim Orling &lt;<a hr=
ef=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@konsulko=
.com</a>&gt;<br>
&gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt; On Tue, Jul 9, 2024 at 5:54=E2=80=AFAM Richard Leitner =
&lt;<a href=3D"mailto:dev@g0hl1n.net" target=3D"_blank">dev@g0hl1n.net</a>&=
gt; wrote:<br>
&gt; &gt; &gt; &gt;&gt; On Tue, Jul 09, 2024 at 08:12:06AM GMT, akuster808 =
wrote:<br>
&gt; &gt; &gt; &gt;&gt; &gt; Hello Richard,<br>
&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; On 7/6/24 2:08 PM, Richard Leitner via <a href=
=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lis=
ts.openembedded.org</a><br>
&gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; The currently available python-3-pydantic=
 v2.7.0 requires<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; python3-pydantic-core to be updated to v2=
.18.1.<br>
&gt; &gt; &lt;snip&gt;<br>
&gt; &gt; Do you got failing ptests for scarthgap (with this patch applied)=
 too?<br>
&gt; &gt; Or did you just tested master?<br>
&gt; &gt;<br>
&gt; <br>
&gt; I won&#39;t try any stable branches until I get it fully functional on=
 master.<br>
&gt; The challenge is time and the fact that Rust is injecting TMPDIR into =
the<br>
&gt; .so<br>
&gt; Given that master now makes [build-paths] QA WARNING an ERROR, we need=
 to<br>
&gt; fix this.<br>
<br>
True. So will you follow up on the pydantic/core update for<br>
master as soon as there is a fix for this issue?<br></blockquote><div><br><=
/div><div>I am focused on master. I will not actively try to fix scarthgap.=
 Others are already working on that (see below).</div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
<br>
How to proceed with scarthgap? As we are definitely shipping<br>
non-compatible versions of pydantic/pydantic-core currently.<br></blockquot=
e><div><br></div><div><a href=3D"https://lore.kernel.org/openembedded-devel=
/20240726130135.1250-1-debrabander@gmail.com/T/#u">https://lore.kernel.org/=
openembedded-devel/20240726130135.1250-1-debrabander@gmail.com/T/#u</a></di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; <br>
&gt; I suspect, but have not proven, that it was already a problem with the=
<br>
&gt; original python3-pydantic-core before any of these upgrades.<br>
<br>
...<br>
</blockquote></div></div>

--000000000000d29d74061e644c76--

