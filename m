Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01DE8C83F17
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 13:39:14 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.9078.1752154750638435148
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jul 2025 06:39:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PNtjxL2j;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae0b2ead33cso191526966b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 06:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752154749; x=1752759549; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cuI2kZUFc/xrZBNOz1AxqzlZrxUYMeA9kv5Sx/DsKuc=;
        b=PNtjxL2juyoH6a+Y2GkzfAKgCy37lzfnvKsHK7+bSZoXiSxSBjIHzC0v4+kW/kLs+1
         nnsicc+b1HI2vcLRv3Cfc8hMt94Y+pSfXI6Cpgcne2AQF+eStD2BHezPs2qUBhKWdwuU
         xTs/d8bc30NApCB+ZSwmie3E9H9laKMJ1g5k1j7kIc6msV3vgppoSPuuLbI1h24idN7y
         3L4OJlQunPILL/eM/m80gO+k2/1BL3FmkTHAWYZ72GA/jF1o2gbQwFSKrM7W1nIl6saz
         TFMFoKj8zh+HHx/JXYGbXuVlG6sCS6R/q7sw74NLN1q8v7QJJHIJ6Dzxmxi+vcSc89w6
         tAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752154749; x=1752759549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cuI2kZUFc/xrZBNOz1AxqzlZrxUYMeA9kv5Sx/DsKuc=;
        b=bHrCZOic1MiFqKUaJ0C8IZ45sdqbDiVkLiL/bKjpHAAZwEfRWkYBaq1Arg8Qf/rcme
         iOyBkuxYUWvYBFKmSeLeLkCtJPWRsoidRHh2SQan3ejZ+WEGZxCs7k2bu2PSGTSwtgCj
         3I7Q2Vw3tN0pTC51+Zewkfah0eTdisDBOX0Lk6ZPSWneOgMAPmeRqAvZ8bisdTybN0cy
         IFFYWhtlW2ldYZ2Fz6EgN36T8xw4gSlko+IAsjHx2UXMonDKM1nwNxeiVxsX1QF+oZxD
         fnRsnN1+OGI0v+6aXNFvEWw8nkjETW/Ho5k1QANYGnJNMBB5mOJq4XwK3mYEUTvkzblk
         xbIA==
X-Forwarded-Encrypted: i=1; AJvYcCWX44/uv0RvE9Ho0UMohn6OvQhftgWGt4EpiFe2pwzk3IMFgxHtUSlmwtgJ2H6TofdjlMnx9+z+d8pAehPkwZB/bsM=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwOCHVEsbhqbDaF8CNTTo9hmyQjcbn+C7DYcOOjMdFv3ypHYVsp
	8LvE+J/8UJzdpA9TXv/vy4WsQ7kbR9GsQ/cfOl2z/2QtUyHKpEAAadG5CGk0JA==
X-Gm-Gg: ASbGncspus2bb+ypXNqok+Zjwy02cFBcvk5XjAVHxJID27+mBnuX7uV4Wu7t+3Oesz1
	Is5l9fsmRMq7Nt6SeQA2q9aepVDMeY4OjrA11Eb/Lh+/5sHODRObjOpC8rQhrFBaIFMTUONyaHj
	z5qKXWDWPi1KB1Qkowj1edZ1h43lUiH/OeCp3tTEDEvzakOp+LQJbZGyUjmQyf92LYS9zi7/8GM
	gG0SwyF9FcvID2MfWLTJ3enJaqhEYtFD+rrT+WOBGgF5pV0LwhdZ3ifNwKp2m+v2DqW2nDS+4dG
	gsk0n0TRVAUXrGaSIStiRXM+zrGOO78/1lteecKEBXMFRzAJu9sLaITs67pZrlDsrWg/EJDIdnZ
	WDwbY
X-Google-Smtp-Source: AGHT+IF8G5NHGbtSkaPul5UxOKDDGPK8S25LaF2+aHCgFyToU/AZNkn+qh5J2R20KxNB+KdeOCLShg==
X-Received: by 2002:a17:907:3da5:b0:ae3:c72f:6383 with SMTP id a640c23a62f3a-ae6e23e76b2mr400872266b.17.1752154748603;
        Thu, 10 Jul 2025 06:39:08 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82645fdsm134639966b.97.2025.07.10.06.39.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 06:39:08 -0700 (PDT)
Message-ID: <59936fdd-6d0f-42bd-860b-df187b3c1b3d@gmail.com>
Date: Thu, 10 Jul 2025 15:39:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 4/4] srt: allow to build with cmake 4
To: f_l_k@t-online.de, openembedded-devel@lists.openembedded.org
References: <20250710111827.2550131-1-f_l_k@t-online.de>
 <20250710111827.2550131-4-f_l_k@t-online.de>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250710111827.2550131-4-f_l_k@t-online.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 13:39:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118414

On 7/10/25 13:18, Markus Volk via lists.openembedded.org wrote:
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../recipes-support/srt/{srt_1.4.4.bb => srt_1.5.4.bb}          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-multimedia/recipes-support/srt/{srt_1.4.4.bb => srt_1.5.4.bb} (96%)
>
> diff --git a/meta-multimedia/recipes-support/srt/srt_1.4.4.bb b/meta-multimedia/recipes-support/srt/srt_1.5.4.bb
> similarity index 96%
> rename from meta-multimedia/recipes-support/srt/srt_1.4.4.bb
> rename to meta-multimedia/recipes-support/srt/srt_1.5.4.bb
> index 91651fda8e..e252ad54c0 100644
> --- a/meta-multimedia/recipes-support/srt/srt_1.4.4.bb
> +++ b/meta-multimedia/recipes-support/srt/srt_1.5.4.bb

It looks that either the PV-bump is accidental, or the SRC_REV change is
missing.

> @@ -14,7 +14,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
>  
>  inherit cmake pkgconfig
>  
> -EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release -DENABLE_UNITTESTS=OFF"
> +EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release -DENABLE_UNITTESTS=OFF -DCMAKE_POLICY_VERSION_MINIMUM=3.5"
>  
>  PACKAGECONFIG ??= "crypt"
>  PACKAGECONFIG[debug] = "-DENABLE_DEBUG=1,,"
>

