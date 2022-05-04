Return-Path: <jupiter.hce@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF634C433FE
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 04:55:54 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.2923.1651640147094826812
 for <Openembedded-devel@lists.openembedded.org>;
 Tue, 03 May 2022 21:55:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hlks3B2j;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: jupiter.hce@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id b19so384375wrh.11
        for <Openembedded-devel@lists.openembedded.org>;
 Tue, 03 May 2022 21:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=vbJxd73+5ox+x7z9xTiuh2gav3gA2Xc0/1J24dfSSFU=;
        b=hlks3B2jGl/nN3Wom0QuvVkuyM0Em90le0wI/i4VxlVCGJgUs52EQqsKnrUTMp9Ohi
         //JQvl1HOV1XAg7iwB5OHmWg4a5NKVC8ngTfETgM7Ca89FLyJpmPKb/YyAKbuIyIOk9e
         kMrADuOlEwLind6j2ivzrHNquLQIBlpaNji41CjqAh2tFcghiDZ7f8p7tnjiP1GhwuZs
         V2KoOlTso2WjVG7RklZk7bcosYPcurWjtl+IhNKlm3BQTf9rePZGjGgWSLjR8bH/wEJb
         2lLWa428V5NjWS06EKmK2UQxkO7uULcm2YfnZbxbStoDIP16/sdxa8KINhdtdp+GQe/F
         bx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=vbJxd73+5ox+x7z9xTiuh2gav3gA2Xc0/1J24dfSSFU=;
        b=x1e3odD1lqeP87tF2qfUIb7xfgqC+Bj41PlDaJckWgQmHFxaqXUnSb9b2Wd/aQT7ut
         bbzW25QfHUqfD57/luwAUvwSlmiO1m4q/6g05BzxzMT6s8nfKulBK+yee06wFO5NXc5N
         qp0XCxfbuwd48qOKYOFoOibNkDSLMuww8TcICeIy5Y5VjW32l9N1QoB93UdF6spyVnGJ
         oR7HQBgGFBbulu9dvfOPbODTqQhewXnBNM5ZsgTdenY9MDs/m+poql9jXTEStAwF/ypJ
         bn4V8ttqebXYd4m6REAFCg6mJ8F1qbHQvqISyUJ0Zw1On4TZIJZGVhoSUxq398OOzLmi
         hAbg==
X-Gm-Message-State: AOAM5334MosT3clsinp1yj4naqM0RcoEJx0d+Udan6WYeG9xWodRtitT
	yLoQJU6ldml4Y6tBMLTDGlWAaElmd8Ufa3BRgVA=
X-Google-Smtp-Source: 
 ABdhPJwDlEYt2ZlPsDlEyapZs/whfUjtSxll12B7cHP3vUiT9otuaazi0k52Wh6Jm+TucoV6TMJ0JTVofDyQZBTdUSs=
X-Received: by 2002:a5d:4e08:0:b0:20a:f065:7024 with SMTP id
 p8-20020a5d4e08000000b0020af0657024mr14711600wrt.598.1651640145078; Tue, 03
 May 2022 21:55:45 -0700 (PDT)
MIME-Version: 1.0
From: Jupiter <jupiter.hce@gmail.com>
Date: Wed, 4 May 2022 14:55:07 +1000
Message-ID: 
 <CAA=hcWRLJHs+P-uzrEa+JGrqp-PBeKv8fHwRCmKPzioXUV=n-w@mail.gmail.com>
Subject: Failed to build kirkstone branch
To: yocto <yocto@lists.yoctoproject.org>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 May 2022 04:55:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96956

I was able to build u-boot-imx-2021.04-r0 in honister branch, but
could not build it in kirkstone branch, here is the error message:

ERROR: u-boot-imx-2021.04-r0 do_fetch: Fetcher failure: Fetch command
export PSEUDO_DISABLED=3D1; export
DBUS_SESSION_BUS_ADDRESS=3D"unix:path=3D/run/user/1000/bus"; export
PATH=3D"/build/KirkstoneRam/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-b=
oot-imx/2021.04-r0/recipe-sysroot-native/usr/bin/python3-native:/build/Kirk=
stoneRam/oe-core/scripts:/build/KirkstoneRam/build/tmp-glibc/work/solar-oe-=
linux-gnueabi/u-boot-imx/2021.04-r0/recipe-sysroot-native/usr/bin/arm-oe-li=
nux-gnueabi:/build/KirkstoneRam/build/tmp-glibc/work/solar-oe-linux-gnueabi=
/u-boot-imx/2021.04-r0/recipe-sysroot/usr/bin/crossscripts:/build/Kirkstone=
Ram/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2021.04-r0/recip=
e-sysroot-native/usr/sbin:/build/KirkstoneRam/build/tmp-glibc/work/solar-oe=
-linux-gnueabi/u-boot-imx/2021.04-r0/recipe-sysroot-native/usr/bin:/build/K=
irkstoneRam/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2021.04-=
r0/recipe-sysroot-native/sbin:/build/KirkstoneRam/build/tmp-glibc/work/sola=
r-oe-linux-gnueabi/u-boot-imx/2021.04-r0/recipe-sysroot-native/bin:/build/K=
irkstoneRam/bitbake/bin:/build/KirkstoneRam/build/tmp-glibc/hosttools";
export HOME=3D"/home/jupiter"; LANG=3DC git -c core.fsyncobjectfiles=3D0 -c
gc.autoDetach=3Dfalse clone --bare --mirror
https://source.codeaurora.org/external/imx/uboot-imx.git
/build/KirkstoneRam/build/downloads/git2/source.codeaurora.org.external.imx=
.uboot-imx.git
--progress failed with exit code 128, no output
ERROR: u-boot-imx-2021.04-r0 do_fetch: Bitbake Fetcher Error:
FetchError('Unable to fetch URL from any source.',
'git://source.codeaurora.org/external/imx/uboot-imx.git;protocol=3Dhttps;br=
anch=3Dlf_v2021.04')

But I was able to run the same command manually git -c
core.fsyncobjectfiles=3D0 -c gc.autoDetach=3Dfalse clone --bare --mirror
https://source.codeaurora.org/external/imx/uboot-imx.git.

What could I be missing?

Thank you very much.

jupiter

