Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFBF0C3DA41
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 15:15:01 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.17107.1720624495772648292
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jul 2024 08:14:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=O0kDBn4G;
 spf=pass (domain: konsulko.com, ip: 209.85.218.48, mailfrom: tim.orling@konsulko.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a77bf336171so181040066b.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 08:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1720624494; x=1721229294; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tUlkW/B7ot82PevMO+UPYTNj8AundloacA3EjCf2ubA=;
        b=O0kDBn4GsJpQ8Yccp/hrWr7ZfN9C9YZe1bBNBJQOB3hVYIIRfcwp0yV41zzNzXEaAi
         wgLDEPHGFo+dxyw06DRZWzIzlxW7VXetGls9iOYaCgH4ES11USkG36acqoDGLRHp2dgC
         C0/TeLf53ujKzjO6x9g5o8yh8Ry/9QHrt8kwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720624494; x=1721229294;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tUlkW/B7ot82PevMO+UPYTNj8AundloacA3EjCf2ubA=;
        b=FGgh82e1jPNZMY994CZP9I7h3x+7bXV4d/CKmz023zsHDs6XKoE9ZqMuq3TUHqsgYw
         eR9PILrR0y0mMJ7IeNhkKARkGEcwiWT+qkQwTwGqWJO2blcyzeo7rs+tmXY3UNkke4uj
         wUNcYTGdlKcxbs4DygbiXcQIkIEcf0OTLE5bpkAeZvtojPZf+wJoE2aW6JCnn41qes/T
         ziN7OxB2/KblWAdrNKGgFOpODUk+XnjFmdZMLPIvlYgEDmx+QypiJynzEgBPvYi0masQ
         x5nACZJyR/6Q5sldw9P8FarlQKpEA9OlezYHmZqV9+EIwwv7SeZ5MNPBboPGyCuDT1o/
         QKRg==
X-Forwarded-Encrypted: i=1; AJvYcCXhaovydzwE8RuDAQFqOYOIrp2rhS+1EI+qTXbQ5Jxft16FZaYWZ1gUklAA2iDziOl90kGDtZdlhXHmCaH9JRU46kLIniiIG9PZmrBJF/wDhgHm+ge5pFcDAg==
X-Gm-Message-State: AOJu0YwQiWCLblQWxDOfc2pWDbCJDKNytHcyQsfXNH3KmCN6WqsZWFLT
	/lV+uY5Q8Pg1G7Pj+zlS16lvNwvdJu1w4kSSqyGJjZRPYN8xCr4pfAF2Z2viugiu72NLZqnuwR8
	bRhNW/LbwmVxt0G/8BGlQVCkxB2vPOwDvIMdSWw==
X-Google-Smtp-Source: AGHT+IEnpHK40bjGSc7XP4b/DuMlOaOUVp/AZRwt8MPH2iGFxu5JtpObpSDIFfGbn3rPsfFDYF/8jTlX0XnQONz8I58=
X-Received: by 2002:a17:906:1290:b0:a6f:5609:954f with SMTP id
 a640c23a62f3a-a780d22e1bdmr388346966b.12.1720624494125; Wed, 10 Jul 2024
 08:14:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240706180810.1707296-1-dev@g0hl1n.net> <26a61314-0aa1-4e5c-ac71-d0ece3591362@gmail.com>
 <w24ywr4aiiqxecb46semqmbw4ulstn4rz25mwbiurkwh4xzxva@oyphvy5wc7nj>
In-Reply-To: <w24ywr4aiiqxecb46semqmbw4ulstn4rz25mwbiurkwh4xzxva@oyphvy5wc7nj>
From: Tim Orling <tim.orling@konsulko.com>
Date: Wed, 10 Jul 2024 08:14:42 -0700
Message-ID: <CAOyo-87-wojy-WxNs98qWp9kev2Dpui-Nk8ffLzwWQbmsvpvjQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][scarthgap][PATCH] python3-pydantic-core:
 upgrade 2.16.3 -> 2.18.1
To: Richard Leitner <dev@g0hl1n.net>
Cc: akuster808 <akuster808@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c3c2e9061ce61b1f"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 15:15:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111302

--000000000000c3c2e9061ce61b1f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 9, 2024 at 5:54=E2=80=AFAM Richard Leitner <dev@g0hl1n.net> wro=
te:

> Hi Armin,
>
> On Tue, Jul 09, 2024 at 08:12:06AM GMT, akuster808 wrote:
> > Hello Richard,
> >
> > On 7/6/24 2:08 PM, Richard Leitner via lists.openembedded.org wrote:
> > > The currently available python-3-pydantic v2.7.0 requires
> > > python3-pydantic-core to be updated to v2.18.1.
> > I don't see the updated or later version in master? Am I missing
> something?
>
> I found a series from Tim [1] which updates python3-pydantic and
> python3-pydantic-core
> to 2.7.4/1.9.0 for master.
> As those are newer versions I didn't send this patch for master.
>

That series needed to be rebased, per khem. Just because it is on patchwork
does not imply merging or correctness.
During the rebase I discovered missing dependencies.

Also, python3-pydantic-core has a QA warning about TMPDIR
 WARNING: python3-pydantic-core-2.19.0-r0 do_package_qa: QA Issue: File
/usr/lib/python3.12/site-packages/pydantic_core/_
pydantic_core.cpython-312-x86_64-linux-gnu.so in package
python3-pydantic-core contains reference to TMPDIR [buildpaths]

Which seems to be RUSTFLAGS being injected into the .so for some reason
(where 14 is the .rodata section):
readelf -p 14 pydantic_core/_pydantic_core.cpython-312-x86_64-linux-gnu.so

