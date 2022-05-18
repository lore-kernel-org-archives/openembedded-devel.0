Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C58F6C433EF
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 15:32:07 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web08.6425.1652887923535265659
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 May 2022 08:32:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BizX7zeF;
 spf=pass (domain: gmail.com, ip: 209.85.214.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id i1so2112575plg.7
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 May 2022 08:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=oLBe8BEHMqR66Du7c/4NK+l8DKa2Yj0HgwctpDE5dGg=;
        b=BizX7zeFpoSBZABXZP2Zvm2+h82K3troA1yrbHOdMuWbEyH6L9H3r32Xm6XKn3AJ1Z
         e9Lb/YU8y+JdWMgxC+sOjjhDcNW2pWaxYCl3EQ/FUkQFVuOzsHD2l5xUHm4CH+sfz0Sl
         EprXoEvB4H04CZx68PErT8g1m9fo7gJJ2G1kiv/+RFb/4wpN8sm0qW+g0pEHIe3ConW2
         HIJBLEz4AIuOZJWo4HJOHwQ1kaJcxJLlx5DQSk9ik5qhMk7jPJs171xNVYU7JfG09z78
         KwuchBwIxmaN2+jc2rE2ftDCE5vico6+BqDBN8CrchaDa5pueaSO0I5q/C2Ctbd0SKq4
         7rcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=oLBe8BEHMqR66Du7c/4NK+l8DKa2Yj0HgwctpDE5dGg=;
        b=qF0Ywt2uH+dwyJCXRIMplkQ75O1BBUgIAktTyqCzNDC+UY+PK5e5defCaxCtHKWDW9
         evNkXTGH1P5jvZZl0bsQn5OAB2Iq+kTvhUbi5XTz66HQuFDJnSjzstxQWp2T2KVQa40A
         FeP7qI8FvFEizHu8c0mAmth7x9wBx59PdKtiyVIJx0jooYofn1LgIaYSUNHhsmr6PUVf
         JCU/MRmGQTiaBQS980h993lOFnCjK9T/MlkDxBNT89KsR6jfJxcqv/Cbi4bLEwzmXQNE
         nG1Dn5PAa4biYyASnxDd0G68RtlOYG1Yu3hTOrFb/k7Rkx4xcyXxS4MIlS1IHQDyf9za
         5uhA==
X-Gm-Message-State: AOAM5322Eh/c7f+Bc/KyiGQY6XZzeYIDuDcSlZB7M6t0xNlcJxG5xBJh
	PP3vCIcoS99BUMG4Ffkdhg1sfZcQVcKoHQ==
X-Google-Smtp-Source: 
 ABdhPJwqeFJW05CmfJzYz/GJlSnO8CDkHRieSG0b69K5uf92Z4bodJ+N3CpTE/UKLpf8DExoBYaH5A==
X-Received: by 2002:a17:90b:1c08:b0:1dc:eeb2:5a5a with SMTP id
 oc8-20020a17090b1c0800b001dceeb25a5amr75371pjb.31.1652887923035;
        Wed, 18 May 2022 08:32:03 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:20c7:18ec:c14d:acfe?
 ([2601:646:9200:a0f0:20c7:18ec:c14d:acfe])
        by smtp.gmail.com with ESMTPSA id
 m1-20020a1709026bc100b00161ac982b52sm1826439plt.95.2022.05.18.08.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 May 2022 08:32:02 -0700 (PDT)
Message-ID: <80acef64-15e8-2ba4-1944-bd5df9be1e00@gmail.com>
Date: Wed, 18 May 2022 08:32:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [oe] [meta-python] [PATCH] python3-aiohue: upgrade 3.0.11 ->
 4.4.1
Content-Language: en-US
To: wangmy <wangmy@fujitsu.com>, openembedded-devel@lists.openembedded.org
References: <1651999221-25259-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <1651999221-25259-1-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 May 2022 15:32:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97163

you emails are dated wrongly. Eg. below email appears to be received on 
8th may where I have received it on 17th may. This confuses the tools we
use for grok patches from mailing list. Can you check on your mail setup
if this can be fixed on your end ?

On 5/8/22 1:40 AM, wangmy wrote:
> add dependence: python3-awesomeversion
> 
> Changelog from 3.0.11 to 4.4.1
> ==============================
>      Switch to limit per host on tcp connector
>      Delay initializing workaround dict
>      Bump black from 21.12b0 to 22.1.0
>      Put back asyncio-throttle because still in use for v1 API
>      Mac address got lost in translation
>      Update to final models and fix parser errors
>      Fix python 3.9 compatibility
>      Fix typo in button events handler
>      Add diagnostics feature
>      Small follow up fix in event logic
>      Allow motion sensor state to be null/none when sensor is disabled
>      Add basic tests
>      Fix float int conversion
>      Fix race condition(s) while adding/removing a light/device
>      Loosen up a bit on parser errors
>      Fix button workaround
>      Add setting effect feature on light
>      Add missing parameters to the grouped_light set_state
>      Fix typo in default enum member
>      Add timed effects feature to light
>      Add support for aggregated grouped_lights commands
>      Hide dependencies in release-drafter
>      Fix and cleanup of button workaround code
>      Fix typo in timed effects featur
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>   .../{python3-aiohue_3.0.11.bb => python3-aiohue_4.4.1.bb}      | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-aiohue_3.0.11.bb => python3-aiohue_4.4.1.bb} (74%)
> 
> diff --git a/meta-python/recipes-devtools/python/python3-aiohue_3.0.11.bb b/meta-python/recipes-devtools/python/python3-aiohue_4.4.1.bb
> similarity index 74%
> rename from meta-python/recipes-devtools/python/python3-aiohue_3.0.11.bb
> rename to meta-python/recipes-devtools/python/python3-aiohue_4.4.1.bb
> index 47d9964b0..b3a88fb67 100644
> --- a/meta-python/recipes-devtools/python/python3-aiohue_3.0.11.bb
> +++ b/meta-python/recipes-devtools/python/python3-aiohue_4.4.1.bb
> @@ -4,7 +4,7 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=dab31a1d28183826937f4b152143a33f"
>   
> -SRC_URI[sha256sum] = "31c0b90d7dc2b62f5e1a93e78b2c0d6360ef6c0a87485c217a4f394c937fce7d"
> +SRC_URI[sha256sum] = "fa3bb0cf68aefdd0710704443c896abda69ae227500ad9539ac6c3d1d6dad804"
>   
>   inherit pypi setuptools3
>   
> @@ -12,4 +12,5 @@ RDEPENDS:${PN} += " \
>   	${PYTHON_PN}-aiohttp \
>   	${PYTHON_PN}-asyncio-throttle \
>   	${PYTHON_PN}-profile \
> +        ${PYTHON_PN}-awesomeversion \
>   "
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97157): https://lists.openembedded.org/g/openembedded-devel/message/97157
> Mute This Topic: https://lists.openembedded.org/mt/91182211/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

