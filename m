Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 15870756C5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Sep 2015 02:01:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8O21NLV027816
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2015 19:01:23 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 23 Sep 2015 19:01:23 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1442999044-30163-1-git-send-email-kai.kang@windriver.com>
	<20150923134730.GC2384@jama>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <5603597D.1050903@windriver.com>
Date: Thu, 24 Sep 2015 10:01:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <20150923134730.GC2384@jama>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] p11-kit: remove from meta-oe
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
X-List-Received-Date: Thu, 24 Sep 2015 02:01:34 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015年09月23日 21:47, Martin Jansa wrote:
> On Wed, Sep 23, 2015 at 05:04:04PM +0800, kai.kang@windriver.com wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Remove p11-kit from meta-oe that there is a newer version in oe-core.
> Duplicates:
> commit ad2932486ddf37b28fade4f4fd12c0c3fdb6df7a
> Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> Date:   Mon Sep 14 15:26:44 2015 +0300
>
>      p11-kit: remove the recipe due to its move to oe-core
>
> which was already in master-next and now is in master.

Got it. Thanks

--Kai

>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb | 18 ------------------
>>   1 file changed, 18 deletions(-)
>>   delete mode 100644 meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb
>>
>> diff --git a/meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb b/meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb
>> deleted file mode 100644
>> index e0ebe7d..0000000
>> --- a/meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb
>> +++ /dev/null
>> @@ -1,18 +0,0 @@
>> -SUMMARY = "Provides a way to load and enumerate PKCS#11 modules"
>> -LICENSE = "BSD"
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=02933887f609807fbb57aa4237d14a50"
>> -
>> -inherit autotools gettext pkgconfig
>> -
>> -DEPENDS = "libtasn1 libffi"
>> -
>> -SRC_URI = "http://p11-glue.freedesktop.org/releases/${BP}.tar.gz"
>> -SRC_URI[md5sum] = "d96046ab6ac00d005342caf416ed76ab"
>> -SRC_URI[sha256sum] = "94fbed372c11d0a404762aad966e54eb4f44c1d5b871a1b79a1a3b4cf36ed256"
>> -
>> -FILES_${PN}-dev += " \
>> -    ${libdir}/p11-kit-proxy.so \
>> -    ${libdir}/pkcs11/p11-kit-trust.so \
>> -"
>> -FILES_${PN}-dev += "${libdir}/pkcs11/*.la"
>> -FILES_${PN}-dbg += "${libdir}/pkcs11/.debug"
>> -- 
>> 2.4.1
>>
>> -- 
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>


-- 
Regards,
Neil | Kai Kang


