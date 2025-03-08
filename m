Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C2A1C282EC
	for <webhook@archiver.kernel.org>; Sat,  8 Mar 2025 17:00:23 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.12420.1741453219156813971
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Mar 2025 09:00:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OI79Rcep;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3f675d848c4so1599785b6e.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Mar 2025 09:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741453218; x=1742058018; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rwQgtfPUOzb8jtzCd0ealezrlCFlz6bYsAV6FJPZubg=;
        b=OI79RcepNatS+/3TNYdP2digWGv0Is676yzAlif2ix4gXPytb8Y5CA7qT6qFNIRigP
         7bpvIxr3hc0f3VwU4vrgXfjdpJAknMx7yABTbcZwHcNkmA6ZLD8vfSudLw/2dLHnMPKj
         L9kghs1iopq4MRSBLZT7+xoNiJ1V7iQ51nLTguKhdvCM8paTcmxKuMOrMEYZbdWV50Fz
         EQcvSe+Un+daC4YB49XRbelqFlFWe4BKyA+rNLL6MZxI0nkV+2KIBxWTkUgL1SnhJRae
         ynnoyhobyJZmm6vaf4jXjmzlRd6sSRDH/BaneMq05AZhHGF+Sr/o9Q2P3pHdKC2Nj7ZR
         B6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741453218; x=1742058018;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rwQgtfPUOzb8jtzCd0ealezrlCFlz6bYsAV6FJPZubg=;
        b=Bkm/i51cVUSmu0QOAlttXTN/gGk4OgdEHXk/A3N/FSmFpB3msqDtGidr7WXFF0HsLR
         doQZmL4ey4mcqKiYIXJungi74as12aAEuZA7Ri196KmhQ2I6+S2x4tiz3LrPeILBkIvA
         QsrmXgwVxhEWFqyUhX8rs5H2bfvidz7yW861xfMt2+9fXVGjBcDnenMGK++YXeS7SUez
         zAKQpIZHrsv86EYAbWaw4WwMTDav33MNwrpLc+YawBWm6MClhpYmkPWBkSpPLjnrowXc
         30Lf9iTvX5K+uUN2Ccm8d8Z+4Ot3Yl5TFlFBThtqB3UqWtIeTF7jH46137+cQ617nSkE
         J0rQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmuvBgQ9MuexWmU8eck62vFuX4sD7PXsp28nUvDyTpv8V7F07mzr8pC5QN517mUCW82gpD3qQK4YUHJpevjtaTxNM=@lists.openembedded.org
X-Gm-Message-State: AOJu0YynkNgeH3HSgrlHLTj3702xf1PU2v5SnKFIg9MS+a5Z9uUXbf/r
	n+9mBmggswEPVBalk6hxjGwpg1mNKlocX1tQEQ0sN8laaKdiQJjamnaxcU58Wu/J/ZY79wMxSRi
	D1DQZLwid1myNv5mzZ5ZlBVIEBEA=
X-Gm-Gg: ASbGncsnJVfH/hBneSFZ4sxqDHeHLeeQ2qYpqOuX3zCTc9YFCoCX6IgUZkG73PrLvgE
	jGEXdthPADozi7lmZejeeAFQ87JbO/+QsAwd6iut6Ri+j6fFNXVNMIFSbdfE+7tKiW4+VKRzjec
	W0nps0fehSB2VKKevaKhe5Hh51wnxO/eBSUJvaMGzXrlz6/rghFC4VvsJrZU4=
X-Google-Smtp-Source: AGHT+IE0ZS42ntx27KxgalJ1bt9S5Xv/DLF5L+XXWS5zCrwvD9hBA1Q743LgydFlALzb6KCr3QBP9ooDUpBNIV40QZQ=
X-Received: by 2002:aca:1c07:0:b0:3f7:11b0:80f0 with SMTP id
 5614622812f47-3f711b0835dmr312392b6e.16.1741453218324; Sat, 08 Mar 2025
 09:00:18 -0800 (PST)
