Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.3555.1601167215674034078
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Sep 2020 17:40:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o6OOBJ5/;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id bb1so1397480plb.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Sep 2020 17:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=+Ii8Qt+ivEt1O81JbbOAOY3Xb/Ac6TtwqxkNrD7A9Lg=;
        b=o6OOBJ5/1qL8R2PKNOe9S0CldglM+NysRUv9Ptv84preng5QFtPg+EnSZi6qUWK54M
         xMIakbkWbe2G5cOTPDcvv86Je2akouKTSc234hyZ1bpPPir0PNPipHLSjbpjVrg7hXXB
         NmPgZcF/qd1PcKjr4kcVVLodP5ZDcMqjKbRHTPC1E+rIjUenQh7jgaqX+uUXsTfQLmXM
         e8Tmd04fFCYYMbv+Pqf0D0Vz70dj9BlNae8QzdFw0ABgbZ0itSj+YoKsKktVpQ3NJbVX
         cst7Jr/DooCBJj+7sZbzxa8563mMxqnTsE6VnWiFA6mPeBXgqzKv6MjXT5ijlunbgTND
         dHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=+Ii8Qt+ivEt1O81JbbOAOY3Xb/Ac6TtwqxkNrD7A9Lg=;
        b=qYca6qQGDIcq/NrOF6QwojR1Fsp4KIeSUkwidpr38YiB+AKcsk6vlkJlBNWwbZWnNO
         L1toyA4hmzPo6qPvbVNhezvL6fXiJM1QzbDZb1r0leW1SqVBwqlQ7A6Rr95lJ/tI7Kuw
         wkS8PlkkjreK+Z7oFOEuCHFDETT/y/jd7yVHT6VBdZrPEy+xNY+kd5kRz4u6VOmKGr5k
         qQHRvV56cMwN0aJ3GwL+jbr8oB9vnGbCohtq72euXawZYEGwF9GQwcpIxO3ZbHLoEPBd
         2MvuGWxAyePJwmlsC2Ih/XuWeKfqmDzkQaTgR4KkumeforMsW/83y57MjA0ZKDJqB6m7
         kduA==
X-Gm-Message-State: AOAM531lMNo77EYcwYhPp5TRe0alFyOmKd7O5rWXMrDyLQUfLy8+MVek
	Za0CDpm5dzRvEgjymilCCtQ=
X-Google-Smtp-Source: ABdhPJzo+6hccF7f2EOn0iRXzF84hjX/qH3DKwqQRL+OIePuTafTIrKm0Rh0cCnqrxCMsPuX8GOLEA==
X-Received: by 2002:a17:90a:17cb:: with SMTP id q69mr3552169pja.56.1601167215137;
        Sat, 26 Sep 2020 17:40:15 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:9d97:e0e:5802:c8f4? ([2601:202:4180:a5c0:9d97:e0e:5802:c8f4])
        by smtp.gmail.com with ESMTPSA id s22sm7093697pfd.90.2020.09.26.17.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2020 17:40:14 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH] cmocka: add recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
 Armin Kuster <akuster@mvista.com>
References: <20200925212051.18414-1-akuster808@gmail.com>
 <CAMKF1sq_NeerBCsR1LKAMA0QMFtSWrZRm9czC8ALNSh8Xuk02Q@mail.gmail.com>
 <CAMKF1so9SbeLv81oU20aE4RGvS9hx93YWNt0khUrSwRGOEzvGg@mail.gmail.com>
 <CAMKF1so_BwsogCXeAZ+GG12F8+SGpE6haTjohgXwNFffe8NcYw@mail.gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <c5ad1c40-1e9f-c4fe-cdfa-27c8de52a787@gmail.com>
Date: Sat, 26 Sep 2020 17:40:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1so_BwsogCXeAZ+GG12F8+SGpE6haTjohgXwNFffe8NcYw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 9/26/20 4:50 PM, Khem Raj wrote:
> fails on musl too
> https://errors.yoctoproject.org/Errors/Details/500726/

ok. thanks.  keep forgetting that use-case

