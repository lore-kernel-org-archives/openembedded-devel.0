Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C60A4C3271E
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 01:47:46 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.3313.1720489663800877091
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jul 2024 18:47:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=QX9YR/XR;
 spf=pass (domain: mvista.com, ip: 209.85.167.181, mailfrom: jpuhlman@mvista.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3d932b342bfso877849b6e.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jul 2024 18:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1720489663; x=1721094463; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OfX/KUO/2nH1LbNVkq8gmwZqyDznDnRBCQAS2zwikMc=;
        b=QX9YR/XRigPCRJm+4NCUCXsUf3dDcPJcuoSkqflrix3pGBf8kPX1Z71QNx/QpSv2j1
         iMX56paVbTlqn2RbbfNEHZcDaBb5bcbm9cUgHAEwIh0/YWzgVHDuSmzFM+NoM2NNrWHq
         i6HnP23E6wHcGxCAHci6vDaVHaI5q1vEpszuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720489663; x=1721094463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OfX/KUO/2nH1LbNVkq8gmwZqyDznDnRBCQAS2zwikMc=;
        b=PsLxq6wZasAkOxAo1V9fDb0xllqbRO44/lQnYcZnQ6cpcIyHR99R3yNV0LDFi+qoH5
         l8EpP8mmcYd1hzuluXEj8/ERWmBSfx1QqVY1L2ZJAsSYPPBkIHXTT8TIRZmD+BMyxm0b
         t1QTTo30FCLB8XnLj4jq98eCAMv4R7zVVm++3nfkB4qI9l3MXDmwqd8Jl+822584gtU1
         sxjTlalP/kbKpvR6jm3TAS5V5BxiT7Hqb6ViS3vGui73o8czG/MbZ4CzH3k+BE1+VchH
         368AgxrHVoQiF9gk1zEuCKnoHO+sbTc55Ae5MHecAglRdgsgctmGEsUjGBJXg7XImTaI
         +APw==
X-Gm-Message-State: AOJu0YzDh2dEARRHubBuZBYgVQWtGuGvrqvv9rotg95+SRo8PAYk4Xaw
	kfzKykkB4PY1+jWDoOaCoMDRovxQp7vkkw9Mb12I2hhvXTx92V1k29WkFPptxx8=
X-Google-Smtp-Source: AGHT+IFrgrB9jYaXLGXw7WxQQRKkuyqqanDuH3NbKxLCvrkZtpnu2BWFjezyLAK13cjBL3lLHFHCPg==
X-Received: by 2002:a05:6808:159e:b0:3d9:30a2:f8f1 with SMTP id 5614622812f47-3d93bdd2704mr1121811b6e.8.1720489662414;
        Mon, 08 Jul 2024 18:47:42 -0700 (PDT)
Received: from [192.168.1.9] (99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b438c6c6dsm554639b3a.80.2024.07.08.18.47.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 18:47:41 -0700 (PDT)
Message-ID: <ac4cf2fb-f54d-4c75-83dc-e0bc7619ec6b@mvista.com>
Date: Mon, 8 Jul 2024 18:47:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH] net-snmp: Set ps flag value since
 it checks the host
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20240709004123.1330033-1-jpuhlman@mvista.com>
 <CAMKF1srskTrmMq84r=Cb60yZnBkbDu_hL7eWc8CnHVqF1Vvcuw@mail.gmail.com>
Content-Language: en-US
From: Jeremy Puhlman <jpuhlman@mvista.com>
In-Reply-To: <CAMKF1srskTrmMq84r=Cb60yZnBkbDu_hL7eWc8CnHVqF1Vvcuw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jul 2024 01:47:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111273



On 7/8/2024 6:00 PM, Khem Raj wrote:
> On Mon, Jul 8, 2024 at 5:41 PM Jeremy Puhlman via
> lists.openembedded.org <jpuhlman=mvista.com@lists.openembedded.org>
> wrote:
>> From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
>>
>> The value the configure script uses is picked up
>> from the host machine ps, and there are cases when
>> the flag selection can be different. Which would
>> break reproducablity between builds on different
>> machines.
>>
>> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
>> ---
>>   meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
>> index 75b3d9e8c..989ec5413 100644
>> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
>> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
>> @@ -73,6 +73,7 @@ CACHED_CONFIGUREVARS = " \
>>       lt_cv_shlibpath_overrides_runpath=yes \
>>       ac_cv_path_UNAMEPROG=${base_bindir}/uname \
>>       ac_cv_path_PSPROG=${base_bindir}/ps \
>> +    ac_cv_ps_flags="-e" \
> While this change seems ok, I wonder if then we also need to ensure
> that procps provided ps utility is rdepend'ed upon too.
All the usage there is to see if snmpd is actually running. Any value 
that works for all of them would be reasonable. I thought the
assumption was that busybox was always on the system and busybox ps 
accepts -e with an output that should work. Probably
don't need the rdepend, If base busybox is still assumed.

>>       ac_cv_file__etc_printcap=no \
>>       NETSNMP_CONFIGURE_OPTIONS= \
>>   "
>> --
>> 2.35.7
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#111270): https://lists.openembedded.org/g/openembedded-devel/message/111270
>> Mute This Topic: https://lists.openembedded.org/mt/107114904/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

-- 
Jeremy Puhlman
jpuhlman@mvista.com


