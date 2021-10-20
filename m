Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3163C433F5
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 17:08:03 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web09.228.1634749682808911006
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:08:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DIyeLrcx;
 spf=pass (domain: gmail.com, ip: 209.85.210.178,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id 187so3490990pfc.10
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0XUrgU6CYE7P/MM0fiHktAlI74P4dB1hIrPFbwx/o0c=;
        b=DIyeLrcxm1smB2HVyeZ5pwEMH8NJJ5AwKTZ78e/ATRSBiCnOStrjoRuuGhZoz4MpgR
         qpNJod0hbNni8xQQvW01ANYxwJ6wWmKp+MwXPfuRxmVOHdLeNpKkm4Pu6o4dvzWPAshR
         IIWa91oFTCdEKjJtD8jV3kFnPpfuV04gcat6N8MFnhuk/scevBU5fJg0D+GWWpmWw7/C
         5Jf6CBoz3cqW0EJ+mDx+05GcPD+7PHK36O/tIBA5N1CSZZkmxHUITyeyr2nNw48MpXH+
         8GsBmR5Zc6M3/qJ4y5SfEYeKqBDJhxJc3hGLpPjXZMZYzqSh03LGksCGM7rYKBlact6P
         r2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0XUrgU6CYE7P/MM0fiHktAlI74P4dB1hIrPFbwx/o0c=;
        b=6YpmczedAmbyJQ2rO08lBoA2ba+S27XgJJZ10nL2r0Ewu+GruRuR1QRJHC41H5BiVm
         jXN6Kv9sy9aibEq4YjWZrZUkFee9Ceigm1g8+6WgEdvbnwnQAUnLgZ6Rb9O/JfVJEH/v
         TAQ8LIHEXeiZxcoF51hU3Jczmks8Tn/uNQsVX2TUKCop1slumInBMxkiFv3Ecf/cMQo2
         A5em6K/vrlVHD32Xjq5egPyrEnaUH0gGXeVYLNLevF8WUmR+L+MQdgVxUfpNyB9Inj2d
         iMtWs/tZA4S0v9jDOmCvXeEIAGefDRZpkfHWeQjJKsA8zxHFBb7WXc37IyhZ1yAHvH2x
         AfFg==
X-Gm-Message-State: AOAM5331YcAYtVDuR+/zhgu/nou42NxG33miH2M09pbjj2uT2fspyhCH
	MA0CC06AtgNY6GUZ5YBt42mHOoHrhm9f+tHh/M8=
X-Google-Smtp-Source: 
 ABdhPJzbf0KyVXrkKmuZB1rDhcAQjxMaO3DJ/OnaJ5QhIoJ03Hmc7E0k7ykg42CC7pof4/t+zSRVThMgGHLxeF2K9BE=
X-Received: by 2002:a05:6a00:13a5:b0:44c:ae90:8603 with SMTP id
 t37-20020a056a0013a500b0044cae908603mr493831pfg.17.1634749682214; Wed, 20 Oct
 2021 10:08:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211019131925.21725-1-koansoftware@gmail.com>
 <CAMKF1sqso8ZijOMFVoEYWZG70W1rAK9ih3AthPOvjV3_A+q-sg@mail.gmail.com>
 <41085dec-5948-b1c1-56ea-b10004e07939@gmail.com>
 <CAMKF1soX6d8g6fyxB4NNhfmEECfbqE0+r2Xixn_Yxi2PmNQGuA@mail.gmail.com>
 <16AFCBDEF9895FF9.31449@lists.openembedded.org>
 <CA+chaQfn1Sw4eMfPr5TALZUVNJGRQoyiyxhnhUVHAMtjXbErWQ@mail.gmail.com>
In-Reply-To: 
 <CA+chaQfn1Sw4eMfPr5TALZUVNJGRQoyiyxhnhUVHAMtjXbErWQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 20 Oct 2021 19:07:51 +0200
Message-ID: 
 <CA+chaQd++dxg1X3NQZ7Da9xnxhfzo6aO3Zq6xMyjAYzw0XvWwg@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] bluepy_git.bb: Added recipe for
 BluePy Python interface to Bluetooth LE on Linux (v2)
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, koansoftware@gmail.com,
	Marco Cavallini <m.cavallini@koansoftware.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001aeedd05cecbd232"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Oct 2021 17:08:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93487

--0000000000001aeedd05cecbd232
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

well and also set SRCREV instead of rev in SRC_URI and use correct RDEPENDS
syntax.

There is another recipe where old RDEPENDS syntax sneaked in :/

meta-oe$ git grep ^RDEPENDS_
meta-networking/recipes-connectivity/bluepy/bluepy_git.bb:RDEPENDS_${PN} =
=3D
"bluez5"
meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb:RDEPENDS_${PN} =
=3D
" \

On Wed, Oct 20, 2021 at 7:05 PM Martin Jansa <martin.jansa@gmail.com> wrote=
:

