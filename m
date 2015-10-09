Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 12D1E605D2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Oct 2015 07:36:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t997aABA011224
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 9 Oct 2015 00:36:10 -0700 (PDT)
Received: from [128.224.162.211] (128.224.162.211) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Fri, 9 Oct 2015 00:36:09 -0700
Message-ID: <56176E7D.1050905@windriver.com>
Date: Fri, 9 Oct 2015 15:36:29 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: akuster808 <akuster808@gmail.com>
References: <1444280569-4385-1-git-send-email-Qi.Chen@windriver.com>
	<56162A4A.5090502@gmail.com>
In-Reply-To: <56162A4A.5090502@gmail.com>
X-Originating-IP: [128.224.162.211]
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] netmap-modules: fix compilation failure
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
X-List-Received-Date: Fri, 09 Oct 2015 07:36:13 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/08/2015 04:33 PM, akuster808 wrote:
> Chen Qi,
>
>
> On 10/07/2015 10:02 PM, Chen Qi wrote:
>> If CONFIG_IXGBE is enabled in kernel. This package fails to build with
>> error messages like below.
>>
>> |  #error "unsupported ixgbe driver version"
>> |   ^
>>
>> .......
>>
>> error: request for member 'count' in something not a structure or union
>> |   na.num_rx_desc = NM_IXGBE_RX_RING(adapter, 0)->count;
>> |                                                ^
>> | cc1: some warnings being treated as errors
>>
>> Fix this problem by disabling igxbe driver in netmap-modules.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta-networking/recipes-kernel/netmap/netmap-modules_git.bb | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
>> index f9ac9cc..c1c319d 100644
>> --- a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
>> +++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
>> @@ -15,6 +15,8 @@ EXTRA_OECONF = "--kernel-dir=${STAGING_KERNEL_BUILDDIR} \
>>                   --driver-suffix="-netmap" \
>>                   "
>>   
>> +EXTRA_OECONF += "--no-drivers=ixgbe"
>> +
> Would the following also work?
>
> +PACKAGECONFIG ?= ""
> +PACKAGECONFIG[IXGBE] = "--drivers=ixgbe,--no-drivers=ixgbe"
>
> Then we replicate that for the other kernel modules.
>
> - armin

The problem is that if 'IXGBE' is enabled, the compilation fails.
I tried three values for the macro, none of them works.

Best Regards,
Chen Qi

>>   LDFLAGS := "${@'${LDFLAGS}'.replace('-Wl,-O1', '')}"
>>   LDFLAGS := "${@'${LDFLAGS}'.replace('-Wl,--as-needed', '')}"
>>   
>>
>


