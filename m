Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 376D6C2BB3F
	for <webhook@archiver.kernel.org>; Sat, 18 Nov 2023 15:03:54 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.9804.1700319825875022114
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Nov 2023 07:03:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ij62TVCn;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: akuster808@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-677f8d5978cso3599796d6.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Nov 2023 07:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700319825; x=1700924625; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hQcE49Jswc77cNOkUBVatEof7XYHBIlmgnQZFWv+gMM=;
        b=ij62TVCnjjOhE3FU0hca9d7I6hwYlDH7Jx5RdesB2IfyIm+4RdpnsLm24tzB94uUXO
         4+UXvWAlOHf0GuYPVC40psgI3bHWnjhxeHQW+hJmjooiZAsA+AkTmZimKcKlKzq3GogR
         LX18OSelOuGOIR/u9V5ebBMfVREt2bTBG2i603Pcq1ZlvVMV4k7J3ZuE7IHp7ktzD7Tl
         OvfHVflnQRKT54ruL9R6V/6jap0zce1JEX2MKY9LhKrK2VyZiOx8rviYUBWYtiwU/mIe
         3HxApp2c8vpBf0UPbjIeqr4N2VxF6cEitSpuVlCvCt+1aWrqqEovFdkN9tBVim+RbUwc
         zcBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700319825; x=1700924625;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hQcE49Jswc77cNOkUBVatEof7XYHBIlmgnQZFWv+gMM=;
        b=IpLH4wM2LDUrQlfG6B/wEohthYDR/yCnnTcpQnpftm2o+Rao4kCmsscfuavnCz4bqq
         3wECpcCFZQWqAwd7yPNLkR4AWFoAc/4v7xZLlqeLVdS5X1NhXy3qk/1l30K8EWAvUtw7
         4WGUqWncWAMjOPoTN5i5oIKSm1HgCc9QaBh8kXVaA0ZLnEowu1H9qoAkvwtojgJ7WI1e
         7FwFQFbPJCYlpHQ12jqKp0dt301zzVszZC0NnfDfn05mOHj57X8dh//PpZIaDj/ydVOV
         bjnXo5bAkKfUJ8faSRNy9Ir2VGYkSJ3PM+jUUh8UxSIDZ9y/aZLY3pdNrivFEMFDjzcm
         z/sg==
X-Gm-Message-State: AOJu0Yxg34HEM3I4Qh9x8T/xxPErP9NFSPL65AcQNYUiRjOUI3n6qRRo
	D/NcPYQ/n/rn/CkGHTqxmG9PPo/op/Q=
X-Google-Smtp-Source: AGHT+IHxn1X791VTusX4eSrZpJSFo/G0ur1FSgi6wQgEilWlQ2lnz38MyH2TtCM3GLP5oO/GQT5LXw==
X-Received: by 2002:ad4:5cc9:0:b0:66d:9f68:219f with SMTP id iu9-20020ad45cc9000000b0066d9f68219fmr3038942qvb.3.1700319824849;
        Sat, 18 Nov 2023 07:03:44 -0800 (PST)
Received: from [10.52.31.114] ([209.198.250.118])
        by smtp.gmail.com with ESMTPSA id qb16-20020ad44710000000b00677a11087d8sm366188qvb.119.2023.11.18.07.03.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Nov 2023 07:03:44 -0800 (PST)
Message-ID: <ef94e8f2-c83d-4084-92ac-8265a5595d98@gmail.com>
Date: Sat, 18 Nov 2023 10:03:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][kirkstone][PATCH 1/2] python3-cson: fix
 DEPENDS on python3-native
To: Yoann Congal <yoann.congal@smile.fr>,
 openembedded-devel@lists.openembedded.org
References: <20231117091824.450741-1-yoann.congal@smile.fr>
 <dc8c58c0-bc7c-4cf3-975b-4f0803b7c915@smile.fr>
 <16f5f05b-a310-41e0-8b0d-e7e5a2fd712d@smile.fr>
Content-Language: en-US
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
In-Reply-To: <16f5f05b-a310-41e0-8b0d-e7e5a2fd712d@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Nov 2023 15:03:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106886

Hello Yoann,

thanks for the followup.  I believe I got series sorted out.

-Armin

On 11/17/23 6:18 PM, Yoann Congal wrote:
> Le 18/11/2023 à 00:07, Yoann Congal a écrit :
>> Le 17/11/2023 à 10:18, Yoann Congal a écrit :
>>> python-native is not provided by meta-python anymore and this is clearly
>>> a python3 recipe.
>>>
>>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>>> ---
>>>   meta-python/recipes-extended/python-cson/python3-cson_git.bb | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta-python/recipes-extended/python-cson/python3-cson_git.bb b/meta-python/recipes-extended/python-cson/python3-cson_git.bb
>>> index c4fcc61ec..da174ad55 100644
>>> --- a/meta-python/recipes-extended/python-cson/python3-cson_git.bb
>>> +++ b/meta-python/recipes-extended/python-cson/python3-cson_git.bb
>>> @@ -13,7 +13,7 @@ SRC_URI = "git://github.com/gt3389b/python-cson.git;branch=master;protocol=https
>>>   S = "${WORKDIR}/git"
>>>   
>>>   RDEPENDS:${PN}:class-native = ""
>>> -DEPENDS:append:class-native = " python-native "
>>> +DEPENDS:append:class-native = " python3-native "
>>>   
>>>   inherit setuptools3
>>>   
>> It would be better to backport https://git.openembedded.org/meta-openembedded/commit/?id=40b4cf5a83098a5f1be873be5c29f26380bc7993 instead of this patch
>> In the current state :
>> root@qemux86-64:~# python-cson
>> Traceback (most recent call last):
>>    File "/usr/bin/python-cson", line 5, in <module>
>>      from cson import main
>>    File "/usr/lib/python3.10/site-packages/cson.py", line 11, in <module>
>>      import argparse, copy, json, sys
>> ModuleNotFoundError: No module named 'json'
>>
>> I'll send the backport.
> Here it is :
> [meta-python][kirkstone][PATCH] python3-cson: fix run-time dependencies
> https://lists.openembedded.org/g/openembedded-devel/message/106881
>
> With the backport the python-cson tool does start so this patch should definitely be dropped in favor of the backport.
> root@qemux86-64:~# python-cson
> usage: python-cson [-h] -f OUTPUT_FILE [-v] input_file
> python-cson: error: the following arguments are required: -f/--file, input_file
>
> Regards,
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106882): https://lists.openembedded.org/g/openembedded-devel/message/106882
> Mute This Topic: https://lists.openembedded.org/mt/102644490/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


