Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEB9EC61CE7
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 08:37:26 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.2839.1749631041822108484
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Jun 2025 01:37:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J4x2Qokh;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6fad4e6d949so36253626d6.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jun 2025 01:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749631041; x=1750235841; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=04N7inEDJ7P/4ifJSngFvfG8HSoKnfNxWLXN8hWCN08=;
        b=J4x2QokhHBGf3Wd5HNa8puQ2Av6NmjvP4dNeYDMr1SCysVtGmKOPtuFxnFZrZQZ9aW
         5whq7r4jIHZFShKtH8rPlbIPZJfKvDpbPV3WzUhnEflBeFC2BW+acG/Zpz3Jf1mqTcgx
         9PYRrzZvuSZLaW0Efvyp/cSOWe+daEOnAjgiNcUI6asHLNiuLE+CQQhk272e8S+Y+Pmt
         qSe4j81RQDJuL2EEnYqq9e6llUazAVJ3xRZEIEGcQ7DntnVPq6F1PR5wKzZldCbRWmwQ
         Fte1tneDGK1fQKMnRgKsGoU7RwGi4quiFx0uHvVKHuemlbeQulWvijYb2TDr4SJnvuCF
         POzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749631041; x=1750235841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=04N7inEDJ7P/4ifJSngFvfG8HSoKnfNxWLXN8hWCN08=;
        b=J42rAUVTUhQHnT30DBaTixUroj5zPx/z5Dq/yryf0m4paFcD4JhFD+hhK9VuJiwS1+
         w71G6CM7qt5s9tmYS7ZuQoK7uh01QSIhcUiv5gJTao8/HvdwCxoqVaTnD1tSSVXcmNlW
         uraCJY1caKe9a3pNqSAh3ob6Ec0V+IfxcjNzAbYYseyGX6DOJI6BySpj0VvEaj7iEk3m
         ToOTzG+M1GRzhrAF40PTDh4CBTUcLklWofZRH9a8ABhbZ3kzmFQ5t6MhzVDY/y+uX7rY
         r6Y7LcVm2MHakqE8OUf19IR77HmECz25dPCU3k8v/kKv69CtVzSZxwOfbtC5n8lkxtmf
         QD1Q==
X-Gm-Message-State: AOJu0Ywfdt/LWkfImVzbkCfCGuvlJsauGp/KWg9TRHL9/lSEzJtLoPnw
	9XfY0CIQWol/3znHPXY4Vw3yJbZMO3QWTSnPlvROkQg+pHrd3oGVgH70v741wFAUQGMPOZoco3s
	wvjMn1RFMmSY6Q4rPQRdAEbzOepSoQybZfbaj
X-Gm-Gg: ASbGnctFoP4Bp6kEJ8KOMG+J3f6yFkaSJ8eeVhRGFNUDSr9Yh6INm8OpR6VqMc/cUNi
	WBcNbzB5NViwSnOLEIz/9o7fJcG4+/BWqiUAL1U+OEOZ+eV/8XRS0IY5pqzmP8m0bpLfJQoTk+X
	3ecOqi94ivL2lDJFAvYv7G4E6Df+dnLvXiKbEuzUZYQbWkV+uSmTvLAMRJ/A7dMFAfrmdyyf3/Y
	MPvJq5VYiKw79Mn
X-Google-Smtp-Source: AGHT+IHlKWr5ol3soEE7uSKvNpCYAFI2hJ3HAbb70qd3ZmlaxFXTZFl5JjELiYFgMCwi4ZCIPRjCuAtBCXRuXMnQE3M=
X-Received: by 2002:ad4:5ba7:0:b0:6fa:bd17:31b with SMTP id
 6a1803df08f44-6fb2c38f55bmr34941996d6.43.1749631040517; Wed, 11 Jun 2025
 01:37:20 -0700 (PDT)
MIME-Version: 1.0
References: <1pXS.1749603144841364915.mHTW@lists.openembedded.org>
In-Reply-To: <1pXS.1749603144841364915.mHTW@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 11 Jun 2025 10:37:09 +0200
X-Gm-Features: AX0GCFvJCQewGVu91rVa77fQUI3yvLan2a7KlPdt0pdDX9zYtqsBD8wWvwLJEFc
Message-ID: <CANNYZj98FBsBsi22BsVw2rsmhXb3c=8fUtqQaWmFX53o97VutQ@mail.gmail.com>
Subject: Re: [oe] Using dracut to create an initramfs image via bitbake
To: eric.smith@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Jun 2025 08:37:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117882

As chance would have it, there was a recent discussion:

https://lists.openembedded.org/g/openembedded-architecture/topic/rfc_on_tar=
get_initramfs/113349284

Alex

On Wed, 11 Jun 2025 at 02:52, eric.smith via lists.openembedded.org
<eric.smith=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>
> Hello OpenEmbedded developers,
>
> I am curious if there's been discussion on trying to use dracut to build =
an initramfs image via bitbake. To be clear, I mean running dracut on the b=
uild host machine from a bitbake recipe, and having this dracut use files f=
rom the target image rootfs to build the initramfs.
>
> Right now in meta-openembedded/meta-initramfs/recipes-devtools it looks l=
ike there's a dracut recipe to build dracut for the target arch, but no nat=
ive dracut recipe. So with the current dracut recipe, this dracut can only =
be used from an architecture matching the target arch. This is not cross-co=
mpatible.
>
> There has been a recent improvement in dracut to enable a native dracut t=
o work with cross-compiled binaries. See the merged patch that should go in=
to the next major dracut version 107 which replaces dracut's ldd usage - Pa=
rse ELF .note.dlopen entries for dependencies, replace ldd for better cross=
 support by chewi =C2=B7 Pull Request #1260 =C2=B7 dracut-ng/dracut-ng =C2=
=B7 GitHub
>
> If there's no active development on using the latest dracut to build an i=
nitramfs, I'd like to work on it. Specifically I want to create a dracut na=
tive recipe and a dracut initramfs test image that uses the native dracut a=
nd a machine image's rootfs to create an initramfs. I understand this work =
would be dependent on a newer dracut that's not released yet.
>
> What would be the testing expectations that I should run for my patches? =
Run testimage, as documented in the following? 4 Contributing Changes to a =
Component =E2=80=94 The Yocto Project =C2=AE 5.2.999 documentation
>
> Thank you,
> Eric
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117880): https://lists.openembedded.org/g/openembedde=
d-devel/message/117880
> Mute This Topic: https://lists.openembedded.org/mt/113581176/1686489
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
lex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

