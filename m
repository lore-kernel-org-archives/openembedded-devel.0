Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 564D0C46CD3
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 14:55:40 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.15289.1702997735542610754
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Dec 2023 06:55:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NFV4dy43;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3b9e2a014e8so3682310b6e.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702997735; x=1703602535; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UBRqAWkkOqAMJT/PGbrlDgqCNb6N6dnqbZaMqz7CcXM=;
        b=NFV4dy43PkW3wI/W/hHznytLqqNEnY9b7DorrepUf1lz/oiqcD70nKbsjeGW8LpZL0
         4RaQHEZbUGumWH1N+icMgp6QqYD/8f889Wt2soGnUMk8oI/b2jQ+Ut1TkDkSCU/b1PGs
         Ia/cf4uTz8aMoGSxfQ0GXxApdHNfHCOqgyHjWqJ2r/uNA6TxiP8r0CNNjyyBXElRyWPl
         oK8kceQdJqv+md6F6fgT+R8t7HSntDKPWuc6CO4gfQZd1hPJcZLHZmLDjQUinl6eHVtI
         mUbOJQ4P8Zv89gpf3a9hMFwNYZIUHazNuIx0aDSwJLi7H3vla88rmPuIQM9bVJ945BP9
         ZlQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702997735; x=1703602535;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UBRqAWkkOqAMJT/PGbrlDgqCNb6N6dnqbZaMqz7CcXM=;
        b=BmEIYDGzTQLFTEGftXLpqztc9LU/+5Dc3DUCqgsWQ7SuBPu5I76F/p4bmpezxCWaI0
         7c0DxUJJFVfkjiublEoWt7/jxYUuHdODV5qaBpjl8JszBT/LFxMgvrX3lxKjsSgTskgZ
         xA4mibwKsQLNsBiUY8kCHYSZCL3A2Ryj8kYJOWd0o/ur8Z3lbaAcGMEeyssiXYstnAa9
         Vs2Lxq2Xpq6e8oUDdA/yxMFL2n1PQbEY3GD4q+cdCqWq2Y1Fokrv/uTaxEf07Qi9piZY
         MxE8zVZ/cfVEXdwObNgdKhw/1gyVNJZJRzcuxBXL4wBc+E71E0H0LFbfnwWFhsTMHxIn
         YknA==
X-Gm-Message-State: AOJu0YyJo09FGFQmWQO1lvkF1TszLODu6xaYbJ8pYuMjYta40vHPUuFk
	WBMFs0Wg0oJ9DbdP/tkA1TmvRz30P+u49OgKWW0=
X-Google-Smtp-Source: AGHT+IEVAfvRdxDzGkd6+UwLPZzVNe/19W2oKGsyEw3yVta2rrrhohtjm4Kv/q++Ai8qj4l7chylPJ6L4pct5kP/CCM=
X-Received: by 2002:a05:6808:3089:b0:3a9:ba39:6d6e with SMTP id
 bl9-20020a056808308900b003a9ba396d6emr23020085oib.0.1702997734787; Tue, 19
 Dec 2023 06:55:34 -0800 (PST)
MIME-Version: 1.0
References: <CA+cAkeqg51T1u1DuPM_5vx+2gAn-6KxWYfY0GYuXdqvM_mbF4A@mail.gmail.com>
 <CAMKF1soZHS40B7x+YvNF_EvnCk=E1+tcSrmEMXY1MVOUgd6CEw@mail.gmail.com> <179E5167E10B4EFD.1352@lists.openembedded.org>
In-Reply-To: <179E5167E10B4EFD.1352@lists.openembedded.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Tue, 19 Dec 2023 15:55:23 +0100
Message-ID: <CA+cAkeo==U7BGvsV7Hu-zWf=-BvaTZ95LhHU3RUiKvVQGn7zBw@mail.gmail.com>
Subject: Re: [oe] Crash cross canadian?
To: frederic.martinsons@gmail.com
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000910c2060cde0f85"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 14:55:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107631

--0000000000000910c2060cde0f85
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I sent a series for adding cross canadian crash two days ago.

But I didn't see these in patchwork:
https://patchwork.yoctoproject.org/project/oe/list/
I thought that was automatic, did I miss something?

Has someone in this list saw my patches or should I resent them ?

On Wed, 6 Dec 2023 at 19:26, Frederic Martinsons via lists.openembedded.org
<frederic.martinsons=3Dgmail.com@lists.openembedded.org> wrote:

