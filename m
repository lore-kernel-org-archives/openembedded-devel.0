Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web10.19457.1595718924590177642
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jul 2020 16:15:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=lyEsBzxy;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.193, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f193.google.com with SMTP id a27so4033058ljn.8
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jul 2020 16:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=iqNhEpDJ2wV/VcADHSt3jl+VyFXyN9IjNH9t1x+Jwn4=;
        b=lyEsBzxyuaR70azDrVISrB7YV/DXiqkOzt6a+yGmdeigRfDNEiZhM++sIPyr/k2qEM
         siogE3JqNWYRBERa/F5kR54252wLEFbu7ubuKOLgn4hC+B/eOIzfKVtUtq3L8+febIaR
         kdzlM+9ywQSgFb2JqMEpFVamTvDj3f+kWU5hGWFOFpoH89Crb/n13Yf1ZWy2c5WOaL1X
         eDwfPamAteyc3rj3xccu1NFr5EcVSORZ6/lbSjw437TBqPpOsw+7ZzfQD8dMva/gvNxa
         wdsceNMgqB3E9L1JJUAGradI3GrRBgsrwWEBi8Oz+Q9ay8WvAD4nFQL3QA0jJIFLVPTy
         +37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=iqNhEpDJ2wV/VcADHSt3jl+VyFXyN9IjNH9t1x+Jwn4=;
        b=OqBZw/qc2stLWt2vSlLrrfodQHp7sm0c8IUbnyBvup4DSEZ2NsZeab3uosJOtMxc7w
         +Cno+h2wcY2ZOnW5SVK8xk7wdDpIZDLJ1RR6OogQKHUGz+x80eKCCoQDaTrTPFqNk2HV
         f3oxYaziJQQWtBpDcq7pF2+I59o5L/khlCZREJVHzOt/fcCetIQ3cw8ni6LWrm3LxGi+
         DFmVk0XUFfWl0xC+9cW8LyEEySrhAt3/jj+C+1nhH36r1hQAVzJBDsbfdMtl8BX8NFGB
         445fWriLrRCEhyfqUOMl0QLu7i2GhkHMf47bisB8FQ2EEI28KwSIBGC27zbc6ac9kHeR
         +FkA==
X-Gm-Message-State: AOAM533sZkY7OYtCDLy9voDPytC9owI7RQZdUe+0rKHoF5sN4HmsU90g
	EJv2f0rAdH/U/iPVdy3Y3tVC3w==
X-Google-Smtp-Source: ABdhPJxyiqDl76FTNk+jVDUPemiS2gtmr4h4BIUYuuR5jOjLI+voZJTGsghjvdtu0hEW6zt0kPsdRQ==
X-Received: by 2002:a2e:8718:: with SMTP id m24mr7370943lji.253.1595718922501;
        Sat, 25 Jul 2020 16:15:22 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from [192.168.0.8] (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id f9sm1773948lfc.43.2020.07.25.16.15.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jul 2020 16:15:21 -0700 (PDT)
Subject: Re: [PATCH][meta-oe 1/4] python3-mock: Upgrade 4.0.1 -> 4.0.2
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
 Leon Anavi <leon.anavi@konsulko.com>,
 Trevor Gamblin <trevor.gamblin@windriver.com>
References: <20200725105726.2142880-1-open.source@oleksandr-kravchuk.com>
 <CAMKF1sp3GcJHH25LjnCp=qG3L84HLqXe_wmxGy9j2-GEEVS1uw@mail.gmail.com>
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
Message-ID: <3d3c2d41-f9cf-0198-981f-08a40e56c714@oleksandr-kravchuk.com>
Date: Sun, 26 Jul 2020 01:15:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp3GcJHH25LjnCp=qG3L84HLqXe_wmxGy9j2-GEEVS1uw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Yes, it was sent by a mistake. Sorry.

On 25/07/2020 17:42, Khem Raj wrote:
> This is already on master
>
> On Sat, Jul 25, 2020 at 3:57 AM Oleksandr Kravchuk
> <open.source@oleksandr-kravchuk.com> wrote:
>> From: Leon Anavi <leon.anavi@konsulko.com>
>>
>> Upgrade 4.0.2:
>>
>> - Issue #39915: Ensure unittest.mock.AsyncMock.await_args_list has
>>    call objects in the order of awaited arguments instead of using
>>    unittest.mock.Mock.call_args which has the last value of the
>>    call. Patch by Karthikeyan Singaravelan.
>>
>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>   .../python/{python3-mock_4.0.1.bb => python3-mock_4.0.2.bb}   | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>   rename meta-python/recipes-devtools/python/{python3-mock_4.0.1.bb => python3-mock_4.0.2.bb} (77%)
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-mock_4.0.1.bb b/meta-python/recipes-devtools/python/python3-mock_4.0.2.bb
>> similarity index 77%
>> rename from meta-python/recipes-devtools/python/python3-mock_4.0.1.bb
>> rename to meta-python/recipes-devtools/python/python3-mock_4.0.2.bb
>> index eebfcdade2..39ab6d01f5 100644
>> --- a/meta-python/recipes-devtools/python/python3-mock_4.0.1.bb
>> +++ b/meta-python/recipes-devtools/python/python3-mock_4.0.2.bb
>> @@ -13,5 +13,5 @@ RDEPENDS_${PN} += "${PYTHON_PN}-prettytable \
>>               ${PYTHON_PN}-pep8 \
>>               ${PYTHON_PN}-pyflakes"
>>
>> -SRC_URI[md5sum] = "8f48ba3fd059e7cfad92f8354064adfd"
>> -SRC_URI[sha256sum] = "2a572b715f09dd2f0a583d8aeb5bb67d7ed7a8fd31d193cf1227a99c16a67bc3"
>> +SRC_URI[md5sum] = "6466619b89c2969dc57722ad73f85676"
>> +SRC_URI[sha256sum] = "dd33eb70232b6118298d516bbcecd26704689c386594f0f3c4f13867b2c56f72"
>> --
>> 2.25.1
>>
