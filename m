Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web12.8570.1585912599728932896
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2020 04:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=rNK4weNc;
 spf=pass (domain: konsulko.com, ip: 209.85.167.66, mailfrom: leon.anavi@konsulko.com)
Received: by mail-lf1-f66.google.com with SMTP id s13so5433936lfb.9
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2020 04:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=I9GhwpD1k1ZcRSzd6kBeC0H2T9mLiyupEBU2J0GITvw=;
        b=rNK4weNcF4C1nD4Mb+nm13i3foivFK1Htpnu58Aj45XoKSu1ISv0Jc7b2xBERELefe
         G8HX8NfZyPtOZB5SeSlqAHnFA5f/KyHsuipC3XXKlgASu9hYNMqGYGo7AYZzYyDb2tNG
         77gwqAsa6c58IIQ/lVnpYadUn326/9n7bH3PU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=I9GhwpD1k1ZcRSzd6kBeC0H2T9mLiyupEBU2J0GITvw=;
        b=qrbvnLuV46jiTnBYfMC0UCvPEwxANn6USswrwkQZZ2pyc6w3BUeYjBmZN/uY+itaVm
         SkzL8a1sMhWiyX7/HtVKV+PY352CGl1Ol3aCqbmoSfEKLaVGyho0826J//bZ/8v0BnfF
         YKaxy3DWThPXJG41NzpmM+8Nf1iwDaJ1AR9Fehaz/JGzNaSstn7yZ/pAllBWb4vgIJuE
         tXNrPisepuT9r9/CTPb/WnkYDPGEwff6t/YSiT+x6NBL+iBTJRFR7eFz5novXCm5HWcn
         DcdnZZuf+blDODa1+AUvNxpwAHm7Lo1DZbVN2M21K+UG8bC/FjGOUb0UF3Wmt/77TBZV
         tUuA==
X-Gm-Message-State: AGi0PuaquCv1YmeFOajchLvCT6oUiHxqotiqjFPAXbE/FGkbWscAgkXL
	GvyBGZXVINP4rCA5B8C9jzt2Oc0nuCU=
X-Google-Smtp-Source: APiQypIwbw8gh53M3JuNtLyNvYtqviJzPiSRHbEoAbr7i1WZxwPiWeYxp7/gHbUNPUXvyA5Sb5dBXA==
X-Received: by 2002:ac2:4342:: with SMTP id o2mr5005727lfl.195.1585912597176;
        Fri, 03 Apr 2020 04:16:37 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from [192.168.4.166] ([78.130.197.211])
        by smtp.gmail.com with ESMTPSA id a6sm5790103lfl.5.2020.04.03.04.16.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2020 04:16:36 -0700 (PDT)
Subject: Re: [oe] [meta-python][PATCH 1/3] python-smbus2: Add new recipe
To: Paul Barker <pbarker@konsulko.com>
Cc: openembedded-devel@lists.openembedded.org
References: <1585901748-16446-1-git-send-email-leon.anavi@konsulko.com>
 <20200403113348.21435aab@ub1910>
From: "Leon Anavi" <leon.anavi@konsulko.com>
Message-ID: <6c47735d-edf1-baef-91e0-8d20edc9a315@konsulko.com>
Date: Fri, 3 Apr 2020 14:16:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200403113348.21435aab@ub1910>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Paul,

On 3.04.20 г. 13:33 ч., Paul Barker wrote:
> On Fri,  3 Apr 2020 11:15:46 +0300
> "Leon Anavi" <leon.anavi@konsulko.com> wrote:
>
>> Drop-in replacement for smbus-cffi/smbus-python in pure Python.
>> It is another implementation of the python-smbus package.
>>
>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> ---
>>   meta-python/recipes-devtools/python/python-smbus2.inc | 19 +++++++++++++++++++
>>   .../recipes-devtools/python/python3-smbus2_0.3.0.bb   |  2 ++
>>   2 files changed, 21 insertions(+)
>>   create mode 100644 meta-python/recipes-devtools/python/python-smbus2.inc
>>   create mode 100644 meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb
>>
>> diff --git a/meta-python/recipes-devtools/python/python-smbus2.inc b/meta-python/recipes-devtools/python/python-smbus2.inc
>> new file mode 100644
>> index 0000000..0bab1a4
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python-smbus2.inc
>> @@ -0,0 +1,19 @@
>> +SUMMARY = "Drop-in replacement for smbus-cffi/smbus-python in pure Python"
>> +DESCRIPTION = "smbus2 is a drop-in replacement for smbus-cffi/smbus-python in pure Python"
>> +HOMEPAGE = "https://github.com/kplindegaard/smbus2"
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
>> +
>> +SRC_URI[md5sum] = "d5ed5acc889b4770a84cc932853ed20a"
>> +SRC_URI[sha256sum] = "210e66eebe4d0b1fe836b3ec2751841942e1c4918c0b429b20a0e20a222228b4"
>> +
>> +CLEANBROKEN = "1"
>> +
>> +PYPI_PACKAGE = "smbus2"
>> +
>> +RDEPENDS_${PN} = "${PYTHON_PN}-ctypes ${PYTHON_PN}-fcntl"
>> +
>> +RDEPENDS_${PN} += "\
>> +	${PYTHON_PN}-ctypes \
>> +	${PYTHON_PN}-fcntl \
>> +"
>> diff --git a/meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb b/meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb
>> new file mode 100644
>> index 0000000..6149e35
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb
>> @@ -0,0 +1,2 @@
>> +inherit pypi setuptools3
>> +require python-smbus2.inc
> We should be doing away with this kind of .inc file now that meta-python is
> python3 only. See
> https://lists.openembedded.org/g/openembedded-devel/topic/72718415.
>
> Thanks,
Thanks for pointing it out. I will update accordingly my patches and 
resubmit them.

Best regards,
Leon

-- 
Leon Anavi
Software Engineer
konsulko.com

