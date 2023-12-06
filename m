Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2E69C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 15:07:18 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web10.33941.1701875233184413508
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Dec 2023 07:07:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JNGfkhGz;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6d87cfaa9e2so2816231a34.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 07:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701875232; x=1702480032; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NAtW49VoKqSR369Y9fGvwCG70si0fF32wbqjatkxqcs=;
        b=JNGfkhGzHo6XeKSaF9EbwnHfWhDWLcnSihnAPLP8E0R9I9i36kR7cHXv2w/REAhoAs
         lPD5cldNm7JA8PGyeStieZJyXisEgbI5AvOqsH/BAiB5NPz8F4nDrmCYRkhJfd6ZU5Sv
         miwiPZ1Pshq6ygyLGcNfqMEToEneaLTDXBJ5LBEyQOapbmcMltBvhPrXmYnds8qe7kot
         wJk8DehoaDxRN8t24jF7dhIMdfhCbedJEe8DTzEBz8kpcJDZZdOeUb73ONAhH6AEwnjh
         0IxJpo0hJdQ8e3ye8qw1sumrN2AcueoEHdfq8tkItsFucQYC916N8njehnJON7Wruvt0
         W2Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701875232; x=1702480032;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NAtW49VoKqSR369Y9fGvwCG70si0fF32wbqjatkxqcs=;
        b=PE/3V42OS2pCIIwdjMYlo/bl3CScV61ILiGxkYBZk0vKpSYqUaC0eumejuMsQfYvmy
         osuHNPeYeMAVgT0z4hxuKcXM37dp5K2Sx2Ol8Y2Xkj/o+RnTO274ZG1ukR+B5HZWVoFq
         q8L4cZ8TvlJmxRLAImjnW8f50dJ5ZmqTzr5fAhUKE6eMJc7434PidksPuF69KtL7TyAd
         o29MVIH6F+YQycFOrzAt6p+qgwb4GWg5Dr1oKt8eZkUJRkW34tTtV4ACpfJWIft1fxS8
         rTE7HEDbYe5SpyMcOeLTYHIUsrIdaW8TH/YmFvmLEIPrnB+id7hAXSRopKu8l3h8NIOz
         Blnw==
X-Gm-Message-State: AOJu0YzotBjHjNTFn7HzAv/IYbmA8hArgBhjLh5M/egP9M7WJ0CcccQV
	Z2OkeQ5zpznL2c6AMfSgRtZOANrYw2eF5Dtbh4D0tIc3
X-Google-Smtp-Source: AGHT+IEOmh8dUowt4ggoYF/X0aRZIr0nTHcdAFFlSgTJ3UIvAyOlp3zw1sP6bkUN4wNY3lKrMS1gG65TXPE3jX4CTho=
X-Received: by 2002:a05:6871:3292:b0:1fa:e938:dd8e with SMTP id
 mp18-20020a056871329200b001fae938dd8emr1048097oac.25.1701875232027; Wed, 06
 Dec 2023 07:07:12 -0800 (PST)
MIME-Version: 1.0
References: <20231204141856.2977926-1-p.chernikov@yadro.com>
 <CAMKF1sqszUOsKDu42Z73AvLBMta4tauXCaCm_ZJbOa7UXVPUzg@mail.gmail.com>
 <CAMKF1sqf=jKN3tbeO9nn2Gc2dgLh8Ctaw=_BwaLVHoahAg_KpQ@mail.gmail.com>
 <1cd20d51c6d841a69a77c80904b03372@yadro.com> <2474bdddf872480b8c776713d425c315@yadro.com>
In-Reply-To: <2474bdddf872480b8c776713d425c315@yadro.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Dec 2023 07:07:00 -0800
Message-ID: <CAMKF1sonmdORsNct3cm+qQ4ABZMo00YRH7pd32nLkmKN7Afv6w@mail.gmail.com>
Subject: Re: [oe] [PATCH] abseil-cpp: remove -Dcmake_cxx_standard=14 flag from extra_oecmake
To: Petr Chernikov <p.chernikov@yadro.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a8395b060bd8b4f8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 15:07:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107255

--000000000000a8395b060bd8b4f8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 6, 2023 at 3:01=E2=80=AFAM Petr Chernikov <p.chernikov@yadro.co=
m> wrote:

