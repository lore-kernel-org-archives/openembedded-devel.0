Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83EF8C7618D
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 15:01:55 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.16596.1679324507310578742
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Mar 2023 08:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mNiBxFgu;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id ek18so47943138edb.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Mar 2023 08:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679324506;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2PFo09NbHAiQa3Ivz8cTcPsy8qleTi8nYy94Yo3ockY=;
        b=mNiBxFguXxWaOAXyel9ovBopPtfjT4vubxQ2s2dcXwWzlo/1tkQ9FsY8dz+lM0y8be
         qhr0U9nW5eNhPx3gMwosAScNJb6K9GFZcX0zf30ZeWH4ZstaziEbPGakMhMRphFqCo49
         75dqlFZjM0CSdH7ZPOTTBnvotCF27cmqCJ+FSQroL9pu8o4g5MDZmm0otLTBMRx37P/s
         N0bznly/BlJ67aQINkoj2bykxsyNJkfhO1qcEcAH76TTigBzOLnQQd/xu9xA1dhd3p7z
         0dCHSup7xDhQ/P9g6IBUlWn/mRZgBgYryHYhu3I3R59ed8D1f2dlnhbcSBjnSOtgL9HE
         7gYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679324506;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2PFo09NbHAiQa3Ivz8cTcPsy8qleTi8nYy94Yo3ockY=;
        b=TqXUKP7r4Ts6Hlo4sqPts0IYxV+3cMfBJz64oIqDeCVSvag6ikeMdKy17yPep0avuU
         cpkcbEUr7ZZkPlw/RZystOgT4lPIy05wJZdJukJQsabAeUoxvaDEUvAtPG0WrISXcxMm
         4vkYR93U638PjRg1pR+MCsf+YxEaAcOj7f9G/uhsJAShg8iw8xvfZX7ciIvYHQ0Lgy0p
         JlEPLw59VaU7rCNSLuD31Tu+8MVE1LTIp+LWci/dKOp8Jhltk7UbZAPqagK5U0ZoHD/K
         13c9OxfZLNMFFaIKKpAOOpMVxwY7eWKu+2GGSref1BhaqxCxe09jGcahGCMmAIc643NV
         Pbig==
X-Gm-Message-State: AO0yUKXBoun3gWzo+rSWuXAhd3jzMJbGTMjVcRS7P/L70thpAZnVGjR8
	SqzGzqEnqrLj/d2Zp3K7EWI=
X-Google-Smtp-Source: AK7set9KeJKpB4XxaYQT6vnwp0DWmVNo6AW7cGWoBJe3TSfSqQvgJMasmxEwzIV7LGv+gOdFJ8ZnYA==
X-Received: by 2002:aa7:c059:0:b0:4fa:7fd8:8f6a with SMTP id k25-20020aa7c059000000b004fa7fd88f6amr11297178edo.38.1679324505680;
        Mon, 20 Mar 2023 08:01:45 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id u25-20020a50c2d9000000b004faf34064c8sm4968666edf.62.2023.03.20.08.01.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 08:01:45 -0700 (PDT)
Message-ID: <14fa0c81-90ec-18c0-9bbf-a1769cfb743f@gmail.com>
Date: Mon, 20 Mar 2023 16:01:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [oe] [meta-python][PATCH v2 1/4] python_mesonpy.bbclass: New
 class
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20230317072547.1031123-1-zboszor@gmail.com>
 <6646B534-8948-4706-9E8A-DAEA4111B694@arm.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <6646B534-8948-4706-9E8A-DAEA4111B694@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Mar 2023 15:01:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101610

2023. 03. 20. 15:46 keltezéssel, Ross Burton írta:
> On 17 Mar 2023, at 07:25, Zoltan Boszormenyi via lists.openembedded.org <zboszor=gmail.com@lists.openembedded.org> wrote:
>> +inherit setuptools3-base python3targetconfig python_pep517 meson-common
> I still don’t see why you need to split the meson class up.

See the other thread. For some reason, meson always wins
regardless of the inheritance order, so do_configure has
meson_do_configure instead of pep517_do_configure, etc.

>
> Ross


