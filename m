Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE34FCEE94
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 12:05:32 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43802.1772021129943725344
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 04:05:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YbF8tgli;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4327790c4e9so5014247f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 04:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772021128; x=1772625928; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=908F9KR0w5Px0RaIat/vYAdCkSQJmBTz8aHlPoF733M=;
        b=YbF8tglivyzrVKxKw33xaLArqTqjS8zZg82ePklNutnm44sJTAa4y/EzXnSXrNQxk+
         VLq9x+R9Gp6F3AQsTxHsvddK2o+dDCw33x60A8xDdWLCFWIoOSPv6wSZH6UiIfHjHGfQ
         4DP3oD22KLfklvzjkCZUfJZL5EGgWzNKuXVluU1KnaCDh8ABTXHD2+rUZA5YX1oeGHD0
         ljvafz3/Si2czghmTsWqXbXM33//Vq3vHWRMTE7xCNk/rT9RIHcP/JGNjBuU53cn/F/Z
         TumijqrLVcMXKNf6HabwOStmLqMUBFBLEnre3F1QxXZYKyIjEm1lmeeyqpPfpxuc5dQQ
         /l4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772021128; x=1772625928;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=908F9KR0w5Px0RaIat/vYAdCkSQJmBTz8aHlPoF733M=;
        b=hsqOkddCYtezhjbnP+/RdbsJDLpQpH9Y4czyeS8gfVBoTZrRtGjgng6sMwPbg6wlLi
         L3D5n09tUjz53plY4iIpTCWsSCU3a6x5V7yfuXdJIdlG5DirNVtIV1M8ocXQK1g/+Ncm
         ohoJIvxkSc6KkdK6aaQeYdy5flIOQ0LIU249BQuqeXadO+VmJU0bImIH/2NemRkbHuvI
         IVSdQTX+OxTMCpw1xyOiHAG2zRUMzCdJ6TU3N/9KQSh1LXKbxCj6MxAGYXDK8gwRgpdB
         hvF4h1Su7v5S0fLeIPOF9PhuoeOf90XK/p+2WWDrDkL6aUIoKTWmmRkcQiDjodest7bn
         HMsw==
X-Gm-Message-State: AOJu0YyXF9ZpUzhJHCCR04Do073FioSHwylKEZCQSTCW5/Zu7DK09kA1
	KRSAvn61+s2Pux8gOg3PgCPfXSQx+m8WC7ndiLg2SiuR6wWsL95TTVTFECMaqQ==
X-Gm-Gg: ATEYQzwDOXBMyXkVzeXElo8mtAuiLgwvbA3aQ6PYsf6z4qTLS36Uw+2B4HiEtTRIHCn
	pBOXmaFi/9XrOely9PAyUuhWMtz9RQgUAq0iqVDSy9kCbdHPaJXSABxs/ipafk6o4UUp2xgQJzp
	Ha4knnI9v5v7MmR3KJayrX6bDowsa3llii5mbVQa7Rl8ue8HM5n8RazfJDdLsZGHrMMzM1lAG3g
	i+Fc/OdbEWgMcuACCgx9NIVxTS5r/JLYGwPPG6jNB/Ov53sJvIlONuPua64AgLTTjGfF/cFyZsQ
	CKDx+l9Gt2QU86yCE9YMYDGKsIIkD16yqwRRqH/LAw5Eqi/iUMUWaWn3M4ws2Edq9Sq5XJV8FpX
	OmZ3lELNq8YPJWO1aLp0ngubRuo+af1cwSdYKgvtd6xv53Q8OUqsfAEnJ/JbowRunv7cEpI5lrW
	nvWfCIQ+ZG+aR8tsaOrjOXrFeQMTDwdlXQnIXohTxCiQ==
X-Received: by 2002:a05:6000:2403:b0:431:752:671e with SMTP id ffacd0b85a97d-4396f173e6bmr23616860f8f.15.1772021128070;
        Wed, 25 Feb 2026 04:05:28 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00c18sm33119036f8f.14.2026.02.25.04.05.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 04:05:27 -0800 (PST)
