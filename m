Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A428C369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 20:57:38 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web11.1682.1745355455436391160
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 13:57:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kiHMgI42;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3f7f7b70aebso3414634b6e.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 13:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745355455; x=1745960255; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GivhBcMTnsrerV8TXeYnqWUCbIjP6bmsQQbXVR+vtKk=;
        b=kiHMgI42I7SQCBDxapU7FvDptNbSyYJJjpDwUtPIAeuUDX+/CNliPR/ELQfQQnWVIX
         HjhpPdFzINor4N6kdC+8NKXsxH+KfAuD16hy7CofOVB4jsdQDjoeS25MU6VbTuHqyaJG
         2UccbyHgGITS+Q+BWeSgnMsPpRG2t9jNfSvmRNDUT87PcHikJWJquTFWHztpW9D0RL2C
         xtootTIeIZq+Kj/1HZPnJI1umHQR2BJ4rWqZZI1eG9U5e1B1BMKmcZVjDPMgpCqE07v0
         nFTFKak51EKmWuq18rekRwQaYL1PhY5yHqHrgDMr3bIa1aDZQs2YTUN4D9MHIRaBYvwp
         HfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745355455; x=1745960255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GivhBcMTnsrerV8TXeYnqWUCbIjP6bmsQQbXVR+vtKk=;
        b=cBDYcrXob1EAeSrz3jow3Cd84U0X4eAH84ja8IfDH+O48x6kwUTUaSMI6J4tTVxi6D
         wbm3ERUGl5xKBjS2HVN9dIUJn7ynZTAYCTS1wxdnq9OvzpUorwfHvWWurdtF6qWj3QcL
         qMYSauqXuzyc6rcjYRNZIOZnb3fc2id58FZKEIemrcfFW9nS1KPnWQYcpUaB021eynEn
         T1+Vf0Paya9wRR7cUw4vgP+gQyo1IcqUolGCeNWQ8anpUS8uLS6TUdM2ufqeCNSjb2CQ
         qmMf0x4/HPd1O5ACWH8Jjac0507KnFtIchO1uSUnjl/mzjpz7NBuzKvlFkOHT10eX7jm
         u98A==
X-Gm-Message-State: AOJu0YwjirsMlJItbrtMr7wWnFK4ngF4mDpYZ+TYFss7jSIBYsKdP5eh
	cWcccRYoIV6KdMBBk69QClmvzBVd4DcIe60XLftNhwVcL2TRKGm6ajHnTmy/b0iPUwnhHpaE3K2
	kdG8m6tmTEcp1f8wY7Y42VKJLi2M=
X-Gm-Gg: ASbGnctYnF+FVoxOCe5rDudObbTJDeQfw/8oWvbVb55bznumxYR8/zvYYyi7rk/G8QP
	RciyFjwg3W4WHQ8qH1z+kE4fIObqfGrAFPuA5/lUG4ceF+Bn2SBiMTVlSLwWFeVc4BjyPquH/GD
	ISmiCaFlF7M6fdH0fEyVLm
X-Google-Smtp-Source: AGHT+IEfv+VU3lUmnIC4tqYeuidFJ/0rVCwc2AGws4Gb+cNPOI2XNQGyJfSk68kH6OoduyZ4sBpgCWTcnPkua63pJBM=
X-Received: by 2002:a05:6808:8104:b0:400:32b9:7926 with SMTP id
 5614622812f47-401c092e538mr8342225b6e.6.1745355454615; Tue, 22 Apr 2025
 13:57:34 -0700 (PDT)
MIME-Version: 1.0
References: <1745311761-1912-24-git-send-email-wangmy@fujitsu.com> <19865.1745353700051210733@lists.openembedded.org>
In-Reply-To: <19865.1745353700051210733@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Apr 2025 13:57:07 -0700
X-Gm-Features: ATxdqUFzDmLdo91o8QoLgm9TXzpCCD-ATslbbL7NnOgREE163eyDmq8TQ9cFpSg
Message-ID: <CAMKF1spcgBP1tkm1B5bTgSRff+ePsLjYg+_75PYUOeTM-WYKNA@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH 24/30] python3-posix-ipc: upgrade 1.1.1
 -> 1.2.0
To: gudni.m.g@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 20:57:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117070

On Tue, Apr 22, 2025 at 1:28=E2=80=AFPM Gu=C3=B0ni M=C3=A1r Gilbert via
lists.openembedded.org <gudni.m.g=3Dgmail.com@lists.openembedded.org>
wrote:
>
> It looks like this recipe can now inherit python_setuptools_build_meta In=
stead of setuptools3.
>

Thats a good point. Although it will be good to have a separate patch
for that on top.
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117069): https://lists.openembedded.org/g/openembedde=
d-devel/message/117069
> Mute This Topic: https://lists.openembedded.org/mt/112391361/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

