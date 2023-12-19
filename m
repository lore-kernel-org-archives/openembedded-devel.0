Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AA40C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 15:24:00 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.15931.1702999433482231338
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Dec 2023 07:23:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m54EPUlX;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-67ef85b5f4dso34786516d6.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 07:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702999432; x=1703604232; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SsCXot5w02gBhEUl/koD21pU/bQwxPPINCAGTK9kalY=;
        b=m54EPUlXXbriA+JLDPeRXgmOdGiZI5bxnJz2nW+KoDjGu6L/be70MAB07u17sMjWCH
         iKwAIlRwnsfgmCSZ6iVvAO221W5Xb7sPf1GGSqGkw5GDf+iBX5/u8Ucnp5hXQUgr084C
         N13xt7Vly7GTcCzMhtAcVBCFS+hECIF74FEGM+Q06CKLZAVkT2qWgubkc4H2c/dutobp
         5crpmIdm0MhG82vjW7i3VhbNi7YU5m0glvp3v1YwXCXk3AlE8tpm/YCwSd8X935n3Z6p
         C5y2vT9c/Er0b8zArL1oTvxyXHl6hWsNuIPbFzzQee50rOVloPCDWSltaTOx2OPvj3i5
         sAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702999432; x=1703604232;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SsCXot5w02gBhEUl/koD21pU/bQwxPPINCAGTK9kalY=;
        b=JSJlqhbWgYyjm0JeBriD7uEbVkeqyILLV0QLl5OP3ainYO/XpzlNxqRf9hHYjs13qV
         jPU25uxhB9V04V6/omWENjIVBKcde7DQZCDyN8v/Z3BN7Fwhd4y1UcO9YTMeFlfUvtnq
         ibryuM69Ti2Ko5wUn2eekuuvuVoACSCHuD1hpJwj0HntYvxB7tvsFlwr2jy1Q1qQQEQl
         YeRpp30wDcGENunz96CYXQSMh9vnj/2lsohoOBOiUgfWfVyTWxr19B0GIb+xeuP8AxLU
         Qt4+0V9yq/dzu4QYyWekQXH4+ZXgOzL824wFcyvoN+7jyLs5Jqp+jChyoSTzOMoGvj7r
         re4A==
X-Gm-Message-State: AOJu0YwXRYQOiGB2Lp4796oUaUxMIlp4oTdMNPWEtrXphh8g+zOAdT9t
	Tw+I6LfQRRjU4yuFjqK+00jOjuCjsHaKwFMu2qACZXNh
X-Google-Smtp-Source: AGHT+IH1AEqKzLW8rY9yRAMYw1rJ7pW2mbCWgCoCYL1tI6fPPpXjvzQOtNI7+3A70BrXHE+Hjxeyb4epXdfSgR7+500=
X-Received: by 2002:a05:6214:21ec:b0:67f:4527:601c with SMTP id
 p12-20020a05621421ec00b0067f4527601cmr4719032qvj.99.1702999432494; Tue, 19
 Dec 2023 07:23:52 -0800 (PST)
MIME-Version: 1.0
References: <CA+cAkeqg51T1u1DuPM_5vx+2gAn-6KxWYfY0GYuXdqvM_mbF4A@mail.gmail.com>
 <CAMKF1soZHS40B7x+YvNF_EvnCk=E1+tcSrmEMXY1MVOUgd6CEw@mail.gmail.com>
 <179E5167E10B4EFD.1352@lists.openembedded.org> <CA+cAkeo==U7BGvsV7Hu-zWf=-BvaTZ95LhHU3RUiKvVQGn7zBw@mail.gmail.com>
 <CA+chaQexTWaK9CacKpZZAhFZi5orpoSCtzdnL7Wm=PnHLJgSJQ@mail.gmail.com>
In-Reply-To: <CA+chaQexTWaK9CacKpZZAhFZi5orpoSCtzdnL7Wm=PnHLJgSJQ@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Tue, 19 Dec 2023 16:23:41 +0100
Message-ID: <CA+cAkeqjfeMY_De4Vux1iKd0n-+BnsOgLUHrwn7xfYb_QP-+YA@mail.gmail.com>
Subject: Re: [oe] Crash cross canadian?
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003a0683060cde74a2"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 15:24:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107633

--0000000000003a0683060cde74a2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ah, great,

I don't understand why I didn't see this reply, I'll pay more attention
next time.

Sorry for the noise.


Le mar. 19 d=C3=A9c. 2023, 16:05, Martin Jansa <martin.jansa@gmail.com> a =
=C3=A9crit :

