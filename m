Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 22D847F351
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 15:54:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7TFrZtB002020
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 29 Aug 2019 08:53:46 -0700
Received: from [128.224.162.157] (128.224.162.157) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 29 Aug 2019 08:53:25 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <1566554709-22088-2-git-send-email-hongxu.jia@windriver.com>
	<1566955456-20194-1-git-send-email-hongxu.jia@windriver.com>
	<CAMKF1spiaLD-o1BemHAXRhwJwikeTcZr82P_TmBr12DT2BKWOw@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <3b86c6c6-7bfa-d335-e878-9130c27b5d35@windriver.com>
Date: Thu, 29 Aug 2019 23:53:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spiaLD-o1BemHAXRhwJwikeTcZr82P_TmBr12DT2BKWOw@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH V2] cryptsetup: add libdevmapper to RDEPENDS
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
X-List-Received-Date: Thu, 29 Aug 2019 15:54:16 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 8/29/19 9:44 PM, Khem Raj wrote:
> https://errors.yoctoproject.org/Errors/Details/266491/

Sorry for the error again, I could not reproduce the issue on my build, 
indeed,

ignoring both of the QA test is no harm for cryptsetup.

V3 incoming, sorry again :(

//Hongxu

>
> On Tue, Aug 27, 2019 at 6:24 PM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> Since commit [libdevmapper/lvm2: force recipe libdevmapper to populate
>> sysroot only] applied, if recipe DEPENDS on libdevmapper, we have to
>> add it to packages RDEPENDS to fix [file-rdeps] QA issue
>>
>> Skip [build-deps] QA checking, add lvm2 to DEPENDS will triger
>> circular dependencies, use recipe libdevmapper to replace,
>> ignore the QA checking is fine.
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb
>> index 6ebf1e2..eb155e1 100644
>> --- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb
>> +++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb
>> @@ -16,6 +16,10 @@ DEPENDS = " \
>>       util-linux \
>>   "
>>
>> +RDEPENDS_${PN} = " \
>> +    libdevmapper \
>> +"
>> +
>>   SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
>>   SRC_URI[md5sum] = "f7818082056e5bc0be12e4c7fc20345a"
>>   SRC_URI[sha256sum] = "9d8f8cac2836a1623c075b5cba96032271dc81a28b2aa27fbd8331e831416bb1"
>> @@ -85,4 +89,6 @@ EXTRA_OECONF += "--disable-libargon2"
>>
>>   FILES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES','systemd','${exec_prefix}/lib/tmpfiles.d/cryptsetup.conf', '', d)}"
>>
>> +INSANE_SKIP_${PN} += "build-deps"
>> +
>>   BBCLASSEXTEND = "native nativesdk"
>> --
>> 2.7.4
>>


