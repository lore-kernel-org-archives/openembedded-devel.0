Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70A77C369C2
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 07:07:15 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.44912.1746428827570373346
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 May 2025 00:07:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aq2Vr8+M;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5498d2a8b89so5141196e87.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 00:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746428826; x=1747033626; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=riA63+bwWf3zd9r+R7aLjbBwcGECx1z9QXSxzChwlkY=;
        b=aq2Vr8+MEG6bMcy7E2vE55C4XkfVOwHtebAIAh8Y0USYt0uQm0rBloHV85l5ZTEFNU
         U5JQ3pmZEBotMQxXCknj6dgbzVbndVzVb2mjFVDMKeFyX8gcVJDdWNInm/sqxT2GlngL
         rwRZJzMKyJgND4MSXwmVJG343reS0PtSlzp2o4tNEbSfl7D7evc7SiYL1tNXxh+WX14n
         4GCKBgoTaSDU9kZ+W8dF7+tm3mAtLgCLeZ7bzGN26/MdAdVbWR+GfPNVRJJRi1Pzoagd
         zlhl+msy5y9NF7wdUodvCpBGsqGsK1RIMJDLvbtg98wy0o18oUx02Sqa4Fa5BHY4DDAA
         6EUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746428826; x=1747033626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=riA63+bwWf3zd9r+R7aLjbBwcGECx1z9QXSxzChwlkY=;
        b=dgiblzl4cLV+950FVH+k7TgbFHesQ1CAMZByknbIDOsxiziynluiG7L191Qd4OsKHi
         7tbBGEVs0tNtC8BcMIwS3VAg27fRoDDKYKvmngy7Mb+lUc0UeNYNdrGVSa1FAy9vFW/u
         LlDvPWTwdUFL1HUxwbWhllJ+aEsjVOoOpFlXv/PjWoyZ8q37CeVyA2P4UsmnJwQcmU57
         YNldz/7QZjDyrAde9h7SMSMjp+9mDlqY6BpRU669yz4sFZMWyx0hRwkhILep3oJMAAlT
         5428ZLnhSRFtJgmUJ+1vm+2FbBYrnyDM4COu0FsHd9o2PWo3AU79s1o0vjVZzcbRMPNm
         a75g==
X-Gm-Message-State: AOJu0YwzU6+vxrTrqbk+TKQzxYFP5jNVEqzr5+hAe1nt75S6/+pXe3yn
	q+auamUr1OnqaSQuqH43p4bbKXuan/0X1BiFHYy0pCuXCSzp9BNbHIOQ40IKWw62TnIJ5/dcdq9
	NfXZ2ynFb8F9v1hMT3611/8qF7+8=
X-Gm-Gg: ASbGncu1ofOXh1xn/7gJtxg2w1j8C9lUWkrCbJphUYMCtE/EtYGO6xtNy/BS8Ms3Dyg
	ukE7U5/hSk5LPgLVrU7z4JpuIr2g6QwKWRVjlkSROjhMSvZnHyG5+E5FxVBVIqZcNdTUe591gvD
	q0GEPKtF+8dtyAkD52sWTyM7F7
X-Google-Smtp-Source: AGHT+IHYBaIoqKV76dfRJ8EYxqPNxa0dpvyCTIA40tYYnwwOH3xnCsa0/H52WSuwsvlZOuad/4LrAkvknyADVyJ81+Y=
X-Received: by 2002:a05:6512:10ce:b0:548:91f6:4328 with SMTP id
 2adb3069b0e04-54f9efcc2e8mr1728632e87.15.1746428825458; Mon, 05 May 2025
 00:07:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1spH2oB=_CzbVgG92tNkSbutzgH0GYQs=1PEPZ=kYz4pqA@mail.gmail.com>
 <22536.1746025595055690689@lists.openembedded.org>
In-Reply-To: <22536.1746025595055690689@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 5 May 2025 09:06:51 +0200
X-Gm-Features: ATxdqUFqhXddCkO7OgEwXEMriPQqkBG6PqKr3RQFvMnOvrC01wlnYQQ6JLz0MUg
Message-ID: <CA+chaQftwG7CDFy3mq7qhjvALUpLmyoQZ5GxtpftWvPdm9W5Wg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-posix-ipc: switch to PEP-517
 build backend
To: gudni.m.g@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 07:07:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117297

Hi,

thanks for trying to reproduce.

I got access to those jenkins nodes and have more details

The issue are the tests from compile_and_run
https://github.com/osvenskan/posix_ipc/blob/develop/build_support/discover_=
system_info.py#L72

It builds multiple tests like:
aarch64-webos-linux-gcc  -mbranch-protection=3Dstandard
-fstack-protector-all  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat
-Wformat-security -Werror=3Dformat-security -Werror=3Dreturn-type
-funwind-tables --sysroot=3Dpython3-posix-ipc/1.2.0/recipe-sysroot -Wall
-o ./build_support/src/foo ./build_support/src/sniff_mq_existence.c
-lpthread
aarch64-webos-linux-gcc  -mbranch-protection=3Dstandard
-fstack-protector-all  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat
-Wformat-security -Werror=3Dformat-security -Werror=3Dreturn-type
-funwind-tables --sysroot=3Dpython3-posix-ipc/1.2.0/recipe-sysroot -Wall
-o ./build_support/src/foo ./build_support/src/sniff_mq_prio_max.c
-lpthread

And then tries to run them while on my local 22.04 docker container
running build_support/src/foo from the last tests results in:
posix_ipc-1.2.0 $ ./build_support/src/foo
bash: ./build_support/src/foo: cannot execute binary file: Exec format erro=
r
which triggers the Exception in compile_and_run and returns None

while on jenkins it fails with:
posix_ipc-1.2.0$ ./build_support/src/foo
/usr/lib/ld-linux-aarch64.so.1: No such file or directory

and the compile_and_run returns
b''
which then causes
python3-posix-ipc/1.2.0/posix_ipc-1.2.0/build_support/discover_system_info.=
py",
line 244, in sniff_mq_prio_max
    if max_priority < 0:
       ^^^^^^^^^^^^^^^^

in https://github.com/osvenskan/posix_ipc/blob/develop/build_support/discov=
er_system_info.py#L220

I'll report it upstream and lets see in
https://github.com/osvenskan/posix_ipc/pull/77
and I'll send patch with the same shortly.

But please hold backporting this change to stable releases for a while
unless it fixes some important issue.

Cheers,


On Wed, Apr 30, 2025 at 5:06=E2=80=AFPM Gu=C3=B0ni M=C3=A1r Gilbert via
lists.openembedded.org <gudni.m.g=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Interesting. I did my testing on scarthgap with Ubuntu 24.04 via Docker. =
I can try changing it to 22.04 and re-check on my end.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117260): https://lists.openembedded.org/g/openembedde=
d-devel/message/117260
> Mute This Topic: https://lists.openembedded.org/mt/112443744/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

