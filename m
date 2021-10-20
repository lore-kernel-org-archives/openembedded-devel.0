Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 945BBC4332F
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 17:05:52 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.209.1634749551450736098
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:05:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q5unhIpX;
 spf=pass (domain: gmail.com, ip: 209.85.214.173,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id 21so16571279plo.13
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q3FjLnVuPsIVXIUR0ZsyM+MC5YY2qTIjqJg/PiqMnVo=;
        b=Q5unhIpXzwJ8XPUHQ91QdeupRQsbj+2NYxk43UvOQ6bXl5wRc9vstCi4OmPBSbN95z
         CK4B29iBjOS6/+KMXikpi52m14mz3/knaYCq/8oEcVLHh0v5bB6ZIef9BLuYJvTVKFBD
         vCVnNcWbcsvJtaQz/MK8fHSJZ8COs/mNregtm0J5I/FbDXC8nA9nvfry1IdAvq6HEjQP
         WTjbL4hmwykLEwmexyBG+gJYQK3pd7FiVUrsOEro4b5BaUgzSWbzpw180vEO6V2YXyR1
         Hkt22YVxX3IdEgJ/+5YhP/mfysbdrPgsdpT4PRkrwjKxEgtdhuGu+6a3xR4r4GC/ooAA
         a4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q3FjLnVuPsIVXIUR0ZsyM+MC5YY2qTIjqJg/PiqMnVo=;
        b=VnOoeWk1L/FY9HIXoger3s95PZbYl20HxxRisCifK+O8zpVEYLQ1gG8xhaNzUHrdJx
         oVo3goS+kaUvcE3BwmDC2+zvJ6bn33UZ6zqpmv6fxqYw/FvyJ+4tkmCCDf6/72jAc17d
         OmI43I9X1zeq5yfj6Y2vFMHBq0kmNHlurAA+qy34jHnBg1ig+EzEQzr6QVVsFWPtvYao
         W4kjC2ZeZhsa0pGQhQQZemQw1iJTfmZTqIRnDWwTcLiZpin0lhmL2XTKL2vi8WCp3WEb
         AKX0X92Y81L/DatHMFXK7I+Y//gcphI98bzjq9+J99/Zpx7B2N3lqE1f7lMdFrDamFKQ
         PmIA==
X-Gm-Message-State: AOAM532aa6D13JhtyqEuoFrVuAoV1avnk4YMRcEk5ZQQX2w0aS9UFR23
	kKEQZSzU13oCbBAet/1zUNhB0hMg6ONEnnIA6JWX20vk
X-Google-Smtp-Source: 
 ABdhPJx14uEzStoA0ePg0JZAcUvdjBIUan9zceY3nTaxp0m43Vf818NipHXYe/hYKjAg7V4DzKkY3O95wCKhjrTJbSw=
X-Received: by 2002:a17:90a:e547:: with SMTP id
 ei7mr181923pjb.169.1634749550892;
 Wed, 20 Oct 2021 10:05:50 -0700 (PDT)
MIME-Version: 1.0
References: <20211019131925.21725-1-koansoftware@gmail.com>
 <CAMKF1sqso8ZijOMFVoEYWZG70W1rAK9ih3AthPOvjV3_A+q-sg@mail.gmail.com>
 <41085dec-5948-b1c1-56ea-b10004e07939@gmail.com>
 <CAMKF1soX6d8g6fyxB4NNhfmEECfbqE0+r2Xixn_Yxi2PmNQGuA@mail.gmail.com>
 <16AFCBDEF9895FF9.31449@lists.openembedded.org>
In-Reply-To: <16AFCBDEF9895FF9.31449@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 20 Oct 2021 19:05:40 +0200
Message-ID: 
 <CA+chaQfn1Sw4eMfPr5TALZUVNJGRQoyiyxhnhUVHAMtjXbErWQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] bluepy_git.bb: Added recipe for
 BluePy Python interface to Bluetooth LE on Linux (v2)
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, koansoftware@gmail.com,
	Marco Cavallini <m.cavallini@koansoftware.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000471d0c05cecbcaba"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Oct 2021 17:05:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93485

--000000000000471d0c05cecbcaba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Also please use some more meaningful PV than "git" from the filename.

On Wed, Oct 20, 2021 at 7:02 PM Martin Jansa via lists.openembedded.org
<Martin.Jansa=3Dgmail.com@lists.openembedded.org> wrote:

> FWIW: I'm seeing the same error now.
>
> Marco: is the user you're building under having UID 1000? Try under
> different UID to reproduce this.
>
> On Wed, Oct 20, 2021 at 4:11 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>>
>>
>> On Wed, Oct 20, 2021 at 5:07 AM Marco <koansoftware@gmail.com> wrote:
>>
>>> On 20/10/21 13:45, Khem Raj wrote:
>>> > fails during install now on musl/x86 arm/glibc
>>> >
>>> > https://errors.yoctoproject.org/Errors/Details/613446/
>>> > https://errors.yoctoproject.org/Errors/Details/613456/
>>> >
>>>
>>> Hi Khem,
>>> I diligently followed the instructions on the site
>>> https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
>>>
>>> To correct the errors you reported to me previously, I installed the
>>> 'master' version of Poky + Openembedded and recompiled everything
>>> without errors and I re-sent the v2 patch.
>>>
>>> At this point I no longer know what the requirements are for submitting
>>> a patch.
>>> Do you need to pass any series of tests?
>>> Which one?
>>> How do I reproduce them locally?
>>
>>
>> We have few Jenkins nodes where world builds are run and it takes quite =
a
>> bit for those to finish
>>
>> I also have a Comcast internal node and one
>>
>> Then we do have a job at yocto auto builder too and it=E2=80=99s failing=
 on some
>> of them but not all
>>
>> Eg it=E2=80=99s also failing on yocto ab which builds for qemux86-64/gli=
bc
>>
>>
>>
>>>
>>> Thank you
>>> --
>>> Marco
>>>
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93484):
> https://lists.openembedded.org/g/openembedded-devel/message/93484
> Mute This Topic: https://lists.openembedded.org/mt/86439385/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000471d0c05cecbcaba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Also please use some more meaningful PV than &quot;git&quo=
t; from the filename.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Oct 20, 2021 at 7:02 PM Martin Jansa via <a hr=
ef=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;Martin.=
Jansa=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists=
.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div dir=3D"ltr">FWIW: I&#39;m seeing the same error now.<=
div><br></div><div>Marco: is the user you&#39;re building under having UID =
1000? Try under different UID to reproduce this.</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 20, 2021=
 at 4:11 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div><br></div><div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 20, 2021 at 5:07 AM Marco=
 &lt;<a href=3D"mailto:koansoftware@gmail.com" target=3D"_blank">koansoftwa=
re@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On 20/10/21 13:45, Khem Raj wrote:<br>
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

--000000000000471d0c05cecbcaba--

