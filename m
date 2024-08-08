Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5755CC52D7B
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 16:43:19 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.64752.1723135398462882483
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Aug 2024 09:43:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R/4sw88P;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: ticotimo@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52f025ab3a7so1503992e87.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 09:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723135396; x=1723740196; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lQT6sdz41cRGRS+IYtvslIjr4g8AH02QaclGQ54dUsQ=;
        b=R/4sw88PBd+5MGksaceELYHiJYqa6Ln2ZQEZ7wjMlyM8IU+WPSqeNIYAlFKb8GauUK
         /y68vFUdJfXZ0yiQoN+ogKhgOM/Iyyu1NE3LaEFATzQQ5a2MyWPLWNgiyCeZ2zDfc+Gd
         3neG0axdLUxgw7mJlFBdeUE2RqZHycSN62lxSNMxJMQee6IplA2FzU377Thx5RonmdNk
         omlcgl67rOnmwEfUvpnmtWDv+PsS7Nm+7o8+Z3OaX/MjYOUixacSN9/d063GqswX3YeF
         x0c/zv9LW8ILmVjCivoNJi/PdjgJ0VxjgT/kxwcWa8UzOuihaYvyQk7qYg1H7eklO9tg
         SWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723135396; x=1723740196;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lQT6sdz41cRGRS+IYtvslIjr4g8AH02QaclGQ54dUsQ=;
        b=SwjQxcywsoeeL8vux8V6m45M2yBjseVg7tsr3ViPEutUlgE3SPxcVpJF6cSUHhoCwt
         06VkZFiOBkQqpNpbwb0hkb0g82n/Nbkf2MZP9xj3T+jHBrOJ+e52uRAFyPqACdUS3RWU
         VXxgaL9P0z5tsPIYOePxSuRByY6/w0e5nRtPuiKZHFpecKGeQOiBcLQOvL4CKyQuLpG7
         EITdJrSPd3C3vhkvuP0Vrqv3E7pHkD2I+9nN+3uBKzrEYBlwPxvKTYZsHejFWzhczi+7
         Fhmkgxqf5zQbz9sewkGB74R8VA2iSv/rYmu+vaeEoe0jN3bsIDhJGGFehQtaNZCm3aFb
         sa9w==
X-Gm-Message-State: AOJu0YyUBOjdJs1+ILfRgBcOnFyKDYJN1RzEGc/JC1XXGwiArMeSrzcs
	V7jh96AcHw3nldJwn/QlP+Kx7GH1v8mmvl8+RKGQQxctr1diDRF2kToLGsjxQGeZX1CIllcFw85
	wFlMphv024rM/yb65OcImifNtGQM=
X-Google-Smtp-Source: AGHT+IGZkqmuURfYQe4Qf+UtW3P0p07M0/WfYGwLmNrMa3svVwYrv8KIrxztQwXEdvYR0LF13q82R5zD+L4HaSt7wx4=
X-Received: by 2002:a05:6512:3e07:b0:52f:ca2b:1d33 with SMTP id
 2adb3069b0e04-530e586f943mr1961987e87.20.1723135396045; Thu, 08 Aug 2024
 09:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <CANx9H-BT0hVD3NGAPKU1-Cuz-i9rqNVbX+857f7z1z4iF3amiQ@mail.gmail.com>
 <E687FC6E-DB9A-420E-9DE4-B92C4CB04726@gmail.com>
In-Reply-To: <E687FC6E-DB9A-420E-9DE4-B92C4CB04726@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 8 Aug 2024 09:43:03 -0700
Message-ID: <CANx9H-CPA+u4NpYxjo+R3Bz5bjydkh+O4CODOMA-D-b+581N7A@mail.gmail.com>
Subject: Re: [oe] [meta-python][master][PATCH] python3-pydantic-core: add
 missing RDEPENDS for ptest
To: Frank de Brabander <debrabander@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002e6a2c061f2eb90a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 16:43:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111676

--0000000000002e6a2c061f2eb90a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 8, 2024 at 7:16=E2=80=AFAM Frank de Brabander <debrabander@gmai=
l.com>
wrote:

>
> Don=E2=80=99t think that python3-tzdata is needed. It will first look for=
 system
> wide tzdata, python3-tzdata is a fallback option that can be used if tzda=
ta
> is missing. Running ptest resulted in PASS after this change.
>

Ah. That will help with my conundrum about fixing scarthgap.
I'll add this patch into my scarthgap series, that I am working on next.


