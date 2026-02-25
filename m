Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 874E7EFD20A
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 08:21:00 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41159.1772007308543820852
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 00:15:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ThMmItAu;
 spf=pass (domain: kernel.org, ip: 172.234.252.31, mailfrom: brgl@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B32B0440CC
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 08:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91BF8C2BC87
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 08:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772007001;
	bh=uSl1dQJ5lGfzIeQPY3zVmZ/RelBsDX6ng0MPmpGAbB4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ThMmItAuXRMU4lhxiYqOn5CyIeIMr81PAMMMcEAb/l3mHUbWkHUxAJEEH4Izfs+aj
	 89d1xNFcwW9/gQQEi897jYXNXpW/z0PCa8txCHGihqFNH3h6bxhxPkZaNXrGeA2utC
	 O/LQr1Jrni8LJLDVwlJjlXvQUUeDbR52uwAMY5duBwxy/xNTorXhDrd5Q+YNTN2k5/
	 Qs9mulJP/vZRu/dp8rhNjOG9gSfUxRBJuS8JHhQpBSVZzR877p2/3q8oNjXZuGW2xt
	 V1AxgDnlzMXHqV+bH9pJTsodwtfrx5ZUMW+BKm+9NqLyqkNA1rbFFmba7KQpr20mAe
	 ykDTaIDnAfYJQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59e64657f0cso6993523e87.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 00:10:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWddqBudadYTLFO/IRIZaixbvYruQ6seypIVgPg4PwJgIjrPXqrT5EvxwkGYjTPdys9T9HnQIlZVxNzXnLzSElRAdk=@lists.openembedded.org
X-Gm-Message-State: AOJu0YybZGPsGkXM2W/CAmllJU1qEhAnlLMJTAvTtNQmrebFj1eiT5mI
	BicrgBIcgcz70FvDGS7/SCmG+7PmIGeEPGMtmwHCl8Ml6/BkYoYuEsQ/m14ubXnafke2It/viUj
	GBigWfPpDwPB83IKFcDz47yzRQwg++ouSt6iuKtqSwQ==
X-Received: by 2002:a05:6512:1502:10b0:5a1:4c8:a632 with SMTP id
 2adb3069b0e04-5a104c8a721mr42874e87.13.1772007000175; Wed, 25 Feb 2026
 00:10:00 -0800 (PST)
MIME-Version: 1.0
References: <20260223101102.92124-1-bartosz.golaszewski@oss.qualcomm.com> <cef486ef-9e0e-4f3d-b2a7-18adf825dac7@gmail.com>
In-Reply-To: <cef486ef-9e0e-4f3d-b2a7-18adf825dac7@gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 25 Feb 2026 09:09:48 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mde2oUuUqDWRhNhVPiQmNxVESvet=dQYqF4mWKd5nzeRA@mail.gmail.com>
X-Gm-Features: AaiRm52SilYvVU3nYiMQv5hK5U1EU1Z9eLXcJ1g5hh9c5AEoC33_aLbTgKRQs_4
Message-ID: <CAMRc=Mde2oUuUqDWRhNhVPiQmNxVESvet=dQYqF4mWKd5nzeRA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] dtschema: new package
To: skandigraun@gmail.com
Cc: bartosz.golaszewski@oss.qualcomm.com, Khem Raj <raj.khem@gmail.com>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 08:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124612

On Tue, Feb 24, 2026 at 9:13=E2=80=AFPM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> This patch doesn't look correct, I think maybe some changes weren't
> committed?
>
> At first I wanted to check if it really needs no dependencies, but ->
>
> 1. do_fetch fails due to checksum mismatch
> 2. After fixing that, it fails due to license checksum mismatch
> 3. After fixing that do_compile fails
>

Yeah, because when testing I accidentally included the existing
python3-dtschema from openembedded-core instead of this one. I didn't
see openembedded-core already has it so this patch can be dropped.

Bartosz

