Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B72BC369A2
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 15:29:51 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web11.78389.1744126190109725600
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Apr 2025 08:29:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EAe2v3FV;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-72c40235c34so1347350a34.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 08:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744126189; x=1744730989; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=STk8wZI5MB96MAeC59LlNo+TNiEw1Wf1Mh0toaF24/c=;
        b=EAe2v3FVOrwbwAHHbI2/ZPUj7MSFf9mOqm3aC6lo3TVAq94AlEvijGLKasHAl/ATAp
         oE14Q4qdwoQypORufJeQ413pt2HJ1wBU5eGvTysRJqYnMz25Ct5iN3hAgIGJnn9YplSx
         cy+FbWUWqjA1K5NZagnSrRYXPnB6w6n0H219KG7B6NktrQ1W9g9dD0UgqsHFe8eju3xK
         sgbfE2GwG4V2LDFuCEb/hC+IjKI7UKDEkkfSyM+HdWya6tjV7COnFeXeeTFluq7ilDhK
         ukWhKlWxf4IIx0BvXVDIR9Ayk9/ltUARQRBBscdSmahFTJChe6roZ+hJf7fTBsQnDkhy
         TFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744126189; x=1744730989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=STk8wZI5MB96MAeC59LlNo+TNiEw1Wf1Mh0toaF24/c=;
        b=EjhczxzZbTQRUddelaKLkz1SnhmtRgffLFyV4AP7hyiBDAdNlWprRJ5dAO0KF+L8eY
         POdSyygfNtgJ/O1AaBvWEwOJJYMLTdbmNx7PbnVS2FJue3s3XZFIStbnBcaTCiZslbpI
         LQ5txGwu042Hw17R3SPsgf1vG52j5ghfpteybYP+/830BcjAwgnckoU6fhv8rYke30FG
         s3ws8U8tuAPr9zM6pLlVLzjeIMWJCUjRk+26vGTh8xtXXxa+rI6wNPj/4mOMeRZvbX57
         DqcSJRKEPP4BNxwgpyedWy+Oum7kjPXrCdlCKp2iLJ9xMPaJV/ITGimrTFYzZmSFuDq6
         FozQ==
X-Forwarded-Encrypted: i=1; AJvYcCVI7RTcIbzArQVdAMXwq8ULjzrrKt1Skb8aaocvZiT0g1cuunkt5Smqv5US37lkV+CpowPA1RN+4xkfn/hZDYuq6Fw=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz6i07ST1FXKgn3o9flokQTqXPEyginB034KYXvB/RD0XQVSgCt
	OK7XX8zU0HgyyROo/vCdeE/l4M7Nm2kmRdTfJ/qRfn0bH1NMyUSA/xMcYjAY2/CkHIA7Ok9bQnj
	4hSKm3hTaLrnO5nv5U5h86FvSfHc=
X-Gm-Gg: ASbGnctby4gJ+DTtBZ6ZoYjf/3k1eZ42r8unV524A8D6Qgm5W+Dks5kwCyFu50lEdXd
	8n+3U0mOAfQiYndU6bS8yhPijvfzXTQpk4K9RXXT6ra1KHfKR6Gbyq+LgRPD0bhbSPhZWYNg721
	jECe4ArceiaRMaVpy5yngI14GS
X-Google-Smtp-Source: AGHT+IGJXyp5jxeF0m88PvMlJIqmO3Ji2V7anld2lgizzU5JceC/mL0T+P0hRcw2+b+nY7h+m/VcCSLR9NfJhUmZFDE=
X-Received: by 2002:a05:6808:320a:b0:3fe:aeaf:2d3 with SMTP id
 5614622812f47-4004563f8e2mr10510205b6e.39.1744126189284; Tue, 08 Apr 2025
 08:29:49 -0700 (PDT)
