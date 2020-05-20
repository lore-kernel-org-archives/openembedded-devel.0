Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web12.15488.1589989336462710720
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 May 2020 08:42:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oLHGXKc1;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id a13so1481687pls.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 May 2020 08:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=PjZmW3t8POxcmomC6kjyZvZ3pc54tW5+O09CV4F5/ps=;
        b=oLHGXKc1D9n+t9QeiPC6dFYPES7sHF5Yvkae+NTiMJi8rCQSZV4LEbcYAkCAKVfuU3
         GTbwrqVXKhkGWKbiEP9CqghCzDevzoVp/1RUHxT2t1gUhjZyb9U0JdIcPDM4RCbl61Zs
         RcWSLOalc0SZVXgKy/uFhmS6fw+wjBD3sNjKHF2gacTpHXwoJHedYd9LZWPY39DRylnH
         JoJ5RPSnwzRYKay7z2XRvNeOQ5AtXU8fwXY8ouMnaEwGy/KyPHS72TpvdK0mTB4d7zUh
         xHZG+7Np2vUjhHokqTSmErfoVQd0y6oAhQnK6wLIrPuXyWx2v+DJGwgCqkPzlZl3qvmO
         r9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PjZmW3t8POxcmomC6kjyZvZ3pc54tW5+O09CV4F5/ps=;
        b=I4c4AcYOck2a1Qz68PB3rIzlLbQRfe7PLStajpZYMkBNETyBqCxPuANec/VuqLZfA/
         fUZzD5Lf1heUbHTvfPJfCpSMRuWxYnFOGV0bcvXRM6Kj6YfysgQX6FyuXmt+q5WAqhzJ
         InfNbobTPPoj4VSHe5YVwGcJ1iP8qJRDaVhWWpW829sgi10NsTh4xjT77CYND+gSIVIo
         ErYBIVINO9m7OojW+d1k+t2w90UtAP5hQ0F8bhA9LyZiCPBAiRdAn+WcPmXE5cjtsT/n
         w6f/9msxYFqnp/TuHavG7S9iKxXRyF9EV+PxvLvQK5oCDNyCRi5Aeku90/YzUpiX5VW+
         4XNg==
X-Gm-Message-State: AOAM532wRQSPLUX869IxZi4w6+QiQZt8AxjiTyQ1bUJvu5BKZ5An3Bs+
	QVJI9giZBbABWvayOpsqeraspWwZMvE=
X-Google-Smtp-Source: ABdhPJxqN2puQ4rZfmwKTMo9PJuEVm9g6MKjbHaBNorFZf1jXf33jryTutqZm/a0mL3aNynltc479g==
X-Received: by 2002:a17:902:7488:: with SMTP id h8mr5294497pll.128.1589989335546;
        Wed, 20 May 2020 08:42:15 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:2911:7230:fac5:7fd8? ([2601:646:9200:4e0:2911:7230:fac5:7fd8])
        by smtp.gmail.com with ESMTPSA id m12sm2380093pjs.41.2020.05.20.08.42.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2020 08:42:14 -0700 (PDT)
Subject: Re: [oe] [meta-python][PATCH v2] python3-iso8601: add python3-numbers to RDEPENDS
To: openembedded-devel@lists.openembedded.org
References: <160A5C4D5532F28F.26752@lists.openembedded.org>
 <34a335af-0e47-1efd-f0bf-db2da2702852@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <bf8a8b4a-36cc-3b5d-fc51-72688dc4802f@gmail.com>
Date: Wed, 20 May 2020 08:42:13 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <34a335af-0e47-1efd-f0bf-db2da2702852@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 5/20/20 7:13 AM, Trevor Gamblin wrote:
> Bump. I don't think this patch got picked up?
> 


Please resend, so patchwork catches it again

> On 4/29/20 2:01 PM, Trevor Gamblin wrote:
>> Sending v2 to fix commit message.
>>
>> python3-iso8601 relies on the decimal module from the standard
>> library, but it is not in iso8601's RDEPENDS:
>>
>> root@qemux86-64:~# python3
>> Python 3.8.2 (default, Feb 25 2020, 10:39:28)
>> [GCC 9.3.0] on linux
>> Type "help", "copyright", "credits" or "license" for more information.
>>>>> import iso8601
>> Traceback (most recent call last):
>>    File "<stdin>", line 1, in <module>
>>    File "/usr/lib/python3.8/site-packages/iso8601/__init__.py", line 1, in <module>
>>      from .iso8601 import *
>>    File "/usr/lib/python3.8/site-packages/iso8601/iso8601.py", line 12, in <module>
>>      from decimal import Decimal
>> ModuleNotFoundError: No module named 'decimal'
>>
>> Add it to RDEPENDS to fix the import error.
>>
>> Signed-off-by: Trevor Gamblin<trevor.gamblin@windriver.com>
>> ---
>>   meta-python/recipes-devtools/python/python-iso8601.inc | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-python/recipes-devtools/python/python-iso8601.inc b/meta-python/recipes-devtools/python/python-iso8601.inc
>> index 61e9abbac..b6e021c5b 100644
>> --- a/meta-python/recipes-devtools/python/python-iso8601.inc
>> +++ b/meta-python/recipes-devtools/python/python-iso8601.inc
>> @@ -8,6 +8,7 @@ SRC_URI[sha256sum] = "49c4b20e1f38aa5cf109ddcd39647ac419f928512c869dc01d5c7098ed
>>   
>>   RDEPENDS_${PN} += "\
>>       ${PYTHON_PN}-datetime \
>> +    ${PYTHON_PN}-numbers \
>>   "
>>   
>>   BBCLASSEXTEND = "native nativesdk"
>>
> 
> 
> 