> Also please use some more meaningful PV than "git" from the filename.
>
> On Wed, Oct 20, 2021 at 7:02 PM Martin Jansa via lists.openembedded.org
> <Martin.Jansa=3Dgmail.com@lists.openembedded.org> wrote:
>
>> FWIW: I'm seeing the same error now.
>>
>> Marco: is the user you're building under having UID 1000? Try under
>> different UID to reproduce this.
>>
>> On Wed, Oct 20, 2021 at 4:11 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>>>
>>>
>>> On Wed, Oct 20, 2021 at 5:07 AM Marco <koansoftware@gmail.com> wrote:
>>>
>>>> On 20/10/21 13:45, Khem Raj wrote:
>>>> > fails during install now on musl/x86 arm/glibc
>>>> >
>>>> > https://errors.yoctoproject.org/Errors/Details/613446/
>>>> > https://errors.yoctoproject.org/Errors/Details/613456/
>>>> >
>>>>
>>>> Hi Khem,
>>>> I diligently followed the instructions on the site
>>>> https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedde=
d
>>>>
>>>> To correct the errors you reported to me previously, I installed the
>>>> 'master' version of Poky + Openembedded and recompiled everything
>>>> without errors and I re-sent the v2 patch.
>>>>
>>>> At this point I no longer know what the requirements are for submittin=
g
>>>> a patch.
>>>> Do you need to pass any series of tests?
>>>> Which one?
>>>> How do I reproduce them locally?
>>>
>>>
>>> We have few Jenkins nodes where world builds are run and it takes quite
>>> a bit for those to finish
>>>
>>> I also have a Comcast internal node and one
>>>
>>> Then we do have a job at yocto auto builder too and it=E2=80=99s failin=
g on some
>>> of them but not all
>>>
>>> Eg it=E2=80=99s also failing on yocto ab which builds for qemux86-64/gl=
ibc
>>>
>>>
>>>
>>>>
>>>> Thank you
>>>> --
>>>> Marco
>>>>
>>>
>>>
>>>
>>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#93484):
>> https://lists.openembedded.org/g/openembedded-devel/message/93484
>> Mute This Topic: https://lists.openembedded.org/mt/86439385/3617156
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> Martin.Jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--0000000000001aeedd05cecbd232
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">well and also set SRCREV instead of rev in SRC_URI and use=
 correct RDEPENDS syntax.<div><br></div><div>There is another recipe where =
old RDEPENDS syntax sneaked in :/</div><div><br></div><div>meta-oe$ git gre=
p ^RDEPENDS_<br></div><div>meta-networking/recipes-connectivity/bluepy/blue=
py_git.bb:RDEPENDS_${PN} =3D &quot;bluez5&quot;<br>meta-python/recipes-devt=
ools/python/python3-kivy_2.0.0.bb:RDEPENDS_${PN} =3D &quot; \<br></div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On W=
ed, Oct 20, 2021 at 7:05 PM Martin Jansa &lt;<a href=3D"mailto:martin.jansa=
@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Also please use some mor=
e meaningful PV than &quot;git&quot; from the filename.</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 20, 2021=
 at 7:02 PM Martin Jansa via <a href=3D"http://lists.openembedded.org" targ=
et=3D"_blank">lists.openembedded.org</a> &lt;Martin.Jansa=3D<a href=3D"mail=
to:gmail.com@lists.openembedded.org" target=3D"_blank">gmail.com@lists.open=
embedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"ltr">FWIW: I&#39;m seeing the same error now.<div><=
br></div><div>Marco: is the user you&#39;re building under having UID 1000?=
 Try under different UID to reproduce this.</div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 20, 2021 at 4:=
11 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">=
raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div><br></div><div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 20, 2021 at 5:07 AM Marco &lt;<=
a href=3D"mailto:koansoftware@gmail.com" target=3D"_blank">koansoftware@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On 20/10/21 13:45, Khem Raj wrote:<br>
&gt; fails during install now on musl/x86 arm/glibc<br>
&gt; <br>
&gt; <a href=3D"https://errors.yoctoproject.org/Errors/Details/613446/" rel=
=3D"noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/De=
tails/613446/</a><br>
&gt; <a href=3D"https://errors.yoctoproject.org/Errors/Details/613456/" rel=
=3D"noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/De=
tails/613456/</a><br>
&gt; <br>
<br>
Hi Khem,<br>
I diligently followed the instructions on the site<br>
<a href=3D"https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenE=
mbedded" rel=3D"noreferrer" target=3D"_blank">https://www.openembedded.org/=
wiki/How_to_submit_a_patch_to_OpenEmbedded</a><br>
<br>
To correct the errors you reported to me previously, I installed the <br>
&#39;master&#39; version of Poky + Openembedded and recompiled everything <=
br>
without errors and I re-sent the v2 patch.<br>
<br>
At this point I no longer know what the requirements are for submitting <br=
>
a patch.<br>
Do you need to pass any series of tests?<br>
Which one?<br>
How do I reproduce them locally?</blockquote><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">We have few Jenkins nodes where world builds are run and it=
 takes quite a bit for those to finish</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">I also have a Comcast internal node and one=C2=A0</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Then we do have a job at yocto aut=
o builder too and it=E2=80=99s failing on some of them but not all=C2=A0</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">Eg it=E2=80=99s also faili=
ng on yocto ab which builds for qemux86-64/glibc=C2=A0</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex" dir=3D"auto"><br>
<br>
Thank you<br>
--<br>
Marco<br>
</blockquote></div></div>
<br>
<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#93484): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/93484" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/93484</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86439385/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86439385/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>
</blockquote></div>

--0000000000001aeedd05cecbd232--

