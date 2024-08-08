Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10CD9C3DA4A
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 13:45:18 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.60380.1723124713397940153
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Aug 2024 06:45:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ens2MpHs;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: ticotimo@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52f04b3cb33so2073382e87.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 06:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723124711; x=1723729511; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hYOQQ5YujzcPoBUhw0AjwY7d4/8grNKLtszpgOXlBvU=;
        b=Ens2MpHsKvgOzWSeavmyAh1/Vj02QUzKlHEZd20o/bwf3wQEW09j71/Dx0vgRk+0IZ
         P3XElvab6wcH8jccEC3AnRw6eHY6IzCc1Df6RHvqDVpFmJKOHngczU5XqzOA2pmyILaK
         A+hTcsld5icNexirnmmW333FjEG7O0LZlDTFaMHfbFMS8YY7NOrCuNfbNo77E6BjFf7U
         Bpg7XpjAsIroywBSwJc5JRipF4c6/34E+5IizdNSdjcFjvhEKsqWqDUerrWVrmyKODYk
         rvtJ347SJYyi6K912j+4n0FIh8vUkJlxa/bC7h8A0oefX9xXGKNzTHWXCzzBqGuys3uK
         xJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723124711; x=1723729511;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hYOQQ5YujzcPoBUhw0AjwY7d4/8grNKLtszpgOXlBvU=;
        b=WvcYFxtLF08elIT1a2gp87Jmdc92Bgygn5t4VoP0saiDMxQfYEJn9zdam8R4KMbEHd
         cLL8nbnEQv45tB/KS8g/17UeK5/os0FqMqdONJrR6Au/oYpuP6qfWTfBF1khhuLqcZtl
         R6AInvu47ENQK8ijHL90YmkjIlKLSvyQcH1NkIjW5si4k015Z8G1s6J8iJm8Hb3QXAbV
         KwmOn/lYv2aPBRSaahWHBSf0p1ifl5TRm7UE9wrGjTk6ZhfViewfFIs8IroM0USBwVJy
         Vw4Dnys/xgVJakihbizC4gQyh6PfMspKEwdgMeKtbQHTvLwZvkwv4z1xLD2K5qGKGy2G
         2/Qg==
X-Forwarded-Encrypted: i=1; AJvYcCV7BT6dCkIOk1pf2mhg8v4u5Xps1KQxS8+XKbC2ANhoIGRygduN/oxAYuC3IREKmjoqR79DIuO3KFcGY239RfQ5L/zG3/krq1Ec4oQus6v1fG8JP/s5Qt5sEA==
X-Gm-Message-State: AOJu0YzD0LwiejvYq7DrGWSV55w8eZ8uZbmtZvrLhoqH/Jr7s1E7YsEv
	kknT5Qj+WttW+o2/afSXSQd/6DqtvI960bBr4GpTsgwLCl11KuDEP/TRVCrtlakxLJm03uC+MOJ
	hfSePCBrd24a4NGDn8SWVZT7pVOs=
X-Google-Smtp-Source: AGHT+IHEvg3Gw3Ppr+/0krwon7ezNEqlFbOLslyJRSvKU6bLWf5VBVfFUn4k8xCpezYdVOt/24az5yd/nc4Afn1+RO4=
X-Received: by 2002:a05:6512:4006:b0:52c:df55:e110 with SMTP id
 2adb3069b0e04-530e5812439mr1748368e87.12.1723124711046; Thu, 08 Aug 2024
 06:45:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240808094358.1236-1-debrabander@gmail.com> <17E9C48593EBEAD1.19172@lists.openembedded.org>
In-Reply-To: <17E9C48593EBEAD1.19172@lists.openembedded.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 8 Aug 2024 06:44:58 -0700
Message-ID: <CANx9H-BT0hVD3NGAPKU1-Cuz-i9rqNVbX+857f7z1z4iF3amiQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][master][PATCH] python3-pydantic-core: add
 missing RDEPENDS for ptest
To: ticotimo@gmail.com
Cc: debrabander@gmail.com, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004e4559061f2c3c77"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 13:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111663

--0000000000004e4559061f2c3c77
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Also, I believe this requires python3-tzdata which we do not yet have a
recipe for (I have one ready in this staged series).

On Thu, Aug 8, 2024 at 6:40=E2=80=AFAM Tim Orling via lists.openembedded.or=
g
<ticotimo=3Dgmail.com@lists.openembedded.org> wrote:

> I'm in the middle of an upgrade to python3-pydantic and
> python3-pydantic-core. I'd prefer we hold of on this one so I can keep my
> tree clean and get this out the door.
>
> On Thu, Aug 8, 2024 at 2:44=E2=80=AFAM Frank de Brabander via
> lists.openembedded.org <debrabander=3Dgmail.com@lists.openembedded.org>
> wrote:
>
>> ---
>>  .../recipes-devtools/python/python3-pydantic-core_2.18.4.bb     | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-pydantic-core_2.18.4.bb b/meta-python/recipes-devtools/python/
>> python3-pydantic-core_2.18.4.bb
>> index 0ab1873a0..37a4440ca 100644
>> --- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.18.4.b=
b
>> +++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.18.4.b=
b
>> @@ -37,6 +37,8 @@ RDEPENDS:${PN}-ptest +=3D "\
>>      python3-pytest-timeout \
>>      python3-pytest-benchmark \
>>      python3-unittest-automake-output \
>> +    python3-zoneinfo \
>> +    tzdata \
>>  "
>>
>>  do_install_ptest() {
>> --
>> 2.39.2
>>
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111662):
> https://lists.openembedded.org/g/openembedded-devel/message/111662
> Mute This Topic: https://lists.openembedded.org/mt/107786709/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004e4559061f2c3c77
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Also, I believe this requires python3-tzdata which we=
 do not yet have a recipe for (I have one ready in this staged series).</di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On T=
hu, Aug 8, 2024 at 6:40=E2=80=AFAM Tim Orling via <a href=3D"http://lists.o=
penembedded.org">lists.openembedded.org</a> &lt;ticotimo=3D<a href=3D"mailt=
o:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div di=
r=3D"ltr">I&#39;m in the middle of an upgrade to python3-pydantic and pytho=
n3-pydantic-core. I&#39;d prefer we hold of on this one so I can keep my tr=
ee clean and get this out the door.</div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 8, 2024 at 2:44=E2=80=AFAM F=
rank de Brabander via <a href=3D"http://lists.openembedded.org" target=3D"_=
blank">lists.openembedded.org</a> &lt;debrabander=3D<a href=3D"mailto:gmail=
.com@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">---<br>
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

--0000000000004e4559061f2c3c77--

