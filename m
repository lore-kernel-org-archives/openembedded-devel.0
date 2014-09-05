Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1CE55713F4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Sep 2014 01:58:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s851wYuO024766
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Sep 2014 18:58:34 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 4 Sep 2014 18:58:33 -0700
Message-ID: <540918C8.1060603@windriver.com>
Date: Fri, 5 Sep 2014 09:58:32 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Randy MacLeod <randy.macleod@windriver.com>,
	<openembedded-devel@lists.openembedded.org>
References: <cover.1409584344.git.liezhi.yang@windriver.com>
	<76dbc052fe60d5e4e5ba929e8e274cdf5c7572e2.1409584344.git.liezhi.yang@windriver.com>
	<5408D54D.8090007@windriver.com>
In-Reply-To: <5408D54D.8090007@windriver.com>
Subject: Re: [PATCH 11/13] sdparm: add bash to RDEPENDS_sdparm
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
X-List-Received-Date: Fri, 05 Sep 2014 01:58:41 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/05/2014 05:10 AM, Randy MacLeod wrote:
> On 14-09-01 11:18 AM, Robert Yang wrote:
>> Bash scripts:
>> packages-split/sdparm/usr/bin/sas_disk_blink:#!/bin/bash
>> packages-split/sdparm/usr/bin/scsi_ch_swp:#!/bin/bash
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta-oe/recipes-support/sdparm/sdparm_1.08.bb |    2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-oe/recipes-support/sdparm/sdparm_1.08.bb
>> b/meta-oe/recipes-support/sdparm/sdparm_1.08.bb
>> index 713e451..be46b96 100644
>> --- a/meta-oe/recipes-support/sdparm/sdparm_1.08.bb
>> +++ b/meta-oe/recipes-support/sdparm/sdparm_1.08.bb
>> @@ -15,3 +15,5 @@ SRC_URI[md5sum] = "be5786f37499018ef44f409597c92d42"
>>   SRC_URI[sha256sum] =
>> "376b78a414b1a9c47f3f13dbeb963e7a3ec7be126f83927d6856b5f7ac425e57"
>>
>>   inherit autotools
>> +
>> +RDEPENDS_${PN} += "bash"
>>
>
> We should move these scripts to a sdparm-scripts sub-pkg.

Good idea, I will do it.

// Robert

>
> sdparm is a ~150K executable so making it pull in bash
> at >1000K isn't good for embedded systems.
>
>
> Neither script appears to be essential:
>
> sas_disk_blink - blink the LED on a SAS disk
>
> scsi_ch_swp:
>       "Usage: scsi_ch_swp [-h] [-s 0|1] [-v] [-w] <blk_device>"
> ...
>       "Access the Software Write Protect (SWP) bit in the SCSI control"
>       "mode page and if changed adjust the Linux block device (e.g."
>       "/dev/sdc) settings accordingly. If supported, when the SWP bit"
>       "is set (1) the device is read-only; when clear (0) the device"
>       "is read-write (i.e. its contents can be read and changed)."
>       "When no options given it reads SWP and gets blockdev's RO flag."
>
>
> Comments or concerns?
>

