Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24104CE7A88
	for <webhook@archiver.kernel.org>; Sat, 23 Sep 2023 17:26:52 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.24955.1695490006116497053
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Sep 2023 10:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZUXL6chW;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-59c26aa19b7so46971087b3.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Sep 2023 10:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695490005; x=1696094805; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ub++ikhlE/HzEb8W58kR8Jt8YRHf1JqZxelVbLD+JE4=;
        b=ZUXL6chWTyztMOtSDrVFBAOg3vwlen1/sn23KK2nad1FmNwgqy5BRYX5VNgG8iVxOB
         /t1/sVq9T9LGol9H/Sw2oRzGap3nabVc7gxwEqMMhz2+BMLPU/IOcJABsLFiFmin5h3/
         0qhfLZQOcsryhJTQ3Mq6V5R5nitPDdg28DwhO0Tc9/1AZuEqPHOVt/a1uZ4/txwl2WuF
         5GGq5f61Y1pSdZt6G1GDBzGw/dVlxVp+gZA5dE9Wk6AHa4H/MWG04KWvhILbT3drwkWG
         oj+EZxrv3hSJAddALgv3jgK7r6D33CMOlR8xGN/SSu/dEdrBl3FEpfYnfoBtfdDnfKo4
         KdAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695490005; x=1696094805;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ub++ikhlE/HzEb8W58kR8Jt8YRHf1JqZxelVbLD+JE4=;
        b=qHG/u1ZStDJsY+7dkLSTPe734VeXwbWCb6CNdiiYZBJJYxD6bgJwjrpes7FjQVZq1+
         TU0gyW+ay2jOsHS9nOeezaHRCLCTZK3U+bWAYh8Tu4xGXjxBM17OrgJI9vymTOIEmwqS
         gLhhmUgovgSEqmARyJRafgwXy6TW3lsJxfqmJdJ8myQviCMVdGycRF4jZR2QXwE76/qZ
         6BKo8/c7uiLEc1nE6TYxGW6kI4Mq7Dy+tFGt5r9L9r5YscyO6zBTHeLZt0pzb3osgJ7c
         X+vthfJULE3l7yxCSd1aQrNUu3nXNQiKcvudcAvOlapXe7ifOes0H7LFVo981THCnJtT
         E3uQ==
X-Gm-Message-State: AOJu0YxkTeg2gTV848LX2NSZb3TfyLMZAVip2NTKOMf21tSXqvYvErV9
	EmPk5tVF/6iQHah443/FqcuBvjwCxMA=
X-Google-Smtp-Source: AGHT+IGY0LJSHHxkZ51BSsaUsJGzV2n5BGhaBgwaPYill0rCMvFlOS44ljj/2unMXUN3D5QNcSJU1g==
X-Received: by 2002:a0d:c084:0:b0:59b:1763:bff9 with SMTP id b126-20020a0dc084000000b0059b1763bff9mr3141517ywd.49.1695490005259;
        Sat, 23 Sep 2023 10:26:45 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10::29? ([2600:1700:9190:ba10::29])
        by smtp.gmail.com with ESMTPSA id l188-20020a0dc9c5000000b00595394ba941sm1521672ywd.81.2023.09.23.10.26.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Sep 2023 10:26:44 -0700 (PDT)
Message-ID: <43ee5539-8273-3937-3634-e2eb8b88bc39@gmail.com>
Date: Sat, 23 Sep 2023 13:26:44 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [oe] [meta-python][kirkstone][PATCH v2 2/2] Introduce
 python3-trustme to fix ptest error of python3-requests-toolbelt
Content-Language: en-US
To: "Mali, Narpat" <narpat.mali@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20230823104110.1949022-1-narpat.mali@windriver.com>
 <177DFD136D69B7A7.28529@lists.openembedded.org>
 <1782D94E6954A090.4793@lists.openembedded.org>
 <2f957332-7064-0463-b504-92842afc6071@windriver.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <2f957332-7064-0463-b504-92842afc6071@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Sep 2023 17:26:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105099



On 9/22/23 8:15 AM, Mali, Narpat wrote:
> Gentle Reminder !!

Since this appears to not affect the functionality of 
python3-requests-toolbelt, request is declined.

