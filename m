Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 839F5E9271E
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 17:45:31 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.22094.1696527930753155965
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Oct 2023 10:45:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mfeoYM1i;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1dcf357deedso786292fac.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Oct 2023 10:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696527930; x=1697132730; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2rRLPyAziOMYkGyk5jVrFHPPr1JlzLeoPAqQbClxsQY=;
        b=mfeoYM1iUVWb67uZIj1G28aksq66zoOD1h3hBDoDceIVJwa3FWhN6Ja3/nmiw4hITQ
         MdM42zWHfrENk8SuTdqsDlSJMMmjs4rHmP4KmxHMm1xYI5bFzkFUX7Ns+nKT8Lo5G4+R
         OGyeQyXkMFNnF4jm7qEL4ikVnAS39YYkl8llwtQK99v+1j60R2vaOAiIuhAXFssXMwgb
         jlutKH3QqDEiqXGnlenmCgB0XXrb8IQ7rV+JuvPD/vm5+yGy8YIj8zY5absuogbiDASs
         cO+3swyRY1Rpi9gWR9mVMFIWZtk887PZFHoOzIquykGRNdaxnsg6O5GpAGHWRcaA8Z7P
         38Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696527930; x=1697132730;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2rRLPyAziOMYkGyk5jVrFHPPr1JlzLeoPAqQbClxsQY=;
        b=ssjaJ64skR7ZERQEFOWa8FQz/EceDilfeTh+zNe25LCvJxbXaa7/geKoVT2dGYojA3
         F2lxrcEevshltwKbjdWbQHr/v/lBBkIVmvFqeFoeEZUKKZXsaIksqX/xn/+wgkC/i6PW
         M+GUuBww2nC0KGWxXK079ejJbjv1/a0XTvRf/kTM15xPALgls6BPQwrfcFkD8A8IqK9I
         dMnV2SpQGoalSdTmAwSDAZpqbiHHdaLktFCprKwFKUyDmu2BKcEAQbJt0Sd91OL9VEfJ
         +nvMfFcRnrr6wvt3gz10WdoNNoLK9i5VHjUgC1iPsHn86V3y5KmBmmgAdz/4aCfRcakb
         sKCQ==
X-Gm-Message-State: AOJu0YyH7xu9GjsJv2oOOWyUm+6DQvvHii49DpbpQrhHCW8MTSnop1gS
	J8GU+P77CvqIDIG+QmPBSxy26hOeiust5YK5Nw4=
X-Google-Smtp-Source: AGHT+IG9JmNvCGU0n4QroLWBrpb8o5oeqw7n675A7uWwAE6mIkHH2X0MehYmq8p+FJT5kYiKev8skgXLjlA+6Tk8y6o=
X-Received: by 2002:a05:6870:31cd:b0:1bb:583a:db4a with SMTP id
 x13-20020a05687031cd00b001bb583adb4amr6651493oac.44.1696527929795; Thu, 05
 Oct 2023 10:45:29 -0700 (PDT)
MIME-Version: 1.0
References: <DB5PR02MB10213DB493B73CBCA0E2D8D55EFCAA@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <CAMKF1sqf=x+1Ar+D58hgcNFQw-Pofz7H-o=vEuBkf_nSCBj8pg@mail.gmail.com> <CA+chaQewr47Z52vU=8Qz5ov32COwTp1bbKcfMqwdfiriBnPAgw@mail.gmail.com>
In-Reply-To: <CA+chaQewr47Z52vU=8Qz5ov32COwTp1bbKcfMqwdfiriBnPAgw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Oct 2023 10:45:18 -0700
Message-ID: <CAMKF1spSdMn3Pg-QJOMGDwAmcSX=dSz8oPwapu73n+8ey18=XQ@mail.gmail.com>
Subject: Re: [oe] What are the plans for the nanbield branch?
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: "OE Development (openembedded-devel@lists.openembedded.org)" <openembedded-devel@lists.openembedded.org>, 
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Content-Type: multipart/alternative; boundary="0000000000009b6b230606fbb0af"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Oct 2023 17:45:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105361

--0000000000009b6b230606fbb0af
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 5, 2023 at 10:13 AM Martin Jansa <martin.jansa@gmail.com> wrote=
:

