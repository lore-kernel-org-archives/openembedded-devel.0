Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6CCDC02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 21:22:33 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.22646.1737667352940855960
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jan 2025 13:22:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aouzW37U;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3eb6b16f1a0so406375b6e.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Jan 2025 13:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737667352; x=1738272152; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZBBAlUpIUHDz/zS5bcMorAT9ri7X+THHHEsbU+zSJLc=;
        b=aouzW37UJRMCkAtJIIJShhzc4baGq1S9651VynfYPyYHF55jDRx5kCdavW4tbZxONt
         oJ7eJq8iu9Hk4rdwu44OclxF6Nv17HMNePYTlrjvLvtsfKSJcsYQO38/AXDDKeePtEgO
         qaZJr72W1yz3UORU5Hp6uHIZxClUtEY2cki9+WuFzMNkVuOJb34Z//pBVlHUKWQE5NEf
         uDnN83xOuvwBKL0gfzivBoSrlp8yHZ11j12OE7vwDd/IdT1s2NmWyIUC8VavMsocgMo+
         BUA3L1LU7tULLE2n5fAotgT1kZolsTBnpPhyr2X8Fz7VcDXTpFT68JuRkXYOMBFJGR4S
         PT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737667352; x=1738272152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZBBAlUpIUHDz/zS5bcMorAT9ri7X+THHHEsbU+zSJLc=;
        b=vJ+ODo364glco9eXEV4cjJ2ug6nCC5E9etHtfYMI8MoKvCwShCy+rCNXCUdFodMW4J
         BSLkOjFtUFAhX3O2N2cF7lOQqzuiBJH+6j2GK6vVpklymFJdGsEwP0Sgdne+87ylfM0/
         TA9plX3C7h65NtP68odNfagp5jXUb6lOgHjwTszVR+uJBuNpFgfRsPUXrbKXN/qCQox1
         /ohdPuphzL8PcNWViRg0m20iAYteOJeXlKodmf5D0ODKGgtIceZea4BluXkIBE+HI0xu
         4EZmzvHhpBbGK4NF/nRGVJqbw05diHxFEbGNOXX3oL0uEnrN1KzMFblKuxkUx4EEmNkm
         HWBw==
X-Gm-Message-State: AOJu0Yxm/GZNFi+aLgXpvn4oClWb2Shzde+yV08OuHDZSRWqP+4xf/m9
	YQ5c+H5jWRc+vEBX3ACCRnmUE0IUqKwW3dQHOuv9kh3W/jCMTWwJFnvu+K/XvNVb4RAD0840otP
	awZiKuiYiv/UoT5JRFM0TwzD3c1MZqS4G
X-Gm-Gg: ASbGncvTRVyYTfLwosy+SPO26GrhogWey4G+91wBAMRA9EhPPHYtR/92jXkJuRLCb8Q
	RBn4kqYoBHSdp5+MEOft1eC3d/Ykzx9Vxxgx0fuB0igrEedYXy3pjAI96T0HM
X-Google-Smtp-Source: AGHT+IHlpvYFjojrlafkPe4jPZVQACOsh598wo3pM95Tqdn9aNNIYdbqPxK4BIH2bEbdqIwgdnrGiZDrcdczNaWD1KE=
X-Received: by 2002:a05:6871:4e8c:b0:297:2376:9b17 with SMTP id
 586e51a60fabf-2b1c0ac9c65mr14617679fac.19.1737667352167; Thu, 23 Jan 2025
 13:22:32 -0800 (PST)
MIME-Version: 1.0
References: <tCev.1737499523488315680.yQwU@lists.openembedded.org> <PA4PR04MB934350501DE0FB5B0D0DD0DD91E02@PA4PR04MB9343.eurprd04.prod.outlook.com>
In-Reply-To: <PA4PR04MB934350501DE0FB5B0D0DD0DD91E02@PA4PR04MB9343.eurprd04.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Jan 2025 13:22:06 -0800
X-Gm-Features: AWEUYZn_x21W_YiDMbOQJjrz0uSVbwpfxaQbzQH_SeAeQuzJW1LyATJa2j8fXVk
Message-ID: <CAMKF1srWL8GdLXObvNJxfY4CVpnbaE+7qtXYnLhfRC_nAzzDVA@mail.gmail.com>
Subject: Re: [oe] plymouth_24.004.60 causes to not pop up login prompt
To: p.lobacz@welotec.com
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Jan 2025 21:22:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115038

On Thu, Jan 23, 2025 at 12:17=E2=80=AFPM Piotr =C5=81obacz via
lists.openembedded.org <p.lobacz=3Dwelotec.com@lists.openembedded.org>
wrote:
>
> OK I have discovered the issue. The problem is that there is the patch ht=
tps://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-core/plym=
outh/plymouth/0001-plymouth-start-service-in-add-related-kernel-paramet.pat=
ch?h=3Dscarthgap and according to this merge request in upstream https://gi=
tlab.freedesktop.org/plymouth/plymouth/-/merge_requests/157 it is wrong. Al=
so Ray Strode in his comment has explaind it clearly that with that option =
it would login prompt would never be run, which exactly happens in my case.=
 Deleting this parameter fixes the issue.
>
> IMHO this patch 0001-plymouth-Add-the-retain-splash-option.patch should b=
e removed. In addition this one 0001-plymouth-start-service-in-add-related-=
kernel-paramet.patch should be deleted as well as it forces to be the defau=
lt behaviour of plymouth. Developers should decide this on their own...
>

Thanks for reporting and drilling down, would you mind sending a patch
to remove it? Since the patch is rejected upstream and does not have
alternative way to handle the original issue, it's better to remove it.

> BR
> Piotr
>
> ________________________________
> Od: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> w imieniu u=C5=BCytkownika Piotr =C5=81obacz via lists.ope=
nembedded.org <p.lobacz=3Dwelotec.com@lists.openembedded.org>
> Wys=C5=82ane: wtorek, 21 stycznia 2025 23:45
> Do: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org>
> Temat: [oe] plymouth_24.004.60 causes to not pop up login prompt
>
> Hi all,
> I'm working on scarthgap branch, as i have recentlly updated from kirksto=
ne and encountered a strange issue.
>
> As in subject I'm not getting login prompt when using plymouth as splash =
utility, but only a message like 'Starting systemd-udevd version 255.13`. W=
hen I hit alt+f2 I will switch to tty2 and than again alt+f1 i'm getting tt=
y1 so that is fine but for some reason plymouth is casuing this screen hang=
up and I do not know what is causing it. Maybe some of you encountered it?
>
> BR
> Piotr
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115036): https://lists.openembedded.org/g/openembedde=
d-devel/message/115036
> Mute This Topic: https://lists.openembedded.org/mt/110778733/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

