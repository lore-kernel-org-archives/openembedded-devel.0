Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E8FC52D7B
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 12:23:33 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web11.70723.1723551812439857979
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Aug 2024 05:23:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=UnpSEVU8;
 spf=pass (domain: baylibre.com, ip: 209.85.210.53, mailfrom: tgamblin@baylibre.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-709428a9469so3501773a34.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Aug 2024 05:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723551812; x=1724156612; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oIpGI6ynm14I4nQHAqCscPCSuutIqIy+Ynw/8qFkci8=;
        b=UnpSEVU80SRW7W43vIOOqqmY2IBUBn/zMQOqDLvYQfbdeWPaiuPifEjdvdB2BhgoW9
         T0AkD83l8DEiuYU3B18JtdqWyn3LnGvOKiXZW7os9yAXYtBdZqffwCb5e0LVVmC5jYT5
         K8L1ODh8YaYqxWVpDA8XaPITZMfvAE1mRI1tVQfqjY31V5uqre28AAbfH87ChM/mi6mZ
         HT803p4GEQFDfw/j7WpusyPMcK4NUFkjG+FErH2HdZAyEc2t25UynlwmXfqf6Ncp2X2M
         6AQbqby9lJIMRo87/+VKfVTVNjWC4KBVPYFbK1rKWSMlu5qOTQtr2/qSbLrnRfN137/G
         doSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723551812; x=1724156612;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oIpGI6ynm14I4nQHAqCscPCSuutIqIy+Ynw/8qFkci8=;
        b=lwVMrM43ZLU5A7AKD5q0XrHr20A3rGQiYxvP6YW+ldI69Dbl90TyBQJKx5KbVr+/4f
         SOCn93pV3tL15+ARvaYsK6mM1anCpq4cqgbdcA0PnEmM797vx8z2SrXJZ8svdKrSDGZ/
         LwUytkJPAZT7YAD/LaNahkQ9gAigt8LtPwniBTgG5Ykk3lnS+7TDXOGKD0Dq7m6ee667
         Dm6oQ4aB/abp2yaZyBUAx0IX24mV+X+dnM4TXXEpsVHLB66d7rUif66u/PMm2xohDYIt
         8GUZ9Slw+QdHcZ5CV43BfdmVzDU6XNOMBKBF+9PzAtIjX1LjXITbybhekD456I6Un0cw
         LWnQ==
X-Gm-Message-State: AOJu0Yy0seZCn1/0jrKEVUmLOBznvSMRZRTAH7Xy/oKuZWsu8qToaXRq
	mITpyTxN3drDbc7fOL/4g/8k2OIjEPpKHYru5WyRFH83pjNh8HKC1M6y+RYYulI=
X-Google-Smtp-Source: AGHT+IGkzkh2cr1z6+PRm1gFa6q4BS4oZ4IZ4jKEt6E2fJyFzTFKQA+lhnf7VBC3crk6HJe+Hr7hCQ==
X-Received: by 2002:a05:6830:7182:b0:709:45ad:8552 with SMTP id 46e09a7af769-70c93867962mr4079794a34.7.1723551811532;
        Tue, 13 Aug 2024 05:23:31 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4531c1ac9b3sm31589901cf.16.2024.08.13.05.23.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Aug 2024 05:23:31 -0700 (PDT)
Message-ID: <9b8561d8-d5d1-4e10-b214-f51fe52836e5@baylibre.com>
Date: Tue, 13 Aug 2024 08:23:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH] python3-pandas: upgrade 2.0.3 -> 2.2.2
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20240812182036.1132711-1-tgamblin@baylibre.com>
 <CAMKF1srPzUW_GjtbxLNUtHrsLkLAd-=GbZ5Z3S0UjEAfid=W8A@mail.gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CAMKF1srPzUW_GjtbxLNUtHrsLkLAd-=GbZ5Z3S0UjEAfid=W8A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Aug 2024 12:23:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111791


