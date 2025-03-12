Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E914C28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 17:07:56 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.38425.1741789779143282613
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Mar 2025 07:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@9elements.com header.s=google header.b=Wr6wU/VR;
 spf=pass (domain: 9elements.com, ip: 209.85.216.49, mailfrom: naresh.solanki@9elements.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-300fefb8e06so4163829a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 07:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1741789778; x=1742394578; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X8pxtdRpsPpZOYZuFTy8zEFwpuoZpgIK76UeyJOgRac=;
        b=Wr6wU/VR0vZFxMKTOHQarIwA29hM+Zs2EoW8/AFZV5XLzuAi2SfCuXufeSgSOiPIxl
         xKa11oi60A8WwyjiQndeVfxrDUZLAS95xPKiBjg4CR9godO+0mt4JxpYSDvBj4r9qW6r
         PBUoAJ7BA0DQxJFpeRUQFC4PJ6zTs6zyCYiWtdv3W4Ar4mYkwVl8pLgKkui+SW9Hi1iN
         AxSaWfe7iH/9X/0XHer7WBXA34fRSrpe35qd0Ll4vQG2D84K51cGQOsUQy4LhxW955bI
         qtMBEIw/X96PM8FO+0JRwrR9i8FsN0reGYXddDHMYslmVu+acc/tWXOaqinGY3WuVzGn
         f3dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741789778; x=1742394578;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X8pxtdRpsPpZOYZuFTy8zEFwpuoZpgIK76UeyJOgRac=;
        b=iXy3FbA2CHFHF21Ebyx+7l3V1/u+LhiO7qAu5FiKnNTxjjGoDAfxNRLaiugn8SqksC
         ulhbRp5UtpBYB8/L5couH9Olrff25UJBpu4fsvl31pH0gvUdx1YfzQX2tf2nPjE7pjLm
         O3nnwSsrsd8rM11wykkf5AgKF3TJkYyT9Ae/uItWmTLkmIZ/ZCIYPlICGHl0BNXPxo47
         igKiwxVPQtUUE5/olCBPDRybyHbpcKyJ3nN94jVP1JM3fTjxZ/5kZyvfxEHIGIlPCr5s
         7BEVNw+k6hGHk+zm9Jahbyjbt7OtxCK26Uwg/CexG36aK0xRQXShGDOola76iMqGuFbS
         N0cA==
X-Gm-Message-State: AOJu0YyXWYNDhKA0ok1XLRXDQjlhpT0y6IYHu9ODPH1jn0ZvLM38yvrV
	1jWMKndH1W+AgkFIk2p8kjXYF4WgR1/M3ADjcnZxBKMTBNihQ5I1VwhrlNVl1bJtPSiC4wCwVOf
	icBqXyKzg2ckhSXMc3f5aYKx2jYZWv8iyMb6TzA==
X-Gm-Gg: ASbGnctw1GCQ7pQGb+f6LKjDNgviqhtJO0j6tIPDcDgbkX3nxfklQtylDZQLdQqSDaq
	RH9BbEIkbbJcr6xCFOQEywNVb6Rvr99LDmBlnLFf5yZqx8QAxQhVsWGu7mSblnpXmIWePb5hOm/
	ryD5rbIDqmYstrE2VOh7hUEySTrA==
X-Google-Smtp-Source: AGHT+IETJKYtg/DF5Euhl3NEpsP7422ZyOmePKod/1vWPbnUODAPUSjHcLwOV2kB3kv1sQPyXi2rGpS6PKwXKU7JgE8=
X-Received: by 2002:a17:90b:180a:b0:2fe:9e6c:add9 with SMTP id
 98e67ed59e1d1-300ff105730mr12025199a91.18.1741789778465; Wed, 12 Mar 2025
 07:29:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250312111915.2970032-1-naresh.solanki@9elements.com> <66b24018-0b7e-42b6-ad86-d80f37538678@gmail.com>
In-Reply-To: <66b24018-0b7e-42b6-ad86-d80f37538678@gmail.com>
From: Naresh Solanki <naresh.solanki@9elements.com>
Date: Wed, 12 Mar 2025 19:59:26 +0530
X-Gm-Features: AQ5f1Jp2p9IbWmabPvZV0HmFdAOLWDdp8XS4s_j1FhPNtDYMwNYgUj9DQNGNhBI
Message-ID: <CABqG17jaPktHnQLqT_07xfAQaR=b5LOM+w_p3mHG-6PEG7NWbQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] meta-openembedded: flashrom: Update to v1.4.0
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, linux-kernel@vger.kernel.org, 
	"Signed-off-by: Patrick Rudolph" <patrick.rudolph@9elements.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 17:07:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115932

Hi

On Wed, 12 Mar 2025 at 19:47, Gyorgy Sarvari <skandigraun@gmail.com> wrote:
>
> On 12.03.25 12:19, Naresh Solanki via lists.openembedded.org wrote:
> > -Upstream-Status: Submitted [https://review.coreboot.org/c/flashrom/+/51960]
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > -Change-Id: I55c4e8529d36f0850dd56441c3fb8602c5d889fd
> > +Upstream-Status: Inactive-Upstream
> Is that really the case? I mean it is just being updated to a new
> version, it doesn't look that inactive. That PR seems to be abandoned by
> the submitter at the first superficial sight, is this not the case?
> > +
> > +EXTRA_OEMESON="-Dbash_completion=disabled -Dtests=disabled"
> Nitpick: Could you please fix the whitespaces around the equal sign?
Sure thing.

Regards,
Naresh
>

