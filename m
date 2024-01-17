Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01669C47258
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 08:28:59 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.5145.1705480132581905850
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jan 2024 00:28:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=MMxu1TWT;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40e800461baso20611875e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 00:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1705480130; x=1706084930; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XPPzly8kRBWI5NQLtUCGdP05AAg6yrGUIXAOxFb/2+4=;
        b=MMxu1TWT0l4i57LlTtw4EUoSonsmLYWnqq2KY9TLlhrLAje3ZZp0zbQ3F7SaR34025
         BGG9sKys2e3pR5mmz/c8xD/r6+vpY4yVNAdKm7rtikxmHa4WYtogCMqlo2VSbCa3ls56
         4vTaRF8BoTuBHxPKMgXFtGWggF4eczQoBiMApScJ8FSI5gDIQmSRj37UYKd/0YAYJDY6
         G8N/hEPWCbIyLpRn0tyXaJdket+wswrnLY+4riJKnbe+dTtQDx4eRuDvecKSZVQ0verT
         Gu5aa4rkJUFuHQUJZmDL0nsKFi2hXarxuiEIY+fdaJMOS4mUKBe6WOJbdvfLAooMhvnx
         cgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705480130; x=1706084930;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XPPzly8kRBWI5NQLtUCGdP05AAg6yrGUIXAOxFb/2+4=;
        b=j1ikMSfGT250hyJlCNkbQIpOGYi6Z0ZRiGtz7dJDl9p4QjgqeWlKqwbsMoyrH17TLa
         B77txR+tsvaiD1aysk8GhjqMevCbINp+MAJCxzxQiWQ0PLbLsqNfn3s5jEXeuJHyBLv7
         avrcRklfaLI0APF4OVt/HBY+SRF+XFse6lPZ+XjuANLtBhV3j61E5R9zfZ/syi392lV2
         JNbi96DLqL551gSsnOh1ruuO6eiFBbtFDkZca17/52TzuGw0VFBSMo2hcfad8eQTdJO9
         z07WWWNko3eXo5D+uAchCVxX08frODnwI4j4FlOydjsS4XV+EmAAAv6EyUfnR3/6mymd
         6ZAg==
X-Gm-Message-State: AOJu0YwfKelHqJf2PB9lqwkW3Vsxew9PaBA8HA4Le5APJFgwvfkrtIB0
	mujD5VYCw7dh99ldEx6H8ln0G0h9Dri8+3TkhrHheGvcEJzMH8PB
X-Google-Smtp-Source: AGHT+IEL2VNYHAlw074PK2q5vohecRj2GisMCnOjkgEyj+bos0meIEGmOvMaqat5mBLR/9pdAi8rqQ==
X-Received: by 2002:a05:600c:22da:b0:40e:4671:5359 with SMTP id 26-20020a05600c22da00b0040e46715359mr2608716wmg.346.1705480130339;
        Wed, 17 Jan 2024 00:28:50 -0800 (PST)
Received: from [192.168.0.28] ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id t16-20020a5d5350000000b0033761b2de64sm1081917wrv.76.2024.01.17.00.28.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jan 2024 00:28:50 -0800 (PST)
Message-ID: <532355af-72ac-4b51-a751-659c694676bf@smile.fr>
Date: Wed, 17 Jan 2024 09:28:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH] python3-pytest-cov: add missing
 python3-coverage dependency
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
References: <20240103095602.2737711-1-dev@g0hl1n.net>
 <170468202896.912276.243218147597829225.b4-ty@gmail.com>
 <7502f2b0-f452-4b03-9af3-8f4c52c57c0e@smile.fr>
Organization: Smile ECS
In-Reply-To: <7502f2b0-f452-4b03-9af3-8f4c52c57c0e@smile.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 08:28:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108325

Le 16/01/2024 à 17:53, Yoann Congal a écrit :
> Le 08/01/2024 à 03:47, Khem Raj a écrit :
>>
>> On Wed, 03 Jan 2024 10:56:02 +0100, Richard Leitner wrote:
>>> As reported by "pip3 check" python3-pytest-cov depends on
>>> python3-coverage:
>>>
>>> 	$ pip3 check
>>> 	pytest-cov 4.1.0 requires coverage, which is not installed.
>>>
>>> This patch fixes this problem by adding python3-coverage to RDEPENDS
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [1/1] python3-pytest-cov: add missing python3-coverage dependency
>>       commit: b56ab3d10999f77cb429881b73b52fe2991ad4e3
> 
> Hi,
> 
> This caused https://autobuilder.yoctoproject.org/typhoon/#/builders/156/builds/206:
>   stdio: WARNING: Nothing RPROVIDES 'nativesdk-python3-coverage' (but virtual:nativesdk:/home/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb RDEPENDS on or otherwise requires it)
>   stdio: WARNING: Nothing RPROVIDES 'python3-coverage-native' (but virtual:native:/home/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb RDEPENDS on or otherwise requires it)
> 
> python3-pytest-cov does BBCLASSEXTEND = "native nativesdk" does the new dependency python3-coverage does not.
> 
> So, python3-pytest-cov-native and nativesdk-python3-pytest-cov do become unbuildable. We can either :
> * keep the dependency and remove the BBCLASSEXTEND
I sent a patch to do that: https://lists.openembedded.org/g/openembedded-devel/message/108324

> * add the necessary BBCLASSEXTEND to the python3-pytest-cov dependencies (recursively) starting with python3-coverage
> 
> Regards,

-- 
Yoann Congal
Smile ECS - Tech Expert

