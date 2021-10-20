Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59567C433F5
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 17:23:55 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web09.455.1634750629801532646
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:23:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=l9yZMnAW;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id d20so2490114qvm.8
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=p5MA76PLgHqTtG5C5Bgn4LWDsnET7dY3U7IKEaIFlPg=;
        b=l9yZMnAW/5BEXO7RLxbeDxHPxSbIAab1Nn/rFwPJmyaZMTDg8z2Oo1wMJGuJCtiKWJ
         TAOlFFd2BDr3HudkbfZDxxD9XIRfKKaW4zx1x7mtucUOu1rAXzWdaK3n2JoAx4uPkRsx
         S4mSQJY8Mr1zt9aPLMv/BWGeieKHsdtO1l9i07Ogk2F0vNS5JztG8KZ9P0o98cmh6HsN
         OURf7KACEam6uyFWk6XBCEdXbBgjQPe9Z6QyrmIyTGnE0eqjR1hFaB1gUeVU/eQxoQtc
         C1DHYH42j08AhIxhu1LJKdjwRK219kWX/NaquH384KxA7lwtAirTOR0nTywWn/R0ULQz
         uUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=p5MA76PLgHqTtG5C5Bgn4LWDsnET7dY3U7IKEaIFlPg=;
        b=Js4VS4iPVM9eRAFgGuDl+wdROqmI4MAPoOPFpN9IhFSaQSJNysHI0HvoUAehcm8QlT
         u1trt0Bn/FjNdkA60wGkhixGjQPieRwW1tbtFTRJRU45I/CvoDoXpQd1xFCscdJeIPBW
         UXbXmk5dYuOZoFpb+JpwaD2Pwe9l94tSP5X2pO43+9OBbtR+V4Yvqi2yhvOIoSjPoBDG
         o+Yvs7N6Udidl12geCWo5tbEgTNbvEqnXl2E/ffSMRGyEeX03Dwmy8Te+DIAZry6+ioR
         0qV59c+hiqVfEhAxDcdfHrmlFjAByoqkkmOjDEiWzlkZ1rVcblTfwhQpYpEnQQOUPi17
         CkkQ==
X-Gm-Message-State: AOAM530i8e8JaWNbRCGDA6IsbPN2Rp6AQ83IvBWGrg5fd3QgSAlE3y0i
	N5b9FWpJJUejqD9cxaGIeAsLiIuhhEVaeiD5C+U=
X-Google-Smtp-Source: 
 ABdhPJwcO2CROiNJtPvToPCT3SRNz8ya6x6DQmPPXHNDSYQYjNYQutXf57R39lImVgTwpmWXjkZeTqVvh7SsvXI8h5U=
X-Received: by 2002:a05:6214:21ac:: with SMTP id
 t12mr33256qvc.18.1634750628881;
 Wed, 20 Oct 2021 10:23:48 -0700 (PDT)
MIME-Version: 1.0
References: <20211019131925.21725-1-koansoftware@gmail.com>
 <CAMKF1sqso8ZijOMFVoEYWZG70W1rAK9ih3AthPOvjV3_A+q-sg@mail.gmail.com>
 <41085dec-5948-b1c1-56ea-b10004e07939@gmail.com>
 <CAMKF1soX6d8g6fyxB4NNhfmEECfbqE0+r2Xixn_Yxi2PmNQGuA@mail.gmail.com>
 <16AFCBDEF9895FF9.31449@lists.openembedded.org>
 <CA+chaQfn1Sw4eMfPr5TALZUVNJGRQoyiyxhnhUVHAMtjXbErWQ@mail.gmail.com>
 <CA+chaQd++dxg1X3NQZ7Da9xnxhfzo6aO3Zq6xMyjAYzw0XvWwg@mail.gmail.com>
In-Reply-To: 
 <CA+chaQd++dxg1X3NQZ7Da9xnxhfzo6aO3Zq6xMyjAYzw0XvWwg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Oct 2021 10:23:23 -0700
Message-ID: 
 <CAMKF1sqVc5FiJYqHcj3CB3u7y9jSFZSQ3XRs1VFHic5qav6Z-Q@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] bluepy_git.bb: Added recipe for
 BluePy Python interface to Bluetooth LE on Linux (v2)
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Marco Cavallini <koansoftware@gmail.com>,
 Marco Cavallini <m.cavallini@koansoftware.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Oct 2021 17:23:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93492

On Wed, Oct 20, 2021 at 10:08 AM Martin Jansa <martin.jansa@gmail.com> wrot=
e:
>
> well and also set SRCREV instead of rev in SRC_URI and use correct RDEPEN=
DS syntax.
>
> There is another recipe where old RDEPENDS syntax sneaked in :/
>
> meta-oe$ git grep ^RDEPENDS_
> meta-networking/recipes-connectivity/bluepy/bluepy_git.bb:RDEPENDS_${PN} =
=3D "bluez5"
> meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb:RDEPENDS_${PN} =
=3D " \
>

yeah I send a cleanup patch,

> On Wed, Oct 20, 2021 at 7:05 PM Martin Jansa <martin.jansa@gmail.com> wro=
te:
>>
>> Also please use some more meaningful PV than "git" from the filename.
>>
>> On Wed, Oct 20, 2021 at 7:02 PM Martin Jansa via lists.openembedded.org =
<Martin.Jansa=3Dgmail.com@lists.openembedded.org> wrote:
>>>
>>> FWIW: I'm seeing the same error now.
>>>
>>> Marco: is the user you're building under having UID 1000? Try under dif=
ferent UID to reproduce this.
>>>
>>> On Wed, Oct 20, 2021 at 4:11 PM Khem Raj <raj.khem@gmail.com> wrote:
>>>>
>>>>
>>>>
>>>> On Wed, Oct 20, 2021 at 5:07 AM Marco <koansoftware@gmail.com> wrote:
>>>>>
>>>>> On 20/10/21 13:45, Khem Raj wrote:
>>>>> > fails during install now on musl/x86 arm/glibc
>>>>> >
>>>>> > https://errors.yoctoproject.org/Errors/Details/613446/
>>>>> > https://errors.yoctoproject.org/Errors/Details/613456/
>>>>> >
>>>>>
>>>>> Hi Khem,
>>>>> I diligently followed the instructions on the site
>>>>> https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedd=
ed
>>>>>
>>>>> To correct the errors you reported to me previously, I installed the
>>>>> 'master' version of Poky + Openembedded and recompiled everything
>>>>> without errors and I re-sent the v2 patch.
>>>>>
>>>>> At this point I no longer know what the requirements are for submitti=
ng
>>>>> a patch.
>>>>> Do you need to pass any series of tests?
>>>>> Which one?
>>>>> How do I reproduce them locally?
>>>>
>>>>
>>>> We have few Jenkins nodes where world builds are run and it takes quit=
e a bit for those to finish
>>>>
>>>> I also have a Comcast internal node and one
>>>>
>>>> Then we do have a job at yocto auto builder too and it=E2=80=99s faili=
ng on some of them but not all
>>>>
>>>> Eg it=E2=80=99s also failing on yocto ab which builds for qemux86-64/g=
libc
>>>>
>>>>
>>>>>
>>>>>
>>>>> Thank you
>>>>> --
>>>>> Marco
>>>>
>>>>
>>>>
>>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#93484): https://lists.openembedded.org/g/openembedd=
ed-devel/message/93484
>>> Mute This Topic: https://lists.openembedded.org/mt/86439385/3617156
>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[Martin.Jansa@gmail.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>

