Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 705376612D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Nov 2015 06:55:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAM6tnnB021925
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Nov 2015 22:55:49 -0800 (PST)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Sat, 21 Nov 2015 22:55:45 -0800
To: <openembedded-devel@lists.openembedded.org>
References: <cover.1448011904.git.liezhi.yang@windriver.com>
	<f6e6fa4fab723c1abbaac3d7db659e5913e099b3.1448011904.git.liezhi.yang@windriver.com>
	<20151120094122.GB2241@jama>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <565166F0.3000303@windriver.com>
Date: Sun, 22 Nov 2015 14:55:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20151120094122.GB2241@jama>
Subject: Re: [PATCH 1/8] netmap-modules: fix for --no-drivers
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
X-List-Received-Date: Sun, 22 Nov 2015 06:55:49 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/20/2015 05:41 PM, Martin Jansa wrote:
> On Fri, Nov 20, 2015 at 01:32:40AM -0800, Robert Yang wrote:
>> Issue: LIN8-1697
>>
>> The --no-drivers=virtio_net.c overrided --no-drivers=ixgbe, then errors:
>> git/LINUX/ixgbe_netmap_linux.h:52:2: error: #error "unsupported ixgbe driver version"
>>   #error "unsupported ixgbe driver version"
>>    ^
>
> There is better fix for this on ML already.

I had sent a V2, and this had been drop in V2.

// Robert

>
>>
>> (LOCAL REV: NOT UPSTREAM) -- Jackie will will merge into his
>> netmap-modules work and send.
>
> Next time don't include this.
>
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   .../recipes-kernel/netmap/netmap-modules_git.bb    |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
>> index 6365fee..628c870 100644
>> --- a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
>> +++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
>> @@ -15,7 +15,7 @@ EXTRA_OECONF = "--kernel-dir=${STAGING_KERNEL_BUILDDIR} \
>>                   --driver-suffix="-netmap" \
>>                   "
>>
>> -EXTRA_OECONF += "--no-drivers=ixgbe --no-drivers=virtio_net.c"
>> +EXTRA_OECONF += "--no-drivers=ixgbe,virtio_net.c"
>>
>>   LDFLAGS := "${@'${LDFLAGS}'.replace('-Wl,-O1', '')}"
>>   LDFLAGS := "${@'${LDFLAGS}'.replace('-Wl,--as-needed', '')}"
>> --
>> 1.7.9.5
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>

