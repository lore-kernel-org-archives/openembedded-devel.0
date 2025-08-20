Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE37CA0EED
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 07:44:39 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.14575.1755675878141743704
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Aug 2025 00:44:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XGIW1HGw;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-61a8b640e34so2480172a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 00:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755675876; x=1756280676; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6lOR/3QcrK4JaLgZ9+qHc5kFNiTO9WK3lc+cCjAelgs=;
        b=XGIW1HGw8Yq5Kf4DnVyMizmcDOVnFXYeiy/UC0IeeRU80Zar2PRL/q/MSAV/jMAcy8
         sKY1oyCOk77iMvsRiLupKP54KQySw6+RoxRtd8UpAz673sH/1Pf/DaPh00c1ubOZEkxZ
         FL7RmB4E87nfWkBY5i236EdApejBiSehfIgXaRVbpu5THriiGh+4PpiadRjliYtQpaVW
         ackFIkaPkPTBqdQyq9pPLWhx8EoDLAdsf6DopBuVsF3qKRUNBa4f/R0WjoxQd7YiUOZR
         h7JzxtMOvtJnzqsoR+iqUVBJ2isEFV/rLCsPtkAe77IohRryLR+7QQ8we0PAxj3K5IbA
         iv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755675876; x=1756280676;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6lOR/3QcrK4JaLgZ9+qHc5kFNiTO9WK3lc+cCjAelgs=;
        b=PVDJAhn6iAm84L737siLAh+SKf0K04Y3nj9+88kGhLmyef54VPzcGtoEzm0M9Seztr
         qA77g4QrWS1k5PW0F9oEDzW9ZftR/Zpx0UKDn6KoUHWzk6waKswnIvPFOApYQPu4Bhge
         rXHUcT9iVsnINKKvT4qnGESxXSaKvxDDb5ZVhkKpOvrSTqCMlhQxzNvTE+LcB/XTwdkj
         7ZxSFjeG2UbwPJnFKr5YIMyI71+3HRc30e239RAzTvWqIVrg9xTlQOMOwDev2zPoPQEK
         4g/gXbrZfx17+O6ikds3nC+YzxUbDzkm5ha+KHgd+1ydex/oCpAT6WKu/v9oQMcPe6RV
         +7MA==
X-Forwarded-Encrypted: i=1; AJvYcCXp44EzqTmt6NsykUDYiMyNBLG7pcyCXP1aFpHz+IUDNDJCvu71kD3PMPnzAtdK1DWjDEm+GCSjrqYJVyleTVNs5KY=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw5IHjuCiGSyWN9Eh1Vz4q0jaJNE+F/DnN/cM0Uz58qt6nU6Pca
	nhlIwCHVWdQgDyKL95jLi/qpcHFNY9QSYwuPe9XANmESKfAcWUeRi5iB
X-Gm-Gg: ASbGnct5ATvWiAJAj43nQcViHk48P67EyBost5aCw2Ax239ZFZBXAPS0Bh+wHo5wXso
	XHGQQHU4U9LfsTaO4d87j6QPU43f1uhks9n8TL/mk18B0Sr2JNQgG7CLY4UgY2oZ2h4mWFUCqQc
	sknTlQrceyqGSMPgAph8UgrGXnnsKz9exIHq7UPR+um6dNvkUIt2ddnHIUsrIqgdBhKX1bVdDGc
	L+d7h17aV+h7ekLmnI0QMSGHHMhTsoLZqR+sQYv6+vPGzIMvECJ8t5zDOEzWnYk6W0gNEFurj9k
	tXDPFoQ0+Obd3L2JOhrN71GQJF+N1Zg9ErwTsKoKJVbxttg/w9DUzkXG36KUPzpc5PitNflL/hq
	uvVJyvFAQMa+xiMQ7FMGh4UWzsUrRiXyalSRZRqI9+g==
X-Google-Smtp-Source: AGHT+IHWLA6tE9vN5VYWVIJ4dXph9t+ki2V/C102Abs4MrTvZRGOFEiZUV6avkURdaJzYf1knGxQ/Q==
X-Received: by 2002:a17:907:7b9d:b0:ade:4121:8d52 with SMTP id a640c23a62f3a-afdf00a71c1mr178999466b.16.1755675876059;
        Wed, 20 Aug 2025 00:44:36 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded2bc305sm131217366b.18.2025.08.20.00.44.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 00:44:35 -0700 (PDT)
Message-ID: <1d47e8eb-0753-47e3-9339-b469f2f141f1@gmail.com>
Date: Wed, 20 Aug 2025 09:44:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] kernel-hardening-checker:
 backport recipe
To: michael.opdenacker@rootcommit.com,
 openembedded-devel@lists.openembedded.org
References: <20250819203929.1272607-1-michael.opdenacker@rootcommit.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250819203929.1272607-1-michael.opdenacker@rootcommit.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 07:44:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119011

On 8/19/25 22:39, Michael Opdenacker via lists.openembedded.org wrote:
> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>
> This recipe is a Scarthgap backport of kernel-hardening-checker_0.6.10.2.bb
> in the master branch as of August 19, 2025.
>
> Tested on qemux86-64 and on beaglebone-yocto
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> ---
>  ...ject.toml-fix-up-license-information.patch | 31 ++++++++++++++
>  ...-relax-setuptool-version-requirement.patch | 29 +++++++++++++
>  .../kernel-hardening-checker_0.6.10.2.bb      | 41 +++++++++++++++++++
>  3 files changed, 101 insertions(+)
>  create mode 100644 meta-oe/recipes-security/kernel-hardening-checker/files/0001-pyproject.toml-fix-up-license-information.patch
>  create mode 100644 meta-oe/recipes-security/kernel-hardening-checker/files/0002-pyproject.toml-relax-setuptool-version-requirement.patch
>  create mode 100644 meta-oe/recipes-security/kernel-hardening-checker/kernel-hardening-checker_0.6.10.2.bb

Note that new recipes are only accepted in master branch, not in stable
branches.



