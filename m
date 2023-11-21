Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C508BC61D92
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 13:17:19 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.39527.1700572634450823514
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Nov 2023 05:17:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jsZLoRGF;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: zboszor@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a00b056ca38so189648066b.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Nov 2023 05:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700572633; x=1701177433; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xFZBrgLByFvDb8kEcj6ZQ/OjVkG1XxwDbzqemxwxm4Q=;
        b=jsZLoRGFgzTrxfCdNr1lqiPh+SawBwfo/pHAHB4ZJ5sBSqK2OseV17Z15Zc2cmvGvm
         nB6wDbnvqgUBfy2EHdvK7vMcoR7fraTgmf576GcfcACM31KqaESUgC/gkGpMM2q4RKOW
         cXvZ4JJQWS99iPEcSmGhhtFDr+gF/CWB5DM3utVuIKPXhsAmH8E22qBwb+B7ONnSj3G8
         XPk6vSZBqaQltLTbBgREJ3goNii6dmEFa0OyMnCGxLOwVPu3AY8eSTL3PFhUtIURo4AX
         ykoROvBKFfC+pZ5k9rvGUPOZ8so6oR1spWzQDQUnMVh4pwLqYq5W6J/waI4pSTl2YPh4
         YNZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700572633; x=1701177433;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xFZBrgLByFvDb8kEcj6ZQ/OjVkG1XxwDbzqemxwxm4Q=;
        b=YLXW95gly9ZiWfDj7ZNVimSM6FLOvtJXYV9jFPyk+KS/4IJwfBGZIaRpa+55D/YWIB
         ozSDHOl8lfvDvw8i9f43Ic2vvsSF/BswYEPvtUQKhU6TQ0Ue5xQ0cWfFWANfnPAwaCo/
         Huqpi51Ocl+vtzmuU/HVQZN+Be1JkvUHBw+Vz7lVTtquPNqrMb5l/NGQMeH7nNjefTD1
         0C8VBZcodu5GcicVPvY+h6ZSOupyqn+Hsj6GYEG8643azEdrYwGb4biCo4wzPDVK6u0Y
         XHmfFptqBvixwOGDl2ceQV42d2StaP5163xmv+YeX66OCWZF76cHk4ZA+NYhJzyyTGTC
         NAkQ==
X-Gm-Message-State: AOJu0Yx4uQ+H+jKkceZMktOVw2DcwTyEWmGjNWlFM+xHfR9RwVlKCu2s
	/8VpiMDDYo+7Qp4Ztms4rGM=
X-Google-Smtp-Source: AGHT+IEPMsd9sRicBY6LMGC4FN0pYexCFuERSAlIeG1py/ctDVcNj2dkD8cNJ1ydnLkSzhImpqBEfg==
X-Received: by 2002:a17:906:3284:b0:9e0:2319:16f0 with SMTP id 4-20020a170906328400b009e0231916f0mr7247932ejw.65.1700572632610;
        Tue, 21 Nov 2023 05:17:12 -0800 (PST)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id rs15-20020a170907036f00b009e62bb0439bsm5205516ejb.212.2023.11.21.05.17.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 05:17:12 -0800 (PST)
Message-ID: <e1f2b407-40ed-4840-98a6-44d600583b1d@gmail.com>
Date: Tue, 21 Nov 2023 14:17:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 2/2] webkitgtk4: Add recipe
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
References: <20231121130233.1381225-1-zboszor@gmail.com>
 <20231121130233.1381225-2-zboszor@gmail.com>
 <CANNYZj8rvwophdS_ErcihSMA13JF=MVhUzLsDZB+KcSRftOoUA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj8rvwophdS_ErcihSMA13JF=MVhUzLsDZB+KcSRftOoUA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Nov 2023 13:17:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106979

Sorry for the noise.

2023. 11. 21. 14:08 keltezéssel, Alexander Kanavin írta:
> oe-core already carries the gtk4 version of webkitgtk. webkitgtk3 in
> meta-oe is a temporary recipe until all consumers migrate to gtk4.
>
> Alex
>
> On Tue, 21 Nov 2023 at 14:02, Zoltan Boszormenyi <zboszor@gmail.com> wrote:
>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> ---
>>   .../recipes-support/webkitgtk/webkitgtk4_2.42.2.bb    | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>   create mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk4_2.42.2.bb
>>
>> diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk4_2.42.2.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk4_2.42.2.bb
>> new file mode 100644
>> index 000000000..6efe8577e
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/webkitgtk/webkitgtk4_2.42.2.bb
>> @@ -0,0 +1,11 @@
>> +require webkitgtk.inc
>> +
>> +DEPENDS += "gtk4"
>> +
>> +EXTRA_OECMAKE += "-DUSE_GTK4=ON"
>> +
>> +do_install:append() {
>> +       if [ -f ${D}${bindir}/WebKitWebDriver ]; then
>> +               mv ${D}${bindir}/WebKitWebDriver ${D}${bindir}/WebKitWebDriver4
>> +       fi
>> +}
>> --
>> 2.42.0
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#106977): https://lists.openembedded.org/g/openembedded-devel/message/106977
>> Mute This Topic: https://lists.openembedded.org/mt/102727581/1686489
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


