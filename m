Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 867C878284
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Aug 2017 12:27:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7TCRmdH023117
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 Aug 2017 05:27:48 -0700 (PDT)
Received: from [128.224.56.93] (128.224.56.93) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 29 Aug 2017 05:27:47 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <1503976183-18757-1-git-send-email-bruce.ashfield@windriver.com>
	<CAMKF1soxc=Vcv-Niwf4KZrY378dZ-iAT-gjmrMX9POv73fnUSg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <20102b28-5471-c6f3-93d2-ab10c4de0952@windriver.com>
Date: Tue, 29 Aug 2017 08:27:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1soxc=Vcv-Niwf4KZrY378dZ-iAT-gjmrMX9POv73fnUSg@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] vboxguestdrivers: update to fix build issues with 4.12+
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
X-List-Received-Date: Tue, 29 Aug 2017 12:27:48 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/29/2017 01:07 AM, Khem Raj wrote:
> On Mon, Aug 28, 2017 at 8:09 PM, Bruce Ashfield
> <bruce.ashfield@windriver.com> wrote:
>> Bumping the version to 5.1.26 fixes the build issues with
>> the 4.12+ kernel (and headers).
>>
>> i.e.:
>>
>>   tmp/work-shared/qemux86-64/kernel-source/arch/x86/include/asm/atomic.h:
>>   In function 'atomic_try_cmpxchg':
>>   |
>>   tmp/work-shared/qemux86-64/kernel-source/arch/x86/include/asm/atomic.h:192:2:
>>   error: undefined named operand 'new'
>>   |   return try_cmpxchg(&v->counter, old, new);
>>   |   ^~~~~~
>>   |
>>   tmp/work-shared/qemux86-64/kernel-source/arch/x86/include/asm/atomic.h:192:2:
>>   error: undefined named operand 'new'
>>   |
>>   tmp/work-shared/qemux86-64/kernel-source/arch/x86/include/asm/atomic.h:192:2:
>>   error: undefined named operand 'new'
>>   |
>>   tmp/work-shared/qemux86-64/kernel-source/arch/x86/include/asm/atomic.h:192:2:
>>   error: undefined named operand 'new'
>>
> 
> fixed with
> https://patchwork.openembedded.org/patch/143347/

Hah. I see the series you sent now. Sorry for the extra noise!

Bruce

> 
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>>   .../{vboxguestdrivers_5.1.18.bb => vboxguestdrivers_5.1.26.bb}        | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>   rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_5.1.18.bb => vboxguestdrivers_5.1.26.bb} (93%)
>>
>> diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.18.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.26.bb
>> similarity index 93%
>> rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.18.bb
>> rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.26.bb
>> index 4085b9fc7339..fdefe03172d2 100644
>> --- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.18.bb
>> +++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.26.bb
>> @@ -14,8 +14,8 @@ VBOX_NAME = "VirtualBox-${PV}"
>>   SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
>>              file://Makefile.utils \
>>   "
>> -SRC_URI[md5sum] = "1a7db64cd69ba6d39574fb333e031251"
>> -SRC_URI[sha256sum] = "7ed0959bbbd02826b86b3d5dc8348931ddfab267c31f8ed36ee53c12f5522cd9"
>> +SRC_URI[md5sum] = "d3aec8190c649d7e0d92ba374779dfe3"
>> +SRC_URI[sha256sum] = "b5715035e681a11ef1475f83f9503d34a00f0276b89c572eebec363dda80c8a9"
>>
>>   S = "${WORKDIR}/vbox_module"
>>
>> --
>> 2.5.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


