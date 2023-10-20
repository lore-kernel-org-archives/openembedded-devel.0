Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A228FCDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 04:22:35 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web11.47696.1697775752225595851
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Oct 2023 21:22:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TAZV+Lot;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1ea45b07c59so321028fac.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Oct 2023 21:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697775751; x=1698380551; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VuVPX2d2RPMVgVg0AT5iYTjCHkz18/49YkowLFHiEVg=;
        b=TAZV+Lotlc7PlauYDN4uJV9gOLeQz1ePMb3TUtAA9pp7OAUJIXQUs3rsN5IqknrsUV
         y0diFxuq9hXSQmFpw4PYXycJR0mogHCCbZMzgXYajit7LIny/lnF7kNgJLy/lmbbthkD
         KuEW8BS4nCzo/AF1NPCYZTmfWlmRJlw7P9gt8gK3b/Sh5F0ZRv405M3FMBmA79CPzurN
         y5Mx0g1vmbzNIkivlJ5TY2lRGRh0DIlJgV9qDokybm3dJoGQFSGKpmxISCA8xP1rIt2v
         KzUQU7pojeAWrqDhmyS1zJ2BALhCraPpmNCQNAPZpPk0k6Y/wbYpVFYRfczBG967Q5ZM
         KHCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697775751; x=1698380551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VuVPX2d2RPMVgVg0AT5iYTjCHkz18/49YkowLFHiEVg=;
        b=KaqEowsHa9I9fodF22tINbn6fOHtJejm3NGYNY4AXfXmcawCK3x2+geYLT3Q9dgWbQ
         8vtXc5xwYxW42UqNg2UQJcKDfATGPSPYi9rdUUauEmCZKy1UbFE8JE4vugDDU9Eja32h
         dsDi4SNSGYoYv3m3EjPQIzYTFJqB66DZacZgjC2t+DjtuWpBAOSNk+k0vYncioTIg/Br
         ivtlmIYOaaWLUvFqBb7Pj1SalIVVa0pj1/0SsAo2YdtuBbQLIXEcxiJBj1OgK1BSyzZQ
         giCi+a32DxrxnrAe9lOcw2SXbYZi7OE7TL3MUtsXWLDoRBh7/+0n9lvzMndDACyZMxV7
         tEOQ==
X-Gm-Message-State: AOJu0YyliV77/feBlVhS4U0ZOvnjCuZNEk915kUdXD0iMsHl59ADuFgw
	IONEu9VmkbUV5OmrXxQpycPcJcPdtEaBUWKd8mo=
X-Google-Smtp-Source: AGHT+IF+bp5vaZemahKBNdf18bPrl575QxOUv8F1LzKlIeDMIT8v0IQAxRkTteB8oQmoxefpTBlRE4cZg7C/uq8Avt0=
X-Received: by 2002:a05:6871:8909:b0:1e9:b305:6831 with SMTP id
 ti9-20020a056871890900b001e9b3056831mr1034427oab.42.1697775751425; Thu, 19
 Oct 2023 21:22:31 -0700 (PDT)
MIME-Version: 1.0
References: <1697527418-5791-1-git-send-email-wangmy@fujitsu.com>
 <7F1CE9DA-A95C-4079-9436-F8D233A6A116@arm.com> <OSBPR01MB1845965B443CCECAD4B7B5D5DCD4A@OSBPR01MB1845.jpnprd01.prod.outlook.com>
 <EA96D0EB-17C1-4946-BE02-7DD224677992@arm.com> <OSBPR01MB1845ADFF0CB9654D059FC977DCDBA@OSBPR01MB1845.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB1845ADFF0CB9654D059FC977DCDBA@OSBPR01MB1845.jpnprd01.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 19 Oct 2023 21:22:05 -0700
Message-ID: <CAMKF1srw_a8H=q3TD-7yuqxZx=mN2TkJVBXA0hoVs7gJJaX-mg@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH v3] dnf-plugin-tui: create symlinks from
 /usr/ to /.
To: wangmy <wangmy@fujitsu.com>
Cc: Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Oct 2023 04:22:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105607

On Thu, Oct 19, 2023 at 8:25=E2=80=AFPM wangmy <wangmy@fujitsu.com> wrote:
>
> > Sounds a bit like the symlink creation should be moved into base-files.=
..
> Yes, we also think that it should be moved into base-files.

Right until then I will install this patch.

>
>   --
> Best Regards
> ---------------------------------------------------
> Wang Mingyu
> Development Dept.I
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST) No. 6 Wenzhu Road, N=
anjing, 210012, China
> TEL: +86+25-86630566-8568
> COINS: 79988548
> FAX: +86+25-83317685
> MAIL: wangmy@fujitsu.com
> http://www.fujitsu.com/cn/fnst/
>
> > -----Original Message-----
> > From: Ross Burton <Ross.Burton@arm.com>
> > Sent: Thursday, October 19, 2023 5:05 PM
> > To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>
> > Cc: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-oe] [PATCH v3] dnf-plugin-tui: create symlinks =
from /usr/
> > to /.
> >
> > On 19 Oct 2023, at 07:51, Mingyu Wang (Fujitsu) <wangmy@fujitsu.com>
> > wrote:
> > >
> > >> Isn=E2=80=99t this what create_merged_usr_symlinks in image.bbclass =
does?
> > >> Why does a DNF plugin need to do this, and not anything else?
> > > Because dnf-plugin-tui is used to created rootfs in any nativesdk env=
ironment.
> > > It is not in a bitbake environment, so image.bbclass cannot be used.
> >
> > Sounds a bit like the symlink creation should be moved into base-files.=
..
> >
> > Ross
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105606): https://lists.openembedded.org/g/openembedde=
d-devel/message/105606
> Mute This Topic: https://lists.openembedded.org/mt/102013374/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

