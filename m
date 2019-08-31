Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0C2507F2DF
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 02:24:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7V2NQPk031820
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 30 Aug 2019 19:23:36 -0700
Received: from [128.224.162.157] (128.224.162.157) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 30 Aug 2019 19:23:03 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <1567217664-14728-1-git-send-email-hongxu.jia@windriver.com>
	<CAMKF1spm2M8ZdiFVDFyM2jgrEM_VS2vTsgp7HtfYjDSnxf5dUw@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <60a533bc-35e0-058c-6a92-9fe9460a4796@windriver.com>
Date: Sat, 31 Aug 2019 10:23:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spm2M8ZdiFVDFyM2jgrEM_VS2vTsgp7HtfYjDSnxf5dUw@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] layer.conf: add lvm2 as libdevmapper preferred rprovider
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
X-List-Received-Date: Sat, 31 Aug 2019 02:24:02 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 8/31/19 10:16 AM, Khem Raj wrote:
> On Fri, Aug 30, 2019 at 7:14 PM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> Since commit [libdevmapper/lvm2: force recipe libdevmapper to populate
>> sysroot only] applied, if recipe DEPENDS on libdevmapper, we have to
>> add it to packages RDEPENDS to fix [file-rdeps] QA issue
>>
>> Set PREFERRED_RPROVIDER_libdevmapper = "lvm2" in layer.conf to explicit
>> use lvm2 as libdevmapper preferred rprovider
>>
>> Remove unnecessary insane skip
>>
> thanks I have staged something similar

Sorry for so many revision, but I think we investigated a way to break

circular dependencies when have to, some kind of tricky, but works, I hope

//Hongxu


>> Suggested-by : peter.kjellerstedt@axis.com
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta-oe/conf/layer.conf                               | 2 ++
>>   meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb | 2 --
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
>> index 896a5d6..e48fabd 100644
>> --- a/meta-oe/conf/layer.conf
>> +++ b/meta-oe/conf/layer.conf
>> @@ -33,6 +33,8 @@ LAYERSERIES_COMPAT_openembedded-layer = "thud warrior"
>>
>>   LICENSE_PATH += "${LAYERDIR}/licenses"
>>
>> +PREFERRED_RPROVIDER_libdevmapper = "lvm2"
>> +
>>   SIGGEN_EXCLUDERECIPES_ABISAFE += " \
>>     mplayer-common \
>>     fbset-modes \
>> diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb
>> index 194842e..0773671 100644
>> --- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb
>> +++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb
>> @@ -89,6 +89,4 @@ EXTRA_OECONF += "--disable-libargon2"
>>
>>   FILES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES','systemd','${exec_prefix}/lib/tmpfiles.d/cryptsetup.conf', '', d)}"
>>
>> -INSANE_SKIP_${PN} += "build-deps file-rdeps"
>> -
>>   BBCLASSEXTEND = "native nativesdk"
>> --
>> 2.7.4
>>


