Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 794ECE82CD6
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 20:32:58 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.27963.1695846774753570603
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 13:32:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XFVRCHai;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: peron.clem@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-50337b43ee6so19990423e87.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 13:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695846773; x=1696451573; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBwfa0XTFbprjVvq7nf8JOjnU6UbUxP08K/svZVS1a8=;
        b=XFVRCHainzuC6h/fu5g0vF0aY9bAt8RmLgAddU2n5hFV5zxiIPKZ/7obGC6OhkKy9c
         j4e1v35srpX7xzEwkxsns1JxruY7bABLNdi2wQIui+wcdZ5s3xOzfZTiD+SsoouKoim+
         Eih0BOnMk0H+OGlyIFnLG7TONka3cGeK6gba01/olvZLnmG3bIepXHKKlN1TgEBpelvO
         whTQpCtEezMR+wk+Y+u0Gmw3/SDEsw8qEeaDh1NpANvs/TrNiyLiBKAa7g4qwxru5dRj
         +EQ6qLRpBp5+Hi31RuNHATPWixmCefO1sB/M2TrZQv5QlYaLsHrPYyAM9/qxPBtPvRui
         VXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695846773; x=1696451573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CBwfa0XTFbprjVvq7nf8JOjnU6UbUxP08K/svZVS1a8=;
        b=KPKYKe72FvisO0MU1rziftjpsWzXra37oPaU0fRu7qIruNR5I8oIlZXU/jq976nRPW
         ditB7PAmL1nGIuvqo29tKNG3yhLzbq40km4ux6koFFyLh0dxKRzokHrSems3fweclxYx
         x7LCiDObBrpuDKZasQHqPq+3Epnowev+CPDYEzX97Tqj6qQw6GGb2QHMfHG7UxpTNP8N
         5/cqAhBK4mhPujnkGAZtLa3nTRn/KVu5Nk9TF3SXL0f8Uc8bkajtc7/LFeiCFOGqCeVu
         tIW399XwxdtEnx553yp37aPxG/+sOSZmgAPnHv66DdEZTEMiOYirbmgnqMjCPJ0ioZWT
         q3xA==
X-Gm-Message-State: AOJu0YwUhQvdpXR2gILfihT7npo3ggGJHAgqISHFLNAq06P0najpL4K5
	Yk/Jvtja85fvFsfntHPKQrXlFcXwVIm/s8nBYEs=
X-Google-Smtp-Source: AGHT+IGyWhTLB5qAzgKkMcu4VrAwJpNNxvKf/NQoa5mPiIJuIguE2Zi8uJH9inQ6eBNbw7BwsPNUB7t9pKbT9xlBSdw=
X-Received: by 2002:a05:6512:110a:b0:502:ab7b:e480 with SMTP id
 l10-20020a056512110a00b00502ab7be480mr3063315lfg.36.1695846772493; Wed, 27
 Sep 2023 13:32:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230927201136.2587713-1-martin.jansa@gmail.com>
 <CAJiuCcfBSBzCUjZ3CJkUB3x4DsE8BkQOSOMdfp3z1ZBwSgfkkg@mail.gmail.com>
 <1788DB1BDDB19F0F.25618@lists.openembedded.org> <CA+chaQcAJ4RN+6dsTw5Yp1gZZr20=qfc=TifKKfSccwMfQFOPA@mail.gmail.com>
In-Reply-To: <CA+chaQcAJ4RN+6dsTw5Yp1gZZr20=qfc=TifKKfSccwMfQFOPA@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Wed, 27 Sep 2023 22:32:40 +0200
Message-ID: <CAJiuCccAYQ1kNBEqxZiq4B+44x+okOwiYn2bYkWKO0MkHQc+tg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] mosquitto, etcd-cpp-apiv3: add missing Upstream-Status
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 20:32:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105208

Hi Martin,

On Wed, 27 Sept 2023 at 22:28, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> On Wed, Sep 27, 2023 at 10:22=E2=80=AFPM Martin Jansa via lists.openembed=
ded.org <martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> Which one? Can you send v2 of your changes as you clearly know the corre=
ct status better than me?

