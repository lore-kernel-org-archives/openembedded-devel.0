Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A9CC47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 16:53:16 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.21264.1705423992654599930
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jan 2024 08:53:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=esCDlDIn;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40d6b4e2945so113662815e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jan 2024 08:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1705423990; x=1706028790; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8CePzJV2FOuU2y56eC55pi40e74F1hKGGNOVIwvJ/N8=;
        b=esCDlDInyTJXwO4PkicwPo2pXXArZz2wq3GOVazVuXXZzmEcSAXlrzEfsr1o3ARcR8
         A++zJzQ1sZ7Ab5cAJuSkoSLs00dEqK63Q8c57AdP6VYr4VIj+rp9g98pRkAPIZut/X9u
         oWD+AO2+nEVutWClgGexjam50+pmazMFLxHVfjRlWe7RkX9QXkd1XEWYYiQnSYgD3ghT
         FAZqLgVOeZv7v0jIGZhtD8q9y4Ll7O7IhU3FJu1V3tv1Ce32UuJ3+vCSSF8SQT18iMVB
         qbDH7KJbvNAda68k5QsQ8ElcY+afFuUYvWnsmBCl02YtLqPZOUJN8jANJ/a8meTojnV+
         x+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705423990; x=1706028790;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8CePzJV2FOuU2y56eC55pi40e74F1hKGGNOVIwvJ/N8=;
        b=lmq1gF2r/DNeaH2HrVyYE5qVWf7LQXfqdED8gADX6JgujvdXf2BwA/mcK9x9DKCrY3
         fFspIHYJN8kZOeQ+Rr007rDr0G6xKTHzKJLM9OiU+oixTxJKrO4GZL0QZODlJ9hcIUca
         3SctyCbEFdNXYxyLfFEblRM2P71f7AGDeptiilIIEAIG6yMJf1P4Ng+vkwq1otFIUCos
         7cnfk/OzhcNyM8Ts2QHHXLc+yrS5QQ/WF/KyOZUQQVcdMlDZAO/SsKCN/QR7k2ySeb57
         3PRF3byRBkNexUA4Lxpib6k0+n9UeZIUowjhtq6dnLdhKFW+YdksQK8/+Oi0p5gW8kEl
         6E/g==
X-Gm-Message-State: AOJu0Yzb0bVZ8C3fpr68dE6VNrQZygfAvE/Uz1YaJkNnC+zT7eGmBPrq
	3hEEgP6SMy8Vqd+HmDduOejfNFFWRkqtZy2bswKb9swOUQZt2w==
X-Google-Smtp-Source: AGHT+IE8hY9xOdA9/0npmktF4teI/95S1S0xc2FfdIT/TwMUt4ry1WDSjhKbQD7nSC5DWEMWCsXIiw==
X-Received: by 2002:a05:600c:6a04:b0:40d:8356:e8bc with SMTP id jj4-20020a05600c6a0400b0040d8356e8bcmr3068849wmb.194.1705423990331;
        Tue, 16 Jan 2024 08:53:10 -0800 (PST)
Received: from [192.168.0.28] ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id r19-20020a05600c459300b0040e42391a12sm19671221wmo.13.2024.01.16.08.53.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jan 2024 08:53:10 -0800 (PST)
Message-ID: <7502f2b0-f452-4b03-9af3-8f4c52c57c0e@smile.fr>
Date: Tue, 16 Jan 2024 17:53:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH] python3-pytest-cov: add missing
 python3-coverage dependency
To: openembedded-devel@lists.openembedded.org
References: <20240103095602.2737711-1-dev@g0hl1n.net>
 <170468202896.912276.243218147597829225.b4-ty@gmail.com>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <170468202896.912276.243218147597829225.b4-ty@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jan 2024 16:53:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108305

Le 08/01/2024 à 03:47, Khem Raj a écrit :
> 
> On Wed, 03 Jan 2024 10:56:02 +0100, Richard Leitner wrote:
>> As reported by "pip3 check" python3-pytest-cov depends on
>> python3-coverage:
>>
>> 	$ pip3 check
>> 	pytest-cov 4.1.0 requires coverage, which is not installed.
>>
>> This patch fixes this problem by adding python3-coverage to RDEPENDS
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/1] python3-pytest-cov: add missing python3-coverage dependency
>       commit: b56ab3d10999f77cb429881b73b52fe2991ad4e3

Hi,

This caused https://autobuilder.yoctoproject.org/typhoon/#/builders/156/builds/206:
  stdio: WARNING: Nothing RPROVIDES 'nativesdk-python3-coverage' (but virtual:nativesdk:/home/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb RDEPENDS on or otherwise requires it)
  stdio: WARNING: Nothing RPROVIDES 'python3-coverage-native' (but virtual:native:/home/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb RDEPENDS on or otherwise requires it)

python3-pytest-cov does BBCLASSEXTEND = "native nativesdk" does the new dependency python3-coverage does not.

So, python3-pytest-cov-native and nativesdk-python3-pytest-cov do become unbuildable. We can either :
* keep the dependency and remove the BBCLASSEXTEND
* add the necessary BBCLASSEXTEND to the python3-pytest-cov dependencies (recursively) starting with python3-coverage

Regards,
-- 
Yoann Congal
Smile ECS - Tech Expert