On 2024-08-12 11:38 p.m., Khem Raj wrote:
> On Mon, Aug 12, 2024 at 11:20 AM Trevor Gamblin via
> lists.openembedded.org <tgamblin=baylibre.com@lists.openembedded.org>
> wrote:
>> pandas 2.2.2 is the first version compatible with numpy 2.0.x.
>>
>> The package now uses meson as the build backend, so change the recipe to
>> inherit that.
>>
>> Its pyproject.toml pins required versions for Cython and meson, but
>> newer upstream pandas releases are using different versions and
>> compatibility strings, so just add an OE-specific patch to relax the
>> requirements a bit for us.
>>
>> Changelog: https://pandas.pydata.org/pandas-docs/version/2.2.2/whatsnew/v2.2.2.html
>>
>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> ---
>>   ...t.toml-don-t-pin-dependency-versions.patch | 37 +++++++++++++++++++
>>   ...andas_2.0.3.bb => python3-pandas_2.2.2.bb} |  8 +++-
>>   2 files changed, 43 insertions(+), 2 deletions(-)
>>   create mode 100644 meta-python/recipes-devtools/python/python3-pandas/0001-pyproject.toml-don-t-pin-dependency-versions.patch
>>   rename meta-python/recipes-devtools/python/{python3-pandas_2.0.3.bb => python3-pandas_2.2.2.bb} (81%)
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-pandas/0001-pyproject.toml-don-t-pin-dependency-versions.patch b/meta-python/recipes-devtools/python/python3-pandas/0001-pyproject.toml-don-t-pin-dependency-versions.patch
>> new file mode 100644
>> index 000000000..f60f43a5b
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-pandas/0001-pyproject.toml-don-t-pin-dependency-versions.patch
>> @@ -0,0 +1,37 @@
>> +From d46b8720a6bccb345f6bdd7ee2f5c357e7eb227b Mon Sep 17 00:00:00 2001
>> +From: Trevor Gamblin <tgamblin@baylibre.com>
>> +Date: Mon, 12 Aug 2024 11:27:36 -0400
>> +Subject: [PATCH] pyproject.toml: don't pin dependency versions
>> +
>> +Pandas will fail to build if the exact versions aren't found, but newer
>> +ones actually work. Since newer versions of pandas are adjusting the
>> +requires section of pyproject toml further, just patch it for us.
>> +
>> +Upstream-Status: Inappropriate [OE-Specific]
>> +
>> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> +---
>> + pyproject.toml | 6 +++---
>> + 1 file changed, 3 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/pyproject.toml b/pyproject.toml
>> +index db9f055799..5158d60f59 100644
>> +--- a/pyproject.toml
>> ++++ b/pyproject.toml
>> +@@ -2,10 +2,10 @@
>> + # Minimum requirements for the build system to execute.
>> + # See https://github.com/scipy/scipy/pull/12940 for the AIX issue.
>> + requires = [
>> +-    "meson-python==0.13.1",
>> +-    "meson==1.2.1",
>> ++    "meson-python>=0.13.1",
>> ++    "meson>=1.2.1",
>> +     "wheel",
>> +-    "Cython==3.0.5",  # Note: sync with setup.py, environment.yml and asv.conf.json
>> ++    "Cython>=3.0.5",  # Note: sync with setup.py, environment.yml and asv.conf.json
>> +     # Force numpy higher than 2.0rc1, so that built wheels are compatible
>> +     # with both numpy 1 and 2
>> +     "numpy>=2.0.0rc1",
> This means I have to synchronise this patch with the numpy 2.x upgrade
> patch in oe-core

Yes, once that is merged then this should be OK to merge as well.

- Trevor

>
>> +--
>> +2.39.2
>> +
>> diff --git a/meta-python/recipes-devtools/python/python3-pandas_2.0.3.bb b/meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb
>> similarity index 81%
>> rename from meta-python/recipes-devtools/python/python3-pandas_2.0.3.bb
>> rename to meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb
>> index 91e76d991..ac8d46984 100644
>> --- a/meta-python/recipes-devtools/python/python3-pandas_2.0.3.bb
>> +++ b/meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb
>> @@ -6,9 +6,13 @@ HOMEPAGE = "http://pandas.pydata.org/"
>>   LICENSE = "BSD-3-Clause"
>>   LIC_FILES_CHKSUM = "file://LICENSE;md5=cb819092901ddb13a7d0a4f5e05f098a"
>>
>> -SRC_URI[sha256sum] = "c02f372a88e0d17f36d3093a644c73cfc1788e876a7c4bcb4020a77512e2043c"
>> +SRC_URI += " \
>> +            file://0001-pyproject.toml-don-t-pin-dependency-versions.patch \
>> +            "
>>
>> -inherit pypi setuptools3
>> +SRC_URI[sha256sum] = "9e79019aba43cb4fda9e4d983f8e88ca0373adbb697ae9c6c43093218de28b54"
>> +
>> +inherit pypi python_mesonpy
>>
>>   DEPENDS += " \
>>       python3-cython-native \
>> --
>> 2.39.2
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#111773): https://lists.openembedded.org/g/openembedded-devel/message/111773
>> Mute This Topic: https://lists.openembedded.org/mt/107862188/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