For
meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-fix-when-cross-comp=
iling.patch

Merged upstream commit is
https://github.com/etcd-cpp-apiv3/etcd-cpp-apiv3/commit/47f0d9e0326f3cc31c8=
01a0ecf7312d1049ece3e



>
>
> Sorry, it's clear which one you were referring to (just beer or gmail was=
 playing games with me), but still please send v2 or follow-up.
>
>>
>> On Wed, Sep 27, 2023 at 10:21=E2=80=AFPM Cl=C3=A9ment P=C3=A9ron <peron.=
clem@gmail.com> wrote:
>>>
>>> Hi Martin
>>>
>>> On Wed, 27 Sept 2023 at 22:11, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
>>> >
>>> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
>>> > ---
>>> >  meta-networking/recipes-connectivity/mosquitto/files/2894.patch | 2 =
++
>>> >  meta-networking/recipes-connectivity/mosquitto/files/2895.patch | 2 =
++
>>> >  .../etcd-cpp-apiv3/0001-cmake-fix-when-cross-compiling.patch    | 2 =
++
>>> >  3 files changed, 6 insertions(+)
>>> >
>>> > diff --git a/meta-networking/recipes-connectivity/mosquitto/files/289=
4.patch b/meta-networking/recipes-connectivity/mosquitto/files/2894.patch
>>> > index 3275e57e38..7374cbd26f 100644
>>> > --- a/meta-networking/recipes-connectivity/mosquitto/files/2894.patch
>>> > +++ b/meta-networking/recipes-connectivity/mosquitto/files/2894.patch
>>> > @@ -5,6 +5,8 @@ Subject: [PATCH] Link correctly with shared websocket=
s library if needed see:
>>> >
>>> >  Patch contributed by Joachim Zobel <jz-2017@heute-morgen.de> and  Da=
niel Engberg <daniel.engberg.lists@pyret.net>
>>> >  ---
>>> > +Upstream-Status: Pending
>>> > +
>>> >   src/CMakeLists.txt | 2 +-
>>> >   1 file changed, 1 insertion(+), 1 deletion(-)
>>> >
>>> > diff --git a/meta-networking/recipes-connectivity/mosquitto/files/289=
5.patch b/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
>>> > index a9e9c97b83..853f881754 100644
>>> > --- a/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
>>> > +++ b/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
>>> > @@ -5,6 +5,8 @@ Subject: [PATCH] Mosquitto now waits for network-onli=
ne when starting
>>> >
>>> >  See: https://github.com/eclipse/mosquitto/issues/2878
>>> >  ---
>>> > +Upstream-Status: Pending
>>> > +
>>> >   service/systemd/mosquitto.service.simple | 4 ++--
>>> >   1 file changed, 2 insertions(+), 2 deletions(-)
>>> >
>>> > diff --git a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-=
fix-when-cross-compiling.patch b/meta-oe/recipes-extended/etcd/etcd-cpp-api=
v3/0001-cmake-fix-when-cross-compiling.patch
>>> > index d1126aa05b..ce12d4270a 100644
>>> > --- a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-fix-whe=
n-cross-compiling.patch
>>> > +++ b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-fix-whe=
n-cross-compiling.patch
>>> > @@ -17,6 +17,8 @@ CMake is cross compiling.
>>> >
>>> >  Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
>>> >  ---
>>> > +Upstream-Status: Pending
>>>
>>> It has been accepted and merged.
>>>
>>> Thanks
>>>
>>> > +
>>> >   CMakeLists.txt | 28 ++++++++++++++++++++++++++--
>>> >   1 file changed, 26 insertions(+), 2 deletions(-)
>>> >
>>> > --
>>> > 2.42.0
>>> >
>>> >
>>> >
>>> >
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#105206): https://lists.openembedded.org/g/openembedd=
ed-devel/message/105206
>> Mute This Topic: https://lists.openembedded.org/mt/101625428/3617156
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
martin.jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

