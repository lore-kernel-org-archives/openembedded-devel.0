Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E10CE605B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Jul 2017 00:47:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v660lTbI025172
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Jul 2017 17:47:34 -0700 (PDT)
Received: from [128.224.162.212] (128.224.162.212) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 5 Jul 2017 17:47:28 -0700
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <20170705081133.6496-1-kai.kang@windriver.com>
	<20170705081133.6496-7-kai.kang@windriver.com>
	<666166be44094ed88b6920367e51df06@XBOX02.axis.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <f86a60f8-97f0-14d6-2eb0-c13545617771@windriver.com>
Date: Thu, 6 Jul 2017 08:50:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <666166be44094ed88b6920367e51df06@XBOX02.axis.com>
Subject: Re: [meta-oe][PATCH 06/10] opensc: add PACKAGECONFIG openssl
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
X-List-Received-Date: Thu, 06 Jul 2017 00:47:52 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2017年07月06日 00:59, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>> kai.kang@windriver.com
>> Sent: den 5 juli 2017 10:11
>> To: openembedded-devel@lists.openembedded.org
>> Subject: [oe] [meta-oe][PATCH 06/10] opensc: add PACKAGECONFIG openssl
>>
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Add PACKAGECONFIG openssl to enable or disable build with openssl for
>> opensc. Check DISTRO_FEATURE openssl-no-weak-ciphers. If it exists then
>> remove PACKAGECONFIG openssl for opensc.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta-oe/recipes-support/opensc/opensc_0.16.0.bb | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/meta-oe/recipes-support/opensc/opensc_0.16.0.bb b/meta-
>> oe/recipes-support/opensc/opensc_0.16.0.bb
>> index fd67181..fa7c81d 100644
>> --- a/meta-oe/recipes-support/opensc/opensc_0.16.0.bb
>> +++ b/meta-oe/recipes-support/opensc/opensc_0.16.0.bb
>> @@ -21,6 +21,11 @@ LIC_FILES_CHKSUM =
>> "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
>>
>>   inherit autotools pkgconfig
>>
>> +PACKAGECONFIG ??= "openssl"
>> +PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
>> +
>> +PACKAGECONFIG_remove = "${@bb.utils.contains('DISTRO_FEATURES', 'openssl-no-weak-ciphers', 'openssl', '', d)}"
> It is a bad idea to use _remove like this, because it makes it impossible to
> enable openssl again in a bbappend or via local.conf.

I do this intendedly that if distro feature 'openssl-no-weak-ciphers' 
exists, package config openssl should be removed since opensc will 
compile failed.
If this is not a good solution, just set CONFLICT_DISTRO_FEATURES as for 
other packages.

Thanks,
Kai

> It is better to do it
> like this:
>
> PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'openssl-no-weak-ciphers', '', 'openssl', d)}"
> PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
>
> You should do it similarly for poco and postgresql as well.
>
>> +
>>   EXTRA_OECONF = " \
>>       --disable-static \
>>       --enable-openct \
>> --
>> 2.10.1
> //Peter
>
>

-- 
Regards,
Neil | Kai Kang


