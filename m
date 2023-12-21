Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C065AC35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 09:44:58 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.47953.1703151893496400820
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 01:44:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=kmvz7X6T;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40d12b56a38so6085665e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 01:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1703151891; x=1703756691; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LyLoCRVMMZhXo68lDMVpuoo0jUL3paPwLi2njt+AqIc=;
        b=kmvz7X6TTwOTeLgxSQUESF2zihX2rWrAHY12OJxa//7ke06dmNK5HWmfjphOgVOncw
         CcOd/aUZvVXyOlfrdk05rREQ6CNu73ZcVBwgfL+nc5pksgPsn13expgEv2XHADGjamz/
         A3vEmoBHEEsU+wwGDV082oWh4CBBmz8geOv9WZ6d2Uup+WqzYsP9aL6l78i58IUYrWXj
         G2haLhlu1OH2xlWBGa0JIzoJ/HlwjepRI24hbGIyiRE1wDX/7i7HfVDnJhJ/jtSMUHIo
         F/GP8EgRQ8zCRGiC+uE+/FiiCuyQYlMF1+4mABjpFZ0f50BcFlrdOln/oDL6+m13O/pI
         fY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703151891; x=1703756691;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LyLoCRVMMZhXo68lDMVpuoo0jUL3paPwLi2njt+AqIc=;
        b=WB2XF+0w3mzbJraPmH9s4vZ1/o5hjVx67N2pnDTwJRIsFLJ1l/fhofEv8J7k6uLysF
         AhHAAgFVkC1XtrA44vfe51VlR6GHfL7pecNvmdBXBbsNNOhcjeh2JXo9kcxiRtCvKqqc
         9Mq5fhEpM8Iz6n7RS4VE7IHqA6cMDEWJbjkC0Sqplhy1rU10FHtx+a7XFXobsTBkQ57r
         Ivm6XiJbfouea086LyfxM27Z2yXNUKpFP1VChTN0OCqUvHTRIfVFVg9XY7v5Sox8Z6S8
         F6HqyGXTBcC6yFKfh39MhYSam+D8ZYzHhVYp69+OtkH9Vy6ThE6atiNp4Lm4Y94O0BPf
         tfrw==
X-Gm-Message-State: AOJu0YyckI2JkTWAEN1JIhRTapVgEVb80Qbid3lp+GP6DYqIWar90eKy
	Hvik4NmFjW6MlYfobvu6OtKtlaEOMC+wbDPCNew=
X-Google-Smtp-Source: AGHT+IEycD+ZZlSoerkWDq9xj1up44E9SWAFAgS9uXvaUI/BlYY08p19mmf2h+XtgO73K8LnXvj9PQ==
X-Received: by 2002:a05:600c:524c:b0:40c:330f:f2fc with SMTP id fc12-20020a05600c524c00b0040c330ff2fcmr224756wmb.355.1703151891313;
        Thu, 21 Dec 2023 01:44:51 -0800 (PST)
Received: from [10.1.75.166] (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id c18-20020a05600c0a5200b0040c6d559490sm2719548wmq.3.2023.12.21.01.44.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Dec 2023 01:44:51 -0800 (PST)
Message-ID: <b4bb9324-80b9-452c-be5a-ffb8d51d1d55@smile.fr>
Date: Thu, 21 Dec 2023 10:44:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] python 3.12 - help needed in fixing meta-oe failures
To: openembedded-devel@lists.openembedded.org
References: <CANNYZj_RSUUieQcKPkmrVft7fGmVHzR4yjL0wFGDBLx_wBghig@mail.gmail.com>
 <8133.1703001181390498333@lists.openembedded.org>
 <CAMKF1sqnSpuH4mKvA2tqMwh+XLOT_Bio42oF-eu1cvJH9U6MAA@mail.gmail.com>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <CAMKF1sqnSpuH4mKvA2tqMwh+XLOT_Bio42oF-eu1cvJH9U6MAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 09:44:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107704

Le 19/12/2023 à 16:58, Khem Raj a écrit :
> It would be good if you could send the patch this mailing list as well.

Sent here => https://lists.openembedded.org/g/openembedded-devel/message/107703

> 
> On Tue, Dec 19, 2023 at 7:53 AM <nyantra.ranaivoarison@smile.fr> wrote:
>>
>> Hello,
>>
>> I send you a PR for this error:
>> /srv/work/alex/meta-openembedded/meta-python/recipes-devtools/python/python3-click-spinner_0.1.10.bb:do_compile
>> Here :
>> https://github.com/kanavin/meta-openembedded/pull/1
>>
>> These ones have not been maintained for years, maybe it's best to remove them:
>> /srv/work/alex/meta-openembedded/meta-python/recipes-devtools/python/python3-oslash_0.6.3.bb:do_compile
>> /srv/work/alex/meta-openembedded/meta-python/recipes-devtools/python/python3-xmlrunner_1.7.7.bb:do_compile
>>
>> This one should be fixed by this patch: https://lists.openembedded.org/g/openembedded-devel/message/107547
>>
>> Best regards,
>>
>> Ny Antra
>>
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#107636): https://lists.openembedded.org/g/openembedded-devel/message/107636
>> Mute This Topic: https://lists.openembedded.org/mt/103036574/4316185
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [yoann.congal@smile.fr]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

-- 
Yoann Congal
Smile ECS - Tech Expert

