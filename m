Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F32F9CDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 17:30:31 +0000 (UTC)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web11.44902.1697218228624742361
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Oct 2023 10:30:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=wfwRH3hB;
 spf=pass (domain: baylibre.com, ip: 209.85.217.41, mailfrom: tgamblin@baylibre.com)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-457bda4cf32so573536137.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 10:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697218227; x=1697823027; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DXGDv7VBgQIS+aM5kA6ODBXMrIuWK3ONHLnCTxObhVw=;
        b=wfwRH3hBNKqBBhw8gCY2An5TFYCBNqGB6VE1YIkHeQ4rEOppyd9typ6YOEe20slRln
         DL5ogJ2va/dfkQacDIQ/K1I+94bHncvXWXFCWvyb7qbmYe1lmnl6EO70Kh3FJtOrwQBe
         ++xT9pnJXCBlYoY9SadVA/CVDXNQwPynor1m4vWzSEwmyRnL44KjRuXy82KRt7rKXGPT
         1npm9TXZbh5u0Ub/L24NAFkZXJOToSbyg1OEkdKuWXsQQKIOop5uTzSEfXEHTL/CDG0S
         ntHEfO33BbtE5+gaNgU1CZ3GYGK66vPyN5Usy/APjS1VAvhRTzVnXPwDZJEKXQXJG00t
         jfvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697218227; x=1697823027;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DXGDv7VBgQIS+aM5kA6ODBXMrIuWK3ONHLnCTxObhVw=;
        b=Cg2GCfBcNksWqPuzvLCybgNZp62bAQ8TZ2OwaOtgjckqGQ8NobIHHJv/D0nhPHdra7
         oI7jyMA3t8zYZlH6OXNhp2l0IVwIRSyE7J/qrXGboQJG4Y/eJuofdjsALfzmpwUQOolJ
         p3aNDij8A2m6GC5koi2QFWeBPOE9LZ7ccPavNOTI6ri2LOH4dgmtH0mT40P9v+k03dnG
         45/9HidZk8cdW9FMnSdztcPu16D+9z4M8sVoUJT+F4neeWWr88jaNAzBSwiwtXogaduq
         2l4FfruDlofOpRNFRK9vh235C3Ac+mxP2nL4ALqFKvIuHZyqzzYyrDqa1gfRgdOAET4y
         F47w==
X-Gm-Message-State: AOJu0YzinC66LUqE/3koksO2UQ8GlcLJMaYFCk8VJtkU/r8C881yvg4c
	UdGoAKW8W0JXDa+dSS1Mq2hR0w==
X-Google-Smtp-Source: AGHT+IERttR8ij28SRepbEUmnfyN0PFNszV0gi1FJ1EmdqKNanxNUPSFhs46HZsKaO3xLYRnupTP2w==
X-Received: by 2002:a67:f64e:0:b0:452:60c5:20b with SMTP id u14-20020a67f64e000000b0045260c5020bmr28130100vso.15.1697218227615;
        Fri, 13 Oct 2023 10:30:27 -0700 (PDT)
Received: from ?IPV6:2001:1970:5b1f:ab00:d875:6297:4e81:e577? ([2001:1970:5b1f:ab00:d875:6297:4e81:e577])
        by smtp.gmail.com with ESMTPSA id jy8-20020a05622a818800b00417fa0cd77esm760879qtb.80.2023.10.13.10.30.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Oct 2023 10:30:27 -0700 (PDT)
Message-ID: <dcb57c79-2849-5b8b-b85c-3d584f98df95@baylibre.com>
Date: Fri, 13 Oct 2023 13:30:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [oe] [meta-python][PATCH 4/4] python3-pytest-mock: disable broken
 ptests
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20231013170801.3966008-1-tgamblin@baylibre.com>
 <20231013170801.3966008-4-tgamblin@baylibre.com>
 <CAMKF1sosN6zU2raudiYFbDwCAixjdqApWPWR2yYDBpdY-2egMw@mail.gmail.com>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CAMKF1sosN6zU2raudiYFbDwCAixjdqApWPWR2yYDBpdY-2egMw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 17:30:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105488