> Raj, is my testing enough to apply changes?
>

I think you have to compile mosh package to see the issue abseil builds
fine

>
>
> -----Original Message-----
> From: Petr Chernikov
> Sent: Tuesday, December 5, 2023 10:53 AM
> To: 'Khem Raj' <raj.khem@gmail.com>
> Cc: openembedded-devel@lists.openembedded.org
> Subject: RE: [oe] [PATCH] abseil-cpp: remove -Dcmake_cxx_standard=3D14 fl=
ag
> from extra_oecmake
>
> Hi Raj,
> Thank you for feedback!
>
> I've just tested compilation via clang using meta-clang layer - this is
> fine
>
> I've also tested `native` compilation using both gcc and clang, this is O=
K
> too.
> But I don't know how to test nativesdk, any thoughts about this kind of
> compilation?
>
>
> -----Original Message-----
> From: Khem Raj <raj.khem@gmail.com>
> Sent: Tuesday, December 5, 2023 1:46 AM
> To: Petr Chernikov <p.chernikov@yadro.com>
> Cc: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH] abseil-cpp: remove -Dcmake_cxx_standard=3D14 fl=
ag
> from extra_oecmake
>
> =C2=AB=D0=92=D0=BD=D0=B8=D0=BC=D0=B0=D0=BD=D0=B8=D0=B5! =D0=94=D0=B0=D0=
=BD=D0=BD=D0=BE=D0=B5 =D0=BF=D0=B8=D1=81=D1=8C=D0=BC=D0=BE =D0=BE=D1=82 =D0=
=B2=D0=BD=D0=B5=D1=88=D0=BD=D0=B5=D0=B3=D0=BE =D0=B0=D0=B4=D1=80=D0=B5=D1=
=81=D0=B0=D1=82=D0=B0!=C2=BB
>
> here is a problem which might be related to this change
>
> https://errors.yoctoproject.org/Errors/Details/745165/
>
> On Mon, Dec 4, 2023 at 7:22=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:
> >
> >
> >
> > On Mon, Dec 4, 2023 at 6:23=E2=80=AFAM Petr Chernikov <p.chernikov@yadr=
o.com>
> wrote:
> >>
> >> Old versions of abseil-cpp could not be compiled using C++ Standard 17=
.
> >> For now this cmake flag is not needed.
> >
> >
> > Can you check if this works with clang compiler as well
> >>
> >>
> >>
> >> Signed-off-by: Petr Chernikov <p.chernikov@yadro.com>
> >>
> >> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> >> index f847ebf15..4705b6f8c 100644
> >> --- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> >> +++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> >> @@ -26,7 +26,6 @@ inherit cmake
> >>
> >>  EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON \
> >>                   -DBUILD_TESTING=3DOFF    \
> >> -                 -DCMAKE_CXX_STANDARD=3D14 \
> >>                   -DABSL_ENABLE_INSTALL=3DON \
> >>                  "
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#107204):
> https://lists.openembedded.org/g/openembedded-devel/message/107204
> >> Mute This Topic: https://lists.openembedded.org/mt/102970930/1997914
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub
> [raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

--000000000000a8395b060bd8b4f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Dec 6, 2023 at 3:01=E2=80=AFAM Petr Chernikov &lt;<=
a href=3D"mailto:p.chernikov@yadro.com">p.chernikov@yadro.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">Raj, is my testing enough to appl=
y changes?<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I think you have=
 to compile mosh package to see the issue abseil builds fine=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><br>
<br>
-----Original Message-----<br>
From: Petr Chernikov <br>
Sent: Tuesday, December 5, 2023 10:53 AM<br>
To: &#39;Khem Raj&#39; &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"=
_blank">raj.khem@gmail.com</a>&gt;<br>
Cc: <a href=3D"mailto:openembedded-devel@lists.openembedded.org" target=3D"=
_blank">openembedded-devel@lists.openembedded.org</a><br>
Subject: RE: [oe] [PATCH] abseil-cpp: remove -Dcmake_cxx_standard=3D14 flag=
 from extra_oecmake<br>
<br>
Hi Raj, <br>
Thank you for feedback!<br>
<br>
I&#39;ve just tested compilation via clang using meta-clang layer - this is=
 fine<br>
<br>
I&#39;ve also tested `native` compilation using both gcc and clang, this is=
 OK too.<br>
But I don&#39;t know how to test nativesdk, any thoughts about this kind of=
 compilation?<br>
<br>
<br>
-----Original Message-----<br>
From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">=
raj.khem@gmail.com</a>&gt; <br>
Sent: Tuesday, December 5, 2023 1:46 AM<br>
To: Petr Chernikov &lt;<a href=3D"mailto:p.chernikov@yadro.com" target=3D"_=
blank">p.chernikov@yadro.com</a>&gt;<br>
Cc: <a href=3D"mailto:openembedded-devel@lists.openembedded.org" target=3D"=
_blank">openembedded-devel@lists.openembedded.org</a><br>
Subject: Re: [oe] [PATCH] abseil-cpp: remove -Dcmake_cxx_standard=3D14 flag=
 from extra_oecmake<br>
<br>
=C2=AB=D0=92=D0=BD=D0=B8=D0=BC=D0=B0=D0=BD=D0=B8=D0=B5! =D0=94=D0=B0=D0=BD=
=D0=BD=D0=BE=D0=B5 =D0=BF=D0=B8=D1=81=D1=8C=D0=BC=D0=BE =D0=BE=D1=82 =D0=B2=
=D0=BD=D0=B5=D1=88=D0=BD=D0=B5=D0=B3=D0=BE =D0=B0=D0=B4=D1=80=D0=B5=D1=81=
=D0=B0=D1=82=D0=B0!=C2=BB<br>
<br>
here is a problem which might be related to this change<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/745165/" rel=3D"n=
oreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Details=
/745165/</a><br>
<br>
On Mon, Dec 4, 2023 at 7:22=E2=80=AFAM Khem Raj &lt;<a href=3D"mailto:raj.k=
hem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Mon, Dec 4, 2023 at 6:23=E2=80=AFAM Petr Chernikov &lt;<a href=3D"m=
ailto:p.chernikov@yadro.com" target=3D"_blank">p.chernikov@yadro.com</a>&gt=
; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Old versions of abseil-cpp could not be compiled using C++ Standar=
d 17.<br>
&gt;&gt; For now this cmake flag is not needed.<br>
&gt;<br>
&gt;<br>
&gt; Can you check if this works with clang compiler as well<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Petr Chernikov &lt;<a href=3D"mailto:p.chernikov@ya=
dro.com" target=3D"_blank">p.chernikov@yadro.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-oe/recipes-devtools/abseil-cpp/<a href=3D"http:/=
/abseil-cpp_git.bb" rel=3D"noreferrer" target=3D"_blank">abseil-cpp_git.bb<=
/a> b/meta-oe/recipes-devtools/abseil-cpp/<a href=3D"http://abseil-cpp_git.=
bb" rel=3D"noreferrer" target=3D"_blank">abseil-cpp_git.bb</a><br>
&gt;&gt; index f847ebf15..4705b6f8c 100644<br>
&gt;&gt; --- a/meta-oe/recipes-devtools/abseil-cpp/<a href=3D"http://abseil=
-cpp_git.bb" rel=3D"noreferrer" target=3D"_blank">abseil-cpp_git.bb</a><br>
&gt;&gt; +++ b/meta-oe/recipes-devtools/abseil-cpp/<a href=3D"http://abseil=
-cpp_git.bb" rel=3D"noreferrer" target=3D"_blank">abseil-cpp_git.bb</a><br>
&gt;&gt; @@ -26,7 +26,6 @@ inherit cmake<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 EXTRA_OECMAKE =3D &quot;-DBUILD_SHARED_LIBS=3DON \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-DBUILD_TESTING=3DOFF=C2=A0 =C2=A0 \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DC=
MAKE_CXX_STANDARD=3D14 \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-DABSL_ENABLE_INSTALL=3DON \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#107204): <a href=3D"https://lists.openembedded=
.org/g/openembedded-devel/message/107204" rel=3D"noreferrer" target=3D"_bla=
nk">https://lists.openembedded.org/g/openembedded-devel/message/107204</a><=
br>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/1029=
70930/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/mt/102970930/1997914</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.op=
enembedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedd=
ed.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
</blockquote></div></div>

--000000000000a8395b060bd8b4f8--

