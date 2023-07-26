Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5899C001DC
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 15:16:00 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.13930.1690384550721288016
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jul 2023 08:15:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=pTXsWDnv;
 spf=pass (domain: baylibre.com, ip: 209.85.222.173, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-765942d497fso587435085a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jul 2023 08:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690384549; x=1690989349;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vTqkzwtzHE+Dj6aL8Iw/O3mVb1OM9MHtXxu9fXL2PBw=;
        b=pTXsWDnvF2Xho8BU+58ymfdBAsGk7nb5h2VwwIl8VfzYP4hczYPEnpYgUMTlec2RCT
         xBIzxi/WsfVqPrVAsIqtFkt1DN7Z8Y1dFlcJxkUaXrMNDVXZV4t8eXGHWMh7kCTyhixS
         lUZyW9CHZ3WPWbKHm9tMz5yYkouY4cSYumnmUZIWou8GdaR74ZgLFzhNy7PIlatwPC/l
         uaIX0KTH5z1eUQLqibQ3SdId3FiIcgXqUJHe2IFREF01728/AZmYN7ZuZo9eBFYbVSU3
         beHm0dHNJm3pqHcPoumUmPXjEi7CLWlNvHN8O8ygnHwhQhBJEIeooL7zyaiF+ESDCXL+
         K8Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690384549; x=1690989349;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vTqkzwtzHE+Dj6aL8Iw/O3mVb1OM9MHtXxu9fXL2PBw=;
        b=jHwU8Ex2GiKnXieuBTbVxywjkDepUWLBSaPCH9YVrz8DBYGVi+VeyrmIa62ynFkK8f
         GBX/xHeckwo1Hi5OaFTcmpY+xUFRy5CXqu2PX55xhvZK+79TYGjhjU44mPyC079T2CDb
         zB8wC60m95LMXhRbKbTfLVn1vyiOkNG89LjTcxXc3GHJfxqbIMixRHVFN1d6eyzAFu2Q
         ysWuPwV7wKyvr5zznmpsj8yXEYohd2wp/0WFpO/0Oez3+dpmikpNEj2/7syQP4GSatfM
         PYoI1/ZZnPSWRNWdBjkNKLxFbLWqZ6sDLgwbr7EsV77/+jSMP7JJhqoHn9MITSNqmVks
         4STQ==
X-Gm-Message-State: ABy/qLbf/mhBrXWObLOQALbMbhDfgSg8s99i4mYV3FrqJZzHSTPXVAa8
	dSiDqktHSrrPrLs5FruBR0IRfw==
X-Google-Smtp-Source: APBJJlHhLH3g411Rqzk2zhGtkAVIa9Ot13NW04PTnO0DL1U3ona79tXCgk5b1if0Qv8lSseZg5sWJg==
X-Received: by 2002:a05:620a:4153:b0:767:e993:5918 with SMTP id k19-20020a05620a415300b00767e9935918mr2853913qko.55.1690384549261;
        Wed, 26 Jul 2023 08:15:49 -0700 (PDT)
Received: from ?IPV6:2001:1970:5b1f:ab00:d875:6297:4e81:e577? ([2001:1970:5b1f:ab00:d875:6297:4e81:e577])
        by smtp.gmail.com with ESMTPSA id f7-20020a05620a15a700b00767e669d5d6sm4373413qkk.50.2023.07.26.08.15.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 08:15:49 -0700 (PDT)
Message-ID: <f7357d57-0ee8-d025-9e8e-6d576147a569@baylibre.com>
Date: Wed, 26 Jul 2023 11:15:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [oe] [meta-python][PATCH 5/7] python3-pyaudio: upgrade 0.2.11 ->
 0.2.13
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20230725190947.660933-1-tgamblin@baylibre.com>
 <20230725190947.660933-5-tgamblin@baylibre.com>
 <CAMKF1spVXq_P1Y-VsmMR+MvYXobHQZO1OMnoda9hR4mPomrpTQ@mail.gmail.com>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CAMKF1spVXq_P1Y-VsmMR+MvYXobHQZO1OMnoda9hR4mPomrpTQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jul 2023 15:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104037


On 2023-07-26 10:55, Khem Raj wrote:
> its failing for me
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2933/steps/14/logs/stdio
>
> If there is a quick fix that will be good, since its already escaped
> into master, I will have to revert it otherwise.

Go ahead and revert. I'm not able to reproduce this exact failure and 
switching to python_setuptools_build_meta causes extra issues. I'll 
resubmit once I've figured it out.

Thanks,

Trevor

>
> On Tue, Jul 25, 2023 at 12:09 PM Trevor Gamblin <tgamblin@baylibre.com> wrote:
>> License-Update: Move to LICENSE.txt
>>
>> Changelog:
>>
>> 2022-12-26  Hubert Pham  <hubert@mit.edu>
>>
>>    PyAudio 0.2.13
>>
>>    * Move pyaudio.Stream to pyaudio.PyAudio.Stream.
>>      The pyaudio.Stream class is now pyaudio.PyAudio.Stream, nested under the
>>      existing pyaudio.PyAudio class. This should not affect existing code, as
>>      directly accessing the module-level pyaudio.Stream class has always been
>>      unsupported (use PyAudio.open instead). Accessing pyaudio.Stream
>>      directly is deprecated and will raise a DeprecationWarning.
>>
>>    * Deprecate PaMacCoreStreamInfo's get_channel_map() and get_flags() methods.
>>      Use the channel_map and flags properties, respectively, instead. Also
>>      deprecates internal method _get_host_api_stream_object. Calling
>>      deprecated methods will raise a DeprecationWarning.
>>
>>    * Package PyAudio as an actual package (directory).
>>      Previously, the library deployed a single pyaudio.py file and a C
>>      extension module to the root of site-packages. Now, the library deploys
>>      a Python package.
>>
>>    * Add default shared library path for Homebrew installations on Apple Silicon.
>>
>>    * Refactor and cleanup.
>>      - Refactor C extension for better maintainability.
>>      - Add more unit tests.
>>      - Update and modernize examples directory.
>>      - Improve C and python style conformance, plus many cosmetic updates.
>>
>> 2022-07-18  Hubert Pham  <hubert@mit.edu>
>>
>>    PyAudio 0.2.12
>>
>>    - Modernize build process for Microsoft Windows, using the native toolchain.
>>
>>      Setuptool setup.py and INSTALL instructions are more streamlined.
>>      Building from Cygwin/MinGW is no longer supported nor tested.
>>
>>      Thanks to Sean Zimmermann for the patches and general help!
>>
>>    - Change default frames per buffer size to paFramesPerBufferUnspecified.
>>
>>      Previously, pyaudio.py set a default frames per buffer size of 1024,
>>      which can lead to dropped frames on some systems.  Now, by default,
>>      PortAudio selects the buffer size based on host and latency
>>      requirements.
>>
>>      Thanks to Jason Hihn for the suggestion!
>>
>>    - Minor fixes and refactoring for compatibility with Python 3.7+.
>>
>>      Updates include:
>>      * Remove call to deprecated PyEval_InitThreads() for Python 3.7+
>>      * Use Py_ssize_t types in appropriate places (for Python 3.10+).
>>      * Remove the min macro to ease compilation for Windows.
>>
>>    - Use the locale's preferred encoding to decode device names.
>>
>>      Thanks to Eiichi Takamori for the patch!
>>
>>    - Unit tests: add skipIf decorators to skip tests that require hardware.
>>
>>      Set the PYAUDIO_SKIP_HW_TESTS environment variable to disable tests that
>>      require sound hardware, useful for (automated) test environments without
>>      access to audio devices.
>>
>>      Thanks to Matěj Cepl for the suggestion and patch!
>>
>>    - Documentation, examples, and unit tests: various fixes.
>>      * Add more unit tests and repair a few that test the GIL on macOS.
>>      * Remove examples/error.py, which is redundant with tests/error_tests.py.
>>      * Fix type documentation of return value types in docstrings.
>>
>>      Thanks to Vasily Zakharov for pointing out the return-value type errors!
>>
>>    - Modernize packaging: add LICENSE.txt, pyproject.toml, and classifiers.
>>
>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> ---
>>   ...{python3-pyaudio_0.2.11.bb => python3-pyaudio_0.2.13.bb} | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>   rename meta-python/recipes-devtools/python/{python3-pyaudio_0.2.11.bb => python3-pyaudio_0.2.13.bb} (53%)
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-pyaudio_0.2.11.bb b/meta-python/recipes-devtools/python/python3-pyaudio_0.2.13.bb
>> similarity index 53%
>> rename from meta-python/recipes-devtools/python/python3-pyaudio_0.2.11.bb
>> rename to meta-python/recipes-devtools/python/python3-pyaudio_0.2.13.bb
>> index 802ca35100..dbeed9c2d8 100644
>> --- a/meta-python/recipes-devtools/python/python3-pyaudio_0.2.11.bb
>> +++ b/meta-python/recipes-devtools/python/python3-pyaudio_0.2.13.bb
>> @@ -1,12 +1,12 @@
>>   SUMMARY = "PyAudio provides Python bindings for PortAudio, the cross-platform audio I/O library"
>>   SECTION = "devel/python"
>>   LICENSE = "MIT"
>> -LIC_FILES_CHKSUM = "file://README;md5=288793c2b9b05bd67abbd2a8f5d144f7"
>> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7c3152b432b96d6dc4a1cb35397da9ec"
>>
>>   PYPI_PACKAGE = "PyAudio"
>>
>> -SRC_URI[md5sum] = "7e4c88139284033f67b4336c74eda3b8"
>> -SRC_URI[sha256sum] = "93bfde30e0b64e63a46f2fd77e85c41fd51182a4a3413d9edfaf9ffaa26efb74"
>> +SRC_URI[md5sum] = "41199ffd2abbdaf1ce6b88cf8af48cc5"
>> +SRC_URI[sha256sum] = "26bccc81e4243d1c0ff5487e6b481de6329fcd65c79365c267cef38f363a2b56"
>>
>>   inherit pypi setuptools3
>>
>> --
>> 2.41.0
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#104022): https://lists.openembedded.org/g/openembedded-devel/message/104022
>> Mute This Topic: https://lists.openembedded.org/mt/100356782/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