MIME-Version: 1.0
References: <CAGAhMBz9zz0K8Fnj__NkEVvbsD8SibEs=BKR8YFE9mv+mG6tsw@mail.gmail.com>
 <17fde519-38d7-4c44-8592-a0ff6efd56fe@balister.org> <CA+chaQdAgNa4V-c9B48CkLOAxYhGcc2bcmb=mUMqe2U+gFf+Hg@mail.gmail.com>
 <CAMKF1sprcWE99WFDtfF1SeMYzZ_M5RbkeJtN4DACTyyB0WKcwg@mail.gmail.com> <CAGAhMBzDoS9ihpnbFBW3wLmxCkxyO9fxgwZnfGBYWtd4OmGGzQ@mail.gmail.com>
In-Reply-To: <CAGAhMBzDoS9ihpnbFBW3wLmxCkxyO9fxgwZnfGBYWtd4OmGGzQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 8 Mar 2025 09:00:07 -0800
X-Gm-Features: AQ5f1Jo19lxNN8rdfnAmgHHm-0ZeKCVJivWCX-iTN1EPZDxudyuyekDiOeKgkhM
Message-ID: <CAMKF1soNROe1bhvn0oWWyv7iKapJLxPPbqcvrdpGFuH1+B4q4A@mail.gmail.com>
Subject: Re: [oe] [meta-python] python3-scipy
To: Rob Woolley <rob.woolleywr@gmail.com>
Cc: martin.jansa@gmail.com, philip@balister.org, 
	openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000078ab78062fd7acc4"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Mar 2025 17:00:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115809

--00000000000078ab78062fd7acc4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 8, 2025 at 5:28=E2=80=AFAM Rob Woolley <rob.woolleywr@gmail.com=
> wrote:

> I don't mind signing up to help maintain it in meta-python.  I need to
> make sure they keep building either way.
>
> I have some other Python recipes in meta-ros that are not specific to ROS
> itself, that I'd prefer to maintain upstream.
>
> Are new recipes allowed in meta-openembedded for all supported branches o=
r
> just the development release?
>

For development sure for backports it=E2=80=99s not in LTS policy sadly


