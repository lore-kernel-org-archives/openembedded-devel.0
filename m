Return-Path: <jaskij@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 592EEC433F5
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 17:14:48 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web08.7717.1652894082276281095
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 May 2022 10:14:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IaAC0xR8;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: jaskij@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-d6e29fb3d7so3552731fac.7
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 May 2022 10:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=F0l63g5kycC7LY2QLDmAtSBL5EJGYG/pR36utLdno5Q=;
        b=IaAC0xR8yGoO3VVqa+vfqQHpMqL/ybikpbY2Ad7BEoLj67sJ+aFr/IeBq4CvGi0i7W
         bpzXQ8XcUVm//SnK42s6BxKEI/kV+v+4SvHRPSC5oS7886CDYm1zAa8B4Zx7sT2BW0jG
         Qahdsnxep/2o7Znuwe+mOPCCotDfQY4+sMjYzv80DJEv+mImWEoVw3V2RrgBJepeJeUk
         dA+l58ZQvNd70k54ieZ6E6VRnqyBDDD78BGwoQH+rlyXmLyfOwCHj8rR6vFF8CzwBp/f
         e9shQNcfNsfjHlicn3I+sFt8c4PM5kjHaJ9E1hmYc49aSO3MHZPsFp0IYhB5hvYJxJMZ
         kaIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=F0l63g5kycC7LY2QLDmAtSBL5EJGYG/pR36utLdno5Q=;
        b=ja2AnRb3YGPmfn/7O9ujE5clwM66xyLaERTePgstV59ESaq09gPKi76Ug29I/29GLg
         rpCvzB/5GQFwVJdUNE4YdEtJD+GSlg9ySdmoJcxFj9LH3JZy/WNHthsQ/7cR0lgZrafm
         yaWUDXoKdS7v1wpcEQLY24OJVfdMPlS93EaO/ejRJ5P3io2Y4h96qg7LSnTQ4T7+M3x8
         VeMT5FYZRg4sYRVkFUVUUCnxKnBW0Apr+yg5dJHHUSNxLz19UyC8ZxKo1djmenYBNrf4
         RD22tG1ehaOF5UmKtESOrZJmvskihl8u9ywsLvFQz6oCR87Ql3hgWxZIceZytUR1IIPA
         R8yg==
X-Gm-Message-State: AOAM531aZzNXCqvWR04jytLYDLlx3s0PzwPsLH4lL7wz/7n0JCle2hxp
	3FEzjQHsUZ2EGXh8/pKq5Bc11fNpLfXg06yras1N0xx27JM=
X-Google-Smtp-Source: 
 ABdhPJyST/rvgKIYiXFxJujnXYXfTsSW9vjN/YRO/oildp8/tSWHIpccucIZnvAtqB3hVBtYThD8230Wv/MhE7g2wLs=
X-Received: by 2002:a05:6870:330d:b0:f1:c7e5:1ab3 with SMTP id
 x13-20020a056870330d00b000f1c7e51ab3mr640687oae.262.1652894081390; Wed, 18
 May 2022 10:14:41 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAGRymWUFaGpqbw769Vr_N7--6B8uRj8A5wCvc01nDfudk5FZfQ@mail.gmail.com>
 <2d54f700-7f32-5a4a-bdd3-19f3786d591a@gmail.com>
In-Reply-To: <2d54f700-7f32-5a4a-bdd3-19f3786d591a@gmail.com>
From: jaskij <jaskij@gmail.com>
Date: Wed, 18 May 2022 19:14:30 +0200
Message-ID: 
 <CAGRymWV0B1Lijh7sU87bkGnP+BW7X7GjcznawfaXeP6gqyCfKg@mail.gmail.com>
Subject: Re: [oe] [BUG] python3-protobuf performance regression
To: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000929f2305df4c6433"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 May 2022 17:14:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97164

--000000000000929f2305df4c6433
Content-Type: text/plain; charset="UTF-8"

On Wed, May 18, 2022 at 5:30 PM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 5/18/22 5:48 AM, jaskij wrote:
> > Hello everyone,
> >
> > After updating from Hardknott to Kirkstone, we have noticed a massive
> > performance regression in python3-protobuf.
> >
> > The regression is caused by the package not building (and thus not
> > using) the native implementation. What seems to have happened is that
> > `DISTUTILS_BUILD_ARGS` in the python3-protobuf recipe was not updated to
> > `SETUPTOOLS_BUILD_ARGS`. This would be a simple fix - just update the
> > recipe and set the flag, if not for one thing: protobuf in meta-oe is in
> > version 3.19.4, and python3-protobuf 3.20.0 in meta-python is not able
> > to link against it.
> >
> > Internally, I have rolled back python3-protobuf to 3.19.4 and built it
> > with `SETUPTOOLS_BUILD_ARGS += "--cpp_implementation"`. The difference
> > is... massive.
> >
> > For 2000 samples with our test code we get (all times in microseconds):
> >
> > python3-protobuf 3.20
> > parse      mean: 28713us percentiles: {5: 26623, 25: 27343, 50: 28943,
> > 75: 29663, 95: 30687}
> > python3-protobuf 3.19
> > parse      mean:   939us percentiles: {5: 756, 25: 944, 50: 950, 75:
> > 956, 95: 1008}
> >
> > Changing the variable in python3-protobuf is simple, the problem is the
> > version mismatch. It's either roll back python3-protobuf or update
> protobuf.
> >
>
> Can you test the updated protobuf scenario ? if that works I would think
> thats a preferred aproach.
>
> Some of the current patches fail to apply to 3.20.1, and I am not familiar
with the codebase, otherwise I'd be happy to.

