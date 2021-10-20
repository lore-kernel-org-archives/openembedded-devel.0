Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A10FC433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 17:02:28 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.172.1634749347942322316
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:02:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WQleUq0d;
 spf=pass (domain: gmail.com, ip: 209.85.215.171,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id m21so23036130pgu.13
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4C1NlVKcfYljoM5FnRTS4APY5Rk55FnPejICAHWrx90=;
        b=WQleUq0dW3Su+ZY5a4TJrVmyQ+F1WJPFBEAVDoOjQoX6Iuda7jTtHMvqMTLFEJHRmp
         HtzeFFPG8ZAP7TaVtyqZPggiLD+2rAAa6Mzq/2l6v0cqfQasyzYK9kFkhK38Y79NkWSM
         raNuF2NVFTJmqhqh0e9cwGsKsyI/QbQJoBJH2UPScp6TmEUCro1zEkLlfdBubd0qaHuS
         6mhCFdj1o0IvQU8jGu8pcue6efhSNpLcezXr9C4O8T69qtuHLFLsDdXJeDGySBDl6nl4
         n7UlW0XgWmSYU8QDDkVjvLLJnnxBZfWIH5ut5Ua6NsWPL1zcF5zPHy81o8P+nh4I0P8m
         gneg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4C1NlVKcfYljoM5FnRTS4APY5Rk55FnPejICAHWrx90=;
        b=ioicO/DAuqX1QDVnGahhAmsVK/Ag1OakiRhGqm+449Z9OqrNlbfG8Ao6uXVTV5YoKi
         kQy27rJMS+LXKuUVHd8CWGrXr0FvNDv/1R9mvHU1SyshBjDWTUld7IWwUtBTQgzAMHWR
         zSw17Fjy1HPm1b21RP9xbvkC9sTVkY+m7rgGOATfkOIqUJOzdPkoGN97Exi8XH8MAGM5
         n9OqmGauf8cy8OXam2YGRywfVtYf+vqmzICKtgMO07vMviFLHJFlPZFpaQY8fmAExsaD
         OHZhLxIbE7iDUg4HfNYcrJZk7mGVNlhCOHXJDzWN2zHH9jeAP74aOI7DhkW3sulHsEEC
         uqZQ==
X-Gm-Message-State: AOAM531KmZzKtOXqxQnROpCO6syrJdbjzNHO2ybEEpgKy8eLTMUr+Tce
	/mZFQVz5V8e8uobBFlvt5MgCi/A+u9qBlN0OwYw=
X-Google-Smtp-Source: 
 ABdhPJzl7OVuOLDVPx/35gZQz/jp/u2HUaY7hZIO4+y1+/bnftQ9bhuHA3bEudfBU2MQ6WtQxNmY4M/rmJplLzWQQrY=
X-Received: by 2002:a05:6a00:2b8:b0:44d:211a:ca1e with SMTP id
 q24-20020a056a0002b800b0044d211aca1emr81763pfs.82.1634749347325; Wed, 20 Oct
 2021 10:02:27 -0700 (PDT)
MIME-Version: 1.0
References: <20211019131925.21725-1-koansoftware@gmail.com>
 <CAMKF1sqso8ZijOMFVoEYWZG70W1rAK9ih3AthPOvjV3_A+q-sg@mail.gmail.com>
 <41085dec-5948-b1c1-56ea-b10004e07939@gmail.com>
 <CAMKF1soX6d8g6fyxB4NNhfmEECfbqE0+r2Xixn_Yxi2PmNQGuA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soX6d8g6fyxB4NNhfmEECfbqE0+r2Xixn_Yxi2PmNQGuA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 20 Oct 2021 19:02:16 +0200
Message-ID: 
 <CA+chaQft+XOybLLsvm5T130VwVn2fsXT-_a+eVh1F08tnAECCw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] bluepy_git.bb: Added recipe for
 BluePy Python interface to Bluetooth LE on Linux (v2)
To: Khem Raj <raj.khem@gmail.com>
Cc: koansoftware@gmail.com, Marco Cavallini <m.cavallini@koansoftware.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000024eaf105cecbbec8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Oct 2021 17:02:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93484

--00000000000024eaf105cecbbec8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

FWIW: I'm seeing the same error now.

Marco: is the user you're building under having UID 1000? Try under
different UID to reproduce this.

On Wed, Oct 20, 2021 at 4:11 PM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On Wed, Oct 20, 2021 at 5:07 AM Marco <koansoftware@gmail.com> wrote:
>
>> On 20/10/21 13:45, Khem Raj wrote:
>> > fails during install now on musl/x86 arm/glibc
>> >
>> > https://errors.yoctoproject.org/Errors/Details/613446/
>> > https://errors.yoctoproject.org/Errors/Details/613456/
>> >
>>
>> Hi Khem,
>> I diligently followed the instructions on the site
>> https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
>>
>> To correct the errors you reported to me previously, I installed the
>> 'master' version of Poky + Openembedded and recompiled everything
>> without errors and I re-sent the v2 patch.
>>
>> At this point I no longer know what the requirements are for submitting
>> a patch.
>> Do you need to pass any series of tests?
>> Which one?
>> How do I reproduce them locally?
>
>
> We have few Jenkins nodes where world builds are run and it takes quite a
> bit for those to finish
>
> I also have a Comcast internal node and one
>
> Then we do have a job at yocto auto builder too and it=E2=80=99s failing =
on some
> of them but not all
>
> Eg it=E2=80=99s also failing on yocto ab which builds for qemux86-64/glib=
c
>
>
>
>>
>> Thank you
>> --
>> Marco
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93482):
> https://lists.openembedded.org/g/openembedded-devel/message/93482
> Mute This Topic: https://lists.openembedded.org/mt/86439385/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000024eaf105cecbbec8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FWIW: I&#39;m seeing the same error now.<div><br></div><di=
v>Marco: is the user you&#39;re building under having UID 1000? Try under d=
ifferent UID to reproduce this.</div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 20, 2021 at 4:11 PM Khem R=
aj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><br></d=
iv><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Wed, Oct 20, 2021 at 5:07 AM Marco &lt;<a href=3D"mailto:koansoftware@=
gmail.com" target=3D"_blank">koansoftware@gmail.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">On 20/10/21 13:45, Khem =
Raj wrote:<br>
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
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#93482): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/93482" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/93482</a><br>
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

--00000000000024eaf105cecbbec8--

