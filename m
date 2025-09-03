Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D83C0CA1011
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 16:44:03 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.17663.1756917840408531319
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 09:44:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G2ayWQ2B;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45cb5e1adf7so1401615e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756917839; x=1757522639; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FKvtgrHZtas9Pkpov0R7b1CXJjj/ZjGcOF7ubulIYYg=;
        b=G2ayWQ2Bc2/6ul3qQxGY7qcK6DkznFPAdrZtJfTUrj6Fe+CxvyT6C7UDtJxwR+aD9C
         IL9VMYxgMDcCltAfkiDFsO+WbiCrhY7vlzIjVGjPYiXSS6RCPOSmEX+mw5BerPD+0UvB
         lIEV6ce3Ok5JgILdR0c3aaw87oCNqET2iOu8M9IXTxdUNRnr2dv+LyZhHXbQ1IcvVuhP
         YwsD81/w1oHDTWG6mbDUoZJEqCphFGS9teZ0vAQCNwo6RPt6xJvhd3OuPiyE3Wa3QB5C
         e8Vkh+4lid82MOurjiNk3kIXR2h3w9uX42NR67CuXVbJaazNWAQbrhXvWZ5LF827XPLu
         AOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756917839; x=1757522639;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FKvtgrHZtas9Pkpov0R7b1CXJjj/ZjGcOF7ubulIYYg=;
        b=wx1WoRtd+y25A8xfkidEHIqc/SOmka4i9792hgut+3oekBJLVh2AuAB8qPbtfBdYsZ
         tMWybjexoDpf3VBpEqj7LysTd2niEw8P6z2O1nsqOfAaZeD8pSh806dJsgG5GoorARzx
         LOqvAN1SRej37cz8U9IRt1BCKrkSnEZhxF4tfalTHASP71oc5fYAcuSBAIVLYcHP5tSs
         wVHRb0QHufE7gVkoQ75r6JLiqyiRqV4YYFuqOAxUQv3tqEHguijObYzsFd8b9FxQvdb3
         GFgR85Fea+VvbL/kNPUQZUtJe5RcG50E3VAXn73Nr+/D7E9X74WHCpBq2jwIRcCeHwFk
         N8xw==
X-Forwarded-Encrypted: i=1; AJvYcCWgq+hG0367LgZuD34BOq5C7LF0wXhvY1ZIVxlKxaeRIJg39JCojiJQZ1m64/PveLIaWJk9cgkKCw+ldga1rdt3eOo=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwwV9v6qb8xOvbebFx7WCKK5qwT7v3cu3sCIeMPbonoCSfcwtFU
	tuHnN+1ZUbCa5f0b7pG6Zrarkv+KhchqXfVj3uKSIwjJAcfUZUxPFk9V
X-Gm-Gg: ASbGncsAChv2muIwjs5yxGPqMyJtFDcASR75NQjDFQD0h9t5g+P2627ofw+rnOgHbgF
	8WAWeAyK0VKQ5Urb3PmXFsKBHGrcRmRUFdCa1Rsdd4KksuBe4VZMmqfjUgHukXAEuSOjXNVfqlV
	MM1ZljsYMYROhclfRFEEeNc2lAHx3ONY3/gggh9pGCxYCBNxPR+wb1CQIn8MGmHAE6JcWPc1GXP
	tiS6HcNvYaXvI1Z0xZJ7l2Kuek5LlMjI+GvKCJDPUaRjUHgYlfmFx1Qc3nWMbj0QD8isCHTOr1N
	jBKZKSQS8LepqqyOp1jE1y1blORPxSkhrNQnuo5ctW7kzaexE8RmZib0roxdRzWDi3EttaHCyjq
	fc/RvVaXpOGNGSS7BHO5aHMsW7PmV22jb2w+XyKsjVg==
X-Google-Smtp-Source: AGHT+IE/aqwTIzJppCNxlFT4eXCpaxe14QhLjjqgT+ucRtKwTUmQ5oiNMPIYUketq3GYDY2La3EC1Q==
X-Received: by 2002:a05:600c:3145:b0:45b:7aae:7a92 with SMTP id 5b1f17b1804b1-45b85570838mr127248685e9.21.1756917838447;
        Wed, 03 Sep 2025 09:43:58 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e7f14bbsm252444895e9.8.2025.09.03.09.43.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 09:43:58 -0700 (PDT)
Message-ID: <6bafd22f-4212-4256-89f2-1b9c14f8e958@gmail.com>
Date: Wed, 3 Sep 2025 18:43:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-gnome][PATCH] sysprof: upgrade 48.0 -> 48.1
To: psaavedra@igalia.com, openembedded-devel@lists.openembedded.org
References: <20250903160848.3840533-1-psaavedra@igalia.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250903160848.3840533-1-psaavedra@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 16:44:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119261

On 9/3/25 18:08, Pablo Saavedra Rodiño via lists.openembedded.org wrote:
> Changes:
>
> * libsysprof-capture: Clean ring buffer memory for counters
>
> Also:
>
> * Make PolKit usage a build-time option
> * sysprofd: Check that remote user is root when PolKit is
>   disabled
> * Make elf loader search for debug links in .debug dirs
>
> Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
> ---
>  ...libunwind-instead-of-libunwind-gener.patch |   8 +-
>  ...oke-the-commands-to-update-the-icon-.patch |   6 +-
>  ...-for-unw_set_caching_policy-before-u.patch |   2 +-
>  ...ake-PolKit-usage-a-build-time-option.patch | 154 ++++++++++++++++++
>  ...hat-remote-user-is-root-when-PolKit-.patch |  81 +++++++++
>  ...search-for-debug-links-in-.debug-dir.patch |  47 ++++++
>  .../{sysprof_48.0.bb => sysprof_48.1.bb}      |   5 +-
>  7 files changed, 294 insertions(+), 9 deletions(-)
>  create mode 100644 meta-gnome/recipes-gnome/sysprof/sysprof/0005-Make-PolKit-usage-a-build-time-option.patch
>  create mode 100644 meta-gnome/recipes-gnome/sysprof/sysprof/0006-sysprofd-Check-that-remote-user-is-root-when-PolKit-.patch
>  create mode 100644 meta-gnome/recipes-gnome/sysprof/sysprof/0007-Make-elf-loader-search-for-debug-links-in-.debug-dir.patch
The patch statuses look incorrect. 0005 and 0006 seem to be "Denied"
(while it seems upstream isn't against the idea, it looks the don't like
the implementation), and 0007 is "Backport".

