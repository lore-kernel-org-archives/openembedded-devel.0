Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6125DCDB482
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 18:30:02 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web11.46381.1697221792510812238
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Oct 2023 11:29:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=a0IrjmGw;
 spf=pass (domain: baylibre.com, ip: 209.85.160.178, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-419787a43ebso14356091cf.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 11:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697221791; x=1697826591; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m/9GvalhNrc4B8P2nnHAryhGuMuJFQc+THDttGk0uqs=;
        b=a0IrjmGwdwJbJcK+DifJZqAkOpj/GhM/bqhWH23DXTlwzsD6UileuKWndIKWt8BiMT
         DNE2LyU3YfBqu1nQlKJOqYUoRf/oLnia3TiF7kc8YcRyakSR0TqkqqPkEVBeNW0zHuuq
         iKGBkLK1Jh7qjjoMLy94EUf7OBfdDdiUoGgTKokUmsoUO5BnPj1inLlXBSafE2K1VfVX
         j02FvABupq1DH0oXHzfc7GbQv/Aef6nPfEIkzkyeXJK6iq3VyQrtYcHz57aQTT2iQBvd
         nKhcT3a3mey/U/mwVYYZummkJ3ATGdDn4bytw3zu7GhVDNa+qi1ArhqNQZfc/HTIAwtb
         IVMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697221791; x=1697826591;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m/9GvalhNrc4B8P2nnHAryhGuMuJFQc+THDttGk0uqs=;
        b=D7AArW2EsrNgBqg8oQHzXv63C7vME3OngZzYtfRoOvBsY6fsvHSxvT67wgQBNeZnFS
         OnvxejmFZRDaea1PRGoXFWwO8w+QWFVFBZumm/NLhgV2KuXrkj0dRV08vzj2kn9KR2Qo
         SpUUsEtOUpyXdqwj9pX0VXm0Io/8i3w6tZeFwEL1xYiZqC/2S0biStCdwhy/Hk4pRbFQ
         ovSB0zGGl8Wa50InKIkjLADle0eAiu9FclHaLNf+YCJczN18i1+bCDRSqNbRzV9HQDmB
         XuR9sPbUIFfGto4tr+rliD/z9EGhGTs87ET7bx9h5k6AnpSvq+QsMiBHSYLvOiUUZhur
         VwGw==
X-Gm-Message-State: AOJu0YzBw6JxpdVVCiz6aG+7S74sHeKeXtQac8Qnwp2aCfZJRjR1ir6S
	+l904V2rqAR12uF4YZGzyVYu/Q==
X-Google-Smtp-Source: AGHT+IHtKiZArEvzbGZeXVFjvWI/QreGPJpMT4wMN7oYqYDiP2A/f3poAHtXLYfzZufLUci64C0xdQ==
X-Received: by 2002:ac8:5f0c:0:b0:410:9b45:d7ed with SMTP id x12-20020ac85f0c000000b004109b45d7edmr40037187qta.56.1697221791599;
        Fri, 13 Oct 2023 11:29:51 -0700 (PDT)
Received: from ?IPV6:2001:1970:5b1f:ab00:d875:6297:4e81:e577? ([2001:1970:5b1f:ab00:d875:6297:4e81:e577])
        by smtp.gmail.com with ESMTPSA id t11-20020ac8738b000000b00407906a4c6fsm795066qtp.71.2023.10.13.11.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Oct 2023 11:29:51 -0700 (PDT)
Message-ID: <a262ec09-a250-5ebe-4891-27388eb58c93@baylibre.com>
Date: Fri, 13 Oct 2023 14:29:50 -0400
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
 <dcb57c79-2849-5b8b-b85c-3d584f98df95@baylibre.com>
 <9a8c5041-6e21-4bb9-91cc-a6bd3b931d47@gmail.com>
 <CAMKF1sqk_v12GA186K5t2NZx27yUYdzDy-guxwGmqnY8=+8Z3w@mail.gmail.com>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CAMKF1sqk_v12GA186K5t2NZx27yUYdzDy-guxwGmqnY8=+8Z3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 18:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105491


On 2023-10-13 14:08, Khem Raj wrote:
> Fails for me
>
> AssertionError:
> Failed ptests:
> {'python3-pytest-mock':
> ['tests/test_pytest_mock.py::test_detailed_introspection_async',
>                           'tests/test_pytest_mock.py::test_plain_stopall',
>
> 'tests/test_pytest_mock.py::test_used_with_class_scope',
>
> 'tests/test_pytest_mock.py::test_used_with_module_scope',
>
> 'tests/test_pytest_mock.py::test_used_with_package_scope',
>
> 'tests/test_pytest_mock.py::test_used_with_session_scope']}
>
> here is detailed ptest log
> https://snips.sh/f/abkZuQSUsK
Weird. Can you take the python3-git-pw and python3-arrow recipes, and 
I'll take a look at these?
>
> On Fri, Oct 13, 2023 at 10:33 AM Khem Raj <raj.khem@gmail.com> wrote:
>> On 10/13/23 10:30 AM, Trevor Gamblin wrote:
>>> On 2023-10-13 13:15, Khem Raj wrote:
>>>> On Fri, Oct 13, 2023 at 10:08 AM Trevor Gamblin
>>>> <tgamblin@baylibre.com> wrote:
>>>>> Two introspection-related ptests are consistently failing. For now,
>>>>> disable them so that a clean ptest run is available.
>>>>>
>>>> For regular runs can we  move it out of PTESTS_PROBLEMS_META_PYTHON into
>>>> either PTESTS_FAST_META_PYTHON or PTESTS_SLOW_META_PYTHON
>>> Done, sent a patch to move both recipes.
>> Thanks, it will start running in my regular CI jobs now.
>>
>>>>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>>>>> ---
>>>>>    ...t_mock-skip-args-introspection-tests.patch | 38 +++++++++++++++++++
>>>>>    .../python/python3-pytest-mock_3.11.1.bb      |  1 +
>>>>>    2 files changed, 39 insertions(+)
>>>>>    create mode 100644
>>>>> meta-python/recipes-devtools/python/python3-pytest-mock/0001-test_pytest_mock-skip-args-introspection-tests.patch
>>>>>
>>>>> diff --git
>>>>> a/meta-python/recipes-devtools/python/python3-pytest-mock/0001-test_pytest_mock-skip-args-introspection-tests.patch b/meta-python/recipes-devtools/python/python3-pytest-mock/0001-test_pytest_mock-skip-args-introspection-tests.patch
>>>>> new file mode 100644
>>>>> index 0000000000..f024e79d93
>>>>> --- /dev/null
>>>>> +++
>>>>> b/meta-python/recipes-devtools/python/python3-pytest-mock/0001-test_pytest_mock-skip-args-introspection-tests.patch
>>>>> @@ -0,0 +1,38 @@
>>>>> +From e184fb950ad3b52c5c16438d39fe4d516c784e30 Mon Sep 17 00:00:00 2001
>>>>> +From: Trevor Gamblin <tgamblin@baylibre.com>
>>>>> +Date: Thu, 12 Oct 2023 17:32:40 -0400
>>>>> +Subject: [PATCH] test_pytest_mock: skip args introspection tests
>>>>> +
>>>>> +Disable these two tests for now so that python3-pytest-mock can have
>>>>> +successful ptest runs.
>>>>> +
>>>>> +Upstream-Status: Inappropriate [OE-Specific]
>>>>> +
>>>>> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>>>>> +---
>>>>> + tests/test_pytest_mock.py | 2 ++
>>>>> + 1 file changed, 2 insertions(+)
>>>>> +
>>>>> +diff --git a/tests/test_pytest_mock.py b/tests/test_pytest_mock.py
>>>>> +index 3d53241..157b6c3 100644
>>>>> +--- a/tests/test_pytest_mock.py
>>>>> ++++ b/tests/test_pytest_mock.py
>>>>> +@@ -581,6 +581,7 @@ def test_assert_called_wrapper(mocker:
>>>>> MockerFixture) -> None:
>>>>> +     stub.assert_called()
>>>>> +
>>>>> +
>>>>> ++@pytest.mark.skip("Async not correctly detected, skip for now")
>>>>> + @pytest.mark.usefixtures("needs_assert_rewrite")
>>>>> + def test_assert_called_args_with_introspection(mocker:
>>>>> MockerFixture) -> None:
>>>>> +     stub = mocker.stub()
>>>>> +@@ -597,6 +598,7 @@ def
>>>>> test_assert_called_args_with_introspection(mocker: MockerFixture) ->
>>>>> None:
>>>>> +         stub.assert_called_once_with(*wrong_args)
>>>>> +
>>>>> +
>>>>> ++@pytest.mark.skip("Async not correctly detected, skip for now")
>>>>> + @pytest.mark.usefixtures("needs_assert_rewrite")
>>>>> + def test_assert_called_kwargs_with_introspection(mocker:
>>>>> MockerFixture) -> None:
>>>>> +     stub = mocker.stub()
>>>>> +--
>>>>> +2.41.0
>>>>> +
>>>>> diff --git
>>>>> a/meta-python/recipes-devtools/python/python3-pytest-mock_3.11.1.bb
>>>>> b/meta-python/recipes-devtools/python/python3-pytest-mock_3.11.1.bb
>>>>> index 69d74567c3..7fd998edc6 100644
>>>>> --- a/meta-python/recipes-devtools/python/python3-pytest-mock_3.11.1.bb
>>>>> +++ b/meta-python/recipes-devtools/python/python3-pytest-mock_3.11.1.bb
>>>>> @@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = " \
>>>>>    SRC_URI = " \
>>>>>
>>>>> git://github.com/pytest-dev/pytest-mock;branch=main;protocol=https \
>>>>>        file://run-ptest \
>>>>> +    file://0001-test_pytest_mock-skip-args-introspection-tests.patch \
>>>>>    "
>>>>>
>>>>>    SRCREV ?= "d3e73f2e93f7b93eba0a36e17e43bafd969da4fe"
>>>>> --
>>>>> 2.41.0
>>>>>
>>>>>
>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>> Links: You receive all messages sent to this group.
>>>>> View/Reply Online (#105483):
>>>>> https://lists.openembedded.org/g/openembedded-devel/message/105483
>>>>> Mute This Topic: https://lists.openembedded.org/mt/101944758/1997914
>>>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>>>> Unsubscribe:
>>>>> https://lists.openembedded.org/g/openembedded-devel/unsub
>>>>> [raj.khem@gmail.com]
>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>>

