Return-Path: <robert.berger.oe.devel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF80C4332F
	for <webhook@archiver.kernel.org>; Mon,  2 Jan 2023 00:19:20 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.25110.1672618754578977905
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Jan 2023 16:19:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HXxKVZ03;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: robert.berger.oe.devel@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id i9so38080738edj.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Jan 2023 16:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0Q3/HmOZvJtJ+owxP3efkWQV7c4nP4tcP/jc4ntdUHE=;
        b=HXxKVZ03WpMtn+5D3oUjj4TfI9QhbISRH3n4lsDSTbmAmL+UI8wLEQB5XkeT9/ZhJM
         kpYj+Hofr6dolj27yvMGqYh+7w0Ha0rYLJCLAGOVdYmcQC2g9uugILtc59V8yR3Zt84I
         QMKqu2+DNldPhjTZ+Gg6Tmj81mebpPx5A+xp53KStxtf9D3aDWS0+l9CY8YQ9DvxKGeM
         L/Ua3z6Ow5Lif0rE3zjDvXPxp3jgF+RdsJHexXNmBiORtyfnRBnKwdaCBwh/cTYYgjgO
         StG7gkEZsWkyKpEnvIik6B9LZsbv8EoG0b7NtAb2lLP1f75P0076BP0JKFiupHtONBTJ
         4sqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Q3/HmOZvJtJ+owxP3efkWQV7c4nP4tcP/jc4ntdUHE=;
        b=hsNcEfhmQVaIDeKAQgWrNS2jeY/oN+tBatvb4hG0UdYjOcshNdfHzeaKPq1NlE9juv
         7bIRAV5l6tgS2TSkVxDyk0JMgR8KtzbPY13tIif5OV3R/xGWbXWUf9L0CqDXrN9QyS1L
         Y16MYT1owDP1+ta0X2NfVatfjdJVEcsF77I0EwdmLpjxmJJ8qdl0fkKM3biuDkrYttBm
         /87DL6GCS349kJQePzoou6Dy+5sihKIP2OwYWAzAco1KGBHQuhLMvXkfa0ogoRJVQAhA
         M7leXSIgHU9iWQ78PuvklnJlF1MwFDZ5zE/kvqLM7FXsviQpreH39JIe+ILxaboTBrEr
         tt/w==
X-Gm-Message-State: AFqh2kp0V1WmTXkApc1LAkGpmCz/gcFWAq5r1c7YMICZ4Fm4qSFUuyHu
	5QX6JRKBj4BvENzzflUJcbw=
X-Google-Smtp-Source: AMrXdXvqhxo3rRh8WZddQZ3GmorzpRHXG4MRNHRNHRSS1B7f/qYi5vKe7iIaJ8wZtpy0q6BFrQlv3g==
X-Received: by 2002:aa7:c911:0:b0:48d:4504:32ed with SMTP id b17-20020aa7c911000000b0048d450432edmr3533697edt.37.1672618752738;
        Sun, 01 Jan 2023 16:19:12 -0800 (PST)
Received: from [192.168.42.52] (62-46-12-64.adsl.highway.telekom.at. [62.46.12.64])
        by smtp.gmail.com with ESMTPSA id f20-20020a17090631d400b007bf24b8f80csm10217514ejf.63.2023.01.01.16.19.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Jan 2023 16:19:12 -0800 (PST)
Message-ID: <4287ef78-7ba3-67b8-8cc2-7e0615526999@gmail.com>
Date: Mon, 2 Jan 2023 01:19:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe] [meta-oe][PATCH 1/3] libtraceevent: Add recipe
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20221222090825.176892-1-raj.khem@gmail.com>
From: "robert.berger.oe.devel" <robert.berger.oe.devel@gmail.com>
Content-Language: en-US
In-Reply-To: <20221222090825.176892-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Jan 2023 00:19:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100336

Hi Khem,

I saw issues with libtraceevent and trace-cmd when building an sdk or an 
-sdk image, since they seem to install the same header files on the same 
place.

I think I tried core-image-sato-sdk and also to build an SDK with it.

Regards,

Robert

-- 
Robert Berger
Embedded Software Evangelist

Reliable Embedded Systems
Consulting Training Engineering
URL: https://www.reliableembeddedsystems.com

Schedule a web meeting:
https://calendly.com/reliableembeddedsystems/
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--


