Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id D2F826BF7A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Dec 2018 08:05:41 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id k8so8227452pls.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Dec 2018 00:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=qBnZGHXYM0utRNxf99E4eSCR4dtjhVBKcCKin1WUpFc=;
	b=Hp58duV2QPOAs7byLuHBMgYM7tKu6iRdN0V6KmxSOIrvE7n3ZI2goKEsSYJiitWXgN
	1gybnZ9TE+KDltjeTn9ldeDoBerVE0g9bk/KVe8J9hvt7JHgg1oNx8wbuNGey+UyL/oi
	Ly6ra2vHmANV8aX0B485mu1epJnPodli6tUS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=qBnZGHXYM0utRNxf99E4eSCR4dtjhVBKcCKin1WUpFc=;
	b=SmKVojGp9tdkDGE362gu/sP/7fOmkWDKZF2A+7oAGC+mq2cB/8Y2jhvrafjdMHSgkF
	yKfhihXYBJ2aATevlMEuheFwEp1kEl5Y1aOM1N/LiOEHhrzuztT2n8qp1hRmHtTr1C5U
	Vjm7OcZg2+GATdiI+GVS6ljViyJyXPj0n8owkSTEZgA+R1QVplVaHIS9dNhGaaRHAiGM
	3TOd7gybGleit428z8QBvyJwi2jnuxHoRT35z5wCzUFUKmpDOzVSZuZAup01W6fisvlc
	r2bE+Ya/BnZ3Z/PD5zlDXWIcl9nEgLS3iobC0XpwkgJIa5ZIozrGBOWC9M0HfXROT3Ba
	pgfg==
X-Gm-Message-State: AA+aEWYmfYPSMIyjvD6bROYQ8pIECQ1vw6C80AauAM7+RqjG7qm5IuhA
	2MzZEVGwPRGW3vVoddlvSiGzP2egPHo=
X-Google-Smtp-Source: AFSGD/Vx0BVmscdC518fcr7Vdl8FU7d0Vtw7aj5dqjyTOVAea6mEfc6HVTr4InfCpdAgWGom5iQxog==
X-Received: by 2002:a17:902:6948:: with SMTP id
	k8mr18737624plt.2.1544601941220; 
	Wed, 12 Dec 2018 00:05:41 -0800 (PST)
Received: from ?IPv6:2601:1c0:ca00:bd01::d5ff? ([2601:1c0:ca00:bd01::d5ff])
	by smtp.gmail.com with ESMTPSA id
	z186sm24639413pfz.119.2018.12.12.00.05.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Dec 2018 00:05:40 -0800 (PST)
To: Changqing Li <changqing.li@windriver.com>,
	akuster808 <akuster808@gmail.com>, Khem Raj <raj.khem@gmail.com>
References: <1543997256-46343-1-git-send-email-changqing.li@windriver.com>
	<24c4dd68-8e62-dd2b-357f-d6e5a9ce833f@windriver.com>
	<CA+chaQeaEWUr36Gn1YMuSRebyNQBFd0k-hW3k5rcxjvXb1xisA@mail.gmail.com>
	<02491310-20e8-39d6-78d6-2536d664e5e6@windriver.com>
	<CAMKF1soEqsNpW+rX6+ySrgCHXSMrsfjQVmCBYao_+koxiBax+w@mail.gmail.com>
	<51a4e824-d1b8-cfbe-f727-192d87b46de5@gmail.com>
	<0f015093-8028-858a-8cd2-0c65be0807a8@windriver.com>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Organization: Linux Foundation
Message-ID: <0c0ffa19-a50f-4822-07b8-78a7c59f82fb@linuxfoundation.org>
Date: Wed, 12 Dec 2018 00:05:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <0f015093-8028-858a-8cd2-0c65be0807a8@windriver.com>
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
X-List-Received-Date: Wed, 12 Dec 2018 08:05:42 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 12/11/18 7:34 PM, Changqing Li wrote:
>
> On 12/12/18 10:31 AM, akuster808 wrote:
>>
>> On 12/11/18 7:09 AM, Khem Raj wrote:
>>> adding Michael
>>> On Tue, Dec 11, 2018 at 1:47 AM Changqing Li 
>>> <changqing.li@windriver.com> wrote:
>>>> On 12/11/18 5:21 PM, Martin Jansa wrote:
>>>>
>>>> http://downloads.yoctoproject.org/mirror/sources/ is updated only 
>>>> by Yocto autobuilder which doesn't include meta-oe layers.
>>>>
>>>> Someone will need to upload it there manually.
>>>>
>>>> http://sources.openembedded.org is the one updated by world builds 
>>>> Khem is running.
>>>>
>>>> Thanks.
>>>>
>>>> Khem, can you help to check if there is already a mirror on 
>>>> http://sources.openembedded.org?
>>>>
>>>> I cannot see it,   403 forbidden.   if it is there,  maybe we can 
>>>> change SRC_URI point to there.
>> did anyone run?
>>
>> oe-selftest -r 
>> meta_oe_sources.MetaOESourceMirroring.test_oe_source_mirror
>>
>> - armin
>
> I didn't.  I think it is better who can upload manually to the mirror 
> address. but I don't know
>
> who have the access right.  Anyone know?