> FWIW: I prefer oe-core keeping master and nanbield in sync (even using th=
e
> same SHAs) until they really need to be different
>
> Now there is the Maintainer change in READMEs already applied in nanbield=
,
> so the commits from master won't be idential SHAs. Next time it would be
> IMHO better to delay merging README update until the branches need to
> diverge.
>

As I explained it was at a divergence point when it was created

Regards,
>
> On Thu, Oct 5, 2023 at 7:01=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
>> Hi Peter,
>>
>> We have created the branch since there were some patches moving
>> python3 recipes to core which were not sure if they will make into
>> this release
>> or not. Plan was to keep it in sync with master as far as possible.
>> Good part is that those python recipe move has made into core in
>> nanbield so we
>> are unblocked. Armin
>> has plans to sync nanbield to master
>>
>> Thanks
>> -Khem
>>
>> On Thu, Oct 5, 2023 at 7:03=E2=80=AFAM Peter Kjellerstedt
>> <peter.kjellerstedt@axis.com> wrote:
>> >
>> > Khem and Armin,
>> >
>> > what are the plans for the nanbield branch, given that is was
>> > branched off long before the actual Nanbield release? Do you plan
>> > on merging master into it once Nanbield is released, or will it
>> > stay as it is and relevant parts will have to be backported?
>> >
>> > The reason I ask is because I am currently working on preparing
>> > our layers for the upgrade to Nanbield and currently there is
>> > quite a big difference between the nanbield branch and the master
>> > branch in meta-openembedded. Thus it would help to know if should
>> > continue to track the master branch for meta-openembedded, or if
>> > I should revert to the nanbield branch.
>> >
>> > //Peter
>> >
>> >
>> >
>> >
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>>
> View/Reply Online (#105359):
>> https://lists.openembedded.org/g/openembedded-devel/message/105359
>> Mute This Topic: https://lists.openembedded.org/mt/101777064/3617156
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> martin.jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--0000000000009b6b230606fbb0af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Oct 5, 2023 at 10:13 AM Martin Jansa &lt;<a href=3D=
"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">FWIW: I prefer oe-core =
keeping master and nanbield in sync (even using the same SHAs) until they r=
eally need to be different<div><br></div><div>Now there is the Maintainer c=
hange in READMEs already applied in nanbield, so the commits from master wo=
n&#39;t be idential SHAs. Next time it would be IMHO better to delay mergin=
g README update until the branches need to diverge.</div></div></blockquote=
><div dir=3D"auto"><br></div><div dir=3D"auto">As I explained it was at a d=
ivergence point when it was created=C2=A0</div><div dir=3D"auto"><br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"auto"></div><di=
v>Regards,</div></div><br><div class=3D"gmail_quote"></div><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 5, 2023 at 7:0=
1=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_=
blank">raj.khem@gmail.com</a>&gt; wrote:<br></div></div><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"></blockquote></di=
v><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">Hi Peter,<br>
<br>
We have created the branch since there were some patches moving<br>
python3 recipes to core which were not sure if they will make into<br>
this release<br>
or not. Plan was to keep it in sync with master as far as possible.<br>
Good part is that those python recipe move has made into core in<br>
nanbield so we<br>
are unblocked. Armin<br>
has plans to sync nanbield to master<br>
<br>
Thanks<br>
-Khem<br>
<br>
On Thu, Oct 5, 2023 at 7:03=E2=80=AFAM Peter Kjellerstedt<br>
&lt;<a href=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank">peter.=
kjellerstedt@axis.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Khem and Armin,<br>
&gt;<br>
&gt; what are the plans for the nanbield branch, given that is was<br>
&gt; branched off long before the actual Nanbield release? Do you plan<br>
&gt; on merging master into it once Nanbield is released, or will it<br>
&gt; stay as it is and relevant parts will have to be backported?<br>
&gt;<br>
&gt; The reason I ask is because I am currently working on preparing<br>
&gt; our layers for the upgrade to Nanbield and currently there is<br>
&gt; quite a big difference between the nanbield branch and the master<br>
&gt; branch in meta-openembedded. Thus it would help to know if should<br>
&gt; continue to track the master branch for meta-openembedded, or if<br>
&gt; I should revert to the nanbield branch.<br>
&gt;<br>
&gt; //Peter<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br></blockquote></div><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
View/Reply Online (#105359): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/105359" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/105359</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101777064/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101777064/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" =
target=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>
</blockquote></div></div>

--0000000000009b6b230606fbb0af--

