Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B444C54FB9
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 23:18:47 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.10584.1700263123406279124
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Nov 2023 15:18:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=XEGzSSZl;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-32fadd4ad09so1825582f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 15:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1700263121; x=1700867921; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NQK85QyrEqUQlT25EXdnu/mgfPLNU/bNLlqurZX/FIM=;
        b=XEGzSSZlUsoJmp9jb/7Y6gwv8TY4dFZG/hd4ZCcaxEKINEJe6FwYr6AejVRC3GsEjl
         HgVCDxMQqeRzAScxy7oBMeAfACcr8Q5G2nETniixD2NA4HzDytr6es2TR/qOURbUaAam
         2YSxBmvmxlOJqoZYOq96yn/+P7+c+h0dXozdXR7nlLs9Il7bumttuC4DYQTiJ2TWey7E
         wPFQ9qjkKMwtvmfg9h66nf2qIJ9u9/lkjsyrDV1SZm9ZZMCqmhgs3Arjo61Oc6cHeCcK
         BBYMR17PfbJD/P7QM5qrZBBrs6e6cLV+XW0+tbQyfL0ZT56vk48rJ8hefGyMud5pubLS
         WD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700263121; x=1700867921;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NQK85QyrEqUQlT25EXdnu/mgfPLNU/bNLlqurZX/FIM=;
        b=NuK7wGmpOPqSa+nw9RzBu3PrcWrGvGrcSW4d5wTMI1M7Lkyf5/JnlMLnEYsNmDtQmh
         54bxBnXBbsobvmLKQvOvXqxG3XhWnPV/NZ4/2Dspi8weaVnv/6e5sNNwHR7jfQPtQVxg
         M/ayUf2+JthlhTU6XJ0q75dnR5jnRnWB0oCpNyv1EWb0/qA8v4OOEbbFRf9dNk2bznx1
         yHjrm5sOpzFfUMwS1NN7McudgnaY6RGm5vRwUHASC9aDRYag0wbX19QYOWU2QM1k8JTQ
         2ZH4B5SWHahAFlft5ESD9CHq8I9MC5rBgp7/rCRPyq+WKLnTEiB4YAsuYnT6uhTQnLnd
         OWFw==
X-Gm-Message-State: AOJu0YzcWfTWT3z0/SEIeeefzWgxdJCurecOYqoPgoPENIJpjoXIXJ3B
	YlLoGzR/9m/K96hnSdrcb9ckAEIblWd3EwUMV8c=
X-Google-Smtp-Source: AGHT+IFfO8bJf66ZJWfS9AAmTpEaVIAdZSCTrhKXDpCwFTGZctJa/ZCoPtc2x6atINCOOAac1PYFkg==
X-Received: by 2002:a05:6000:1086:b0:32f:b17c:65e0 with SMTP id y6-20020a056000108600b0032fb17c65e0mr373516wrw.17.1700263121020;
        Fri, 17 Nov 2023 15:18:41 -0800 (PST)
Received: from [192.168.0.20] ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id d19-20020adf9b93000000b003316eb9db40sm1184245wrc.51.2023.11.17.15.18.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 15:18:40 -0800 (PST)
Message-ID: <16f5f05b-a310-41e0-8b0d-e7e5a2fd712d@smile.fr>
Date: Sat, 18 Nov 2023 00:18:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-python][kirkstone][PATCH 1/2] python3-cson: fix DEPENDS on
 python3-native
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
References: <20231117091824.450741-1-yoann.congal@smile.fr>
 <dc8c58c0-bc7c-4cf3-975b-4f0803b7c915@smile.fr>
Organization: Smile ECS
In-Reply-To: <dc8c58c0-bc7c-4cf3-975b-4f0803b7c915@smile.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 23:18:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106882

Le 18/11/2023 à 00:07, Yoann Congal a écrit :
> Le 17/11/2023 à 10:18, Yoann Congal a écrit :
>> python-native is not provided by meta-python anymore and this is clearly
>> a python3 recipe.
>>
>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>> ---
>>  meta-python/recipes-extended/python-cson/python3-cson_git.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-python/recipes-extended/python-cson/python3-cson_git.bb b/meta-python/recipes-extended/python-cson/python3-cson_git.bb
>> index c4fcc61ec..da174ad55 100644
>> --- a/meta-python/recipes-extended/python-cson/python3-cson_git.bb
>> +++ b/meta-python/recipes-extended/python-cson/python3-cson_git.bb
>> @@ -13,7 +13,7 @@ SRC_URI = "git://github.com/gt3389b/python-cson.git;branch=master;protocol=https
>>  S = "${WORKDIR}/git"
>>  
>>  RDEPENDS:${PN}:class-native = ""
>> -DEPENDS:append:class-native = " python-native "
>> +DEPENDS:append:class-native = " python3-native "
>>  
>>  inherit setuptools3
>>  
> 
> It would be better to backport https://git.openembedded.org/meta-openembedded/commit/?id=40b4cf5a83098a5f1be873be5c29f26380bc7993 instead of this patch
> In the current state :
> root@qemux86-64:~# python-cson
> Traceback (most recent call last):
>   File "/usr/bin/python-cson", line 5, in <module>
>     from cson import main
>   File "/usr/lib/python3.10/site-packages/cson.py", line 11, in <module>
>     import argparse, copy, json, sys
> ModuleNotFoundError: No module named 'json'
> 
> I'll send the backport.
Here it is :
[meta-python][kirkstone][PATCH] python3-cson: fix run-time dependencies
https://lists.openembedded.org/g/openembedded-devel/message/106881

With the backport the python-cson tool does start so this patch should definitely be dropped in favor of the backport.
root@qemux86-64:~# python-cson 
usage: python-cson [-h] -f OUTPUT_FILE [-v] input_file
python-cson: error: the following arguments are required: -f/--file, input_file

Regards,
-- 
Yoann Congal
Smile ECS - Tech Expert

