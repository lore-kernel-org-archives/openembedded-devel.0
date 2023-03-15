Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE797C61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 17:49:25 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.163.1678902565213940943
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Mar 2023 10:49:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HMwfokkM;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id cn21so48529901edb.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 10:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678902563;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A02LfzX1coVtI4LQp2CuYQNVMmn5RpcH6psoVYVLIOg=;
        b=HMwfokkMc/AkAzAlxOApB+LS42G2ej/9D0M4Lu5V1fyvb2MLd8O5ArtGSlTTdCOPuu
         xC8tBUIJlEEA6NBtniT6EylBWiEFmwyuen7fdBkVj9EuXcSkq/4+mG4pbYP5/aerKUYu
         6Qk6zLHlR1DpTA9TZMvZXCZQuooR/NEEf0yUL+0VaOC3pikpLr+jwtbJM5QO6eyQd5tx
         /1eDSQv7JCu92mD5y8MZmEj6eHmSb6B1IiodGN40L6y8Wwh7RwHHyxypGbyZpUUD01z2
         LRFBIXuhHQ9Lycl88ckx56Lwgg1+V6K3EaeYCmPAPg9oBsoG/WAN5iHoQ61b6CSVFDJv
         tQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678902563;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A02LfzX1coVtI4LQp2CuYQNVMmn5RpcH6psoVYVLIOg=;
        b=ED4vznQdXacNtYSa1y1c0jgdwr1YIH5aW75oqXQO3e+Nmuhr/HiL/j40vBFi+jKSgb
         B3kLKdMkCpG+YMtTyAgS8GE7cR+HP8qRpSmsBJkFD3CJrSVYRaikrnFOshpTl+NQRige
         FF3l+moZWUKgN5oX6dxfZQ/0n7VBZ1FeMx2BSS+watYmdUObT0pgXknIILnaa5iiPnGH
         FI0zzCMylCv4ZclMtdt+XfpA5oQlKWfFs2+5ez06dQoQafBbXZptMbSPc2J0ogxRa5qk
         nVqaHB3TFe+r4Qb0K6c/gYjocIAT0OJqrlv2BSi1Ww4F7hBnx6TY+W8CAZMlCxAyd2NT
         86eA==
X-Gm-Message-State: AO0yUKWz2dWp3muskcGXlnUxRkoKxX6HBNO6pZF2XpeS6noBR/6IajbZ
	HBwfNHARas5C6wb2hgUb83c=
X-Google-Smtp-Source: AK7set8tLSA33GR40LMTFOh119LGfF+un002LRitQZ34RsJuRzlHV886/jRlbSUCBSnjtDx3vTaNQQ==
X-Received: by 2002:a05:6402:202:b0:4fd:2b59:ef91 with SMTP id t2-20020a056402020200b004fd2b59ef91mr3506045edv.3.1678902563551;
        Wed, 15 Mar 2023 10:49:23 -0700 (PDT)
Received: from [192.168.1.143] (BC2440CC.dsl.pool.telekom.hu. [188.36.64.204])
        by smtp.gmail.com with ESMTPSA id v3-20020a50d083000000b004c3e3a6136dsm2794304edd.21.2023.03.15.10.49.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 10:49:23 -0700 (PDT)
Message-ID: <b5063828-e123-e9f1-f59a-a8b1f8539132@gmail.com>
Date: Wed, 15 Mar 2023 18:49:22 +0100
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
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <174C9D7A024E2A7B.8829@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 17:49:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101565

2023. 03. 15. 15:18 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
> 2023. 03. 15. 13:42 keltezéssel, Ross Burton írta:
>> On 15 Mar 2023, at 08:04, Zoltan Boszormenyi via lists.openembedded.org 
>> <zboszor=gmail.com@lists.openembedded.org> wrote:
>>> +++ b/meta-python/recipes-devtools/python/python3-patchelf_0.17.2.1.bb
>>> @@ -0,0 +1,31 @@
>>> +# This is a dummy package needed by python3-meson-python
>> I note the words “dummy package”
>
> See the sources of https://pypi.org/project/patchelf/
> There is none, only the build system.
>
> The build system would have just built patchelf, and
> installed into ${bindir} which would conflict with the
> existing patchelf recipe.
>
>>> +DEPENDS = "python3-scikit-build-native"
>> Where is this dependency from?
>
> From its build system.

Actually, it's in mesonpy/__init__.py:

class _depstr:
     """Namespace that holds the requirement strings for dependencies we *might*
     need at runtime. Having them in one place makes it easier to update.
     """
     patchelf = 'patchelf >= 0.11.0'
     ninja = f'ninja >= {_NINJA_REQUIRED_VERSION}'

> The meta build complains.

meson-python uses itself as the build backend to built itself,
so the build really does complain if the patchelf dummy
module is not present. ¯\_(ツ)_/¯

> The scikit-build recipe I previously sent was already merged,
> so it may be used.
>
>>> +PYPI_PACKAGE = "patchelf"
>>> +PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
>>> +
>>> +inherit pypi python_setuptools_build_meta
>> Why is it downloading stuff?
>>
>> Why is any of this needed?  Can’t we just comment out the requirement for patchelf, or 
>> write a proper stub package?
>
> It means less patching in modules depending on this
> particular module, like meson-python.
>
> Do you prefer patching out this dependency from meson-python
> and any other that may depend on it?
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101562): https://lists.openembedded.org/g/openembedded-devel/message/101562
> Mute This Topic: https://lists.openembedded.org/mt/97622994/3617728
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


