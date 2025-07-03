Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 076E7C77B7C
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 09:01:45 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.17782.1751533297858443157
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jul 2025 02:01:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CKkna0sW;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ae360b6249fso1049910866b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Jul 2025 02:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751533296; x=1752138096; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5EAChF5fCpQmO/CAtTjq3N/yTL4jGhtUTu82a4UbTmk=;
        b=CKkna0sWlX8uF1AbFtwM2UGA1q4/oc5poKoo6CasEhNRBpg/p/mFCwb3Etm40SVvdo
         LiwfXYzignhqN5FP+nN07VDOKd3Z2x9wbz6otpQccU2XKai4rck19B11BIYx0fgGl9yO
         1uml6uwpy9yNNFQVckHZAIY9evLPQFpj2MGotekb1W9k420YN0HkhRQpUEQNYbtJSTig
         8C4Fb1x/bhD2IvGuIkL5RJCYAjMdGJVsX38u9Qkqco72J+MWnLgPOtRAEfpHEleu7lSm
         BBwQ2aLc3UOz3ngbtXTc/5E2sLApDvLFLFnsa/WTZZCWgIStE8P5p+NgI+zyhCYsj92a
         Pzsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751533296; x=1752138096;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5EAChF5fCpQmO/CAtTjq3N/yTL4jGhtUTu82a4UbTmk=;
        b=d/gqYmntCj4yWhmJplTrHFZcSSxqYrheAuUK7JxMG2RCv5MMqVxMXe81/ClYKpLSqw
         VL4OmR9BYS/xHJkROQeGd2qyY58uovdpRDMhcATJhjAAvrUwRB82mNrpw8uhTzegc0gW
         4P8aooD8857adx1BAvKVxnA0+iVxzpucKZChNG0ZuQgv7DiVOqDBoAsnTbspqx9sD/lO
         uIzBEH16oogLzfdKbVdbM6C1wbUH7CfmoA4OmfKHt8SodcebZ70hIYwc9TfsJwtDuaaU
         u+36LFiKMoWVas+cYx6D5yqMAj42sSsUf4pGRWbz7uyQxhW9cw3JLFnVUAj9DpyVZeCO
         yY7Q==
X-Gm-Message-State: AOJu0YzPcrqyaVmQNvoBGARfzmV8tpET/VGe4JTSUCZ1liajGkWzeWlJ
	dIkvZo/R/PEu/XjysZvWqAhuTWm5KHKJ2lgla6Ep761p6IXwsRQ5ZgZL
X-Gm-Gg: ASbGncuiAQixyemJ7LH1mB04Kd5kr+nAMfPRbgSJHgCbSEE9pmUIftn9UyrS8SWYB9H
	0JB6S91dLD3qaxTf7R4CByu6P2cckcnhGPs+bbyOJKx3otr4WpqPLZ7mxynADZBaslccisQc0zM
	D5D/FuFUG2BuEhl/VGURJmqbKC9StBimzrFcF0kE5m9lZubRRVz666mwWM41eEFUqQkEzPEeQEa
	SQMZr0WJ4xx0bbaf4ZzyLSTvDukc6VfD9QsvWYyx0aFyOdcTvLL5R6a+N0AsjUMnKpQY0JmrlTi
	W9e82rI878/4a/HynD6KVchH5O/3dlpskWMcdUrc7hYTsMNiFFkIe7+fz0eNs8n8F9/GgdKX+ew
	mH52f
X-Google-Smtp-Source: AGHT+IE83aADZQ4MIKWvAZVLSaPY3JkGAbdfNoCdBz+LGlX0stgQQefQl6QQ2DTIbf1mLPi6VRhxuw==
X-Received: by 2002:a17:907:1c16:b0:ae0:d804:5bca with SMTP id a640c23a62f3a-ae3c2b59e71mr535106566b.17.1751533295580;
        Thu, 03 Jul 2025 02:01:35 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b0f9sm1218640466b.5.2025.07.03.02.01.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 02:01:34 -0700 (PDT)
Message-ID: <c6553390-69ea-442c-a339-1cac17fbe342@gmail.com>
Date: Thu, 3 Jul 2025 11:01:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] mozjs-128: avoid using build host's rust
 toolchain
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <184EB1345CA463A8.15677@lists.openembedded.org>
 <5042bc5b-59ad-4ec8-9e6c-7bb1b55c7c08@gmail.com>
 <CANNYZj9XpCRxX4FqjzmpmF4bTBxgVvRRFOG9GZfytDwrERnwHg@mail.gmail.com>
 <CANNYZj-Yfqx_wsoOCt_vUfh-wa8V-CuL2cKKdWo-WyXzfpRg6w@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CANNYZj-Yfqx_wsoOCt_vUfh-wa8V-CuL2cKKdWo-WyXzfpRg6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Jul 2025 09:01:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118217

On 7/3/25 10:53, Alexander Kanavin wrote:
> Forgot to add, the patch is fine as it is though. Two lines are ok, a
> mass copy-paste-tweak of the class would not be ok.

I do like the cargo_common idea, and even fewer lines than 2 and would
be safer too (it wouldn't be just 2 random variables). My test build has
just failed, but if I can pull it together than actually I would prefer
your suggestion, and will submit it as v2.

>
> Alex
>
>
> On Thu, 3 Jul 2025 at 10:48, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>> cargo class is intended for components that use cargo as the top level
>> build tool.
>>
>> If they use something else, and cargo usage is 'hidden', then the
>> correct class to inherit is cargo_common - if it misses the needed
>> bits or does too much, then that class should be fixed.
>>
>> E.g. see how librsvg recipe works.
>>
>> Alex
>>
>> On Thu, 3 Jul 2025 at 10:43, Gyorgy Sarvari via lists.openembedded.org
>> <skandigraun=gmail.com@lists.openembedded.org> wrote:
>>> Alternatively, instead of inheriting rust class, cargo class could be
>>> inherited. This would set up the correct environment also, but would
>>> also need to override the do_compile task, with something like
>>>
>>> do_compile(){
>>>     oe_runmake
>>> }
>>>
>>> Though IMO it is technically slightly more correct, I find the two
>>> variables in the patch easier to grasp. But if someone would prefer this
>>> (or an other solution), I can submit a v2.
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#118214): https://lists.openembedded.org/g/openembedded-devel/message/118214
>>> Mute This Topic: https://lists.openembedded.org/mt/113962964/1686489
>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [alex.kanavin@gmail.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>