>
> On 8 Aug 2024, at 15:45, Tim Orling <ticotimo@gmail.com> wrote:
>
> =EF=BB=BF
> Also, I believe this requires python3-tzdata which we do not yet have a
> recipe for (I have one ready in this staged series).
>
> On Thu, Aug 8, 2024 at 6:40=E2=80=AFAM Tim Orling via lists.openembedded.=
org
> <ticotimo=3Dgmail.com@lists.openembedded.org> wrote:
>
>> I'm in the middle of an upgrade to python3-pydantic and
>> python3-pydantic-core. I'd prefer we hold of on this one so I can keep m=
y
>> tree clean and get this out the door.
>>
>> On Thu, Aug 8, 2024 at 2:44=E2=80=AFAM Frank de Brabander via
>> lists.openembedded.org <debrabander=3Dgmail.com@lists.openembedded.org>
>> wrote:
>>
>>> ---
>>>  .../recipes-devtools/python/python3-pydantic-core_2.18.4.bb     | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/meta-python/recipes-devtools/python/
>>> python3-pydantic-core_2.18.4.bb b/meta-python/recipes-devtools/python/
>>> python3-pydantic-core_2.18.4.bb
>>> index 0ab1873a0..37a4440ca 100644
>>> --- a/meta-python/recipes-devtools/python/
>>> python3-pydantic-core_2.18.4.bb
>>> +++ b/meta-python/recipes-devtools/python/
>>> python3-pydantic-core_2.18.4.bb
>>> @@ -37,6 +37,8 @@ RDEPENDS:${PN}-ptest +=3D "\
>>>      python3-pytest-timeout \
>>>      python3-pytest-benchmark \
>>>      python3-unittest-automake-output \
>>> +    python3-zoneinfo \
>>> +    tzdata \
>>>  "
>>>
>>>  do_install_ptest() {
>>> --
>>> 2.39.2
>>>
>>>
>>>
>>>
>>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#111662):
>> https://lists.openembedded.org/g/openembedded-devel/message/111662
>> Mute This Topic: https://lists.openembedded.org/mt/107786709/924729
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> ticotimo@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--0000000000002e6a2c061f2eb90a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 8, 2024 at 7:16=E2=80=AFA=
M Frank de Brabander &lt;<a href=3D"mailto:debrabander@gmail.com">debraband=
er@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"auto"><br id=3D"m_-4923017762053865655lineBreakAtBe=
ginningOfSignature"><div dir=3D"ltr">Don=E2=80=99t think that python3-tzdat=
a is needed. It will first look for system wide tzdata, python3-tzdata is a=
 fallback option that can be used if tzdata is missing. Running ptest resul=
ted in PASS after this change.</div></div></blockquote><div><br></div><div>=
Ah. That will help with my conundrum about fixing scarthgap.<br>I&#39;ll ad=
d this patch into my scarthgap series, that I am working on next.</div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"=
auto"><div dir=3D"ltr"><br><blockquote type=3D"cite">On 8 Aug 2024, at 15:4=
5, Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.com" target=3D"_blank">t=
icotimo@gmail.com</a>&gt; wrote:<br><br></blockquote></div><blockquote type=
=3D"cite"><div dir=3D"ltr">=EF=BB=BF<div dir=3D"ltr"><div>Also, I believe t=
his requires python3-tzdata which we do not yet have a recipe for (I have o=
ne ready in this staged series).</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 8, 2024 at 6:40=E2=80=AFAM Tim =
Orling via <a href=3D"http://lists.openembedded.org" target=3D"_blank">list=
s.openembedded.org</a> &lt;ticotimo=3D<a href=3D"mailto:gmail.com@lists.ope=
nembedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr">I&#39;m in the middle of an upgrade to python3-pydantic and python=
3-pydantic-core. I&#39;d prefer we hold of on this one so I can keep my tre=
e clean and get this out the door.</div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 8, 2024 at 2:44=E2=80=AFAM Fr=
ank de Brabander via <a href=3D"http://lists.openembedded.org" target=3D"_b=
lank">lists.openembedded.org</a> &lt;debrabander=3D<a href=3D"mailto:gmail.=
com@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">---<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-pydantic-core_2=
.18.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydantic-core_2.18.4=
.bb</a>=C2=A0 =C2=A0 =C2=A0| 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pydantic-core_2.18.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydan=
tic-core_2.18.4.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-pydantic-core_2.18.4.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-pydantic-core_2.18.4.bb</a><br>
index 0ab1873a0..37a4440ca 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pydanti=
c-core_2.18.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydantic-cor=
e_2.18.4.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pydanti=
c-core_2.18.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydantic-cor=
e_2.18.4.bb</a><br>
@@ -37,6 +37,8 @@ RDEPENDS:${PN}-ptest +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-pytest-timeout \<br>
=C2=A0 =C2=A0 =C2=A0python3-pytest-benchmark \<br>
=C2=A0 =C2=A0 =C2=A0python3-unittest-automake-output \<br>
+=C2=A0 =C2=A0 python3-zoneinfo \<br>
+=C2=A0 =C2=A0 tzdata \<br>
=C2=A0&quot;<br>
<br>
=C2=A0do_install_ptest() {<br>
-- <br>
2.39.2<br>
<br>
<br>
<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#111662): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/111662" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/111662</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/107786709/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/107786709/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>
</div></blockquote></div></blockquote></div></div>

--0000000000002e6a2c061f2eb90a--

