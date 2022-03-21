Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3EE2C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 15:44:29 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web08.32274.1647877468463689532
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 08:44:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z44q/yF0;
 spf=pass (domain: gmail.com, ip: 209.85.215.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id w21so6887223pgm.7
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 08:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=+eWwMcsongS1QfdSAngnL0DKy6EqVWJgf/sWt8S+OPk=;
        b=Z44q/yF06oSCr+FQKlvi0tf+M2NYsBXjRh7CNsl0fftuxiHZK5oiRWi8B6aEzkWzZc
         wFg4o5eknCoHo7PHCOHJmqwiTdyhnDkAz4u7hFcnb6oq66eZYMgb86WqlcwzT0Wtdi8J
         3wgMIGG9YAiEJTZdaiABMyFg+WsiiO4XEqE1wxZpFzhe/Fhvv2251dLzbSTvSvhturfK
         fwvJ4rKPbi7q+CGM7L7WQBjP66BuA6JjEMBOCcmNDVjWqE1fUcPHeKrpMoLX7sF6jcBF
         cq1Yo4H/TH0e1F7YMTLTP2IBvvrTLHvJMxDafkOviT1QcoJBz3+3E0RUB6qDg3YwqP11
         LSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=+eWwMcsongS1QfdSAngnL0DKy6EqVWJgf/sWt8S+OPk=;
        b=yq+n//Z+sKfAovWCIWzPQkoyHettRI8neRlnmhW/E7c0Kjz0ESam6alePLOyGxiQTJ
         sNvLdET4rE7Rg2h1BT/3m4A7so2yURF+5cPIWcI82yxKmvAnP6rbxVQ/fCwo7Ude7aTp
         sGJqdbOZnP7BG5imGmE132ztAg1SkNHnukR8GejJNjJC73ltcK666xqPpC8ALNnIAjMH
         vBbo5y5rwdzo01/sGxfOWu58zp6sBFoc8HSB2kdFDfJV6ttX1wG2/dTu5RdFHoIPGS6W
         LN+YO/rk8Um9MB7xZMaJLBZDGReP7RxzctY4uiRCFvHTYYprnrMXCxO7p9YtDTHxFzAL
         seew==
X-Gm-Message-State: AOAM53070kYGQiPt1PqbozOU4dnoozraB5/68MHWnZRvZkIAxnzTPQ1L
	rY9S/xp7h/QA8L5ksgWDeDlJhjwr/yYmcw==
X-Google-Smtp-Source: 
 ABdhPJzjUu0sUIXHk2Ec+ogrqofsHS0fzR+hUaqWcgECNN1G3HqrFMgQDLMC6Xb/CAZ37H8X6a3BXQ==
X-Received: by 2002:a62:1ad3:0:b0:4fa:9adc:7680 with SMTP id
 a202-20020a621ad3000000b004fa9adc7680mr6558653pfa.25.1647877467312;
        Mon, 21 Mar 2022 08:44:27 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:fd5f:548f:7771:4010?
 ([2601:646:9200:a0f0:fd5f:548f:7771:4010])
        by smtp.gmail.com with ESMTPSA id
 a17-20020a62e211000000b004faa5233213sm3345296pfi.101.2022.03.21.08.44.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Mar 2022 08:44:27 -0700 (PDT)
Message-ID: <8f64a372-9b1c-7fc1-42ed-f74c664a5f3e@gmail.com>
Date: Mon, 21 Mar 2022 08:44:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [oe] [PATCH v2 1/2] python3-lz4: use system lz4 library
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
References: <20220321114353.1731727-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20220321114353.1731727-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Mar 2022 15:44:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96112

v1 was merged. Can you rebase and send the changes on top of 
master/master-next as v3

On 3/21/22 4:43 AM, Ross Burton wrote:
> Instead of using the copy of lz4 that is embedded in the python3-lz4
> source code, use the system lz4 library.
> 
> python3-lz4: PKGSIZE changed from 718282 to 165043 (-77%)
> python3-lz4: RDEPENDS: added "lz4 (['>= 1.9.3'])"
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta-python/recipes-devtools/python/python3-lz4_4.0.0.bb | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-python/recipes-devtools/python/python3-lz4_4.0.0.bb b/meta-python/recipes-devtools/python/python3-lz4_4.0.0.bb
> index 42f0743bea..75472d327e 100644
> --- a/meta-python/recipes-devtools/python/python3-lz4_4.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-lz4_4.0.0.bb
> @@ -4,12 +4,13 @@ LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=6231efa4dd4811e62407314d90a57573"
>   
>   DEPENDS += " \
> +    lz4 \
>       ${PYTHON_PN}-setuptools-scm-native \
>       ${PYTHON_PN}-pkgconfig-native \
>   "
>   
>   SRC_URI[sha256sum] = "57c5dfd3b7dae833b0d2b2c1aafd7f9d0dfcab40683d183d010c67c9fd1beca3"
>   
> -inherit pypi python_setuptools_build_meta
> +inherit pkgconfig pypi python_setuptools_build_meta
>   
>   BBCLASSEXTEND = "native nativesdk"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96107): https://lists.openembedded.org/g/openembedded-devel/message/96107
> Mute This Topic: https://lists.openembedded.org/mt/89925656/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

