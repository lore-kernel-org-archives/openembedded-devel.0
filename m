Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 272E8CCFA04
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 20:07:04 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5340.1762286823303580159
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Nov 2025 12:07:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N42UdvUF;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4775638d819so5737715e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Nov 2025 12:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762286822; x=1762891622; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PD1PaWCaOK+0UAM7lrNfACbRn9QcvhNtTuNFLN1uKpA=;
        b=N42UdvUFvAxmkZwK+rPro9SmLM5ZKWNW3tJHSMSZsLqmzFFpEAl4jUQG3oali83An6
         KniEVTDhwGwG4IR5iJLSNaQYLVFJdrq7LQYDY6JzOiyNwmATuj4fVrbhjcrxiHfSjmyU
         m8JaVuuqso15hcMdIcGQgwH8qCCZ92agU2xuFNpptSnERlc2rsTewQ1ifzQcR2+W2qkB
         B9j+u1fD1lBMGAwXgnMqv3oNlGPFQIltypxR4J1ERx1WaCGS5NGPP7J8f+PYIbNOdv+R
         BP87yEiq3rnoqGGjjYN1JnFJMZolQ5kNfB3cHUUF2vsq8zJ7tkMLbzlIb0tGPkgf75Iw
         AYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762286822; x=1762891622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PD1PaWCaOK+0UAM7lrNfACbRn9QcvhNtTuNFLN1uKpA=;
        b=dF6rCQUesaPxfueZoaN8wI61zdWzzp/suCDPZokoFOFNKzOjBKv5T9nFFDPbIPlNgD
         VkrQBdUAIIioXmbeFgTNpgt4SRU7xbIu7q+nnGYcndPwlHSWgHGv80Vs3COSOA4f4M5W
         NiSYa3wJOTOgTU2n/b+lNMmjjovquvl7C47cyAB1bkh0T9jMpA1bORen6aLpcJvES18r
         j5s7b/77xXjYplURVfklFLtsFC8eU0F6DsXuiktodWyws0f/CdYHhC4L4IJtPxw25w/M
         atrUUV5bSh559qswOs0DG5ar6BE8pcCCTrOZRI6uZEHSMZUo2YfE9FbzfUeIWrmU61FJ
         dqgA==
X-Forwarded-Encrypted: i=1; AJvYcCWzm9PhooHlBaMLSMRt60gYYYPmdkH+JyDRePzLhuiGohV8Mvq38JzZ+84ZcrWdH4r6JHllYaC6Tdtcjho9DPmv0kU=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyOomkw3JzqNyeKRn1ffOqcBd6uC4Uj5oQkMlY27HLtXGEBmTVM
	PMRvhRxVUj/jJVM/zvkBFdzHZtNbkZNAfcu/eV5JzUCB4Bsth7QnDA/H
X-Gm-Gg: ASbGncsAwGE0aOjzniAsQQrwQMNeXMZ54fM90wp+SEkyb6g595L9BRFYEOA7FwSW5nn
	5WyXSPZ/XbHKYQc3gVqPdIiFiZoxv/DCdLKyCfTL2ilBAZIUUTtTnGlWK3KKzjNggLfN1WzvobW
	eYJcbp8RkZskagSQLpNs10Z59rNSNQmNCh3XDxPMDVFehTbCsDXe04evxrlTYa8Mdmlf/EkaFnc
	mGm6dAyYxy9KDoYf2GFeVZX2VG/ywGxXbkPsQXFhjVXLGoY1pmEb/tY/8ZGys+Tvt9lAj3MVLGf
	dvrTb3r/jlkAn7i9EwaGfyGh82tVvOYb19SKujSSjrWf5LxavwCwZ99c0GKBSpuR/vK3lzgc2RO
	q+0oSRexKeLVzS5BPFqy+eOqMommhXq4nhsVdajfx1KkFBPQCAHeNKVzADnru5XE4Bp8LTQAkHN
	7R1YlFYr/B
X-Google-Smtp-Source: AGHT+IHIhkPw7cqj9Jd55VFJ9q2GpZKxTVz7oNw9fvVlMV2zwmnunzCKyvOKtBaliC8uXEDgnI4BBg==
X-Received: by 2002:a05:600c:46ce:b0:46e:74cc:42b8 with SMTP id 5b1f17b1804b1-4775cdcfbb5mr6122195e9.17.1762286821473;
        Tue, 04 Nov 2025 12:07:01 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775cdc2d09sm7601145e9.4.2025.11.04.12.07.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 12:07:00 -0800 (PST)
Message-ID: <16996f11-c1e5-4014-b3c6-8bd359be8ee3@gmail.com>
Date: Tue, 4 Nov 2025 21:07:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][PATCH 2/2] redis: ignore CVE-2025-46817,
 CVE-2025-46818, CVE-2025-46819
To: ankur.tyagi85@gmail.com, openembedded-devel@lists.openembedded.org
References: <20251104193437.1797870-1-ankur.tyagi85@gmail.com>
 <20251104193437.1797870-2-ankur.tyagi85@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251104193437.1797870-2-ankur.tyagi85@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Nov 2025 20:07:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121306

On 11/4/25 20:34, Ankur Tyagi via lists.openembedded.org wrote:
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Fixes for CVE 46817[1], 46818[2], 47819[3] are included in the used version
> [1] https://github.com/redis/redis/commit/fc282edb61b56e7fe1e6bacf9400252145852fdc
> [2] https://github.com/redis/redis/commit/dccb672d838f05c940f040c27b74fde6fb47b2a7
> [3] https://github.com/redis/redis/commit/2802b52b554cb9f0f249a24474c9fba94e933dbb
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  meta-oe/recipes-extended/redis/redis_7.2.12.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-oe/recipes-extended/redis/redis_7.2.12.bb b/meta-oe/recipes-extended/redis/redis_7.2.12.bb
> index 9016254731..6527fb6996 100644
> --- a/meta-oe/recipes-extended/redis/redis_7.2.12.bb
> +++ b/meta-oe/recipes-extended/redis/redis_7.2.12.bb
> @@ -23,6 +23,9 @@ RPROVIDES:${PN} = "virtual-redis"
>  
>  CVE_STATUS[CVE-2025-21605] = "cpe-incorrect: the used version already contains the fix"
>  CVE_STATUS[CVE-2025-27151] = "cpe-incorrect: the used version already contains the fix"
> +CVE_STATUS[CVE-2025-46817] = "cpe-incorrect: the used version already contains the fix"
> +CVE_STATUS[CVE-2025-46818] = "cpe-incorrect: the used version already contains the fix"
> +CVE_STATUS[CVE-2025-46819] = "cpe-incorrect: the used version already contains the fix"

I have submitted this yesterday, but why I'm writing this is because
"cpe-incorrect" is not appropriate status for this - cpe-incorrect is
for cases when the actual CVE is for a completely different software
than the one built by the recipe:
https://git.openembedded.org/openembedded-core/tree/meta/conf/cve-check-map.conf
- this also determines how it shows up in the final CVE report when
someone runs the cve checker. "cpe-incorrect" is marked as "ignored",
instead of the the more appropriate "patched" status.

>  
>  inherit pkgconfig update-rc.d systemd useradd
>  
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121304): https://lists.openembedded.org/g/openembedded-devel/message/121304
> Mute This Topic: https://lists.openembedded.org/mt/116123103/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