> Maybe you don't see them because they are already applied:
>
> https://git.openembedded.org/meta-openembedded/commit/?id=3D1f9ad22b28c24=
a289636b1eb049c491e4529337d
>
> and marked as such in patchwork, see:
>
> https://patchwork.yoctoproject.org/project/oe/list/?series=3D&submitter=
=3D&state=3D*&q=3Dcrash&archive=3Dboth&delegate=3D
>
> There was even reply from Khem saying they are applied, see:
>
> https://patchwork.yoctoproject.org/project/oe/patch/cover.1702798681.git.=
frederic.martinsons@gmail.com/
>
> Regards,
>
>
> On Tue, Dec 19, 2023 at 3:55=E2=80=AFPM Frederic Martinsons <
> frederic.martinsons@gmail.com> wrote:
>
>> Hello,
>>
>> I sent a series for adding cross canadian crash two days ago.
>>
>> But I didn't see these in patchwork:
>> https://patchwork.yoctoproject.org/project/oe/list/
>> I thought that was automatic, did I miss something?
>>
>> Has someone in this list saw my patches or should I resent them ?
>>
>> On Wed, 6 Dec 2023 at 19:26, Frederic Martinsons via
>> lists.openembedded.org <frederic.martinsons=3D
>> gmail.com@lists.openembedded.org> wrote:
>>
>>> Ok great, I'll rebase these on master on the coming days. The problem i=
s
>>> that my hardware (pretty specifics) just have been upgraded with Kirkst=
one
>>> and since I will not be able to test those on master branch. At least I=
 can
>>> make it compile, have you some advices to non regressed crash utility
>>> (without involving real target test)?
>>>
>>> Le mer. 6 d=C3=A9c. 2023, 19:11, Khem Raj <raj.khem@gmail.com> a =C3=A9=
crit :
>>>
>>>>
>>>>
>>>> On Wed, Dec 6, 2023 at 10:02=E2=80=AFAM Fr=C3=A9d=C3=A9ric Martinsons =
<
>>>> frederic.martinsons@gmail.com> wrote:
>>>>
>>>>> Hello list,
>>>>>
>>>>> Since some times (back to warrior branch I think), I have in my custo=
m
>>>>> layer a cross canadian version from the crash tool, I personnally use=
d it
>>>>> for analysing vmcore from an arm target (cortex a53) offline within t=
he sdk.
>>>>>
>>>>> I recently upgraded to kirsktone and the update of this version was a
>>>>> little tricky (must have played with LDFLAGS, gdb target build and ho=
st and
>>>>> so on...)
>>>>>
>>>>> I finally managed to get crash working for all my hardware (both
>>>>> include aarch64 and x86-64 arch).
>>>>>
>>>>> I would like to know if it would be acceptable to have a cross
>>>>> canadian arch in meta-openembedded (from what I see, there is only na=
tive
>>>>> and target flavor)?
>>>>>
>>>>
>>>> It=E2=80=99s fine. I guess there were no such recipe needing it so far=
. Please
>>>> submit your patches
>>>>
>>>>
>>>>> If you think it is accurate, I'll work to push some patches against
>>>>> master.
>>>>>
>>>>> Please tell me, thanks!
>>>>>
>>>>
>>>
>>>
>>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#107631):
>> https://lists.openembedded.org/g/openembedded-devel/message/107631
>> Mute This Topic: https://lists.openembedded.org/mt/103018278/3617156
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> martin.jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--0000000000003a0683060cde74a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Ah, great,<div dir=3D"auto"><br></div><div dir=3D"au=
to">I don&#39;t understand why I didn&#39;t see this reply, I&#39;ll pay mo=
re attention next time.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Sorry for the noise.=C2=A0</div><br><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">Le mar. 19 d=C3=A9c. 2023, 16:05, Marti=
n Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank" rel=
=3D"noreferrer">martin.jansa@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Maybe you don&#39;t see th=
em because they are already applied:<div><a href=3D"https://git.openembedde=
d.org/meta-openembedded/commit/?id=3D1f9ad22b28c24a289636b1eb049c491e452933=
7d" rel=3D"noreferrer noreferrer" target=3D"_blank">https://git.openembedde=
d.org/meta-openembedded/commit/?id=3D1f9ad22b28c24a289636b1eb049c491e452933=
7d</a><br></div><div><br></div><div>and marked as such in patchwork, see:</=
div><div><a href=3D"https://patchwork.yoctoproject.org/project/oe/list/?ser=
ies=3D&amp;submitter=3D&amp;state=3D*&amp;q=3Dcrash&amp;archive=3Dboth&amp;=
delegate=3D" rel=3D"noreferrer noreferrer" target=3D"_blank">https://patchw=
ork.yoctoproject.org/project/oe/list/?series=3D&amp;submitter=3D&amp;state=
=3D*&amp;q=3Dcrash&amp;archive=3Dboth&amp;delegate=3D</a><br></div><div><br=
></div><div>There was even reply from Khem saying they are applied, see:</d=
iv><div><a href=3D"https://patchwork.yoctoproject.org/project/oe/patch/cove=
r.1702798681.git.frederic.martinsons@gmail.com/" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://patchwork.yoctoproject.org/project/oe/patch/c=
over.1702798681.git.frederic.martinsons@gmail.com/</a></div><div><br></div>=
<div>Regards,</div><div><br></div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 19, 2023 at 3:55=E2=80=AFPM F=
rederic Martinsons &lt;<a href=3D"mailto:frederic.martinsons@gmail.com" rel=
=3D"noreferrer noreferrer" target=3D"_blank">frederic.martinsons@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div dir=3D"ltr">Hello,=C2=A0<div><br></div><div>I sent a series for adding =
cross canadian crash two days ago.</div><div><br></div><div>But I didn&#39;=
t see these in patchwork:=C2=A0<a href=3D"https://patchwork.yoctoproject.or=
g/project/oe/list/" rel=3D"noreferrer noreferrer" target=3D"_blank">https:/=
/patchwork.yoctoproject.org/project/oe/list/</a></div><div>I thought that w=
as automatic, did I miss something?</div><div><br></div><div>Has someone in=
 this list saw my patches or should I resent them ?</div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 6 Dec 2023=
 at 19:26, Frederic Martinsons via <a href=3D"http://lists.openembedded.org=
