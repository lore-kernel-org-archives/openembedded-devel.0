Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBB6EC25B4F
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 15:15:06 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.14362.1715094900933193191
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 May 2024 08:15:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OLI2XFG3;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-23ee34c33ceso2378424fac.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 May 2024 08:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715094900; x=1715699700; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7Fiaiv8GApkk0tMkyoRDT12qfs+oemEXpv+YAJ7lh0=;
        b=OLI2XFG3bOH0cIHGJCKuwdvu6VnBTRoOUzHedYF8Ri0fQndZSK2zm5Tfta5bWdD5gJ
         sZ5X2hqGUCamM0phEkt8lvOgINBoKPCkq6yzssBdBUd4qK4Fzwwti6ycEXoTk48PQb+d
         SHmP2v6nu8toN3lPufOHtZQI78pQHZVs/GZlGk6r/SJsKwYbHSDlPqM7Y40EU/x9cbcX
         U8CNothPXyOhi8W8gukP/40utbiOd1N4j8f+2DxJHCLxQzop6eoo3bDIxyf0Xr1ZD7GM
         DgMZAa+GGMd/8zRykDoQ6m9jDFWHI++0p1ldwxl/1s362IXNGaY5UBh/MvmeWj/TkA0U
         dOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715094900; x=1715699700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V7Fiaiv8GApkk0tMkyoRDT12qfs+oemEXpv+YAJ7lh0=;
        b=TEh94twilyuWguZoaQ6wNvykeKxTIwyE3UIObw+ri7QLa0KC2nRc1/HlY+/XPyqeWb
         tBUqGVOGWqaccloCYb7eEWF01Kg6f5OvinDnusd3A90chWU6uJFDifEQzeVH1jBT8BGw
         aUkKRe6Tjykm9xMn6ITke4Iw3/pUWnjOhkvcPCbX1l9+wNkAUSyU9fyUJheBshY0g5TU
         5cLtI2MNbs4tWa8AhI4XlhcCTIBnR1PLqWV1hsoKekQM/PwHNneGahaBluleQVtTB2JL
         /WHFgfWlSg7YvDvYpTOUpOBXqgo5KpxrZeaAsxSSjWd+yuTa329sUKJcs6MGquqI0z52
         tUmA==
X-Forwarded-Encrypted: i=1; AJvYcCWbQ77ZfIk3MsCmWdyV4ucV2+LiLyw6h4IdN0pLiDD5V/kGd9wHZaonUYxkuuLb1vBEjZvissr/DiERa/vtv43hiu2LboK52v6521i7/9K0NqDn+SQKvRJ13w==
X-Gm-Message-State: AOJu0YxtDF/LZOreGRpxwGgkGFItG5//IVDAjEpy/81UUTCUDJNag+aF
	PSFTPTad4Ccr1vGLBHIZWmh2g3k+ey1LBIwmbXya65zM6/REOHJvUymK23SSA5ABFO4WmfCmXFW
	QwoNnn/exW22XXynQsfmJ0clMPws=
X-Google-Smtp-Source: AGHT+IER3OO0c1yNR6dCVSCX57M2DwSUjQY1d3Z36O3WYaU3BwhPcZ2QPCUFXD9A+l2KdSSj5JpkZTD0XQ6DqSy6IcU=
X-Received: by 2002:a05:6871:798a:b0:23d:49de:970e with SMTP id
 pb10-20020a056871798a00b0023d49de970emr15798640oac.53.1715094900163; Tue, 07
 May 2024 08:15:00 -0700 (PDT)
MIME-Version: 1.0
References: <17CB013F8E1A4961.26557@lists.openembedded.org>
 <A4ETCS.BYOOAI4M6HFR1@t-online.de> <CAMKF1spRQiNy9MQ1CLXJpifBHW_7Ctk1Z9-zO_W9tevm0qNZcQ@mail.gmail.com>
 <HWHTCS.LLXBF0M5JJGS1@t-online.de> <CAMSfU+6uwFOeQvfeSyXy_Tmw4GE9jS-ASF9fMYn=ExSib==cdA@mail.gmail.com>
In-Reply-To: <CAMSfU+6uwFOeQvfeSyXy_Tmw4GE9jS-ASF9fMYn=ExSib==cdA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 May 2024 08:14:33 -0700
Message-ID: <CAMKF1sqMz2ikj4YtWdgwWQ2LKn=y0DkUDCw4itcR1rOezOkqfQ@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] nautilus: update 45.1 -> 46.1
To: Yoann Congal <yoann.congal@smile.fr>
Cc: f_l_k@t-online.de, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 May 2024 15:15:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110269

On Tue, May 7, 2024 at 5:44=E2=80=AFAM Yoann Congal <yoann.congal@smile.fr>=
 wrote:
>
> Hi,
>
> For your information, the missing nautilus -> glib/gio-2.79 breaks the no=
n-reproducibility test of meta-oe :
> https://autobuilder.yoctoproject.org/typhoon/#/builders/155/builds/23/ste=
ps/16/logs/stdio (line 18697)
> That is not critical since this build is broken elsewhere (that's a work =
in progress)

yes, I am aware of it, I intentionally did not revert it as I am
expecting glib-2.0 2.80 upgrade to land in master soon, but if it does
not then perhaps I will revert it this week.
>
> Regards,
>
> Le mer. 1 mai 2024 =C3=A0 19:29, Markus Volk via lists.openembedded.org <=
f_l_k=3Dt-online.de@lists.openembedded.org> a =C3=A9crit :
>>
>> On Wed, May 1 2024 at 10:08:05 AM -07:00:00, Khem Raj <raj.khem@gmail.co=
m> wrote:
>>
>> yes, there are a bunch of other 46.1 gnome recipe updates as well, are t=
hey interdependent in some ways that we will need to revert them too.
>>
>>
>> As far as I can see its only nautilus that will require glib-2.80. The o=
ther ones should be fine.
>>
>> But I'm not sure about the changes that are needed in networkmanager for=
 glib-2.80. I haven't gotten around to checking if they would work with gli=
b-2.78.
>>
>> Another problem I have is with hyprland and the chore update.
>> Hyprland is still broken with sdbus-c++ 2.0, but I guess a fix for this =
can be backported , once the issue was adressed
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#110209): https://lists.openembedded.org/g/openembedd=
ed-devel/message/110209
>> Mute This Topic: https://lists.openembedded.org/mt/105817245/4316185
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
yoann.congal@smile.fr]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
>
> --
> Yoann Congal
> Smile ECS - Tech expert

