Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web12.1203.1615485857808307932
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Mar 2021 10:04:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=htRnivGJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id x7so71645pfi.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Mar 2021 10:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=kb25kpFMAEZzyhPbgJDwTBT2xVVFyiK5xSqmy++QARE=;
        b=htRnivGJ9C7kdm+ZoamIegs2qiqSBRR8TdbegKPsWuEgrJ0nRz9TnJL3a1CPHQF89w
         /Fv3WVd07QlsE3RYwTQKg4Hb9xCEPuF69Mr0z94UcLEVL0SPAoBdkeSzYrm4z+2o5EnN
         W4oDoVlmahwi9dG10dThu5CyaUOCm64JQbjv9nAjE26yCIjnIHrv+NTb4uPIFFKaJ34y
         UKQdr1ihgAP177mAdW98LUhRBKT3yaxbTx71fGgIX7TrtqHArgdTSYzJPURLg69mFy85
         DD+epZ1yD6eoG2/3lSixFQhhlAxOXOfUS2nue+/VmSHsQLd48bzwZMSdi5j8Fyjb5RVw
         1AAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kb25kpFMAEZzyhPbgJDwTBT2xVVFyiK5xSqmy++QARE=;
        b=pwc3Dr8nl0qeEenGi228gj76S7qLPG2VpFDSsnEXkjkL2U0ZayuVoNixGo0EZnfBd2
         Ws5Vfacg8pQeaOOlvfQCNAgncBVYuonYWxhR1oLiQNhcHonX+FIRKenmCZ7L2CmAeRjQ
         Y5dQEBk3Dbe8HjFW8XXXMpXytv65uI+P17Ofjo3rumfjlVf52DN4WsjqEUs56LbWsa/i
         L/3ZQUwQQnHh4b2BFAsJn3RNqM9pWheRtxK4VUWK9XE5HT8HHfN8tzUxU0RboE2/bvZ1
         RLClmgzEjfFsniNAuquw7Pr3Ju1GeE3zyZmGlCQQJ6jQnAn+FfN0DBzqG9TqVAaAZI0f
         7t/A==
X-Gm-Message-State: AOAM532pj/ExKY7r/2KfmcJExlT0JWeSAohup6CsXnvhPjhQKz8F8mm2
	wn+DWeP18vF6f2gwV7FyeFKI/jZr7LSylA==
X-Google-Smtp-Source: ABdhPJyMWdEWref+X/7EbN3GZC63OweOhu9Mp9Fyo/XwZIUh+94mqSGmcyqqM7TYSKr/wYKyJO1RYQ==
X-Received: by 2002:a65:538f:: with SMTP id x15mr6388379pgq.429.1615485856628;
        Thu, 11 Mar 2021 10:04:16 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::c2dd? ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id h7sm3096188pfo.45.2021.03.11.10.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Mar 2021 10:04:16 -0800 (PST)
Subject: Re: [oe] [meta-oe][PATCH] grpc: upgrade 1.36.1 -> 1.36.2
To: Sakib Sajal <sakib.sajal@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <166B54E0208DA20A.13992@lists.openembedded.org>
 <0c2518e8-dbb1-766d-02f1-ed17ce410bb1@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <fcb4db71-cf68-8727-46b0-9fc40c700007@gmail.com>
Date: Thu, 11 Mar 2021 10:04:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <0c2518e8-dbb1-766d-02f1-ed17ce410bb1@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/11/21 8:41 AM, Sakib Sajal wrote:
> 
> On 2021-03-11 10:56 a.m., Sakib Sajal wrote:
>> Changelog:
>> https://github.com/grpc/grpc/releases/tag/v1.36.2
>>
>> Signed-off-by: Sakib Sajal<sakib.sajal@windriver.com>
>> ---
>>   .../recipes-devtools/grpc/{grpc_1.36.1.bb => grpc_1.36.2.bb}    | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>   rename meta-oe/recipes-devtools/grpc/{grpc_1.36.1.bb => grpc_1.36.2.bb} (98%)
>>
>> diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.36.1.bb b/meta-oe/recipes-devtools/grpc/grpc_1.36.2.bb
>> similarity index 98%
>> rename from meta-oe/recipes-devtools/grpc/grpc_1.36.1.bb
>> rename to meta-oe/recipes-devtools/grpc/grpc_1.36.2.bb
>> index eb137bef5..17e70aebf 100644
>> --- a/meta-oe/recipes-devtools/grpc/grpc_1.36.1.bb
>> +++ b/meta-oe/recipes-devtools/grpc/grpc_1.36.2.bb
>> @@ -16,7 +16,7 @@ RDEPENDS_${PN}-compiler = "${PN}"
>>   RDEPENDS_${PN}-dev += "${PN}-compiler"
>>   
>>   S = "${WORKDIR}/git"
>> -SRCREV_grpc = "3b7f86e3516746c5f0db1947e0d65e94159bcb12"
>> +SRCREV_grpc = "c3438a0c5d7bc499eb31fd4853ca72c771f758a5"
>>   BRANCH = "v1.36.x"
>>   SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
>>              "
>>
> Build statistics:
> 
> BUILDALL-QEMU LOG FOR grpc
> START TIME: 2021-03-10_11:41:00
> HOSTNAME: ala-lpggp3
> HOST OS: Ubuntu 18.04.3 LTS
> HOST KERNEL: 5.4.0-62-generic
> ===============
> BUILD RESULTS:
> [glibc]
> FAIL: qemuarmv5
> PASS: qemumips
> PASS: qemux86-64
> PASS: qemuarm64
> PASS: qemumips64
> PASS: qemuarm
> FAIL: qemuppc
> PASS: qemuriscv64
> PASS: qemux86
> [musl]
> FAIL: qemuarmv5
> PASS: qemumips
> PASS: qemux86-64
> PASS: qemuarm64
> PASS: qemumips64
> PASS: qemuarm
> FAIL: qemuppc
> PASS: qemuriscv64
> PASS: qemux86
> ===============
> PASSED: 14
> FAILED: 4

are these fails related ?

> 
> 
> Sakib
> 
> 
> 
> 
> 
