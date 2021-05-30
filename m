Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web09.35951.1622405498911936714
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 May 2021 13:11:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=N7PbNRsq;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id h12so4146883plf.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 May 2021 13:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=2QgIxQpfwR9uXd6sPQ42exY+h79PjYV9ha+6iKVdbmE=;
        b=N7PbNRsqlnnPK/6/IRrqugqLBW4MrtRFjoXIfTtLGG/YvWMbKWafiewYUQbTE8jvn3
         48jkKK/uvxxzrUHS6SoAllltBVnQnZW3AlLWZj8RepQbI6jaHRwp3oIcmjzhwnzACNek
         1yw48c9zcPz/sbsJ7HEugkuEO3yQvBQ8mVoO9uFNiTHooRMFG+uH3t7pnpYfNoKJcc1I
         vJYlk0ypg1nYoLZQxAJ4vgu9bES7SFnoYJw7LqaPXxBSYse5afDO6NzYNXFlArnm18fP
         fiAeWGvOLhCLRa9tNfVSRjzep1fEqkTyM/py0rAEiTrTocjW0CqlIqSfvEq0a/Qj+pMv
         bdaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=2QgIxQpfwR9uXd6sPQ42exY+h79PjYV9ha+6iKVdbmE=;
        b=RHzp3pipbiUcXhMF+PoiXa8nHzXJ+gAitY3Y08NUSLU+J8I5HtSOC1+MB1m5hEk1sj
         G0jRV2qouIzBIo9ANd2+dJh7T4S7lF0cUr47SsnExsRblvcV05AXBcLJHx1Jy7NmrEm9
         CPfO0zi9Ty1s6pQ3gNtGYvJNfcRXnQul/CuSkR9GPmbLpuPPiYnfJzn68NR/gugKk5XY
         okRAd8h2WH6oKRfCgkhf+y1XGiolh8+Th9rXWAw4th3QepFBs8bxxt0kVDy7jYcWw2In
         vvKphJTdHKkyuPulXF7PcfOQw8R3TT7HmrgOjSVjv4c3+pu/96INuijU0ubaZ0N3FQ6q
         Vcyw==
X-Gm-Message-State: AOAM531aYqn6ylZ4lDEie9Eym+kF5tfpKzu6X4V83DgJ+qsucFikBs5l
	+CfeBQaPj68W3bBGSjIZjlFn4K7lMGri0A==
X-Google-Smtp-Source: ABdhPJw8TEFVqhrbt4A2IivThKwfV5th0ndGawsuXfxCuYSBV7CNXKAke0D4TVuAVkJ3IN1cakwrkQ==
X-Received: by 2002:a17:902:da8a:b029:104:7e35:a492 with SMTP id j10-20020a170902da8ab02901047e35a492mr3006943plx.44.1622405498338;
        Sun, 30 May 2021 13:11:38 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:417e:d6cd:22c6:4534? ([2601:202:4180:a5c0:417e:d6cd:22c6:4534])
        by smtp.gmail.com with ESMTPSA id x1sm8727876pjk.37.2021.05.30.13.11.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 May 2021 13:11:37 -0700 (PDT)
Subject: Re: [oe] [meta-python][v2][PATCH] python3-scapy: drop this recipe
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20210530165040.547348-1-akuster808@gmail.com>
 <061d412b-55cf-07d8-5be7-9e150fc3aa98@gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <4e7edeba-97ee-8ba7-d480-35304ecbf27b@gmail.com>
Date: Sun, 30 May 2021 13:11:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <061d412b-55cf-07d8-5be7-9e150fc3aa98@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 5/30/21 9:56 AM, Khem Raj wrote:
> needs to be removed from
> meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb as
> well.
thanks for the reminder. After I hit send.. it hit me to fixup the pkg grps.

-armin
>
> On 5/30/21 9:50 AM, Armin Kuster wrote:
>> This recipe points to an unmaintained uri
>> Switch to the official project.
>> Moved package to meta-networking
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>   .../recipes-devtools/python/python3-scapy_0.26.bb   | 13 -------------
>>   1 file changed, 13 deletions(-)
>>   delete mode 100644
>> meta-python/recipes-devtools/python/python3-scapy_0.26.bb
>>
>> diff --git
>> a/meta-python/recipes-devtools/python/python3-scapy_0.26.bb
>> b/meta-python/recipes-devtools/python/python3-scapy_0.26.bb
>> deleted file mode 100644
>> index 31c88942d..000000000
>> --- a/meta-python/recipes-devtools/python/python3-scapy_0.26.bb
>> +++ /dev/null
>> @@ -1,13 +0,0 @@
>> -DESCRIPTION = "Packet crafting/sending/sniffing, PCAP processing tool,\
>> -based on scapy with python3 compatibility"
>> -SECTION = "devel/python"
>> -HOMEPAGE = "https://github.com/phaethon/scapy"
>> -LICENSE = "GPLv2"
>> -LIC_FILES_CHKSUM =
>> "file://PKG-INFO;md5=a88f5c4e1c935f295ebeaf51fc8644ef"
>> -
>> -inherit pypi setuptools3
>> -
>> -PYPI_PACKAGE = "scapy-python3"
>> -
>> -SRC_URI[md5sum] = "513469447735a4a416d495f63e28aa4b"
>> -SRC_URI[sha256sum] =
>> "81e4f5522d38c136fd3f1be4e35ffe4fd1f4c2091db3c021d95f8b9d5978b9eb"
>>
>>
>>
>> 
>>