<snip>
  [   f7c]  i
...skipping...

model-fieldsdataclasstuplefrozensetdefinition-refdefinitionsUnknown schema
type: "2.19.0a-alphab-beta__version__profile=3Drelease pgo=3D -L
/srv/build/ttorling/workspace-upgrades/build/tmp/work/core2-64-poky-linux/p=
ython3-pydantic-coas
  [ 2ae09]  kwargs
  [ 2ae10]  (args,
kwargs=3DNone)ArgsKwargs(kwargssrc/argument_markers.rsCreating instances of
"UndefinedType" is not supportednew()\n
<snip>

The above seems to be a backtrace from the schema generation script, but I
haven't figured out yet how to troubleshoot further.

Meanwhile, upstream has updated again.
My working branch:
https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dtimo/python=
3-pydantic-upgrade


> Furthermore I wanted to fix the incorrect dependency first before
> trying to update python3-pydantic for scarthgap (and therefore backport
> Tims series).
>
> So how should we proceed here? Should this patch be sent for master too?
> Or should the series from Tim should be followed up for master?
>
> regards;rl
>
> >
> > - Armin
> >
>
> [1] https://patchwork.yoctoproject.org/project/oe/list/?series=3D25615
>

--000000000000c3c2e9061ce61b1f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 9, 2024 at 5:54=E2=80=AFA=
M Richard Leitner &lt;<a href=3D"mailto:dev@g0hl1n.net">dev@g0hl1n.net</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Ar=
min,<br>
<br>
On Tue, Jul 09, 2024 at 08:12:06AM GMT, akuster808 wrote:<br>
&gt; Hello Richard,<br>
&gt; <br>
&gt; On 7/6/24 2:08 PM, Richard Leitner via <a href=3D"http://lists.openemb=
edded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> =
wrote:<br>
&gt; &gt; The currently available python-3-pydantic v2.7.0 requires<br>
&gt; &gt; python3-pydantic-core to be updated to v2.18.1.<br>
&gt; I don&#39;t see the updated or later version in master? Am I missing s=
omething?<br>
<br>
I found a series from Tim [1] which updates python3-pydantic and python3-py=
dantic-core<br>
to 2.7.4/1.9.0 for master.<br>
As those are newer versions I didn&#39;t send this patch for master.<br></b=
lockquote><div><br></div><div>That series needed to be rebased, per khem. J=
ust because it is on patchwork does not imply merging or correctness.</div>=
<div>During the rebase I discovered missing dependencies.</div><div><br></d=
iv><div>Also, python3-pydantic-core=C2=A0has a QA warning about TMPDIR</div=
><div>=C2=A0WARNING: python3-pydantic-core-2.19.0-r0 do_package_qa: QA Issu=
e: File /usr/lib/python3.12/site-packages/pydantic_core/_<a href=3D"http://=
pydantic_core.cpython-312-x86_64-linux-gnu.so">pydantic_core.cpython-312-x8=
6_64-linux-gnu.so</a> in package python3-pydantic-core contains reference t=
o TMPDIR [buildpaths]</div><div><br></div><div>Which seems to be RUSTFLAGS =
being injected into the .so for some reason (where 14 is the .rodata sectio=
n):</div><div>readelf -p 14 pydantic_core/_<a href=3D"http://pydantic_core.=
cpython-312-x86_64-linux-gnu.so">pydantic_core.cpython-312-x86_64-linux-gnu=
.so</a></div><div><br></div><div>&lt;snip&gt;=C2=A0</div><div>=C2=A0 [ =C2=
=A0 f7c] =C2=A0i<br>...skipping...<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 model-fieldsdataclasstuplefrozensetdefinition-refdefinitionsU=
nknown schema type: &quot;2.19.0a-alphab-beta__version__profile=3Drelease p=
go=3D -L /srv/build/ttorling/workspace-upgrades/build/tmp/work/core2-64-pok=
y-linux/python3-pydantic-coas<br>=C2=A0 [ 2ae09] =C2=A0kwargs<br>=C2=A0 [ 2=
ae10] =C2=A0(args, kwargs=3DNone)ArgsKwargs(kwargssrc/argument_markers.rsCr=
eating instances of &quot;UndefinedType&quot; is not supportednew()\n<br></=
div><div>&lt;snip&gt;</div><div><br></div><div>The above seems to be a back=
trace from the schema generation script, but I haven&#39;t figured out=C2=
=A0yet how to troubleshoot further.</div><div><br></div><div>Meanwhile, ups=
tream has updated again.</div><div>My working branch:</div><div><a href=3D"=
https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dtimo/python=
3-pydantic-upgrade">https://git.openembedded.org/meta-openembedded-contrib/=
log/?h=3Dtimo/python3-pydantic-upgrade</a><br></div><div><br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
<br>
Furthermore I wanted to fix the incorrect dependency first before<br>
trying to update python3-pydantic for scarthgap (and therefore backport<br>
Tims series).<br>
<br>
So how should we proceed here? Should this patch be sent for master too?<br=
>
Or should the series from Tim should be followed up for master?<br>
<br>
regards;rl<br>
<br>
&gt; <br>
&gt; - Armin<br>
&gt; <br>
<br>
[1] <a href=3D"https://patchwork.yoctoproject.org/project/oe/list/?series=
=3D25615" rel=3D"noreferrer" target=3D"_blank">https://patchwork.yoctoproje=
ct.org/project/oe/list/?series=3D25615</a><br>
</blockquote></div></div>

--000000000000c3c2e9061ce61b1f--