" rel=3D"noreferrer noreferrer" target=3D"_blank">lists.openembedded.org</a=
> &lt;frederic.martinsons=3D<a href=3D"mailto:gmail.com@lists.openembedded.=
org" rel=3D"noreferrer noreferrer" target=3D"_blank">gmail.com@lists.openem=
bedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"auto">Ok great, I&#39;ll rebase these on master on t=
he coming days. The problem is that my hardware (pretty specifics) just hav=
e been upgraded with Kirkstone and since I will not be able to test those o=
n master branch. At least I can make it compile, have you some advices to n=
on regressed crash utility (without involving real target test)?=C2=A0</div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le me=
r. 6 d=C3=A9c. 2023, 19:11, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.c=
om" rel=3D"noreferrer noreferrer" target=3D"_blank">raj.khem@gmail.com</a>&=
gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Wed, Dec 6, 2023 at 10:02=E2=80=AFAM Fr=C3=A9d=C3=
=A9ric Martinsons &lt;<a href=3D"mailto:frederic.martinsons@gmail.com" rel=
=3D"noreferrer noreferrer noreferrer" target=3D"_blank">frederic.martinsons=
@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"auto">Hello list,<div dir=3D"auto"><br></div><div di=
r=3D"auto">Since some times (back to warrior branch I think), I have in my =
custom layer a cross canadian version from the crash tool, I personnally us=
ed it for analysing vmcore from an arm target (cortex a53) offline within t=
he sdk.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I recently upgra=
ded to kirsktone and the update of this version was a little tricky (must h=
ave played with LDFLAGS, gdb target build and host and so on...)=C2=A0</div=
><div dir=3D"auto"><br></div><div dir=3D"auto">I finally managed to get cra=
sh working for all my hardware (both include aarch64 and x86-64 arch).</div=
><div dir=3D"auto"><br></div><div dir=3D"auto">I would like to know if it w=
ould be acceptable to have a cross canadian arch in meta-openembedded (from=
 what I see, there is only native and target flavor)?=C2=A0</div><div dir=
=3D"auto"></div></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"=
auto">It=E2=80=99s fine. I guess there were no such recipe needing it so fa=
r. Please submit your patches</div><div dir=3D"auto"><br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div dir=3D"auto"><div dir=3D"auto"><=
br></div><div dir=3D"auto">If you think it is accurate, I&#39;ll work to pu=
sh some patches against master.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Please tell me, thanks!=C2=A0</div></div>
</blockquote></div></div>
</blockquote></div>
<br>
<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#107631): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/107631" rel=3D"noreferrer noreferrer noreferrer" t=
arget=3D"_blank">https://lists.openembedded.org/g/openembedded-devel/messag=
e/107631</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103018278/361=
7156" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://li=
sts.openembedded.org/mt/103018278/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" rel=3D"noreferrer noreferrer" target=3D"_blank">openembedded-devel+o=
wner@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://=
lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ma=
rtin.jansa@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">marti=
n.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>
</blockquote></div></div></div>

--0000000000003a0683060cde74a2--

