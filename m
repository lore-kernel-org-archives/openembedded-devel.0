Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8D76CCD18E
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 21:07:16 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.591.1760476036233897966
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 14:07:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dp5+aP3T;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46e430494ccso33596805e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 14:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760476035; x=1761080835; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uhl/z26iKOWO/UdPy531Hahe7KXo43AvtWDshLNqndQ=;
        b=dp5+aP3Tci9g26iDGDWVBLe18lOwcb4ys/8Cc1ss1W1Qo0y6zHT/usQGa/nbkyzFya
         S22HMWTMOgFRKvDbkpkDDRSgAM5kZ7CKnOPQ3DpIUJ30YY9s0Gf35iM7JxTG9l99i9LE
         r9XdUvLREXxHLb4MQATHLQwzBHv3pfqHBVDggJ9f8f3ZpGuj0YzmqBQqDYHH77e4WlpE
         zJYRATafYA5KKXZKFbeZF3qLLAeTQtSDSwH4Y7J/8/S/t4T0Mt4vj8npRwxBi8fZVcRI
         z0D4lYw0YcTVgvW7nGCF6sQOFqto38jUMd+trN4lfHCbvXOcxRrb83inL2doDnZnK3UD
         aGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760476035; x=1761080835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uhl/z26iKOWO/UdPy531Hahe7KXo43AvtWDshLNqndQ=;
        b=idp7mIuB8tAHAq6qInHb2d/7b99zAKJ5yh0y2C73cPvCGtQMpmJU+RglVjvg/ugu0w
         hjxdq1ILfJb+L0Y1Mz7KSFkIHY+DxnsDs02hR61QY7Y2W+WeKFQ61Ces8RU5bnrh5Yr4
         sgezBMNXebC2ofUCid8NUMzLeeW2bZHhYtWGif1tupoL7kZ7kPwb/LySUCTVtqlPmM/0
         sIqy3VW4DhuzBaeln3PuVP/JdZSNxs8y2ub8C15q3qWVl93IdRlpU7fSou57+oavU7bI
         4v2SFOahaUM4KbkvZUgnc7kJiDYcHJ9TxT3cWL5eeP3Dz+FQy6vyW+yrDUcReSgXGPfF
         lvUA==
X-Forwarded-Encrypted: i=1; AJvYcCX/5Hmvz7LSnvfTMnL9E5G8PLzp5d/mxPzOv++ZdwN7EkEKviTm+UefC8gih8LYCJcsK5LaotazKbDkWsQAF3m9GmU=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxgxthhRepvGGwu1fGYtGH6QhgsZYAA9ANLik4EZq3y+qNggeOO
	m0hp47yOndDlcTqety/xrVvVZBmeB8FaoO+OomLWlJ9Jck+qxgsu7OQr
X-Gm-Gg: ASbGncsmmwKX7JwpTmD6k8Zr1/7F7Yls6he+raKk4Egs66KAYAzjCwnCOvkuCmj2UCe
	GzdtaROXPqzSnxROxkXJ1d2tDjbc42Ob6H7jmTp72RH+iYQCrRNCxSphtgxKaUvP1BfNCX4c/r8
	jhIBeZeqlyDqj0JFv4vHmIiZCxTmZtpMJ0BJ9X1jIZS6DTaZiYt+fWzejyfIwRMwSsW4zac75uP
	dwhSAtHghn5MP0ySpV4Tl7zMtdnFxp28rH7ISuwJPeq30p0y4X4o2ShAJ+6B/NZeuEODZ1kaDp3
	QHM8iblDgKkta0JtV28Fs1wWPFCz1tN1as2S70L9IS6TMSueTh/wNcMEgJ38qcbsiB17Bgus526
	2JsTCWkhLNLnTeev8432uExyVY76IJVKH972DrOwllQmXqwsPdA==
X-Google-Smtp-Source: AGHT+IFbTU4k3HdPqCxe6zF5s/FSxw/ca6ArOoBe11nkkiU8TmcTwEC2RxXLdutHfNTOLWoXLiUY7Q==
X-Received: by 2002:a05:600c:a47:b0:46e:45ff:5bdb with SMTP id 5b1f17b1804b1-46fb4816974mr133141185e9.8.1760476034414;
        Tue, 14 Oct 2025 14:07:14 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab36ed3bsm172124285e9.0.2025.10.14.14.07.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 14:07:14 -0700 (PDT)
Message-ID: <3c5e211d-f25e-4516-a59d-b082f5400482@gmail.com>
Date: Tue, 14 Oct 2025 23:07:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][kirkstone][PATCH] squid: mark
 CVE-2025-59362 as patched
To: peter.marko@siemens.com, openembedded-devel@lists.openembedded.org
References: <20251014203704.585165-1-peter.marko@siemens.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251014203704.585165-1-peter.marko@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 21:07:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120652

Could you please fix the subject? It refers to CVE-2025-59362 instead
of CVE-2025-54574 - it took a bit of staring to see what's going on :)

On 10/14/25 22:37, Peter Marko via lists.openembedded.org wrote:
> From: Peter Marko <peter.marko@siemens.com>
>
> Per [1] CVE-2025-59362 is fixed in patch for CVE-2023-5824.
> That was a composite patch from more commits.
> When checking it, it really contains also commit [2] which is mentioned
> as fix for CVE-2025-59362.
>
> [1] https://security-tracker.debian.org/tracker/CVE-2025-54574
> [2] https://github.com/squid-cache/squid/commit/a27bf4b84da23594150c7a86a23435df0b35b988
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta-networking/recipes-daemons/squid/files/CVE-2023-5824.patch | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2023-5824.patch b/meta-networking/recipes-daemons/squid/files/CVE-2023-5824.patch
> index 4946060313..6a58b56a9e 100644
> --- a/meta-networking/recipes-daemons/squid/files/CVE-2023-5824.patch
> +++ b/meta-networking/recipes-daemons/squid/files/CVE-2023-5824.patch
> @@ -8,7 +8,7 @@ Date:   Tue Nov 21 13:21:43 2023 +0100
>      backport
>  
>  Upstream-Status: Backport [RedHat RHEL8 squid-4.15-7.module+el8.9.0+20806+014d88aa.3.src.rpm]
> -CVE: CVE-2023-5824
> +CVE: CVE-2023-5824 CVE-2025-54574
>  Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>  
>  diff --git a/src/AccessLogEntry.cc b/src/AccessLogEntry.cc
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120625): https://lists.openembedded.org/g/openembedded-devel/message/120625
> Mute This Topic: https://lists.openembedded.org/mt/115760259/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


