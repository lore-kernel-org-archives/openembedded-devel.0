Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C43C433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 14:11:05 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.8555.1634739064373077593
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 07:11:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IRYMdWCm;
 spf=pass (domain: gmail.com, ip: 209.85.222.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id b15so3178509qkl.10
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 07:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MCOgxf+idZbMzFOjAJ13y2er6nIbNzdpanQPN/RuX+4=;
        b=IRYMdWCmfh2tVSN2mckL29UbhptHL+HRwdVcMkXpK0xzITxBSWklfKMfx2joVcnDVW
         VOS3lQiiX9L0jxlwZICly2EHHgU2UONqUJOO0TbA+lciI2aAO9AZzYyebwV7BGAgWVYK
         nYJfMZ0gJn5EWle/LxUpBzm4z309SJ0fDMZo8WognGS2TTAzH/579wcfGo1lYxDzQjq+
         gS/iqwlCYLLmvQ+Lx4S+1qd1hm8wcdwmBxODl5TJf7p3KwS1dnlX9nFpaKx3Xi4XwVaq
         xjiB2f6zsG68NhP/MGf7Q9eWJjCzP6hp6IUdhoDeBHDtOgAQeZDhmghDcTanqU45QxEh
         +yqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MCOgxf+idZbMzFOjAJ13y2er6nIbNzdpanQPN/RuX+4=;
        b=vX1+wE0/AsU7yqzzhOyWjneiL0OL5dlOfL6AjIcRmMWFpa/kZPqi4thtyXrk/k2Reg
         z5HR4j/OBXBxyadjansH0ArgzcVYak6RRJ7Bt14ZHmhjE+ospamS43l80b4s574r4Sem
         V+6ydrHiDrNhc0J+P6Q/JZfGUf5se9z+V020xmVIycmaKfB2gs9tnReEzuuPcSPkCWRC
         CkUbMePAc9VgJTvurUO87my5gAFMpMEnWpGh9QmnGBIbvQMSZahI0w2D4r6UqW7V/3vA
         fsbRmX0Vi59W+rHlkyZJjqUFLQHSSII+SGsZt0ZjLYweZoW08zMVNnHKZksYUosDBeav
         fBbg==
X-Gm-Message-State: AOAM531+ufahjuANj9VmmfwBcNiKpz04CwduEr9oAd3asfYokrHkOWZp
	sBmWQZUESGadyf1CDRSKzqUPIyCtXCPF2cL821g=
X-Google-Smtp-Source: 
 ABdhPJy8+DLBKtzCVpFV8Go8bcIhjtOPC6i9Ju1Cb+1yQ/iW7jkr+NXIBdFVHaxsu6GW4Fo7xlw32nyADaG+UgZdd/k=
X-Received: by 2002:ae9:dc84:: with SMTP id q126mr266475qkf.128.1634739063412;
 Wed, 20 Oct 2021 07:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211019131925.21725-1-koansoftware@gmail.com>
 <CAMKF1sqso8ZijOMFVoEYWZG70W1rAK9ih3AthPOvjV3_A+q-sg@mail.gmail.com>
 <41085dec-5948-b1c1-56ea-b10004e07939@gmail.com>
In-Reply-To: <41085dec-5948-b1c1-56ea-b10004e07939@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Oct 2021 07:10:52 -0700
Message-ID: 
 <CAMKF1soX6d8g6fyxB4NNhfmEECfbqE0+r2Xixn_Yxi2PmNQGuA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] bluepy_git.bb: Added recipe for
 BluePy Python interface to Bluetooth LE on Linux (v2)
To: koansoftware@gmail.com
Cc: Marco Cavallini <m.cavallini@koansoftware.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002cdd4805cec959e4"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Oct 2021 14:11:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93482

--0000000000002cdd4805cec959e4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 20, 2021 at 5:07 AM Marco <koansoftware@gmail.com> wrote:

> On 20/10/21 13:45, Khem Raj wrote:
> > fails during install now on musl/x86 arm/glibc
> >
> > https://errors.yoctoproject.org/Errors/Details/613446/
> > https://errors.yoctoproject.org/Errors/Details/613456/
> >
>
> Hi Khem,
> I diligently followed the instructions on the site
> https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
>
> To correct the errors you reported to me previously, I installed the
> 'master' version of Poky + Openembedded and recompiled everything
> without errors and I re-sent the v2 patch.
>
> At this point I no longer know what the requirements are for submitting
> a patch.
> Do you need to pass any series of tests?
> Which one?
> How do I reproduce them locally?


We have few Jenkins nodes where world builds are run and it takes quite a
bit for those to finish

I also have a Comcast internal node and one

Then we do have a job at yocto auto builder too and it=E2=80=99s failing on=
 some of
them but not all

Eg it=E2=80=99s also failing on yocto ab which builds for qemux86-64/glibc



>
> Thank you
> --
> Marco
>

--0000000000002cdd4805cec959e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Oct 20, 2021 at 5:07 AM Marco &lt;<a href=3D"mailto=
:koansoftware@gmail.com">koansoftware@gmail.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(=
204,204,204)">On 20/10/21 13:45, Khem Raj wrote:<br>
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
style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:s=
olid;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
Thank you<br>
--<br>
Marco<br>
</blockquote></div></div>

--0000000000002cdd4805cec959e4--

