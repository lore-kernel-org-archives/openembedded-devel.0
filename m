Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 334F47404E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Sep 2015 01:58:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8O1wDQs012730
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2015 18:58:13 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 23 Sep 2015 18:58:12 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1441704708-22940-1-git-send-email-kai.kang@windriver.com>
	<1441704708-22940-2-git-send-email-kai.kang@windriver.com>
	<20150923140829.GE2384@jama>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <560358BE.5080207@windriver.com>
Date: Thu, 24 Sep 2015 09:58:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <20150923140829.GE2384@jama>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 1/2] efivar: 0.7 -> 0.21
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
X-List-Received-Date: Thu, 24 Sep 2015 01:58:15 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015年09月23日 22:08, Martin Jansa wrote:
> On Tue, Sep 08, 2015 at 05:31:47PM +0800, kai.kang@windriver.com wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Upgrade efivar from 0.7 to 0.21.
>>
>> * update HOMEPAGE
> Fails to build in world http://errors.yoctoproject.org/Errors/Details/18426/

I'll check it. Thanks.

--Kai

>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta-oe/recipes-extended/efivar/efivar_git.bb | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta-oe/recipes-extended/efivar/efivar_git.bb b/meta-oe/recipes-extended/efivar/efivar_git.bb
>> index 18446a0..bf2e6d2 100644
>> --- a/meta-oe/recipes-extended/efivar/efivar_git.bb
>> +++ b/meta-oe/recipes-extended/efivar/efivar_git.bb
>> @@ -1,14 +1,14 @@
>>   SUMMARY = "Tools to manipulate UEFI variables"
>>   DESCRIPTION = "efivar provides a simple command line interface to the UEFI variable facility"
>> -HOMEPAGE = "https://github.com/vathpela/efivar"
>> +HOMEPAGE = "https://github.com/rhinstaller/efivar"
>>   
>>   LICENSE = "LGPLv2.1"
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=6626bb1e20189cfa95f2c508ba286393"
>>   
>>   DEPENDS = "popt"
>>   
>> -SRCREV = "c9e1f24a81b5374408bca5616402276e47171cf7"
>> -PV = "0.7+git${SRCPV}"
>> +SRCREV = "aab6c2a64d90b6e5a63661fb5bd6be8d878b0784"
>> +PV = "0.21+git${SRCPV}"
>>   SRC_URI = "git://github.com/vathpela/efivar.git"
>>   
>>   S = "${WORKDIR}/git"
>> -- 
>> 1.9.1
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


