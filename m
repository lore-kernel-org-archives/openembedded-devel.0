Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9BC057F302
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2019 01:32:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7U1WG8j028955
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 29 Aug 2019 18:32:17 -0700 (PDT)
Received: from [128.224.162.157] (128.224.162.157) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 29 Aug 2019 18:32:16 -0700
To: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>, <raj.khem@gmail.com>
References: <1566955456-20194-1-git-send-email-hongxu.jia@windriver.com>
	<1567094248-9489-1-git-send-email-hongxu.jia@windriver.com>
	<7246b4cb-1358-8afc-eb4c-a80788bead19@xilinx.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <99b98099-6aa3-33c1-0168-6def305be825@windriver.com>
Date: Fri, 30 Aug 2019 09:32:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7246b4cb-1358-8afc-eb4c-a80788bead19@xilinx.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH V3] cryptsetup: add libdevmapper to RDEPENDS
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
X-List-Received-Date: Fri, 30 Aug 2019 01:32:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 8/30/19 5:10 AM, Alejandro Enedino Hernandez Samaniego wrote:
>
> Hey Hongxu,
>
> On 8/29/19 8:57 AM, Hongxu Jia wrote:
>> Since commit [libdevmapper/lvm2: force recipe libdevmapper to populate
>> sysroot only] applied, if recipe DEPENDS on libdevmapper, we have to
>> add it to packages RDEPENDS to fix [file-rdeps] QA issue
>>
>> Skip [build-deps] and [file-rdeps] QA checking, add lvm2 to DEPENDS will
>> triger circular dependencies, use recipe libdevmapper to replace,
>> ignore the QA checking is fine.
>>
>> Signed-off-by: Hongxu Jia<hongxu.jia@windriver.com>
>> ---
>>   meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb
>> index 6ebf1e2..194842e 100644
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
>>   SRC_URI ="${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
>>   SRC_URI[md5sum] = "f7818082056e5bc0be12e4c7fc20345a"
>>   SRC_URI[sha256sum] = "9d8f8cac2836a1623c075b5cba96032271dc81a28b2aa27fbd8331e831416bb1"
>> @@ -85,4 +89,6 @@ EXTRA_OECONF += "--disable-libargon2"
>>   
>>   FILES_${PN} +="${@bb.utils.contains('DISTRO_FEATURES','systemd','${exec_prefix}/lib/tmpfiles.d/cryptsetup.conf', 
>> '', d)}"
>>   
>> +INSANE_SKIP_${PN} += "build-deps file-rdeps"
>> +
>>   BBCLASSEXTEND = "native nativesdk"
>
>
> This is the error I'm getting at do_rootfs after the latest version of 
> this patch:
>
> do_rootfs: Could not invoke dnf. Command
> Error:
>   Problem: conflicting requests
>    - nothing provides libdevmapper needed by cryptsetup-2.2.0-r0.skylake_64
>    - nothing provides libdevmapper.so.1.02()(64bit) needed by cryptsetup-2.2.0-r0.skylake_64
>    - nothing provides libdevmapper.so.1.02(Base)(64bit) needed by cryptsetup-2.2.0-r0.skylake_64
>    - nothing provides libdevmapper.so.1.02(DM_1_02_97)(64bit) needed by cryptsetup-2.2.0-r0.skylake_64
> (try to add '--skip-broken' to skip uninstallable packages or '--nobest' to use not only best candidate packages)

Sorry for the inconvenience, I will have a look at the issue

//Hongxu

> Cheers,
>
> Alejandro
>