> > Jan
> >
> > --
> > Jan Dorniak
> > e-mail:jaskij@gmail.com <mailto:e-mail%3Ajaskij@gmail.com>
> >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#97160):
> https://lists.openembedded.org/g/openembedded-devel/message/97160
> > Mute This Topic: https://lists.openembedded.org/mt/91185173/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>


-- 
Jan Dorniak
e-mail:jaskij@gmail.com

--000000000000929f2305df4c6433
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, May 18, 2022 at 5:30 PM Khem Raj =
&lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 5/18/22 5:48 AM, jaskij wrote:<br>
&gt; Hello everyone,<br>
&gt; <br>
&gt; After updating from Hardknott to Kirkstone, we have noticed a massive =
<br>
&gt; performance regression in python3-protobuf.<br>
&gt; <br>
&gt; The regression is caused by the package not building (and thus not <br=
>
&gt; using) the native implementation. What seems to have happened is that =
<br>
&gt; `DISTUTILS_BUILD_ARGS` in the python3-protobuf recipe was not updated =
to <br>
&gt; `SETUPTOOLS_BUILD_ARGS`. This would be a simple fix - just update the =
<br>
&gt; recipe and set the flag, if not for one thing: protobuf in meta-oe is =
in <br>
&gt; version 3.19.4, and python3-protobuf 3.20.0 in meta-python is not able=
 <br>
&gt; to link against it.<br>
&gt; <br>
&gt; Internally, I have rolled back python3-protobuf to 3.19.4 and built it=
 <br>
&gt; with `SETUPTOOLS_BUILD_ARGS +=3D &quot;--cpp_implementation&quot;`. Th=
e difference <br>
&gt; is... massive.<br>
&gt; <br>
&gt; For 2000 samples with our test code we get (all times in microseconds)=
:<br>
&gt; <br>
&gt; python3-protobuf 3.20<br>
&gt; parse =C2=A0 =C2=A0 =C2=A0mean: 28713us percentiles: {5: 26623, 25: 27=
343, 50: 28943, <br>
&gt; 75: 29663, 95: 30687}<br>
&gt; python3-protobuf 3.19<br>
&gt; parse =C2=A0 =C2=A0 =C2=A0mean: =C2=A0 939us percentiles: {5: 756, 25:=
 944, 50: 950, 75: <br>
&gt; 956, 95: 1008}<br>
&gt; <br>
&gt; Changing the variable in python3-protobuf is simple, the problem is th=
e <br>
&gt; version mismatch. It&#39;s either roll back python3-protobuf or update=
 protobuf.<br>
&gt; <br>
<br>
Can you test the updated protobuf scenario ? if that works I would think <b=
r>
thats a preferred aproach.<br>
<br></blockquote><div>Some of the current patches fail to apply to 3.20.1, =
and I am not familiar with the codebase, otherwise I&#39;d be happy to. <br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; Jan<br>
&gt; <br>
&gt; -- <br>
&gt; Jan Dorniak<br>
&gt; <a href=3D"mailto:e-mail%3Ajaskij@gmail.com" target=3D"_blank">e-mail:=
jaskij@gmail.com</a> &lt;mailto:<a href=3D"mailto:e-mail%253Ajaskij@gmail.c=
om" target=3D"_blank">e-mail%3Ajaskij@gmail.com</a>&gt;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#97160): <a href=3D"https://lists.openembedded.org/=
g/openembedded-devel/message/97160" rel=3D"noreferrer" target=3D"_blank">ht=
tps://lists.openembedded.org/g/openembedded-devel/message/97160</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91185173=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/91185173/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><span style=3D"color:rgb(102,102,102)">Jan=
 Dorniak</span><br style=3D"color:rgb(102,102,102)"><a style=3D"color:rgb(1=
02,102,102)" href=3D"mailto:e-mail%3Ajaskij@gmail.com" target=3D"_blank">e-=
mail:jaskij@gmail.com</a><font color=3D"#666666"><br></font><br><div></div>=
</div></div></div>

--000000000000929f2305df4c6433--