Message-ID: <08f026da-7cda-47fb-984f-6a7c8103ee9c@gmail.com>
Date: Wed, 25 Feb 2026 13:05:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: CVE report - master - 2026-02-23
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
References: <20260223080942.2282331-2-skandigraun@gmail.com>
Content-Language: en-US
In-Reply-To: <20260223080942.2282331-2-skandigraun@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 12:05:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124650

On 2/23/26 09:09, Gyorgy Sarvari wrote:
>  - freerdp: CVE-2026-22851: https://nvd.nist.gov/vuln/detail/CVE-2026-22851
>  - freerdp: CVE-2026-22852: https://nvd.nist.gov/vuln/detail/CVE-2026-22852
>  - freerdp: CVE-2026-22853: https://nvd.nist.gov/vuln/detail/CVE-2026-22853
>  - freerdp: CVE-2026-22856: https://nvd.nist.gov/vuln/detail/CVE-2026-22856
>  - freerdp: CVE-2026-22857: https://nvd.nist.gov/vuln/detail/CVE-2026-22857
>  - freerdp: CVE-2026-22858: https://nvd.nist.gov/vuln/detail/CVE-2026-22858
>  - freerdp: CVE-2026-22859: https://nvd.nist.gov/vuln/detail/CVE-2026-22859
>  - freerdp: CVE-2026-23530: https://nvd.nist.gov/vuln/detail/CVE-2026-23530
>  - freerdp: CVE-2026-23531: https://nvd.nist.gov/vuln/detail/CVE-2026-23531
>  - freerdp: CVE-2026-23532: https://nvd.nist.gov/vuln/detail/CVE-2026-23532
>  - freerdp: CVE-2026-23533: https://nvd.nist.gov/vuln/detail/CVE-2026-23533
>  - freerdp: CVE-2026-23534: https://nvd.nist.gov/vuln/detail/CVE-2026-23534
>  - freerdp: CVE-2026-23732: https://nvd.nist.gov/vuln/detail/CVE-2026-23732
>  - freerdp: CVE-2026-23883: https://nvd.nist.gov/vuln/detail/CVE-2026-23883
>  - freerdp: CVE-2026-23884: https://nvd.nist.gov/vuln/detail/CVE-2026-23884
>  - freerdp: CVE-2026-23948: https://nvd.nist.gov/vuln/detail/CVE-2026-23948
>  - freerdp: CVE-2026-24491: https://nvd.nist.gov/vuln/detail/CVE-2026-24491
>  - freerdp: CVE-2026-24675: https://nvd.nist.gov/vuln/detail/CVE-2026-24675
>  - freerdp: CVE-2026-24676: https://nvd.nist.gov/vuln/detail/CVE-2026-24676
>  - freerdp: CVE-2026-24677: https://nvd.nist.gov/vuln/detail/CVE-2026-24677
>  - freerdp: CVE-2026-24678: https://nvd.nist.gov/vuln/detail/CVE-2026-24678
>  - freerdp: CVE-2026-24679: https://nvd.nist.gov/vuln/detail/CVE-2026-24679
>  - freerdp: CVE-2026-24680: https://nvd.nist.gov/vuln/detail/CVE-2026-24680
>  - freerdp: CVE-2026-24681: https://nvd.nist.gov/vuln/detail/CVE-2026-24681
>  - freerdp: CVE-2026-24682: https://nvd.nist.gov/vuln/detail/CVE-2026-24682
>  - freerdp: CVE-2026-24683: https://nvd.nist.gov/vuln/detail/CVE-2026-24683
>  - freerdp: CVE-2026-24684: https://nvd.nist.gov/vuln/detail/CVE-2026-24684
>

These CVEs are all for freerdp v2. In a few days there will be about 11
more made public.
Upstream has just released a new version in the 2.x series, the very
last one, they say that "From this point on we will no longer maintain
this branch and urge all to upgrade to FreeRDP 3.x."

It contains some fixes, but not all CVE fixes from 3.x.
Considering that freerdp3 recipe is available, and that version is well
maintained, what would you say if we dropped the v2 recipe instead of
upgrading it to this last version in this series?

I'm not a fan of shrinking the CVE list like that, but this recipe's
future doesn't look bright...