MIME-Version: 1.0
References: <TYWPR01MB118613486A025B1F8AE633026DCAF2@TYWPR01MB11861.jpnprd01.prod.outlook.com>
 <400fa42d-4c27-4ef0-86f4-62046b0cd021@gmail.com> <TYWPR01MB1186183EAB588828FDA06A60BDCB52@TYWPR01MB11861.jpnprd01.prod.outlook.com>
In-Reply-To: <TYWPR01MB1186183EAB588828FDA06A60BDCB52@TYWPR01MB11861.jpnprd01.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Apr 2025 08:29:22 -0700
X-Gm-Features: ATxdqUGGUxJoSQz7ceLNvFhKwJTJx3VkNfCYW2WZW99DO3T0HESTB_tDOCe-MII
Message-ID: <CAMKF1sof5d3wTtfaqmxF70MKGRXzAF1G4vS5L1mjCEsfQMFvDQ@mail.gmail.com>
Subject: Re: [oe] [linux-yocto] error of tiptop
To: wangmy@fujitsu.com
Cc: Gyorgy Sarvari <skandigraun@gmail.com>, 
	"linux-yocto@lists.yoctoproject.org" <linux-yocto@lists.yoctoproject.org>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 15:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116710

On Tue, Apr 8, 2025 at 12:28=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> I tried " runqemu qemux86-64 qemuparams=3D" --enable-kvm " nographic", bu=
t there still report an error:
>

runqemu kvm nographic qemux86-64

> root@qemux86-64:~# tiptop
> syscall: Operation not permitted
> Could not perform syscall.
> Don't know why...
>
> My repo of meta-openembedded] has been updated to 82056b992459607ea69b013=
0308685c4872cb19b7
> Repo of poky has been updated to 9e418c4265453860c4736abb7520f1c3c2c3faee
>   --
> Best Regards
> ---------------------------------------------------
> Wang Mingyu
> FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)
> No.6 Wenzhu Road, Nanjing, 210012, China
> TEL=EF=BC=9A+86+25-86630566--8568
> COINS: 79988548
> FAX: +86+25-83317685
> MAIL: wangmy@fujitsu.com
>
> > -----Original Message-----
> > From: Gyorgy Sarvari <skandigraun@gmail.com>
> > Sent: Thursday, April 3, 2025 3:35 PM
> > To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>;
> > linux-yocto@lists.yoctoproject.org
> > Cc: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [linux-yocto] error of tiptop
> >
> > On what machine are you trying to run it? At least in qemu I get the sa=
me,
> > unless I enable kvm directly:
> >
> > runqemu qemux86-64 qemuparams=3D" --enable-kvm "
> >
> > This way I don't get that error.
> >
> > On 4/2/25 10:52, wangmy via lists.openembedded.org wrote:
> > > Hi,
> > >
> > > When running tiptop on the image of x86-64 for the latest repository =
of poky
> > and meta-oe, an error occurred.
> > >
> > > root # tiptop -h
> > > syscall: Operation not permitted
> > > Could not perform syscall.
> > > Don't know why...
> > >
> > > According to preliminary investigation, the cause of this issue is re=
lated to
> > kenerl updating of perf related code.
> > > This problem has been occurring since the commit
> > > f390c2eea571945f357a2d3b9fcb1c015767132e of branch v6.6/standard/base
> > >
> > > May I ask if you have any opinions or suggestions regarding this issu=
e?
> > >
> > >   --
> > > Best Regards
> > > ---------------------------------------------------
> > > Wang Mingyu
> > > FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)
> > > No.6 Wenzhu Road, Nanjing, 210012, China
> > > TEL=EF=BC=9A+86+25-86630566--8568
> > > COINS: 79988548
> > > FAX: +86+25-83317685
> > > MAIL: wangmy@fujitsu.com
> > >
> > >
> > >
> > >
> > >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116693): https://lists.openembedded.org/g/openembedde=
d-devel/message/116693
> Mute This Topic: https://lists.openembedded.org/mt/112043323/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

