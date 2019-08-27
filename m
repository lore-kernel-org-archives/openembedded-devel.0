Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 243C97E28B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Aug 2019 15:58:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7RFwESg022827
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Aug 2019 08:58:14 -0700 (PDT)
Received: from [128.224.162.157] (128.224.162.157) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 27 Aug 2019 08:58:14 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <1566554709-22088-1-git-send-email-hongxu.jia@windriver.com>
	<1566554709-22088-2-git-send-email-hongxu.jia@windriver.com>
	<CAMKF1sr-AZXhaxNzsUW-85bcK=397RuMjo7LwP3n-g6Tk_7hsg@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <bd9f69c5-beeb-5e78-9338-0dae125babe0@windriver.com>
Date: Tue, 27 Aug 2019 23:58:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sr-AZXhaxNzsUW-85bcK=397RuMjo7LwP3n-g6Tk_7hsg@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/3] cryptsetup: add libdevmapper to RDEPENDS
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
X-List-Received-Date: Tue, 27 Aug 2019 15:58:14 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 8/27/19 11:30 PM, Khem Raj wrote:
> Seeing this https://errors.yoctoproject.org/Errors/Details/265647/
> seems to be related

I am working on it

//Hongxu

>
> On Fri, Aug 23, 2019 at 3:06 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> Since commit [libdevmapper/lvm2: force recipe libdevmapper to populate
>> sysroot only] applied, if recipe DEPENDS on libdevmapper, we have to
>> add it to packages RDEPENDS
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb
>> index deaede8..c983a9e 100644
>> --- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb
>> +++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb
>> @@ -15,6 +15,9 @@ DEPENDS = " \
>>       popt \
>>       util-linux \
>>   "
>> +RDEPENDS_${PN} = " \
>> +    libdevmapper \
>> +"
>>
>>   SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
>>   SRC_URI[md5sum] = "41d8b985ef69242852b93e95d53e8e28"
>> --
>> 2.7.4
>>


