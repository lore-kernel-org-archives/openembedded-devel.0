Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D208C54E65
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 00:10:25 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.37854.1747959019027152392
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 May 2025 17:10:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V+fM1Eev;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-231f5a7baa2so49397515ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 May 2025 17:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747959018; x=1748563818; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vUJVlYHWALbl4RrhLjoqDihZ3BVh4Fc1lwXKNlaSjCg=;
        b=V+fM1EevNIP6ofyErq16hA12ECqK49/XZlIwxgjZypnKMEmUaHL431/rF1q23WG1C8
         1mKrXkkwQlf97j46INz0yL9w9TDOLYAr/erRiGMYu0kLTfNhbaSyk3oH+tcTN5D/UhV5
         t8yGPs3ird6YIASfFPsU+uywkxrU0UgKb+56LPj8nNtqCIFVX48W1DCRUEbFAIQJUpFW
         gp8ASyC0xyoYrFskU1WqI3u8QSAVbimk9sY3HzsE0G50DSu3J55kENeiQKSzKXPgReOw
         a4tAFxh/JbE6KOXGfEO8Q0q4VN0V4NLcTzvQTyK2Hhk1tCXVlG+ZvwxWPcFTlbiATo5P
         pjqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747959018; x=1748563818;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vUJVlYHWALbl4RrhLjoqDihZ3BVh4Fc1lwXKNlaSjCg=;
        b=u1vIcUAYOPAO+J/8aiJRQDnkm8WA7uI5Khg6cfc9/TJA9OglHhoG8w8w/dHNawFf0c
         mlHLU8ndNmY6T2oSbngXDHJXQSs4svzBEc+2SGbOYFmAgbozjwYmu1V8A+81guxjxxk0
         KmOKvMlXYrKSjcDNUL/lLrmzOVGugZgVPwLTiACPvzKbMQ/Rhl3sRsVAMJkUnz6rYF4g
         g3/E9MIBLxeuUFnlAWUz/lhXvD97Qv2cko+kA+rsmz7jD3epqSDYhhb5YXCpWs51Joo0
         e7DVlOT4vifMfsTv93V/ar3SX3FZfYDEZLppRG83To6U8t+cpaPVxcCFQpQsJ5D33nly
         Xmvg==
X-Forwarded-Encrypted: i=1; AJvYcCXnWFr+9eAt+7N5lgVFeqx5X1W5HwjVXa54DwCzEeqMTvK8jWQnBiTtyb5QL4wcXIfBP5hxHGpn/fmrJQxaq5Z/fAc=@lists.openembedded.org
X-Gm-Message-State: AOJu0YznsC/ee9YqiSlPTI27CVX24rR4Qi6bQYZouOr3sCGELo16V6yo
	WxLxuey/D/QhGCucm6TzNR1UvtMXvZzl9yLRreDTKbbUgdxspW1/T5cE7hm/YWZN
X-Gm-Gg: ASbGnctFaslOoYbEXWMxYwp3FJjW/vEGGwZTJuya1EG4mqWInFguXcbCpAq+HcHumMg
	GzcGmGGHmJtZ0waI2eesQHlczKd8BHDfxmPv3IcVvuWdODzCaE/lK8jrk5rZvBwuICE3F4yDPLc
	BpqVXyXU9sCKXZdTfGxpZ7VZCnWiBv01qHtZOwnPaAhSijnx/e7PrnkjVBrPVhTKkdDF6qf57B6
	h0JMbaT1XiElRTke2RcP2MDDA+8mGj8CyTHHqNcV2gZG6lAORLcaZmfvjxRjkQuYeBW9ntSqhDJ
	2A9FF5NTh1FkcY55Q58cTsgkFBUdr5P8TTlUyJgcw+h+6F/umJudxu102jeSy5fWy0ERT1niuCx
	Dx2NQUa8aoD386o0BtTMbO+KkyO5WtqnLOZLJuPwzmrQv
X-Google-Smtp-Source: AGHT+IHuieSw239SNXdvCDfybohknHbsISfTx5KGqUAFwk1N/qEma4EzPOjahrg2rr8aoF+/Sd5SsA==
X-Received: by 2002:a17:902:ea01:b0:223:5c77:7ef1 with SMTP id d9443c01a7336-231d43bb574mr388461845ad.21.1747959018324;
        Thu, 22 May 2025 17:10:18 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:7444:5952:9108:1ddc? ([2601:646:8201:fd20:7444:5952:9108:1ddc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ed2abbsm113368795ad.227.2025.05.22.17.10.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 17:10:17 -0700 (PDT)
Message-ID: <76df79cd-9918-4b86-8c42-64bd55e6d831@gmail.com>
Date: Thu, 22 May 2025 17:10:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] libserialmodule: v1.0.3 -> v1.0.7
To: nguyenthaithuanalg@gmail.com, openembedded-devel@lists.openembedded.org
References: <20250522033750.30213-1-nguyenthaithuanalg@gmail.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20250522033750.30213-1-nguyenthaithuanalg@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 May 2025 00:10:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117600



On 5/21/25 8:37 PM, Thuận Nguyễn-Thái via lists.openembedded.org wrote:
> 1. Fix/check "DSR" is connected before writing.
> 2. Add "spsr_err_txt" to get text of error code.
> 
> Signed-off-by: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
> ---
>   .../{libserialmodule_1.0.3.bb => libserialmodule_1.0.7.bb}      | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-oe/recipes-support/libserialmodule/{libserialmodule_1.0.3.bb => libserialmodule_1.0.7.bb} (89%)
> 
> diff --git a/meta-oe/recipes-support/libserialmodule/libserialmodule_1.0.3.bb b/meta-oe/recipes-support/libserialmodule/libserialmodule_1.0.7.bb
> similarity index 89%
> rename from meta-oe/recipes-support/libserialmodule/libserialmodule_1.0.3.bb
> rename to meta-oe/recipes-support/libserialmodule/libserialmodule_1.0.7.bb
> index 02125730d1..ac5a3eaf09 100644
> --- a/meta-oe/recipes-support/libserialmodule/libserialmodule_1.0.3.bb
> +++ b/meta-oe/recipes-support/libserialmodule/libserialmodule_1.0.7.bb

We already have upgraded to 1.0.6 via another patch, so please rebase 
your patch on top of latest master and send the updated patch

> @@ -6,7 +6,7 @@ LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22cdd382a6275cb4c2e75c517952ac7c"
>   DEPENDS = "libsimplelog"
>   SRC_URI = "git://git@github.com/thuanalg/libserialmodule.git;branch=main;protocol=https;tag=v${PV}"
> -SRCREV = "9cf920aa1d3ef1d4a4de9a19e695717a6f097894"
> +SRCREV = "b5a5a436900d0bd69f990ca062de916c65f7e2e0"
>   S = "${WORKDIR}/git"
>   inherit cmake
>   EXTRA_OECMAKE = "-DUNIX_LINUX=1 -DMETA_OPENEMBEDDED=1"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117581): https://lists.openembedded.org/g/openembedded-devel/message/117581
> Mute This Topic: https://lists.openembedded.org/mt/113244476/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


