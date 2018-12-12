Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 086596093A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Dec 2018 02:31:19 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id c72so8095581pfc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Dec 2018 18:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=dc1ZeDmu80JPTp0GKa9MiVIRcPuBYg7yS2KhCGyvuYs=;
	b=iaEHP7MAg3MhaOfEaMqggBm/RHqqgsJnRbEevBNQ+AV7fSZm4THuPzHuzXFiMPmiDN
	EdVSjo0BIH/gzMYX3JlUiIskF6y+8GXDe70RHbRJr0eBt5EHaGKS/ZB0Bn+jAUkIIhyh
	idaW4JhKaXVyh8HFUq5GOKPwcYgxiDaxrUqzQ069CcYpfcWlcy0a4PlqhygznIrfg8VL
	COxQjMqgRLKdB1QBO9MXRkW1iCetj172KkEv5DDYjqcGUQ3ZEzXSCQ0UEsqe02uUOIUT
	BrLVEfZcwg36t9Wg1iU4rrHDA1EF2epVzq8TS/tXetkhupLl1Cjbowy/GjG6QDIN26JT
	K5XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=dc1ZeDmu80JPTp0GKa9MiVIRcPuBYg7yS2KhCGyvuYs=;
	b=X/OIM6TDyzSjY1r1AxYTPyMrrB7rbGGk63+jT8jtsAcwtNSYpaS147TI+JV8QCnHXi
	77O2ahzsE8AKvedSbnauZOQaWQY7PLvXHvwXzvKamZArNxb3BIc6BWhr+8PolyckEnHR
	PVdSMW0NuokrZaHnuV2tmYqKSWq1dhADBEaw2hbKoVlGIyij1XzNrP6xiJ5tRFPHPYl2
	JW1IjUidcGYHpJi3qxYBOVcBa3NFu1M5XrXfT5wNDngJN3IelGSIpSZY/6zlWYMAGVAa
	mjDp2YKAqQ6Czr2oZ6aRk45AXJ2fKJFTgKrWW0pqwPEJ0j86nIy0KjyFoaEb+uzVcyMP
	rAjw==
X-Gm-Message-State: AA+aEWYRsXC1KXyGMb1CwfBUeznawkicrF54IVPIvPHddYdq2MAd6pcy
	U199jZWYCe6mgCA/GEsZc/tGaL+D
X-Google-Smtp-Source: AFSGD/W4PL3jUuE+ALj9poy/iWdUo3CXC6Hb2C+7m6+FjhDkWrPJjCutWQZbgB/bl8lOAiIJvj+VSg==
X-Received: by 2002:a65:55ca:: with SMTP id k10mr16613802pgs.448.1544581880624;
	Tue, 11 Dec 2018 18:31:20 -0800 (PST)
Received: from [10.20.245.5] ([45.19.219.177])
	by smtp.gmail.com with ESMTPSA id
	g11sm19976601pfo.139.2018.12.11.18.31.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Dec 2018 18:31:19 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>, Changqing Li <changqing.li@windriver.com>, 
	Michael Halstead <mhalstead@linuxfoundation.org>
References: <1543997256-46343-1-git-send-email-changqing.li@windriver.com>
	<24c4dd68-8e62-dd2b-357f-d6e5a9ce833f@windriver.com>
	<CA+chaQeaEWUr36Gn1YMuSRebyNQBFd0k-hW3k5rcxjvXb1xisA@mail.gmail.com>
	<02491310-20e8-39d6-78d6-2536d664e5e6@windriver.com>
	<CAMKF1soEqsNpW+rX6+ySrgCHXSMrsfjQVmCBYao_+koxiBax+w@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <51a4e824-d1b8-cfbe-f727-192d87b46de5@gmail.com>
