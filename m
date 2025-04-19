Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 143FAC369BD
	for <webhook@archiver.kernel.org>; Sat, 19 Apr 2025 14:07:14 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.8464.1745071631855793776
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Apr 2025 07:07:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Z1FUYJG5;
 spf=pass (domain: konsulko.com, ip: 209.85.218.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-acb615228a4so436072366b.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Apr 2025 07:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1745071630; x=1745676430; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q1cfcEnjJ6/Quba8Za4+yvPdI19KGGRkMm2VLIRhkCc=;
        b=Z1FUYJG5G1FtAivmskJnaBJbhizJOVFr3xXBRuhuj3OCUksXvh4IdtzkDO4Ck60P+c
         VcoXjmR12YHfQCgAAGUaHCu5+oxCHEqiy9tgWkGiIn4rL4vsRGiUEZwvvhqiU9xTZKka
         QBBsl3Y0B71qrnMGble+VUQ3cC2xB2ttpTkUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745071630; x=1745676430;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q1cfcEnjJ6/Quba8Za4+yvPdI19KGGRkMm2VLIRhkCc=;
        b=eYw/maMdk2NdC+xjisE96uhJn//2NAhrvJHJ41HIqsKR1spquUSyhdMs7HYJuMR5KZ
         +P0IOnFmJlYaiiKSvWCCdiJ+78ySc16gMM9seHMFGVGvKUIaXyj/JzWCBeUM8MAyTx1g
         EqpbfPaI2KrYiI897n70jk64wM1nqZ5PzHTZK+vWkaoXp6Rtn81EQ7fHCMDFMpCMX7G8
         7rjGiZw9zM/MDVkLDCj1S7KxVAMjP6Y5VokRSf1bsy7zk3N1SguOsIREk0/o6pcCQ1d4
         wfRmMQR0HrBhscm6qIgQc4yosTFN99/+V9fA6zPsSNi/3NEest/YQ+MtF7Z+rRr0XElV
         46Ag==
X-Gm-Message-State: AOJu0Yz37SFYZa+dzfkdkloQYZx8yma6Z9s79ixxNdPaphOCNWd/G/4P
	AJrAydwguKaWUrKv5NIkx/8yMvDUMC2ukhz6qiL6lu0jhDmnlCJiuwbqs3IjCj0=
X-Gm-Gg: ASbGncvSIkTttpfgUrHDN6bTWd6/DYbrP+n3qd04whIamzxAu83fUCk+vKL4GW+OvxK
	/JABDnv0Azx23NJbS6qOvGTJg+NXVBg4TggpLUx9GmXIYtBnj3BgcolSAGzx8pFj/bsVDKZTgg7
	H6U23sIKxb1WniesOy1yy8Eb13zOZlbdJAAnVnO5z1ycmZupe5/70iyf1Zwmvp42pYoMKAvs7Ag
	goSPcrScVRset9waJnkuBKhaaHEQvdQbwxz6Crf4bsQPc5inbSgilXJ+LvygAi/myebgqTrwmlJ
	qTtCgor/ROSkRbRct9OOfV/UDyQudjj4vHWE9H+mkYNidPoQ
X-Google-Smtp-Source: AGHT+IHRq9IcyYOtZciLEcwlxyIDRG2wEEwW2pfS+Wh9AI1eyoO44gcUiNebESdhOwmVzC4kPu7phA==
X-Received: by 2002:a17:907:3f91:b0:ac8:1bbe:1a5b with SMTP id a640c23a62f3a-acb6ec51617mr566377866b.9.1745071629965;
        Sat, 19 Apr 2025 07:07:09 -0700 (PDT)
Received: from [192.168.5.161] ([46.55.231.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6eefcf0asm272946366b.103.2025.04.19.07.07.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Apr 2025 07:07:09 -0700 (PDT)
Message-ID: <321017f0-7d50-44af-a391-126d3d4d9ff0@konsulko.com>
Date: Sat, 19 Apr 2025 17:07:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCHv2] python3-eth-utils: Upgrade 5.2.0 ->
 5.3.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20250418105119.3211549-1-leon.anavi@konsulko.com>
 <CAMKF1sqhR5FRsw3cfM1J1V4qhbdo4YYgf+NQ3CODAk9O9nD4iA@mail.gmail.com>
 <CAMKF1sqjHe7JoGBTQrOfzUi_em8nXw5yVrDhNWTHzy+mFo0HEg@mail.gmail.com>
Content-Language: en-US
From: Leon Anavi <leon.anavi@konsulko.com>
In-Reply-To: <CAMKF1sqjHe7JoGBTQrOfzUi_em8nXw5yVrDhNWTHzy+mFo0HEg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Apr 2025 14:07:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116981

Hi Khem,

On 18.04.25 г. 21:55 ч., Khem Raj wrote:
> Here is further recipes which need this check
I saw that in the mean time you submitted a patch that enables pydantic 
risc-v builds because python3-pydantic-core has been fixed. Regarding 
these circumstances do we need to check these recipes?

Best regards,
Leon

> ERROR: Nothing RPROVIDES 'python3-eth-utils' (but
> /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-abi_5.2.0.bb,
> /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-keys_0.5.0.bb,
> /home/yoe/sources/meta-openembedded/meta-
>     ↪ python/recipes-devtools/python/python3-eth-account_0.12.1.bb,
> /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-rlp_2.1.0.bb,
> /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-rlp_4.1.0.bb
> RDEPENDS on or otherwise requires it)
>     python3-eth-utils was skipped: incompatible with host
> riscv32-yoe-linux (not in COMPATIBLE_HOST)
>     NOTE: Runtime target 'python3-eth-utils' is unbuildable, removing...
>     Missing or unbuildable dependency chain was: ['python3-eth-utils']
>     ERROR: Nothing RPROVIDES 'python3-eth-abi' (but
> /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-abi_5.2.0.bb,
> /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-account_0.12.1.bb
> RDEPENDS on or otherwise requires it)
>     No eligible RPROVIDERs exist for 'python3-eth-abi'
>     NOTE: Runtime target 'python3-eth-abi' is unbuildable, removing...
>     Missing or unbuildable dependency chain was: ['python3-eth-abi']
>     ERROR: Nothing RPROVIDES 'python3-eth-abi-dev' (but
> /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-abi_5.2.0.bb
> RDEPENDS on or otherwise requires it)
>     No eligible RPROVIDERs exist for 'python3-eth-abi-dev'
>     NOTE: Runtime target 'python3-eth-abi-dev' is unbuildable, removing...
>     Missing or unbuildable dependency chain was: ['python3-eth-abi-dev']
>     ERROR: Nothing RPROVIDES 'python3-eth-keys' (but
> /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-keyfile_0.8.0.bb,
> /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-keys_0.5.0.bb,
> /home/yoe/sources/meta-openembedded/
>     ↪ meta-python/recipes-devtools/python/python3-eth-account_0.12.1.bb
> RDEPENDS on or otherwise requires it)
>     No eligible RPROVIDERs exist for 'python3-eth-keys'
>     NOTE: Runtime target 'python3-eth-keys' is unbuildable, removing...
>     Missing or unbuildable dependency chain was: ['python3-eth-keys']
>     ERROR: Nothing RPROVIDES 'python3-eth-keyfile' (but
> /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-keyfile_0.8.0.bb,
> /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-account_0.12.1.bb
> RDEPENDS on or otherwise requires it)
>     No eligible RPROVIDERs exist for 'python3-eth-keyfile'
>     NOTE: Runtime target 'python3-eth-keyfile' is unbuildable, removing...
>     Missing or unbuildable dependency chain was: ['python3-eth-keyfile']
>     ERROR: Nothing RPROVIDES 'python3-eth-keyfile-dev' (but
> /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-keyfile_0.8.0.bb
> RDEPENDS on or otherwise requires it)
>     No eligible RPROVIDERs exist for 'python3-eth-keyfile-dev'
>     NOTE: Runtime target 'python3-eth-keyfile-dev' is unbuildable, removing...
>     Missing or unbuildable dependency chain was: ['python3-eth-keyfile-dev']
>     ERROR: Nothing RPROVIDES 'python3-eth-keys-dev' (but
> /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-keys_0.5.0.bb
> RDEPENDS on or otherwise requires it)
>     No eligible RPROVIDERs exist for 'python3-eth-keys-dev'
>     NOTE: Runtime target 'python3-eth-keys-dev' is unbuildable, removing...
>     Missing or unbuildable dependency chain was: ['python3-eth-keys-dev']
>     ERROR: Nothing RPROVIDES 'python3-rlp' (but
> /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-account_0.12.1.bb,
> /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-rlp_2.1.0.bb,
> /home/yoe/sources/meta-openembedded/meta-
>     ↪ python/recipes-devtools/python/python3-rlp_4.1.0.bb RDEPENDS on
> or otherwise requires it)
>     No eligible RPROVIDERs exist for 'python3-rlp'
>     NOTE: Runtime target 'python3-rlp' is unbuildable, removing...
>     Missing or unbuildable dependency chain was: ['python3-rlp']
>     ERROR: Nothing RPROVIDES 'python3-eth-rlp' (but
> /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-account_0.12.1.bb,
> /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-rlp_2.1.0.bb
> RDEPENDS on or otherwise requires it)
>     No eligible RPROVIDERs exist for 'python3-eth-rlp'
>     NOTE: Runtime target 'python3-eth-rlp' is unbuildable, removing...
>     Missing or unbuildable dependency chain was: ['python3-eth-rlp']
>     ERROR: Nothing RPROVIDES 'python3-eth-account-dev' (but
> /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-account_0.12.1.bb
> RDEPENDS on or otherwise requires it)
>     No eligible RPROVIDERs exist for 'python3-eth-account-dev'
>     NOTE: Runtime target 'python3-eth-account-dev' is unbuildable, removing...
>     Missing or unbuildable dependency chain was: ['python3-eth-account-dev']
>     ERROR: Nothing RPROVIDES 'python3-eth-account' (but
> /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-account_0.12.1.bb
> RDEPENDS on or otherwise requires it)
>     No eligible RPROVIDERs exist for 'python3-eth-account'
>     NOTE: Runtime target 'python3-eth-account' is unbuildable, removing...
>     Missing or unbuildable dependency chain was: ['python3-eth-account']
>     ERROR: Nothing RPROVIDES 'python3-eth-rlp-dev' (but
> /home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-eth-rlp_2.1.0.bb
> RDEPENDS on or otherwise requires it)
>     No eligible RPROVIDERs exist for 'python3-eth-rlp-dev'
>     NOTE: Runtime target 'python3-eth-rlp-dev' is unbuildable, removing...
>     Missing or unbuildable dependency chain was: ['python3-eth-rlp-dev']
>     ERROR: Nothing RPROVIDES 'python3-rlp-dev' (but
> /home/oe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-rlp_4.1.0.bb
> RDEPENDS on or otherwise requires it)
>     No eligible RPROVIDERs exist for 'python3-rlp-dev'
>     NOTE: Runtime target 'python3-rlp-dev' is unbuildable, removing...
>     Missing or unbuildable dependency chain was: ['python3-rlp-dev']
>
> On Fri, Apr 18, 2025 at 8:26 AM Khem Raj <raj.khem@gmail.com> wrote:
>> On Fri, Apr 18, 2025 at 3:51 AM Leon Anavi via lists.openembedded.org
>> <leon.anavi=konsulko.com@lists.openembedded.org> wrote:
>>> Upgrade to release 5.3.0:
>>>
>>> - Replace arg["name"] with arg.get("name") to correctly handle
>>>    optional names
>>> - Add new methods: to_wei_decimals, and from_wei_decimals which
>>>    take a number instead of a string
>>> - Add CamelModel pydantic model for validating objects and
>>>    serializing to camelCase when used with by_alias=True, with
>>>    the general expectation of a well-formed JSON-RPC object.
>>>
>>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>>> ---
>>>   ...python3-eth-utils_5.2.0.bb => python3-eth-utils_5.3.0.bb} | 5 ++++-
>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>   rename meta-python/recipes-devtools/python/{python3-eth-utils_5.2.0.bb => python3-eth-utils_5.3.0.bb} (76%)
>>>
>>> diff --git a/meta-python/recipes-devtools/python/python3-eth-utils_5.2.0.bb b/meta-python/recipes-devtools/python/python3-eth-utils_5.3.0.bb
>>> similarity index 76%
>>> rename from meta-python/recipes-devtools/python/python3-eth-utils_5.2.0.bb
>>> rename to meta-python/recipes-devtools/python/python3-eth-utils_5.3.0.bb
>>> index 435d032a84..3b71684820 100644
>>> --- a/meta-python/recipes-devtools/python/python3-eth-utils_5.2.0.bb
>>> +++ b/meta-python/recipes-devtools/python/python3-eth-utils_5.3.0.bb
>>> @@ -4,7 +4,7 @@ SECTION = "devel/python"
>>>   LICENSE = "MIT"
>>>   LIC_FILES_CHKSUM = "file://LICENSE;md5=d3f53e7cc5bf80b16eff1f4a38c73182"
>>>
>>> -SRC_URI[sha256sum] = "17e474eb654df6e18f20797b22c6caabb77415a996b3ba0f3cc8df3437463134"
>>> +SRC_URI[sha256sum] = "1f096867ac6be895f456fa3acb26e9573ae66e753abad9208f316d24d6178156"
>>>
>>>   PYPI_PACKAGE = "eth_utils"
>>>   UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
>>> @@ -16,4 +16,7 @@ RDEPENDS:${PN} += " \
>>>       python3-eth-typing \
>>>       python3-setuptools \
>>>       python3-toolz \
>>> +    python3-pydantic \
>>>   "
>>> +
>>> +COMPATIBLE_HOST:riscv32 = "null"
>> this should also be applied to recipes which depend upon python3-eth-utils
>>> --
>>> 2.39.5
>>>
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#116947): https://lists.openembedded.org/g/openembedded-devel/message/116947
>>> Mute This Topic: https://lists.openembedded.org/mt/112328943/1997914
>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>