On 2023-10-13 13:15, Khem Raj wrote:
> On Fri, Oct 13, 2023 at 10:08 AM Trevor Gamblin <tgamblin@baylibre.com> wrote:
>> Two introspection-related ptests are consistently failing. For now,
>> disable them so that a clean ptest run is available.
>>
> For regular runs can we  move it out of PTESTS_PROBLEMS_META_PYTHON into
> either PTESTS_FAST_META_PYTHON or PTESTS_SLOW_META_PYTHON
Done, sent a patch to move both recipes.
>
>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> ---
>>   ...t_mock-skip-args-introspection-tests.patch | 38 +++++++++++++++++++
>>   .../python/python3-pytest-mock_3.11.1.bb      |  1 +
>>   2 files changed, 39 insertions(+)
>>   create mode 100644 meta-python/recipes-devtools/python/python3-pytest-mock/0001-test_pytest_mock-skip-args-introspection-tests.patch
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-pytest-mock/0001-test_pytest_mock-skip-args-introspection-tests.patch b/meta-python/recipes-devtools/python/python3-pytest-mock/0001-test_pytest_mock-skip-args-introspection-tests.patch
>> new file mode 100644
>> index 0000000000..f024e79d93
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-pytest-mock/0001-test_pytest_mock-skip-args-introspection-tests.patch
>> @@ -0,0 +1,38 @@
>> +From e184fb950ad3b52c5c16438d39fe4d516c784e30 Mon Sep 17 00:00:00 2001
>> +From: Trevor Gamblin <tgamblin@baylibre.com>
>> +Date: Thu, 12 Oct 2023 17:32:40 -0400
>> +Subject: [PATCH] test_pytest_mock: skip args introspection tests
>> +
>> +Disable these two tests for now so that python3-pytest-mock can have
>> +successful ptest runs.
>> +
>> +Upstream-Status: Inappropriate [OE-Specific]
>> +
>> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> +---
>> + tests/test_pytest_mock.py | 2 ++
>> + 1 file changed, 2 insertions(+)
>> +
>> +diff --git a/tests/test_pytest_mock.py b/tests/test_pytest_mock.py
>> +index 3d53241..157b6c3 100644
>> +--- a/tests/test_pytest_mock.py
>> ++++ b/tests/test_pytest_mock.py
>> +@@ -581,6 +581,7 @@ def test_assert_called_wrapper(mocker: MockerFixture) -> None:
>> +     stub.assert_called()
>> +
>> +
>> ++@pytest.mark.skip("Async not correctly detected, skip for now")
>> + @pytest.mark.usefixtures("needs_assert_rewrite")
>> + def test_assert_called_args_with_introspection(mocker: MockerFixture) -> None:
>> +     stub = mocker.stub()
>> +@@ -597,6 +598,7 @@ def test_assert_called_args_with_introspection(mocker: MockerFixture) -> None:
>> +         stub.assert_called_once_with(*wrong_args)
>> +
>> +
>> ++@pytest.mark.skip("Async not correctly detected, skip for now")
>> + @pytest.mark.usefixtures("needs_assert_rewrite")
>> + def test_assert_called_kwargs_with_introspection(mocker: MockerFixture) -> None:
>> +     stub = mocker.stub()
>> +--
>> +2.41.0
>> +
>> diff --git a/meta-python/recipes-devtools/python/python3-pytest-mock_3.11.1.bb b/meta-python/recipes-devtools/python/python3-pytest-mock_3.11.1.bb
>> index 69d74567c3..7fd998edc6 100644
>> --- a/meta-python/recipes-devtools/python/python3-pytest-mock_3.11.1.bb
>> +++ b/meta-python/recipes-devtools/python/python3-pytest-mock_3.11.1.bb
>> @@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = " \
>>   SRC_URI = " \
>>       git://github.com/pytest-dev/pytest-mock;branch=main;protocol=https \
>>       file://run-ptest \
>> +    file://0001-test_pytest_mock-skip-args-introspection-tests.patch \
>>   "
>>
>>   SRCREV ?= "d3e73f2e93f7b93eba0a36e17e43bafd969da4fe"
>> --
>> 2.41.0
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#105483): https://lists.openembedded.org/g/openembedded-devel/message/105483
>> Mute This Topic: https://lists.openembedded.org/mt/101944758/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

