Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87895CF11C6
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 09:59:48 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.39786.1728554375302622758
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Oct 2024 02:59:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=eu5my3co;
 spf=pass (domain: konsulko.com, ip: 209.85.218.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a9982159d98so119164766b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 02:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1728554374; x=1729159174; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zf4BgGH0YvSNrDCo2V0zIZxBKe4j49SLA6KZ3KQ4SRw=;
        b=eu5my3colN1ypQXnzw87GiwoG2PhJMaLYkJxly7TJ2jWv6t6UFmUzzTq5YotyIfO86
         vZJudewYkFDfiltu3O5J581g9DfqRfcnW/kl0ZcLBUQyKu/DZsGP9GD1LdwcqgXrzsUB
         IKI8Yodkz6VeVYc+2Cb1kleHR2CCTLU1IzJ5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728554374; x=1729159174;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zf4BgGH0YvSNrDCo2V0zIZxBKe4j49SLA6KZ3KQ4SRw=;
        b=cmuXAeaKetMyEfuhW2dIRq6v1KkxPkemZjTPVDmp+VMK1nt5s7mkD519FvHblHp+RM
         LgMHv4EjptepwZqohE++4QOuCxi+JGeISBoTjw+okfVPMd92WXB9DwB+jzF9wI0pwYot
         L9FQ3P2DEhb61Cp1dsO17yBHaBXjFA6e30PVFHPZuN5ZXygYN9W3eso3J27PZ+BPgLRw
         XDs4egqSq+lCfTgS5e5dxOb/4EZ7F7MiS3CF+11G2N5jdxgd3BZ2eB4mA7myvPXDSSsd
         6N+IgJp7rwQPsBczhcH/Mtnw0Et/k1MU75TAhCcERVBkyqXOIoHmouvGF/exNCklRh52
         Q93w==
X-Gm-Message-State: AOJu0YycTwVQPcCIZZJilKMBDP4Z2oPApdFi5S7tULFoIkxMEeHbFplL
	RQ4oGr+7dZy7zNcV1+O0RKVwYHiKSqqQV8sIfzK695sbhp6QWTZNS+ic+oKPbPZsWU0KwU9NTba
	w
X-Google-Smtp-Source: AGHT+IFB4JP4KTE2rdyPa/r2BbNoAajPlqKzW1tg8pupV++KXsrifqNw4tZf2eey3ki5FqVUWh3tIQ==
X-Received: by 2002:a17:907:c7de:b0:a8b:2604:1da3 with SMTP id a640c23a62f3a-a998d19ff1dmr463589966b.17.1728554373345;
        Thu, 10 Oct 2024 02:59:33 -0700 (PDT)
Received: from [192.168.5.161] ([46.55.231.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a7ede920sm65869366b.8.2024.10.10.02.59.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 02:59:32 -0700 (PDT)
Message-ID: <34c9438f-1987-43ba-bd7c-f3274c98b0ed@konsulko.com>
Date: Thu, 10 Oct 2024 12:59:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-propcache: Add recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20241009123007.1023153-1-leon.anavi@konsulko.com>
 <20241009123007.1023153-3-leon.anavi@konsulko.com>
 <CAMKF1srnjtkO+jV1KmMM+0EYaRGbxRcANL3OGEwkxyx3mt3ddg@mail.gmail.com>
Content-Language: en-US
From: Leon Anavi <leon.anavi@konsulko.com>
In-Reply-To: <CAMKF1srnjtkO+jV1KmMM+0EYaRGbxRcANL3OGEwkxyx3mt3ddg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 09:59:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112775

Hi Khem,

On 9.10.24 г. 20:48 ч., Khem Raj wrote:
> On Wed, Oct 9, 2024 at 5:30 AM Leon Anavi via lists.openembedded.org
> <leon.anavi=konsulko.com@lists.openembedded.org> wrote:
>> Add recipe for release 0.2.0:
>>
>> - Fixed loading the C-extensions on Python 3.8
>> - Improved typing for the :func:`propcache.api.under_cached_property`
>>    decorator
>>
>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> ---
>>   .../python/python3-propcache_0.2.0.bb         | 24 +++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>   create mode 100644 meta-python/recipes-devtools/python/python3-propcache_0.2.0.bb
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-propcache_0.2.0.bb b/meta-python/recipes-devtools/python/python3-propcache_0.2.0.bb
>> new file mode 100644
>> index 000000000..01a7c4c05
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-propcache_0.2.0.bb
>> @@ -0,0 +1,24 @@
>> +SUMMARY = "Fast property caching"
>> +HOMEPAGE = "https://github.com/aio-libs/propcache"
>> +LICENSE = "Apache-2.0"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>> +
>> +SRC_URI[sha256sum] = "df81779732feb9d01e5d513fad0122efb3d53bbc75f61b2a4f29a020bc985e70"
>> +
>> +inherit pypi python_setuptools_build_meta
>> +
>> +DEPENDS += " \
>> +    python3-expandvars-native \
>> +    python3-cython-native \
>> +"
>> +
>> +#RDEPENDS:${PN} = "\
>> +#    python3-multidict \
>> +#    python3-idna \
>> +#    python3-io \
>> +#"
>> +
>> +#RDEPENDS:${PN}-ptest += " \
>> +#    python3-pytest \
>> +#    python3-unittest-automake-output \
>> +#"
> why are we adding commented code? Do tests work for this package at
> all or is it wip

Sorry, I've just sent v2 of the patch. We need this recipe for new 
version of python3-yarl which I updated yesterday. The package works. I 
tested it with my rpi5 setup.

Best regards,
Leon

>> --
>> 2.39.5
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#112729): https://lists.openembedded.org/g/openembedded-devel/message/112729
>> Mute This Topic: https://lists.openembedded.org/mt/108907750/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

