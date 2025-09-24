Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF742CAC5AE
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 20:07:00 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.24017.1758744411848778748
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 13:06:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RNrgM0RI;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-62f24b7be4fso398725a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 13:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758744410; x=1759349210; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bn6A7a8FYFNMZbIii4OG26ny404otgNbGJTtxjRBRCY=;
        b=RNrgM0RI4X5yBhO9jHt1MJVxtRxk15UrcTkF03WY7TDZkjsVmDNECZV20n+eVL6J4P
         S+E1yuzDTXj57lULJxG3cIeVp0a0DOpZ6+l98aQ9i09mxnYDNYxpVGuoZ0FdRarGXJ9f
         2C6kT74ShGNkk1LGDPUaF074gfe6E2SU9FqBfzGwqE44ifFT5jLeae9pAoWx2LKV/7UD
         ScWoXL9VGRWFkHPq2hxnuNu77a8hg1ALy0afkwu898B9sDeIHXRPh/kuoX+S3m/5jYmd
         Uk8Nhjcrdl+mJZp/EdGabeaBL5vVO743HoMMGEl6uV03F9sRn5ClIsUTVgDYdvbYNHQm
         QAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758744410; x=1759349210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bn6A7a8FYFNMZbIii4OG26ny404otgNbGJTtxjRBRCY=;
        b=OPoUP0j6IMV92440qJEukTAg1aCA4tQR3wg7MyJsmayz9bfPhM1YClIoplWsoENCqI
         xOkZ4LttrmvCcMMdeCmfN4nTHrv0ktfB0h3xg19/Z1Wpt3tiYJlGqYy9EsPVjXYGuKPn
         q2UN7Isr/gkJmfqPKt3zH+Q8ANY+POKI6/2d1bxTYts5iU9K/FOT2QBuuIEpuRHIPHYi
         eaXjMg1vJTrLjgm1RxwmmFBxE0uH+sr3vrw224m/ZmfqmD/8INIWbasQeITIN2mC0VEK
         TiTssvojaRtonoBNV5Y0dtVgg3NGa5CBhNdK6xqdOhd/+V7IPLJvibH1dV1+nQbbgg/h
         rqPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxDXaKt/TqiB57Bp2Ydn22E3FNriB89ONDBAY1+0PDVW49dfexAOFEzrBP/+VaQVSwCkvaUsNz7Wp3WWm/TmmXTI0=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yye9BTOp7odMDOVTiLUy5X/RBnzk2nscXvEAPCplMeJ3tU0mo5U
	PdQAR1389mKRERe0MqTQwWEdVMvZ7/rqUAAgGoviS3GpxnmLkJe2EHf7
X-Gm-Gg: ASbGnctKDlVnsVF2AMeUNk5su2yK6oziIzQmiYV1ma96Hpb+HPGI2IqsXwhPurVprQy
	7EGZ2nT5V7o1G0HeO5LxjOCTLdvXes6YUMtaYDIeX6EPnSBIg1Tv96F8XHKmbXTiWvWCjXE0BLs
	Mh6qfhmTZVIf5m/UrarFyS+2qqLfQqmdjLZtI8suTrCRt1BudGihvEQMI4R6XeTSepSIQxhrfxk
	EvlkxNu1vpUrBqP/Ba/P29c17zCj2lEVvuwpt9pXFXbo6p2DoktwC5NyHLP4RExIkXLYv8WTGpn
	FNXKUuBcpKVLqINVOGgr3qIt/Op1Vqv5mgRXCCiqgl5VrQAQE7HMuWOUJ1R+qlJrqUl9aFVH+Gw
	ggv3Cne+dLi0b1uLlPOZj5Xe1eTdcxyLSGXDjVC2mvQ==
X-Google-Smtp-Source: AGHT+IHNnuy4uJdahH/ng/o4Gs1RyaE8yKVF0GzqyWxkb9ySbivgHJ32IJ+ViSPkmp30anHnURSyBA==
X-Received: by 2002:a05:6402:5243:b0:62f:760c:345c with SMTP id 4fb4d7f45d1cf-6349f9f56cbmr644793a12.16.1758744409942;
        Wed, 24 Sep 2025 13:06:49 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3629cb2sm27209a12.11.2025.09.24.13.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 13:06:49 -0700 (PDT)
