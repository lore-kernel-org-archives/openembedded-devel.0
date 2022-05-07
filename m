Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF8AC433EF
	for <webhook@archiver.kernel.org>; Sat,  7 May 2022 03:23:03 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.6421.1651893773686149516
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 May 2022 20:22:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OaJUdAtc;
 spf=pass (domain: gmail.com, ip: 209.85.214.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id q4so6262419plr.11
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 May 2022 20:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=XycFF75n1FG8f1fEWAcYn6DH9rJNAevVC4ta+YTutQc=;
        b=OaJUdAtcI3goao1hjACjS2sc5AtnJKCOW8aa+r7g3wByFuSkxHHwhhMkRkF+/xDp7C
         8t2/aASc3I9MyfTyc6zTXAwyfmbcDBbhOHT9KqadcSrdoxa+TABKakdgR193fqe3pGTF
         atCMxfMiH7yRAGRKgWE2kMOseiiO7Q1h2mduvhKTuALkgxxcoQQntD8UTGapJrRwKia1
         hqRUsCtEdfTMG6AWyZiSjLirb00/FC3gU9o+gCnHlKlw3aQxG4EMGu8tQQvE6XAC+RUT
         rvAsfv2DhE4iMj+H2aMCOr+xiWCEggyf58HrzgzOfZpw4zGsCtNAmbqLbAxx4HrcEnDy
         JJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=XycFF75n1FG8f1fEWAcYn6DH9rJNAevVC4ta+YTutQc=;
        b=xKMGdW+LOtwu5tsrPdSGgUfwjqjyTgmaRXVuePOQ3WogbnHyvOs2IiuyY+1jH793wJ
         VBoCI60GIcG/1AVmLJNRcX/cULA1ytQRwChyfjJi4PSQdwhhjCqqAQIYcr9xMcHJh/37
         lHZzHb2Kp6/Q2Hg6qvMX+JaQqecH3X6oQ0xAcqctcwZlRo4NPHQ8RKhBgzKy6Y3NEWEY
         AB5ffcEag2hk1aMd2QA5Ky3458eMKkPI9Htexawj2btrCpNH+0PKz39ShaB+nGi4Iap3
         ROUc5udHiOwLMYU/NF/dXN2NKak11RJu1YnhpTYvC7DN45blN11299vR5EZhxiKoR2PB
         u5Rg==
X-Gm-Message-State: AOAM532+yOY5auw4dizKeA2XHsazEw/eQ1K2NBTVwxpksJ+PU2esTJ3r
	6MV8dmaauH9Ep010SQHrNrY=
X-Google-Smtp-Source: 
 ABdhPJyVn3XZBpT8ew1kiIdmf1G1aIZvmJdSX87yCW1ll/eml/hD99K70g8G8Z+SReqCRfCkJiPj5w==
X-Received: by 2002:a17:902:82c9:b0:15d:3a76:936f with SMTP id
 u9-20020a17090282c900b0015d3a76936fmr6726520plz.139.1651893773107;
        Fri, 06 May 2022 20:22:53 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0::2ec0? ([2601:646:9200:a0f0::2ec0])
        by smtp.gmail.com with ESMTPSA id
 w16-20020a170902d71000b0015e8d4eb24fsm2530315ply.153.2022.05.06.20.22.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 May 2022 20:22:52 -0700 (PDT)
Message-ID: <025371e6-098d-4335-c2b4-5468f861eec4@gmail.com>
Date: Fri, 6 May 2022 20:22:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [oe] [meta-networking][PATCH] meta-networking: Add meta-phython
 to BBFILES_DYNAMIC
Content-Language: en-US
To: kai <kai.kang@windriver.com>, Teresa Remmet <t.remmet@phytec.de>,
 openembedded-devel@lists.openembedded.org
References: <20220506121216.3099707-1-t.remmet@phytec.de>
 <f8dcd63b-ec64-adc2-97ca-c877db64b8f0@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <f8dcd63b-ec64-adc2-97ca-c877db64b8f0@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 May 2022 03:23:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96976



On 5/6/22 20:06, kai wrote:
> On 5/6/22 8:12 PM, Teresa Remmet wrote:
>> Activate recipes in dynamic-layers of meta-networking.
>>
>> Signed-off-by: Teresa Remmet<t.remmet@phytec.de>
>> ---
>>   meta-networking/conf/layer.conf | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
>> index 3069cfb6a39d..a7d6da8fd7d7 100644
>> --- a/meta-networking/conf/layer.conf
>> +++ b/meta-networking/conf/layer.conf
>> @@ -24,3 +24,6 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
>>     wireguard-tools->wireguard-module \
>>     wireless-regdb->crda \
>>   "
>> +BBFILES_DYNAMIC += " \
>> +    meta-python:${LAYERDIR}/dynamic-layers/meta-python/recipes-*/*/*.bb \
>> +"
>>
> Thanks, I met the same issue. BTW, there is a typo in the title, 
> 's/phython/python/'.

thanks I have taken care of this, no need to send v2
> 
> -- 
> Kai Kang
> Wind River Linux
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96975): https://lists.openembedded.org/g/openembedded-devel/message/96975
> Mute This Topic: https://lists.openembedded.org/mt/90931634/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