BR,
Armin
>
> ../Narpat
>
> On 08-09-2023 12:09, Narpat Mali via lists.openembedded.org wrote:
>> Gentle Reminder !!
>>
>> ../Narpat
>>
>> On 23-08-2023 16:11, Narpat Mali via lists.openembedded.org wrote:
>>> From: Narpat Mali <narpat.mali@windriver.com>
>>>
>>> The ptest fails after python3-requests-toolbelt is upgraded
>>> to 0.10.1.
>>>
>>> =======================================================
>>> Hint: make sure your test modules/packages have valid Python names.
>>> Traceback:
>>> ../../python3.11/importlib/{}init{}.py:126: in import_module
>>>      return _bootstrap._gcd_import(name[level:], package, level)
>>> tests/test_x509_adapter.py:20: in <module>
>>>      import trustme
>>> E   ModuleNotFoundError: No module named 'trustme'
>>> =======================================================
>>>
>>> The commit b93b4067ea "Fix x509 tests by using trustme" of
>>> python3-requests-toolbelt introduces the trustme in 
>>> test_x509_adapter.py.
>>>
>>> Introducing python3-trustme to fix ptest error of 
>>> python3-requests-toolbelt,
>>> also introducing python3-service-identity, which is requested by 
>>> python3-trustme's
>>> ptest.
>>>
>>> The ptest passes of all the three packages.
>>>
>>> Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>
>>> Cherry-picked the upstream master commit:
>>> https://git.openembedded.org/meta-openembedded/commit/?id=a4b6e3ee894047cd13c5d2b7bfc67f0093899537 
>>>
>>>
>>> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
>>> ---
>>>   .../packagegroups/packagegroup-meta-python.bb |  2 ++
>>>   .../python3-requests-toolbelt_0.10.1.bb       |  1 +
>>>   .../python/python3-service-identity/run-ptest |  3 +++
>>>   .../python/python3-service-identity_21.1.0.bb | 25 +++++++++++++++++
>>>   .../python/python3-trustme/run-ptest          |  3 +++
>>>   .../python/python3-trustme_0.9.0.bb           | 27 
>>> +++++++++++++++++++
>>>   6 files changed, 61 insertions(+)
>>>   create mode 100644 
>>> meta-python/recipes-devtools/python/python3-service-identity/run-ptest
>>>   create mode 100644 
>>> meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb
>>>   create mode 100644 
>>> meta-python/recipes-devtools/python/python3-trustme/run-ptest
>>>   create mode 100644 
>>> meta-python/recipes-devtools/python/python3-trustme_0.9.0.bb
>>>
>>> diff --git 
>>> a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb 
>>> b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
>>> index fdeb83c42a..c2481eb307 100644
>>> --- 
>>> a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
>>> +++ 
>>> b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
>>> @@ -373,6 +373,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
>>>       python3-send2trash \
>>>       python3-sentry-sdk \
>>>       python3-serpent \
>>> +    python3-service-identity \
>>>       python3-sh \
>>>       python3-sijax \
>>>       python3-simpleeval \
>>> @@ -408,6 +409,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
>>>       python3-trafaret-config \
>>>       python3-traitlets \
>>>       python3-transitions \
>>> +    python3-trustme \
>>>       python3-twine \
>>>       python3-twisted \
>>>       python3-twitter \
>>> diff --git 
>>> a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.1.bb 
>>> b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.1.bb 
>>>
>>> index c39950ab5d..7191a3e6c1 100644
>>> --- 
>>> a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.1.bb
>>> +++ 
>>> b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.1.bb
>>> @@ -21,6 +21,7 @@ RDEPENDS:${PN}-ptest += " \
>>>       ${PYTHON_PN}-betamax \
>>>       ${PYTHON_PN}-mock \
>>>       ${PYTHON_PN}-multiprocessing \
>>> +        ${PYTHON_PN}-trustme \
>>>   "
>>>     do_install_ptest() {
>>> diff --git 
>>> a/meta-python/recipes-devtools/python/python3-service-identity/run-ptest 
>>> b/meta-python/recipes-devtools/python/python3-service-identity/run-ptest 
>>>
>>> new file mode 100644
>>> index 0000000000..b63c4de0d9
>>> --- /dev/null
>>> +++ 
>>> b/meta-python/recipes-devtools/python/python3-service-identity/run-ptest 
>>>
>>> @@ -0,0 +1,3 @@
>>> +#!/bin/sh
>>> +
>>> +pytest -o log_cli=true -o log_cli_level=INFO | sed -e 
>>> 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 
>>> 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" 
>>> || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || 
>>> $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if 
>>> ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || 
>>> $NF=="XPASS") {$NF="";print $0}else{print}}'
>>> diff --git 
>>> a/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb 
>>> b/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb 
>>>
>>> new file mode 100644
>>> index 0000000000..0210a5de22
>>> --- /dev/null
>>> +++ 
>>> b/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb 
>>>
>>> @@ -0,0 +1,25 @@
>>> +DESCRIPTION = "The tools for verifying whether a certificate is 
>>> valid for the intended purposes."
>>> +HOMEPAGE = "https://pypi.org/project/service-identity"
>>> +AUTHOR = "Hynek Schlawack"
>>> +
>>> +LICENSE = "MIT"
>>> +LIC_FILES_CHKSUM = 
>>> "file://LICENSE;md5=8a0f079f4e6a215d6bd6f9d97cab4d5f"
>>> +
>>> +SRC_URI[md5sum] = "5e5c195d8fcedc72f9068be2ad9b5a13"
>>> +SRC_URI[sha256sum] = 
>>> "6e6c6086ca271dc11b033d17c3a8bea9f24ebff920c587da090afc9519419d34"
>>> +
>>> +inherit pypi setuptools3 ptest
>>> +
>>> +SRC_URI += " \
>>> +    file://run-ptest \
>>> +"
>>> +
>>> +RDEPENDS:${PN}-ptest += " \
>>> +    ${PYTHON_PN}-pytest \
>>> +"
>>> +
>>> +do_install_ptest() {
>>> +    install -d ${D}${PTEST_PATH}/tests
>>> +    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
>>> +    cp -rf ${S}/setup.py ${D}${PTEST_PATH}
>>> +}
>>> diff --git 
>>> a/meta-python/recipes-devtools/python/python3-trustme/run-ptest 
>>> b/meta-python/recipes-devtools/python/python3-trustme/run-ptest
>>> new file mode 100644
>>> index 0000000000..b63c4de0d9
>>> --- /dev/null
>>> +++ b/meta-python/recipes-devtools/python/python3-trustme/run-ptest
>>> @@ -0,0 +1,3 @@
>>> +#!/bin/sh
>>> +
>>> +pytest -o log_cli=true -o log_cli_level=INFO | sed -e 
>>> 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 
>>> 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" 
>>> || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || 
>>> $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if 
>>> ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || 
>>> $NF=="XPASS") {$NF="";print $0}else{print}}'
>>> diff --git 
>>> a/meta-python/recipes-devtools/python/python3-trustme_0.9.0.bb 
>>> b/meta-python/recipes-devtools/python/python3-trustme_0.9.0.bb
>>> new file mode 100644
>>> index 0000000000..641512c46c
>>> --- /dev/null
>>> +++ b/meta-python/recipes-devtools/python/python3-trustme_0.9.0.bb
>>> @@ -0,0 +1,27 @@
>>> +DESCRIPTION = "A utility provides a fake certificate authority (CA)"
>>> +HOMEPAGE = "https://pypi.org/project/trustme"
>>> +AUTHOR = "Nathaniel J. Smith"
>>> +
>>> +LICENSE = "Apache-2.0"
>>> +LIC_FILES_CHKSUM = 
>>> "file://LICENSE;md5=d5a7af1a4b73e57431e25d15a2da745a"
>>> +
>>> +SRC_URI[md5sum] = "0e4d698e5aecaf8306cf440bf3dcbbe0"
>>> +SRC_URI[sha256sum] = 
>>> "5e07b23d70ceed64f3bb36ae4b9abc52354c16c98d45ab037bee2b5fbffe586c"
>>> +
>>> +inherit pypi setuptools3 ptest
>>> +
>>> +SRC_URI += " \
>>> +    file://run-ptest \
>>> +"
>>> +
>>> +RDEPENDS:${PN}-ptest += " \
>>> +    ${PYTHON_PN}-pytest \
>>> +    ${PYTHON_PN}-service-identity \
>>> +    ${PYTHON_PN}-pyasn1-modules \
>>> +"
>>> +
>>> +do_install_ptest() {
>>> +    install -d ${D}${PTEST_PATH}/tests
>>> +    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
>>> +    cp -rf ${S}/setup.py ${D}${PTEST_PATH}
>>> +}
>>>
>>>
>>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#104799): 
>> https://lists.openembedded.org/g/openembedded-devel/message/104799
>> Mute This Topic: https://lists.openembedded.org/mt/101232091/7199376
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: 
>> https://lists.openembedded.org/g/openembedded-devel/unsub 
>> [narpat.mali@windriver.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