>
> Regards,
> Rob
>
> On Fri, Mar 7, 2025 at 2:08=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
>> On Fri, Mar 7, 2025 at 10:55=E2=80=AFAM Martin Jansa via
>> lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
>> wrote:
>> >
>> > On Fri, Mar 7, 2025 at 7:38=E2=80=AFPM Philip Balister via
>> > lists.openembedded.org <philip=3Dbalister.org@lists.openembedded.org>
>> > wrote:
>> > >
>> > > On 3/6/25 1:07 PM, Rob Woolley via lists.openembedded.org wrote:
>> > > > The meta-scipy layer was archived on Nov 30, 2023 (
>> https://github.com/
>> > > > tuxable-ltd/meta-scipy <https://github.com/tuxable-ltd/meta-scipy>=
)
>> > > >
>> > > > I need python3-scipy for some recipes in ROS 2 (notably pinocchio)=
,
>> so I
>> > > > patched it up and got it building again:
>> https://github.com/robwoolley/
>> > > > meta-scipy <https://github.com/robwoolley/meta-scipy>
>> > > >
>> > > > I don't know the history behind why it was in a separate layer.
>> Would
>> > > > it be worth submitting to meta-python instead of resurrecting the
>> meta-
>> > > > scipy layer?
>> > >
>> > > I want to say because scipy needs fortran and that is not built by
>> > > default. So world builds woul dneed to skip scipy unless fortran was
>> > > enabled.
>> > >
>> > > Does this sound right?
>> >
>> > Which is the same as meta-oe/recipes-devtools/lapack/lapack_3.12.1.bb
>> > which also depends on libgfortran and only has:
>> > EXCLUDE_FROM_WORLD =3D "1"
>> > and comment about how to enable fortran in gcc.
>> >
>> > Just depending on fortran shouldn't eliminate it from meta-python.
>>
>> I think, I will need someone to signup to maintain it there, there are
>> changes always
>> happening that will require fixing these packages, In the end it falls
>> on my plate whenever
>> there is a python upgrade in core or something else which breaks it,
>>
>> >
>> > Cheers,
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#115798):
>> https://lists.openembedded.org/g/openembedded-devel/message/115798
>> > Mute This Topic: https://lists.openembedded.org/mt/111555507/1997914
>> > Group Owner: openembedded-devel+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub
>> [raj.khem@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >
>>
>

--00000000000078ab78062fd7acc4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Sat, Mar 8, 2025 at 5:28=E2=80=AFAM =
Rob Woolley &lt;<a href=3D"mailto:rob.woolleywr@gmail.com">rob.woolleywr@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"=
ltr">I don&#39;t mind signing up to help maintain it in meta-python.=C2=A0 =
I need to make sure they keep building either way.<br><br>I have some other=
 Python recipes in meta-ros that are not specific to ROS itself, that I&#39=
;d prefer to maintain upstream.<div><br></div><div>Are new recipes allowed =
in meta-openembedded for all supported branches or just the development rel=
ease?</div></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto"=
>For development sure for backports it=E2=80=99s not in LTS policy sadly</d=
iv><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"l=
tr"><div dir=3D"auto"><br><br>Regards,<br>Rob</div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 7, 2025 at 2=
:08=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">On Fri, Mar 7, 2025 at 10:55=E2=80=AFAM Martin J=
ansa via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;martin.jansa=3D<a href=3D"mailto:gmail.c=
om@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.o=
rg</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; On Fri, Mar 7, 2025 at 7:38=E2=80=AFPM Philip Balister via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a> &lt;philip=3D<a href=3D"mailto:balister=
.org@lists.openembedded.org" target=3D"_blank">balister.org@lists.openembed=
ded.org</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On 3/6/25 1:07 PM, Rob Woolley via <a href=3D"http://lists.openem=
bedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a>=
 wrote:<br>
&gt; &gt; &gt; The meta-scipy layer was archived on Nov 30, 2023 (<a href=
=3D"https://github.com/" rel=3D"noreferrer" target=3D"_blank">https://githu=
b.com/</a><br>
&gt; &gt; &gt; tuxable-ltd/meta-scipy &lt;<a href=3D"https://github.com/tux=
able-ltd/meta-scipy" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/tuxable-ltd/meta-scipy</a>&gt;)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I need python3-scipy for some recipes in ROS 2 (notably pino=
cchio), so I<br>
&gt; &gt; &gt; patched it up and got it building again: <a href=3D"https://=
github.com/robwoolley/" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/robwoolley/</a><br>
&gt; &gt; &gt; meta-scipy &lt;<a href=3D"https://github.com/robwoolley/meta=
-scipy" rel=3D"noreferrer" target=3D"_blank">https://github.com/robwoolley/=
meta-scipy</a>&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I don&#39;t know the history behind why it was in a separate=
 layer.=C2=A0 Would<br>
&gt; &gt; &gt; it be worth submitting to meta-python instead of resurrectin=
g the meta-<br>
&gt; &gt; &gt; scipy layer?<br>
&gt; &gt;<br>
&gt; &gt; I want to say because scipy needs fortran and that is not built b=
y<br>
&gt; &gt; default. So world builds woul dneed to skip scipy unless fortran =
was<br>
&gt; &gt; enabled.<br>
&gt; &gt;<br>
&gt; &gt; Does this sound right?<br>
&gt;<br>
&gt; Which is the same as meta-oe/recipes-devtools/lapack/<a href=3D"http:/=
/lapack_3.12.1.bb" rel=3D"noreferrer" target=3D"_blank">lapack_3.12.1.bb</a=
><br>
&gt; which also depends on libgfortran and only has:<br>
&gt; EXCLUDE_FROM_WORLD =3D &quot;1&quot;<br>
&gt; and comment about how to enable fortran in gcc.<br>
&gt;<br>
&gt; Just depending on fortran shouldn&#39;t eliminate it from meta-python.=
<br>
<br>
I think, I will need someone to signup to maintain it there, there are<br>
changes always<br>
happening that will require fixing these packages, In the end it falls<br>
on my plate whenever<br>
there is a python upgrade in core or something else which breaks it,<br>
<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#115798): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/115798" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/115798</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11155550=
7/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/111555507/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>
</blockquote></div></div>

--00000000000078ab78062fd7acc4--

