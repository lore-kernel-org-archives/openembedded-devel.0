Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DCB4270178
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 May 2017 01:14:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v4T1EDfT021140
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 28 May 2017 18:14:13 -0700 (PDT)
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Sun, 28 May 2017 18:14:12 -0700
From: Randy MacLeod <randy.macleod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, Martin Jansa
	<martin.jansa@gmail.com>
References: <20170518020701.2773-1-Randy.MacLeod@windriver.com>
	<2c4c974d-6831-f5c3-bf9a-a9c801192ccb@windriver.com>
Message-ID: <545cc9b3-26f9-1a41-1f84-fb6d74a8d097@windriver.com>
Date: Sun, 28 May 2017 21:14:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <2c4c974d-6831-f5c3-bf9a-a9c801192ccb@windriver.com>
X-Originating-IP: [172.25.44.7]
Subject: Re: [meta-oe][V2 patch] rrdtool: allow configuration to disable nls
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
X-List-Received-Date: Mon, 29 May 2017 01:14:14 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2017-05-28 09:12 PM, Randy MacLeod wrote:
> 
> Martin,
> 
> You've merged v1:
>     [oe] [meta-oe][PATCH] rrdtool: add gettext-native dependency

err I mean, you've merged v1 to master-next to be clear.
../Randy

> Could you drop that for this fix since it's a somewhat better approach.
> 
> ../Randy
> 
> On 2017-05-17 10:07 PM, Randy MacLeod wrote:
>> When building rrdtool for a 'tiny' distro, that does not have native
>> language support (NLS) in glibc, configure fails with the error:
>>     autoreconf: failed to run autopoint: No such file or directory
>> Autopoint is part of gettext but without NLS support we populate the
>> sysroot with gettext-minimal-native rather then the full set of
>> gettext executables. This version does not install autopoint, nor
>> should it.
>>
>> Tell autoreconf to skip the check for the autopoint script
>> regardless of NLS support and use the USE_NLS varible
>> to conditionally enable NLS support.
>>
>> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>> ---
>>   meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb 
>> b/meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb
>> index db2df28a0..3ccefb995 100644
>> --- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb
>> +++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb
>> @@ -22,7 +22,7 @@ BBCLASSEXTEND = "native"
>>   SYSTEMD_PACKAGES = "rrdcached"
>>   SYSTEMD_SERVICE_rrdcached = "rrdcached.socket rrdcached.service"
>> -EXTRA_AUTORECONF = "-I m4"
>> +EXTRA_AUTORECONF = "-I m4 --exclude=autopoint"
>>   PACKAGECONFIG ??= "python perl ${@bb.utils.filter('DISTRO_FEATURES', 
>> 'systemd', d)}"
>> @@ -49,6 +49,7 @@ EXTRA_OECONF = " \
>>       --disable-lua \
>>       --disable-tcl \
>>       --disable-rpath \
>> +    --enable-nls=${USE_NLS} \
>>   "
>>   export STAGING_LIBDIR
>>
> 
> 


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

