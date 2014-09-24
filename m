Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 194A871397
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Sep 2014 16:01:26 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id bj1so1668703pad.35
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Sep 2014 09:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=aVHPPyw+HnAu/MzvU+UP+oJIaBYWdQrHTjiaUhZFAi0=;
	b=Dz32NRv0tAk8bHSmHlh5nK2j7UBCcF/wgZ/axTjMM6WtMyL7KgbjAdONbIdjTrvhM5
	ynlQB3YvN2t6AAHoIAOIqm/4yPnWbA/vt3HME6u1+aYVcLUpaznmoDz58jWAuX7xIS7k
	Wa4YujT55apRLzq8URGyKuZ5+cgBuDvgGKK0BBmy7RhSgz0RsYZTERHehelOVcXMqcbo
	mPZ2yIWI2gEPA40hhAazwKWKJ1pz71fjSGyF5nFJJbxPoxthpLukq6NKtY2/kmi7Pw7Z
	9c/JjCmvjhAnJo6kxUkGC5WNzbYzlRo/3yXfzdKAQ6PYo2HAS0eJSaX6ZHDQv4ILJ/Fe
	Twlw==
X-Received: by 10.66.222.132 with SMTP id qm4mr10600433pac.140.1411574487418; 
	Wed, 24 Sep 2014 09:01:27 -0700 (PDT)
Received: from ?IPv6:2601:c:9380:601:ec77:7fc4:f575:b70e?
	([2601:c:9380:601:ec77:7fc4:f575:b70e])
	by mx.google.com with ESMTPSA id
	tc5sm15105792pbc.51.2014.09.24.09.01.25 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Sep 2014 09:01:26 -0700 (PDT)
Message-ID: <5422EAD4.4080905@gmail.com>
Date: Wed, 24 Sep 2014 09:01:24 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: "joe@deserted.net >> Joe MacDonald" <joe@deserted.net>
References: <1410911419-466-1-git-send-email-akuster808@gmail.com>
	<20140924020402.GC16953@deserted.net>
In-Reply-To: <20140924020402.GC16953@deserted.net>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] wireshark: update to 12.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Sep 2014 16:01:27 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 09/23/2014 07:04 PM, Joe MacDonald wrote:
> Merged, thanks Armin.

Thanks.

  I also included Roy's patch for the BUILD_CFLAGS
> since, looking at my own build logs when cross-building, it looks like
> it is required, but please let me know if you think it's inappropriate.

no problems here.

- Armin

>
> Thanks,
> -J.
>
> [[oe] [meta-networking][PATCH] wireshark: update to 12.1] On 14.09.16 (Tue 16:50) Armin Kuster wrote:
>
>> following security fixes included:
>> MEGACO dissector infinite loop. (Bug 10333) CVE-2014-6423
>> Netflow dissector crash. (Bug 10370) CVE-2014-6424
>> CUPS dissector crash. (Bug 10353) CVE-2014-6425
>> HIP dissector infinite loop. CVE-2014-6426
>> RTSP dissector crash. (Bug 10381) CVE-2014-6427
>> SES dissector crash. (Bug 10454) CVE-2014-6428
>> Sniffer file parser crash. (Bug 10461) CVE-2014-6429 CVE-2014-6430 CVE-2014-6431 CVE-2014-6432
>>
>> re-org'd dd file to be more in-line with style guide.
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>   .../{wireshark_1.12.0.bb => wireshark_1.12.1.bb}    | 21 ++++++++++-----------
>>   1 file changed, 10 insertions(+), 11 deletions(-)
>>   rename meta-networking/recipes-support/wireshark/{wireshark_1.12.0.bb => wireshark_1.12.1.bb} (90%)
>>
>> diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.0.bb b/meta-networking/recipes-support/wireshark/wireshark_1.12.1.bb
>> similarity index 90%
>> rename from meta-networking/recipes-support/wireshark/wireshark_1.12.0.bb
>> rename to meta-networking/recipes-support/wireshark/wireshark_1.12.1.bb
>> index 39a24dc..71cc082 100644
>> --- a/meta-networking/recipes-support/wireshark/wireshark_1.12.0.bb
>> +++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.1.bb
>> @@ -2,9 +2,19 @@ DESCRIPTION = "wireshark - a popular network protocol analyzer"
>>   HOMEPAGE = "http://www.wireshark.org"
>>   SECTION = "network"
>>   LICENSE = "GPL-2.0"
>> +LIC_FILES_CHKSUM = "file://README.linux;md5=631e077455b7972172eb149195e065b0"
>>
>>   DEPENDS = "perl-native libcap libpcap pcre expat glib-2.0 libnl sbc"
>>
>> +SRC_URI = " \
>> +    http://wiresharkdownloads.riverbed.com/wireshark/src/wireshark-${PV}.tar.bz2 \
>> +"
>> +
>> +PE = "1"
>> +
>> +SRC_URI[md5sum] = "14b3e3d8979d1eb27ff085bb5f400e67"
>> +SRC_URI[sha256sum]= "82b26bd416ec15903b27785e35a622687008a743342054e96eaaeaa249be584b"
>> +
>>   inherit autotools pkgconfig
>>
>>   ARM_INSTRUCTION_SET = "arm"
>> @@ -27,16 +37,6 @@ PACKAGECONFIG[gcrypt] = "--with-gcrypt=yes, --with-gcrypt=no, libgcrypt"
>>
>>   EXTRA_OECONF = "--with-qt=no --enable-usr-local=no --enable-tshark --with-c-ares=no"
>>
>> -LIC_FILES_CHKSUM = "file://README.linux;md5=631e077455b7972172eb149195e065b0"
>> -SRC_URI = " \
>> -    http://wiresharkdownloads.riverbed.com/wireshark/src/wireshark-1.12.0.tar.bz2 \
>> -"
>> -
>> -PE = "1"
>> -
>> -SRC_URI[md5sum] = "8dcfe451d8769901129809d2e19c1fb7"
>> -SRC_URI[sha256sum]= "0f59fea1c5b35de90af681067e49113fee0dd7a901750a97fa25f4256dbf13c7"
>> -
>>   do_configure_prepend() {
>>       # force to use fallback
>>       sed -i -e '/^glib_prefix/s/=.*$/=""/' ${S}/aclocal-flags
>> @@ -44,4 +44,3 @@ do_configure_prepend() {
>>
>>   ALLOW_EMPTY_${PN} = "1"
>>   INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>> -
>> --
>> 1.9.1
>>
>>
>>

