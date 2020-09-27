Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.8653.1601192548196953596
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2020 00:42:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 08R7gO5d028651
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Sun, 27 Sep 2020 00:42:25 -0700 (PDT)
Received: from [128.224.162.131] (128.224.162.131) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Sun, 27 Sep 2020
 00:42:24 -0700
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-iniconfig: add recipe
To: Khem Raj <raj.khem@gmail.com>
CC: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20200927054741.11210-1-kai.kang@windriver.com>
 <20200927054741.11210-2-kai.kang@windriver.com>
 <CAMKF1sqy_CDdQgaaunBm=JDcqyEBk8eaXjyNnwtgv9UAfaSh_w@mail.gmail.com>
From: "kai" <kai.kang@windriver.com>
Message-ID: <fd404b63-6f02-5313-7de4-61eac43f38c6@windriver.com>
Date: Sun, 27 Sep 2020 15:41:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqy_CDdQgaaunBm=JDcqyEBk8eaXjyNnwtgv9UAfaSh_w@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 9/27/20 2:07 PM, Khem Raj wrote:
> please add it to packagegroup-meta-python as well.

OK.

Kai

>
> On Sat, Sep 26, 2020 at 10:48 PM kai <kai.kang@windriver.com> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> python3-iniconfig is required by pytest 6.1.0.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   .../recipes-devtools/python/python3-iniconfig_1.0.1.bb    | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>   create mode 100644 meta-python/recipes-devtools/python/python3-iniconfig_1.0.1.bb
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-iniconfig_1.0.1.bb b/meta-python/recipes-devtools/python/python3-iniconfig_1.0.1.bb
>> new file mode 100644
>> index 000000000..9ed0e033b
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-iniconfig_1.0.1.bb
>> @@ -0,0 +1,8 @@
>> +SUMMARY = "A small and simple INI-file parser module"
>> +
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
>> +
>> +SRC_URI[sha256sum] = "e5f92f89355a67de0595932a6c6c02ab4afddc6fcdc0bfc5becd0d60884d3f69"
>> +
>> +inherit pypi setuptools3
>> --
>> 2.17.1
>>
>>
>> 
>>

-- 
Kai Kang
Wind River Linux

