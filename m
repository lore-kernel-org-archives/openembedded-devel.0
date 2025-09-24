Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07783CAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 20:22:51 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web10.24373.1758745367207652525
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 13:22:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eCLmrYq7;
 spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-889b846c314so13088639f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 13:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758745366; x=1759350166; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dsibLesPgNWU7qg5fMr1ofsp46H4lIGqs0KpjX80pfI=;
        b=eCLmrYq7dS9igGCgLTbwstTvyzSXNXIUS8A7isEn/puAEaJH8/OTah0S6BfE5tGMb9
         NcHpryyMSuqEMYNHNxZ7YblaflkyH3lgkHPo6DJMNclLVM2YUabZ7CbSsKiUcdwnE2/v
         HqRPYCH/B/wxluAugTxJVPl65g2Lm4qSuJwmLgz7RrLwVByqOPjO3Vea9SoBJNnwbgEA
         huduKeS3rZcuCM01LIoCQugextYBXuh9jvFccyuhn0cjPQV/3XUebHcyRE9wDWnxdrbs
         IbW6F4pTQXxt7c2fnfYgXcfx40N3f/XqaJK9q1xHe+rYVkhrWfYlWktng7X7xunx/eRQ
         yX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758745366; x=1759350166;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dsibLesPgNWU7qg5fMr1ofsp46H4lIGqs0KpjX80pfI=;
        b=R1A2DTFbOdbCz9zJVfcS2OzOA06IC6fcWrT4qkLe7mFIppMZh1db7k2cIg/BNQiQ1t
         9eBYPC32SgbRR21UhBZ3tCtSJnDasfftML8US8JgNXVJgs5xvfoQV+Y2nyecZ6aDYkfu
         zeH2uE8Mc6845Ch7Wx3aUncwup3qxCOSuc6qIMyhfY2TxhlfvpzS+nl6zueveYX6d1m5
         /zckaUajsj9u7eWHKazRkeaPHNDsoVHBhSLdCUz91WZidF8XElftc14NaT67ygkWzqf+
         DEl5A2927I+KQC/KBmXWaYzdBNJHGF/sxFcCN+sqV45bDlu7x5BL8MMEJ0uyPhO4coFs
         FNUg==
X-Forwarded-Encrypted: i=1; AJvYcCUdB2JROdBvA4ULnL65PbEY2MxsEnI0iDCL4t5RVVl97FJBzDXGiZ0NSYoHdv8+pDL1fQNIldxlClqzR2nrPwmMiYw=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyjsyx55q9frbp7qw6Hmosf73yu4Y9agcP/Knduv+Dheji+J+id
	K0bsUHCO0H39tIT2mzAk1jp+r0O+xUBzvZjUygAp756nxrazjAdgRfA4
X-Gm-Gg: ASbGncuepyf3Q771wb1TNvkwIgNen9UD6RrftgsPUVMIyNUvj2cFv+lZ1qPj9JHBUjR
	0T9usaigFLfWRtB4neU32o+oCtaBowDhFQhoA2d4Dis4rbca3PmZJk3QJagaiZrNpVRD5YaOLAp
	9esdNV2sJfCKVYRNCZ7XjCxsnfqIgg7n0HsWNxNAAxJbLBwrEK7Cv3LvgStnVxqjMc2bZUTmvAY
	ko7LjE7fhF8F/WJo9XT/PfGS+euw1YLhViNn4RJK/a4mYzaEF+uInj/l3p8/YU8KBxzNSFO3SDX
	ohPzo5Sbgh4A+9Fu+xX95YqLvP2ZUogly5QcxArLqelc/JWiRfskPeqgr9kOZa62ktZ5BA76b2v
	GEx7tP1qhGyfCfF8l7JaW7SdbiYmX1d6T5ON/6SOYquKws6bDsR4vCzAUjftCtM5vZMel38vbme
	V69r45i7RnEMMi7ZUw3ptnHKb3mpaeWsd2gDzeCCBIAxU6ghOe5ArNPaGr1YZosyi0aNXGWGNtp
	+N8VKLeNOz0CA1eim8HNcpjnXq9GxY=
X-Google-Smtp-Source: AGHT+IH5g+ebCvB0C+D7eEOkjkhv7eirnHCrdTrWIZK+HZlf2vKAF35iNQfJ2Vy0brP/uE22pgwiJg==
X-Received: by 2002:a05:6602:160e:b0:86d:9ec7:267e with SMTP id ca18e2360f4ac-90150945249mr183748939f.4.1758745366357;
        Wed, 24 Sep 2025 13:22:46 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:289b:c5dd:de6c:a09f? ([2601:646:8201:fd20:289b:c5dd:de6c:a09f])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-56a65463b89sm66056173.24.2025.09.24.13.22.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 13:22:45 -0700 (PDT)
Message-ID: <3b73ef9c-29eb-46dc-bf50-e1a9da9fa620@gmail.com>
Date: Wed, 24 Sep 2025 13:22:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-perl] [PATCH 10/29] libmime-types-perl: upgrade 2.28
 -> 2.29
To: skandigraun@gmail.com, wangmy@fujitsu.com,
 openembedded-devel@lists.openembedded.org
References: <20250924090029.1786-1-wangmy@fujitsu.com>
 <20250924090029.1786-10-wangmy@fujitsu.com>
 <e437bbea-1399-495e-9c4e-bd11353b5934@gmail.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <e437bbea-1399-495e-9c4e-bd11353b5934@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 20:22:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119841



On 9/24/25 6:06 AM, Gyorgy Sarvari via lists.openembedded.org wrote:
> On 9/24/25 11:00, wangmy via lists.openembedded.org wrote:
>> From: Wang Mingyu <wangmy@fujitsu.com>
>>
>> License-Update: add following flags to section build_requires
>>    Test::More: '1'
>>    Test::Pod: '1'
> <snip>
>> -LIC_FILES_CHKSUM = "file://META.yml;beginline=11;endline=11;md5=963ce28228347875ace682de56eef8e8"
>> +LIC_FILES_CHKSUM = "file://META.yml;beginline=11;endline=11;md5=d3b01c1228de75a9de9ee0bfb6e0dcf3"
>>   
> The license hasn't changed, but rather the license declaration has
> shifted from line 11 to line 13.
> 
> Prev: https://metacpan.org/release/MARKOV/MIME-Types-2.28/source/META.yml
> Cur: https://metacpan.org/release/MARKOV/MIME-Types-2.29/source/META.yml
> 

good catch ! Please respin a v2 of this patch alone.>
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119825): https://lists.openembedded.org/g/openembedded-devel/message/119825
> Mute This Topic: https://lists.openembedded.org/mt/115408774/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


