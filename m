Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22EFCC28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 16:39:44 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.1145.1741797576755697442
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Mar 2025 09:39:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dSWvqIU/;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ab771575040so213602566b.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 09:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741797575; x=1742402375; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Dr1MDyDQsGP0fniHjRmZwi5+c+l+mR+RPtDS8prI18=;
        b=dSWvqIU/Ra+zit5AAnHcH5Qefp86GNBWKP4Ae/y6nfa7MvTD67bjbqiSj01tKdkjWV
         snYTQmzA4RZJIn8tYBLEcJMsQJmK1CLXDrd4WL+DOKJAl8ckbURdITCKyGeRCRnY30SS
         nh6HTB+BJ5E70za9US06gueG1vd7lgMusGE6ixIeXVr/nIMhP/QAR/PVp+QjvyNV26Gg
         jQRfJ2eIJ3mc4f7z3Onyarv8EKD6U0/kcUqD1Piw51V/rbTOnwZ3AOVaMJa/4+jOrHgB
         3N4wogj059TSfgsEI5WdOONZDc8GhDecB9Tm3mTYjNKQMRx4dYdx4TQh28HgoDlhu4Hn
         By5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741797575; x=1742402375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Dr1MDyDQsGP0fniHjRmZwi5+c+l+mR+RPtDS8prI18=;
        b=Da7S1Ms+j4BclWyLiOu+Co3v+8xlCRmo3fmehJ/qJHM8A1zgwPlM5gCF6oTXs3bHtv
         B/yKWU92K9V/4OX3Vi0dXf5zNDdzKhXNY9oiL9KoNOXLF2oPAwJsqDhZH30fUkanLhc5
         mNkm+dFUvrP/fneQgP6UcDf0DO0+/RkZSQPze/AWMfB+zhYWBYu00CWpDJTd98/TYDz1
         B48bKfxYzXLGRmadHKbbIlv37olyjycPsqU/C8+W7VD6BZsgJBvVdka09Lop80lbsxZw
         Q82KL+rhSjFTaX1O6Z6ByVk/eFezrZ9/yS770aU39tBgWn2MtAHLMnsRUaNkCAV2Jopy
         ig+w==
X-Gm-Message-State: AOJu0YzUZg6ziP63LxyLT5CrPi/GrYLay4SPX4fdBesy5ImYf+g3Qt2G
	vEw5NIkUNEeF7Pp3jM6wvT6KJ+gBaN8bF0hYrvOVACbf7j0zRNEM
X-Gm-Gg: ASbGncssNJyWkKXNV3E6CEvrUWXLJIG2xdjoVHp8SVyKFSHbtXs+1PG7F3DGEMQbUSI
	xQ4QifO+fBs9VljFdrwe+88hyYJMpzmN1AmQbq/s6cYff86L6iqMDg9xtKK9zoEo/R2ZOCDEBGN
	2FX5r5qj8Fz35OBddn8JLTPdhWb2kqAtLbeogIrfneQLyFfWdDBtH3ThqKix+SPkWGJ6A/El5IW
	U0Sk7uLD1XjlgA75WTtdZI+drKeuscgB8kOAH6kkokGfaWQPCs5jsl325BBRYvIq2sSFAfLNzsf
	Y73W7M25bDdpum9u65nGbrvY3qovcIakuf2F+pGD/+8oQdm+8h15IUFwa3Co2jY=
X-Google-Smtp-Source: AGHT+IGqUvt93yOKWrBv3nP61FwNocObvR/pqZ3oUF8K5pMzwkKTqAD3SGHTXTu393d+wegqjHGxuA==
X-Received: by 2002:a17:906:478a:b0:ac2:f24e:1fa3 with SMTP id a640c23a62f3a-ac30b63a5famr24817866b.20.1741797574797;
        Wed, 12 Mar 2025 09:39:34 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac25fae7d83sm905736966b.99.2025.03.12.09.39.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 09:39:34 -0700 (PDT)
Message-ID: <130308e4-b9c5-4e6c-97d2-c36f9edc1f43@gmail.com>
Date: Wed, 12 Mar 2025 17:39:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] meta-openembedded: flashrom: Update to
 v1.4.0
To: Naresh Solanki <naresh.solanki@9elements.com>
Cc: openembedded-devel@lists.openembedded.org, linux-kernel@vger.kernel.org,
 "Signed-off-by: Patrick Rudolph" <patrick.rudolph@9elements.com>
References: <20250312111915.2970032-1-naresh.solanki@9elements.com>
 <66b24018-0b7e-42b6-ad86-d80f37538678@gmail.com>
 <CABqG17im5hO7xv-r16mFhJwcXyXt-6OKA_vTaRdc7kuQrdZyzA@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CABqG17im5hO7xv-r16mFhJwcXyXt-6OKA_vTaRdc7kuQrdZyzA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 16:39:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115930

On 12.03.25 17:03, Naresh Solanki wrote:
> Hi Gyorgy,
>
> On Wed, 12 Mar 2025 at 19:47, Gyorgy Sarvari <skandigraun@gmail.com> wrote:
>> On 12.03.25 12:19, Naresh Solanki via lists.openembedded.org wrote:
>>> -Upstream-Status: Submitted [https://review.coreboot.org/c/flashrom/+/51960]
>>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> -Change-Id: I55c4e8529d36f0850dd56441c3fb8602c5d889fd
>>> +Upstream-Status: Inactive-Upstream
>> Is that really the case? I mean it is just being updated to a new
>> version, it doesn't look that inactive. That PR seems to be abandoned by
>> the submitter at the first superficial sight, is this not the case?
> Yes. its being inactive for long time.
The last commit date in the main branch of
https://review.coreboot.org/flashrom is "Sat Mar 1 19:19:16 2025 +1100"
- less than 2 weeks ago, with last release just before Christmas. It's
not as busy as Yocto, but doesn't look abandoned.

Or am I looking at a wrong repo?
>>> +
>>> +EXTRA_OEMESON="-Dbash_completion=disabled -Dtests=disabled"
>> Nitpick: Could you please fix the whitespaces around the equal sign?
> Sure.
>
> Regards,
> Naresh

