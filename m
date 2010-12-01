Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1PNndg-00037M-S2
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 15:26:33 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PNncL-0002Zu-V0 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 06:25:09 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 1 Dec 2010 06:25:09 -0800
Received: from [172.30.80.45] ([172.30.80.45]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 1 Dec 2010 07:25:08 -0700
Message-ID: <4CF65AB7.9070603@mentor.com>
Date: Wed, 01 Dec 2010 07:24:55 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.15) Gecko/20101027 Lightning/1.0b1 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1291211567-2520-1-git-send-email-Martin.Jansa@gmail.com>
	<AANLkTikkpAXLe9ZAvp=CPC1gVjngeGfQHqV2-sCtjwPG@mail.gmail.com>
In-Reply-To: <AANLkTikkpAXLe9ZAvp=CPC1gVjngeGfQHqV2-sCtjwPG@mail.gmail.com>
X-OriginalArrivalTime: 01 Dec 2010 14:25:08.0886 (UTC)
	FILETIME=[8E81EB60:01CB9163]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] module-init-tools: fix multiple runtime providers
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Dec 2010 14:26:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/01/2010 07:11 AM, Frans Meulenbroeks wrote:
> 2010/12/1 Martin Jansa<martin.jansa@gmail.com>:
>> * NOTE: multiple providers are available for runtime module-init-tools-depmod (module-init-tools, module-init-tools-cross)
>>   NOTE: consider defining a PREFERRED_PROVIDER entry to match module-init-tools-depmod
>> ---
>>   recipes/module-init-tools/module-init-tools.inc |   10 +++++-----
>>   1 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/recipes/module-init-tools/module-init-tools.inc b/recipes/module-init-tools/module-init-tools.inc
>> index 3cfaf11..247b39a 100644
>> --- a/recipes/module-init-tools/module-init-tools.inc
>> +++ b/recipes/module-init-tools/module-init-tools.inc
>> @@ -3,13 +3,13 @@ removing kernel modules for Linux (versions 2.5.48 and above). It serves \
>>   the same function that the modutils package serves for Linux 2.4."
>>   LICENSE = "GPLv2"
>>   SECTION = "base"
>> -PR = "r5"
>> +PR = "r6"
>>
>> -PACKAGES =+ "module-init-tools-insmod-static module-init-tools-depmod"
>> -RDEPENDS_${PN} += "module-init-tools-depmod"
>> +PACKAGES =+ "${PN}-insmod-static ${PN}-depmod"
>> +RDEPENDS_${PN} += "${PN}-depmod"
>>
>> -FILES_module-init-tools-depmod = "${sbindir}/depmod.26"
>> -FILES_module-init-tools-insmod-static = "${sbindir}/insmod.static"
>> +FILES_${PN}-depmod = "${sbindir}/depmod.26"
>> +FILES_${PN}-insmod-static = "${sbindir}/insmod.static"
>>
>>   SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/kernel/module-init-tools/module-init-tools-${PV}.tar.bz2 \
>>            file://ignore_arch_directory;apply=yes \
>> --
>
> Thanks for the patch!
> Acked-by: Frans Meulenbroeks<fransmeulenbroeks@gmail.com>
>
> still not really sure why we have module-init-tools-cross though.
> A quick search did not give me a user (but maybe the search was too quick)
> And still unsure why a cross recipe should produce a  package.
> And maybe it should be module-init-tools-native ?

It's used for running depmod on images during creation, iirc.

-- 
Tom Rini
Mentor Graphics Corporation