> Ok great, I'll rebase these on master on the coming days. The problem is
> that my hardware (pretty specifics) just have been upgraded with Kirkston=
e
> and since I will not be able to test those on master branch. At least I c=
an
> make it compile, have you some advices to non regressed crash utility
> (without involving real target test)?
>
> Le mer. 6 d=C3=A9c. 2023, 19:11, Khem Raj <raj.khem@gmail.com> a =C3=A9cr=
it :
>
>>
>>
>> On Wed, Dec 6, 2023 at 10:02=E2=80=AFAM Fr=C3=A9d=C3=A9ric Martinsons <
>> frederic.martinsons@gmail.com> wrote:
>>
>>> Hello list,
>>>
>>> Since some times (back to warrior branch I think), I have in my custom
>>> layer a cross canadian version from the crash tool, I personnally used =
it
>>> for analysing vmcore from an arm target (cortex a53) offline within the=
 sdk.
>>>
>>> I recently upgraded to kirsktone and the update of this version was a
>>> little tricky (must have played with LDFLAGS, gdb target build and host=
 and
>>> so on...)
>>>
>>> I finally managed to get crash working for all my hardware (both includ=
e
>>> aarch64 and x86-64 arch).
>>>
>>> I would like to know if it would be acceptable to have a cross canadian
>>> arch in meta-openembedded (from what I see, there is only native and ta=
rget
>>> flavor)?
>>>
>>
>> It=E2=80=99s fine. I guess there were no such recipe needing it so far. =
Please
>> submit your patches
>>
>>
>>> If you think it is accurate, I'll work to push some patches against
>>> master.
>>>
>>> Please tell me, thanks!
>>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107263):
> https://lists.openembedded.org/g/openembedded-devel/message/107263
> Mute This Topic: https://lists.openembedded.org/mt/103018278/6213388
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> frederic.martinsons@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000000910c2060cde0f85
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,=C2=A0<div><br></div><div>I sent a series for adding=
 cross canadian crash two days ago.</div><div><br></div><div>But I didn&#39=
;t see these in patchwork:=C2=A0<a href=3D"https://patchwork.yoctoproject.o=
rg/project/oe/list/">https://patchwork.yoctoproject.org/project/oe/list/</a=
></div><div>I thought that was automatic, did I miss something?</div><div><=
br></div><div>Has someone in this list saw my patches or should I resent th=
em ?</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Wed, 6 Dec 2023 at 19:26, Frederic Martinsons via <a href=3D"h=
ttp://lists.openembedded.org">lists.openembedded.org</a> &lt;frederic.marti=
nsons=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists=
.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div dir=3D"auto">Ok great, I&#39;ll rebase these on maste=
r on the coming days. The problem is that my hardware (pretty specifics) ju=
st have been upgraded with Kirkstone and since I will not be able to test t=
hose on master branch. At least I can make it compile, have you some advice=
s to non regressed crash utility (without involving real target test)?=C2=
=A0</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">Le mer. 6 d=C3=A9c. 2023, 19:11, Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; a =C3=A9crit=C2=A0=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><br></div=
><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Wed, Dec 6, 2023 at 10:02=E2=80=AFAM Fr=C3=A9d=C3=A9ric Martinsons &lt;<=
a href=3D"mailto:frederic.martinsons@gmail.com" rel=3D"noreferrer" target=
=3D"_blank">frederic.martinsons@gmail.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto">Hello list,<div =
dir=3D"auto"><br></div><div dir=3D"auto">Since some times (back to warrior =
branch I think), I have in my custom layer a cross canadian version from th=
e crash tool, I personnally used it for analysing vmcore from an arm target=
 (cortex a53) offline within the sdk.</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">I recently upgraded to kirsktone and the update of this versi=
on was a little tricky (must have played with LDFLAGS, gdb target build and=
 host and so on...)=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto=
">I finally managed to get crash working for all my hardware (both include =
aarch64 and x86-64 arch).</div><div dir=3D"auto"><br></div><div dir=3D"auto=
">I would like to know if it would be acceptable to have a cross canadian a=
rch in meta-openembedded (from what I see, there is only native and target =
flavor)?=C2=A0</div><div dir=3D"auto"></div></div></blockquote><div dir=3D"=
auto"><br></div><div dir=3D"auto">It=E2=80=99s fine. I guess there were no =
such recipe needing it so far. Please submit your patches</div><div dir=3D"=
auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"auto"><div dir=3D"auto"><br></div><div dir=3D"auto">If you think it is =
accurate, I&#39;ll work to push some patches against master.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Please tell me, thanks!=C2=A0</div></=
div>
</blockquote></div></div>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#107263): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/107263" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/107263</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103018278/621=
3388" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103018278/6213388</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:frederic.martinsons@gmai=
l.com" target=3D"_blank">frederic.martinsons@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000000910c2060cde0f85--

