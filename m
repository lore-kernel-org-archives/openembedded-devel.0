Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF61CA1009
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 16:50:23 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.17818.1756918219827898533
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 09:50:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xt0Cpwdi;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3cf991e8bb8so101371f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756918218; x=1757523018; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SsjFqH3+yxR/krdoW0GdCAd/jNizT8kXzU0zYMNXZSU=;
        b=Xt0Cpwdi8QuA9H/Xgm+DWNOYTrTqDRxTsANEhyxs7LhBW5y0YMjCMOUaEdf28Cx+SZ
         r5c+HSAg3miPMV3Jh2YLTAeFwLFTDKptXqlyvoeLxwhICVvctOHHNqWrN/0vMI5b9QBF
         3Y1tA201gYDz83Vf4dl+s9r4isYxMvxhQ/+SNcr2QOWWxN4TaM0Z+IYJBncFS+f4Ds/h
         Y/GfVRAbkDTmgcMRnO5bDonJ7dEDsgw3IX8x+AI5+L1U8kifoS02rv1CKDSf3LEa4swo
         vAgWb77l0RIMUrL0zJaZjdBMsPAAA8i3BbC6I8N5e65w3LqML+dE7sJO/ttAtfT6RbuD
         kjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756918218; x=1757523018;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SsjFqH3+yxR/krdoW0GdCAd/jNizT8kXzU0zYMNXZSU=;
        b=kBo3DwWJYdMhksDPMVhF94/TJJ4N98T8CPXWoKhCyBdRgg2eyNppKzHSGgGdOlICR/
         ixrnK5b/zWYB8FVvD84EqjizkuOutDABu9WJXDIWDFI99j6u5Ki2wV233ehVz3upvP7p
         869SirxQyjZz1hIhlM9ffaKFHKJDeeSRXOTONx6YW13EKn66Kbm+tqtMDrkUsIdK+TwL
         UbZSCO46HcjoGJpVlWKfQoCSv99PiLV/GxGgqiOa28X3K+dfTxDrYgiBGSFHOzql0hu1
         eYcmgOJPuXnNr/R1tk9/Zr7sBCtGyYZl0TPT4mhNhLzyxqbjlQrDQXGjwseL2RR1IBWW
         2WdA==
X-Forwarded-Encrypted: i=1; AJvYcCUbHvmCenXQxOjWfQhcDyq3M9Hxoa491aXRkphD4ReK6YTsxoiO7r6Yr0pU3Vr+b1eDDcpSYrRJevXhkWjqmZmd04k=@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywnt3+Q1TRBWmdFknDeCu92oOAk1ndc1FT47ri94vX/dVF41X0y
	SWhFwrkFigGUdkqpqQLIkMjS+avIdHS9HkgTkhtaJUKK3VYTCOKnW7nd
X-Gm-Gg: ASbGncsV7gtGc8O6HqbnRaZxXngDj2llpqpIQMYuBd7K+YNzHovubRtUuV9PYMVFAlc
	BCpuGcXsiQbSZC06xhp6W+VliVNF668S4ykuXc9WfBUI5RZq2pljA3ERinch4MaQS8dNfZ2rsdq
	ZbMY4VrYIfTO1+sbd2ha2Yh7wdUjVCoPwTWUfNb0yZkZgjG38OzbvG+bFqqXJQUfnftnY1NY4WA
	YAYb757UIrqHYNr60h08UGI9QSlCIEnYCAU5wwsMhJqRrW6xkI4xzX+/2kzuMPfZz5xx8ddbGT1
	8KMGUUWmTguwtVxPSBm2zry4RRXm1o8XpbYM7Xd0rMO5eTrI/Z5MnLHcxy2qAyIBuA9/pqcPfUt
	eglsrYkP1TVYgBwGoex6GqU5gNJmP+bA=
X-Google-Smtp-Source: AGHT+IFak9BKsDHUJ3VEyt9+lU9XrJUZPTel/yOxDNwedoWrkhf/eaEXxMy2Klmy8idpa0O0yatLHQ==
X-Received: by 2002:a05:6000:288f:b0:3dc:2912:1599 with SMTP id ffacd0b85a97d-3dc29121722mr3267875f8f.48.1756918217901;
        Wed, 03 Sep 2025 09:50:17 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6dc1sm330079335e9.1.2025.09.03.09.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 09:50:17 -0700 (PDT)
Message-ID: <d2ad629f-b190-4b30-8745-f2210e802ba6@gmail.com>
Date: Wed, 3 Sep 2025 18:50:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-gnome][PATCH] sysprof: upgrade 48.0 -> 48.1
To: psaavedra@igalia.com, openembedded-devel@lists.openembedded.org
References: <20250903160848.3840533-1-psaavedra@igalia.com>
 <1861D377B6A35864.8194@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <1861D377B6A35864.8194@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 16:50:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119262

On 9/3/25 18:43, Gyorgy Sarvari via lists.openembedded.org wrote:
> On 9/3/25 18:08, Pablo Saavedra Rodiño via lists.openembedded.org wrote:
>> Changes:
>>
>> * libsysprof-capture: Clean ring buffer memory for counters
>>
>> Also:
>>
>> * Make PolKit usage a build-time option
>> * sysprofd: Check that remote user is root when PolKit is
>>   disabled
>> * Make elf loader search for debug links in .debug dirs
>>
>> Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
>> ---
>>  ...libunwind-instead-of-libunwind-gener.patch |   8 +-
>>  ...oke-the-commands-to-update-the-icon-.patch |   6 +-
>>  ...-for-unw_set_caching_policy-before-u.patch |   2 +-
>>  ...ake-PolKit-usage-a-build-time-option.patch | 154 ++++++++++++++++++
>>  ...hat-remote-user-is-root-when-PolKit-.patch |  81 +++++++++
>>  ...search-for-debug-links-in-.debug-dir.patch |  47 ++++++
>>  .../{sysprof_48.0.bb => sysprof_48.1.bb}      |   5 +-
>>  7 files changed, 294 insertions(+), 9 deletions(-)
>>  create mode 100644 meta-gnome/recipes-gnome/sysprof/sysprof/0005-Make-PolKit-usage-a-build-time-option.patch
>>  create mode 100644 meta-gnome/recipes-gnome/sysprof/sysprof/0006-sysprofd-Check-that-remote-user-is-root-when-PolKit-.patch
>>  create mode 100644 meta-gnome/recipes-gnome/sysprof/sysprof/0007-Make-elf-loader-search-for-debug-links-in-.debug-dir.patch
> The patch statuses look incorrect. 0005 and 0006 seem to be "Denied"
> (while it seems upstream isn't against the idea, it looks the don't like
> the implementation), and 0007 is "Backport".
>
Actually re-reading that conversation for the patches 0005 and 0006...
does this work at runtime as it should, at least in OE?
The maintainer does raise some concerns about some credential call
always returning NULL, which sounds scary, though at this moment it's a
bit over my head, gotta admit.

