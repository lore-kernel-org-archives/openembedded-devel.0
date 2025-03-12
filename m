Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8E02C28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 14:17:59 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.38136.1741789075953959586
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Mar 2025 07:17:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KS2lhiSJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac2a089fbbdso196837366b.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 07:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741789074; x=1742393874; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=59vSPNLq308aNbGzPWeKYH+js+aGLI09H1cADT2/MS4=;
        b=KS2lhiSJbygC1mcdCz4HSYDTKZmc4XVyxJe+boo/JcjjPuAbD0TehLjNxnFD2Vl8eX
         35XhopJpxSSxD3sPKHiEdSlrPRoVx9hqj66KKH2vuZ10FrRE8WvXBf1xz83htWTBdnuP
         FdM0B4Ll1leuNRfMeAqEDUeK/Lmw5+JsGWqDbBQlHGS09uwPGp1R+95P3q3LC7lViyHj
         1k2aTbFtqF9BYgDyvKW1V9mgLDhrINqKzb/aV7QLQgXHhB+O5AUMxNuUeRRpXyHuKwP6
         DoUqDx8ipyI5vxt9uWq4+Fg+wtFmghX61jTdTLZp1/Wrtjg0f95t8u1WIFTc9kx4BeL6
         WGtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741789074; x=1742393874;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=59vSPNLq308aNbGzPWeKYH+js+aGLI09H1cADT2/MS4=;
        b=fqYeOXvuT09za4syZi02kLbcjCxW5A+7OIcurZdEeki4dL7PVM/8QFbuWb3ywoOQz9
         70HN6ERwrvOEDUFDrMUY9RiP+/DqcNzmk+8LjGiUWjI3OYlYgcfq2ci6GI7MskiHQiV4
         N5uDGWZynBBBMfdDyhYWlCm6NV8HANLqBg1OTWaVFFxcIrBbsvrDtnkjkIQo8LxTnBev
         99RX/vCHyNkYjuoRa/OHeWDQQd2yDgjZFYXj+yb7sLkDstYwoCiLPi395/59kLa8mS6e
         L4rdPFshb0cty7hvKHE+06wfCddB7Os7ZAp0y31KHGi/pDdTTsX9AUkjudqFeCZr/PGk
         hEAw==
X-Forwarded-Encrypted: i=1; AJvYcCWOHhW6FbsVRCMjwQ/eQw4+1aqFI7Upq84yH24QkWSNAjl/taDDOztiiI2mf1hZQtR0tTkhxVkGAEZMK8KDtDFG+gE=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzg4R3P7a3A3zuPYT+WLOJJYUpufJMvC+LwOLVFOzPQNaaVuIOg
	txwoF95vFjhkcOFKCcu5VqBFHpLR8EpWe7sw5dVrvfMeMMqFgo9n
X-Gm-Gg: ASbGnctlWFtVXKCgr6BbPM2ZYQkTXZG/fsiRoIV5Br7RkWPJ/ZsLujyZNsPVHFQ2mFw
	m20AStLGKZRJu+pFsEqFHDTHR0ohGk7zJHZ3GzQRvgRfrt7gQyzyGejQgbVI4yqYMM1SHFbOpht
	IAadHrCtoHmoLxuQjwf2czAPwrBUwzC431VMtjxxjDGMEVMUWHjQ6ytjlbCWISSEyisYmz54GmG
	A4eAZiDr/1wA+YgE0l+zYOqMsTZgjKYIKlWVKETGHiuX4djOPBqSu01NEbvML4WGzwjhggYR8oN
	wfZo8LajU0j4fz6r0/qN/Eq42CSJKhP2xIr3SOqFvR+dozRoetNu
X-Google-Smtp-Source: AGHT+IHF8jx5vstYtsV2pEXC2X3/PEa+0XR1UF2mXA9eUosDbBGZ4jplSq4pv81t+MR3k9khbTVqxQ==
X-Received: by 2002:a17:907:3e8c:b0:ac1:da09:5d3e with SMTP id a640c23a62f3a-ac2ba4e2200mr1088240966b.12.1741789074048;
        Wed, 12 Mar 2025 07:17:54 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239485bf3sm1094079566b.63.2025.03.12.07.17.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 07:17:53 -0700 (PDT)
Message-ID: <66b24018-0b7e-42b6-ad86-d80f37538678@gmail.com>
Date: Wed, 12 Mar 2025 15:17:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] meta-openembedded: flashrom: Update to
 v1.4.0
To: naresh.solanki@9elements.com, openembedded-devel@lists.openembedded.org,
 linux-kernel@vger.kernel.org
Cc: "Signed-off-by: Patrick Rudolph" <patrick.rudolph@9elements.com>
References: <20250312111915.2970032-1-naresh.solanki@9elements.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250312111915.2970032-1-naresh.solanki@9elements.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 14:17:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115927

On 12.03.25 12:19, Naresh Solanki via lists.openembedded.org wrote:
> -Upstream-Status: Submitted [https://review.coreboot.org/c/flashrom/+/51960]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Change-Id: I55c4e8529d36f0850dd56441c3fb8602c5d889fd
> +Upstream-Status: Inactive-Upstream
Is that really the case? I mean it is just being updated to a new
version, it doesn't look that inactive. That PR seems to be abandoned by
the submitter at the first superficial sight, is this not the case?
> +
> +EXTRA_OEMESON="-Dbash_completion=disabled -Dtests=disabled"
Nitpick: Could you please fix the whitespaces around the equal sign?