Message-ID: <dca664b0-a6fb-41f7-aba5-5cadc39905a4@gmail.com>
Date: Wed, 24 Sep 2025 22:06:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [walnascar][PATCH] cjson 1.7.18: Fix CVE-2025-57052
To: jeroen@myspectrum.nl, openembedded-devel@lists.openembedded.org
Cc: Shubham Pushpkar <spushpka@cisco.com>, Anuj Mittal
 <anuj.mittal@intel.com>, Jeroen Hofstee <jhofstee@victronenergy.com>
References: <20250924194549.1753501-1-jeroen@myspectrum.nl>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250924194549.1753501-1-jeroen@myspectrum.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 20:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119840

This has been submitted for walnascar just a few days ago:
https://lists.openembedded.org/g/openembedded-devel/message/119628

On 9/24/25 21:45, Jeroen Hofstee via lists.openembedded.org wrote:
> From: Shubham Pushpkar <spushpka@cisco.com>
>
> Upstream Repository: https://github.com/DaveGamble/cJSON.git
>
> Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2025-57052
> Type: Security Fix
> CVE: CVE-2025-57052
> Score: 9.8
> Patch: https://github.com/DaveGamble/cJSON/commit/74e1ff4994aa
>
> Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> (cherry picked from commit d9e2cae64f4f7d7145c8389bc2406b5865d12893)
> Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
> ---
>  .../cjson/cjson/CVE-2025-57052.patch          | 33 +++++++++++++++++++
>  .../recipes-devtools/cjson/cjson_1.7.18.bb    |  1 +
>  2 files changed, 34 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/cjson/cjson/CVE-2025-57052.patch
>
> diff --git a/meta-oe/recipes-devtools/cjson/cjson/CVE-2025-57052.patch b/meta-oe/recipes-devtools/cjson/cjson/CVE-2025-57052.patch
> new file mode 100644
> index 0000000000..ed3d4a7eba
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/cjson/cjson/CVE-2025-57052.patch
> @@ -0,0 +1,33 @@
> +From e53a1413304382d562176bed91609e00b4fcf87e Mon Sep 17 00:00:00 2001
> +From: Lee <peteralfredlee@gmail.com>
> +Date: Fri, 5 Sep 2025 14:53:20 +0800
> +Subject: [PATCH] fix the incorrect check in decode_array_index_from_pointer
> + (#957)
> +
> +this fixes CVE-2025-57052
> +
> +CVE: CVE-2025-57052
> +Upstream-Status: Backport [https://github.com/DaveGamble/cJSON/commit/74e1ff4994aa]
> +
> +(cherry picked from commit 74e1ff4994aa4139126967f6d289b675b4b36fef)
> +Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
> +---
> + cJSON_Utils.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/cJSON_Utils.c b/cJSON_Utils.c
> +index 63651df..8fa24f8 100644
> +--- a/cJSON_Utils.c
> ++++ b/cJSON_Utils.c
> +@@ -282,7 +282,7 @@ static cJSON_bool decode_array_index_from_pointer(const unsigned char * const po
> +         return 0;
> +     }
> + 
> +-    for (position = 0; (pointer[position] >= '0') && (pointer[0] <= '9'); position++)
> ++    for (position = 0; (pointer[position] >= '0') && (pointer[position] <= '9'); position++)
> +     {
> +         parsed_index = (10 * parsed_index) + (size_t)(pointer[position] - '0');
> + 
> +-- 
> +2.44.1
> +
> diff --git a/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb b/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
> index bdeab3055c..67d536cf24 100644
> --- a/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
> +++ b/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
> @@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=218947f77e8cb8e2fa02918dc41c50d0"
>  
>  SRC_URI = "git://github.com/DaveGamble/cJSON.git;branch=master;protocol=https \
>             file://run-ptest \
> +           file://CVE-2025-57052.patch \
>           "
>  SRCREV = "acc76239bee01d8e9c858ae2cab296704e52d916"
>  
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119839): https://lists.openembedded.org/g/openembedded-devel/message/119839
> Mute This Topic: https://lists.openembedded.org/mt/115419150/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