I have access to add files to http://sources.openembedded.org/. What 
needs to be done?

I've temporarily enabled indexes so you will get a file list instead of 
the 403 response in case that helps.

>
>>>>
>>>> On Tue, Dec 11, 2018 at 6:26 AM Changqing Li 
>>>> <changqing.li@windriver.com> wrote:
>>>>> Hi,  Khem and Martin
>>>>>
>>>>> I noticed Khem have merge this patch to master yesterday, but the
>>>>> mirror on http://downloads.yoctoproject.org/mirror/sources/
>>>>>
>>>>> still not generated yet, do you know how to trigger the build and
>>>>> generate a mirror on above link?   I think the checksum will change
>>>>>
>>>>> again tomorrow,  seem we don't have time to change SRC_URI to the
>>>>> http://downloads.yoctoproject.org/mirror/sources/, :-(
>>>>>
>>>>>
>>>>> On 12/5/18 4:07 PM, changqing.li@windriver.com wrote:
>>>>>> From: Changqing Li <changqing.li@windriver.com>
>>>>>>
>>>>>> Geolite database checksum changed today, so update it
>>>>>> to the lastest one.
>>>>>>
>>>>>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>>>>>> ---
>>>>>>    .../recipes-support/geoip/geoip_1.6.12.bb          | 26 
>>>>>> ++++++++++++----------
>>>>>>    1 file changed, 14 insertions(+), 12 deletions(-)
>>>>>>
>>>>>> diff --git 
>>>>>> a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb 
>>>>>> b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
>>>>>> index 57f0b67..c3ce4d8 100644
>>>>>> --- a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
>>>>>> +++ b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
>>>>>> @@ -8,11 +8,13 @@ using reverse DNS lookups."
>>>>>>    HOMEPAGE = "http://dev.maxmind.com/geoip/"
>>>>>>    SECTION = "libdevel"
>>>>>>
>>>>>> +GEOIP_DATABASE_VERSION = "20181205"
>>>>>> +
>>>>>>    SRC_URI = "git://github.com/maxmind/geoip-api-c.git \
>>>>>> - 
>>>>>> http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz;apply=no;name=GeoIP-dat;downloadfilename=GeoIP.dat.20181120.gz 
>>>>>> \
>>>>>> - 
>>>>>> http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;apply=no;name=GeoIPv6-dat;downloadfilename=GeoIPv6.dat.20181120.gz 
>>>>>> \
>>>>>> - 
>>>>>> http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz;apply=no;name=GeoLiteCity-dat;downloadfilename=GeoLiteCity.dat.20181120.gz 
>>>>>> \
>>>>>> - 
>>>>>> http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz;apply=no;name=GeoLiteCityv6-dat;downloadfilename=GeoLiteCityv6.dat.20181120.gz 
>>>>>> \
>>>>>> + 
>>>>>> http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz;apply=no;name=GeoIP-dat;downloadfilename=GeoIP.dat.${GEOIP_DATABASE_VERSION}.gz 
>>>>>> \
>>>>>> + 
>>>>>> http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;apply=no;name=GeoIPv6-dat;downloadfilename=GeoIPv6.dat.${GEOIP_DATABASE_VERSION}.gz 
>>>>>> \
>>>>>> + 
>>>>>> http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz;apply=no;name=GeoLiteCity-dat;downloadfilename=GeoLiteCity.dat.${GEOIP_DATABASE_VERSION}.gz 
>>>>>> \
>>>>>> + 
>>>>>> http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz;apply=no;name=GeoLiteCityv6-dat;downloadfilename=GeoLiteCityv6.dat.${GEOIP_DATABASE_VERSION}.gz 
>>>>>> \
>>>>>>               file://run-ptest \
>>>>>>    "
>>>>>>    SRCREV = "4b526e7331ca1d692b74a0509ddcc725622ed31a"
>>>>>> @@ -20,14 +22,14 @@ SRCREV = 
>>>>>> "4b526e7331ca1d692b74a0509ddcc725622ed31a"
>>>>>>    SRC_URI[GeoIP-dat.md5sum] = "d538e57ad9268fdc7955c6cf9a37c4a9"
>>>>>>    SRC_URI[GeoIP-dat.sha256sum] = 
>>>>>> "b9c05eb8bfcf90a6ddfdc6815caf40a8db2710f0ce3dd48fbd6c24d485ae0449"
>>>>>>
>>>>>> -SRC_URI[GeoIPv6-dat.md5sum] = "a908d7a51c3883eb8f693ca197c7a142"
>>>>>> -SRC_URI[GeoIPv6-dat.sha256sum] = 
>>>>>> "1b06e34eed2c539606a9ab4d97b2140ac80bf9f528d16ad2e3831c75014c2710"
>>>>>> +SRC_URI[GeoIPv6-dat.md5sum] = "52d6aa0aac1adbfa5eb7fa4742197c11"
>>>>>> +SRC_URI[GeoIPv6.sha256sum] = 
>>>>>> "416ac92fcc35a21d5efbb32e5c88e609c37aec1aa1af6247d088b8da1af6e9bf"
>>>>>>
>>>>>>    SRC_URI[GeoLiteCity-dat.md5sum] = 
>>>>>> "d700c137232f8e077ac8db8577f699d9"
>>>>>>    SRC_URI[GeoLiteCity-dat.sha256sum] = 
>>>>>> "90db2e52195e3d1bcdb2c2789209006d09de5c742812dbd9a1b36c12675ec4cd"
>>>>>>
>>>>>> -SRC_URI[GeoLiteCityv6-dat.md5sum] = 
>>>>>> "8ac3506ccabaae7e9f7d6301c2654313"
>>>>>> -SRC_URI[GeoLiteCityv6-dat.sha256sum] = 
>>>>>> "1c5fced1657d09448b3ecc14b65c9536228a627d93ed4159d3438b2c6faa8506"
>>>>>> +SRC_URI[GeoLiteCityv6-dat.md5sum] = 
>>>>>> "6734ccdc644fc0ba76eb276dce73d005"
>>>>>> +SRC_URI[GeoLiteCityv6-dat.sha256sum] = 
>>>>>> "c95a9d2643b7f53d7abeed2114388870e13fbbad4653f450a49efa7e4b86aca4"
>>>>>>
>>>>>>    LICENSE = "LGPL-2.1"
>>>>>>
>>>>>> @@ -44,10 +46,10 @@ EXTRA_OECONF = "--disable-static               \
>>>>>>    do_install() {
>>>>>>        make DESTDIR=${D} install
>>>>>>        install -d ${D}/${datadir}/GeoIP
>>>>>> -    install ${WORKDIR}/GeoIP.dat.20181120 
>>>>>> ${D}/${datadir}/GeoIP/GeoIP.dat
>>>>>> -    install ${WORKDIR}/GeoIPv6.dat.20181120 
>>>>>> ${D}/${datadir}/GeoIP/GeoIPv6.dat
>>>>>> -    install ${WORKDIR}/GeoLiteCity.dat.20181120 
>>>>>> ${D}/${datadir}/GeoIP/GeoLiteCity.dat
>>>>>> -    install ${WORKDIR}/GeoLiteCityv6.dat.20181120 
>>>>>> ${D}/${datadir}/GeoIP/GeoLiteCityv6.dat
>>>>>> +    install ${WORKDIR}/GeoIP.dat.${GEOIP_DATABASE_VERSION} 
>>>>>> ${D}/${datadir}/GeoIP/GeoIP.dat
>>>>>> +    install ${WORKDIR}/GeoIPv6.dat.${GEOIP_DATABASE_VERSION} 
>>>>>> ${D}/${datadir}/GeoIP/GeoIPv6.dat
>>>>>> +    install ${WORKDIR}/GeoLiteCity.dat.${GEOIP_DATABASE_VERSION} 
>>>>>> ${D}/${datadir}/GeoIP/GeoLiteCity.dat
>>>>>> +    install 
>>>>>> ${WORKDIR}/GeoLiteCityv6.dat.${GEOIP_DATABASE_VERSION} 
>>>>>> ${D}/${datadir}/GeoIP/GeoLiteCityv6.dat
>>>>>>        ln -s GeoLiteCity.dat ${D}${datadir}/GeoIP/GeoIPCity.dat
>>>>>>    }
>>>>>>
>>>>> -- 
>>>>> BRs
>>>>>
>>>>> Sandy(Li Changqing)
>>>>>
>>>> -- 
>>>> BRs
>>>>
>>>> Sandy(Li Changqing)
>>
-- 
Michael Halstead
Linux Foundation / SysAdmin


