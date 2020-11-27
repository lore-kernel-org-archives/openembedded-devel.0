Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web08.16314.1606469325627521359
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2020 01:28:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ewF88cku;
 spf=pass (domain: konsulko.com, ip: 209.85.208.68, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f68.google.com with SMTP id k4so5046166edl.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2020 01:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=W9WaktndCC/gaWbPB2K74EoT3ybZ4r2MGHiAYy6+Zs8=;
        b=ewF88cku5Kya4G1U+8WklG7pYNw6XmsmKR1SeNH7yuUxateeihz34V7eyTyGVSC1lY
         JOhw01iVhCxMK1Z96HXl4TXq+9sBASajuL0d9akWHYfuNHsHDMZhTeGCN4cxA9hFI8GJ
         V83Bw7ck8vCcbaD6dwAp6ypm5O0y80ZRKrsQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=W9WaktndCC/gaWbPB2K74EoT3ybZ4r2MGHiAYy6+Zs8=;
        b=Ps5QTKXk+LKQdZ9UGwr3oF2ZSWUv6l+jEoo40U7KVvtz0jvBBONm7mb3VK93Co4Ue2
         0RFv0E9hqanKyjk8zEdopzYim2w5AMwCxRLC1XPJKng6UOjbnbJsZyD2LhhUocX7MLQf
         GllkcVcX+hHetm5vdIbTkGcK0G0cgO2lAfqlZULW/rkoVNCep2yLt2RsBaezdZk39oVa
         +5oVTpMM0PaJ/Ed9zYaGYTN/CsTm5+mljgy3LrXgpXHEye26eEYjGgp2WruGMz7mu/An
         5yNuWLIhOYE6WfcA29SVwTids01R+eqOYjU0ROhNXcBnnlqrU0rhi/teVoZMfygJy2GJ
         6/bQ==
X-Gm-Message-State: AOAM530utdn6CGl9sa3nS9GIMV04gPOdkiCuHbFe0nGiti4peA4l4HUb
	F2bE+qVq3Lii4VSlJX4X7vBApq/MZveoNQ==
X-Google-Smtp-Source: ABdhPJzTo+CVNvtYw0eu0PE1pyLCZlNiqVeN1sK8IkYOgJOagoL5mIE0QYu5ddYPPpC5zyP7WdP3Jw==
X-Received: by 2002:a50:e68a:: with SMTP id z10mr6720774edm.66.1606469323812;
        Fri, 27 Nov 2020 01:28:43 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from [192.168.4.166] ([78.130.197.211])
        by smtp.gmail.com with ESMTPSA id bd21sm4655280edb.79.2020.11.27.01.28.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2020 01:28:43 -0800 (PST)
Subject: Re: [oe] [meta-python][PATCH 1/3] python3-pyrad: Upgrade 2.3 -> 2.4
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20201126180347.13763-1-leon.anavi@konsulko.com>
 <CAMKF1spXbeFA___4rkvy-tpzzBbp3KFkPoKceJn6SSmTcVia_Q@mail.gmail.com>
From: "Leon Anavi" <leon.anavi@konsulko.com>
Message-ID: <3ab3f926-4bb2-37db-004c-f7af1f3c6a83@konsulko.com>
Date: Fri, 27 Nov 2020 11:28:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spXbeFA___4rkvy-tpzzBbp3KFkPoKceJn6SSmTcVia_Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Khem,

On 26.11.20 г. 20:06 ч., Khem Raj wrote:
> On Thu, Nov 26, 2020 at 10:04 AM Leon Anavi <leon.anavi@konsulko.com> wrote:
>> Upgrade to release 2.4:
>>
>> - Support poetry for for building this project
>> - Use secrets.SysRandom instead of random.SystemRandom if possible
>> - .get on Packets has an optional default parameter (to mimic
>>    dict.get())
>> - Fix: digestmod is not optional in python3.8 anymore
>> - Fix: authenticator was refreshed before the packet was generated
>> - Fix bug causing Message-Authenticator verification to fail if
>>    multiple instances of an attribute do not appear sequentially in
>>    the attributes list
>> - Fixed VerifyReply broken when multiple instances of same
>>    attribute are not adjacent on reply
>> - Fixed Missing send_packet for async Client
>> - Fixed python3 support for SaltCrypt (was previously broken)
>>
>> License-Update: Use file PKG-INFO.
>>
>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> ---
>>   meta-python/recipes-devtools/python/python3-pyrad_2.3.bb | 9 ---------
>>   meta-python/recipes-devtools/python/python3-pyrad_2.4.bb | 9 +++++++++
>>   2 files changed, 9 insertions(+), 9 deletions(-)
>>   delete mode 100644 meta-python/recipes-devtools/python/python3-pyrad_2.3.bb
>>   create mode 100644 meta-python/recipes-devtools/python/python3-pyrad_2.4.bb
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-pyrad_2.3.bb b/meta-python/recipes-devtools/python/python3-pyrad_2.3.bb
>> deleted file mode 100644
>> index 3b38fb3a4b..0000000000
>> --- a/meta-python/recipes-devtools/python/python3-pyrad_2.3.bb
>> +++ /dev/null
>> @@ -1,9 +0,0 @@
>> -SUMMARY = "RADIUS tools"
>> -SECTION = "devel/python"
>> -LICENSE = "BSD-3-Clause"
>> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=debd8dc49cd9a7d58c7fffc771efed4f"
>> -
>> -PYPI_PACKAGE = "pyrad"
>> -SRC_URI[sha256sum] = "89c4d9b2cab1746c48dc0d93898d278e34a40acedf6f511aeaa748bcd4490295"
>> -
>> -inherit pypi setuptools3
>> diff --git a/meta-python/recipes-devtools/python/python3-pyrad_2.4.bb b/meta-python/recipes-devtools/python/python3-pyrad_2.4.bb
>> new file mode 100644
>> index 0000000000..86a95a4aa4
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-pyrad_2.4.bb
>> @@ -0,0 +1,9 @@
>> +SUMMARY = "RADIUS tools"
>> +SECTION = "devel/python"
>> +LICENSE = "BSD-3-Clause"
>> +LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
> I still see https://github.com/pyradius/pyrad/blob/master/LICENSE.txt
> why is this changed here ?

LICENSE.txt is not present in pyrad-2.4.tar.gz:
https://files.pythonhosted.org/packages/fc/04/0fe33dca20685b3ced8359f487638bdf03f2776652f7f6812a639cce1b70/pyrad-2.4.tar.gz

Best regards,
Leon

>
>> +
>> +PYPI_PACKAGE = "pyrad"
>> +SRC_URI[sha256sum] = "057de4b7e89d8da57ba782c1bde45c63ebee720ae2c0b0a69beaff15c47e30d9"
>> +
>> +inherit pypi setuptools3
>> --
>> 2.17.1
>>
>>
>> 
>>
-- 
Leon Anavi
Software Engineer
konsulko.com

