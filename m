Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 824B2C7115C
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 16:08:21 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.520.1750435697601987213
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Jun 2025 09:08:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=jB6AHn+h;
 spf=pass (domain: konsulko.com, ip: 209.85.208.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so3417544a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 09:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1750435696; x=1751040496; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OY5uTVe9j3ca2Nn/EFgGo6d33AFzSLnLjWyaL7EHYGg=;
        b=jB6AHn+hvt74r+SEp1cvST6hE57YvUMbRUfLkncycupNkwhapCzYbKlmSP0NwEV1WB
         E7VWSshyKe7DrknQkpHyytYZeA7SduGdvPT8C/3g6xDcED9BF3kml8ow7W5oUCskT2Zs
         o060SFW+/C4f9HFM0kMHj6MOXy0YcsKJ0Q5vk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750435696; x=1751040496;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OY5uTVe9j3ca2Nn/EFgGo6d33AFzSLnLjWyaL7EHYGg=;
        b=BYsxZ/Gs5Vaz3tuaCvgU+TNic9MRal/5NHe6UAyUSIDpIwc8tCg3KrbQLFW/ZK5Hl1
         xYnknVPiETwJMZwwczSJFFE040av0Rnd2eumhCHr4iegzhd1G5a3l/Z0TnXPtQjy1wEY
         wsIh8AEO2mXhc/xEy2LfiT+zCt1Ls/b/bMCmWjfOjxTSZrBnmiodGyU3gUR3qJ7S+smY
         t03aWPqhxV9dJ2/ATg3R6dbAUHjuVmXCcibCvRW4sh8jFnIJ2nZlKxYmRUNyt/0BmRFl
         57lDkD7tEoAXDjYvNW1O0zFks5wuvTT17I4jRsuTFfpsq60Ff9FK1Ls9Zzuv6+u7fwW2
         oWPA==
X-Forwarded-Encrypted: i=1; AJvYcCUjzhc/wuRofYaxw4xHEpV3YsbYt+4LEhBazssW5ifNZ188It5ZsBuMeufgva1QrpJIcgTV4ZMluu+YzIsz5WgK4W8=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyUb/RK9ALNL1VAugHJ/NsmW/ICBUaQEUIyiodpyLFe6JN4/Pit
	euyljI+x/WIitxKNXh2QX6hQ5ew9OGqxgTAIDfK7n+yA4hzUn/nu3hKXi4pptGC6iLA=
X-Gm-Gg: ASbGncvuBT2XWAW+K4b+oZnIKYxhgsbAKt6NDRRd/v5ISfhVBbPCnLggHKTArueqtqD
	+5LZQ9igYkbNRJvlw6jH+V8ZmdWUptUeRPAa1srUnBwDnKwiI4QFEKnq8o9nfPKLwvUuo7IwXnw
	asThoIugKDxaeu6vlsJOeucWJD7Yo3SA3Tz++znlLs5jPjfhhQMVQ4neMvnwTJJHlWgwdQhHoUD
	EvZxqjQMzbiDfN/tpfMF3aj3mDkejq2wFLr8o+c7xym5xR/WoLRHjNojAVbRqBvPSDpCFtTLvA2
	FyyOdzh1Fi1HJiO2r865R1jVBCZc6hdnaARMQydTHymAEUIP5+WTwX2jY/KRzl+4vACXXi6EXRk
	/Q7pL
X-Google-Smtp-Source: AGHT+IHBoz+0dKxrGmY7LLk2wz3XXp0NcBkJ5ecdqJ9Z7qTZEraO7TCKfa/a8hCo7TP09ptmUsOXLQ==
X-Received: by 2002:a17:907:3c82:b0:ad8:8529:4f77 with SMTP id a640c23a62f3a-ae057b6c33emr370128266b.38.1750435695907;
        Fri, 20 Jun 2025 09:08:15 -0700 (PDT)
Received: from [192.168.5.161] ([46.55.231.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18504eafsm1607195a12.10.2025.06.20.09.08.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 09:08:15 -0700 (PDT)
Message-ID: <eb968874-e35e-4f3b-a757-0d07731043d3@konsulko.com>
Date: Fri, 20 Jun 2025 19:08:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] paho-mqtt-cpp: Upgrade 1.4.1 -> 1.5.3
To: Gyorgy Sarvari <skandigraun@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20250620104239.1709240-1-leon.anavi@konsulko.com>
 <96744e6a-cfb7-4b13-a135-e6f1d26e3d82@gmail.com>
Content-Language: en-US
From: Leon Anavi <leon.anavi@konsulko.com>
In-Reply-To: <96744e6a-cfb7-4b13-a135-e6f1d26e3d82@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 16:08:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117981

Hi Gyorgy,

On 20.06.25 г. 14:37 ч., Gyorgy Sarvari wrote:

> On 6/20/25 12:42, Leon Anavi via lists.openembedded.org wrote:
>
> I added 2 minor notes.
>
>> diff --git a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.4.1.bb b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.5.3.bb
>> similarity index 81%
>> rename from meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.4.1.bb
>> rename to meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.5.3.bb
>> index 6f2efcda50..0093936786 100644
>> --- a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.4.1.bb
>> +++ b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.5.3.bb
>> @@ -10,10 +10,8 @@ LIC_FILES_CHKSUM = " \
>>       file://epl-v20;md5=d9fc0efef5228704e7f5b37f27192723 \
>>   "
>>   
>> -SRC_URI = "gitsm://github.com/eclipse/paho.mqtt.cpp;protocol=https;branch=v1.4.x \
> The protocol could be changed to git:// only I believe. The only
> submodule it seems to include is paho-mqtt-c, which is also added as a
> separate build-dependency below. The submodule is only used when the
> PAHO_WITH_MQTT_C option is enabled, which the recipe doesn't do. Also,
> if it is changed, a ;tag= tag would be good.
>
>> -           file://0001-cmake-Use-CMAKE_INSTALL_LIBDIR-and-CMAKE_INSTALL_BIN.patch \
>> -           "
>> -SRCREV = "ac1b023eab789e829656144f12b248602c40e37b"
>> +SRC_URI = "gitsm://github.com/eclipse/paho.mqtt.cpp;protocol=https;branch=master"
>> +SRCREV = "17ff3dc0270738adc710667be44847eebc038ae0"
>>   PV .= "+git"
>>   
> The PV extension isn't required with this update.


Good point. Thank you. I submitted v2 of the patch with both modifications.


Best regards, Leon


>
>>   DEPENDS = "openssl paho-mqtt-c"
>>