Date: Tue, 11 Dec 2018 18:31:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1soEqsNpW+rX6+ySrgCHXSMrsfjQVmCBYao_+koxiBax+w@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH V2] geoip: update geolite database checksum
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Dec 2018 02:31:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 12/11/18 7:09 AM, Khem Raj wrote:
> adding Michael
> On Tue, Dec 11, 2018 at 1:47 AM Changqing Li <changqing.li@windriver.com> wrote:
>> On 12/11/18 5:21 PM, Martin Jansa wrote:
>>
>> http://downloads.yoctoproject.org/mirror/sources/ is updated only by Yocto autobuilder which doesn't include meta-oe layers.
>>
>> Someone will need to upload it there manually.
>>
>> http://sources.openembedded.org is the one updated by world builds Khem is running.
>>
>> Thanks.
>>
>> Khem, can you help to check if there is already a mirror on http://sources.openembedded.org?
>>
>> I cannot see it,   403 forbidden.   if it is there,  maybe we can change SRC_URI point to there.

did anyone run?

oe-selftest -r meta_oe_sources.MetaOESourceMirroring.test_oe_source_mirror

- armin
>>
>>
>> On Tue, Dec 11, 2018 at 6:26 AM Changqing Li <changqing.li@windriver.com> wrote:
>>> Hi,  Khem and Martin
>>>
>>> I noticed Khem have merge this patch to master yesterday,  but the
>>> mirror on http://downloads.yoctoproject.org/mirror/sources/
>>>
>>> still not generated yet, do you know how to trigger the build and
>>> generate a mirror on above link?   I think the checksum will change
>>>
>>> again tomorrow,  seem we don't have time to change SRC_URI to the
>>> http://downloads.yoctoproject.org/mirror/sources/, :-(
>>>
>>>
>>> On 12/5/18 4:07 PM, changqing.li@windriver.com wrote:
>>>> From: Changqing Li <changqing.li@windriver.com>
>>>>
>>>> Geolite database checksum changed today, so update it
>>>> to the lastest one.
>>>>
>>>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>>>> ---
>>>>   .../recipes-support/geoip/geoip_1.6.12.bb          | 26 ++++++++++++----------
>>>>   1 file changed, 14 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
>>>> index 57f0b67..c3ce4d8 100644
>>>> --- a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
>>>> +++ b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
>>>> @@ -8,11 +8,13 @@ using reverse DNS lookups."
>>>>   HOMEPAGE = "http://dev.maxmind.com/geoip/"
>>>>   SECTION = "libdevel"
>>>>
>>>> +GEOIP_DATABASE_VERSION = "20181205"
>>>> +
>>>>   SRC_URI = "git://github.com/maxmind/geoip-api-c.git \
>>>> -           http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz;apply=no;name=GeoIP-dat;downloadfilename=GeoIP.dat.20181120.gz \
>>>> -           http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;apply=no;name=GeoIPv6-dat;downloadfilename=GeoIPv6.dat.20181120.gz \
>>>> -           http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz;apply=no;name=GeoLiteCity-dat;downloadfilename=GeoLiteCity.dat.20181120.gz \
>>>> -           http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz;apply=no;name=GeoLiteCityv6-dat;downloadfilename=GeoLiteCityv6.dat.20181120.gz \
>>>> +           http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz;apply=no;name=GeoIP-dat;downloadfilename=GeoIP.dat.${GEOIP_DATABASE_VERSION}.gz \
>>>> +           http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;apply=no;name=GeoIPv6-dat;downloadfilename=GeoIPv6.dat.${GEOIP_DATABASE_VERSION}.gz \
>>>> +           http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz;apply=no;name=GeoLiteCity-dat;downloadfilename=GeoLiteCity.dat.${GEOIP_DATABASE_VERSION}.gz \
>>>> +           http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz;apply=no;name=GeoLiteCityv6-dat;downloadfilename=GeoLiteCityv6.dat.${GEOIP_DATABASE_VERSION}.gz \
>>>>              file://run-ptest \
>>>>   "
>>>>   SRCREV = "4b526e7331ca1d692b74a0509ddcc725622ed31a"
>>>> @@ -20,14 +22,14 @@ SRCREV = "4b526e7331ca1d692b74a0509ddcc725622ed31a"
>>>>   SRC_URI[GeoIP-dat.md5sum] = "d538e57ad9268fdc7955c6cf9a37c4a9"
>>>>   SRC_URI[GeoIP-dat.sha256sum] = "b9c05eb8bfcf90a6ddfdc6815caf40a8db2710f0ce3dd48fbd6c24d485ae0449"
>>>>
>>>> -SRC_URI[GeoIPv6-dat.md5sum] = "a908d7a51c3883eb8f693ca197c7a142"
>>>> -SRC_URI[GeoIPv6-dat.sha256sum] = "1b06e34eed2c539606a9ab4d97b2140ac80bf9f528d16ad2e3831c75014c2710"
>>>> +SRC_URI[GeoIPv6-dat.md5sum] = "52d6aa0aac1adbfa5eb7fa4742197c11"
>>>> +SRC_URI[GeoIPv6.sha256sum] = "416ac92fcc35a21d5efbb32e5c88e609c37aec1aa1af6247d088b8da1af6e9bf"
>>>>
>>>>   SRC_URI[GeoLiteCity-dat.md5sum] = "d700c137232f8e077ac8db8577f699d9"
>>>>   SRC_URI[GeoLiteCity-dat.sha256sum] = "90db2e52195e3d1bcdb2c2789209006d09de5c742812dbd9a1b36c12675ec4cd"
>>>>
>>>> -SRC_URI[GeoLiteCityv6-dat.md5sum] = "8ac3506ccabaae7e9f7d6301c2654313"
>>>> -SRC_URI[GeoLiteCityv6-dat.sha256sum] = "1c5fced1657d09448b3ecc14b65c9536228a627d93ed4159d3438b2c6faa8506"
>>>> +SRC_URI[GeoLiteCityv6-dat.md5sum] = "6734ccdc644fc0ba76eb276dce73d005"
>>>> +SRC_URI[GeoLiteCityv6-dat.sha256sum] = "c95a9d2643b7f53d7abeed2114388870e13fbbad4653f450a49efa7e4b86aca4"
>>>>
>>>>   LICENSE = "LGPL-2.1"
>>>>
>>>> @@ -44,10 +46,10 @@ EXTRA_OECONF = "--disable-static               \
>>>>   do_install() {
>>>>       make DESTDIR=${D} install
>>>>       install -d ${D}/${datadir}/GeoIP
>>>> -    install ${WORKDIR}/GeoIP.dat.20181120 ${D}/${datadir}/GeoIP/GeoIP.dat
>>>> -    install ${WORKDIR}/GeoIPv6.dat.20181120 ${D}/${datadir}/GeoIP/GeoIPv6.dat
>>>> -    install ${WORKDIR}/GeoLiteCity.dat.20181120 ${D}/${datadir}/GeoIP/GeoLiteCity.dat
>>>> -    install ${WORKDIR}/GeoLiteCityv6.dat.20181120 ${D}/${datadir}/GeoIP/GeoLiteCityv6.dat
>>>> +    install ${WORKDIR}/GeoIP.dat.${GEOIP_DATABASE_VERSION} ${D}/${datadir}/GeoIP/GeoIP.dat
>>>> +    install ${WORKDIR}/GeoIPv6.dat.${GEOIP_DATABASE_VERSION} ${D}/${datadir}/GeoIP/GeoIPv6.dat
>>>> +    install ${WORKDIR}/GeoLiteCity.dat.${GEOIP_DATABASE_VERSION} ${D}/${datadir}/GeoIP/GeoLiteCity.dat
>>>> +    install ${WORKDIR}/GeoLiteCityv6.dat.${GEOIP_DATABASE_VERSION} ${D}/${datadir}/GeoIP/GeoLiteCityv6.dat
>>>>       ln -s GeoLiteCity.dat ${D}${datadir}/GeoIP/GeoIPCity.dat
>>>>   }
>>>>
>>> --
>>> BRs
>>>
>>> Sandy(Li Changqing)
>>>
>> --
>> BRs
>>
>> Sandy(Li Changqing)