-armin
>
> On Sat, Sep 26, 2020 at 7:18 AM Khem Raj <raj.khem@gmail.com> wrote:
>> Now this recipe is added I wonder if libldb and samba can use this
>> copy instead of their internal version ?
>>
>> On Fri, Sep 25, 2020 at 5:07 PM Khem Raj <raj.khem@gmail.com> wrote:
>>> Can you add it to appropriate packagegroups too for testing purposes
>>>
>>> On Fri, Sep 25, 2020 at 2:20 PM akuster <akuster808@gmail.com> wrote:
>>>> From: Armin Kuster <akuster@mvista.com>
>>>>
>>>> includes ptest and bundling of examples that can be used for testing
>>>>
>>>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>>>> ---
>>>>  meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb | 37 +++++++++++++++++++++
>>>>  meta-oe/recipes-test/cmocka/files/run-ptest | 10 ++++++
>>>>  2 files changed, 47 insertions(+)
>>>>  create mode 100644 meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb
>>>>  create mode 100644 meta-oe/recipes-test/cmocka/files/run-ptest
>>>>
>>>> diff --git a/meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb b/meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb
>>>> new file mode 100644
>>>> index 0000000000..6125d116cd
>>>> --- /dev/null
>>>> +++ b/meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb
>>>> @@ -0,0 +1,37 @@
>>>> +DESCRIPTION = "cmocka is an elegant unit testing framework for C with support for mock \
>>>> +objects. It only requires the standard C library, works on a range of computing \
>>>> +platforms (including embedded) and with different compilers."
>>>> +HOMEPAGE = "https://cmocka.org/"
>>>> +
>>>> +LICENSE = "Apache-2.0"
>>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
>>>> +
>>>> +SRCREV = "56eb3a183fc222120f86d0c54fd033992c30135e"
>>>> +SRC_URI = "git://git.cryptomilk.org/projects/cmocka.git \
>>>> +           file://run-ptest "
>>>> +
>>>> +S = "${WORKDIR}/git"
>>>> +
>>>> +inherit cmake ptest
>>>> +
>>>> +EXTRA_OECMAKE = "${@bb.utils.contains('PTEST_ENABLED', '1', '-DCMAKE_BUILD_TYPE=Debug -DUNIT_TESTING=ON', '', d)}"
>>>> +
>>>> +do_install_append () {
>>>> +    install -d ${D}${datadir}/${BPN}/example
>>>> +    install -d ${D}${datadir}/${BPN}/example/mock/chef_wrap
>>>> +    install -d ${D}${datadir}/${BPN}/example/mock/uptime
>>>> +
>>>> +    install -m 0755 ${B}/example/*_test ${D}/${datadir}/${BPN}/example
>>>> +    install -m 0755 ${B}/example/mock/chef_wrap/waiter_test_wrap ${D}/${datadir}/${BPN}/example/mock/chef_wrap
>>>> +    install -m 0755 ${B}/example/mock/uptime/uptime ${D}/${datadir}/${BPN}/example/mock/uptime
>>>> +    install -m 0755 ${B}/example/mock/uptime/test_uptime ${D}/${datadir}/${BPN}/example/mock/uptime
>>>> +}
>>>> +
>>>> +do_install_ptest () {
>>>> +    install -d ${D}${PTEST_PATH}/tests
>>>> +    install -m 0755 ${B}/tests/test_* ${D}${PTEST_PATH}/tests
>>>> +}
>>>> +
>>>> +PACKAGE_BEFORE_PN += "${PN}-examples"
>>>> +
>>>> +FILES_${PN}-examples = "${datadir}/${BPN}/example"
>>>> diff --git a/meta-oe/recipes-test/cmocka/files/run-ptest b/meta-oe/recipes-test/cmocka/files/run-ptest
>>>> new file mode 100644
>>>> index 0000000000..48b9cd9fc5
>>>> --- /dev/null
>>>> +++ b/meta-oe/recipes-test/cmocka/files/run-ptest
>>>> @@ -0,0 +1,10 @@
>>>> +#!/bin/sh
>>>> +
>>>> +cd tests
>>>> +for i in `ls *`; do
>>>> +   if [ ./$i ] ; then
>>>> +       echo "PASS: $i"
>>>> +   else
>>>> +       echo "FAIL: $i"
>>>> +   fi
>>>> +done
>>>> --
>>>> 2.17.1
>>>>
>>>>
>>>> 
>>>>

