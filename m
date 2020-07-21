Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web12.2548.1595357747361428895
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jul 2020 11:55:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vKpkd4yZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f195.google.com with SMTP id 72so10653956ple.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2020 11:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=F4IybiPw+Y4hZvZ9GHTd6nfbcr+ofrh0W8YgfjkLrgQ=;
        b=vKpkd4yZMYc8pBiinZ23Sk3EnoeRCAP/bIp/Iuvkg0jnjONVSC/Cbq5FHj42m1U79X
         wmDY8RTDCtqDVhmJej8umGH0Slge/RoU9UtX6wkeTBXIOpruU7XxEbSkGrq7CqQoBrZV
         rmLUkQpQK5uXzJYIwlKphNMv/nOqNx4HE6FM/fd0oBFv+XOcqlKW4jyj7+aRk0mxdoDC
         b10noQc/XeML6x2DptiIFyydx854z9XVVZlK+8lU11a8o98d4JRADkKj7QwPJDx/a9yh
         Et5u1NQgeWBzDs6nQ8JRXor/0hObEz/4AirvxsE9esnybRe89eYxYFv4rtVVrOnOiXZP
         hrag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=F4IybiPw+Y4hZvZ9GHTd6nfbcr+ofrh0W8YgfjkLrgQ=;
        b=H7tI+weoVmL/M5mx6MXKpVmFO9Uj4qrf4tceZqqI+z3gNWrLw2xZbSYHEMIhJtTbdC
         XJhfEkozBUUnlTb7Zzi0+E7fp3x33+BZDCmZ1yPBXy5kusJSkhmkZKuBwYd39smwLNv5
         CtJKYabk4ZcgoVg+l0Ng25sGtY42Ot4d/PORmhIczkXN6UINmgrH8J9PaPCXx4DZ7VCV
         gr4j8F6EXFfBqJx3IDd6jKiXvp3WXqaJ3Noo7YRFUOVnLrttIAmwrztJADzQ2UwnABKU
         dq4pOC3Qsl8HfXYp4KB0wTqQTRH3N1FtU2hQYM9UzWz60anpkAFS8ilwPPh5e5Mz/5u6
         CTdQ==
X-Gm-Message-State: AOAM531hU9vVRIr9luwQjT4VI2DshwVBvfbGeWJfWtJ7fhF1IRLAziM3
	mlqrZkQInEn8ym6OP1+/AA/wOrR0vK4=
X-Google-Smtp-Source: ABdhPJx+0uVknfjSRrBCx03S/8ntpAP9PqEvHlKx6bSP4yIwkIFmcWxx9yAE49r1WYYqdQP4SgHHHg==
X-Received: by 2002:a17:90b:112:: with SMTP id p18mr6380528pjz.92.1595357746454;
        Tue, 21 Jul 2020 11:55:46 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::6651? ([2601:646:9200:4e0::6651])
        by smtp.gmail.com with ESMTPSA id b82sm21069093pfb.215.2020.07.21.11.55.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2020 11:55:45 -0700 (PDT)
Subject: Re: [oe] [meta-python][PATCH] python3-pint: add setuptools and packaging to RDEPENDS
To: Trevor Gamblin <trevor.gamblin@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <1623D10330AA12F9.4121@lists.openembedded.org>
 <751a6520-f129-7dbc-74b2-c12769ec127f@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <224d5974-0871-1184-fca0-cad0c3328ad9@gmail.com>
Date: Tue, 21 Jul 2020 11:55:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <751a6520-f129-7dbc-74b2-c12769ec127f@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 7/21/20 10:17 AM, Trevor Gamblin wrote:
> 
> On 7/21/20 12:21 PM, Trevor Gamblin wrote:
>> pint needs setuptools and packaging to be imported correctly:
>>
>>>>> import pint
>> Traceback (most recent call last):
>>    File "<stdin>", line 1, in <module>
>>    File "/usr/lib/python3.8/site-packages/pint/__init__.py", line 28, in <module>
>>      from .registry import LazyRegistry, UnitRegistry
>>    File "/usr/lib/python3.8/site-packages/pint/registry.py", line 49, in <module>
>>      import pkg_resources
>> ModuleNotFoundError: No module named 'pkg_resources'
>>
>> Add them to RDEPENDS to fix this.
> This is a mistake - already acked Ryan's patch to add python3-packaging. 
> Will resend.

I have squashed changed from this into original and staged it on master-next

>> Signed-off-by: Trevor Gamblin<trevor.gamblin@windriver.com>
>> ---
>>   meta-python/recipes-devtools/python/python3-pint_0.14.bb | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-pint_0.14.bb b/meta-python/recipes-devtools/python/python3-pint_0.14.bb
>> index 8e1630476..333b015a9 100644
>> --- a/meta-python/recipes-devtools/python/python3-pint_0.14.bb
>> +++ b/meta-python/recipes-devtools/python/python3-pint_0.14.bb
>> @@ -21,6 +21,11 @@ SRC_URI += " \
>>   	file://run-ptest  \
>>   "
>>   
>> +RDEPENDS_${PN} += " \
>> +    ${PYTHON_PN}-setuptools \
>> +    ${PYTHON_PN}-packaging \
>> +"
>> +
>>   RDEPENDS_${PN}-ptest += " \
>>   	${PYTHON_PN}-pytest \
>>   "
>>
> 
> 
> 
