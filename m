Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C16C61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 18:23:26 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.1024.1678904596864640006
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Mar 2023 11:23:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SoEqVKfl;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id l1so18133618wry.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 11:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678904595;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oqMEoiqhYKtY82q0afoFx4RN7VUReaRIs6OHewh/Y6w=;
        b=SoEqVKflRGxHDZCmZgGVeV0NGtsBBh5xe+eGc0Ak5se35Rr+NeZDaulgRgY1Y+Q25z
         4sqwuq9DTMVI8TtrUuthyuGxrfFBvidvL7C0URIUedFvKAZrmqaauC3kLgLd4REk8Qdp
         Rw3o+dMrgCMGDTUdweeEMc2z5Dly7hxpxpp8ORUW1VBjXfMSEa/k5MZ2STpegOAwSQNd
         XVcFWt/zxX8PhFCcVMujwYxvKKX76RPJQP5RCtLVsOSDYWaDqKZamwaLcDGJ266n2uj3
         oRptyHqvjDiaFgSUHGesyDY/cHu9ZrE97IIr9XEmdOn3ilsQpZNLf2+jsR+YPWXjUgWI
         GuTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678904595;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oqMEoiqhYKtY82q0afoFx4RN7VUReaRIs6OHewh/Y6w=;
        b=xAB2TjKxI6BpJS6OVxt6rankrIT1V0qtlgEoaoOHQe/+KRUvGRADZo1rvUE2elc5Ht
         F5KxYILNmY75pvLQohQqlMR/TwOFa82BuNeI4i8DaV2kqzwDOqKfI2HfzdLXKNhatdfe
         N7mMF9qbWSz6QKdJ69CL5yZQP3GN9gNajZvbWQiHpLeELRDDI4T0taviXWo3+uTTTBL7
         kYLdRR/OvJaHKCKYx5RHNhBqR699C6PxVfQ2/zQ/9ngHcyjCLBaZ8OhKCwmn3ruyLzIP
         9NbRd55m4LzdJ72mHMCfZ19+YYsbZxmEAAmBi9k7vc2mUbze1BWZ/eYjE8bdGk+JjgKI
         NsZg==
X-Gm-Message-State: AO0yUKVOlc0p9Zv/D0zUig0ncq7y9ttEGdaV6SqseUY6YL94wM8iw/0l
	+IjzYTIkU1VH7EJLIi2inxg=
X-Google-Smtp-Source: AK7set9k9SqqDzF3HwD407AZFjXnhc8zhkDuXFqcaMTzi9Bk0y5eNeLNNB0CRlZCEdS39NW8SpRJbQ==
X-Received: by 2002:a5d:5962:0:b0:2ce:a7b3:1c70 with SMTP id e34-20020a5d5962000000b002cea7b31c70mr2549873wri.51.1678904595277;
        Wed, 15 Mar 2023 11:23:15 -0700 (PDT)
Received: from [192.168.1.143] (BC2440CC.dsl.pool.telekom.hu. [188.36.64.204])
        by smtp.gmail.com with ESMTPSA id g8-20020a5d4888000000b002d1959d2cf7sm473977wrq.111.2023.03.15.11.23.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 11:23:15 -0700 (PDT)
Message-ID: <a78df949-9db8-7839-df2a-0fdf543596c9@gmail.com>
Date: Wed, 15 Mar 2023 19:23:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [oe] [meta-python][PATCH 2/4] python3-patchelf: New recipe
Content-Language: en-US
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20230315080429.2722555-1-zboszor@gmail.com>
 <20230315080429.2722555-2-zboszor@gmail.com>
 <D47E7172-2A7E-4B2A-9F1B-CFEE77D06563@arm.com>
 <174C9D7A024E2A7B.8829@lists.openembedded.org>
 <174CA8FCFC219282.31505@lists.openembedded.org>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <174CA8FCFC219282.31505@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 18:23:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101567

2023. 03. 15. 18:49 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
> 2023. 03. 15. 15:18 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
>> 2023. 03. 15. 13:42 keltezéssel, Ross Burton írta:
>>> On 15 Mar 2023, at 08:04, Zoltan Boszormenyi via lists.openembedded.org 
>>> <zboszor=gmail.com@lists.openembedded.org> wrote:
>>>> +++ b/meta-python/recipes-devtools/python/python3-patchelf_0.17.2.1.bb
>>>> @@ -0,0 +1,31 @@
>>>> +# This is a dummy package needed by python3-meson-python
>>> I note the words “dummy package”
>>
>> See the sources of https://pypi.org/project/patchelf/
>> There is none, only the build system.
>>
>> The build system would have just built patchelf, and
>> installed into ${bindir} which would conflict with the
>> existing patchelf recipe.
>>
>>>> +DEPENDS = "python3-scikit-build-native"
>>> Where is this dependency from?
>>
>> From its build system.

patchelf's pyproject.toml references it, in turn
the scikit-build uses cmake to build things.
The easiest way was to replace the original CMakeLists.txt
with a crippled one to only print a line when installing.

The below part is the patchelf dependency in mesonpy,
sorry for my confusion.

> Actually, it's in mesonpy/__init__.py:
>
> class _depstr:
>     """Namespace that holds the requirement strings for dependencies we *might*
>     need at runtime. Having them in one place makes it easier to update.
>     """
>     patchelf = 'patchelf >= 0.11.0'
>     ninja = f'ninja >= {_NINJA_REQUIRED_VERSION}'
>
>> The meta build complains.
>
> meson-python uses itself as the build backend to built itself,
> so the build really does complain if the patchelf dummy
> module is not present. ¯\_(ツ)_/¯
>
>> The scikit-build recipe I previously sent was already merged,
>> so it may be used.
>>
>>>> +PYPI_PACKAGE = "patchelf"
>>>> +PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
>>>> +
>>>> +inherit pypi python_setuptools_build_meta
>>> Why is it downloading stuff?
>>>
>>> Why is any of this needed?  Can’t we just comment out the requirement for patchelf, or 
>>> write a proper stub package?
>>
>> It means less patching in modules depending on this
>> particular module, like meson-python.
>>
>> Do you prefer patching out this dependency from meson-python
>> and any other that may depend on it?
>>
>>
>>
>>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101565): https://lists.openembedded.org/g/openembedded-devel/message/101565
> Mute This Topic: https://lists.openembedded.org/mt/97622994/3617728
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


