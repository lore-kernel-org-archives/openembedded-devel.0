Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 950A577B6E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Aug 2017 00:40:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7L0eQTw031049
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 20 Aug 2017 17:40:26 -0700
Received: from [128.224.162.198] (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Sun, 20 Aug 2017 17:40:25 -0700
To: Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
References: <1502952015-23737-1-git-send-email-yi.zhao@windriver.com>
	<1502952015-23737-2-git-send-email-yi.zhao@windriver.com>
	<CAMKF1soqnxmDPWcr5-zOBRGo8CSO7qyYCXM3jzm66FfO4TPnhg@mail.gmail.com>
	<fef5a9c1-95e7-c49f-f5b2-a1b46bb1b860@windriver.com>
	<00070e83-1df7-8006-a47f-b9b906c6f883@windriver.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <beebadb9-bc35-14b4-68dd-a0b220f726c6@windriver.com>
Date: Mon, 21 Aug 2017 08:41:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <00070e83-1df7-8006-a47f-b9b906c6f883@windriver.com>
X-Originating-IP: [128.224.162.198]
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/2] iproute2: add bbappend for supporting tipc tool
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
X-List-Received-Date: Mon, 21 Aug 2017 00:40:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



在 2017年08月19日 02:39, Randy MacLeod 写道:
> On 2017-08-18 02:10 AM, Yi Zhao wrote:
>>
>>
>> 在 2017年08月17日 22:01, Khem Raj 写道:
>>> On Wed, Aug 16, 2017 at 11:40 PM, Yi Zhao <yi.zhao@windriver.com> 
>>> wrote:
>>>> The tipcutils 2.2 removed the tipc-config tool and recommended to use
>>>> the new configuration tool named "tipc" in iproute2 package for
>>>> configuring the tipc, which utilizes the new tipc netlink kernel API.
>>>>
>>>> We supported tipc in iproute2 with PACKAGECONFIG in oe-core commit
>>>> 944ef0de241de77429ab0e5cb1dd4a7f355cf3fd
>>>>
>>>> Add iproute2 bbappend to enable tipc for tipcutils.
>>>>
>>>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>>>> ---
>>>>   meta-oe/recipes-connectivity/iproute2/iproute2_%.bbappend | 2 ++
>>>>   1 file changed, 2 insertions(+)
>>>>   create mode 100644 
>>>> meta-oe/recipes-connectivity/iproute2/iproute2_%.bbappend
>>>>
>>>> diff --git 
>>>> a/meta-oe/recipes-connectivity/iproute2/iproute2_%.bbappend 
>>>> b/meta-oe/recipes-connectivity/iproute2/iproute2_%.bbappend
>>>> new file mode 100644
>>>> index 0000000..0869f7f
>>>> --- /dev/null
>>>> +++ b/meta-oe/recipes-connectivity/iproute2/iproute2_%.bbappend
>>>> @@ -0,0 +1,2 @@
>>>> +# For tipcutils
>>>> +PACKAGECONFIG_append = " tipc"
>>> can we do it in recipe proper itself ?
>>
>> Hi Khem,
>>
>> The tipc in iproute2 needs libmnl as dependency.  Currently libmnl is 
>> in meta-networking and there are some packages in meta-networking 
>> need it as dependency, so we can not enable tipc build in oe-core 
>> directly.
>> If we want to enable it in iproute2 recipe directly, we should move 
>> libmnl to oe-core. I don't know if it is worth to do that because few 
>> people need tipc. How do you think about it ?
>
> We should move libmnl and the iproute2 change to oe-core.
>
> By default, TIPC is enabled as a module in YP kernel:
>
> $ grep TIPC 
> tmp-glibc/work/qemuppc-oe-linux/linux-yocto/4.10.17+gitAUTOINC+e92bd55409_6648a34e00-r0/linux-qemuppc-standard-build/.config
> CONFIG_TIPC=m
> CONFIG_TIPC_MEDIA_UDP=y
>
> so it should be configurable with just the oe-core layer.
>
> Once libmnl is in oe-core, we could move nftables,
> "the successor to iptables" to oe-core say at the start of
> the 2.5 dev cycle.

Thanks, Randy.
I will do it.

Yi

>
> ../Randy
>
>>
>> Thanks,
>> Yi
>>
>>>
>>>> -- 
>>>> 2.7.4
>>>>
>>>> -- 
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>


