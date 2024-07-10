Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B52C3DA41
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 19:10:19 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.3274.1720638615203189249
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jul 2024 12:10:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=MAnyARVz;
 spf=pass (domain: konsulko.com, ip: 209.85.218.44, mailfrom: tim.orling@konsulko.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a77e6dd7f72so14445666b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 12:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1720638613; x=1721243413; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LvWqgzr09aazFKUGulUMGmqlgrr2YfppPg2YoilXbLE=;
        b=MAnyARVzmig3dDBUGnrgOcJw95OTHoYh5AD4cXLexXE9vhz4nyDG9sPDpeFYgrizbi
         1W1Bs7/Mmuxm6JrMqhZi98RCH//OaJFWtxl2VrXBy9Jl/KkPwxzZG7M4fMsCLAx6FgRb
         wmDTfknySgHwaSnAksZPBOI0wcO/1npNa1SQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720638613; x=1721243413;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LvWqgzr09aazFKUGulUMGmqlgrr2YfppPg2YoilXbLE=;
        b=kXzrjONVxM1/KDKAYHX2DlBaxaZkLxe4cmD6fsPnVjtuCpTwOQHxW1584/Egkf31ca
         fzaAWcObCihv4uRdskjRFtfXLNNafuWkM+5IhcyAkTKn7pb1Yn2D/awTAw7yEqgu2cbo
         W33ywNWKD6/4szlX1NJhMuahRvqjICsk8YMxCnKfMAEKtLk3Er3wc5zACzcyJ10jc6Je
         pyMYdf1hVJEWqQ+bPsBNE6HFiLE6hESvPAn6+4xWFRIyGfE5Yrk3SOfihhaDau90rcAc
         HC+gbrNzEi4NCG1EiPFG9iUrlwhfcUnZKUkIV82lH1pJS2bLd5ntkbdHKu72A7UFi5yV
         4nXA==
X-Forwarded-Encrypted: i=1; AJvYcCXCcSdu+H75kEz4scNnJI2367QhMnGn3iH9LRM2Gu6xv02e9JBPl7frNPVtZwd80Xyo0gmI05JgBUXJgODzNu9aSK5i3qJEOAR9VsNP+S/qs1aGu9J7FHD7Zg==
X-Gm-Message-State: AOJu0YyWf3IHXQ/zII1pg8NePf6XoSFscbjOMhY5IpOq2R6qOW0Gcktl
	ka73I29oQk5Icw/1x1ehNKe6gkUcqBbNKW5NTPxng39nMFdS913OhwGOcmt0JqniS3LT0r981C7
	0ZZ508jaEUr7GyDu8qMTiEExjORITE+lCrZt31A==
X-Google-Smtp-Source: AGHT+IFRqN6rskAJxas3891dznPHk9PZrlKknQvciBYMIm34eRohENJUt49WTFm+fVczWt8f/LrrGCX05g8YZQrVvzo=
X-Received: by 2002:a17:906:4c57:b0:a6f:ab9c:7778 with SMTP id
 a640c23a62f3a-a780b6fd1e3mr422135166b.34.1720638613513; Wed, 10 Jul 2024
 12:10:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240706180810.1707296-1-dev@g0hl1n.net> <26a61314-0aa1-4e5c-ac71-d0ece3591362@gmail.com>
 <w24ywr4aiiqxecb46semqmbw4ulstn4rz25mwbiurkwh4xzxva@oyphvy5wc7nj> <CAOyo-87-wojy-WxNs98qWp9kev2Dpui-Nk8ffLzwWQbmsvpvjQ@mail.gmail.com>
In-Reply-To: <CAOyo-87-wojy-WxNs98qWp9kev2Dpui-Nk8ffLzwWQbmsvpvjQ@mail.gmail.com>
From: Tim Orling <tim.orling@konsulko.com>
Date: Wed, 10 Jul 2024 12:10:01 -0700
Message-ID: <CAOyo-86Zds3bvy0GvmiBEDRignUn2Z509SkD7Lw1xZ-0Ky30bg@mail.gmail.com>
Subject: Re: [oe] [meta-python][scarthgap][PATCH] python3-pydantic-core:
 upgrade 2.16.3 -> 2.18.1
To: Richard Leitner <dev@g0hl1n.net>
Cc: akuster808 <akuster808@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005883d2061ce965e6"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 19:10:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111305

--0000000000005883d2061ce965e6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 8:14=E2=80=AFAM Tim Orling <tim.orling@konsulko.com=
> wrote:

>
>
> On Tue, Jul 9, 2024 at 5:54=E2=80=AFAM Richard Leitner <dev@g0hl1n.net> w=
rote:
>
>> Hi Armin,
>>
>> On Tue, Jul 09, 2024 at 08:12:06AM GMT, akuster808 wrote:
>> > Hello Richard,
>> >
>> > On 7/6/24 2:08 PM, Richard Leitner via lists.openembedded.org wrote:
>> > > The currently available python-3-pydantic v2.7.0 requires
>> > > python3-pydantic-core to be updated to v2.18.1.
>>
>
I don't know what we want to do with scarthgap. Part of me thinks we should
revert the 2.7.0 upgrade to one which is compatible with 2.16.3
python3-pydantc-core. Part of me thinks upgrade python3-pydantic-core to
2.18.1, but we won't have that in master. Right now, it appears to me that
we need new recipes (python3-tzdata) in order to build 2.19.0 (I did not
look at 2.18.x). Adding new recipes sounds against stable policy to me.



> > I don't see the updated or later version in master? Am I missing
>> something?
>>
>> I found a series from Tim [1] which updates python3-pydantic and
>> python3-pydantic-core
>> to 2.7.4/1.9.0 for master.
>> As those are newer versions I didn't send this patch for master.
>>
>
> That series needed to be rebased, per khem. Just because it is on
> patchwork does not imply merging or correctness.
> During the rebase I discovered missing dependencies.
>
> Also, python3-pydantic-core has a QA warning about TMPDIR
>  WARNING: python3-pydantic-core-2.19.0-r0 do_package_qa: QA Issue: File
> /usr/lib/python3.12/site-packages/pydantic_core/_
> pydantic_core.cpython-312-x86_64-linux-gnu.so in package
> python3-pydantic-core contains reference to TMPDIR [buildpaths]
>
> Which seems to be RUSTFLAGS being injected into the .so for some reason
> (where 14 is the .rodata section):
> readelf -p 14 pydantic_core/_pydantic_core.cpython-312-x86_64-linux-gnu.s=
o
>
> <snip>
>   [   f7c]  i
> ...skipping...
>
> model-fieldsdataclasstuplefrozensetdefinition-refdefinitionsUnknown schem=
a
> type: "2.19.0a-alphab-beta__version__profile=3Drelease pgo=3D -L
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/core2-64-poky-linux=
/python3-pydantic-coas
>   [ 2ae09]  kwargs
>   [ 2ae10]  (args,
> kwargs=3DNone)ArgsKwargs(kwargssrc/argument_markers.rsCreating instances =
of
> "UndefinedType" is not supportednew()\n
> <snip>
>
> The above seems to be a backtrace from the schema generation script, but =
I
> haven't figured out yet how to troubleshoot further.
>

Filed an issue upstream:
https://github.com/pydantic/pydantic-core/issues/1365

>
> Meanwhile, upstream has updated again.
> My working branch:
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dtimo/pyth=
on3-pydantic-upgrade
>

Found more ptest RDEPENDS missing for python3-pydantic. That branch
currently passes ptests for:
bitbake (-c testimage) meta-python-image-ptest-python3-pydantic-core
bitbake (-c testimage) meta-python-image-ptest-python3-pydantic

>
>
>
>> Furthermore I wanted to fix the incorrect dependency first before
>> trying to update python3-pydantic for scarthgap (and therefore backport
>> Tims series).
>>
>> So how should we proceed here? Should this patch be sent for master too?
>> Or should the series from Tim should be followed up for master?
>>
>> regards;rl
>>
>> >
>> > - Armin
>> >
>>
>> [1] https://patchwork.yoctoproject.org/project/oe/list/?series=3D25615
>>
>

--0000000000005883d2061ce965e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 10, 2024 at 8:14=E2=80=AF=
AM Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com">tim.orling@kon=
sulko.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 9, 2024 at 5:5=
4=E2=80=AFAM Richard Leitner &lt;<a href=3D"mailto:dev@g0hl1n.net" target=
=3D"_blank">dev@g0hl1n.net</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">Hi Armin,<br>
<br>
On Tue, Jul 09, 2024 at 08:12:06AM GMT, akuster808 wrote:<br>
&gt; Hello Richard,<br>
&gt; <br>
&gt; On 7/6/24 2:08 PM, Richard Leitner via <a href=3D"http://lists.openemb=
edded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> =
wrote:<br>
&gt; &gt; The currently available python-3-pydantic v2.7.0 requires<br>
&gt; &gt; python3-pydantic-core to be updated to v2.18.1.<br></blockquote><=
/div></div></blockquote><div><br></div><div>I don&#39;t know what we want t=
o do with scarthgap. Part of me thinks we should revert the 2.7.0 upgrade t=
o one which is compatible with 2.16.3 python3-pydantc-core. Part of me thin=
ks upgrade python3-pydantic-core to 2.18.1, but we won&#39;t have that in m=
aster. Right now, it appears to me that we need new recipes (python3-tzdata=
) in order to build 2.19.0 (I did not look at 2.18.x). Adding new recipes s=
ounds against stable policy to me.</div><div><br></div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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
pydantic_core.cpython-312-x86_64-linux-gnu.so" target=3D"_blank">pydantic_c=
ore.cpython-312-x86_64-linux-gnu.so</a> in package python3-pydantic-core co=
ntains reference to TMPDIR [buildpaths]</div><div><br></div><div>Which seem=
s to be RUSTFLAGS being injected into the .so for some reason (where 14 is =
the .rodata section):</div><div>readelf -p 14 pydantic_core/_<a href=3D"htt=
p://pydantic_core.cpython-312-x86_64-linux-gnu.so" target=3D"_blank">pydant=
ic_core.cpython-312-x86_64-linux-gnu.so</a></div><div><br></div><div>&lt;sn=
ip&gt;=C2=A0</div><div>=C2=A0 [ =C2=A0 f7c] =C2=A0i<br>...skipping...<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 model-fieldsdataclasstuple=
frozensetdefinition-refdefinitionsUnknown schema type: &quot;2.19.0a-alphab=
-beta__version__profile=3Drelease pgo=3D -L /srv/build/ttorling/workspace-u=
pgrades/build/tmp/work/core2-64-poky-linux/python3-pydantic-coas<br>=C2=A0 =
[ 2ae09] =C2=A0kwargs<br>=C2=A0 [ 2ae10] =C2=A0(args, kwargs=3DNone)ArgsKwa=
rgs(kwargssrc/argument_markers.rsCreating instances of &quot;UndefinedType&=
quot; is not supportednew()\n<br></div><div>&lt;snip&gt;</div><div><br></di=
v><div>The above seems to be a backtrace from the schema generation script,=
 but I haven&#39;t figured out=C2=A0yet how to troubleshoot further.</div><=
/div></div></blockquote><div><br></div><div>Filed an issue upstream:</div><=
div><a href=3D"https://github.com/pydantic/pydantic-core/issues/1365">https=
://github.com/pydantic/pydantic-core/issues/1365</a>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail=
_quote"><div><br></div><div>Meanwhile, upstream has updated again.</div><di=
v>My working branch:</div><div><a href=3D"https://git.openembedded.org/meta=
-openembedded-contrib/log/?h=3Dtimo/python3-pydantic-upgrade" target=3D"_bl=
ank">https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dtimo/p=
ython3-pydantic-upgrade</a></div></div></div></blockquote><div><br></div><d=
iv>Found more ptest RDEPENDS missing for python3-pydantic. That branch curr=
ently passes ptests=C2=A0for:</div>bitbake (-c testimage) meta-python-image=
-ptest-python3-pydantic-core<br><div>bitbake (-c testimage) meta-python-ima=
ge-ptest-python3-pydantic=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><br></div><div=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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
</blockquote></div></div>

--0000000000005883d2061ce965e6--

